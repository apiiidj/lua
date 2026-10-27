

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "streamer"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/UI.lua/refs/heads/main/orion.lua'))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StreamingEvent = ReplicatedStorage:WaitForChild("StreamingEvent")
local GetMailBox = ReplicatedStorage:WaitForChild("GetMailBox")
local Rebirth = ReplicatedStorage:WaitForChild("Rebirth")

local farming = false
local rebirthAuto = false
local farmConnection = nil
local rebirthConnection = nil

local function fireAllEventsX10()
    for i = 1, 40 do
        StreamingEvent:FireServer("endStream")
        StreamingEvent:FireServer("startStream")
        StreamingEvent:FireServer("segmentStreamed")
        GetMailBox:FireServer()
    end
end

local function startFarming()
    if farmConnection then return end
    farming = true
    farmConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if farming then
            fireAllEventsX10()
        end
    end)
end

local function stopFarming()
    farming = false
    if farmConnection then
        farmConnection:Disconnect()
        farmConnection = nil
    end
end

local function startAutoRebirth()
    if rebirthConnection then return end
    rebirthAuto = true
    rebirthConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if rebirthAuto then
            for i = 1, 40 do
                Rebirth:FireServer()
            end
        end
    end)
end

local function stopAutoRebirth()
    rebirthAuto = false
    if rebirthConnection then
        rebirthConnection:Disconnect()
        rebirthConnection = nil
    end
end

local Window = OrionLib:MakeWindow({Name = "Rebirth", HidePremium = false, SaveConfig = true, ConfigFolder = "X10Farm"})
local FarmTab = Window:MakeTab({Name = "Farm Control", Icon = "rbxassetid://4483345998", PremiumOnly = false})

FarmTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        if state then
            startFarming()
        else
            stopFarming()
        end
    end
})

FarmTab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(state)
        if state then
            startAutoRebirth()
        else
            stopAutoRebirth()
        end
    end
})

OrionLib:Init()