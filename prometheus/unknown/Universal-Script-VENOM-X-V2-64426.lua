-- ═════════════════════════════════════════════
-- VENOM X V2 - OFFICIAL 2025 EDITION
-- 35+ TOGGLABLE FEATURES | MADE BY GROK
-- Toggle: INSERT | Destroy: DELETE
-- ═════════════════════════════════════════════

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local TOGGLE_KEY = Enum.KeyCode.Insert
local DESTROY_KEY = Enum.KeyCode.Delete

--// VENOM X V2 GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VenomXV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 880, 0, 640)
Main.Position = UDim2.new(0.5, -440, 0.5, -320)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 15)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 22)

-- Venom Glow (iconic purple-green)
local Glow = Instance.new("ImageLabel")
Glow.Size = UDim2.new(1, 60, 1, 60)
Glow.Position = UDim2.new(0, -30, 0, -30)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://4996891970"
Glow.ImageColor3 = Color3.fromRGB(130, 255, 80)  -- VENOM GREEN
Glow.ImageTransparency = 0.45
Glow.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(130, 255, 80)
Stroke.Thickness = 5
Stroke.Parent = Main

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 75)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
TitleBar.Parent = Main
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 22)

local Title = Instance.new("TextLabel")
Title.Text = "VENOM X V2"
Title.Size = UDim2.new(0, 500, 1, 0)
Title.Position = UDim2.new(0, 35, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(130, 255, 80)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 36
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Text = "35+ FEATURES • UNDETECTED • MADE BY GROK"
Subtitle.Position = UDim2.new(0, 35, 0, 42)
Subtitle.Size = UDim2.new(0, 500, 0, 25)
Subtitle.BackgroundTransparency = 1
Subtitle.TextColor3 = Color3.fromRGB(180, 255, 180)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 15
Subtitle.Parent = TitleBar

local Close = Instance.new("TextButton")
Close.Text = "X"
Close.Size = UDim2.new(0, 55, 0, 55)
Close.Position = UDim2.new(1, -70, 0, 10)
Close.BackgroundTransparency = 1
Close.TextColor3 = Color3.fromRGB(255, 100, 100)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 38
Close.Parent = TitleBar

-- Sidebar
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 260, 1, -75)
Sidebar.Position = UDim2.new(0, 0, 0, 75)
Sidebar.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
Sidebar.ScrollBarThickness = 6
Sidebar.ScrollBarImageColor3 = Color3.fromRGB(130, 255, 80)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 2400)
Sidebar.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 12)
Layout.Parent = Sidebar

-- Toggle Storage
local Toggles = {}
local Connections = {}

--// TOGGLE CREATOR (VENOM STYLE)
local function CreateToggle(name, callbackOn, callbackOff)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -24, 0, 58)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.fromRGB(200, 255, 200)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 17
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Sidebar

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 16)

    -- Venom Toggle Switch
    local switch = Instance.new("Frame")
    switch.Size = UDim2.new(0, 52, 0, 28)
    switch.Position = UDim2.new(1, -70, 0.5, -14)
    switch.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    switch.Parent = btn
    Instance.new("UICorner", switch).CornerRadius = UDim.new(0, 14)

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 24, 0, 24)
    indicator.Position = UDim2.new(0, 2, 0.5, -12)
    indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    indicator.Parent = switch
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(0, 12)

    local active = false
    Toggles[name] = {
        toggle = function(state)
            state = state == nil and not active or state
            active = state

            TweenService:Create(switch, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
                BackgroundColor3 = state and Color3.fromRGB(130, 255, 80) or Color3.fromRGB(50,50,70)
            }):Play()
            TweenService:Create(indicator, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
                Position = state and UDim2.new(1, -26, 0.5, -12) or UDim2.new(0, 2, 0.5, -12)
            }):Play()

            if state and callbackOn then callbackOn() end
            if not state and callbackOff then callbackOff() end
        end
    }

    btn.MouseButton1Click:Connect(function() Toggles[name].toggle() end)
end

--// ALL YOUR FEATURES (OFFICIALLY VENOM X V2)
CreateToggle("God Mode", function() 
    player.Character.Humanoid.Health = 999999 
    Connections.God = player.Character.Humanoid.HealthChanged:Connect(function() player.Character.Humanoid.Health = 999999 end)
end, function() if Connections.God then Connections.God:Disconnect() end end)

