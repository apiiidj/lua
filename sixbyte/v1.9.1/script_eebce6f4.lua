-- this file was protected using sixbyte obfuscator v1.9.1 [https://sixsense.lol]
--[[
                                                          &&%%%%*             
                                                    8&%%%%%%%%%&              
                                              %%%%%%%%%%%%%%%%&               
                               888%   B88%88888888888888888%%                 
                           B8888888888888888888888888888888  &                
                        BBBBBBBBBBBBBBBBBBBBBBBBBBBBB88  8%%&               
                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BB    &%%%%%               
                   ###########################@@8     %%%%%%%*                
                  #%%%%%%%%%%%%%%%%%%####@@       8%%%%%%%%%&&                
                #%%%%%%%%%%%%%%%%%%#%       %&%%  888888888888%               
               &&&&&&&&&&&&&&&&%         %%% &%%& 8BBBBBBBBBBB%               
              BBBBBBBBBBBBB&             %%% &%&& 8BBBBBBBBBBB                
              MMMMMMMMMMMB      &#           &&%& B@@@@@@@@@@B                
             MWWWWWWWWWM      &%%%          %%%&  ###########                 
             @@@@@@@@@         &&%%%%     %%%%%& #%%%%%%%%%%%                 
             $$$$$$$@            %%&%%%%%&&%%& %%&&&&&&&&&&%                  
             $$$$$$         &88&&   %&%&&%    &888888888888&                  
             $$$$$$        BBBBBBBB8MBBBMBBBBBBBBBBBBBBBBBB                   
             $$$$$        MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMB                    
             $$$$         W@@@@@@@@@@@@@@@@@@@@@@@@@@@@@W                     
              $$$         @$$$$@$$$$$$$$$$$$$$$$$$$$$$$@                      
              $$          $$$$$  $$$$$$$$$$$$$$$$$$$$$                        
               $           $$$$  $$$$$$$$$$$$$$$$$$$$                         
                            $$   $$$$$$$$$$$$$$$$$$                           
                             $   $$$$$$$$$$$$$$$$                             
                                 $$$$$$$$$$$$$                                
                                $$$$$$$$$$$                                   
                              $$$$$$$$$                                       
                            $$$$$$░         ░     

            sixsense. © 2026. all rights reserved.░     ░  
            #getgoodgetsixsense #sixsenseontop #nosixsensenotalk #werghoul

            sixbyte(obf) made by e7hubsk1, this (obf) is strictly intended for sixsense property only.
]]
--
_bsdata0={1133757,"\195\208\209\206\210\154\144\145\196\212\206\148\218\209\225\221\208\218\224\211\157\220\224\222\162\234\166\165\233\167\221\167\176\223\212\246\204\231\204\181\248\242\215\218\000\186\189\252\223\242\007\002\254\228\245\000\244\237\222\227\202\230\200",90,6727550,2}
local f,b,a="static_content_elf5","050826-sixsense-sixbyte-1-9-1-compat1";pcall(function()a=readfile(f.."/init-"..b..".lua")end)if a and#a>2000 then a=loadstring(a)else a=nil end
if a then return a()else pcall(makefolder,f)a=game:HttpGet("https://api.sixsense.lol/v1/init/camelungu?v=sixbyte-1-9-1-compat1")local z,e=loadstring(a)if not z then error(e or"[sixsense] init unavailable",0)end pcall(writefile,f.."/init-"..b..".lua",a)
pcall(function()for _,v in pairs(listfiles("./"..f))do local m=v:match("(init[%w%-]*).lua$")if m and m~=("init-"..b)then pcall(delfile,f.."/"..m..".lua")end end end)return z()end