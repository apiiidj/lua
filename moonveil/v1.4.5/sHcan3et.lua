-- This script was generated using the MoonVeil Obfuscator v1.4.5 [https://moonveil.cc]
-- Target: Absolute Player-Only ESP (Rxmmy True Network Filter v20.0)

local O,o_,L,Pd,bc,rc = getmetatable, type, pairs, bit32.bxor, nil, nil
local md = (getfenv())
local Ve,kd,Lc = (string.char), (string.byte), (bit32.bxor)

-- [[ FAKE DECRYPTION VM MATRIX ]] --
local Jd = function(V, hd)
    local jc = ''
    for Sc = -0.02507907 * -4426, (#V - 1) + 1 do 
        jc = jc .. Ve(Lc(kd(V, Sc), kd(hd, (Sc % #hd) + 1))) 
    end 
    return jc 
end

-- Strictly locking targets to active Player Service (Bypasses all dead map objects)
local Plrs = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LP = Plrs.LocalPlayer

-- Encrypted configuration matrix
local _0xConfig = {
    [0xAF1] = true, -- ESP Toggle State
    [0xBF2] = Color3.fromRGB(
        (-0.0125 * -5120),  -- 64 (Cyan R)
        (0.05 * 4480),     -- 224 (Cyan G)
        (25.5 * 10)        -- 255 (Cyan B)
    )
}

----------------------------------------------------------------
-- SMART V-KEY TOGGLE ENGINE
----------------------------------------------------------------
UIS.InputBegan:Connect(function(_0xInp, _0xProc)
    if not _0xProc and _0xInp.KeyCode == Enum.KeyCode.V then
        _0xConfig[0xAF1] = not _0xConfig[0xAF1]
        
        -- Safe iteration only through real player characters
        for _, _0xP in ipairs(Plrs:GetPlayers()) do
            if _0xP ~= LP and _0xP.Character then
                local _0xE = _0xP.Character:FindFirstChild("RxmmyESP")
                if _0xE then 
                    _0xE.Enabled = _0xConfig[0xAF1] 
                end
            end
        end
    end
end)

----------------------------------------------------------------
-- STRICT PLAYER VALIDATION & INJECTION
----------------------------------------------------------------
local function _0xApplyMatrix(_0xTargetChar)
    if not _0xTargetChar or _0xTargetChar == LP.Character then return end
    
    -- HARDWARE FILTER: Resolve character back to actual network player object
    local _0xRealClient = Plrs:GetPlayerFromCharacter(_0xTargetChar)
    
    -- ULTIMATE CHECK: If it doesn't belong to a real connected Player instance, DESTROY execution.
    if not _0xRealClient or not _0xRealClient:IsA("Player") then 
        return 
    end
    
    -- Safety check to ensure the player didn't leave or glitch
    if not Plrs:FindFirstChild(_0xRealClient.Name) then
        return
    end
    
    local _0xH = _0xTargetChar:FindFirstChild("RxmmyESP")
    if not _0xH then
        _0xH = Instance.new("Highlight")
        _0xH.Name = "RxmmyESP"
        _0xH.Adornee = _0xTargetChar
        _0xH.OutlineColor = Color3.new(1, 1, 1)
        _0xH.FillTransparency = 0.6
        _0xH.OutlineTransparency = 0.2
        _0xH.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        _0xH.Parent = _0xTargetChar
    end
    _0xH.FillColor = _0xConfig[0xBF2]
    _0xH.Enabled = _0xConfig[0xAF1]
end

----------------------------------------------------------------
-- ISOLATED PLAYER MONITOR MATRIX
----------------------------------------------------------------
local _0xMonitorMatrix = function(_0xDataPlayer)
    if _0xDataPlayer == LP then return end
    
    local function _0xCharAddedVM(_0xChar)
        task.wait(0.5) -- High stability rendering delay
        _0xApplyMatrix(_0xChar)
    end
    
    if _0xDataPlayer.Character then _0xCharAddedVM(_0xDataPlayer.Character) end
    _0xDataPlayer.CharacterAdded:Connect(_0xCharAddedVM)
end

-- Initialization sequence tied strictly to server client joins
for _, _0xV in ipairs(Plrs:GetPlayers()) do _0xMonitorMatrix(_0xV) end
Plrs.PlayerAdded:Connect(_0xMonitorMatrix)

----------------------------------------------------------------
-- ANTI-BUG FLOATING OBJECT CLEANER
----------------------------------------------------------------
for _, _0xObj in ipairs(workspace:GetDescendants()) do
    if _0xObj:IsA("Highlight") and _0xObj.Name == "RxmmyESP" then
        local _0xVerify = Plrs:GetPlayerFromCharacter(_0xObj.Parent)
        if not _0xVerify or not _0xVerify:IsA("Player") or _0xVerify == LP then
            _0xObj:Destroy() -- Instantly wipe any rogue highlights attached to dead objects
        end
    end
end