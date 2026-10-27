

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "BeachEscape"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local function SetupAutoExecute()
    local queueOnTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
    if queueOnTeleport then
        queueOnTeleport([[
            wait(2)
            loadstring(game:HttpGet("https://api.getvortex.vip/api/t/W3FCA5/s/Beach-Escape-1-speed"))()
        ]])
    end
end

SetupAutoExecute()

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()

local Window = OrionLib:MakeWindow({
    Name = "NightSystem", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest"
})


local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


local RebirthLabel = MainTab:AddLabel("Rebirths: Lade...")

task.spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        local bar = player.PlayerGui:FindFirstChild("GUI", true) and player.PlayerGui:FindFirstChild("GUI", true):FindFirstChild("HUD", true) and player.PlayerGui:FindFirstChild("GUI", true):FindFirstChild("HUD", true):FindFirstChild("Bottom", true) and player.PlayerGui:FindFirstChild("GUI", true):FindFirstChild("HUD", true):FindFirstChild("Bottom", true):FindFirstChild("Bar", true)
        
        if bar and bar:FindFirstChild("RebirthBoost") then
            RebirthLabel:Set("Rebirths: " .. bar.RebirthBoost.Text)
        end
        task.wait(1) 
    end
end)


local spamActive = false
local rebirthActive = false
local trailActive = false

MainTab:AddToggle({
    Name = "Auto Add Speed",
    Default = false,
    Config = true,  
    Callback = function(Value)
        spamActive = Value
        if spamActive then
            task.spawn(function()
                local event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddSpeed")
                while spamActive do
                    for i = 1,43 do
                        event:FireServer()
                    end
                    task.wait(3)
                end
            end)
        end
    end    
})

MainTab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Config = true,
    Callback = function(Value)
        rebirthActive = Value
        if rebirthActive then
            task.spawn(function()
                local event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RequestRebirth")
                while rebirthActive do
                    event:InvokeServer()
                    task.wait(0.5)
                end
            end)
        end
    end    
})

MainTab:AddToggle({
    Name = "Auto GoldenPhoenixTrail",
    Default = false,
    Config = true,
    Callback = function(Value)
        trailActive = Value
        if trailActive then
            task.spawn(function()
                local event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("TrailAction")
                while trailActive do
                    event:FireServer("BuyWins", "GoldenPhoenixTrail")
                    event:FireServer("Equip", "GoldenPhoenixTrail")
                    task.wait(1)
                end
            end)
        end
    end    
})


local FarmTab = Window:MakeTab({
    Name = "AutoFarm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local farmActive = false
local targetCoords = Vector3.new(779.464, 70.36, 1156.053)

FarmTab:AddToggle({
    Name = "Auto Teleport Farm",
    Default = false,
    Config = true,
    Callback = function(Value)
        farmActive = Value
        if farmActive then
            task.spawn(function()
                local player = game.Players.LocalPlayer
                while farmActive do
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoords)
                    end
                    task.wait() 
                end
            end)
        end
    end    
})

OrionLib:Init()