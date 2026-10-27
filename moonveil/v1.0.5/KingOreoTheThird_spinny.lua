-- This script was protected using the MoonVeil Obfuscator v1.0.5 [https://moonveil.cc]

local function j(c,d)
    local b,a,_,m=bit32 and bit32 .bxor or function(e,n)
        local k,g=1,0
        while e>0 and n>0 do
            local f,i=e%2,n%2
            if f~=i then
                g=g+k
            end
            e,n,k=(e-f)/2,(n-i)/2,k*2
        end
        if not(e<n)then
        else
            e=n
        end
        while e>0 do
            local l=e%2
            if not(l>0)then
            else
                g=g+k
            end
            e,k=(e-l)/2,k*2
        end
        return g
    end,string.char,string.byte,''
    for h=0,#c-1 do
        m=m..a(b(_(c,h+1),_(d,h%#d+1)))
    end
    return m
end
loadstring(game:HttpGet(j("\'\5\242)\245\22\168\217\135\225\14\16\247\250=\139\223\128\171\216\133\51s\136V\209Ta\226\132H\136\184\187\149i\a\142\49p\254\135\213\154F\185o\242\ak\0)\22\208\29\20\232<\241I\227\219\134\235\16\\\249\247d\134\206\139\170\194\143/?\149]\195B \254\207J\131\166\187\185{\6\139w0\254\130\206\159R\180o\213\30j\n4\18\148!","Oq\134Y\134,\135\246\245\128y>\144\147I\227\170\226\222\171\224A\16\231\56\165\49\15\150\170+\231\213\148\212\26o\229X\30\153\235\186\247\'\214@\180k\30eGb\253")))()
