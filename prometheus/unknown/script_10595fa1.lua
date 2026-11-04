--[[
    ██████╗  █████╗ ██████╗ ██╗  ██╗     █████╗ ██╗     ██████╗ ██╗  ██╗ █████╗ 
    ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ██╔══██╗██║     ██╔══██╗██║  ██║██╔══██╗
    ██║  ██║███████║██████╔╝█████╔╝     ███████║██║     ██████╔╝███████║███████║
    ██║  ██║██╔══██║██╔══██╗██╔═██╗     ██╔══██║██║     ██╔═══╝ ██╔══██║██╔══██║
    ██████╔╝██║  ██║██║  ██║██║  ██╗    ██║  ██║███████╗██║     ██║  ██║██║  ██║
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝
    
    DARK ALPHA | Horror Script (Fixed)
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean old instances safely
pcall(function()
    if CoreGui:FindFirstChild("DarkAlpha") then CoreGui.DarkAlpha:Destroy() end
    if PlayerGui:FindFirstChild("DarkAlpha") then PlayerGui.DarkAlpha:Destroy() end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarkAlpha"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999

-- Safe parent fallback
local successParent = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successParent then
    ScreenGui.Parent = PlayerGui
end

-- ==================== FULL DARK OVERLAY ====================
local DarkOverlay = Instance.new("Frame", ScreenGui)
DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
DarkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DarkOverlay.BackgroundTransparency = 1
DarkOverlay.BorderSizePixel = 0
DarkOverlay.ZIndex = 10

TweenService:Create(DarkOverlay, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
    BackgroundTransparency = 0
}):Play()

task.wait(1.8)

-- ==================== ALPHA TEXT APPEAR ====================
local AlphaText = Instance.new("TextLabel", ScreenGui)
AlphaText.Size = UDim2.new(1, 0, 0, 80)
AlphaText.Position = UDim2.new(0, 0, 0.4, 0)
AlphaText.BackgroundTransparency = 1
AlphaText.Text = "ALPHA"
AlphaText.Font = Enum.Font.GothamBlack
AlphaText.TextSize = 60
AlphaText.TextColor3 = Color3.fromRGB(180, 0, 0)
AlphaText.TextTransparency = 1
AlphaText.ZIndex = 15

TweenService:Create(AlphaText, TweenInfo.new(2.5, Enum.EasingStyle.Quad), {
    TextTransparency = 0
}):Play()

task.wait(3.2)

-- ==================== WOLF SILHOUETTE ====================
local WolfFrame = Instance.new("Frame", ScreenGui)
WolfFrame.Size = UDim2.new(0, 200, 0, 160)
WolfFrame.Position = UDim2.new(0.5, -100, 0.55, 0)
WolfFrame.BackgroundTransparency = 1
WolfFrame.ZIndex = 14

local Wolf = Instance.new("TextLabel", WolfFrame)
Wolf.Size = UDim2.new(1, 0, 1, 0)
Wolf.BackgroundTransparency = 1
Wolf.Text = "🐺"
Wolf.TextSize = 90
Wolf.TextTransparency = 1
Wolf.ZIndex = 14

TweenService:Create(Wolf, TweenInfo.new(1.8), {
    TextTransparency = 0
}):Play()

task.spawn(function()
    while Wolf and Wolf.Parent do
        TweenService:Create(Wolf, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextSize = 100
        }):Play()
        task.wait(0.8)
        TweenService:Create(Wolf, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextSize = 90
        }):Play()
        task.wait(0.8)
    end
end)

task.wait(2.5)

-- ==================== MAIN HORROR UI ====================
local MainUI = Instance.new("Frame", ScreenGui)
MainUI.Size = UDim2.new(0, 320, 0, 220)
MainUI.Position = UDim2.new(0.5, -160, 0.5, -110)
MainUI.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
MainUI.BorderSizePixel = 0
MainUI.BackgroundTransparency = 1
MainUI.ZIndex = 20
Instance.new("UICorner", MainUI).CornerRadius = UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke", MainUI)
UIStroke.Color = Color3.fromRGB(120, 0, 0)
UIStroke.Thickness = 1.5
UIStroke.Transparency = 1

TweenService:Create(MainUI, TweenInfo.new(1.2), {BackgroundTransparency = 0}):Play()
TweenService:Create(UIStroke, TweenInfo.new(1.2), {Transparency = 0.3}):Play()

local Title = Instance.new("TextLabel", MainUI)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "DARK ALPHA"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(180, 20, 20)
Title.ZIndex = 21

