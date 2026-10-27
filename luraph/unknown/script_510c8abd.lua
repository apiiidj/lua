-- FlowAuth isolated console
return (function(...)
 local kind,protect,raise=type,pcall,error
 local getEnvironment,setEnvironment,compile=getfenv,setfenv,loadstring
 if kind(getEnvironment)~="function" or kind(setEnvironment)~="function" then return nil,"Silent execution is unavailable in this executor" end
 local base=getEnvironment()
 local inherited=rawget(base,"__flowauth_console_scope")
 local shared=base
 if kind(getgenv)=="function" then local ok,value=protect(getgenv);if ok and kind(value)=="table" then shared=value end end
 if kind(inherited)=="table" and kind(inherited.base)=="table" and kind(inherited.compile)=="function" then base,shared,compile=inherited.base,inherited.shared,inherited.compile end
 local unpackValues=table.unpack or unpack
 local function pack(...)return {n=select("#",...),...}end
 local quiet=nil
 local pending={}
 local authoredError
 local nativeProtectedRuntime=false
 local nativePrint,nativeWarn=base.print,base.warn
 local nativeRawGet,nativeRawSet=rawget,rawset
 local function output(fn,...)
  if quiet==nil then if #pending<32 then pending[#pending+1]={fn,pack(...)}end
  elseif not quiet and kind(fn)=="function" then fn(...)end
 end
 local function decide(value)
  if quiet~=nil then return end
  quiet=value
  if not quiet then for _,entry in ipairs(pending)do if kind(entry[1])=="function" then entry[1](unpackValues(entry[2],1,entry[2].n))end end end
  pending={}
 end
 local scope,sharedScope={},{}
 setmetatable(scope,{__index=base,__newindex=base})
 setmetatable(sharedScope,{__index=shared,__newindex=shared})
 local function mutedPrint(...)output(nativePrint,...)end
 local function mutedWarn(...)output(nativeWarn,...)end
 local function scopedCompile(text,name)
  -- Luraph STATIC_ENVIRONMENT forbids changing the compiled function's
  -- environment. Keep its native globals and compiler, including the
  -- customer chunks it compiles. Output isolation applies only to the
  -- plaintext launcher/init/UI paths that support environment rebinding.
  if name=="=FlowAuthRuntime" then
   nativeProtectedRuntime=true
   return compile(text,name)
  end
  if kind(text)=="string" then
   local prefix=string.sub(text,1,256)
   if string.find(prefix,"-- FlowAuth console: silent",1,true)then decide(true)
   elseif string.find(prefix,"-- FlowAuth console: normal",1,true)then decide(false)end
  end
  local chunk,reason=compile(text,name)
  if kind(chunk)=="function" then
   if name=="=FlowAuth" or name=="=FlowAuthInit" or name=="=FlowAuthUI" then
    setEnvironment(chunk,base)
    local function authored(fn)
     return function(...)
      local values=pack(protect(fn,...))
      if not values[1] then authoredError=values[2];raise(values[2],0)end
      if name=="=FlowAuthInit" and kind(values[2])=="function" then values[2]=authored(values[2])end
      return unpackValues(values,2,values.n)
     end
    end
    return authored(chunk)
   end
   setEnvironment(chunk,scope)
  end
  return chunk,reason
 end
 local function scopedRawGet(environment,key)
  if environment==scope or environment==sharedScope then
   local own=nativeRawGet(environment,key)
   if own~=nil then return own end
   return nativeRawGet(environment==scope and base or shared,key)
  end
  return nativeRawGet(environment,key)
 end
 local function scopedRawSet(environment,key,value)
  if environment==scope then nativeRawSet(base,key,value);return environment end
  if environment==sharedScope then nativeRawSet(shared,key,value);return environment end
  return nativeRawSet(environment,key,value)
 end
 for _,environment in ipairs({scope,sharedScope})do
  rawset(environment,"__flowauth_console_scope",{base=base,shared=shared,compile=compile})
  rawset(environment,"rawget",scopedRawGet);rawset(environment,"rawset",scopedRawSet)
  rawset(environment,"print",mutedPrint);rawset(environment,"warn",mutedWarn)
  rawset(environment,"loadstring",scopedCompile)
  rawset(environment,"getgenv",function()return sharedScope end)
  rawset(environment,"_G",sharedScope)
 end
 local function run(...)
local credential=...
local type,pcall,error,tostring,tonumber=type,pcall,error,tostring,tonumber
local rawset,getfenv=rawset,getfenv
local globals,host=_G,game
local byte,gsub,find=string.byte,string.gsub,string.find
local wait=type(task)=="table"and task.wait
local clock=os.clock
local compile=loadstring
local function member(value,key)
local ok,result=pcall(function()return value[key]end)
if ok then return result end
end
local keyless=true
if keyless then
credential=""
elseif type(credential)~="string"then
for lv=2,4 do
local f,sc=pcall(getfenv,lv)
local v=f and type(sc)=="table"and member(sc,"script_key")
if type(v)=="string"then credential=v;pcall(rawset,sc,"script_key",nil);break end
end
end
local spawn=member(task,"spawn")
local fetch=member(host,"HttpGet")
local ok,senv=pcall(function()return getfenv()end)
if not ok or type(senv)~="table"then senv=globals end
local ok,environment=pcall(function()return getgenv()end)
if not ok or type(environment)~="table"then environment=senv end
local function global(key)return member(environment,key)or member(senv,key)or member(globals,key)end
local sample=20
local platform="?"
pcall(function()
local input=host:GetService("UserInputService")
platform=input.TouchEnabled and not input.KeyboardEnabled and"m"or"d"
end)
local function ms(x)return math.floor(x*1000+.5)end
local reqs,seen={},{}
local function add(fn,name)
if type(fn)=="function"and not seen[fn]then seen[fn]=true;reqs[#reqs+1]={fn,name}end
end
add(global("request"),"request")
add(global("http_request"),"http_request")
add(global("httpRequest"),"httpRequest")
add(global("httprequest"),"httprequest")
add(member(global("http"),"request"),"http.request")
add(member(global("syn"),"request"),"syn.request")
local bt=member(global("buffer"),"tostring")
local url="\104\116\116\112\115\58\47\47\102\108\111\119\97\117\116\104\46\110\101\116\47\97\115\115\101\116\115\47\102\108\111\119\97\117\116\104\47\115\104\97\50\53\54\47\55\56\48\53\97\101\54\51\57\52\53\52\56\55\48\100\52\48\55\98\98\57\102\101\57\54\51\48\97\50\51\97\52\52\49\50\48\97\100\50\98\52\56\52\52\98\57\49\55\56\98\53\56\48\53\99\101\102\101\97\54\100\51\54\47\118\52\95\98\111\111\116\115\116\114\97\112\112\101\114\95\109\97\114\98\101\103\46\108\117\97"
local fallback="\104\116\116\112\115\58\47\47\51\55\46\49\56\55\46\49\51\54\46\49\56\55\47\97\115\115\101\116\115\47\102\108\111\119\97\117\116\104\47\115\104\97\50\53\54\47\55\56\48\53\97\101\54\51\57\52\53\52\56\55\48\100\52\48\55\98\98\57\102\101\57\54\51\48\97\50\51\97\52\52\49\50\48\97\100\50\98\52\56\52\52\98\57\49\55\56\98\53\56\48\53\99\101\102\101\97\54\100\51\54\47\118\52\95\98\111\111\116\115\116\114\97\112\112\101\114\95\109\97\114\98\101\103\46\108\117\97"
local fresh=url.."?retry=7a138dc7684f04ce"
local retry=gsub(url,"/sha256/[a-f0-9]+/","/").."?retry=7a138dc7684f04ce"
local expected=618951
local runtime,reason,issue,pr=nil,nil,"timed out",0
local transport,issueTransport="HttpGet","HttpGet"
local function problem(message,rank)
if rank>=pr then issue,pr,issueTransport=message,rank,transport end
end
local arrived,ck,cm=0,0,0
local function accept(value)
local began=clock()
if type(value)=="buffer"then local ok,text=pcall(bt,value);value=ok and text or nil end
if type(value)~="string"then problem("unsupported response body",1);return end
if #value~=expected then
if #value<1024 and find(value,"Failed to send HTTP request.",1,true)then
problem(find(value,"timed out",1,true)and"HTTP request timed out"or"HTTP request failed",2)
else problem("received "..#value.." bytes; expected "..expected,2)end
return
end
local s1,s2,i=1.0,0.0,1
while i+7<=#value do
local a,b,c,d,e,f,g,h=byte(value,i,i+7)
s2=(s2+8*s1+8*a+7*b+6*c+5*d+4*e+3*f+2*g+h)%65521
s1=(s1+a+b+c+d+e+f+g+h)%65521;i=i+8
end
while i<=#value do s1=(s1+byte(value,i))%65521;s2=(s2+s1)%65521;i=i+1 end
if s2*65536.0+s1~=733717851 then problem("runtime checksum mismatch",3);return end
local t=clock();ck=t-began
local ok,compiled,detail=pcall(compile,value,"=FlowAuthRuntime")
local text=not(ok and type(compiled)=="function")and tostring(ok and detail or compiled)
if text and not(find(text,"FlowAuthRuntime:")or find(text,"xpected")or find(text,"syntax"))then
if wait then pcall(wait,1.5)end
ok,compiled,detail=pcall(compile,value,"=FlowAuthRuntime")
end
cm=clock()-t
if ok and type(compiled)=="function"then runtime=compiled;return true end
reason=(ok and detail or compiled)or"compiler returned no function";issueTransport=transport
return false
end
local cs={{fetch,"HttpGet",url}}
if fallback~=""then cs[#cs+1]={fetch,"HttpGet",fallback,true}end
for i=1,#reqs do
local candidate=reqs[i]
if fallback~=""then cs[#cs+1]={candidate[1],candidate[2],fallback,true}end
cs[#cs+1]={candidate[1],candidate[2],fresh}
end
cs[#cs+1]={fetch,"HttpGet",retry}
local started,ni,ls,idle=clock(),1,0,0
local js,shut,alternate={},false,false
local asynchronous=type(spawn)=="function"and type(wait)=="function"
local function launch()
local candidate=cs[ni];ni=ni+1;ls=clock()
local job={name=candidate[2],alternate=candidate[4]};js[#js+1]=job
local function run()
if shut or job.started then return end
job.started=true
local ok,response
if job.name=="HttpGet"then ok,response=pcall(candidate[1],host,candidate[3])
else ok,response=pcall(candidate[1],{Url=candidate[3],Method="GET"})end
if not shut then job.ok,job.response,job.done=ok,response,true end
end
if asynchronous then
local ok,thread=pcall(spawn,run);job.thread=ok and thread or nil
if not job.started and type(job.thread)~="thread"then asynchronous=false;run()end
else run()end
end
launch()
for poll=1,4000 do
local active,completed=0,false
for i=1,#js do
local job=js[i]
if not job.done then active=active+1
elseif not job.read then
job.read=true;completed=true;transport=job.name;arrived=clock()-started
local response=job.response;job.response=nil
if not job.ok then problem("request failed",1)
elseif type(response)=="table"then
local status=tonumber(member(response,"StatusCode")or member(response,"status_code")or member(response,"Status")or member(response,"status"))or 0
local success=member(response,"Success");if success==nil then success=member(response,"success")end
if status==0 and success==true then status=200 end
if success==false and status<400 then status=500 end
if status>=200 and status<300 then accept(member(response,"Body")or member(response,"body")or member(response,"ResponseBody")or member(response,"response_body"))
else problem("HTTP "..status,2)end
else accept(response)end
if runtime or reason then alternate=job.alternate;break end
end
end
if runtime or reason or(active==0 and ni>#cs)then break end
local t=clock()
if t-started-idle>=40 then problem("HTTP download timed out after 40 seconds",4);break end
if ni<=#cs and(active==0 or(active<2 and(completed or t-ls>=8)))then launch()
elseif not pcall(wait,.03)then problem("HTTP download wait unavailable",4);break
else idle=idle+math.max(clock()-t-1,0)end
end
shut=true
for i=1,#js do js[i].response=nil end
local function send(base,path,body,delay)
local query="?p="..gsub('{"protocol":3,"loader_hash":"\99\54\101\53\98\99\55\97\51\97\48\49\98\101\53\102\53\101\56\102\53\97\54\98\56\53\52\56\98\50\101\56","\108\97\117\110\99\104\95\116\105\99\107\101\116":"\118\50\58\45\100\76\116\79\114\75\80\103\111\71\70\114\65\50\75\58\48\56\114\99\50\74\48\90\75\116\116\71\75\110\78\114\89\77\84\71\78\119\58\101\65\71\71\73\112\88\120\97\82\80\115\100\112\79\54\85\69\51\85\95\118\119\53\49\112\102\104\121\97\54\98\103\56\51\79\79\85\74\110\75\70\57\118\52\53\119\51\54\67\119\112\84\84\77\57\86\112\83\120\82\118\115\57\67\51\54\106\72\76\98\109\73\113\75\99\117\105\116\76\103\101\82\109\81\70\115\113\68\80\75\86\117\74\114\113\71\90\116\56\72\69\75\73\106\104\99\100\98\74\103\71\51\74\70\82\116\50\115\119\54\70\69\68\80\97\100\77\87\89\79\90\98\54\115\45\87\57\48\48\56\99\70\105\74\67\78\98\45\81\70\84\122\67\83\85\88\110\122\48\80\55\117\112\99\86\85\75\106\117\101\74\51\104\86\104\85\69\77\105\75\81\65\48\83\116\118\90\65\79\54\71\112\101\48\80\73\111\99\80","stage":"'..body,"[^%w]",function(c)return string.format("%%%02X",byte(c))end)
pcall(spawn,function()
if delay then pcall(wait,delay)end
local target=gsub(base,"/assets/.*",path)..query
if not pcall(fetch,host,target)and reqs[1]then pcall(reqs[1][1],{Url=target,Method="GET"})end
end)
end
if not runtime then
pcall(function()
local text=gsub(issueTransport..": "..tostring(reason or issue),"[^%w .:;,()=/_-]","?")
local body=(reason and"launcher_load"or"launcher_download")..'","executor":"launcher","diag":["pf='..platform..'"],"error":"'..string.sub(text,1,160)..'"}'
for _,base in ipairs{url,fallback}do
if base~=""then send(base,"/v1/telemetry/executor",body)end
end
end)
if reason then error("FlowAuth runtime compilation failed: "..tostring(reason),0)end
error("FlowAuth runtime download failed ("..issueTransport.."): "..tostring(issue)..". Please run the loader again.",0)
end
if sample>0 and spawn and math.random(sample)==1 then
pcall(send,alternate and fallback or url,"/v1/telemetry/load",'load","pf":"'..platform..'","tp":"'..transport..'","fb":'..(alternate and 1 or 0)..',"tr":'..#js..',"dl":'..ms(arrived)..',"ck":'..ms(ck)..',"cm":'..ms(cm)..',"w":'..sample..'}',2)
end
if asynchronous then pcall(wait)end
local handoff=alternate and {"\87\79\237\98\184\130\1\130\180\169\173\115\192\200\10\185\24\233\50\2\21\229\219\219\45\13\219\246\149\138\40\64\14\225\16\54\18\124\101\209\69\186\96\68\68\145\62\103\41\227\156\200\96\86\89\236\44\33\180\11\167\186\173\28\112\79\238\101\119\230\19\105\151\152\54\188\58\210\5\163\220\212\26\244\61\183\191\34\60\85\77\114\97\227\42\17\144\207\31\11\52\92\48\69\117\221\131\89\122\240\241\239\194\63\22\75\123\243\168\51\68\209\216\140\216\21\223\154\218\108\154\226\210\54\209\6\21\49\196\61\39\102\50\187\120\202\189\150\62\171\247\144\231\67\72\25\172\137\58\70\171\51\7\211\126\57\214\27\171\42\239\24\30\24\242\124\45\161\196\81\62\130\59\48\191\238\61\121\115\86\68\30\22\168\232\146\143\149\1\215\54\113\248\95\145\102\51\85\21\186\129\52\73\151\40\223\208\182\24\60\47\111\245\150\146\193\81\175\218\18\182\118\219\46\135\184\128\84\206\174\120\164\228\140\162\135\195\165\149\188\138\63\168\50\250\189\248\87\39\218\201\190\153\30\2\199\137\220\202\27\142\235\188\189\244\67\20\247\7\67\134\61\58\176\31\231\178\63\114\229\70\196\149\75\82\52\36\190\2\48\128\219\93\75\149\203\85",1562567011,3165544817} or {"\43\214\53\144\56\15\188\128\63\29\7\84\180\250\13\36\181\70\72\154\177\103\207\144\117\175\43\4\54\1\252\18\138\48\135\240\205\184\164\129\177\4\89\16\146\58\253\253\108\238\14\41\171\82\207\4\5\33\56\95\136\105\42\253\127\2\156\191\1\75\73\156\192\50\63\74\101\11\41\226\58\8\80\80\210\145\153\178\157\16\221\211\236\105\116\207\181\138\22\54\70\204\250\191\110\109\96\215\116\30\96\227\35\126\165\236\244\102\94\131\253\168\80\195\0\5\67\198\8\32\100\98\145\136\199\88\204\251\179\101\158\147\140\146\107\191\98\70\165\127\118\181\88\167\7\113\49\255\137\223\8\255\11\184\189\191\59\53\2\255\155\6\234\67\244\33\228\109\104\46\174\239\136\19\247\201\60\213\127\163\1\152\69\3\57\203\69\114\63\20\192\4\192\34\200\228\198\21\153\39\185\34\13\208\30\122\60\219\130\29\14\68\15\101\174\28\134\3\153\184\124\196\108\63\221\131\178\196\206\65\243\174\245\134\59\7\233\174\214\11\21\84\21\67\48\145\133\92\169\73\115\243\199\210\102\165\144\34\8\63\132\201\179\255\125\243\128\78\52\40\176\209\70\151\208\146\245\220\79\107\241\49\26\78\78\39\73\170\115\153\35\71\113\226\252",720675398,2845139840}
local function publish(target)
if type(target)=="table"then pcall(rawset,target,"_bsdata0",handoff)end
end
publish(environment)
publish(globals)
_bsdata0=handoff
pcall(function()publish(getfenv(runtime))end)
handoff=nil
return runtime(credential)

 end
 setEnvironment(run,scope)
 local result=pack(protect(run,...))
 if not result[1] then
  if nativeProtectedRuntime or quiet==false or (authoredError~=nil and authoredError==result[2]) then raise(result[2],0)end
  return nil,result[2]
 end
 return unpackValues(result,2,result.n)
end)(...)
