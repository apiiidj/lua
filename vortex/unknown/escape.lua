

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "NPVATN"
getgenv().scriptidentifier = "escape"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/NPVATN/ws-loader"))()




local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")


local remote = replicatedStorage:FindFirstChild("Events")
if remote then
    remote = remote:FindFirstChild("AddSpeed")
end


local farmPos = Vector3.new(-1287.40613, -100.879326, 552.77478)


local autoWinCFrame = CFrame.new(
    -1281.59082, 7.39915991, 1150.99072,
    -1.77621841e-05, 3.46451998e-07, -1,
    0.0391794406, 0.999232173, -3.46451998e-07,
    0.999232233, -0.0391794406, -1.77621841e-05
)


local stages = {
    {name = "Stage 1", cframe = CFrame.new(-355.842102, 0.733140945, -1.17143774, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
    {name = "Stage 2", cframe = CFrame.new(-616.061707, 0.733140945, -2.17143774, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
    {name = "Stage 3", cframe = CFrame.new(-868.061707, 0.733140945, -2.17143774, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
    {name = "Stage 4", cframe = CFrame.new(-1120.06165, 0.733140945, -1.17143774, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
    {name = "Stage 5", cframe = CFrame.new(-1264.99414, 0.806107998, 153.450394, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
    {name = "Stage 6", cframe = CFrame.new(-1269.18481, 0.0512050167, 654.634705, 1, -0, 0, 0, 0.999808013, 0.0195941571, -0, -0.0195941571, 0.999808013)},
    {name = "Stage 7", cframe = CFrame.new(-1265.25281, 6.88545084, 1117.12305, 1, -0, 0, 0, 0.999808013, 0.0195941571, -0, -0.0195941571, 0.999808013)},
}


local spamming = false
local spamConnection = nil
local autoWinActive = false
local autoWinConnection = nil
local count = 0





local function teleportToCFrame(cframe, showNotification)
    local char = player.Character
    if not char then
        local attempts = 0
        while not player.Character and attempts < 10 do
            task.wait(0.5)
            attempts = attempts + 1
            char = player.Character
        end
        if not char then
            if showNotification then
                Rayfield:Notify({ Title = "Fehler", Content = "Character nicht gefunden!", Duration = 2 })
            end
            return
        end
    end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then
        if showNotification then
            Rayfield:Notify({ Title = "Fehler", Content = "HumanoidRootPart fehlt!", Duration = 2 })
        end
        return
    end
    root.CFrame = cframe
    if showNotification then
        Rayfield:Notify({ Title = "Teleport", Content = "Erfolgreich teleportiert", Duration = 1.5 })
    end
end





local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()





local Window = Rayfield:CreateWindow({
    Name = "Sync Hub",
    Icon = 0,
    LoadingTitle = "Sync Hub",
    LoadingSubtitle = "by Messe Nord",
    ShowText = "Sync Hub",
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.Insert,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "SyncHub",
        FileName = "Settings"
    },
    Discord = {
        Enabled = true,
        Invite = "zaBzrT78MN",
        RememberJoins = true
    },
    KeySystem = false
})





local TeleportsTab = Window:CreateTab("Teleports", "map-pin")
local AutomationTab = Window:CreateTab("Automation", "settings")





TeleportsTab:CreateSection("Hidden Farm")

TeleportsTab:CreateButton({
    Name = "Teleport to Hidden Farm",
    Callback = function()
        teleportToCFrame(CFrame.new(farmPos), true)
    end
})

TeleportsTab:CreateSection("Stages")

for _, stage in ipairs(stages) do
    TeleportsTab:CreateButton({
        Name = "Teleport to " .. stage.name,
        Callback = function()
            teleportToCFrame(stage.cframe, true)
        end
    })
end





AutomationTab:CreateSection("Speed Spam")

local speedToggle = AutomationTab:CreateToggle({
    Name = "Add Speed Spam",
    CurrentValue = false,
    Flag = "SpeedSpam",
    Callback = function(Value)
        spamming = Value
        if spamming then
            if not spamConnection then
                spamConnection = runService.Heartbeat:Connect(function()
                    if spamming then
                        if remote then remote:FireServer() end
                        count = count + 1
                        if counterLabel then
                            counterLabel:Set("Sent: " .. count)
                        end
                    end
                end)
            end
            Rayfield:Notify({ Title = "Speed Spam", Content = "EIN", Duration = 1 })
        else
            if spamConnection then
                spamConnection:Disconnect()
                spamConnection = nil
            end
            Rayfield:Notify({ Title = "Speed Spam", Content = "AUS", Duration = 1 })
        end
    end
})

AutomationTab:CreateSection("Auto Win (neue Position)")


local autoToggle = AutomationTab:CreateToggle({
    Name = "Auto Win TP (Permanent)",
    CurrentValue = false,
    Flag = "AutoWin",
    Callback = function(Value)
        autoWinActive = Value
        if autoWinActive then
            if autoWinConnection then
                autoWinConnection:Disconnect()
                autoWinConnection = nil
            end
            
            autoWinConnection = runService.Heartbeat:Connect(function()
                if autoWinActive then
                    teleportToCFrame(autoWinCFrame, false) 
                end
            end)
            Rayfield:Notify({ Title = "Auto Win", Content = "PERMANENT ON (neue Position)", Duration = 1.5 })
        else
            if autoWinConnection then
                autoWinConnection:Disconnect()
                autoWinConnection = nil
            end
            Rayfield:Notify({ Title = "Auto Win", Content = "OFF", Duration = 1 })
        end
    end
})

AutomationTab:CreateSection("Info")

local remoteStatusLabel = AutomationTab:CreateLabel(
    "Remote: " .. (remote and "Gefunden" or "Nicht gefunden"),
    0,
    remote and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0),
    false
)

local counterLabel = AutomationTab:CreateLabel(
    "Sent: 0",
    0,
    Color3.fromRGB(200, 200, 200),
    false
)





Rayfield:LoadConfiguration()

print("Sync Hub (Rayfield) geladen! Drücke Insert, um das UI zu öffnen.")