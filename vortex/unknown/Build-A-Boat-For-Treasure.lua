

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "Build-A-Boat-For-Treasure"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")


local Config = {
    FlySpeed =500,
    FinalFlySpeed = 145, 
    WalkSpeed = 16,
    BuildDelay = 0.1,
    EquipDelay = 0.1,
    SitDelay = 0.1,
    RestartDelay = 0.1
}


task.spawn(function()
    local Event = Workspace:FindFirstChild("UpdateGroupMembershipStatus")
    if Event then
        pcall(function()
            Event:FireServer(game:GetService("GroupService"))
        end)
    end
end)


local targetParent = CoreGui
if not pcall(function() local _ = CoreGui.Name end) then
    targetParent = LocalPlayer:WaitForChild("PlayerGui")
end


if targetParent:FindFirstChild("MaxiAutoFarmUI") then
    targetParent.MaxiAutoFarmUI:Destroy()
end





local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MaxiAutoFarmUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = targetParent


local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 490, 0, 330)
MainFrame.Position = UDim2.new(0.5, -245, 0.4, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(40, 40, 55)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local MainShadow = Instance.new("UIStroke")
MainShadow.Transparency = 0.5
MainShadow.Color = Color3.fromRGB(0, 0, 0)
MainShadow.Thickness = 3
MainShadow.Parent = MainFrame


local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -35, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 210)
CloseButton.TextSize = 13
CloseButton.Font = Enum.Font.GothamBold
CloseButton.BorderSizePixel = 0
CloseButton.ZIndex = 5
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton


local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 110, 0, 36)
OpenButton.Position = UDim2.new(0, 20, 1, -50)
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
OpenButton.Text = "Open UI"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextSize = 13
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Visible = false
OpenButton.BorderSizePixel = 0
OpenButton.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 8)
OpenCorner.Parent = OpenButton

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)


local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 135, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar

local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, 0, 0, 50)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "MAXI FARM"
SidebarTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
SidebarTitle.TextSize = 14
SidebarTitle.Font = Enum.Font.GothamBold
SidebarTitle.Parent = Sidebar

local TabList = Instance.new("UIListLayout")
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 6)
TabList.Parent = Sidebar

SidebarTitle.LayoutOrder = 0


local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -145, 1, -20)
ContentContainer.Position = UDim2.new(0, 140, 0, 10)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame





local Tabs = {}
local TabButtons = {}

local function createTab(name, layoutOrder)
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = name .. "Tab"
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 3
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 70)
    tabFrame.Visible = false
    tabFrame.Parent = ContentContainer

    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 10)
    list.Parent = tabFrame

    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -16, 0, 34)
    btn.Position = UDim2.new(0, 8, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(140, 140, 160)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.LayoutOrder = layoutOrder
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        for tName, frame in pairs(Tabs) do
            frame.Visible = false
        end
        for _, button in pairs(TabButtons) do
            button.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
            button.TextColor3 = Color3.fromRGB(140, 140, 160)
        end
        tabFrame.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    Tabs[name] = tabFrame
    table.insert(TabButtons, btn)

    return tabFrame
end

local MainTab = createTab("Hauptseite", 1)
local SpeedTab = createTab("Speed / Fly", 2)
local DelayTab = createTab("Delays", 3)


Tabs["Hauptseite"].Visible = true
TabButtons[1].BackgroundColor3 = Color3.fromRGB(0, 170, 255)
TabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)





local function createSlider(parent, text, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    frame.BorderSizePixel = 0
    frame.Parent = parent

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 8)
    frameCorner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. tostring(default)
    label.TextColor3 = Color3.fromRGB(220, 220, 235)
    label.TextSize = 12
    label.Font = Enum.Font.GothamMedium
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -20, 0, 8)
    track.Position = UDim2.new(0, 10, 0, 30)
    track.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    track.BorderSizePixel = 0
    track.Parent = frame

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    fill.BorderSizePixel = 0
    fill.Parent = track

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = track

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob

    local draggingSlider = false

    local function update(input)
        local delta = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(delta, 0, 1, 0)
        knob.Position = UDim2.new(delta, 0, 0.5, 0)
        
        local val
        if type(default) == "number" and default % 1 ~= 0 then
            val = math.floor((min + (delta * (max - min))) * 100) / 100
        else
            val = math.floor(min + (delta * (max - min)))
        end
        
        label.Text = text .. ": " .. tostring(val)
        callback(val)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = true
            update(input)
        end
    end)

    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)

    return frame
