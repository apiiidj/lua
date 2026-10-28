-- This file was protected using Luraph Obfuscator v14.4.2 [https://lura.ph/]

local T,ya,wc,Za,ec,ab=bit32.bxor,getmetatable,type,pairs
local Ia,S,hc,Y,qc,jb,cb,Ua,Ob,Ka,Fb,Da,ra,Ea,Ib,Zb,yb,dc,la,cc,ob,uc,ia,sc,Ab,nb,R,Ya,Pb,yc;
Da=(select);
Ia=(function(...)
    return{[1]={...},[2]=Da('#',...)}
end);
R=((function()
    local function gc(tb,Gb,lc)
        if Gb>lc then
            return
        end
        return tb[Gb],gc(tb,Gb+1,lc)
    end
    return gc
end)());
yb,qc=(string.gsub),(string.char);
uc=(function(p)
    p=yb(p,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(p:gsub('.',function(G)
        if(G=='=')then
            return''
        end
        local t_,ka='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(G)-1)
        for pb=6,1,-1 do
            t_=t_..(ka%2^pb-ka%2^(pb-1)>0 and'1'or'0')
        end
        return t_
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(P)
        if(#P~=8)then
            return''
        end
        local E=0
        for ic=1,8 do
            E=E+(P:sub(ic,ic)=='1'and 2^(8-ic)or 0)
        end
        return qc(E)
    end))
end);
yc,Fb,cc,Ka,Y,Ab,jb,dc=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
hc=(function(_a)
    local qa=dc[_a]
    if qa then
        return qa
    end
    local wb,Tb,gb,x,Bc=Ka(1,11),Ka(1,5),1,{},''
    while gb<=#_a do
        local Bb=cc(_a,gb);
        gb=gb+1
        for k=1,8 do
            local j=nil
            if Ab(Bb,1)~=0 then
                if gb<=#_a then
                    j=Fb(_a,gb,gb);
                    gb=gb+1
                end
            else
                if gb+1<=#_a then
                    local bc=yc('>I2',_a,gb);
                    gb=gb+2
                    local Gc,ca=#Bc-Y(bc,5),Ab(bc,(Tb-1))+3;
                    j=Fb(Bc,Gc,Gc+ca-1)
                end
            end
            Bb=Y(Bb,1)
            if j then
                x[#x+1]=j;
                Bc=Fb(Bc..j,-wb)
            end
        end
    end
    local y=jb(x);
    dc[_a]=y
    return y
end)
local L,xa,Na,d_,Oa,F,ib,ea,Nb,g,lb,s_,J,Sa,Pa,db,rb,ma,B,kc,oc,X,nc,f_,e_,n_,Cc,bb,xb,Ub=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[53060]={{9,4,false},{2,10,true},{2,4,false},{6,10,true},{7,9,false},{0,2,false},{2,9,false},{2,10,false},{6,3,false},{0,0,false},{6,3,true},{6,0,true},{2,2,false},{9,5,false},{6,0,false},{10,2,true},{6,9,false},{9,2,false},{2,9,false},{10,2,false},{10,9,false},{7,2,true},{9,5,true},{6,2,false},{10,2,false},{0,8,false},{6,2,true},{9,5,false},{6,8,false},{6,2,true},{9,2,false},{7,3,true},{9,10,false},{6,2,false},{10,9,false},{6,0,true},{6,0,true},{10,5,true},{6,5,false},{10,2,false},{7,4,true},{6,2,false},{10,10,false},{6,0,true},{2,3,true},{0,8,true},{7,4,true},{2,4,false},{6,2,false},{10,2,false},{6,0,true},{10,2,false},{0,7,true},{2,5,true},{6,3,true},{6,2,false},{9,3,true},{10,2,false},{6,2,false},{6,3,false},{6,3,false},{10,0,true},{6,2,false},{6,3,false},{0,4,true},{6,2,false},{0,3,true},{2,8,true},{0,8,true},{0,5,true},{7,8,true},{9,2,false},{10,8,true},{6,2,false},{2,9,false},{10,2,true},{10,9,false},{6,5,true},{6,2,false},{9,9,false},{6,0,true},{6,3,false},{7,3,false},{7,7,false},{6,5,true},{2,7,true},{9,4,true},{6,7,false},{0,3,true},{7,10,false},{0,9,true},{6,2,false},{6,2,false},{6,0,true},{6,2,false},{6,8,false},{6,2,false},{2,9,true},{10,2,false},{7,7,true},{0,4,true},{2,4,false},{10,5,false},{0,4,true},{9,4,false},{7,10,true},{0,1,false},{6,0,false},{7,2,true},{9,7,false},{0,5,true},{6,2,false},{6,2,false},{6,3,false},{10,4,true},{6,2,false},{2,7,false},{6,3,false},{6,3,false},{0,5,true},{9,9,false},{10,7,false},{7,7,false},{10,8,false},{10,10,false},{2,3,false},{10,9,true},{10,2,false},{7,3,true},{6,10,true},{7,3,false},{6,0,false},{6,2,false},{0,7,true},{2,8,true},{10,3,false},{7,7,false},{6,2,false},{2,5,true},{6,2,false},{10,5,true},{2,4,true},{6,2,false},{7,8,false},{2,7,false},{9,8,true},{0,2,true},{9,2,false},{10,2,false},{10,8,true},{6,5,false},{10,3,true},{6,2,false},{0,3,true},{9,8,true},{9,3,true},{10,10,true},{10,2,true},{0,4,false},{10,2,false},{2,7,true},{6,2,false},{2,7,true},{9,2,true},{6,0,true},{7,8,true},{2,8,true},{2,7,false},{6,7,true},{6,7,false},{6,9,true},{6,2,true},{0,3,true},{6,6,false},{2,4,true},{10,3,false},{9,10,true},{0,0,false},{0,4,true},{6,2,false},{7,8,true},{0,8,false},{7,10,true},{10,2,false},{10,2,true},{6,7,false},{2,4,true},{10,5,true},{6,2,false},{10,2,true},{6,2,false},{0,2,false},{10,7,true},{6,2,false},{0,10,false},{2,8,true},{2,2,false},{0,0,true},{2,2,false},{7,5,true},{7,7,true},{10,4,true},{10,2,false},{2,4,true},{9,8,true},{10,9,false},{7,5,false},{2,0,true},{10,9,true},{6,5,false},{6,2,false},{6,2,false},{10,2,false},{2,8,false},{10,10,true},{6,9,false},{10,3,false},{9,9,false},{10,7,false},{10,7,false},{6,0,false},{2,4,false},{7,2,false},{10,8,true},{6,2,false},{6,8,false},{2,10,false},{9,8,true},{0,0,true},{2,0,true},{10,7,false},{10,9,true},{6,2,false},{10,2,true},{0,9,true},{9,7,true},{10,3,true},{7,8,true},{7,8,false},{7,8,true},{6,0,true},{9,0,false},{10,2,false},{7,0,true},{6,0,true},{6,7,false},{9,7,true},{7,4,true},{7,2,true},{7,9,false},{2,3,true},{7,0,true},{6,10,true},{10,2,true},{2,2,false},{0,8,true}},[9949]={},[3210]={}}
local eb=(function(La)
    local A=Ub[9949][La]
    if A then
        return A
    end
    local vc=1
    local function Sb()
        local oa,Hb,mb,jc,Rb,Cb,Mb,Vb,hb,q,ba,pa,Ra,Wb,D,I,zc,M,ga,i_,o_,C,Z,na,U,va,Kb,xc,Ec,ac,K,u_;
        zc,Cb={},function(zb,Ha,c)
            zc[zb]=T(Ha,44342)-T(c,23808)
            return zc[zb]
        end;
        xc=zc[22444]or Cb(22444,99840,44003)
        while xc~=31004 do
            if xc<35402 then
                if xc<17373 then
                    if xc>=12654 then
                        if xc<=16032 then
                            if xc<=13660 then
                                if xc>13196 then
                                    if xc>13395 then
                                        Kb=Nb('B',La,vc);
                                        vc,xc=vc+1,1461
                                    else
                                        Ra,xc=nil,13660
                                    end
                                elseif xc>13142 then
                                    D,xc=f_(ga,167662014),zc[29734]or Cb(29734,104055,5501)
                                    continue
                                elseif xc>12654 then
                                    Mb[6533]=e_(Cc(na,8),255);
                                    Mb[38126]=e_(Cc(na,16),255);
                                    Mb[22723],xc=e_(Cc(na,24),255),zc[-6659]or Cb(-6659,121892,50419)
                                else
                                    o_[59461],xc=xb(o_[52029],0,16),zc[-19172]or Cb(-19172,93365,35054)
                                end
                            elseif xc<=15815 then
                                if xc<=13814 then
                                    hb=hb+K;
                                    na=hb
                                    if hb~=hb then
                                        xc=zc[21499]or Cb(21499,120797,51981)
                                    else
                                        xc=zc[18231]or Cb(18231,72062,48747)
                                    end
                                else
                                    q=o_
                                    if q==6 then
                                        xc=zc[-26999]or Cb(-26999,28730,49368)
                                        continue
                                    elseif q==1 then
                                        xc=zc[-16498]or Cb(-16498,92884,33414)
                                        continue
                                    elseif q==3 then
                                        xc=zc[-24310]or Cb(-24310,91468,48233)
                                        continue
                                    end
                                    xc=zc[-14473]or Cb(-14473,119648,56237)
                                end
                            else
                                xc,M=zc[15884]or Cb(15884,123485,3112),i_
                                continue
                            end
                        elseif xc>=16517 then
                            if xc<16552 then
                                q=Nb('B',La,vc);
                                vc,xc=vc+1,zc[-14906]or Cb(-14906,112018,53827)
                            elseif xc>16552 then
                                I,xc=Z,zc[-19019]or Cb(-19019,68626,62587)
                            else
                                C=Nb('<d',La,vc);
                                xc,vc=35402,vc+8
                            end
                        elseif xc<=16180 then
                            if xc<=16145 then
                                U=U+u_;
                                K=U
                                if U~=U then
                                    xc=zc[23753]or Cb(23753,55010,5448)
                                else
                                    xc=40205
                                end
                            else
                                xc,I=zc[12893]or Cb(12893,106378,26131),nil
                            end
                        else
                            I,xc=R(Z[1],1,Z[2]),zc[-8547]or Cb(-8547,76134,53671)
                        end
                    elseif xc>=9338 then
                        if xc>11008 then
                            if xc>11859 then
                                K=K+o_;
                                q=K
                                if K~=K then
                                    xc=zc[13541]or Cb(13541,71753,40451)
                                else
                                    xc=34420
                                end
                            elseif xc>11301 then
                                o_=Nb('B',La,vc);
                                xc,vc=23983,vc+1
                            else
                                xc,o_=zc[29575]or Cb(29575,63668,18941),nil
                            end
                        elseif xc<10722 then
                            if xc>9338 then
                                xc,mb=zc[6058]or Cb(6058,119127,54611),f_(va,77)
                                continue
                            else
                                ac,mb,xc=Hb,nil,18782
                            end
                        elseif xc<=10722 then
                            Z=Nb('B',La,vc);
                            vc,xc=vc+1,32262
                        else
                            if(D>=0 and oa>pa)or((D<0 or D~=D)and oa<pa)then
                                xc=zc[-10259]or Cb(-10259,102078,7157)
                            else
                                xc=zc[-17417]or Cb(-17417,55214,11017)
                            end
                        end
                    elseif xc>1726 then
                        if xc>5042 then
                            q=K
                            if na~=na then
                                xc=zc[25452]or Cb(25452,100460,28638)
                            else
                                xc=34420
                            end
                        elseif xc>3147 then
                            xc,jc=26916,nil
                        else
                            xc,na=zc[11194]or Cb(11194,64175,29766),nil
                        end
                    elseif xc>1547 then
                        xc=zc[25894]or Cb(25894,80760,65234)
                        continue
                    elseif xc<1461 then
                        U,xc=nil,21832
                    elseif xc<=1461 then
                        Ra,xc=f_(Kb,77),18351
                        continue
                    else
                        Mb=0;
                        M,xc,Vb,i_=0,39027,1,4
                    end
                elseif xc<26524 then
                    if xc>=23561 then
                        if xc<23983 then
                            if xc<23585 then
                                na=na+q;
                                I=na
                                if na~=na then
                                    xc=47726
                                else
                                    xc=zc[15266]or Cb(15266,112181,11444)
                                end
                            elseif xc>23585 then
                                D=D+U;
                                hb=D
                                if D~=D then
                                    xc=zc[24536]or Cb(24536,21932,17196)
                                else
                                    xc=47493
                                end
                            else
                                Mb[6533]=e_(Cc(na,8),255);
                                M=e_(Cc(na,16),65535);
                                Mb[11306]=M;
                                i_=nil;
                                i_=if M<32768 then M else M-65536;
                                xc,Mb[59291]=zc[8337]or Cb(8337,17358,19161),i_
                            end
                        elseif xc>=24752 then
                            if xc>24752 then
                                xc=zc[-15174]or Cb(-15174,107565,29064)
                                continue
                            else
                                K,xc=nil,19546
                            end
                        elseif xc>23983 then
                            xc,u_=24752,nil
                        else
                            na,xc=f_(o_,77),zc[16375]or Cb(16375,100795,52960)
                            continue
                        end
                    elseif xc<=19546 then
                        if xc<18782 then
                            if xc>17373 then
                                Kb,Hb,xc=Ra,nil,40422
                            else
                                hb,xc=nil,51722
                            end
                        elseif xc<=18782 then
                            va=Nb('B',La,vc);
                            xc,vc=zc[25698]or Cb(25698,25203,63633),vc+1
                        else
                            na=Nb('<I4',La,vc);
                            xc,vc=zc[-20305]or Cb(-20305,71286,40649),vc+4
                        end
                    elseif xc<21623 then
                        if(K>=0 and hb>u_)or((K<0 or K~=K)and hb<u_)then
                            xc=17373
                        else
                            xc=zc[-5288]or Cb(-5288,81061,42345)
                        end
                    elseif xc<=21623 then
                        I=na
                        if o_~=o_ then
                            xc=47726
                        else
                            xc=zc[-17766]or Cb(-17766,112595,11414)
                        end
                    else
                        hb=Nb('B',La,vc);
                        xc,vc=43677,vc+1
                    end
                elseif xc>30688 then
                    if xc>32262 then
                        if xc>34451 then
                            xc,o_=15815,f_(q,77)
                            continue
                        elseif xc<=34420 then
                            if(o_>=0 and K>na)or((o_<0 or o_~=o_)and K<na)then
                                xc=zc[-5424]or Cb(-5424,101337,26995)
                            else
                                xc=zc[-1623]or Cb(-1623,119270,59941)
                            end
                        else
                            if(Vb>=0 and M>i_)or((Vb<0 or Vb~=Vb)and M<i_)then
                                xc=zc[20955]or Cb(20955,115664,63155)
                            else
                                xc=zc[7129]or Cb(7129,58595,27427)
                            end
                        end
                    elseif xc<32017 then
                        if xc<=30804 then
                            o_[59461],xc=U[o_[1640]+1],zc[-26306]or Cb(-26306,94736,44689)
                        else
                            M,xc=f_(i_,-554772179),zc[-22661]or Cb(-22661,22063,29557)
                            continue
                        end
                    elseif xc>32017 then
                        xc,I=zc[7354]or Cb(7354,120191,51227),f_(Z,77)
                        continue
                    else
                        M=M+Vb;
                        Ec=M
                        if M~=M then
                            xc=zc[4753]or Cb(4753,127453,50360)
                        else
                            xc=34451
                        end
                    end
                elseif xc>=26985 then
                    if xc<27322 then
                        if xc>26985 then
                            u_=hb;
                            K=Pa(u_);
                            o_,q,na,xc=u_,1,1,21623
                        else
                            M,i_=e_(Cc(na,8),16777215),nil;
                            i_=if M<8388608 then M else M-16777216;
                            Mb[1640],xc=i_,zc[-16553]or Cb(-16553,90846,42441)
                        end
                    elseif xc>27322 then
                        K=U
                        if hb~=hb then
                            xc=zc[-28777]or Cb(-28777,14444,15566)
                        else
                            xc=40205
                        end
                    else
                        xc,pa=zc[7795]or Cb(7795,107793,63062),u_
                    end
                elseif xc>=26580 then
                    if xc>26580 then
                        Wb=Nb('B',La,vc);
                        vc,xc=vc+1,36553
                    else
                        I=o_[52029];
                        Z,C=Cc(I,30),e_(Cc(I,20),1023);
                        o_[59461]=U[C+1];
                        o_[9554]=Z
                        if Z==2 then
                            xc=zc[-8141]or Cb(-8141,77308,45204)
                            continue
                        elseif Z==3 then
                            xc=zc[4198]or Cb(4198,128785,60809)
                            continue
                        end
                        xc=zc[-8306]or Cb(-8306,73441,38210)
                    end
                elseif xc>26524 then
                    i_=Nb('c'..Mb,La,vc);
                    vc,xc=vc+Mb,16032
                else
                    hb=U;
                    ba=nc(ba,bb(e_(hb,127),ga*7))
                    if not n_(hb,128)then
                        xc=zc[23477]or Cb(23477,103611,34242)
                        continue
                    end
                    xc=zc[-22624]or Cb(-22624,119614,53917)
                end
            elseif xc>51722 then
                if xc<=59484 then
                    if xc>=56467 then
                        if xc>58590 then
                            if xc<59153 then
                                na=hb
                                if u_~=u_ then
                                    xc=zc[-29033]or Cb(-29033,97625,46737)
                                else
                                    xc=zc[26754]or Cb(26754,104685,14846)
                                end
                            elseif xc>59153 then
                                xc,Z=59964,Ia(nil)
                            else
                                xc,Z=zc[-11005]or Cb(-11005,62339,17165),nil
                            end
                        elseif xc>57365 then
                            if xc<=58158 then
                                Z=I;
                                u_=nc(u_,bb(e_(Z,127),q*7))
                                if not n_(Z,128)then
                                    xc=zc[8883]or Cb(8883,12630,51362)
                                    continue
                                end
                                xc=zc[-24572]or Cb(-24572,4302,53444)
                            else
                                K,hb,xc,u_=1,1,zc[26055]or Cb(26055,16671,4059),ba
                            end
                        elseif xc>=56486 then
                            if xc<=56486 then
                                K[I],xc=Sb(),zc[-914]or Cb(-914,107958,61815)
                            else
                                xc,o_[59461]=zc[9249]or Cb(9249,70652,36405),U[o_[52029]+1]
                            end
                        else
                            Rb,xc=f_(ba,167662014),zc[-6628]or Cb(-6628,100596,24908)
                            continue
                        end
                    elseif xc>=55071 then
                        if xc<=55365 then
                            if xc>55297 then
                                ga=oa
                                if pa~=pa then
                                    xc=zc[12354]or Cb(12354,116702,54101)
                                else
                                    xc=zc[-27246]or Cb(-27246,39511,20833)
                                end
                            elseif xc<=55071 then
                                if C then
                                    xc=zc[10455]or Cb(10455,7319,16689)
                                    continue
                                end
                                xc=zc[-22287]or Cb(-22287,31320,19177)
                            else
                                ga=0;
                                xc,U,hb,u_=zc[27655]or Cb(27655,2465,29111),0,4,1
                            end
                        else
                            D,xc=nil,zc[-22141]or Cb(-22141,126593,14006)
                        end
                    elseif xc<52610 then
                        i_=M;
                        Mb[52029]=i_;
                        db(oa,{});
                        xc=zc[8279]or Cb(8279,81308,35877)
                    elseif xc>52610 then
                        if(K>=0 and hb>u_)or((K<0 or K~=K)and hb<u_)then
                            xc=zc[-24224]or Cb(-24224,91551,48843)
                        else
                            xc=zc[13917]or Cb(13917,10422,1115)
                        end
                    else
                        xc=zc[26336]or Cb(26336,575,9853)
                        continue
                    end
                elseif xc>=62076 then
                    if xc>=63067 then
                        if xc<=63401 then
                            if xc>63351 then
                                U[na],xc=I,zc[24793]or Cb(24793,107396,34236)
                            elseif xc<=63067 then
                                Mb=C
                                if Mb==0 then
                                    xc=zc[-32338]or Cb(-32338,127072,11394)
                                    continue
                                else
                                    xc=zc[16156]or Cb(16156,121320,55158)
                                    continue
                                end
                                xc=zc[-8468]or Cb(-8468,71600,36170)
                            else
                                xc,K=49397,f_(na,-554772179)
                                continue
                            end
                        else
                            Z,xc=Ia(M),zc[-23879]or Cb(-23879,57644,20738)
                            continue
                        end
                    elseif xc<=62148 then
                        if xc<=62076 then
                            hb,xc=f_(u_,167662014),27150
                            continue
                        else
                            ga=D;
                            U=Pa(ga);
                            u_,xc,K,hb=ga,58592,1,1
                        end
                    else
                        va,xc,Rb=mb,zc[-24984]or Cb(-24984,19921,6778),nil
                    end
                elseif xc<60309 then
                    if xc<=59964 then
                        if xc>59766 then
                            xc,C=zc[-16842]or Cb(-16842,59018,6321),nil
                        else
                            ba=Rb;
                            oa,pa=Pa(ba),false;
                            ga,xc,U,D=ba,zc[-24762]or Cb(-24762,69173,33870),1,1
                        end
                    else
                        M,xc=nil,zc[-4062]or Cb(-4062,104394,36414)
                    end
                elseif xc<60372 then
                    hb=hb+K;
                    na=hb
                    if hb~=hb then
                        xc=17373
                    else
                        xc=zc[2515]or Cb(2515,24428,50100)
                    end
                elseif xc>60372 then
                    oa=oa+D;
                    ga=oa
                    if oa~=oa then
                        xc=zc[15757]or Cb(15757,106393,2844)
                    else
                        xc=11008
                    end
                else
                    Z,xc=Ia'',16408
                    continue
                end
            elseif xc<40422 then
                if xc<=38060 then
                    if xc<37686 then
                        if xc<=36642 then
                            if xc<=36553 then
                                if xc<=35402 then
                                    Z,xc=C,16881
                                    continue
                                else
                                    jc,xc=f_(Wb,77),zc[-11829]or Cb(-11829,27134,28112)
                                    continue
                                end
                            else
                                xc,pa=zc[-23406]or Cb(-23406,4821,15890),false
                            end
                        else
                            o_=na;
                            ga=nc(ga,bb(e_(o_,127),K*7))
                            if not n_(o_,128)then
                                xc=zc[-3750]or Cb(-3750,25532,23560)
                                continue
                            end
                            xc=zc[-25179]or Cb(-25179,51941,30146)
                        end
                    elseif xc<=38053 then
                        if xc<=37880 then
                            if xc>37686 then
                                Wb=jc;
                                Mb=nc(Mb,bb(e_(Wb,127),Ec*7))
                                if not n_(Wb,128)then
                                    xc=zc[26559]or Cb(26559,102724,52887)
                                    continue
                                end
                                xc=zc[-20333]or Cb(-20333,130358,36847)
                            else
                                Mb=e_(Cc(I,10),1023);
                                o_[13669],xc=U[Mb+1],zc[22070]or Cb(22070,124112,849)
                            end
                        else
                            xc,o_[59461]=zc[-19668]or Cb(-19668,83015,41180),U[o_[59291]+1]
                        end
                    else
                        i_=Nb('<I4',La,vc);
                        vc,xc=vc+4,zc[-4739]or Cb(-4739,32126,2796)
                    end
                elseif xc>39246 then
                    if xc>39277 then
                        if(u_>=0 and U>hb)or((u_<0 or u_~=u_)and U<hb)then
                            xc=zc[-28731]or Cb(-28731,111459,47049)
                        else
                            xc=3147
                        end
                    else
                        ba=0;
                        xc,oa,pa,D=55365,0,4,1
                    end
                elseif xc<=39210 then
                    if xc>=39027 then
                        if xc<=39027 then
                            Ec=M
                            if i_~=i_ then
                                xc=zc[-25178]or Cb(-25178,98892,12615)
                            else
                                xc=34451
                            end
                        else
                            o_=oa[na];
                            q=o_[12476]
                            if q==0 then
                                xc=zc[-20850]or Cb(-20850,130383,11620)
                                continue
                            elseif q==7 then
                                xc=zc[11300]or Cb(11300,75310,43891)
                                continue
                            elseif q==10 then
                                xc=zc[5864]or Cb(5864,31402,64302)
                                continue
                            elseif q==5 then
                                xc=zc[-2422]or Cb(-2422,15266,29632)
                                continue
                            elseif q==1 then
                                xc=zc[-1119]or Cb(-1119,5180,7606)
                                continue
                            end
                            xc=zc[14229]or Cb(14229,127597,11974)
                        end
                    else
                        xc,M=38060,nil
                    end
                else
                    na=hb
                    if u_~=u_ then
                        xc=17373
                    else
                        xc=21414
                    end
                end
            elseif xc<47493 then
                if xc>43343 then
                    if xc<43677 then
                        Mb,M=e_(Cc(I,10),1023),e_(Cc(I,0),1023);
                        o_[13669]=U[Mb+1];
                        o_[1271],xc=U[M+1],zc[29913]or Cb(29913,20780,19845)
                    elseif xc<=43677 then
                        U,xc=f_(hb,77),26524
                        continue
                    else
                        Hb,xc=f_(ac,77),zc[-29198]or Cb(-29198,26441,64261)
                        continue
                    end
                elseif xc>=43227 then
                    if xc<=43227 then
                        xc=zc[-29666]or Cb(-29666,114347,3434)
                        continue
                    else
                        if(q>=0 and na>o_)or((q<0 or q~=q)and na<o_)then
                            xc=47726
                        else
                            xc=zc[-31725]or Cb(-31725,123665,11393)
                        end
                    end
                elseif xc>40422 then
                    if pa then
                        xc=zc[-31741]or Cb(-31741,107670,10110)
                        continue
                    else
                        xc=zc[26339]or Cb(26339,4105,511)
                        continue
                    end
                    xc=zc[4037]or Cb(4037,2538,5387)
                else
                    ac=Nb('B',La,vc);
                    vc,xc=vc+1,45146
                end
            elseif xc>=49971 then
                if xc<=51637 then
                    if xc<50603 then
                        C,xc=f_(Mb,167662014),63067
                        continue
                    elseif xc<=50603 then
                        xc,I=zc[14086]or Cb(14086,23276,37112),nil
                    else
                        hb=D
                        if ga~=ga then
                            xc=zc[29196]or Cb(29196,124530,11734)
                        else
                            xc=47493
                        end
                    end
                else
                    u_=0;
                    na,K,o_,xc=4,0,1,5977
                end
            elseif xc<=49029 then
                if xc>47726 then
                    xc,u_=zc[31039]or Cb(31039,25038,16190),C
                    continue
                elseif xc<=47493 then
                    if(U>=0 and D>ga)or((U<0 or U~=U)and D<ga)then
                        xc=55918
                    else
                        xc=zc[8714]or Cb(8714,22987,4722)
                    end
                else
                    return{[51045]=va,[47607]='',[16705]=oa,[41309]=K,[47890]=Kb,[51023]=ac}
                end
            else
                na=K;
                o_=e_(na,255);
                q=Ub[53060][o_+1];
                I,Z,C=q[1],q[2],q[3];
                Mb={[59291]=0,[1271]=0,[13669]=0,[10311]=0,[42337]=nil,[50283]=o_,[59461]=0,[12476]=Z,[52029]=0,[11306]=0,[9554]=0,[38126]=0,[1640]=0,[6533]=0,[22723]=0};
                db(oa,Mb)
                if I==10 then
                    xc=zc[3964]or Cb(3964,108660,62497)
                    continue
                elseif I==6 then
                    xc=zc[-8842]or Cb(-8842,6355,57231)
                    continue
                elseif I==0 then
                    xc=zc[-22378]or Cb(-22378,4663,2200)
                    continue
                end
                xc=zc[-19181]or Cb(-19181,69423,38906)
            end
        end
    end
    local _b=Sb();
    Ub[9949][La]=_b
    return _b
end)
local Yb=(function(Lb,Eb)
    Lb=eb(Lb)
    local Ta=X()
    local function w_(O,kb)
        local ha=(function(...)
            return{...},F('#',...)
        end)
        local da;
        da=(function(Ga,Qa,r_)
            if Qa>r_ then
                return
            end
            return Ga[Qa],da(Ga,Qa+1,r_)
        end)
        local function ta(V,wa,m,Ja)
            local Ac,l_,Jb,rc,W,z,v,ja,Wa,Xb,_c,qb,fb,h,Aa,Ba,Ma,Dc,Xa,fc,mc,a_,Q,Ca;
            z,a_=function(Qb,H,Db)
                a_[H]=T(Db,31290)-T(Qb,36195)
                return a_[H]
            end,{};
            W=a_[14987]or z(2186,14987,83951)
            while W~=41224 do
                if W>30631 then
                    if W<=47084 then
                        if W<37898 then
                            if W>=33956 then
                                if W<36813 then
                                    if W<=35044 then
                                        if W<=33979 then
                                            if W>33956 then
                                                V[_c+2]=V[_c+3];
                                                l_+=ja[59291];
                                                W=a_[-32556]or z(2896,-32556,39290)
                                            else
                                                Ca=false;
                                                l_+=1
                                                if Jb>106 then
                                                    W=a_[22296]or z(2619,22296,77332)
                                                    continue
                                                else
                                                    W=a_[-27404]or z(18537,-27404,125941)
                                                    continue
                                                end
                                                W=a_[3022]or z(14738,3022,93124)
                                            end
                                        else
                                            l_-=1;
                                            W,m[l_]=a_[-28284]or z(6389,-28284,34969),{[50283]=111,[6533]=f_(ja[6533],11),[38126]=f_(ja[38126],66),[22723]=0}
                                        end
                                    else
                                        l_-=1;
                                        m[l_],W={[50283]=190,[6533]=f_(ja[6533],233),[38126]=f_(ja[38126],119),[22723]=0},a_[-10969]or z(54310,-10969,52328)
                                    end
                                elseif W<=37477 then
                                    if W>37304 then
                                        Ma,Q,Xb=_c.__iter(Ma);
                                        W=a_[23520]or z(51937,23520,83974)
                                    elseif W<=36813 then
                                        return da(V,_c,_c+Xb-1)
                                    else
                                        if Jb>19 then
                                            W=a_[4918]or z(9561,4918,43507)
                                            continue
                                        else
                                            W=a_[21008]or z(31405,21008,85279)
                                            continue
                                        end
                                        W=a_[10622]or z(23382,10622,84344)
                                    end
                                elseif W<=37492 then
                                    l_-=1;
                                    m[l_],W={[50283]=224,[6533]=f_(ja[6533],169),[38126]=f_(ja[38126],114),[22723]=0},a_[-8681]or z(48688,-8681,59994)
                                else
                                    Q,W=Dc,a_[-7538]or z(53459,-7538,50234)
                                    continue
                                end
                            elseif W>32911 then
                                if W>33320 then
                                    h=Xa
                                    if Wa~=Wa then
                                        W=a_[9165]or z(11239,9165,96683)
                                    else
                                        W=32723
                                    end
                                elseif W>32960 then
                                    _c=kb[ja[38126]+1];
                                    V[ja[6533]],W=_c[2][_c[1]],a_[7130]or z(14221,7130,93633)
                                elseif W<=32925 then
                                    W,Dc[h]=a_[3278]or z(27613,3278,77399),Ba
                                else
                                    h=Xa
                                    if Wa~=Wa then
                                        W=a_[31230]or z(28899,31230,125455)
                                    else
                                        W=8359
                                    end
                                end
                            elseif W<=32723 then
                                if W>32054 then
                                    if(Aa>=0 and Xa>Wa)or((Aa<0 or Aa~=Aa)and Xa<Wa)then
                                        W=a_[-20903]or z(11403,-20903,33999)
                                    else
                                        W=50230
                                    end
                                elseif W<=32002 then
                                    fc=Wa
                                    if Aa~=Aa then
                                        W=a_[31907]or z(7206,31907,55630)
                                    else
                                        W=5646
                                    end
                                else
                                    Na'';
                                    W=a_[29697]or z(54571,29697,45630)
                                end
                            elseif W>32800 then
                                if Jb>140 then
                                    W=a_[4929]or z(9754,4929,90112)
                                    continue
                                else
                                    W=a_[9006]or z(14316,9006,87508)
                                    continue
                                end
                                W=a_[15078]or z(54412,15078,52422)
                            else
                                _c,Ma=ja[6533],ja[38126]-1
                                if Ma==-1 then
                                    W=a_[28325]or z(62765,28325,76202)
                                    continue
                                end
                                W=a_[-12206]or z(30482,-12206,70772)
                            end
                        elseif W>41325 then
                            if W>43868 then
                                if W>=46742 then
                                    if W<=46742 then
                                        if(Wa>=0 and Dc>Xa)or((Wa<0 or Wa~=Wa)and Dc<Xa)then
                                            W=a_[-18346]or z(22482,-18346,36919)
                                        else
                                            W=8087
                                        end
                                    else
                                        W,mc,l_,fb,v,Ca=a_[12843]or z(54470,12843,52360),-1,1,ib({},{__mode='vs'}),ib({},{__mode='ks'}),false
                                    end
                                elseif W<=44896 then
                                    _c,Ma,Q=ja[38126],ja[6533],ja[59461];
                                    Xb=V[Ma];
                                    V[_c+1]=Xb;
                                    V[_c]=Xb[Q];
                                    l_+=1;
                                    W=a_[-16407]or z(62804,-16407,44926)
                                else
                                    if Jb>43 then
                                        W=a_[-5542]or z(59987,-5542,56095)
                                        continue
                                    else
                                        W=a_[2230]or z(22373,2230,96326)
                                        continue
                                    end
                                    W=a_[-15975]or z(65397,-15975,46361)
                                end
                            elseif W<=43111 then
                                if W<42573 then
                                    Dc[h],W=kb[fc[38126]+1],a_[1610]or z(32537,1610,72211)
                                elseif W>42573 then
                                    W,V[ja[6533]]=a_[-2296]or z(57298,-2296,54660),ja[59461]
                                else
                                    Ma,Q,Xb=v
                                    if wc(Ma)~='function'then
                                        W=a_[-27828]or z(59249,-27828,48662)
                                        continue
                                    end
                                    W=a_[-12794]or z(6047,-12794,130956)
                                end
                            elseif W>43455 then
                                if Jb>57 then
                                    W=a_[-13613]or z(11535,-13613,34627)
                                    continue
                                else
                                    W=a_[1984]or z(2918,1984,82892)
                                    continue
                                end
                                W=a_[20031]or z(18608,20031,88282)
                            else
                                if Jb>214 then
                                    W=a_[25670]or z(50935,25670,35265)
                                    continue
                                else
                                    W=a_[-26841]or z(12709,-26841,45611)
                                    continue
                                end
                                W=a_[32093]or z(4655,32093,34403)
                            end
                        elseif W<40547 then
                            if W>=38862 then
                                if W>39617 then
                                    l_-=1;
                                    m[l_],W={[50283]=62,[6533]=f_(ja[6533],197),[38126]=f_(ja[38126],200),[22723]=0},a_[2085]or z(41134,2085,61664)
                                elseif W>38862 then
                                    Aa=Aa+fc;
                                    rc=Aa
                                    if Aa~=Aa then
                                        W=a_[-17066]or z(20619,-17066,93741)
                                    else
                                        W=a_[-14447]or z(5013,-14447,56240)
                                    end
                                else
                                    _c=ya(Ma)
                                    if _c~=nil and _c.__iter~=nil then
                                        W=a_[-28996]or z(12318,-28996,42954)
                                        continue
                                    elseif wc(Ma)=='table'then
                                        W=a_[-13386]or z(37752,-13386,39215)
                                        continue
                                    end
                                    W=a_[5369]or z(65529,5369,46754)
                                end
                            elseif W<=37898 then
                                W,Xa=a_[-32525]or z(28162,-32525,117963),Xa..s_(f_(lb(Ac,fc+1),lb(Dc,fc%#Dc+1)))
                            else
                                Xa=Xa+Aa;
                                h=Xa
                                if Xa~=Xa then
                                    W=a_[-25053]or z(19058,-25053,74748)
                                else
                                    W=8359
                                end
                            end
                        elseif W<40817 then
                            if W>40547 then
                                W=a_[-11115]or z(47297,-11115,44176)
                                continue
                            else
                                _c,W,Ma,Q=ja[9554],14405,m[l_+1],nil
                            end
                        elseif W>=40994 then
                            if W>40994 then
                                l_+=ja[59291];
                                W=a_[-24472]or z(3783,-24472,39563)
                            else
                                qb=fc[38126];
                                Ba=fb[qb]
                                if Ba==nil then
                                    W=a_[-19964]or z(46694,-19964,8557)
                                    continue
                                end
                                W=a_[-6944]or z(2335,-6944,98083)
                            end
                        else
                            l_+=1;
                            W=a_[-10076]or z(64122,-10076,44572)
                        end
                    elseif W>55062 then
                        if W>59980 then
                            if W<=63632 then
                                if W>=60596 then
                                    if W>62264 then
                                        l_+=1;
                                        W=a_[27307]or z(5323,27307,35983)
                                    elseif W>60596 then
                                        W,Xb=a_[7298]or z(45963,7298,46223),Ma-1
                                    else
                                        _c=ja[59461];
                                        V[ja[22723]][_c]=V[ja[6533]];
                                        l_+=1;
                                        W=a_[-32118]or z(59600,-32118,47354)
                                    end
                                elseif W>60090 then
                                    V[ja[38126]]=ja[22723]==1;
                                    l_+=ja[6533];
                                    W=a_[-5072]or z(34145,-5072,7989)
                                else
                                    Ac,Dc=Ma(Q,Xb);
                                    Xb=Ac
                                    if Xb==nil then
                                        W=40660
                                    else
                                        W=19137
                                    end
                                end
                            elseif W>64678 then
                                Ma[1271],W=Ac,a_[22731]or z(42281,22731,62992)
                            elseif W>64471 then
                                W,Xb=17918,Xa
                                continue
                            else
                                W,V[ja[6533]]=a_[31131]or z(4961,31131,126120),Q
                            end
                        elseif W<=58541 then
                            if W<57255 then
                                if W>56130 then
                                    _c,Ma,Q=f_(ja[6533],215),f_(ja[22723],154),f_(ja[38126],182);
                                    Xb,Ac=Ma==0 and mc-_c or Ma-1,V[_c];
                                    Dc,Xa=ha(Ac(da(V,_c+1,_c+Xb)))
                                    if Q==0 then
                                        W=a_[-7971]or z(16982,-7971,93467)
                                        continue
                                    else
                                        W=a_[-15438]or z(29161,-15438,118244)
                                        continue
                                    end
                                    W=5289
                                else
                                    Ma=Ja[64239];
                                    mc,W=_c+Ma-1,a_[10436]or z(19796,10436,85550)
                                end
                            elseif W<57736 then
                                J(Dc,1,Ma,_c+3,V);
                                V[_c+2]=V[_c+3];
                                l_+=ja[59291];
                                W=a_[17777]or z(39558,17777,3784)
                            elseif W<=57736 then
                                if Jb>35 then
                                    W=a_[-9270]or z(14698,-9270,75103)
                                    continue
                                else
                                    W=a_[-20710]or z(29927,-20710,118011)
                                    continue
                                end
                                W=a_[19143]or z(4405,19143,33625)
                            else
                                if Jb>240 then
                                    W=a_[-30063]or z(49518,-30063,33111)
                                    continue
                                else
                                    W=a_[1178]or z(56375,1178,95437)
                                    continue
                                end
                                W=a_[-20355]or z(12545,-20355,90965)
                            end
                        elseif W>59919 then
                            W,_c,Ma=50374,m[l_],nil
                        elseif W>59141 then
                            Ac,Dc=Ma[13669],ja[13669];
                            Dc='U\170\"'..Dc;
                            Xa='';
                            Aa,h,W,Wa=#Ac-1,1,a_[26835]or z(52110,26835,47573),0
                        elseif W>58678 then
                            ja=m[l_];
                            Jb,W=ja[50283],a_[13508]or z(24093,13508,74264)
                        else
                            W,V[ja[6533]]=a_[-24167]or z(38378,-24167,92963),Q[ja[13669]][ja[1271]]
                        end
                    elseif W<=50426 then
                        if W>48917 then
                            if W>=50374 then
                                if W>50374 then
                                    Ma,Q,Xb=Za(Ma);
                                    W=a_[-39]or z(50181,-39,55646)
                                else
                                    Q,Xb=_c[59461],ja[59461];
                                    Xb='U\170\"'..Xb;
                                    Ac='';
                                    W,Wa,Dc,Xa=a_[8550]or z(59736,8550,49076),1,0,#Q-1
                                end
                            elseif W>49546 then
                                fc=m[l_];
                                l_+=1;
                                rc=fc[6533]
                                if rc==0 then
                                    W=a_[-28775]or z(24317,-28775,128943)
                                    continue
                                elseif rc==1 then
                                    W=a_[16119]or z(23697,16119,67630)
                                    continue
                                elseif rc==2 then
                                    W=a_[8564]or z(58058,8564,94127)
                                    continue
                                end
                                W=a_[-24557]or z(36596,-24557,2940)
                            else
                                Na(Dc);
                                W=a_[-27854]or z(61980,-27854,50124)
                            end
                        elseif W<=48491 then
                            if W>48445 then
                                Ma[13669]=Xb;
                                W,Ac=16887,nil
                            elseif W>=47956 then
                                if W<=47956 then
                                    Xa,W=Q-1,a_[-29914]or z(8858,-29914,48792)
                                else
                                    if Jb>33 then
                                        W=a_[19044]or z(16823,19044,115634)
                                        continue
                                    else
                                        W=a_[-23465]or z(56806,-23465,51231)
                                        continue
                                    end
                                    W=a_[-17153]or z(38791,-17153,3531)
                                end
                            else
                                qb={[3]=V[fc[38126]],[1]=3};
                                qb[2]=qb;
                                W,Dc[h]=a_[18610]or z(28441,18610,76307),qb
                            end
                        elseif W>48547 then
                            W,V[ja[6533]]=a_[247]or z(7060,247,36414),nil
                        else
                            Ta[ja[59461]]=V[ja[22723]];
                            l_+=1;
                            W=a_[-24724]or z(4137,-24724,32877)
                        end
                    elseif W>53625 then
                        if W<=54160 then
                            if W<=54040 then
                                if W>53744 then
                                    if ja[22723]==83 then
                                        W=a_[-29736]or z(23189,-29736,67991)
                                        continue
                                    elseif ja[22723]==160 then
                                        W=a_[397]or z(14746,397,44758)
                                        continue
                                    elseif ja[22723]==200 then
                                        W=a_[19252]or z(48138,19252,50896)
                                        continue
                                    else
                                        W=a_[29762]or z(578,29762,78860)
                                        continue
                                    end
                                    W=a_[11204]or z(50934,11204,53912)
                                else
                                    W,Xb=a_[-24699]or z(36190,-24699,59952),mc-_c+1
                                end
                            else
                                Wa=Wa+h;
                                fc=Wa
                                if Wa~=Wa then
                                    W=a_[-25717]or z(51072,-25717,81331)
                                else
                                    W=27067
                                end
                            end
                        else
                            _c,Ma=ja[6533],ja[38126];
                            Q=Ma-1
                            if Q==-1 then
                                W=a_[22704]or z(10633,22704,68832)
                                continue
                            else
                                W=a_[10532]or z(38071,10532,96054)
                                continue
                            end
                            W=36813
                        end
                    elseif W>52438 then
                        if W>53581 then
                            if V[ja[6533]]then
                                W=a_[24702]or z(41161,24702,5888)
                                continue
                            end
                            W=a_[18145]or z(43889,18145,63781)
                        else
                            W,Dc=a_[-2262]or z(59333,-2262,34285),Dc..s_(f_(lb(Xb,h+1),lb(Ac,h%#Ac+1)))
                        end
                    elseif W<52421 then
                        fc=Wa
                        if Aa~=Aa then
                            W=a_[-9061]or z(63396,-9061,68951)
                        else
                            W=27067
                        end
                    elseif W>52421 then
                        if Jb>193 then
                            W=a_[-3562]or z(58097,-3562,51468)
                            continue
                        else
                            W=a_[4284]or z(47975,4284,52393)
                            continue
                        end
                        W=a_[-29836]or z(34794,-29836,7596)
                    else
                        if Jb>58 then
                            W=a_[27769]or z(20885,27769,40035)
                            continue
                        else
                            W=a_[-867]or z(5390,-867,66511)
                            continue
                        end
                        W=a_[-23599]or z(56556,-23599,54438)
                    end
                elseif W>=16887 then
                    if W>=24992 then
                        if W>28079 then
                            if W<=29661 then
                                if W>29471 then
                                    if W>29563 then
                                        J(Ja[33837],1,Ma,_c,V);
                                        W=a_[3378]or z(26036,3378,81886)
                                    else
                                        if Jb>111 then
                                            W=a_[-11336]or z(45715,-11336,6711)
                                            continue
                                        else
                                            W=a_[23401]or z(4114,23401,33932)
                                            continue
                                        end
                                        W=a_[3961]or z(2371,3961,39703)
                                    end
                                elseif W>28604 then
                                    _c,Ma=nil,f_(ja[11306],2318);
                                    _c=if Ma<32768 then Ma else Ma-65536;
                                    Q=_c;
                                    V[f_(ja[6533],63)],W=Q,a_[-13592]or z(53060,-13592,58638)
                                elseif W<=28353 then
                                    if Jb>148 then
                                        W=a_[-11286]or z(64742,-11286,75441)
                                        continue
                                    else
                                        W=a_[20854]or z(11626,20854,40830)
                                        continue
                                    end
                                    W=a_[-1452]or z(4272,-1452,32986)
                                else
                                    l_+=ja[59291];
                                    W=a_[15841]or z(55192,15841,49714)
                                end
                            elseif W<=30478 then
                                if W<=30331 then
                                    if W>30047 then
                                        Ac={Q(V[_c+1],V[_c+2])};
                                        J(Ac,1,Ma,_c+3,V)
                                        if V[_c+3]~=nil then
                                            W=a_[-14618]or z(1551,-14618,92701)
                                            continue
                                        else
                                            W=a_[-26126]or z(54688,-26126,54277)
                                            continue
                                        end
                                        W=a_[13833]or z(14064,13833,90778)
                                    else
                                        if Jb>137 then
                                            W=a_[3889]or z(51872,3889,59103)
                                            continue
                                        else
                                            W=a_[23895]or z(56860,23895,51393)
                                            continue
                                        end
                                        W=a_[17345]or z(60625,17345,50309)
                                    end
                                else
                                    Wa,W=Wa..s_(f_(lb(Dc,rc+1),lb(Xa,rc%#Xa+1))),a_[-18114]or z(61462,-18114,90636)
                                end
                            else
                                _c[59461]=Ma;
                                ja[50283],W=71,a_[32400]or z(20213,32400,88729)
                            end
                        elseif W>=27067 then
                            if W>27422 then
                                if W<=27986 then
                                    Ma,Q,Xb=Za(Ma);
                                    W=a_[-8883]or z(60489,-8883,78302)
                                else
                                    Xa=Xa+Aa;
                                    h=Xa
                                    if Xa~=Xa then
                                        W=a_[-22054]or z(57225,-22054,54733)
                                    else
                                        W=a_[-29631]or z(63748,-29631,36352)
                                    end
                                end
                            elseif W>=27069 then
                                if W<=27069 then
                                    Xa,W=Xa..s_(f_(lb(Ac,fc+1),lb(Dc,fc%#Dc+1))),a_[-2492]or z(2937,-2492,60355)
                                else
                                    l_-=1;
                                    m[l_],W={[50283]=137,[6533]=f_(ja[6533],123),[38126]=f_(ja[38126],228),[22723]=0},a_[22919]or z(53397,22919,49465)
                                end
                            else
                                if(h>=0 and Wa>Aa)or((h<0 or h~=h)and Wa<Aa)then
                                    W=a_[-22163]or z(1616,-22163,130531)
                                else
                                    W=a_[-7657]or z(5315,-7657,87952)
                                end
                            end
                        elseif W>=25568 then
                            if W>=25677 then
                                if W>25677 then
                                    v[ja]=nil;
                                    l_+=1;
                                    W=a_[15160]or z(29429,15160,75417)
                                else
                                    l_-=1;
                                    m[l_],W={[50283]=115,[6533]=f_(ja[6533],116),[38126]=f_(ja[38126],172),[22723]=0},a_[-12460]or z(51635,-12460,56295)
                                end
                            else
                                ja[50283]=146;
                                l_+=1;
                                W=a_[16451]or z(26557,16451,81361)
                            end
                        elseif W>24992 then
                            if Jb>71 then
                                W=a_[-15187]or z(46485,-15187,93937)
                                continue
                            else
                                W=a_[-2027]or z(32059,-2027,90011)
                                continue
                            end
                            W=a_[7569]or z(47668,7569,61022)
                        else
                            if Jb>29 then
                                W=a_[27097]or z(52521,27097,92504)
                                continue
                            else
                                W=a_[20875]or z(53838,20875,35551)
                                continue
                            end
                            W=a_[1602]or z(25533,1602,78289)
                        end
                    elseif W<=21794 then
                        if W<18412 then
                            if W<=17316 then
                                if W<=16902 then
                                    if W>16887 then
                                        Ac,Dc=Ma[13669],ja[13669];
                                        Dc='U\170\"'..Dc;
                                        Xa='';
                                        h,Wa,Aa,W=1,0,#Ac-1,51564
                                    else
                                        Dc,Xa=Ma[1271],ja[1271];
                                        Xa='U\170\"'..Xa;
                                        Wa='';
                                        fc,W,Aa,h=1,a_[-17229]or z(43833,-17229,16648),0,#Dc-1
                                    end
                                else
                                    if Jb>218 then
                                        W=a_[-18781]or z(22333,-18781,116017)
                                        continue
                                    else
                                        W=a_[25736]or z(45181,25736,40167)
                                        continue
                                    end
                                    W=a_[-23024]or z(55113,-23024,52493)
                                end
                            elseif W>17723 then
                                Ma[13669],W=Xb,a_[-23122]or z(52498,-23122,56939)
                            else
                                if Jb>146 then
                                    W=a_[10581]or z(45025,10581,35265)
                                    continue
                                else
                                    W=a_[1158]or z(51192,1158,36918)
                                    continue
                                end
                                W=a_[5539]or z(17649,5539,89253)
                            end
                        elseif W>19059 then
                            if W<=19137 then
                                oc(Dc);
                                v[Ac],W=nil,a_[-13489]or z(46121,-13489,89662)
                            else
                                _c,Ma=ja[9554],ja[59461];
                                Q=Ta[Ma]or Ub[3210][Ma]
                                if _c==1 then
                                    W=a_[6724]or z(318,6724,127502)
                                    continue
                                elseif _c==2 then
                                    W=a_[4688]or z(56233,4688,2914)
                                    continue
                                elseif _c==3 then
                                    W=a_[-3309]or z(8330,-3309,125221)
                                    continue
                                end
                                W=63632
                            end
                        elseif W>=19032 then
                            if W>19032 then
                                l_-=1;
                                W,m[l_]=a_[-13265]or z(37114,-13265,156),{[50283]=112,[6533]=f_(ja[6533],84),[38126]=f_(ja[38126],161),[22723]=0}
                            else
                                if ja[22723]==169 then
                                    W=a_[-29119]or z(49484,-29119,723)
                                    continue
                                elseif ja[22723]==172 then
                                    W=a_[-18837]or z(64828,-18837,49384)
                                    continue
                                else
                                    W=a_[-6479]or z(45850,-6479,50339)
                                    continue
                                end
                                W=a_[-19480]or z(31552,-19480,76042)
                            end
                        else
                            mc,W=_c+Xa-1,a_[-15379]or z(19028,-15379,41434)
                        end
                    elseif W>24444 then
                        if W<24915 then
                            if W<=24656 then
                                Ma[59461]=Q
                                if _c==2 then
                                    W=a_[-656]or z(11101,-656,47576)
                                    continue
                                elseif _c==3 then
                                    W=a_[5065]or z(21300,5065,94218)
                                    continue
                                end
                                W=25568
                            else
                                if ja[22723]==248 then
                                    W=a_[4813]or z(7508,4813,88209)
                                    continue
                                else
                                    W=a_[2836]or z(57401,2836,61335)
                                    continue
                                end
                                W=a_[27705]or z(8695,27705,95131)
                            end
                        elseif W<=24915 then
                            Aa=Dc
                            if Xa~=Xa then
                                W=a_[23859]or z(30177,23859,97764)
                            else
                                W=a_[31809]or z(9897,31809,71770)
                            end
                        else
                            l_-=1;
                            m[l_],W={[50283]=92,[6533]=f_(ja[6533],92),[38126]=f_(ja[38126],132),[22723]=0},a_[28943]or z(31391,28943,77619)
                        end
                    elseif W>23066 then
                        if W>23821 then
                            if Jb>112 then
                                W=a_[-9250]or z(54590,-9250,55439)
                                continue
                            else
                                W=a_[30465]or z(36501,30465,3403)
                                continue
                            end
                            W=a_[29973]or z(30862,29973,75968)
                        else
                            if not Ca then
                                W=a_[-5219]or z(17483,-5219,117271)
                                continue
                            end
                            W=a_[-18240]or z(47217,-18240,50060)
                        end
                    elseif W<23038 then
                        l_+=1;
                        W=a_[-17765]or z(23363,-17765,84247)
                    elseif W>23038 then
                        _c=ya(Ma)
                        if _c~=nil and _c.__iter~=nil then
                            W=a_[4356]or z(44564,4356,53222)
                            continue
                        elseif wc(Ma)=='table'then
                            W=a_[27032]or z(21903,27032,80900)
                            continue
                        end
                        W=a_[-8081]or z(37967,-8081,96732)
                    else
                        Ac,Dc=Ma(Q,Xb);
                        Xb=Ac
                        if Xb==nil then
                            W=42573
                        else
                            W=11808
                        end
                    end
                elseif W>8307 then
                    if W>=13641 then
                        if W<=14837 then
                            if W<13871 then
                                if W<=13641 then
                                    if Jb>69 then
                                        W=a_[-30494]or z(64840,-30494,46850)
                                        continue
                                    else
                                        W=a_[14637]or z(16161,14637,76447)
                                        continue
                                    end
                                    W=a_[-10712]or z(62833,-10712,44837)
                                else
                                    if Jb>73 then
                                        W=a_[29418]or z(42743,29418,55174)
                                        continue
                                    else
                                        W=a_[-13860]or z(28876,-13860,72203)
                                        continue
                                    end
                                    W=a_[11226]or z(9083,11226,94495)
                                end
                            elseif W>14405 then
                                _c,Ma=nil,V[ja[6533]];
                                _c=L(Ma)=='function'
                                if not _c then
                                    W=a_[-11266]or z(31639,-11266,69136)
                                    continue
                                end
                                W=28604
                            elseif W>13871 then
                                Xb,Ac=Ma[59461],ja[59461];
                                Ac='U\170\"'..Ac;
                                Dc='';
                                Aa,Xa,Wa,W=1,0,#Xb-1,32960
                            else
                                Ac,W=Wa,65522
                                continue
                            end
                        elseif W<=16272 then
                            if W>=16215 then
                                if W>16215 then
                                    l_+=ja[59291];
                                    W=a_[-21232]or z(30893,-21232,76001)
                                else
                                    _c,Ma=nil,f_(ja[11306],25698);
                                    _c=if Ma<32768 then Ma else Ma-65536;
                                    Q=_c;
                                    Xb=wa[Q+1];
                                    Ac=Xb[51045];
                                    Dc=Pa(Ac);
                                    V[f_(ja[6533],56)]=w_(Xb,Dc);
                                    Wa,Xa,W,Aa=Ac,1,33812,1
                                end
                            else
                                if Dc==-2 then
                                    W=a_[-2958]or z(35566,-2958,5848)
                                    continue
                                else
                                    W=a_[-27889]or z(47634,-27889,93474)
                                    continue
                                end
                                W=a_[-8578]or z(5526,-8578,35896)
                            end
                        else
                            Dc=Dc+Wa;
                            Aa=Dc
                            if Dc~=Dc then
                                W=a_[-19713]or z(25005,-19713,34320)
                            else
                                W=46742
                            end
                        end
                    elseif W>11151 then
                        if W>=11808 then
                            if W<=11808 then
                                Dc[3]=Dc[2][Dc[1]];
                                Dc[2]=Dc;
                                Dc[1]=3;
                                W,fb[Ac]=a_[1160]or z(14767,1160,95472),nil
                            else
                                Ma,Q,Xb=fb
                                if wc(Ma)~='function'then
                                    W=a_[21470]or z(31438,21470,128321)
                                    continue
                                end
                                W=a_[10709]or z(1952,10709,40699)
                            end
                        elseif W<=11225 then
                            Xb,W=nil,a_[31952]or z(50973,31952,85687)
                        else
                            l_-=1;
                            W,m[l_]=a_[-20115]or z(14265,-20115,93661),{[50283]=33,[6533]=f_(ja[6533],12),[38126]=f_(ja[38126],140),[22723]=0}
                        end
                    elseif W<=10323 then
                        if W>8671 then
                            V[ja[6533]],W=V[ja[38126]],a_[2581]or z(40547,2581,2615)
                        elseif W>8359 then
                            _c,Ma=ja[6533],ja[59461];
                            mc=_c+6;
                            Q,Xb=V[_c],nil;
                            Xb=L(Q)=='function'
                            if Xb then
                                W=a_[266]or z(14171,266,84617)
                                continue
                            else
                                W=a_[31314]or z(5098,31314,52251)
                                continue
                            end
                            W=a_[6168]or z(21972,6168,86014)
                        else
                            if(Aa>=0 and Xa>Wa)or((Aa<0 or Aa~=Aa)and Xa<Wa)then
                                W=a_[2470]or z(2373,2470,93409)
                            else
                                W=53581
                            end
                        end
                    elseif W>10358 then
                        V[ja[22723]]=Pa(ja[52029]);
                        l_+=1;
                        W=a_[12277]or z(51525,12277,56073)
                    else
                        _c=ja[59461];
                        V[ja[38126]]=Ta[_c]or Ub[3210][_c];
                        l_+=1;
                        W=a_[25330]or z(63770,25330,43964)
                    end
                elseif W>=5336 then
                    if W<=8087 then
                        if W<6798 then
                            if W>5646 then
                                Ac,Dc=kc(v[ja],Q,V[_c+1],V[_c+2])
                                if not Ac then
                                    W=a_[8978]or z(33890,8978,45233)
                                    continue
                                end
                                W=14967
                            elseif W<=5336 then
                                rc=Aa
                                if h~=h then
                                    W=a_[17680]or z(6188,17680,45380)
                                else
                                    W=660
                                end
                            else
                                if(h>=0 and Wa>Aa)or((h<0 or h~=h)and Wa<Aa)then
                                    W=a_[21355]or z(53785,21355,2963)
                                else
                                    W=a_[15435]or z(49552,15435,52362)
                                end
                            end
                        elseif W>=7588 then
                            if W<=7588 then
                                W,Xb=16902,nil
                            else
                                W,Ac=a_[-25707]or z(42156,-25707,4490),Ac..s_(f_(lb(Q,Aa+1),lb(Xb,Aa%#Xb+1)))
                            end
                        else
                            V[ja[6533]],W=Q[ja[13669]],a_[-10214]or z(54171,-10214,77234)
                        end
                    elseif W<8274 then
                        if W>8179 then
                            if ja[22723]==91 then
                                W=a_[17387]or z(63857,17387,41573)
                                continue
                            elseif ja[22723]==160 then
                                W=a_[-10663]or z(59922,-10663,43189)
                                continue
                            elseif ja[22723]==202 then
                                W=a_[7857]or z(22447,7857,83469)
                                continue
                            elseif ja[22723]==209 then
                                W=a_[28646]or z(28530,28646,69839)
                                continue
                            else
                                W=a_[-200]or z(19595,-200,123588)
                                continue
                            end
                            W=a_[3762]or z(4435,3762,33543)
                        else
                            l_-=1;
                            W,m[l_]=a_[8321]or z(4527,8321,33763),{[50283]=41,[6533]=f_(ja[6533],214),[38126]=f_(ja[38126],216),[22723]=0}
                        end
                    elseif W>8274 then
                        Ma,Q,Xb=_c.__iter(Ma);
                        W=a_[6161]or z(1235,6161,39316)
                    else
                        Ba={[1]=qb,[2]=V};
                        W,fb[qb]=a_[18408]or z(31305,18408,69117),Ba
                    end
                elseif W>3039 then
                    if W>=4655 then
                        if W>4655 then
                            J(Dc,1,Xa,_c,V);
                            W=a_[14639]or z(54074,14639,49500)
                        else
                            Xb,W=Xa,a_[32679]or z(38161,32679,45031)
                            continue
                        end
                    elseif W>3932 then
                        if not V[ja[6533]]then
                            W=a_[-25680]or z(22092,-25680,67238)
                            continue
                        end
                        W=a_[374]or z(9014,374,94552)
                    else
                        Ma,W=Ac,a_[15184]or z(6619,15184,95845)
                        continue
                    end
                elseif W>2403 then
                    if W<=2891 then
                        if Jb>212 then
                            W=a_[24481]or z(17110,24481,35758)
                            continue
                        else
                            W=a_[22782]or z(16957,22782,79943)
                            continue
                        end
                        W=a_[-29]or z(35983,-29,9411)
                    else
                        Wa=Wa+h;
                        fc=Wa
                        if Wa~=Wa then
                            W=a_[6418]or z(4193,6418,54539)
                        else
                            W=a_[-15586]or z(55552,-15586,4171)
                        end
                    end
                elseif W<1261 then
                    if(fc>=0 and Aa>h)or((fc<0 or fc~=fc)and Aa<h)then
                        W=a_[-32572]or z(62863,-32572,54561)
                    else
                        W=a_[-22558]or z(17313,-22558,81898)
                    end
                elseif W>1261 then
                    if Jb>92 then
                        W=a_[-19353]or z(35946,-19353,32716)
                        continue
                    else
                        W=a_[29164]or z(19253,29164,33169)
                        continue
                    end
                    W=a_[-25420]or z(24187,-25420,84511)
                else
                    if Jb>98 then
                        W=a_[8996]or z(31240,8996,105357)
                        continue
                    else
                        W=a_[20403]or z(49727,20403,9427)
                        continue
                    end
                    W=a_[25638]or z(62349,25638,41409)
                end
            end
        end
        return function(...)
            local Fc,fa_,Fa,tc,ub,N,sa,ua,Va,b_,aa;
            b_,fa_=function(vb,pc,za)
                fa_[vb]=T(pc,16066)-T(za,23035)
                return fa_[vb]
            end,{};
            ub=fa_[-25777]or b_(-25777,71106,63590)
            repeat
                if ub>30050 then
                    if ub>=35171 then
                        if ub>35171 then
                            return da(ua,2,tc)
                        else
                            N,sa,Fc=Sa(...),Pa(O[47890]),{[64239]=0,[33837]={}};
                            J(N,1,O[51023],0,sa)
                            if O[51023]<N.n then
                                ub=fa_[-8138]or b_(-8138,35680,2511)
                                continue
                            end
                            ub=fa_[24445]or b_(24445,45074,26766)
                        end
                    else
                        return Na(aa,0)
                    end
                elseif ub>=23899 then
                    if ub>25966 then
                        aa,ub=L(aa),fa_[27885]or b_(27885,59434,2889)
                    elseif ub<=23899 then
                        ua,tc=ha(xa(ta,sa,O[41309],O[16705],Fc))
                        if ua[1]then
                            ub=fa_[-22946]or b_(-22946,75285,27162)
                            continue
                        else
                            ub=fa_[-29511]or b_(-29511,57533,64247)
                            continue
                        end
                        ub=fa_[-22841]or b_(-22841,1494,28870)
                    else
                        ua,tc=O[51023]+1,N.n-O[51023];
                        Fc[64239]=tc;
                        J(N,ua,ua+tc-1,1,Fc[33837]);
                        ub=fa_[9581]or b_(9581,67379,34157)
                    end
                elseif ub<=4567 then
                    ub=fa_[6264]or b_(6264,55713,49772)
                    continue
                else
                    aa,Va=ua[2],nil;
                    Fa=aa;
                    Va=L(Fa)=='string'
                    if Va==false then
                        ub=fa_[-14015]or b_(-14015,69402,58765)
                        continue
                    end
                    ub=fa_[20763]or b_(20763,84127,43996)
                end
            until ub==19404
        end
    end
    return w_(Lb,Eb)
end)
local sb;
sb,ec={[0]=0},function()
    sb[0]=sb[0]+1
    return{[1]=sb[0],[2]=sb}
end;
ab=Yb
return(function()
    return ab(hc(uc'/0BNTbjttAJo/9nu3i3Zzpuh29nvAODungHj3pv3odjtAuGeR43u/9732ureR4zuv97Z2O+mKAXgZH8PWEdkDlpEAGC/RTDc7t0tCGBH/Y8E4N3o3keO7r/eDt1U3SoCYYHeAmHm3keAAmFA3f0kDWDs2erfR4OuBGFo3ScG4YIG4eV33keFBuF73SEJYb2ECWHj3keHCWFm890jFGAU4lkfW6H/3f/eLZkeXvn/48zW+eDu1mTfClpHR7gOYcHddT8L5bsQYXXdPhLhvboS4freR70S4eD73Tgd4PniKNdHXbwU4b3dOxJlvxbh1/TdOhRlvhjhAd31NRthsRth995HsK4bYQPdNx3hsyHg2ffvOzYh4lpHMNpr7tog4rIl4NzyIOP33FTaIOEw2+7Z5CRhAODWJWEuYm0vWP+h0PHeLaE+X/tHtyxg087eZAfvWkZHtifg0ErW/Qwy4PfQzN5Hqa4B4TfWDixhqCtg0ae/2Qk2YAl2qwlhy+oJcMgJa6oJYVPZCvYJYdjuEuL574TXu0etD+HW1gU6YazuHGHr4wQ+YQtaQO4TYtxK2hNh+ePq99dHrz1g3J/aB7o/4a5D4eyBBkPhDPlZIeZL426Zod/DfkzgLpxP3+jeAmb93AJjZAtaRbncVeMC5H4FYMFSYA4FaPICYNwCYwVj7N5Ho1Is4d4s/yz/3iz/7hZjsDZpLP82Yyz/3kcs/94tDiz8R6JO4d9O/07/ACH/ceUh/ytgTv9O/0zhTv/5ZE7gmeFTLS8Zof/d294ZFc4dR62mUuLIG1Ll3XTkWVp04dl06kdYd2HWlePn3EDaleGj4tXMVv+h3NXeLTF+Xf/54ODX+eHw1+5WYEdHXV/hodoRvoph4+LXR1xh4c5b2hCV5dWMBuDRBuCrDl1+Zt9+ZF6q4N6/rt5kCFpGgebe+oHkUa5g0a/eZAnrWEZjYERu6ezZ63feR1Bu4fjab6ni7+vfR1Nw4f7ablqw4VJw4u5pcOXbkuTlVZLhq5LqCWDfR1SueGEF2mu4YVd4YpX5anhiquBW7t7d2efh3GW74QFgBtnqqdEBYZng2L5iSRhhp66+Y95U2L5iSBrhpG6+Y95A2L5hR0vHYM/d6t5mx2G14F3Qq6gPzubazuzdzuRKts7g36LO493qzuMKus7gDc7gDVpF1uOu75eh3aDX4D6aXf/Xrw+k02J3FJfd/d6xYNXSYtFh3mtU1dFiTNjg1aHRY/fVQNXRYT7tjLrrF9nT4E/WYNWo1fV92OFO3ODb53J8/tzhB1lH+90CIf0v5GCkjU5y6+//tAJM+e60Ajn/xUOBPAKLoDvvzUtM9wHgMstP7zlLTLUDID3eVv/gqJnQVbUbrf/jsLSB6TEKKf+99KIGW/UWIP8zjHLGy0OIXv/dgnkwxkfxqP/GjFW+E63utv+igO4xEGiX9P+sFhX/Ejoo0d8x5MNM9AyAHd5/VqCGeCFM/w4A/7sqojvrL3tiv8yzNo5M9hAgAb/DVof/TOgRYCf/yFpXkwPQE0H/vKRPtRPQ6Wb/mhQG1kONXhl76a0TYhzJTXgWgv4BAK6Fy4fMMM7+CCI30wxlZkz1/hmgFN9WGO60TP37GwAWxk2fLQL7ADcC4hPFTrf9fesNwgDuS64QH0L/M9hNcnxQTEn7MN4fQwbDWLtM/fgSIdhDfree1e+3MMRWImIRy1C9bhVDwkev7BiiBv/DRkWaqSksWd8x3kpM/hxBw0b/MftWexeSPejvQyZM4ysgBslQ/51AR4M6k4v03zTITpdIHEWJAv+yyespP6o3Xv+ZwRFsnRHeQL/zmq9wY6Exwhf/y0Gr+lMHIjv9ziWCFthHO1bT/wrezjHFVUz6/jXAsCCCx0p+7vvMAh3CFsVOGUH5cyxCGYA6kbctS/4t4nbsZCpYeRf8K8IEYEfYTmZmZvYAQOY/MEIB2EOg/+t5OWQdO8lb60zyQIBlBqQaN7y/CWxOAAAAAEDgdz9M8EPgZJoSKcL/B8VWBYmKozv+K2IS2ENWZSdI/SEuYgfLRkbkT+4FggHLRR9CPM5H/7lbXEPXPSMk/zbfVrhdS0z8/ktBz1blOlRmuv+mSCfEQ+0nS342IrM2iMG2U09C7xfPVg9QYhDEV/1rRuIez1tggsjtMBRiE0svA89W+Z+zqboEIQNgPOIGf/9RfQNGOSFIJf+QX48GpZdIYP9xOinBEGOcG//EHM5Q5cwcY3Rboj+AAxrCO89VCeP/FsVQguUItszvGTzfURSiBt5Q/2YbNKqhgk4+z8RHegM7gizguSD/oPaMDTDEQbN+FuMT7BIV4qBLg9+SG0FtQ2miGsT/TllZO1UFOc/+NaIR2EOYiRc6+gGg/W1AEM5LtQf/YCPIUNch3k39r1XisRKZMvIPfldCGtpHPy3YZcJ/Bs9BQEkZO3Pi/wHLQCLFCJenezrEc8IYy0v8ZqLfNsJH5nYuhEBM/dx149YjJndc6f85GQUJs7M6of9pjPxPWJDqTP+vOcVOiSJ9L/9c4zEEA1OW/L80q2jK5E59ojv3z1rAfuM3z07K/mbjy04TvO3fPn5p4hffVkzbQ3TCf+VPdvnJTPGGQO9cUUzQhyCQ26P//3rSctmLxdb/r4peZwb7m83/cjqSc1NG/13/kaIt7AuUrQvuSCLQwR1zYtNgoLeT5lYIIuuaZmI2/+BwtWco2J5gb5ok4NALQhZQgkLfwNGj4qENYjYz7lCicIHGk6LqSUrddVLC05iZEWLDIr6IYh8zNio6E4LefduKghDE7rTFFaLbBXwWgsKJhAIg2O/IW3swhWJUqDP3GmXxhWLyLCvB91vhzhKj6HHBrP+fQFuQGHGg970mEcOdIWhXi+Ja3yK2XbegpQIv993DG+N2M0BlIlfZ3dJmIhoeTiTCKKp+kkLOmAlYFnhswl2caiIO/jtugkqt4u9k/ePMrwMMQiaubiIvkTxygmaYwtd/LzUlrlhbQajif4BCMQXP0idzArcmKfYxom5FMoIGnXt1wiPtrHoic0Ot39zO3WhEuuIecfsvSZUC8Sz8Y9H//ixaXhUQ8CjqCCNPgIIvqCLsgHr35K19tqIJcFH+98nrLasC1lLzk7v9eIIiU9XigyID+196t+IgFFQ3bN7HYv/udli94sFI3xBGphKiiALbU926iQJRSLyKAjQgfXa+wnGga+POSeLbklRKwoUdkWI7TP3k0sCmUBxYc47/UG1tfNGdWc7/BKOXOjPlhC6tgE/itKhQwqaFg3+73owLAzi0LZlhSXlNr6Lyg76eodnyie+OnqHY8oNdhmr3FEfe+YDY76Yp6vmBD/IADvIADllF+OQByEHkBWUn2MTQ8uQIv6yj2qBNvG8h3tiDVKy2uWOi2t0epuI9+wrz68A='),{})
end)()(...)
