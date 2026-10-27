-- This script was generated using the MoonVeil Obfuscator v1.3.1 [https://moonveil.cc]

local qe,Z,Wf=pairs,type,getmetatable;
local Ga,Ba,ub,hh,C,gb
Ba,hh={[-31883]=-18902,[18950]=-10495,[6533]=12275,[-22892]=-16850,[-12844]=12275,[1746]=12275,[17357]=345,[-5873]=5723,[-27694]=5723,[27924]=19605,[-17346]=345},function(_)
    return Ba[_+-8363]
end
Ga=hh(10109)
repeat
    while true do
        if Ga==5723 then
            gb=(function(...)
                return{[1]={...},[2]=C('#',...)}
            end);
            Ga=hh(25720);
        elseif Ga==12275 then
            C=(select);
            Ga=hh(-19331);
        elseif Ga==345 then
            ub=((function()
                local function Ke(Mf,qc,Dd)
                    if qc>Dd then
                        return
                    end
                    return Mf[qc],Ke(Mf,qc+1,Dd)
                end
                return Ke
            end)());
            Ga=hh(-23520);
            break;
        end
    end
until Ga==-18902
local Cf=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local kh=game:GetService('Players')
local Yd=game:GetService('RunService')
local Of=game:GetService('ReplicatedStorage')
local wg=game:GetService('UserInputService')
local ta=game:GetService('VirtualInputManager')
local Uf=kh.LocalPlayer
local Jb=workspace.CurrentCamera
local Ig=Cf:CreateWindow({Name='Phoenix | Dig',LoadingTitle='Dig',LoadingSubtitle='by Relyz',ConfigurationSaving={Enabled=false},Discord={Enabled=false},KeySystem=true,KeySettings={Title='Phoenix Keystem',Subtitle='Key System',Note='https://discord.gg/Q2BUuxdT2S',FileName='Key',SaveKey=true,GrabKeyFromSite=false,Key={'KeyForPhoenix8172'}}})
local ma=false
local x=false
local mb=10
local Fd=false
local ld=false
local Hd=nil
local _h=false
local Ub=false
local Za=false
local td=50
local Vb=workspace.Gravity
local w=Jb.FieldOfView
local function hf(f,...)
    local fa={...}
    local Od,Ca,Yf,He,fd,Sc,i,cb,Bf,rc
    Yf,fd={[-16983]=-17991,[-5737]=20487,[-23493]=-20519,[1042]=11187,[13968]=-21161,[-8567]=7323,[-21864]=-3643,[7608]=-20519,[-1231]=10228,[21616]=15589,[-5181]=-21161,[-31892]=14173,[-29214]=-31522,[-17803]=-20519,[5813]=10817,[-29537]=11187},function(Ng)
        return Yf[Ng-29295]
    end
    Od=fd(12312)
    repeat
        while true do
            if Od==11187 then
                Bf,rc=ub(He[1],1,He[2]);
                if not Bf then
                    Od=fd(24114)
                    break
                end
                Od=-20519
            elseif Od==10817 then
                Ca=3
                Od=fd(81)
            elseif Od==-17991 then
                He=gb(pcall(function()
                    local Vf,kd,mc,qf,qf,hc,Rg,v,Ze,pg,Sf,rg,Vf,Bg,a,se,Kf,xb,uc,Ec,Nc,yf,Jg,ca,hc,rg,Cc
                    xb,Ze={[25763]=-6753,[-28321]=4146,[22053]=-20739,[16477]=-22068,[21376]=-23331,[-20458]=-23674,[450]=-1684,[5723]=24248,[-1683]=-19585,[10029]=9096,[-30304]=12900,[13265]=-6753,[-25258]=-23674,[-30029]=-23674,[-19130]=4146,[25362]=-2014,[5767]=-23674,[-32570]=4170,[14132]=12900,[14768]=-25425,[-6069]=-7033,[17420]=-8524,[-23281]=-7597,[29854]=-11964,[-21826]=17981,[-26630]=-23674,[5515]=-3739,[-27259]=22665,[-6259]=-18823,[8257]=-25661,[7821]=-7756,[-5217]=-12342,[-20892]=-2014,[-17965]=24769,[28042]=-23674,[5223]=-23674,[-1005]=23607,[29903]=-11964,[-23349]=4146,[-13903]=4146,[22865]=-9478,[-1646]=-18004,[19685]=-2133,[25824]=13993,[-14624]=17852,[22164]=19411,[-9952]=9329,[-16974]=-23674,[15670]=-23674,[-28641]=-21540,[-9297]=-23768,[3031]=-8524,[-1153]=-22120,[11351]=-1718,[-22537]=27570,[-14670]=-25425,[10566]=25686,[11978]=-21540,[19724]=-23674,[-15613]=-25425,[-11578]=-19909,[-24177]=9977,[24054]=19411,[-29558]=-5212,[-16687]=17981,[23328]=4146,[-27751]=-4,[-20244]=-25425,[-25695]=-28057,[9116]=19405,[-26987]=-18136,[-10326]=-7236,[32267]=24992,[23364]=-18136,[29977]=13993,[-24859]=-11964,[8548]=-18033,[28569]=-17432,[-26941]=24748,[15759]=26468,[19288]=-20796,[14136]=4146,[-1043]=22665,[29339]=-28057,[-837]=-5158,[25189]=-23674,[3659]=-12997,[-11150]=4146,[-3640]=-12997,[18143]=19667,[-27222]=11634,[17016]=-2133,[8423]=-8539,[-19855]=-31803,[19050]=-20739,[710]=-11726,[23374]=10204,[-1612]=-25425,[-12259]=-25334,[-22460]=-9354,[-23202]=-25425,[29294]=4146,[-24221]=-19585,[9885]=28628,[-6172]=-23674,[15373]=4146,[-31796]=-30643,[5677]=-7719,[-10312]=-8550,[24723]=-31803,[20311]=19405,[542]=-25860,[6387]=4121,[23121]=25134,[26341]=-7597,[-15072]=-25334,[-31115]=-13352,[28049]=-25425,[-1744]=-14687,[5186]=4146,[23063]=25941,[-29881]=19345,[21882]=-22729,[-13563]=-19848,[12491]=-7597,[-19833]=-14687,[15335]=-8550,[18307]=4146,[25544]=24992,[3561]=-18136,[19399]=-23674,[3758]=-12342,[9353]=17699,[-17864]=31948,[-16221]=-5910,[-29275]=-8902,[-9013]=-23674,[15826]=-25425},function(Tc)
                        return xb[Tc-9038]
                    end
                    ca=Ze(18391)
                    repeat
                        while true do
                            if ca==21134 then
                                Nc=gb(qf())
                                ca=Ze(9488)
                            elseif ca==4146 then
                                ca=Ze(-5586);
                                break;
                            elseif ca==19411 then
                                Kf,Sf,Rg=ub(Cc[1],1,Cc[2]);
                                ca=Ze(-14164)
                            elseif ca==-16719 then
                                Bg=(se)
                                ca=-24484
                            elseif ca==-6753 then
                                v=Cc;
                                ca=5429;
                            elseif ca==-2133 then
                                Kf,Sf,Rg=ub(Cc[1],1,Cc[2]);
                                ca=Ze(24864)
                            elseif ca==28628 then
                                Cc={}
                                ca=Ze(22303)
                            elseif ca==-25425 then
                                rg,qf=Kf(Sf,Rg);
                                Rg=rg;
                                if Rg==nil then
                                    ca=Ze(5398)
                                else
                                    ca=Ze(-10795)
                                end
                            elseif ca==4170 then
                                Cc=Cc(uc,se)
                                ca=Ze(37087)
                            elseif ca==1347 then
                                Cc=gb(Cc(Kf))
                                ca=Ze(26054)
                            elseif ca==25686 then
                                Bg=se(Cc,ub(Bg[1],1,Bg[2]))
                                ca=Ze(-14311)
                            elseif ca==9096 then
                                se=ub(se[1],1,se[2])==Bg
                                ca=-16719
                            elseif ca==22665 then
                                Jg,yf,Ec=ub(Cc[1],1,Cc[2]);
                                if Z(Jg)~='function'then
                                    ca=Ze(-3221)
                                    break
                                end;
                                ca=Ze(2866);
                            elseif ca==-27774 then
                                se=gb(type(qf))
                                ca=Ze(25515)
                            elseif ca==-24484 then
                                if not Bg then
                                    ca=Ze(7392)
                                    break
                                end
                                ca=21134
                            elseif ca==-31803 then
                                Cc=mc.__iter
                                ca=1347
                            elseif ca==-8550 then
                                mc=ub(Cc[1],1,Cc[2]);
                                if mc~=nil and mc.__iter~=nil then
                                    ca=Ze(-10817)
                                    break
                                elseif Z(Kf)=='table'then
                                    ca=Ze(-18184)
                                    break
                                end
                                ca=Ze(-5632)
                            elseif ca==-22068 then
                                Bg='function'
                                ca=Ze(19067)
                            elseif ca==25941 then
                                Cc=gb(ipairs(fa))
                                ca=Ze(-16657)
                            elseif ca==15900 then
                                if Bg then
                                    ca=Ze(39015)
                                    break
                                end
                                ca=Ze(30414)
                            elseif ca==24992 then
                                Jg,yf,Ec=ub(Cc[1],1,Cc[2]);
                                ca=Ze(24708)
                            elseif ca==-8524 then
                                Jg,yf,Ec=ub(Cc[1],1,Cc[2]);
                                ca=Ze(14261)
                            elseif ca==-8902 then
                                Bg=pg
                                ca=-18004
                            elseif ca==17699 then
                                if f then
                                    ca=Ze(2969)
                                    break
                                else
                                    ca=Ze(18923)
                                    break
                                end
                                ca=Ze(23174)
                            elseif ca==-1684 then
                                pg=ub(Nc[1],1,Nc[2])
                                ca=Ze(-20237)
                            elseif ca==11634 then
                                Cc=gb(qe(Kf))
                                ca=Ze(31202)
                            elseif ca==-29887 then
                                Cc=error(Cc)
                                ca=Ze(38332)
                            elseif ca==12900 then
                                uc=Cc;
                                ca=Ze(32101);
                            elseif ca==-5212 then
                                Bg=se
                                ca=15900
                            elseif ca==-18004 then
                                se=Bg
                                ca=Ze(-20520)
                            elseif ca==9895 then
                                se=Cc.FireServer
                                ca=Ze(32159)
                            elseif ca==-19848 then
                                Cc=gb(qe(Jg))
                                ca=Ze(41305)
                            elseif ca==-23331 then
                                Nc=qf
                                ca=-20851
                            elseif ca==13993 then
                                se=Bg
                                ca=Ze(-23532)
                            elseif ca==-7756 then
                                se=gb(Vf())
                                ca=Ze(-20843)
                            elseif ca==-2014 then
                                a=ub(Cc[1],1,Cc[2]);
                                if a then
                                    ca=Ze(-18713)
                                    break
                                else
                                    ca=Ze(-19603)
                                    break
                                end
                                ca=Ze(27345)
                            elseif ca==-4 then
                                Cc={}
                                ca=Ze(-21266)
                            elseif ca==5429 then
                                Cc=gb(ipairs(fa))
                                ca=Ze(-18221)
                            elseif ca==-21540 then
                                Cc='Event not found'
                                ca=-29887
                            elseif ca==25134 then
                                Bg=gb(unpack(uc))
                                ca=Ze(19604)
                            elseif ca==-28057 then
                                Kf,Sf,Rg=ub(Cc[1],1,Cc[2]);
                                if Z(Kf)~='function'then
                                    ca=Ze(8033)
                                    break
                                end;
                                ca=Ze(23806);
                            elseif ca==-7033 then
                                Cc=gb(f())
                                ca=Ze(34400)
                            elseif ca==-25334 then
                                Cc=gb(Wf(Jg))
                                ca=Ze(-12788)
                            elseif ca==-14687 then
                                Cc=table.insert
                                ca=-27774
                            elseif ca==24248 then
                                Cc=table.insert
                                ca=Ze(16859)
                            elseif ca==19345 then
                                Cc=Cc(v,ub(se[1],1,se[2]))
                                ca=Ze(-7936)
                            elseif ca==23607 then
                                Cc=gb(Wf(Kf))
                                ca=Ze(24373)
                            elseif ca==-23674 then
                                hc,Vf=Jg(yf,Ec);
                                Ec=hc;
                                if Ec==nil then
                                    ca=Ze(-10092)
                                else
                                    ca=Ze(9580)
                                end
                            elseif ca==-20851 then
                                Bg=Nc
                                ca=Ze(34862)
                            elseif ca==-12997 then
                                Cc=a
                                ca=9895
                            elseif ca==-1718 then
                                Cc=table.insert
                                ca=Ze(-7183)
                            elseif ca==24748 then
                                Cc=gb(Cc(Jg))
                                ca=Ze(26458)
                            elseif ca==17981 then
                                kd=ub(Cc[1],1,Cc[2]);
                                if kd~=nil and kd.__iter~=nil then
                                    ca=Ze(29349)
                                    break
                                elseif Z(Jg)=='table'then
                                    ca=Ze(-4525)
                                    break
                                end
                                ca=Ze(-20991)
                            elseif ca==-5910 then
                                Cc=Cc(v,Vf)
                                ca=Ze(-17592)
                            elseif ca==-25860 then
                                if type(Vf)=='function'then
                                    ca=Ze(14761)
                                    break
                                else
                                    ca=Ze(20389)
                                    break
                                end
                                ca=Ze(28437)
                            elseif ca==19405 then
                                Cc=kd.__iter
                                ca=Ze(-17903)
                            end
                        end
                    until ca==17852
                end))
                Od=fd(30337)
            elseif Od==-31522 then
                cb={Title=cb,Content=i,Duration=Ca}
                Od=fd(-2597)
            elseif Od==20656 then
                Sc=He.Notify
                Od=17480
            elseif Od==23926 then
                i=tostring(rc)
                Od=fd(35108)
            elseif Od==-20519 then
                Od=fd(50911);
                break;
            elseif Od==17480 then
                cb='Error'
                Od=23926
            elseif Od==-21161 then
                He=Cf
                Od=20656
            elseif Od==14173 then
                cb=Sc(He,cb)
                Od=fd(11492)
            end
        end
    until Od==15589
end
local Zc=Ig:CreateTab('Main')
local Wa=Ig:CreateTab('Teleport')
local ha=Ig:CreateTab('Movement')
local qg=Zc:CreateSection('Dig')
local Mg=Zc:CreateToggle({Name='Auto Dig',CurrentValue=false,Flag='AutoDig',Callback=function(da)
    local ne,Xb,Xg,If
    If,ne={[22319]=20975,[-2964]=-9868,[2488]=-29930,[-5115]=-29930,[20118]=-29930,[9141]=-32183,[-12501]=-19126,[-17133]=-7862,[-392]=-32183,[31088]=-32183,[12293]=28704,[22088]=12925,[-9499]=28128,[-24687]=-9868},function(r)
        return If[r+26651]
    end
    Xg=ne(-17510)
    repeat
        while true do
            if Xg==-32183 then
                ma=da;
                if da then
                    Xg=ne(-51338)
                    break
                end
                Xg=-29930
            elseif Xg==-9868 then
                Xb=task.spawn
                Xg=-16218
            elseif Xg==-29930 then
                Xg=ne(-4563);
                break;
            elseif Xg==-16218 then
                Xb=Xb(function()
                    local Vg,Kd,nd,df,e,Wb,Wb,vc,Wg,Yg,Pf,Xe,Xa,Dg,Gg,Ae,m,Sb,_c,Ye,Xa,Ud,Gg,te,vb,md,Ma,Hf,xd,Vc,Tf,Tg,Oa,Sb,l,hd,mf,h,ec,g,je,ad,U,eg,g,xd,yc
                    Ye,l={[13186]=-31548,[12997]=-24832,[-24811]=-6456,[12709]=30801,[-15906]=-28416,[4758]=8387,[-19078]=-27548,[-27317]=14869,[26845]=-1725,[29277]=4041,[25131]=38,[14271]=-17000,[6886]=-7109,[12143]=-11168,[3686]=-3563,[-20639]=1380,[6635]=-9421,[-10289]=-19459,[18904]=26538,[29834]=-28295,[15191]=-20232,[-14475]=-23288,[31920]=27851,[31621]=-17000,[21839]=-7048,[21006]=25811,[12841]=9589,[19914]=8515,[-19361]=-25346,[-4203]=-24285,[-24651]=-19459,[-19224]=-17000,[1826]=11272,[-7385]=-1794,[-21459]=32230,[-8557]=26686,[17975]=9718,[-19793]=13396,[-23937]=25320,[27442]=10289,[27049]=-32482,[-12522]=-25122,[-1255]=-304,[8401]=27395,[31763]=-22190,[31757]=-17000,[-13273]=-16612,[30432]=-7940,[-32560]=25590,[21535]=-10944,[12809]=-32590,[27369]=22354,[31029]=-13703,[-10892]=-14265,[-14711]=-21488,[-12243]=-19459,[-8179]=-9262,[17987]=13396,[-32064]=5007,[3281]=29041,[6711]=21241,[-10907]=-14378,[15098]=4598,[7742]=23774,[11384]=-29164,[-19863]=5253,[26242]=2415,[10183]=27786,[-18815]=-13377,[12770]=-11626,[-24752]=-22731,[25559]=-8521,[-26227]=-23540,[-30949]=-13377,[6359]=10681,[9663]=16457,[30057]=15824,[-19098]=-10172,[8721]=-17000,[17759]=25896,[985]=20093,[9280]=-27963,[18708]=28551,[6201]=-21427,[-13546]=-23540,[25280]=-12219,[14982]=-22190,[-19746]=1437,[-5330]=-21197,[18319]=31580,[-22606]=17821,[32]=21132,[5550]=-32590,[-19065]=-32590,[13453]=14124,[-17238]=-14539,[-27738]=-22731,[-148]=-13377,[11000]=-3192,[-9226]=-20388,[-14375]=24554,[25870]=30801,[-12703]=-23540,[335]=-20388,[-30175]=3357,[-26102]=-14563,[-24343]=17317,[24912]=-14563,[-661]=5725,[2358]=-28520,[-32116]=-7940,[-24954]=-14694,[-24932]=7305,[2456]=8534,[19287]=27152,[20734]=12000,[-3072]=23036,[-10520]=14124,[-31872]=21012,[13734]=-13703,[-16112]=26892,[-31672]=10289,[-30382]=3377,[-16128]=2202,[22907]=26070,[26783]=19434,[16126]=11757,[11548]=13656,[9018]=-17000,[12534]=29375,[27362]=-5402,[1027]=28551,[32445]=-23288,[11704]=16916,[-14455]=-10600,[15736]=-10944,[6744]=-7940,[7551]=-29538,[31874]=-1725,[-11452]=-13377,[6646]=-3563,[24666]=5253,[-30376]=3377,[-7848]=-13377,[16769]=30841,[-11124]=5823,[6994]=-13377,[-5494]=15824,[25124]=-7055,[-11596]=-28295,[-10320]=-6423,[8333]=4041,[24690]=-24832,[-1780]=-8521,[12508]=-6423,[20199]=3377,[3431]=23036,[-19915]=-27548,[-25375]=-13377,[7885]=-304,[-19854]=16916,[3095]=-7010,[-5097]=-13377,[7000]=-32482,[-9855]=-32406,[17531]=14222,[-3398]=-32250,[-882]=-12377,[-7055]=2978,[19213]=-29832,[22047]=-907,[8355]=25320,[-7414]=6239,[1656]=31597,[32085]=25130,[-22391]=10917,[-26525]=-1725,[28480]=3377,[-10979]=15427,[253]=-13377,[-12442]=30068,[15090]=-17000,[-25764]=14222,[-16367]=5797,[16687]=14939,[8643]=-17000,[19634]=-24832,[26128]=-5061,[12817]=-26510,[4400]=9718,[28703]=16741,[-7452]=12932,[-13432]=12543,[-31761]=8534,[-1553]=30801,[-28761]=-1725,[4671]=-30875,[256]=27851,[24191]=3377,[-15641]=13879,[17755]=13044,[-19865]=-17911,[12983]=-13108,[24815]=4598,[977]=-22731,[-13716]=-7806,[-11378]=14939,[-32085]=3377,[22136]=11757,[-10582]=10681,[32329]=21645,[-10488]=29041,[8596]=15390,[7734]=-32482,[17410]=-3192,[26413]=-2664,[18480]=-15539,[-21514]=-23288,[16600]=-17000,[-4478]=32048,[12226]=-3707,[-12506]=29375,[17800]=32048,[-27077]=9083,[8001]=-22731,[-5179]=-22190,[22901]=-24295,[25383]=12543},function(ya)
                        return Ye[ya- -5066]
                    end
                    m=l(-33827)
                    repeat
                        while true do
                            if m==28551 then
                                nd,Pf,hd=ub(df[1],1,df[2]);
                                m=l(-35442)
                            elseif m==-28520 then
                                Dg=gb(Xe(df))
                                m=l(-24812)
                            elseif m==14939 then
                                Kd=ub(Dg[1],1,Dg[2]);
                                m=l(14147);
                            elseif m==-29164 then
                                Dg=1
                                m=31622
                            elseif m==-15775 then
                                Wg=Wg(eg,Tf,Vg)
                                m=8876
                            elseif m==27292 then
                                df=gb(df(nd))
                                m=l(-4039)
                            elseif m==25320 then
                                te=ub(df[1],1,df[2]);
                                if te~=nil and te.__iter~=nil then
                                    m=l(-16045)
                                    break
                                elseif Z(nd)=='table'then
                                    m=l(1580)
                                    break
                                end
                                m=l(-37151)
                            elseif m==30709 then
                                df=gb(ipairs(ub(Dg[1],1,Dg[2])))
                                m=l(17070)
                            elseif m==17821 then
                                Xe=df.SendMouseButtonEvent
                                m=l(7160)
                            elseif m==11757 then
                                nd,Pf,hd=ub(df[1],1,df[2]);
                                if Z(nd)~='function'then
                                    m=l(-8138)
                                    break
                                end;
                                m=l(19125);
                            elseif m==-25635 then
                                Xe=0.5
                                m=12853
                            elseif m==-20388 then
                                df=vb
                                m=-3857
                            elseif m==-7010 then
                                e=6.4161999999999999
                                m=l(-14921)
                            elseif m==21012 then
                                Xe=Ma
                                m=l(-6321)
                            elseif m==-29832 then
                                df={}
                                m=l(12921)
                            elseif m==-17982 then
                                Tf=321.55239999999998
                                m=l(-3410)
                            elseif m==-15828 then
                                mf=0
                                m=-9822
                            elseif m==25590 then
                                df=hf(function()
                                    return Of:WaitForChild('Remotes'):WaitForChild('Dig_Finished')
                                end,ub(df[1],1,df[2]))
                                m=l(7442)
                            elseif m==13044 then
                                df={df,Xe}
                                m=l(-24981)
                            elseif m==-1725 then
                                if ma then
                                    m=l(20065)
                                else
                                    m=-30497
                                end
                            elseif m==-23540 then
                                Gg.Parent=ec;
                                m=l(3952)
                            elseif m==3377 then
                                xd,Wb=nd(Pf,hd);
                                hd=xd;
                                if hd==nil then
                                    m=l(-4731)
                                else
                                    m=l(26697)
                                end
                            elseif m==-3707 then
                                Dg=0
                                m=-15828
                            elseif m==-14265 then
                                Dg=Xe(df,Dg,mf,Vc,false,game,Ma)
                                m=l(484)
                            elseif m==27152 then
                                df=Of:WaitForChild('PlayerItems')
                                m=31719
                            elseif m==27851 then
                                vc=ub(df[1],1,df[2]);
                                if vc~=nil and vc.__iter~=nil then
                                    m=l(1293)
                                    break
                                elseif Z(Yg)=='table'then
                                    m=l(14848)
                                    break
                                end
                                m=l(10024)
                            elseif m==-13377 then
                                Xa,Sb=h(_c,yc);
                                yc=Xa;
                                if yc==nil then
                                    m=l(1678)
                                else
                                    m=l(-17508)
                                end
                            elseif m==-6675 then
                                Wg=163
                                m=l(-29998)
                            elseif m==22736 then
                                Wg=2048.3314999999998
                                m=8832
                            elseif m==26070 then
                                Xe=0.050000000000000003
                                m=l(16981)
                            elseif m==7305 then
                                eg=162
                                m=19283
                            elseif m==-32250 then
                                df=gb(Wf(Yg))
                                m=l(-4810)
                            elseif m==-14694 then
                                Wg=108.6206
                                m=-14984
                            elseif m==17447 then
                                Tf=Tf.Cylinder
                                m=l(20058)
                            elseif m==-11168 then
                                df=gb(ipairs(ub(Dg[1],1,Dg[2])))
                                m=l(-36738)
                            elseif m==4598 then
                                Yg,Ae,je=ub(df[1],1,df[2]);
                                m=l(9205)
                            elseif m==2202 then
                                Ma=Ma(Wg,eg,Tf)
                                m=-22902
                            elseif m==-23288 then
                                Sb.Parent=vb;
                                m=l(25366)
                                break
                            elseif m==-22190 then
                                Hf[Wb.Name]=true;
                                m=l(15133)
                            elseif m==-11626 then
                                Xe=df.SendMouseButtonEvent
                                m=-3522
                            elseif m==31580 then
                                Ma=Color3 .fromRGB
                                m=-6675
                            elseif m==8534 then
                                df=task.wait
                                m=20254
                            elseif m==19334 then
                                Xe=df.GetChildren
                                m=l(-26525)
                            elseif m==-7806 then
                                Wg=Wg.Plastic
                                m=l(17835)
                            elseif m==-8521 then
                                nd,Pf,hd=ub(df[1],1,df[2]);
                                m=l(23414)
                            elseif m==-304 then
                                df=Xe
                                m=l(-30830)
                            elseif m==8832 then
                                eg=108.5706
                                m=-17982
                            elseif m==-11706 then
                                Dg='Players'
                                m=1454
                            elseif m==20254 then
                                Xe=0
                                m=l(7775)
                            elseif m==-7940 then
                                df=task.wait
                                m=-25635
                            elseif m==24383 then
                                Xe=1.5
                                m=l(-27457)
                            elseif m==26686 then
                                Ma=2048.3314999999998
                                m=l(-30020)
                            elseif m==-32406 then
                                md=5.5872999999999999
                                m=-22430
                            elseif m==2055 then
                                Ma=90
                                m=l(11703)
                            elseif m==8387 then
                                Tf=Tg.new
                                m=l(-21178)
                            elseif m==3357 then
                                eg=135
                                m=18701
                            elseif m==-14984 then
                                eg=321.55239999999998
                                m=l(2485)
                            elseif m==26462 then
                                Ma=0
                                m=l(21717)
                            elseif m==29406 then
                                Dg=Oa.CharacterAdded
                                m=25604
                            elseif m==27395 then
                                mf=0
                                m=-10485
                            elseif m==21234 then
                                df=0
                                m=l(-10396)
                            elseif m==5253 then
                                ec=ub(Dg[1],1,Dg[2]);
                                m=l(13838);
                            elseif m==9589 then
                                df=df(Xe)
                                m=l(14568)
                            elseif m==-12377 then
                                mf=0
                                m=-29379
                            elseif m==-7055 then
                                Vg=Tg.new
                                m=-23643
                            elseif m==1454 then
                                Dg=gb(Xe(df,Dg))
                                m=23315
                            elseif m==12543 then
                                Ud=ub(df[1],1,df[2]);
                                if Ud~=nil and Ud.__iter~=nil then
                                    m=l(5117)
                                    break
                                elseif Z(h)=='table'then
                                    m=l(12909)
                                    break
                                end
                                m=l(-4813)
                            elseif m==-907 then
                                df=df(Xe)
                                m=l(-10560)
                            elseif m==-28295 then
                                Oa=df;
                                m=l(-17588);
                            elseif m==-27548 then
                                U=df;
                                m=l(-13245);
                            elseif m==30068 then
                                if Sb:IsA('Tool')and Hf[Sb.Name]then
                                    m=l(-26580)
                                    break
                                end
                                m=l(-30441)
                            elseif m==-1818 then
                                Xe={Xe,Dg}
                                m=l(12689)
                            elseif m==-24340 then
                                if Xe then
                                    m=l(2819)
                                    break
                                end
                                m=29406
                            elseif m==-15539 then
                                Ma=Ma(Wg,eg,Tf)
                                m=26357
                            elseif m==-9822 then
                                Vc=0
                                m=l(27019)
                            elseif m==-10172 then
                                Tf=Enum.PartType
                                m=17447
                            elseif m==15390 then
                                Vc=gb(mf(Dg))
                                m=-30569
                            elseif m==-26508 then
                                Xe={Orientation=Xe,Transparency=Dg,Name=mf,Position=Vc,Color=Ma,Material=Wg,Shape=eg,Size=Tf}
                                m=270
                            elseif m==15427 then
                                df=te.__iter
                                m=27292
                            elseif m==-9262 then
                                df=gb(unpack(U))
                                m=l(-37626)
                            elseif m==30841 then
                                Dg=Dg(mf,Vc,Ma)
                                m=l(2676)
                            elseif m==-32502 then
                                Dg=gb(Xe(df,Dg))
                                m=l(-24929)
                            elseif m==-21427 then
                                Tf=Tf(Vg,ad,e)
                                m=-26508
                            elseif m==-17501 then
                                df=gb(df(h))
                                m=l(19846)
                            elseif m==18701 then
                                Tf=114
                                m=-21045
                            elseif m==23036 then
                                df=gb(Wf(nd))
                                m=l(3289)
                            elseif m==30689 then
                                Xe=df.WaitForChild
                                m=l(-25705)
                            elseif m==23315 then
                                df=ub(Dg[1],1,Dg[2]).LocalPlayer
                                m=l(24768)
                            elseif m==-17321 then
                                ad=0.10000000000000001
                                m=l(-19521)
                            elseif m==-3857 then
                                Xe=df.GetChildren
                                m=11957
                            elseif m==8515 then
                                df=gb(qe(Yg))
                                m=l(10032)
                            elseif m==-23643 then
                                ad=0.20000000000000001
                                m=l(-1971)
                            elseif m==10289 then
                                Yg,Ae,je=ub(df[1],1,df[2]);
                                if Z(Yg)~='function'then
                                    m=l(-8464)
                                    break
                                end;
                                m=l(26691);
                            elseif m==-22902 then
                                Wg=Color3 .fromRGB
                                m=l(-35241)
                            elseif m==32230 then
                                Dg=gb(Xe(df))
                                m=30709
                            elseif m==-21488 then
                                Ma=Tg.new
                                m=22736
                            elseif m==29041 then
                                h,_c,yc=ub(df[1],1,df[2]);
                                if Z(h)~='function'then
                                    m=l(21062)
                                    break
                                end;
                                m=l(1928);
                            elseif m==29793 then
                                Dg='Shovels'
                                m=-32464
                            elseif m==14222 then
                                vb=df;
                                m=l(14221);
                            elseif m==38 then
                                df=ta
                                m=l(7704)
                            elseif m==-5061 then
                                df=gb(Wf(h))
                                m=l(-18498)
                            elseif m==16741 then
                                eg=eg.Pebble
                                m=l(-24164)
                            elseif m==17317 then
                                Vc='CenterCylinder'
                                m=l(-19777)
                            elseif m==-30569 then
                                Ma=ub(Vc[1],1,Vc[2])
                                m=l(-36938)
                            elseif m==1437 then
                                df=gb(ipairs(ub(Dg[1],1,Dg[2])))
                                m=l(-1785)
                            elseif m==-22430 then
                                Vg=Vg(ad,e,md)
                                m=-13810
                            elseif m==-10944 then
                                Yg,Ae,je=ub(df[1],1,df[2]);
                                m=l(3655)
                            elseif m==26538 then
                                df=Oa.Character
                                m=l(1820)
                            elseif m==15824 then
                                df=ta
                                m=l(-27672)
                            elseif m==-10485 then
                                Vc=0
                                m=26462
                            elseif m==-10789 then
                                eg=eg.Block
                                m=l(-308)
                            elseif m==-30875 then
                                df=Kd
                                m=19334
                            elseif m==-30497 then
                                m=l(-24427);
                                break;
                            elseif m==-17000 then
                                g,Gg=Yg(Ae,je);
                                je=g;
                                if je==nil then
                                    m=l(-2610)
                                else
                                    m=16247
                                end
                            elseif m==-6423 then
                                df=game
                                m=l(6482)
                            elseif m==-3522 then
                                Dg=0
                                m=l(3335)
                            elseif m==19434 then
                                Dg=Xe(df,Dg,mf,Vc,true,game,Ma)
                                m=l(-17309)
                            elseif m==23774 then
                                mf=0
                                m=l(-29409)
                            elseif m==15352 then
                                Vc=Tg.new
                                m=l(-13623)
                            elseif m==-24295 then
                                eg=Enum.PartType
                                m=-10789
                            elseif m==12000 then
                                df=gb(df(Yg))
                                m=l(10670)
                            elseif m==10917 then
                                df=df(Xe)
                                m=l(2935)
                            elseif m==10681 then
                                df=vc.__iter
                                m=l(15668)
                            elseif m==-25122 then
                                df=Oa
                                m=30689
                            elseif m==-13810 then
                                Dg={Orientation=Dg,Transparency=mf,Name=Vc,Position=Ma,Color=Wg,Material=eg,Shape=Tf,Size=Vg}
                                m=-1818
                            elseif m==25130 then
                                Ma=0
                                m=l(-15958)
                            elseif m==27786 then
                                df=Ud.__iter
                                m=-17501
                            elseif m==-22731 then
                                Tg=Vector3;
                                m=21234;
                            elseif m==31622 then
                                mf='PositionPart'
                                m=15352
                            elseif m==-10566 then
                                Xe=df.GetChildren
                                m=l(-2708)
                            elseif m==-21197 then
                                Xe=Tg.zero
                                m=l(6318)
                            elseif m==13656 then
                                Xe=df.GetService
                                m=-11706
                            elseif m==-21045 then
                                Vg=85
                                m=-15775
                            elseif m==26892 then
                                Vg=0.10000000000000001
                                m=-17321
                            elseif m==1380 then
                                Dg='Backpack'
                                m=-32502
                            elseif m==11957 then
                                Dg=gb(Xe(df))
                                m=l(7077)
                            elseif m==31719 then
                                Xe=df.WaitForChild
                                m=29793
                            elseif m==26357 then
                                Wg=Enum.Material
                                m=l(-18782)
                            elseif m==-19459 then
                                df=task.wait
                                m=l(17841)
                            elseif m==-14563 then
                                h,_c,yc=ub(df[1],1,df[2]);
                                m=l(-36015)
                            elseif m==-24832 then
                                df=ec
                                m=-10566
                            elseif m==12853 then
                                df=df(Xe)
                                m=l(26808)
                            elseif m==-16612 then
                                Vc=Vc(Ma,Wg,eg)
                                m=l(13253)
                            elseif m==-10600 then
                                e=0.10000000000000001
                                m=l(1135)
                            elseif m==14124 then
                                h,_c,yc=ub(df[1],1,df[2]);
                                m=l(-10163)
                            elseif m==8876 then
                                eg=Enum.Material
                                m=l(23637)
                            elseif m==-29379 then
                                Vc=90
                                m=2055
                            elseif m==19283 then
                                Tf=165
                                m=l(13414)
                            elseif m==-32464 then
                                Dg=gb(Xe(df,Dg))
                                m=l(11621)
                            elseif m==-32590 then
                                df=task.wait
                                m=24383
                            elseif m==270 then
                                Dg=Tg.new
                                m=l(-5948)
                            elseif m==9718 then
                                df=gb(qe(h))
                                m=l(-15586)
                            elseif m==25604 then
                                mf=Dg.Wait
                                m=l(3530)
                            elseif m==-7109 then
                                Xe=df
                                m=-24340
                            elseif m==31597 then
                                Tf=-Tf
                                m=l(-21194)
                            elseif m==-29538 then
                                eg=-eg
                                m=l(-18339)
                            elseif m==13396 then
                                Hf=df;
                                m=l(-395);
                            elseif m==16247 then
                                if Gg:IsA('Tool')then
                                    m=l(-17769)
                                    break
                                end
                                m=l(26555)
                            elseif m==-3563 then
                                df=gb(qe(nd))
                                m=l(20493)
                            end
                        end
                    until m==-25346
                end)
                Xg=ne(-6533)
            end
        end
    until Xg==12925
end})
local ue=Zc:CreateSection(' Sell')
local dc=Zc:CreateButton({Name='Sell All Items',Callback=function()
    local Zf,ud,hb,ah
    ah,ud={[3112]=-6803,[-12497]=15681,[-7536]=-32339,[6845]=-18892,[2048]=22917,[-28012]=-6803},function(_a)
        return ah[_a+-23796]
    end
    Zf=ud(16260)
    repeat
        while true do
            if Zf==-32339 then
                hb=task.spawn
                Zf=19673
            elseif Zf==19673 then
                hb=hb(function()
                    local ia={workspace:WaitForChild('World'):WaitForChild('NPCs'):WaitForChild('Rocky')};
                    game:GetService('ReplicatedStorage'):WaitForChild('DialogueRemotes'):WaitForChild('SellAllItems'):FireServer(unpack(ia))
                end)
                Zf=ud(26908)
            elseif Zf==-6803 then
                Zf=ud(30641);
                break;
            end
        end
    until Zf==-18892
end})
local Pa=Zc:CreateToggle({Name='Auto Sell All',CurrentValue=false,Flag='AutoSellAll',Callback=function(og)
    local dh,ib,Lg,Ff
    Lg,Ff={[-32062]=-14154,[-2962]=3735,[-10048]=3735,[-13723]=3735,[-26978]=-24817,[-13668]=31005,[-28348]=-21965,[20198]=10828,[2375]=31005,[23603]=-5196,[-27804]=31005},function(db)
        return Lg[db+4134]
    end
    ib=Ff(-17857)
    repeat
        while true do
            if ib==-14154 then
                dh=task.spawn
                ib=29657
            elseif ib==29657 then
                dh=dh(function()
                    local Hb,Te,gg,Me,Uc,Sa,B
                    Te,B={[-19179]=14748,[-32079]=14748,[-26826]=7877,[-11226]=-18196,[14919]=-27846,[31173]=-26571,[-8018]=25722,[-22324]=-26571,[-4097]=12713,[3350]=-5890,[27909]=-20331,[26912]=12713,[-29334]=-16152,[-18038]=14748,[-106]=11211,[-15675]=-8192,[23162]=14748},function(Gf)
                        return Te[Gf+1890]
                    end
                    gg=B(-19928)
                    repeat
                        while true do
                            if gg==12713 then
                                Me=task.wait
                                gg=638
                            elseif gg==12786 then
                                Me=game:GetService('ReplicatedStorage'):WaitForChild('DialogueRemotes'):WaitForChild('SellAllItems')
                                gg=-32059
                            elseif gg==7877 then
                                Hb=gb(unpack(Sa))
                                gg=6198
                            elseif gg==-32059 then
                                Uc=Me.FireServer
                                gg=B(-28716)
                            elseif gg==-26571 then
                                Sa=Me;
                                gg=12786;
                            elseif gg==638 then
                                Me=Me(mb)
                                gg=B(-21069)
                            elseif gg==20034 then
                                Me={ub(Hb[1],1,Hb[2])}
                                gg=B(29283)
                            elseif gg==6198 then
                                Hb=Uc(Me,ub(Hb[1],1,Hb[2]))
                                gg=B(25022)
                            elseif gg==-18196 then
                                Hb='Rocky'
                                gg=17771
                            elseif gg==17771 then
                                Hb=gb(Uc(Me,Hb))
                                gg=20034
                            elseif gg==-5890 then
                                Me=workspace:WaitForChild('World'):WaitForChild('NPCs')
                                gg=14803
                            elseif gg==14748 then
                                if x then
                                    gg=B(1460)
                                else
                                    gg=25237
                                end
                            elseif gg==14803 then
                                Uc=Me.WaitForChild
                                gg=B(-13116)
                            elseif gg==25237 then
                                gg=B(-31224);
                                break;
                            end
                        end
                    until gg==-16152
                end)
                ib=Ff(-1759)
            elseif ib==3735 then
                x=og;
                if og then
                    ib=Ff(-36196)
                    break
                end
                ib=31005
            elseif ib==31005 then
                ib=Ff(-31112);
                break;
            end
        end
    until ib==-24817
end})
local Pd=Zc:CreateSlider({Name='Auto Sell Interval (s)',Range={0,300},Increment=1,Suffix='seconds',CurrentValue=10,Flag='AutoSellInterval',Callback=function(kc)
    mb=kc;
end})
local zb=Zc:CreateSection(' Journal')
local _e=Zc:CreateButton({Name='Claim All Journals',Callback=function()
    local Ee,Tb,jh,b,xf,Lf,ja,wb,ke,T,Yc,ed,ze,Mc,T,ee,ja
    wb,ke={[11512]=32163,[-16649]=-17018,[11342]=-13763,[20290]=16306,[-9088]=-18896,[14957]=20590,[-22458]=28385,[20402]=-6257,[14797]=22078,[4107]=16306,[19655]=2104,[-22579]=-13086,[-29880]=-10255,[-7598]=-20567,[-28159]=-10255,[-14933]=-32289,[-17187]=23388,[28504]=-12416,[-1640]=2741,[6989]=12945,[23503]=28385,[-18844]=16306,[24539]=-25368,[13886]=-19790,[-9860]=16306,[26872]=-19790,[-18405]=16306,[-114]=31353,[-5066]=-16124,[-7076]=-23348,[-17604]=16306,[20797]=32588,[16136]=-6257,[25096]=-14618,[362]=32163,[-4133]=-8243,[7626]=31960,[-19562]=16306,[-9733]=-12416,[-23852]=5296,[21296]=15331,[6866]=20590,[3593]=21017,[-27070]=31353,[-21178]=16306,[-2614]=-18896,[20687]=-16983,[-8904]=-13435,[821]=16306,[4437]=-12416,[-12529]=10371,[-21032]=21709,[16139]=-13086,[20502]=16306,[25083]=15331,[-22312]=4783,[-20322]=9797,[-13173]=-23348,[-19508]=2945,[-2513]=32108,[-3469]=-11470},function(V)
        return wb[V-9868]
    end
    Ee=ke(964)
    repeat
        while true do
            if Ee==28385 then
                b=gb(Wf(Lf))
                Ee=ke(-20012)
            elseif Ee==9797 then
                Yc='Journal_Claim'
                Ee=-3324
            elseif Ee==12945 then
                b=gb(b(Lf))
                Ee=ke(-3305)
            elseif Ee==-25798 then
                Yc=ja.Name
                Ee=20444
            elseif Ee==-23348 then
                Lf,ze,ed=ub(b[1],1,b[2]);
                Ee=ke(-8537)
            elseif Ee==-17446 then
                b=b.Frame
                Ee=18501
            elseif Ee==18501 then
                b=b.Journal
                Ee=-1245
            elseif Ee==15331 then
                b=gb(qe(Lf))
                Ee=ke(23754)
            elseif Ee==-22140 then
                b=b(jh)
                Ee=ke(-11310)
            elseif Ee==-13763 then
                b=xf.__iter
                Ee=ke(16857)
            elseif Ee==-13435 then
                b=game
                Ee=ke(17494)
            elseif Ee==-18896 then
                Lf,ze,ed=ub(b[1],1,b[2]);
                if Z(Lf)~='function'then
                    Ee=ke(-12590)
                    break
                end;
                Ee=ke(13975);
            elseif Ee==21017 then
                jh=0
                Ee=-22140
            elseif Ee==-339 then
                b=Tb
                Ee=17592
            elseif Ee==-25368 then
                b=0
                Ee=ke(10230)
            elseif Ee==-16124 then
                b=gb(ipairs(ub(Yc[1],1,Yc[2])))
                Ee=ke(780)
            elseif Ee==16306 then
                T,ja=Lf(ze,ed);
                ed=T;
                if ed==nil then
                    Ee=-4497
                else
                    Ee=24143
                end
            elseif Ee==-11470 then
                b=game:GetService('ReplicatedStorage'):WaitForChild('Remotes')
                Ee=16685
            elseif Ee==-16983 then
                b=task.wait
                Ee=ke(13461)
            elseif Ee==-19790 then
                Lf,ze,ed=ub(b[1],1,b[2]);
                Ee=ke(-9694)
            elseif Ee==20444 then
                Yc=jh(b,Yc)
                Ee=ke(9754)
            elseif Ee==31960 then
                jh=b.GetService
                Ee=-5894
            elseif Ee==32163 then
                ee=b;
                Ee=-339;
            elseif Ee==-4497 then
                Ee=ke(-5065);
                break;
            elseif Ee==24143 then
                if ja:IsA('TextButton')or ja:IsA('ImageButton')then
                    Ee=ke(2270)
                    break
                end
                Ee=ke(10689)
            elseif Ee==-5894 then
                Yc='Players'
                Ee=29541
            elseif Ee==20590 then
                Tb=b;
                Ee=ke(6399);
            elseif Ee==-14967 then
                Yc=gb(jh(b))
                Ee=ke(4802)
            elseif Ee==-3324 then
                Yc=gb(jh(b,Yc))
                Ee=ke(26004)
            elseif Ee==-5906 then
                b=b.PlayerGui
                Ee=2143
            elseif Ee==-13086 then
                ee+=b;
                Ee=ke(30555);
            elseif Ee==17592 then
                jh=b.GetChildren
                Ee=-14967
            elseif Ee==-1245 then
                b=b.Scroller
                Ee=ke(24825)
            elseif Ee==-10255 then
                xf=ub(b[1],1,b[2]);
                if xf~=nil and xf.__iter~=nil then
                    Ee=ke(21210)
                    break
                elseif Z(Lf)=='table'then
                    Ee=ke(34951)
                    break
                end
                Ee=ke(-8976)
            elseif Ee==29541 then
                Yc=gb(jh(b,Yc))
                Ee=ke(29523)
            elseif Ee==2104 then
                b=ub(Yc[1],1,Yc[2]).LocalPlayer
                Ee=-5906
            elseif Ee==31353 then
                b=1
                Ee=ke(26007)
            elseif Ee==-6257 then
                Mc=ub(Yc[1],1,Yc[2]);
                Ee=ke(34407);
            elseif Ee==2143 then
                b=b.HUD
                Ee=-17446
            elseif Ee==16685 then
                jh=b.WaitForChild
                Ee=ke(-10454)
            elseif Ee==15987 then
                jh=b.FireServer
                Ee=-25798
            elseif Ee==-20567 then
                b=Mc
                Ee=15987
            end
        end
    until Ee==-32289
end})
local qb=Zc:CreateSection(' Charms')
local Qa={'Controlled Glove','Lucky Bell','Blue Coil','Rock Pounder','Shoulder Bag','Vision Goggles'}
local Rb={}
local G={}
local rd=workspace:WaitForChild('World'):WaitForChild('Interactive'):WaitForChild('Purchaseable')
for va,jd in ipairs(rd:GetChildren())do
    local P,F,Hc,xe,Sd,Ge,za,oe,fg
    oe,Hc={[15626]=-32601,[-28101]=-23523,[-21342]=-8486,[-6772]=-31084,[-14055]=-8486,[20248]=-23523,[26255]=6990,[-26933]=-475,[20258]=-475,[-319]=-8486,[24645]=25821,[-10597]=-32601,[19530]=-11434,[16998]=-28528,[-3499]=-23523,[27379]=-14269,[25898]=-28191,[28275]=-29144,[30389]=-14269,[-16162]=-28528,[722]=6990,[-17006]=-29144,[3882]=-23523,[-24339]=15198,[-1669]=-10300,[-17842]=27237,[-15992]=-21556,[-27176]=-23523,[31261]=-29796,[-17720]=4839},function(tb)
        return oe[tb+8995]
    end
    Ge=Hc(-26837)
    repeat
        while true do
            if Ge==-475 then
                P=F;
                Ge=-21618;
            elseif Ge==27237 then
                if jd:IsA('Model')and jd:FindFirstChild('PurchasePrompt')then
                    Ge=Hc(8003)
                    break
                end
                Ge=-23523
            elseif Ge==-23523 then
                Ge=Hc(-33334);
                break;
            elseif Ge==-2039 then
                Sd=fg
                Ge=Hc(10535)
            elseif Ge==11557 then
                F=F(G,P)
                Ge=Hc(11253)
            elseif Ge==-21618 then
                F=jd.Name
                Ge=Hc(17260)
            elseif Ge==-28191 then
                Sd='PurchasePrompt'
                Ge=-8919
            elseif Ge==21322 then
                F=xe
                Ge=Hc(22266)
            elseif Ge==-27345 then
                fg=xe.ObjectText
                Ge=-2039
            elseif Ge==-28528 then
                F=jd
                Ge=Hc(15650)
            elseif Ge==-16916 then
                F=table.insert
                Ge=11557
            elseif Ge==-14269 then
                F=F
                Ge=Hc(11263)
            elseif Ge==-8486 then
                Rb[P]=za;
                Ge=-16916;
            elseif Ge==-29796 then
                if not F then
                    Ge=Hc(21394)
                    break
                end
                Ge=-27345
            elseif Ge==-8919 then
                Sd=gb(fg(F,Sd))
                Ge=Hc(-19592)
            elseif Ge==6990 then
                za=F;
                if P and table.find(Qa,za)then
                    Ge=Hc(-23050)
                    break
                end
                Ge=Hc(-36171)
            elseif Ge==-32601 then
                xe=ub(Sd[1],1,Sd[2]);
                Ge=21322;
            elseif Ge==-11434 then
                F=Sd
                Ge=Hc(18384)
            elseif Ge==25821 then
                fg=F.FindFirstChild
                Ge=Hc(16903)
            end
        end
    until Ge==15198
end
local kg={['Rock Pounder']=workspace.World.Map['Cinder Isle']['Fernhill Forest']:FindFirstChild('Rock Pounder'),['Shoulder Bag']=workspace.World.Map['Cinder Isle']['Fernhill Forest']:FindFirstChild('Shoulder Bag')}
for la,J in pairs(kg)do
    local ye,I,id,ic,p,bg,vg,Fa
    p,id={[22304]=21363,[32056]=11634,[18507]=-30404,[11499]=-18368,[-29652]=-18368,[-13175]=-18368,[4890]=-3702,[-11809]=-24666,[-16223]=-18368,[-29750]=18927,[13581]=-12336,[-9927]=2109,[-11749]=18927,[-26034]=-11188,[26271]=-18368,[-12626]=-16620,[2660]=-10231,[11666]=-31173,[27333]=9515,[1156]=-18531,[30986]=669,[-25006]=-13158,[-24472]=-11188,[9058]=-13158,[-21712]=18927,[11636]=-30591,[-14264]=22740,[17038]=30216,[7174]=-18531},function(y)
        return p[y+-32603]
    end
    vg=id(63589)
    repeat
        while true do
            if vg==-11188 then
                I=ic;
                if I then
                    vg=id(10891)
                    break
                end
                vg=id(2951)
            elseif vg==9515 then
                if not ic then
                    vg=id(39777)
                    break
                end
                vg=id(49641)
            elseif vg==30216 then
                Fa=ye.ObjectText
                vg=id(44269)
            elseif vg==-31173 then
                bg=Fa
                vg=id(46184)
            elseif vg==-12336 then
                ic=bg
                vg=id(33759)
            elseif vg==11634 then
                ic=ic(G,I)
                vg=id(16380)
            elseif vg==-18531 then
                ic=ic
                vg=id(8131)
            elseif vg==18927 then
                Rb[I]=la;
                vg=-20555;
            elseif vg==-13158 then
                ye=ic;
                vg=30036;
            elseif vg==669 then
                if J and J:FindFirstChild('PurchasePrompt')then
                    vg=id(22676)
                    break
                end
                vg=-18368
            elseif vg==30036 then
                ic=ye
                vg=id(59936)
            elseif vg==-20555 then
                ic=table.insert
                vg=id(64659)
            elseif vg==-18368 then
                vg=id(54907);
                break;
            elseif vg==2109 then
                ic=J.PurchasePrompt
                vg=id(7597)
            end
        end
    until vg==21363
end
local function q(sf)
    local Yb,dd,mg,ie,Oe,xc
    mg,xc={[5396]=13005,[4036]=13503,[-14590]=13503,[20920]=5903,[6649]=10931},function(zf)
        return mg[zf- -27822]
    end
    ie=xc(-6902)
    repeat
        while true do
            if ie==5903 then
                Yb=gb(pcall(function()
                    Of:WaitForChild('DialogueRemotes'):WaitForChild('AttemptBuyCharm'):InvokeServer(sf)
                end))
                ie=xc(-42412)
            elseif ie==13503 then
                dd,Oe=ub(Yb[1],1,Yb[2]);
                ie=xc(-22426);
                break;
            end
        end
    until ie==13005
end
local Pb=Zc:CreateDropdown({Name='Buy Charms',Options=G,CurrentOption={'Select Charm'},MultipleOptions=false,Flag='CharmBuy',Callback=function(Re)
    local tc,tf,nf,rb,E
    tf,rb={[4352]=13613,[24036]=-5298,[13546]=16845,[24917]=8861,[-16009]=-26637,[-23638]=-18789,[-29816]=18343,[21976]=13785,[-26108]=8861,[29021]=-5298,[6932]=4962,[31571]=13613,[-1304]=20062,[-11776]=4897,[-18130]=18343,[11333]=-5298,[-32023]=-5298},function(Ua)
        return tf[Ua-21632]
    end
    E=rb(35178)
    repeat
        while true do
            if E==-27431 then
                tc=Re[tc]
                E=rb(25984)
            elseif E==-32197 then
                tc=Rb[nf]
                E=rb(3502)
            elseif E==8861 then
                tc=q(Hd)
                E=rb(45668)
            elseif E==-5298 then
                E=rb(20328);
                break;
            elseif E==18343 then
                Hd=tc;
                if Hd then
                    E=rb(46549)
                    break
                end
                E=rb(32965)
            elseif E==13613 then
                nf=tc;
                E=-32197;
            elseif E==16845 then
                tc=1
                E=-27431
            end
        end
    until E==20062
end})
local Rc=Zc:CreateButton({Name='Buy Again',Callback=function()
    local O,k,c,kf
    O,kf={[6912]=-29947,[13531]=3228,[14089]=-2154,[4071]=12533,[-23610]=-2154,[-15251]=-2154,[-10954]=13558,[-2568]=11787,[15506]=-27265},function(af)
        return O[af+-28994]
    end
    k=kf(26426)
    repeat
        while true do
            if k==11787 then
                if Hd then
                    k=kf(44500)
                    break
                end
                k=-2154
            elseif k==-27265 then
                c=q(Hd)
                k=kf(43083)
            elseif k==-2154 then
                k=kf(35906);
                break;
            end
        end
    until k==-29947
end})
local Ja=Wa:CreateSection(' Teleport')
local dg=Wa:CreateButton({Name='Teleport to Meteor',Callback=function()
    local n,na,Bb,we,N,Cd,nb,mh,Xd,Jf,Ef,ac,u,Qf
    we,nb={[-30772]=14186,[22685]=-11068,[5785]=23406,[-29139]=14834,[29100]=-865,[5139]=-6023,[6510]=13065,[13434]=-17929,[29447]=-32530,[13752]=-15191,[23916]=-1159,[-5893]=-20830,[32488]=-26730,[-12018]=30190,[32577]=19756,[-19457]=-3572,[10662]=14834,[5841]=-15392,[-6548]=18561,[-10634]=-13830,[-204]=9242,[-14277]=-21683,[-28621]=9242,[-18938]=30827,[5976]=14888,[-3777]=-32562,[-25176]=-26300,[8844]=30827,[-13044]=-14616,[31269]=-15392,[-8666]=-865,[-26308]=-26730},function(Gd)
        return we[Gd+23599]
    end
    n=nb(-30147)
    repeat
        while true do
            if n==23406 then
                N=gb(N(u,ac,Cd))
                n=-5690
            elseif n==-1159 then
                if not ac then
                    n=nb(-23803)
                    break
                end
                n=-16695
            elseif n==-8714 then
                ac=Bb
                n=nb(-52220)
            elseif n==14888 then
                u=0
                n=3113
            elseif n==-26730 then
                Ef=Jf;
                if Ef and Ef:IsA('Model')and Ef.PrimaryPart then
                    n=nb(5848)
                    break
                end
                n=nb(-14755)
            elseif n==13065 then
                Jf=Jf.CFrame
                n=nb(-10165)
            elseif n==14834 then
                mh=Jf;
                n=26365;
            elseif n==-32530 then
                Jf=Uf.Character
                n=nb(-27376)
            elseif n==-26300 then
                u='Active'
                n=nb(-54371)
            elseif n==-13373 then
                na=gb(Qf(Cd,na))
                n=-14481
            elseif n==-24282 then
                u=Uf.CharacterAdded
                n=nb(8978)
            elseif n==14186 then
                u=gb(N(Jf,u))
                n=-1302
            elseif n==3113 then
                ac=5
                n=-8652
            elseif n==-16695 then
                Cd=workspace.Active
                n=nb(-914)
            elseif n==-3572 then
                Qf=ub(Cd[1],1,Cd[2])
                n=nb(-18460)
            elseif n==-17929 then
                N=Vector3 .new
                n=nb(-17623)
            elseif n==-17283 then
                if N then
                    n=nb(-37876)
                    break
                end
                n=-24282
            elseif n==-1302 then
                ac=ub(u[1],1,u[2])
                n=nb(317)
            elseif n==939 then
                N=Jf.WaitForChild
                n=nb(-34233)
            elseif n==-8652 then
                Cd=0
                n=nb(-17814)
            elseif n==-15392 then
                Xd=ub(u[1],1,u[2]);
                n=-19983;
            elseif n==-23254 then
                Cd=gb(ac(u))
                n=nb(-43056)
            elseif n==-11068 then
                Qf=Cd.FindFirstChild
                n=24610
            elseif n==26365 then
                Jf=mh
                n=939
            elseif n==30827 then
                n=nb(-29492);
                break;
            elseif n==-13830 then
                u='HumanoidRootPart'
                n=28210
            elseif n==28210 then
                u=gb(N(Jf,u))
                n=nb(-17758)
            elseif n==-32562 then
                N=Jf
                n=-17283
            elseif n==9242 then
                Jf=ac
                n=nb(-49907)
            elseif n==-19983 then
                Jf=Ef.PrimaryPart
                n=nb(-17089)
            elseif n==-865 then
                Xd.CFrame=Jf;
                n=nb(-42537)
            elseif n==8737 then
                N=Jf.FindFirstChild
                n=nb(-48775)
            elseif n==-21683 then
                Jf=N
                n=nb(-12937)
            elseif n==-5690 then
                Jf=Jf+ub(N[1],1,N[2])
                n=nb(-32265)
            elseif n==19756 then
                ac=u.Wait
                n=-23254
            elseif n==-14481 then
                Bb=ub(na[1],1,na[2])
                n=-8714
            elseif n==24610 then
                na='ActiveMeteor'
                n=-13373
            elseif n==-6023 then
                N=Qf
                n=-21683
            elseif n==18561 then
                Jf=workspace
                n=8737
            end
        end
    until n==-20830
end})
local Qg=Wa:CreateButton({Name='Teleport to Enchantment Altar',Callback=function()
    local bd,pb,oc,lc,Fg,_g,Lb,ve,le,Je,Fc
    bd,Je={[-28297]=20606,[8401]=29304,[25756]=-28379,[-30300]=822,[5695]=31941,[8134]=-11084,[-1970]=29304,[2482]=-30563,[-8987]=-28379,[-11199]=26592,[-22810]=9591,[-1905]=4495,[21158]=-9532,[-27684]=-10204,[-18013]=-12765,[-27626]=20154,[22873]=16935,[2219]=27679,[1820]=9591,[-11066]=12356,[-31028]=-12765},function(Oc)
        return bd[Oc+10495]
    end
    Fg=Je(-21694)
    repeat
        while true do
            if Fg==20154 then
                Fc=Fc.Character
                Fg=2346
            elseif Fg==4202 then
                Fc=lc
                Fg=Je(-21561)
            elseif Fg==-10204 then
                Fc=ub(le[1],1,le[2]).LocalPlayer
                Fg=Je(-38121)
            elseif Fg==16935 then
                Fc=gb(Fc(pb,le,_g))
                Fg=Je(-12465)
            elseif Fg==14774 then
                le=gb(pb(Fc,le))
                Fg=Je(-19482)
            elseif Fg==20606 then
                le=-le
                Fg=4824
            elseif Fg==2346 then
                pb=Fc
                Fg=-11970
            elseif Fg==9591 then
                Fc=pb
                Fg=Je(-28508)
            elseif Fg==-28379 then
                ve=ub(le[1],1,le[2]);
                Fg=Je(-8013);
            elseif Fg==4824 then
                _g=2551
                Fg=Je(12378)
            elseif Fg==-11970 then
                if pb then
                    Fg=Je(-8675)
                    break
                end
                Fg=10566
            elseif Fg==-32714 then
                le='HumanoidRootPart'
                Fg=14774
            elseif Fg==12356 then
                pb=Fc.WaitForChild
                Fg=-32714
            elseif Fg==26592 then
                Fc=game
                Fg=-10656
            elseif Fg==26158 then
                Lb=ub(oc[1],1,oc[2])
                Fg=Je(-12400)
            elseif Fg==-8789 then
                le=669
                Fg=Je(-38792)
            elseif Fg==29304 then
                ve.CFrame=ub(Fc[1],1,Fc[2]);
                Fg=Je(10663);
                break;
            elseif Fg==10566 then
                le=game:GetService('Players').LocalPlayer.CharacterAdded
                Fg=Je(-4800)
            elseif Fg==-12765 then
                lc=Fc;
                Fg=4202;
            elseif Fg==-11084 then
                oc=gb(_g(le))
                Fg=26158
            elseif Fg==4495 then
                pb=Lb
                Fg=Je(-33305)
            elseif Fg==10533 then
                le=gb(pb(Fc,le))
                Fg=Je(-38179)
            elseif Fg==31941 then
                _g=le.Wait
                Fg=Je(-2361)
            elseif Fg==31031 then
                pb=4148
                Fg=-8789
            elseif Fg==-21783 then
                le='Players'
                Fg=10533
            elseif Fg==-10656 then
                pb=Fc.GetService
                Fg=-21783
            elseif Fg==-30563 then
                Fc=CFrame.new
                Fg=31031
            end
        end
    until Fg==-9532
end})
local sg=Wa:CreateButton({Name='Teleport to Traveling Merchant',Callback=function()
    local de,s,Ob,Mb,Nd,Q,ge,sc,ob,fh,Ea,bf
    Nd,s={[-21924]=23774,[25513]=26466,[29204]=-955,[30860]=-27109,[-3121]=22066,[-1843]=22143,[-23829]=17261,[6738]=-6169,[12323]=7934,[-21275]=-955,[-13982]=-16212,[-30362]=-5300,[-28462]=8739,[1812]=26466,[30138]=27033,[32071]=7934,[785]=-13452,[12381]=28845,[-32254]=-23791,[-14485]=15513,[19721]=-16212,[24442]=28271,[-11057]=12916,[-20692]=31478,[23483]=22066,[22603]=-7900,[30381]=24336,[18016]=26813,[-9469]=-27917},function(Og)
        return Nd[Og- -20050]
    end
    Ob=s(-18238)
    repeat
        while true do
            if Ob==23774 then
                bf=0
                Ob=-12584
            elseif Ob==19531 then
                ob=gb(fh(bf))
                Ob=8126
            elseif Ob==15758 then
                Mb='Traveling Merchant'
                Ob=s(10088)
            elseif Ob==-955 then
                Ea=Mb;
                Ob=s(-7669);
            elseif Ob==7934 then
                Q=ub(bf[1],1,bf[2]);
                if Q and Q:FindFirstChild('Traveling Merchant')and Q['Traveling Merchant'].PrimaryPart then
                    Ob=s(-21893)
                    break
                end
                Ob=24336
            elseif Ob==927 then
                if de then
                    Ob=s(-19265)
                    break
                end
                Ob=29277
            elseif Ob==29580 then
                de=sc
                Ob=-13452
            elseif Ob==8385 then
                bf='HumanoidRootPart'
                Ob=s(-29519)
            elseif Ob==28845 then
                Mb=Ea
                Ob=s(-34535)
            elseif Ob==-13452 then
                Mb=de
                Ob=s(-41325)
            elseif Ob==-23791 then
                ob=0
                Ob=-9745
            elseif Ob==23840 then
                de=Mb
                Ob=927
            elseif Ob==22143 then
                Mb=Uf.Character
                Ob=23840
            elseif Ob==-10907 then
                de=Mb.FindFirstChild
                Ob=s(-50412)
            elseif Ob==-12584 then
                fh=5
                Ob=s(-52304)
            elseif Ob==-9745 then
                de=gb(de(bf,fh,ob))
                Ob=19386
            elseif Ob==22066 then
                ge.CFrame=Mb;
                Ob=s(10331)
            elseif Ob==12916 then
                fh=bf.Wait
                Ob=19531
            elseif Ob==26813 then
                bf=gb(de(Mb,bf))
                Ob=s(12021)
            elseif Ob==26466 then
                Mb=workspace.World.NPCs
                Ob=-10907
            elseif Ob==17261 then
                Mb=Mb.CFrame
                Ob=s(2553)
            elseif Ob==27033 then
                Mb=Q[Mb]
                Ob=-27774
            elseif Ob==-27774 then
                Mb=Mb.PrimaryPart
                Ob=s(-43879)
            elseif Ob==-16212 then
                ge=ub(bf[1],1,bf[2]);
                Ob=15758;
            elseif Ob==-7900 then
                de=Vector3 .new
                Ob=s(-41974)
            elseif Ob==19386 then
                Mb=Mb+ub(de[1],1,de[2])
                Ob=s(-23171)
            elseif Ob==29277 then
                bf=Uf.CharacterAdded
                Ob=s(-31107)
            elseif Ob==-5300 then
                bf='Merchant Cart'
                Ob=s(-2034)
            elseif Ob==8126 then
                sc=ub(ob[1],1,ob[2])
                Ob=29580
            elseif Ob==-27917 then
                bf=gb(de(Mb,bf))
                Ob=s(-329)
            elseif Ob==24336 then
                Ob=s(10810);
                break;
            elseif Ob==15513 then
                de=Mb.WaitForChild
                Ob=8385
            end
        end
    until Ob==-27109
end})
local wd=workspace:WaitForChild('Spawns'):WaitForChild('TeleportSpawns')
local W={}
local hg={}
for Wc,Xc in ipairs(wd:GetChildren())do
    local Ra,zd,Nf,jg,Ue
    Nf,zd={[25363]=-18425,[14913]=-18877,[3591]=-20373,[-9454]=4266,[12341]=-18425,[-16120]=4266,[10953]=-5307,[25271]=19917,[-9831]=-18877,[28302]=-5307,[-13713]=25,[13287]=-25879,[27743]=14787,[-12565]=-1183,[-27252]=4266},function(ih)
        return Nf[ih+-27158]
    end
    jg=zd(40445)
    repeat
        while true do
            if jg==-18877 then
                Ra=table.insert
                jg=753
            elseif jg==-18425 then
                jg=zd(13445);
                break;
            elseif jg==4266 then
                Ra=Xc.Position
                jg=zd(55460)
            elseif jg==-20373 then
                Ra=Ra(W,Ue)
                jg=zd(11038)
            elseif jg==-5307 then
                hg[Xc.Name]=Ra;
                jg=zd(39499)
            elseif jg==753 then
                Ue=Xc.Name
                jg=zd(30749)
            elseif jg==-25879 then
                if Xc:IsA('BasePart')then
                    jg=zd(17327)
                    break
                end
                jg=zd(52521)
            end
        end
    until jg==25
end
local Pe={}
local Ab={}
for Qd,nh in ipairs(rd:GetChildren())do
    local fe,Nb,zc,eb,Zb,uf,zg,ug
    ug,eb={[-15914]=7042,[-16096]=29092,[20006]=30267,[-25655]=22094,[28480]=15183,[31779]=15183,[15960]=6217,[2171]=15183,[-22014]=-9710,[-22138]=-27151,[-28929]=-9710,[24452]=22094,[14293]=-20719,[-12445]=-2619,[13541]=-1778,[18500]=-20329,[2391]=-4318,[-14807]=-7845,[-21100]=-9710,[-31165]=5458,[29173]=21771,[7304]=-317,[-1549]=-14527,[396]=29092,[32201]=-9710,[11926]=-23842,[-16758]=28301,[-31701]=7042,[-9816]=-9710,[27322]=22695,[-31745]=-2619,[-22874]=-22775},function(z)
        return ug[z-13393]
    end
    zg=eb(26934)
    repeat
        while true do
            if zg==-1778 then
                if nh:IsA('Model')and nh.PrimaryPart then
                    zg=eb(15784)
                    break
                end
                zg=-9710
            elseif zg==-9710 then
                zg=eb(25319);
                break;
            elseif zg==15183 then
                Zb=nh.PrimaryPart
                zg=eb(29353)
            elseif zg==-2619 then
                Nb=Zb;
                if Nb and Nb~=''then
                    zg=eb(40715)
                    break
                end
                zg=eb(45594)
            elseif zg==6217 then
                Zb=Zb.Position
                zg=eb(13789)
            elseif zg==-14527 then
                fe='PurchasePrompt'
                zg=26807
            elseif zg==29092 then
                Ab[Nb]=Zb;
                zg=eb(-7707)
            elseif zg==26807 then
                fe=gb(uf(Zb,fe))
                zg=eb(37845)
            elseif zg==22094 then
                zc=ub(fe[1],1,fe[2]);
                if zc and zc:IsA('ProximityPrompt')then
                    zg=eb(-3365)
                    break
                end
                zg=eb(-15536)
            elseif zg==-31211 then
                uf=Zb.FindFirstChild
                zg=eb(11844)
            elseif zg==22695 then
                Zb=table.insert
                zg=eb(42566)
            elseif zg==28301 then
                Zb=zc.ObjectText
                zg=eb(948)
            elseif zg==-4318 then
                Zb=nh
                zg=-31211
            elseif zg==21771 then
                Zb=Zb(Pe,Nb)
                zg=eb(41873)
            end
        end
    until zg==-23842
end
local _f=Wa:CreateDropdown({Name='Teleport to Purchasable',Options=Pe,CurrentOption={'Select Item'},MultipleOptions=false,Flag='PurchasableTP',Callback=function(Pc)
    local Y,Rd,he,Na,be,gf,Ld,Fe,D,ra,kb,X,Cb
    gf,Cb={[-24959]=-30933,[26724]=-15054,[13696]=21315,[13016]=3660,[20781]=25103,[-1160]=-29340,[-30781]=22568,[15484]=1432,[-30125]=-24020,[-16575]=-28320,[-16215]=-9938,[-22366]=-568,[8237]=28312,[-28945]=3252,[-5924]=-30438,[-1761]=-2749,[6411]=-24020,[10924]=-568,[-16472]=21469,[12044]=3252,[7157]=24114,[-26531]=18097,[-25690]=-16537,[-8398]=-8138,[-13797]=-31647,[-30384]=-20838,[-31498]=21315,[27324]=26517,[-26176]=-28320,[28702]=-2749,[-2137]=22568,[14185]=-23558,[30425]=-4210,[-24326]=-4534},function(ce)
        return gf[ce+-6894]
    end
    Rd=Cb(-6903)
    repeat
        while true do
            if Rd==21315 then
                X=Fe;
                Rd=Cb(-18796);
            elseif Rd==-9938 then
                Fe=Pc[Fe]
                Rd=Cb(13305)
            elseif Rd==26517 then
                ra=Fe.GetService
                Rd=19468
            elseif Rd==-30933 then
                he=gb(ra(Fe,he))
                Rd=Cb(5133)
            elseif Rd==-18036 then
                he=gb(ra(Fe,he))
                Rd=Cb(21079)
            elseif Rd==-4534 then
                if ra then
                    Rd=Cb(-9681)
                    break
                end
                Rd=17562
            elseif Rd==17562 then
                he=game:GetService('Players').LocalPlayer.CharacterAdded
                Rd=Cb(-9578)
            elseif Rd==-8138 then
                Rd=Cb(19910);
                break;
            elseif Rd==18097 then
                Y=gb(be(he))
                Rd=Cb(33618)
            elseif Rd==22568 then
                Fe=game
                Rd=Cb(34218)
            elseif Rd==19468 then
                he='Players'
                Rd=-18036
            elseif Rd==21469 then
                be=he.Wait
                Rd=Cb(-19637)
            elseif Rd==-13953 then
                ra=D
                Rd=Cb(-19282)
            elseif Rd==3252 then
                kb.CFrame=ub(Fe[1],1,Fe[2]);
                Rd=Cb(-1504)
            elseif Rd==30700 then
                Fe=CFrame.new
                Rd=23580
            elseif Rd==-2749 then
                kb=ub(he[1],1,he[2]);
                Rd=30700;
            elseif Rd==-24020 then
                Na=Fe;
                Rd=Cb(22378);
            elseif Rd==-28320 then
                Fe=ra
                Rd=Cb(-24604)
            elseif Rd==-568 then
                Ld=Fe;
                if Ld then
                    Rd=Cb(4757)
                    break
                end
                Rd=-8138
            elseif Rd==1897 then
                Fe=Fe.Character
                Rd=Cb(27675)
            elseif Rd==25103 then
                ra=Fe
                Rd=Cb(-17432)
            elseif Rd==-23558 then
                Fe=ub(he[1],1,he[2]).LocalPlayer
                Rd=1897
            elseif Rd==-31647 then
                Fe=1
                Rd=Cb(-9321)
            elseif Rd==-16537 then
                Fe=X
                Rd=Cb(15131)
            elseif Rd==23580 then
                Fe=gb(Fe(Ld))
                Rd=Cb(18938)
            elseif Rd==28312 then
                ra=Fe.WaitForChild
                Rd=-25703
            elseif Rd==1432 then
                Fe=Ab[Na]
                Rd=Cb(17818)
            elseif Rd==-15054 then
                D=ub(Y[1],1,Y[2])
                Rd=-13953
            elseif Rd==-25703 then
                he='HumanoidRootPart'
                Rd=Cb(-18065)
            end
        end
    until Rd==3660
end})
local ba=workspace:WaitForChild('World'):WaitForChild('NPCs')
local M={}
local ka={}
for cf,Gb in ipairs(ba:GetChildren())do
    local Ta,La,Bc,tg,sd
    La,Bc={[-21451]=9202,[17976]=-31597,[21224]=-26122,[9264]=-11912,[6481]=3908,[3869]=-26122,[-15205]=-7185,[11303]=1260,[27603]=-20455,[14789]=11422,[-10325]=-7185,[-19219]=-31597,[27552]=14181,[15428]=-17967,[19995]=31353},function(H)
        return La[H-22679]
    end
    tg=Bc(31943)
    repeat
        while true do
            if tg==-31597 then
                tg=Bc(38107);
                break;
            elseif tg==-26122 then
                ka[Gb.Name]=sd;
                tg=Bc(3460)
            elseif tg==11422 then
                sd=sd.Position
                tg=Bc(26548)
            elseif tg==9202 then
                Ta=Gb.Name
                tg=Bc(50282)
            elseif tg==-7185 then
                sd=Gb.PrimaryPart
                tg=Bc(37468)
            elseif tg==-11912 then
                if Gb:IsA('Model')and Gb.PrimaryPart then
                    tg=Bc(29160)
                    break
                end
                tg=Bc(40655)
            elseif tg==-20455 then
                sd=sd(M,Ta)
                tg=Bc(12354)
            elseif tg==3908 then
                sd=table.insert
                tg=Bc(1228)
            end
        end
    until tg==-17967
end
local Eb=Wa:CreateDropdown({Name='Teleport to NPCS',Options=M,CurrentOption={'Select NPC'},MultipleOptions=false,Flag='NPCTP',Callback=function(od)
    local Ic,sb,sa,j,bb,gd,qa,Kc,ua,Ed,t,Gc,Xf
    qa,ua={[-2270]=20926,[5320]=10403,[-32746]=16789,[15657]=-25717,[26975]=24247,[1865]=10403,[29695]=14884,[26477]=900,[-1389]=24247,[-30969]=-26302,[-31466]=16789,[-30680]=7337,[10803]=31863,[-5433]=-29994,[-31375]=28424,[23791]=19912,[397]=-3750,[-15814]=-25717,[12243]=7337,[-5116]=-19485,[-26714]=-15509,[15564]=12534,[31864]=-32001,[6267]=-29994,[1106]=-11597,[23555]=28277,[-18152]=-15509,[-16658]=-28682,[2474]=-7476},function(pd)
        return qa[pd+21114]
    end
    sb=ua(-51794)
    repeat
        while true do
            if sb==-8991 then
                bb=Ic+ub(bb[1],1,bb[2])
                sb=-11818
            elseif sb==-32664 then
                Kc=CFrame.new
                sb=ua(-37772)
            elseif sb==10403 then
                Xf=Kc;
                sb=-17244;
            elseif sb==24247 then
                Ic=Kc;
                if Ic then
                    sb=ua(-14847)
                    break
                end
                sb=12534
            elseif sb==20926 then
                t=ub(Ed[1],1,Ed[2])
                sb=29923
            elseif sb==-11597 then
                sa='HumanoidRootPart'
                sb=-12902
            elseif sb==10995 then
                bb=gb(bb(sa,gd,Ed))
                sb=-8991
            elseif sb==-15509 then
                Gc=ub(sa[1],1,sa[2]);
                sb=-32664;
            elseif sb==2789 then
                if bb then
                    sb=ua(-20717)
                    break
                end
                sb=-10682
            elseif sb==-12902 then
                sa=gb(bb(Kc,sa))
                sb=ua(-47828)
            elseif sb==-25717 then
                Gc.CFrame=ub(Kc[1],1,Kc[2]);
                sb=ua(-5550)
            elseif sb==-10682 then
                sa=Uf.CharacterAdded
                sb=28255
            elseif sb==-26302 then
                Ed=gb(gd(sa))
                sb=ua(-23384)
            elseif sb==7424 then
                Kc=od[Kc]
                sb=ua(-52580)
            elseif sb==12534 then
                sb=ua(10750);
                break;
            elseif sb==-29994 then
                Kc=Uf.Character
                sb=ua(2441)
            elseif sb==7337 then
                Kc=1
                sb=7424
            elseif sb==-30629 then
                Kc=ka[j]
                sb=ua(-22503)
            elseif sb==-11818 then
                Kc=gb(Kc(bb))
                sb=ua(-36928)
            elseif sb==5806 then
                gd=5
                sb=ua(-52489)
            elseif sb==31863 then
                sa=0
                sb=5806
            elseif sb==-28682 then
                bb=Vector3 .new
                sb=ua(-10311)
            elseif sb==28277 then
                bb=Kc
                sb=2789
            elseif sb==-17244 then
                Kc=Xf
                sb=ua(8581)
            elseif sb==29923 then
                bb=t
                sb=-3750
            elseif sb==-3750 then
                Kc=bb
                sb=ua(-15794)
            elseif sb==28255 then
                gd=sa.Wait
                sb=ua(-52083)
            elseif sb==14884 then
                bb=Kc.WaitForChild
                sb=ua(-20008)
            elseif sb==16789 then
                j=Kc;
                sb=-30629;
            elseif sb==28424 then
                Ed=0
                sb=10995
            end
        end
    until sb==-32001
end})
local Ha=Wa:CreateDropdown({Name='Teleport Spawns',Options=W,CurrentOption={'Select Spawn'},MultipleOptions=false,Flag='SpawnTP',Callback=function(fb)
    local Td,Ac,if_,ag,Se,Eg,Qb,rf,De,wf,qd,pf,K
    Qb,qd={[25601]=16723,[-13898]=-18365,[-9304]=-22760,[-20021]=19173,[14751]=15296,[-20066]=-10360,[6788]=16723,[-1409]=27193,[15093]=-1661,[-25336]=8273,[-17767]=-25208,[22543]=12016,[-17862]=-22092,[-1522]=-638,[13153]=31608,[-26177]=27193,[-17959]=11482,[-5164]=-8464,[-1434]=-1661,[-27979]=-25208,[31980]=-16125,[-18060]=8273,[-2389]=29432,[-19559]=16953,[-27751]=-10003,[27134]=15583,[-23403]=-16125,[-29164]=-30295,[-19023]=15296,[5652]=-20007,[1426]=13623},function(Wd)
        return Qb[Wd-11344]
    end
    if_=qd(26095)
    repeat
        while true do
            if if_==-7922 then
                pf=Ac.WaitForChild
                if_=qd(38478)
            elseif if_==16953 then
                Ac=De
                if_=-7922
            elseif if_==27193 then
                Se=ub(Eg[1],1,Eg[2]);
                if_=5959;
            elseif if_==29432 then
                Ac=hg[K]
                if_=qd(26437)
            elseif if_==8273 then
                Ac=pf
                if_=qd(-12059)
            elseif if_==12016 then
                pf=wf
                if_=qd(-6716)
            elseif if_==-16125 then
                De=Ac;
                if_=qd(-8215);
            elseif if_==-15286 then
                Eg=gb(pf(Ac,Eg))
                if_=qd(-14833)
            elseif if_==16723 then
                K=Ac;
                if_=qd(8955);
            elseif if_==11482 then
                Ac=Uf.Character
                if_=qd(-6518)
            elseif if_==5959 then
                Ac=CFrame.new
                if_=qd(12770)
            elseif if_==-8464 then
                Td=gb(ag(Eg))
                if_=qd(-8677)
            elseif if_==-22092 then
                pf=Ac
                if_=qd(2040)
            elseif if_==15583 then
                Eg='HumanoidRootPart'
                if_=-15286
            elseif if_==-22760 then
                if pf then
                    if_=qd(-13992)
                    break
                end
                if_=qd(-17820)
            elseif if_==-1661 then
                rf=Ac;
                if rf then
                    if_=qd(-6615)
                    break
                end
                if_=-18365
            elseif if_==-19986 then
                ag=Eg.Wait
                if_=qd(6180)
            elseif if_==13623 then
                Ac=gb(Ac(rf))
                if_=qd(-6423)
            elseif if_==1159 then
                Ac=fb[Ac]
                if_=qd(18132)
            elseif if_==-25208 then
                Se.CFrame=ub(Ac[1],1,Ac[2]);
                if_=qd(-2554)
            elseif if_==-30295 then
                Eg=Uf.CharacterAdded
                if_=-19986
            elseif if_==19173 then
                wf=ub(Td[1],1,Td[2])
                if_=qd(33887)
            elseif if_==-18365 then
                if_=qd(-16407);
                break;
            elseif if_==15296 then
                Ac=1
                if_=1159
            end
        end
    until if_==-10003
end})
local _b=ha:CreateSection('Movement')
local A=ha:CreateSlider({Name='Walkspeed',Range={0,100},Increment=1,Suffix='Speed',CurrentValue=16,Flag='Walkspeed',Callback=function(Ie)
    local gh,o,Qc
    o,Qc={[-25362]=-19153,[-12659]=26537,[21832]=26537,[14536]=30860,[-13321]=22810,[31584]=22810,[23777]=-18167,[-11293]=22810},function(ig)
        return o[ig-15742]
    end
    gh=Qc(39519)
    repeat
        while true do
            if gh==26537 then
                gh=Qc(-9620);
                break;
            elseif gh==-18167 then
                if Uf.Character and Uf.Character:FindFirstChildOfClass('Humanoid')then
                    gh=Qc(4449)
                    break
                end
                gh=Qc(37574)
            elseif gh==22810 then
                Uf.Character:FindFirstChildOfClass('Humanoid').WalkSpeed=Ie;
                gh=Qc(3083)
            end
        end
    until gh==-19153
end})
local ng=ha:CreateSlider({Name='FOV',Range={20,120},Increment=1,Suffix='FOV',CurrentValue=Jb.FieldOfView,Flag='FOV',Callback=function(wa)
    Jb.FieldOfView=wa;
end});
wg.JumpRequest:Connect(function()
    local vd,yd,Pg,oa,Vd,me
    oa,Pg={[-21389]=13449,[20458]=1749,[10286]=-6588,[-25226]=-4475,[-20845]=-4475,[8485]=-20013,[27574]=13861,[8068]=14931,[-25653]=-4475,[1494]=-4475},function(Id)
        return oa[Id-873]
    end
    me=Pg(-20516)
    repeat
        while true do
            if me==13861 then
                vd=yd(Vd,vd)
                me=Pg(2367)
            elseif me==22268 then
                vd=Enum.HumanoidStateType
                me=30756
            elseif me==-10761 then
                yd=Vd.ChangeState
                me=22268
            elseif me==13449 then
                if _h and Uf.Character and Uf.Character:FindFirstChildOfClass('Humanoid')then
                    me=Pg(11159)
                    break
                end
                me=Pg(-19972)
            elseif me==-6588 then
                Vd=Uf.Character:FindFirstChildOfClass('Humanoid')
                me=-10761
            elseif me==30756 then
                vd=vd.Jumping
                me=Pg(28447)
            elseif me==-4475 then
                me=Pg(21331);
                break;
            end
        end
    until me==1749
end);
Yd.Stepped:Connect(function()
    local Va,ff,jb,ch,Fb,xa,ga,re,of,We,pc,xa,cg,ff
    of,Va={[21965]=6499,[1665]=11559,[25300]=-6797,[1058]=25,[-7518]=27845,[19062]=-6797,[-19562]=6499,[9439]=6499,[-23468]=25,[-13307]=6499,[-25842]=25,[-2225]=6499,[4307]=-28163,[-28925]=-24027,[8501]=-30150,[-25105]=-27889,[6065]=14934,[-29100]=-30191,[-28604]=-28163,[-32624]=26912,[-8773]=13917,[13719]=-28029,[19289]=6499,[-32380]=4669,[32318]=139,[-24740]=-24280,[31841]=-7539,[-6297]=-30150,[-10122]=-11172,[3982]=-28163,[22075]=-7539,[8761]=-31392,[17394]=23190,[-30570]=16602,[-18878]=6499,[-11711]=23836,[7287]=6499,[-21315]=139,[623]=-30191,[30352]=24380,[14571]=27845,[-14290]=3299,[600]=23190,[13048]=19362,[-25728]=-24027},function(Aa)
        return of[Aa+22018]
    end
    Fb=Va(-47123)
    repeat
        while true do
            if Fb==-24027 then
                cg,ga,pc=ub(We[1],1,We[2]);
                Fb=Va(-2729)
            elseif Fb==27845 then
                cg,ga,pc=ub(We[1],1,We[2]);
                if Z(cg)~='function'then
                    Fb=Va(10300)
                    break
                end;
                Fb=Va(-24243);
            elseif Fb==-28163 then
                xa.CanCollide=false;
                Fb=Va(-35325)
            elseif Fb==6499 then
                ff,xa=cg(ga,pc);
                pc=ff;
                if pc==nil then
                    Fb=Va(-51118)
                else
                    Fb=-29629
                end
            elseif Fb==23190 then
                We=Uf.Character
                Fb=Va(-8970)
            elseif Fb==-30150 then
                re=ub(We[1],1,We[2]);
                if re~=nil and re.__iter~=nil then
                    Fb=Va(-54642)
                    break
                elseif Z(cg)=='table'then
                    Fb=Va(-13257)
                    break
                end
                Fb=Va(-12579)
            elseif Fb==-31392 then
                We=gb(qe(cg))
                Fb=Va(9823)
            elseif Fb==-9344 then
                ch=gb(jb(We))
                Fb=-20677
            elseif Fb==-20677 then
                We=gb(ipairs(ub(ch[1],1,ch[2])))
                Fb=Va(-7447)
            elseif Fb==-27889 then
                if Ub and Uf.Character then
                    Fb=Va(-21418)
                    break
                end
                Fb=-30191
            elseif Fb==32042 then
                We=gb(We(cg))
                Fb=Va(-50943)
            elseif Fb==139 then
                We=gb(Wf(cg))
                Fb=Va(-13517)
            elseif Fb==26912 then
                We=re.__iter
                Fb=32042
            elseif Fb==-29629 then
                if xa:IsA('BasePart')then
                    Fb=Va(-17711)
                    break
                end
                Fb=Va(-40896)
            elseif Fb==-7539 then
                cg,ga,pc=ub(We[1],1,We[2]);
                Fb=Va(-14731)
            elseif Fb==-30191 then
                Fb=Va(-33729);
                break;
            elseif Fb==19362 then
                jb=We.GetDescendants
                Fb=-9344
            end
        end
    until Fb==23836
end)
local R=ha:CreateToggle({Name='Fly',CurrentValue=false,Flag='Fly',Callback=function(Cg)
    Za=Cg;
end})
local jf=ha:CreateSlider({Name='Fly Speed',Range={10,250},Increment=1,Suffix='Speed',CurrentValue=50,Flag='FlySpeed',Callback=function(Ia)
    td=Ia;
end});
Yd.RenderStepped:Connect(function()
    local Ne,Bd,yb,Zd,lf,Jc,Ce,lb,Da
    Ce,lb={[-15763]=-4646,[-26755]=-6583,[-27212]=11078,[-10627]=-30884,[-17412]=2691,[22435]=30237,[-26574]=3512,[7725]=17616,[23119]=22306,[1498]=-28691,[14885]=-9101,[-29328]=4721,[27212]=27266,[-1878]=14256,[-235]=-30544,[17105]=-22747,[-31418]=31789,[29535]=8547,[4049]=30698,[6048]=-2752,[-20320]=22476,[-11593]=13780,[31278]=-9512,[-18864]=-24898,[16203]=-13175,[29784]=25277,[24878]=-6228,[-5528]=22476,[27743]=-18624,[-31207]=30698,[-30762]=25277,[-14865]=-28691,[16574]=-3041,[-8925]=25867,[23385]=3735,[-6590]=28962,[-26653]=-13353,[11716]=-6228,[-9383]=6136,[-27258]=21945,[-17191]=4809,[25326]=8842,[-30945]=9347,[-2173]=-29134,[4874]=-24898,[-18038]=25867,[26891]=31789,[-11620]=5741,[-1410]=13780,[24877]=18009,[-17569]=22306,[-21576]=17510,[26363]=5741,[11755]=-9512,[28554]=18009,[24170]=-3041,[-23008]=-13679,[10194]=23002,[-19261]=12913,[-8213]=16883,[-8745]=4809},function(Ib)
        return Ce[Ib+-26606]
    end
    Zd=lb(32)
    repeat
        while true do
            if Zd==13780 then
                lf+=yb;
                Zd=lb(-4156)
            elseif Zd==-13175 then
                if wg:IsKeyDown(Enum.KeyCode.E)then
                    Zd=lb(49725)
                    break
                end
                Zd=lb(56390)
            elseif Zd==-3041 then
                Bd=yb;
                Zd=28648;
            elseif Zd==-13644 then
                Jc=1
                Zd=-25737
            elseif Zd==-6583 then
                yb=yb.HumanoidRootPart
                Zd=lb(43180)
            elseif Zd==-18624 then
                yb=yb(Ne,Jc,Da)
                Zd=lb(57884)
            elseif Zd==4721 then
                Da=0
                Zd=lb(54349)
            elseif Zd==22306 then
                yb=Vector3 .new
                Zd=lb(15979)
            elseif Zd==18009 then
                lf=yb;
                if wg:IsKeyDown(Enum.KeyCode.W)then
                    Zd=lb(51484)
                    break
                end
                Zd=28962
            elseif Zd==-28691 then
                Bd.Velocity=yb;
                Zd=lb(-47)
            elseif Zd==25867 then
                lf-=yb;
                Zd=lb(9415)
            elseif Zd==-30884 then
                Ne=0
                Zd=-13644
            elseif Zd==-25737 then
                Da=0
                Zd=lb(17223)
            elseif Zd==-9512 then
                lf-=yb;
                Zd=lb(14986)
            elseif Zd==-2132 then
                yb=yb.LookVector
                Zd=lb(-4601)
            elseif Zd==-2752 then
                yb=Jb.CFrame
                Zd=lb(49991)
            elseif Zd==27266 then
                yb=yb.RightVector
                Zd=lb(21078)
            elseif Zd==28962 then
                if wg:IsKeyDown(Enum.KeyCode.S)then
                    Zd=lb(32654)
                    break
                end
                Zd=lb(17861)
            elseif Zd==17616 then
                yb=Uf.Character
                Zd=lb(-149)
            elseif Zd==5741 then
                yb=lf*td
                Zd=lb(11741)
            elseif Zd==30698 then
                lf+=yb;
                Zd=lb(20016)
            elseif Zd==-9101 then
                if wg:IsKeyDown(Enum.KeyCode.D)then
                    Zd=lb(5030)
                    break
                end
                Zd=-13175
            elseif Zd==12913 then
                Jc=1
                Zd=lb(-2722)
            elseif Zd==23830 then
                yb=yb.RightVector
                Zd=lb(7742)
            elseif Zd==22476 then
                lf-=yb;
                Zd=lb(41491)
            elseif Zd==-29134 then
                Ne=0
                Zd=lb(7345)
            elseif Zd==3735 then
                yb=yb.LookVector
                Zd=lb(8568)
            elseif Zd==28648 then
                yb=Vector3 .zero
                Zd=lb(51483)
            elseif Zd==25277 then
                if wg:IsKeyDown(Enum.KeyCode.Q)then
                    Zd=lb(53497)
                    break
                end
                Zd=lb(52969)
            elseif Zd==31789 then
                yb=Vector3 .new
                Zd=lb(24433)
            elseif Zd==-6228 then
                yb=Jb.CFrame
                Zd=-2132
            elseif Zd==-13353 then
                Zd=lb(-4339);
                break;
            elseif Zd==3512 then
                if Za and Uf.Character and Uf.Character:FindFirstChild('HumanoidRootPart')then
                    Zd=lb(34331)
                    break
                end
                Zd=-13353
            elseif Zd==6136 then
                yb=yb(Ne,Jc,Da)
                Zd=lb(15013)
            elseif Zd==8842 then
                yb=Jb.CFrame
                Zd=lb(53818)
            elseif Zd==4809 then
                if wg:IsKeyDown(Enum.KeyCode.A)then
                    Zd=lb(51932)
                    break
                end
                Zd=-9101
            elseif Zd==17510 then
                yb=Jb.CFrame
                Zd=23830
            elseif Zd==-24898 then
                lf+=yb;
                Zd=lb(42809)
            end
        end
    until Zd==9347
end)
local Md=ha:CreateSection('Player Teleport')
local function L()
    local S,Sg,xg,ef,ae,Ug,Df,Qe,Dc,Hg,Df,Kg,nc,ef,Lc
    nc,Lc={[15009]=-15085,[19646]=19889,[-13151]=-12481,[14767]=10218,[14997]=-7140,[30967]=-9898,[-6554]=-28769,[3973]=14757,[24763]=14757,[25335]=14757,[11959]=14757,[-31914]=-15085,[-28562]=-5046,[12969]=4190,[26474]=-16789,[311]=-32698,[28514]=-16789,[10120]=-16789,[12583]=4305,[18344]=-32698,[22447]=11250,[-20718]=-11212,[-3062]=4190,[9750]=-3008,[7642]=14757,[13265]=14757,[13905]=-19398,[-10105]=-28769,[-28768]=-306,[-6704]=-11212,[-25346]=16264,[-18048]=-23513,[27039]=24168,[19907]=-9898,[-32699]=-11958,[4554]=21952,[-4736]=-19398,[-15981]=19889,[30905]=24168,[13650]=14757,[-6589]=7836,[748]=-26526,[16737]=14757,[-1170]=16264,[3764]=-32514,[492]=-28769,[-7481]=14757,[8506]=14757,[28795]=12088,[27582]=-12623},function(yg)
        return nc[yg-23817]
    end
    Kg=Lc(38814)
    repeat
        while true do
            if Kg==-12623 then
                xg=gb(xg(S))
                Kg=Lc(43724)
            elseif Kg==-15085 then
                xg=gb(qe(S))
                Kg=Lc(36786)
            elseif Kg==-3008 then
                xg=Hg.__iter
                Kg=Lc(51399)
            elseif Kg==-16789 then
                return Ug
            elseif Kg==9010 then
                ae=ef.Name
                Kg=Lc(27581)
            elseif Kg==21952 then
                xg=gb(ipairs(ub(Dc[1],1,Dc[2])))
                Kg=Lc(17113)
            elseif Kg==-12481 then
                xg=kh
                Kg=13834
            elseif Kg==12088 then
                xg=gb(Wf(S))
                Kg=Lc(42161)
            elseif Kg==-32514 then
                xg=xg(Ug,ae)
                Kg=Lc(32323)
            elseif Kg==-7140 then
                xg={}
                Kg=Lc(50856)
            elseif Kg==-32698 then
                Hg=ub(xg[1],1,xg[2]);
                if Hg~=nil and Hg.__iter~=nil then
                    Kg=Lc(33567)
                    break
                elseif Z(S)=='table'then
                    Kg=Lc(-8097)
                    break
                end
                Kg=Lc(35776)
            elseif Kg==-19398 then
                xg=table.insert
                Kg=9010
            elseif Kg==-9898 then
                S,Qe,Sg=ub(xg[1],1,xg[2]);
                Kg=Lc(49152)
            elseif Kg==4190 then
                S,Qe,Sg=ub(xg[1],1,xg[2]);
                Kg=Lc(16336)
            elseif Kg==24168 then
                Ug=xg;
                Kg=Lc(10666);
            elseif Kg==28084 then
                Dc=gb(ae(xg))
                Kg=Lc(28371)
            elseif Kg==-8515 then
                if ef~=Uf then
                    Kg=Lc(19081)
                    break
                end
                Kg=Lc(37467)
            elseif Kg==14757 then
                Df,ef=S(Qe,Sg);
                Sg=Df;
                if Sg==nil then
                    Kg=Lc(52331)
                else
                    Kg=-8515
                end
            elseif Kg==13834 then
                ae=xg.GetPlayers
                Kg=28084
            elseif Kg==-11212 then
                S,Qe,Sg=ub(xg[1],1,xg[2]);
                if Z(S)~='function'then
                    Kg=Lc(52612)
                    break
                end;
                Kg=Lc(48580);
            end
        end
    until Kg==-15172
end
local gc=ha:CreateDropdown({Name='Teleport to Player',Options=L(),CurrentOption={'Select Player'},MultipleOptions=false,Flag='PlayerTP',Callback=function(Af)
    local lg,jc,pe,d,ea,Be,ab,Le,cd,Kb,vf,Db
    ea,ab={[7524]=3857,[-30631]=-22004,[-24862]=17915,[-13524]=-29073,[22714]=23477,[-7669]=20717,[17926]=9128,[-10370]=21361,[32096]=17791,[12813]=21361,[-6868]=-145,[-583]=24480,[-5488]=-23959,[-8213]=28537,[18013]=-1437,[-5254]=26500,[13108]=-28526,[3262]=17709,[8869]=-22004,[12590]=3857,[28721]=-32226,[-8567]=-4112,[-11640]=28689,[25571]=18438,[-4876]=-1141,[7669]=1303,[-18331]=17791,[22110]=-27481,[9301]=-15737,[22005]=-27924,[-32715]=-22004,[8318]=-7705,[-15436]=-1437,[27127]=24480,[23459]=26500},function(Ve)
        return ea[Ve-16163]
    end
    d=ab(10909)
    repeat
        while true do
            if d==21361 then
                Be=Le;
                d=ab(11287);
            elseif d==-1141 then
                Le=jc.Character
                d=ab(8494)
            elseif d==-29073 then
                lg=Uf.CharacterAdded
                d=18312
            elseif d==1303 then
                Kb=0
                d=ab(9295)
            elseif d==-31905 then
                cd=Vector3 .new
                d=ab(38877)
            elseif d==-145 then
                cd=gb(cd(lg,pe,Kb))
                d=10727
            elseif d==9128 then
                cd=Db
                d=18438
            elseif d==20717 then
                Le=Le.HumanoidRootPart
                d=ab(4523)
            elseif d==18312 then
                pe=lg.Wait
                d=ab(19425)
            elseif d==10727 then
                Le=Le+ub(cd[1],1,cd[2])
                d=ab(727)
            elseif d==-23959 then
                if cd then
                    d=ab(41734)
                    break
                end
                d=ab(2639)
            elseif d==10032 then
                cd=Le.FindFirstChild
                d=ab(7596)
            elseif d==-29358 then
                Le=kh
                d=10032
            elseif d==-28526 then
                Db=ub(Kb[1],1,Kb[2])
                d=ab(34089)
            elseif d==26500 then
                Le=1
                d=-16974
            elseif d==18438 then
                Le=cd
                d=ab(5793)
            elseif d==-16974 then
                Le=Af[Le]
                d=ab(23687)
            elseif d==-1437 then
                Be:WaitForChild('HumanoidRootPart').CFrame=Le;
                d=ab(-16552)
            elseif d==28689 then
                Le=Le.CFrame
                d=-31905
            elseif d==23477 then
                lg=0
                d=-15619
            elseif d==24480 then
                jc=ub(lg[1],1,lg[2]);
                if jc and jc.Character and jc.Character:FindFirstChild('HumanoidRootPart')then
                    d=ab(-2168)
                    break
                else
                    d=ab(-14468)
                    break
                end
                d=-22004
            elseif d==17709 then
                Kb=gb(pe(lg))
                d=ab(29271)
            elseif d==-4112 then
                lg=gb(cd(Le,vf))
                d=ab(15580)
            elseif d==-22004 then
                d=ab(38273);
                break;
            elseif d==17791 then
                Le=Uf.Character
                d=ab(38168)
            elseif d==-27924 then
                cd=Le
                d=ab(10675)
            elseif d==3857 then
                vf=Le;
                d=-29358;
            elseif d==-15619 then
                pe=5
                d=ab(23832)
            end
        end
    until d==-27481
end})
local wc,pa,fc,lh,bc,Ad,Zg,cc,eh
fc,lh={[8096]=-23602,[29042]=-4891,[-967]=-23861,[-31888]=1016,[22620]=3854,[-2236]=11479,[-16324]=-16637,[-8493]=-8373,[909]=-16637,[-12295]=-14158,[27169]=-8373,[-11438]=11479},function(Jd)
    return fc[Jd+5644]
end
bc=lh(-7880)
repeat
    while true do
        if bc==-8373 then
            bc=lh(2452);
            break;
        elseif bc==-14158 then
            eh='Phoenix Hub'
            bc=5915
        elseif bc==15360 then
            Ad=wc.CreateButton
            bc=4443
        elseif bc==5915 then
            Zg='Loaded Successfully! :D'
            bc=lh(23398)
        elseif bc==-4891 then
            cc=5
            bc=-7931
        elseif bc==11479 then
            wc=ha
            bc=15360
        elseif bc==-23861 then
            wc=Cf
            bc=2705
        elseif bc==-16637 then
            pa=ub(eh[1],1,eh[2]);
            bc=lh(-6611);
        elseif bc==-7931 then
            eh={Title=eh,Content=Zg,Duration=cc}
            bc=-32170
        elseif bc==2705 then
            Ad=wc.Notify
            bc=lh(-17939)
        elseif bc==22255 then
            eh=gb(Ad(wc,eh))
            bc=lh(-4735)
        elseif bc==4443 then
            eh='Refresh Player List'
            bc=6934
        elseif bc==-32170 then
            eh=Ad(wc,eh)
            bc=lh(-14137)
        elseif bc==6934 then
            eh={Name=eh,Callback=function()
                local bh,_d,Rf,Ag,aa,Ya
                Ya,aa={[31350]=237,[31911]=23154,[-28574]=19290,[-21985]=-11418,[-19224]=23154,[23263]=-1430,[18591]=-1430},function(Ka)
                    return Ya[Ka+7467]
                end
                bh=aa(24444)
                repeat
                    while true do
                        if bh==19290 then
                            Ag=_d(Rf,ub(Ag[1],1,Ag[2]))
                            bh=aa(15796)
                        elseif bh==-13323 then
                            Ag=gb(L())
                            bh=aa(-36041)
                        elseif bh==-1430 then
                            bh=aa(23883);
                            break;
                        elseif bh==23154 then
                            Rf=gc
                            bh=1371
                        elseif bh==1371 then
                            _d=Rf.Refresh
                            bh=-13323
                        end
                    end
                until bh==237
            end}
            bc=22255
        end
    end
until bc==-23602