end





local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -10, 0, 25)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Bereit"
StatusLabel.TextColor3 = Color3.fromRGB(0, 220, 130)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainTab

local TeamLabel = Instance.new("TextLabel")
TeamLabel.Size = UDim2.new(1, -10, 0, 20)
TeamLabel.BackgroundTransparency = 1
TeamLabel.Text = "Erkanntes Team: Auto"
TeamLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
TeamLabel.TextSize = 12
TeamLabel.Font = Enum.Font.Gotham
TeamLabel.TextXAlignment = Enum.TextXAlignment.Left
TeamLabel.Parent = MainTab

local function createActionButton(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = color or Color3.fromRGB(25, 25, 36)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.Parent = MainTab

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    return btn
end

local StartLoopButton = createActionButton("Auto-Loop Starten", Color3.fromRGB(0, 160, 95))
local BuildOnlyButton = createActionButton("Nur Bauen & Hinsetzen", Color3.fromRGB(30, 30, 44))
local LaunchOnlyButton = createActionButton("Starten & Fliegen", Color3.fromRGB(30, 30, 44))





createSlider(SpeedTab, "Flug-Geschwindigkeit", 50, 500, Config.FlySpeed, function(v)
    Config.FlySpeed = v
end)

createSlider(SpeedTab, "End-Geschwindigkeit (Letzte 2)", 20, 300, Config.FinalFlySpeed, function(v)
    Config.FinalFlySpeed = v
end)

createSlider(SpeedTab, "Lauf-Geschwindigkeit", 16, 250, Config.WalkSpeed, function(v)
    Config.WalkSpeed = v
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
end)

createSlider(DelayTab, "Bau-Verzoegerung (s)", 0.02, 1.0, Config.BuildDelay, function(v)
    Config.BuildDelay = v
end)

createSlider(DelayTab, "Equip-Verzoegerung (s)", 0.1, 2.0, Config.EquipDelay, function(v)
    Config.EquipDelay = v
end)

createSlider(DelayTab, "Sitz-Verzoegerung (s)", 0.1, 2.0, Config.SitDelay, function(v)
    Config.SitDelay = v
end)

createSlider(DelayTab, "Respawn-Verzoegerung (s)", 0.5, 5.0, Config.RestartDelay, function(v)
    Config.RestartDelay = v
end)





local TeamConfigurations = {
    ["Really blue"] = {
        ZoneName = "Really blueZone",
        Blocks = {
            {CFrame.new(15, 6.1000003814697, -119, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(340.83432006836, -11.899991989136, 304.49319458008, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(13, 6.1000003814697, -119, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(340.83432006836, -11.899991989136, 302.49319458008, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(15, 6.1000003814697, -121, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(342.83432006836, -11.899991989136, 304.49319458008, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(13, 6.1000003814697, -121, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(342.83432006836, -11.899991989136, 302.49319458008, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
        },
        Seat = {
            Index = 4,
            CF1 = CFrame.new(1, 3.5, 1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(341.83432006836, -8.3999919891357, 303.49319458008, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        }
    },
    ["Magenta"] = {
        ZoneName = "MagentaZone",
        Blocks = {
            {CFrame.new(5, 6.1000003814697, -120, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(341.83432006836, -11.899991989136, 652.69317626953, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(3, 6.1000003814697, -120, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(341.83432006836, -11.899991989136, 650.69317626953, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(5, 6.1000003814697, -122, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(343.83432006836, -11.899991989136, 652.69317626953, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(3, 6.1000003814697, -122, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(343.83432006836, -11.899991989136, 650.69317626953, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
        },
        Seat = {
            Index = 6,
            CF1 = CFrame.new(-1, 3.5, -1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(342.83438110352, -8.3999919891357, 651.69317626953, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        }
    },
    ["Black"] = {
        ZoneName = "BlackZone",
        Blocks = {
            {CFrame.new(1, 6.1000003814697, -123, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-451.96566772461, -11.899991989136, -73.10684967041, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(-1, 6.1000003814697, -123, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-451.96566772461, -11.899991989136, -71.10684967041, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(1, 6.1000003814697, -125, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-453.96566772461, -11.899991989136, -73.10684967041, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(-1, 6.1000003814697, -125, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-453.96566772461, -11.899991989136, -71.10684967041, 0, 0, 1, 0, 1, 0, -1, 0, 0)}
        },
        Seat = {
            Index = 14,
            CF1 = CFrame.new(1, 3.5, 1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(-452.96566772461, -8.3999919891357, -72.10684967041, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        }
    },
    ["Camo"] = {
        ZoneName = "CamoZone",
        Blocks = {
            {CFrame.new(-4, 6.1000003814697, -127, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-455.96566772461, -11.899991989136, 289.89315795898, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(-6, 6.1000003814697, -127, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-455.96566772461, -11.899991989136, 291.89315795898, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(-4, 6.1000003814697, -129, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-457.96566772461, -11.899991989136, 289.89315795898, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(-6, 6.1000003814697, -129, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-457.96566772461, -11.899991989136, 291.89315795898, 0, 0, 1, 0, 1, 0, -1, 0, 0)}
        },
        Seat = {
            Index = 17,
            CF1 = CFrame.new(1, 3.5, -1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(-456.96566772461, -8.3999919891357, 290.89315795898, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        }
    },
    ["New Yeller"] = {
        ZoneName = "New YellerZone",
        Blocks = {
            {CFrame.new(5, 6.1000003814697, -131, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-459.96566772461, -11.899991989136, 638.89318847656, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(3, 6.1000003814697, -131, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-459.96566772461, -11.899991989136, 640.89318847656, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(5, 6.1000003814697, -133, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-461.96566772461, -11.899991989136, 638.89318847656, 0, 0, 1, 0, 1, 0, -1, 0, 0)},
            {CFrame.new(3, 6.1000003814697, -133, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-461.96566772461, -11.899991989136, 640.89318847656, 0, 0, 1, 0, 1, 0, -1, 0, 0)}
        },
        Seat = {
            Index = 22,
            CF1 = CFrame.new(1, 3.5, -1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(-460.96566772461, -8.3999919891357, 639.89318847656, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        }
    },
    ["Really red"] = {
        ZoneName = "Really redZone",
        Blocks = {
            {CFrame.new(8, 6.1000003814697, -126, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(347.83432006836, -11.899991989136, -60.706787109375, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(6, 6.1000003814697, -126, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(347.83432006836, -11.899991989136, -62.706787109375, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(8, 6.1000003814697, -128, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(349.83432006836, -11.899991989136, -60.706787109375, 0, 0, -1, 0, 1, 0, 1, 0, 0)},
            {CFrame.new(6, 6.1000003814697, -128, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(349.83432006836, -11.899991989136, -62.706787109375, 0, 0, -1, 0, 1, 0, 1, 0, 0)}
        },
        Seat = {
            Index = 2,
            CF1 = CFrame.new(1, 3.5, -1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(348.83432006836, -8.3999919891357, -61.706787109375, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        }
    },
    ["White"] = {
        ZoneName = "WhiteZone",
        Blocks = {
            {CFrame.new(3, 6.1, -114, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-50.56, -11.9, -459.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
            {CFrame.new(1, 6.1, -114, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-52.56, -11.9, -459.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
            {CFrame.new(3, 6.1, -112, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-50.56, -11.9, -457.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
            {CFrame.new(1, 6.1, -112, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-52.56, -11.9, -457.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
        },
        Seat = {
            Index = 3,
            CF1 = CFrame.new(-1, 3.5, -1, -1, 0, 0, 0, 1, 0, 0, 0, -1),
            CF2 = CFrame.new(-51.56, -8.4, -458.5, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        }
    }
}

local function getTeamConfig()
    local team = LocalPlayer.Team
    local teamName = team and team.Name or "White"

    if TeamConfigurations[teamName] then
        TeamLabel.Text = "Erkanntes Team: " .. teamName
        return TeamConfigurations[teamName], teamName
    end

    local lower = teamName:lower()
    if lower:find("blue") or lower:find("blau") then teamName = "Really blue"
    elseif lower:find("magenta") or lower:find("lila") or lower:find("purple") then teamName = "Magenta"
    elseif lower:find("black") or lower:find("schwarz") then teamName = "Black"
    elseif lower:find("camo") or lower:find("grün") or lower:find("green") then teamName = "Camo"
    elseif lower:find("yeller") or lower:find("yellow") or lower:find("gelb") then teamName = "New Yeller"
    elseif lower:find("red") or lower:find("rot") then teamName = "Really red"
    else teamName = "White" end

    TeamLabel.Text = "Erkanntes Team: " .. teamName
    return TeamConfigurations[teamName], teamName
end





local isAutoLoopRunning = false

local Waypoints = {
    Vector3.new(-44.59, 27.27, 668.73),
    Vector3.new(-34.50, 41.38, 1280.30),
    Vector3.new(-57.24, 43.51, 1731.89),
    Vector3.new(-45.25, 40.27, 2344.16),
    Vector3.new(-40.79, 33.50, 3083.27),
    Vector3.new(-47.14, 52.10, 3734.94),
    Vector3.new(-24.35, 52.53, 4483.09),
    Vector3.new(-41.85, 59.32, 5524.72),
    Vector3.new(-40.19, 67.28, 6341.17),
    Vector3.new(-35.35, 40.46, 7091.03),
    Vector3.new(-11.20, 5.48, 7484.71),
    Vector3.new(-46.83, 59.01, 7593.21),
    Vector3.new(-39.37, 78.22, 8106.23),
    Vector3.new(-50.23, 46.71, 8671.46),
    Vector3.new(-30.14, -305.63, 8769.09),
    Vector3.new(-55.707, -358.74, 9492.356)
}

local function clearBoat()
    StatusLabel.Text = "Status: Loesche alte Bloecke..."
    if Workspace:FindFirstChild("ClearAllPlayersBoatParts") then
        Workspace.ClearAllPlayersBoatParts:FireServer()
        task.wait(0.5)
    end
end

local function equipSlotTwo()
    StatusLabel.Text = "Status: Waehle Bautool..."
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Two, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Two, false, game)
    task.wait(Config.EquipDelay)
    
    local char = LocalPlayer.Character
    local backpackTools = LocalPlayer.Backpack:GetChildren()
    if char and char:FindFirstChild("Humanoid") and backpackTools[2] and backpackTools[2]:IsA("Tool") then
        char.Humanoid:EquipTool(backpackTools[2])
    end
    task.wait(0.2)
end

local function getBuildingRF()
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("BuildingTool")
    if not tool then
        tool = LocalPlayer.Backpack:FindFirstChild("BuildingTool")
    end
    if tool and tool:FindFirstChild("RF") then
        return tool.RF
    end
    return nil
end

local function joinTeam()
    StatusLabel.Text = "Status: Checke Team..."
    if not LocalPlayer.Team then
        StatusLabel.Text = "Status: Trete Team bei..."
        if Workspace:FindFirstChild("ChangeTeam") then
            Workspace.ChangeTeam:FireServer(game:GetService("Teams").white)
            task.wait(1.5)
        end
    end
end

local function buildStructure()
    local config, teamName = getTeamConfig()
    StatusLabel.Text = "Status: Baue (" .. teamName .. ")..."

    local RF = getBuildingRF()
    if not RF then 
        StatusLabel.Text = "Status: BuildingTool nicht gefunden!"
        return 
    end

    local zone = Workspace:FindFirstChild(config.ZoneName)
    if not zone then
        StatusLabel.Text = "Status: Zone nicht gefunden!"
        return
    end

    for _, bData in ipairs(config.Blocks) do
        RF:InvokeServer("WoodBlock", 8, zone, bData[1], true, bData[2], false)
        task.wait(Config.BuildDelay)
    end

    local playerBlocks = Workspace.Blocks:FindFirstChild(LocalPlayer.Name)
    local targetPart = nil

    if playerBlocks then
        local children = playerBlocks:GetChildren()
        if children[config.Seat.Index] and children[config.Seat.Index]:FindFirstChild("PPart") then
            targetPart = children[config.Seat.Index].PPart
        else
            for i = #children, 1, -1 do
                if children[i]:FindFirstChild("PPart") then
                    targetPart = children[i].PPart
                    break
                end
            end
        end
    end

    if targetPart then
        RF:InvokeServer("CarSeat", 1, targetPart, config.Seat.CF1, true, config.Seat.CF2, false)
    end
    task.wait(Config.SitDelay)
end

local function sitInSeat()
    StatusLabel.Text = "Status: Setze in Seat..."
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")

    local playerFolder = Workspace.Blocks:FindFirstChild(LocalPlayer.Name)
    if playerFolder then
        local carSeat = playerFolder:FindFirstChild("CarSeat", true)
        if carSeat then
            local vehicleSeat = carSeat:FindFirstChild("VehicleSeat") or carSeat:FindFirstChildWhichIsA("VehicleSeat")
            if vehicleSeat then
                vehicleSeat:Sit(humanoid)
                task.wait(0.5)
            end
        end
    end
end

local function launchBoat()
    StatusLabel.Text = "Status: Starte..."
    local config = getTeamConfig()
    local zone = Workspace:FindFirstChild(config.ZoneName)
    if zone and zone:FindFirstChild("VoteLaunchRE") then
        zone.VoteLaunchRE:FireServer()
    else
        for _, v in ipairs(Workspace:GetChildren()) do
            if v.Name:find("Zone") and v:FindFirstChild("VoteLaunchRE") then
                v.VoteLaunchRE:FireServer()
                break
            end
        end
    end
end

local function startCarFly()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local hrp = char.HumanoidRootPart
    if hrp:FindFirstChild("AutoFlyVelocity") then
        hrp.AutoFlyVelocity:Destroy()
    end

    local bv = Instance.new("BodyVelocity")
    bv.Name = "AutoFlyVelocity"
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = hrp

    task.spawn(function()
        for i, targetPos in ipairs(Waypoints) do
            if not isAutoLoopRunning then break end
            
            StatusLabel.Text = "Status: Fliege zu Punkt " .. i .. "/" .. #Waypoints
            
            while char and char.Parent and hrp and isAutoLoopRunning do
                local distance = (hrp.Position - targetPos).Magnitude
                if distance < 30 then
                    break 
                end
                
                local direction = (targetPos - hrp.Position).Unit
                
                
                local currentSpeed = Config.FlySpeed
                if i >= #Waypoints - 1 then
                    currentSpeed = Config.FinalFlySpeed
                end
                
                bv.Velocity = direction * currentSpeed
                task.wait() 
            end
        end
        
        if isAutoLoopRunning then
            StatusLabel.Text = "Status: Schatztruhe erreicht!"
            if bv then bv:Destroy() end
        end
    end)
end

local function runFullProcess()
    if not isAutoLoopRunning then return end
    clearBoat()         
    if not isAutoLoopRunning then return end
    joinTeam()          
    if not isAutoLoopRunning then return end
    equipSlotTwo()      
    if not isAutoLoopRunning then return end
    buildStructure()    
    if not isAutoLoopRunning then return end
    sitInSeat()         
    if not isAutoLoopRunning then return end
    launchBoat()        
    task.wait(1)
    if not isAutoLoopRunning then return end
    startCarFly()       
end





StartLoopButton.MouseButton1Click:Connect(function()
    isAutoLoopRunning = not isAutoLoopRunning
    if isAutoLoopRunning then
        StartLoopButton.Text = "Auto-Loop Stoppen"
        StartLoopButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.spawn(runFullProcess)
    else
        StartLoopButton.Text = "Auto-Loop Starten"
        StartLoopButton.BackgroundColor3 = Color3.fromRGB(0, 160, 95)
        StatusLabel.Text = "Status: Gestoppt"
    end
end)

BuildOnlyButton.MouseButton1Click:Connect(function()
    task.spawn(function()
        clearBoat()
        equipSlotTwo()
        buildStructure()
        sitInSeat()
        StatusLabel.Text = "Status: Gebaut & Gesessen"
    end)
end)

LaunchOnlyButton.MouseButton1Click:Connect(function()
    launchBoat()
    startCarFly()
end)

local function onCharacterAdded(char)
    local humanoid = char:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.Died:Connect(function()
            if isAutoLoopRunning then
                StatusLabel.Text = "Status: Gestorben! Loesche Boot..."
                if Workspace:FindFirstChild("ClearAllPlayersBoatParts") then
                    Workspace.ClearAllPlayersBoatParts:FireServer()
                end
            end
        end)
    end

    if isAutoLoopRunning then
        StatusLabel.Text = "Status: Respawn erkannt..."
        task.wait(Config.RestartDelay) 
        task.spawn(runFullProcess)
    end
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

if LocalPlayer.Character then
    task.spawn(onCharacterAdded, LocalPlayer.Character)
end


local draggingWindow, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingWindow = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingWindow = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and draggingWindow then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)