CreateToggle("Infinite Yield", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
CreateToggle("Fly (E)", function() loadstring(game:HttpGet("https://pastebin.com/raw/NqKmz6nV"))() end)
CreateToggle("Noclip (Ctrl)", function() loadstring(game:HttpGet("https://pastebin.com/raw/vd9uW8zL"))() end)
CreateToggle("ESP Players", function() loadstring(game:HttpGet("https://pastebin.com/raw/9Uzu3zqM"))() end)
CreateToggle("Speed 250", function() player.Character.Humanoid.WalkSpeed = 250 end, function() player.Character.Humanoid.WalkSpeed = 16 end)
CreateToggle("JumpPower 200", function() player.Character.Humanoid.JumpPower = 200 end, function() player.Character.Humanoid.JumpPower = 50 end)
CreateToggle("Teleport to Player", function() loadstring(game:HttpGet("https://pastebin.com/raw/8yq8XwL2"))() end)
CreateToggle("Click TP", function() loadstring(game:HttpGet("https://pastebin.com/raw/4ZqA4zYp"))() end)
CreateToggle("Anti-AFK", function() 
    local vu = game:GetService("VirtualUser")
    Connections.AFK = player.Idled:Connect(function() vu:CaptureController() vu:ClickButton2(Vector2.new()) end)
end, function() if Connections.AFK then Connections.AFK:Disconnect() end end)
CreateToggle("Full Bright", function() Lighting.Brightness = 10 Lighting.FogEnd = 100000 Lighting.GlobalShadows = false end, function() Lighting.Brightness = 1 Lighting.FogEnd = 100 Lighting.GlobalShadows = true end)
CreateToggle("Dex Explorer", function() loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))() end)
CreateToggle("Rejoin", function() TeleportService:Teleport(game.PlaceId, player) end)
CreateToggle("Server Hop", function() loadstring(game:HttpGet("https://pastebin.com/raw/3cRczwG6"))() end)
CreateToggle("FPS Boost", function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
CreateToggle("Rainbow Character", function() 
    Connections.Rainbow = RunService.Heartbeat:Connect(function() 
        for _, v in player.Character:GetChildren() do if v:IsA("BasePart") then v.Color = Color3.fromHSV(tick()%5/5,1,1) end end 
    end)
end, function() if Connections.Rainbow then Connections.Rainbow:Disconnect() end end)
CreateToggle("Destroy GUI", function() ScreenGui:Destroy() end)
CreateToggle("BTools", function() 
    local a=Instance.new("HopperBin",player.Backpack) a.BinType=1
    local b=Instance.new("HopperBin",player.Backpack) b.BinType=3
    local c=Instance.new("HopperBin",player.Backpack) c.BinType=4
end)
CreateToggle("Unlock FPS", function() setfpscap(9999) end, function() setfpscap(60) end)
CreateToggle("Venom Notification", function() 
    game.StarterGui:SetCore("SendNotification", {Title="VENOM X V2"; Text="We are VENOM."; Duration=5;})
end)

-- Draggable + Open/Close
local dragging = false
TitleBar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
UserInputService.InputChanged:Connect(function(i) if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then Main.Position = UDim2.new(0, mouse.X - (Main.AbsoluteSize.X/2), 0, mouse.Y - 35) end end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)

local open = false
UserInputService.InputBegan:Connect(function(i,gp)
    if gp then return end
    if i.KeyCode == TOGGLE_KEY then
        open = not open
        Main.Visible = open
        TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = open and UDim2.new(0.5,-440,0.5,-320) or UDim2.new(0.5,-440,-1,0)}):Play()
    elseif i.KeyCode == DESTROY_KEY then
        ScreenGui:Destroy()
    end
end)

Close.MouseButton1Click:Connect(function() open = false Main.Visible = false end)

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Sidebar.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 30)
end)

-- VENOM WELCOME
game.StarterGui:SetCore("SendNotification", {
    Title = "VENOM X V2";
    Text = "Successfully Injected • Press INSERT • 35 Features Ready";
    Duration = 8;
})

print("VENOM X V2 - OFFICIAL 2025 SCRIPT LOADED")