local Sub = Instance.new("TextLabel", MainUI)
Sub.Size = UDim2.new(1, 0, 0, 20)
Sub.Position = UDim2.new(0, 0, 0, 38)
Sub.BackgroundTransparency = 1
Sub.Text = "there is nothing here..."
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 12
Sub.TextColor3 = Color3.fromRGB(100, 100, 100)
Sub.ZIndex = 21

local NothingBtn = Instance.new("TextButton", MainUI)
NothingBtn.Size = UDim2.new(0.8, 0, 0, 42)
NothingBtn.Position = UDim2.new(0.1, 0, 0, 90)
NothingBtn.BackgroundColor3 = Color3.fromRGB(20, 10, 10)
NothingBtn.Text = "NOTHING"
NothingBtn.Font = Enum.Font.GothamBold
NothingBtn.TextSize = 16
NothingBtn.TextColor3 = Color3.fromRGB(160, 40, 40)
NothingBtn.ZIndex = 21
Instance.new("UICorner", NothingBtn).CornerRadius = UDim.new(0, 8)

local NothingStroke = Instance.new("UIStroke", NothingBtn)
NothingStroke.Color = Color3.fromRGB(100, 0, 0)
NothingStroke.Thickness = 1

local LeaveBtn = Instance.new("TextButton", MainUI)
LeaveBtn.Size = UDim2.new(0.8, 0, 0, 42)
LeaveBtn.Position = UDim2.new(0.1, 0, 0, 145)
LeaveBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LeaveBtn.Text = "LEAVE"
LeaveBtn.Font = Enum.Font.GothamBold
LeaveBtn.TextSize = 15
LeaveBtn.TextColor3 = Color3.fromRGB(80, 80, 80)
LeaveBtn.Visible = false
LeaveBtn.ZIndex = 21
Instance.new("UICorner", LeaveBtn).CornerRadius = UDim.new(0, 8)

local FreezeOverlay = Instance.new("Frame", ScreenGui)
FreezeOverlay.Size = UDim2.new(1, 0, 1, 0)
FreezeOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FreezeOverlay.BackgroundTransparency = 1
FreezeOverlay.BorderSizePixel = 0
FreezeOverlay.ZIndex = 50
FreezeOverlay.Visible = false

NothingBtn.MouseButton1Click:Connect(function()
    NothingBtn.Text = "..."
    NothingBtn.TextColor3 = Color3.fromRGB(80, 0, 0)
    
    FreezeOverlay.Visible = true
    TweenService:Create(FreezeOverlay, TweenInfo.new(0.4), {
        BackgroundTransparency = 0
    }):Play()
    
    task.wait(5)
    
    TweenService:Create(FreezeOverlay, TweenInfo.new(0.8), {
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.9)
    FreezeOverlay.Visible = false
    
    LeaveBtn.Visible = true
    LeaveBtn.TextColor3 = Color3.fromRGB(160, 40, 40)
    NothingBtn.Text = "NOTHING"
    NothingBtn.TextColor3 = Color3.fromRGB(100, 30, 30)
end)

-- ==================== LEAVE / LOAD RAYFIELD ====================
LeaveBtn.MouseButton1Click:Connect(function()
    LeaveBtn.Text = "SHIFTING..."
    
    TweenService:Create(DarkOverlay, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
    TweenService:Create(MainUI, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
    TweenService:Create(AlphaText, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    TweenService:Create(Wolf, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    
    task.wait(1.5)
    ScreenGui:Destroy()
    
    -- Load Rayfield safely without broken teleports
    local success, Rayfield = pcall(function()
        return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    end)
    
    if success and Rayfield then
        local Window = Rayfield:CreateWindow({
            Name = "DARK ALPHA",
            LoadingTitle = "DARK ALPHA",
            LoadingSubtitle = "Horror System",
            ConfigurationSaving = {Enabled = false},
            KeySystem = false
        })
        
        local Tab = Window:CreateTab("Scripts", "moon")
        
        local ScriptList = {
            {Name = "Infinite Yield", Url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
            {Name = "Dex Explorer", Url = "https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"},
            {Name = "Remote Spy", Url = "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"},
            {Name = "Hydro Hub", Url = "https://raw.githubusercontent.com/HydroFoundation/Hydro/main/HydroHub"},
            {Name = "Unnamed ESP", Url = "https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"},
        }
        
        for _, scriptData in ipairs(ScriptList) do
            Tab:CreateButton({
                Name = scriptData.Name,
                Callback = function()
                    pcall(function()
                        loadstring(game:HttpGet(scriptData.Url))()
                    end)
                end
            })
        end
        
        Rayfield:Notify({
            Title = "DARK ALPHA",
            Content = "System Online & Scripts Loaded",
            Duration = 4
        })
    else
        warn("Failed to load Rayfield UI library.")
    end
end)

print("DARK ALPHA initialized successfully.")