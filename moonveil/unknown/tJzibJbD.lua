--[[
███╗░░░███╗███╗░░░███╗██████╗░ ██████╗░░█████╗░██████╗░██╗░░██╗ ██████╗░░█████╗░██████╗░██╗░░██╗
████╗░████║████╗░████║╚════██╗ ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝ ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝
██╔████╔██║██╔████╔██║░░░███╔╝ ██║░░██║███████║██████╔╝█████═╝░ ██║░░██║███████║██████╔╝█████═╝░
██║╚██╔╝██║██║╚██╔╝██║░ ███╔╝░ ██║░░██║██╔══██║██╔══██╗██╔═██╗░ ██║░░██║██╔══██║██╔══██╗██╔═██╗
██║░╚═╝░██║██║░╚═╝░██║███████╗ ██████╔╝██║░░██║██║░░██║██║░╚██╗ ██████╔╝██║░░██║██║░░██║██║░╚██╗
╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚══════╝ ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝ ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝
]]

-- Clear existing GUI
if game.CoreGui:FindFirstChild("MM2DARKCLASSICHUB") then
    game.CoreGui.MM2DARKCLASSICHUB:Destroy()
end

-- Place ID Check
if game.PlaceId ~= 142823291 then
    game:GetService("Players").LocalPlayer:Kick("This script only supports Murder Mystery 2!")
    return
end

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2DARKCLASSICHUB"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Container Window (Dark Glassmorphism UI)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.BackgroundTransparency = 0.08
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -220)
MainFrame.Size = UDim2.new(0, 340, 0, 450)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 10)
UICornerMain.Parent = MainFrame

local UIStrokeMain = Instance.new("UIStroke")
UIStrokeMain.Color = Color3.fromRGB(80, 80, 110)
UIStrokeMain.Thickness = 1.8
UIStrokeMain.Parent = MainFrame

-- Top Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
TitleBar.BackgroundTransparency = 0.05
TitleBar.Size = UDim2.new(1, 0, 0, 38)

local UICornerTitle = Instance.new("UICorner")
UICornerTitle.CornerRadius = UDim.new(0, 10)
UICornerTitle.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.Parent = TitleBar
TitleFix.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
TitleFix.BorderSizePixel = 0
TitleFix.Position = UDim2.new(0, 0, 1, -10)
TitleFix.Size = UDim2.new(1, 0, 0, 10)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -45, 1, 0)
Title.Position = UDim2.new(0, 14, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 DARK CLASSIC HUB"
Title.TextColor3 = Color3.fromRGB(245, 245, 255)
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TitleBar
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
MinimizeBtn.BackgroundTransparency = 0.5
MinimizeBtn.Position = UDim2.new(1, -34, 0.5, -13)
MinimizeBtn.Size = UDim2.new(0, 26, 0, 26)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "─"
MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
MinimizeBtn.TextSize = 13
MinimizeBtn.AutoButtonColor = false

local UICornerMin = Instance.new("UICorner")
UICornerMin.CornerRadius = UDim.new(0, 6)
UICornerMin.Parent = MinimizeBtn

MinimizeBtn.MouseEnter:Connect(function()
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
    MinimizeBtn.BackgroundTransparency = 0.2
end)
MinimizeBtn.MouseLeave:Connect(function()
    MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    MinimizeBtn.BackgroundTransparency = 0.5
end)

-- Navigation Bar (Tabs)
local NavBar = Instance.new("Frame")
NavBar.Parent = MainFrame
NavBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
NavBar.BackgroundTransparency = 0.4
NavBar.Position = UDim2.new(0, 10, 0, 46)
NavBar.Size = UDim2.new(1, -20, 0, 36)

local UICornerNav = Instance.new("UICorner")
UICornerNav.CornerRadius = UDim.new(0, 8)
UICornerNav.Parent = NavBar

local NavLayout = Instance.new("UIListLayout")
NavLayout.Parent = NavBar
NavLayout.FillDirection = Enum.FillDirection.Horizontal
NavLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavLayout.Padding = UDim.new(0, 3)

local function createTabButton(text, order)
    local btn = Instance.new("TextButton")
    btn.Parent = NavBar
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    btn.BackgroundTransparency = 0.4
    btn.Size = UDim2.new(0.25, -2, 1, 0)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(130, 130, 160)
    btn.TextSize = 10
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 7)
    corner.Parent = btn
    
    return btn
end

local HomeTabBtn = createTabButton("HOME", 1)
local UniversalTabBtn = createTabButton("UNIVERSAL", 2)
local MiscTabBtn = createTabButton("MISC", 3)
local SettingsTabBtn = createTabButton("SETTINGS", 4)

-- Pages Container
local PagesContainer = Instance.new("Frame")
PagesContainer.Parent = MainFrame
PagesContainer.BackgroundTransparency = 1
PagesContainer.Position = UDim2.new(0, 0, 0, 88)
PagesContainer.Size = UDim2.new(1, 0, 1, -88)

local function createPage()
    local page = Instance.new("ScrollingFrame")
    page.Parent = PagesContainer
    page.Active = true
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.Size = UDim2.new(1, 0, 1, 0)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(90, 90, 130)
    page.Visible = false

    local layout = Instance.new("UIListLayout")
    layout.Parent = page
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)

    local padding = Instance.new("UIPadding")
    padding.Parent = page
    padding.PaddingTop = UDim.new(0, 4)
    padding.PaddingBottom = UDim.new(0, 16)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    
    return page
end

local HomePage = createPage()
HomePage.Visible = true
local UniversalPage = createPage()
local MiscPage = createPage()
local SettingsPage = createPage()

-- Tab Switch Logic
local tabs = {
    {btn = HomeTabBtn, page = HomePage},
    {btn = UniversalTabBtn, page = UniversalPage},
    {btn = MiscTabBtn, page = MiscPage},
    {btn = SettingsTabBtn, page = SettingsPage}
}

for _, t in ipairs(tabs) do
    t.btn.MouseButton1Click:Connect(function()
        for _, other in ipairs(tabs) do
            other.page.Visible = false
            TweenService:Create(other.btn, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(130, 130, 160),
                BackgroundColor3 = Color3.fromRGB(22, 22, 30)
            }):Play()
        end
        t.page.Visible = true
        TweenService:Create(t.btn, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundColor3 = Color3.fromRGB(50, 50, 80)
        }):Play()
    end)
end

HomeTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)

local function createCategory(parent, text)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    lbl.BackgroundTransparency = 0.5
    lbl.Size = UDim2.new(1, 0, 0, 26)
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = "  " .. text
    lbl.TextColor3 = Color3.fromRGB(140, 140, 180)
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = lbl
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(50, 50, 75)
    stroke.Thickness = 1
    stroke.Parent = lbl
    
    return lbl
end

local function createButton(parent, name, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
    btn.BackgroundTransparency = 0.15
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "  " .. name
    btn.TextColor3 = Color3.fromRGB(220, 220, 240)
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.AutoButtonColor = false
     
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 85)
    stroke.Thickness = 1
    stroke.Parent = btn
     
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 68)}):Play()
        stroke.Color = Color3.fromRGB(110, 110, 160)
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(24, 24, 34)}):Play()
        stroke.Color = Color3.fromRGB(60, 60, 85)
    end)
     
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function createSlider(parent, text, min, max, default, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
    container.BackgroundTransparency = 0.15
    container.Size = UDim2.new(1, 0, 0, 50)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 85)
    stroke.Thickness = 1
    stroke.Parent = container

    local lbl = Instance.new("TextLabel")
    lbl.Parent = container
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 10, 0, 5)
    lbl.Size = UDim2.new(1, -20, 0, 18)
    lbl.Font = Enum.Font.GothamMedium
    lbl.Text = text .. ": " .. default
    lbl.TextColor3 = Color3.fromRGB(220, 220, 240)
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local bgBar = Instance.new("TextButton")
    bgBar.Parent = container
    bgBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    bgBar.Position = UDim2.new(0, 10, 0, 30)
    bgBar.Size = UDim2.new(1, -20, 0, 8)
    bgBar.AutoButtonColor = false
    bgBar.Text = ""

    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 4)
    bgCorner.Parent = bgBar

    local fillBar = Instance.new("Frame")
    fillBar.Parent = bgBar
    fillBar.BackgroundColor3 = Color3.fromRGB(130, 130, 220)
    fillBar.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
    fillBar.BorderSizePixel = 0

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = fillBar

    local dragging = false
    local function updateInput(input)
        local pos = UDim2.new(math.clamp((input.Position.X - bgBar.AbsolutePosition.X) / bgBar.AbsoluteSize.X, 0, 1), 0, 1, 0)
        fillBar.Size = pos
        local rawVal = min + (max - min) * pos.X.Scale
        local val = math.floor(rawVal * 10 + 0.5) / 10
        if max <= 1 then
            val = math.floor(rawVal * 100) / 100
        else
            val = math.floor(rawVal)
        end
        lbl.Text = text .. ": " .. val
        callback(val)
    end

    bgBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateInput(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end

-- === HOME TAB CONTENT ===
createCategory(HomePage, "NO KEY HUBS")
createButton(HomePage, "Metan Hub MM2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Youdfff/MetanHub/refs/heads/main/moonveil.lua"))()
end)
createButton(HomePage, "Honeylua MM2", function()
    loadstring(game:HttpGet("https://api.honeylua.com/loader"))()
end)
createButton(HomePage, "Foxname MM2 Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xv3gasx/Murder-Mystery-2/refs/heads/main/Release.lua"))()
end)
createButton(HomePage, "Murder Mystery 2 Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nickriley4567-hash/scriptv1/main/Main.lua"))()
end)
createButton(HomePage, "Vynixu's MM2", function()
    loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
end)
createButton(HomePage, "Eclipse Hub MM2", function()
getgenv().mainKey = "nil"

local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
end)
createButton(HomePage, "Dark Client Hub Beta MM2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkCheatClientTeam/Scripts/refs/heads/main/Main.lua"))()
end)

createCategory(HomePage, "KEY SYSTEMS")
createButton(HomePage, "Axon Hub MM2", function()
    getgenv().Provider = "rscript"
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/97c3f6db55a2cf72141537a85458e5a7.lua"))()
end)
createButton(HomePage, "Moondiety MM2", function()
    loadstring(game:HttpGet("https://moondiety.com/loader"))()
end)
createButton(HomePage, "Express Hub MM2", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))() 
end)


-- === UNIVERSAL TAB CONTENT ===
createCategory(UniversalPage, "SCRIPTS LOADERS")
createButton(UniversalPage, "Infinite Yield Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createCategory(UniversalPage, "TELEPORT UTILS")
local ctrlTpEnabled = false
createButton(UniversalPage, "Toggle Ctrl + Click TP", function()
    ctrlTpEnabled = not ctrlTpEnabled
end)

Mouse.Button1Down:Connect(function()
    if ctrlTpEnabled then
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
            pcall(function()
                local myChar = LocalPlayer.Character
                if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    myChar.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 3, 0))
                end
            end)
        end
    end
end)

createCategory(UniversalPage, "CHARACTER CHEATS")

local noclipEnabled = false
RunService.Stepped:Connect(function()
    if noclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
createButton(UniversalPage, "Toggle Noclip", function()
    noclipEnabled = not noclipEnabled
end)

local flyEnabled = false
local flySpeed = 50
local flyConn
createButton(UniversalPage, "Toggle Fly", function()
    flyEnabled = not flyEnabled
    if flyEnabled then
        local cam = workspace.CurrentCamera
        local uis = UserInputService
        local keys = {W = false, S = false, A = false, D = false}
        
        uis.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then keys.W = true end
            if input.KeyCode == Enum.KeyCode.S then keys.S = true end
            if input.KeyCode == Enum.KeyCode.A then keys.A = true end
            if input.KeyCode == Enum.KeyCode.D then keys.D = true end
        end)
        uis.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then keys.W = false end
            if input.KeyCode == Enum.KeyCode.S then keys.S = false end
            if input.KeyCode == Enum.KeyCode.A then keys.A = false end
            if input.KeyCode == Enum.KeyCode.D then keys.D = false end
        end)
        
        flyConn = RunService.RenderStepped:Connect(function(dt)
            if not flyEnabled then flyConn:Disconnect() return end
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local moveDir = Vector3.new()
                if keys.W then moveDir = moveDir + cam.CFrame.LookVector end
                if keys.S then moveDir = moveDir - cam.CFrame.LookVector end
                if keys.A then moveDir = moveDir - cam.CFrame.RightVector end
                if keys.D then moveDir = moveDir + cam.CFrame.RightVector end
                hrp.Velocity = Vector3.new(0, 0, 0)
                hrp.CFrame = hrp.CFrame + (moveDir * flySpeed * dt)
            end
        end)
    else
        if flyConn then flyConn:Disconnect() end
    end
end)
createSlider(UniversalPage, "Fly Speed", 10, 500, 50, function(val)
    flySpeed = val
end)

createSlider(UniversalPage, "Speed Hack", 16, 1000, 16, function(val)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

createSlider(UniversalPage, "Jump Power", 50, 1000, 50, function(val)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = val
        LocalPlayer.Character.Humanoid.UseJumpPower = true
    end
end)

local infJumpEnabled = false
UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
createButton(UniversalPage, "Toggle Infinite Jump", function()
    infJumpEnabled = not infJumpEnabled
end)

local invisEnabled = false
createButton(UniversalPage, "Toggle Invisible", function()
    invisEnabled = not invisEnabled
    local char = LocalPlayer.Character
    if char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                v.Transparency = invisEnabled and 1 or 0
            elseif v:IsA("Decal") then
                v.Transparency = invisEnabled and 1 or 0
            end
        end
    end
end)


-- === MISC TAB CONTENT ===
createCategory(MiscPage, "SELECT TARGET PLAYER")

local selectedTarget = nil

local TargetStatusLbl = Instance.new("TextLabel")
TargetStatusLbl.Parent = MiscPage
TargetStatusLbl.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
TargetStatusLbl.BackgroundTransparency = 0.2
TargetStatusLbl.Size = UDim2.new(1, 0, 0, 32)
TargetStatusLbl.Font = Enum.Font.GothamBold
TargetStatusLbl.Text = "  Target: NONE"
TargetStatusLbl.TextColor3 = Color3.fromRGB(255, 210, 60)
TargetStatusLbl.TextSize = 11
TargetStatusLbl.TextXAlignment = Enum.TextXAlignment.Left

local tsCorner = Instance.new("UICorner")
tsCorner.CornerRadius = UDim.new(0, 6)
tsCorner.Parent = TargetStatusLbl

-- Pro Dropdown for Players List
local DropdownContainer = Instance.new("Frame")
DropdownContainer.Parent = MiscPage
DropdownContainer.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
DropdownContainer.BackgroundTransparency = 0.15
DropdownContainer.Size = UDim2.new(1, 0, 0, 36)

local dcCorner = Instance.new("UICorner")
dcCorner.CornerRadius = UDim.new(0, 6)
dcCorner.Parent = DropdownContainer

local dcStroke = Instance.new("UIStroke")
dcStroke.Color = Color3.fromRGB(60, 60, 85)
dcStroke.Thickness = 1
dcStroke.Parent = DropdownContainer

local DropdownBtn = Instance.new("TextButton")
DropdownBtn.Parent = DropdownContainer
DropdownBtn.BackgroundTransparency = 1
DropdownBtn.Size = UDim2.new(1, 0, 1, 0)
DropdownBtn.Font = Enum.Font.GothamMedium
DropdownBtn.Text = "  Choose Player..."
DropdownBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
DropdownBtn.TextSize = 11
DropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
DropdownBtn.AutoButtonColor = false

local DropdownArrow = Instance.new("TextLabel")
DropdownArrow.Parent = DropdownContainer
DropdownArrow.BackgroundTransparency = 1
DropdownArrow.Position = UDim2.new(1, -30, 0, 0)
DropdownArrow.Size = UDim2.new(0, 30, 1, 0)
DropdownArrow.Font = Enum.Font.GothamBold
DropdownArrow.Text = "▼"
DropdownArrow.TextColor3 = Color3.fromRGB(150, 150, 180)
DropdownArrow.TextSize = 11

local PlayerScrollList = Instance.new("ScrollingFrame")
PlayerScrollList.Parent = MiscPage
PlayerScrollList.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
PlayerScrollList.BackgroundTransparency = 0.1
PlayerScrollList.Size = UDim2.new(1, 0, 0, 0) -- Mặc định ẩn
PlayerScrollList.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScrollList.AutomaticCanvasSize = Enum.AutomaticSize.Y
PlayerScrollList.ScrollBarThickness = 3
PlayerScrollList.Visible = false

local pslCorner = Instance.new("UICorner")
pslCorner.CornerRadius = UDim.new(0, 6)
pslCorner.Parent = PlayerScrollList

local pslStroke = Instance.new("UIStroke")
pslStroke.Color = Color3.fromRGB(80, 80, 110)
pslStroke.Thickness = 1
pslStroke.Parent = PlayerScrollList

local pslLayout = Instance.new("UIListLayout")
pslLayout.Parent = PlayerScrollList
pslLayout.SortOrder = Enum.SortOrder.LayoutOrder
pslLayout.Padding = UDim.new(0, 4)

local pslPadding = Instance.new("UIPadding")
pslPadding.Parent = PlayerScrollList
pslPadding.PaddingTop = UDim.new(0, 4)
pslPadding.PaddingBottom = UDim.new(0, 4)
pslPadding.PaddingLeft = UDim.new(0, 4)
pslPadding.PaddingRight = UDim.new(0, 4)

local isPlayerListOpen = false

local function refreshPlayerDropdown()
    for _, child in pairs(PlayerScrollList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local pBtn = Instance.new("TextButton")
            pBtn.Parent = PlayerScrollList
            pBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
            pBtn.Size = UDim2.new(1, 0, 0, 28)
            pBtn.Font = Enum.Font.GothamMedium
            pBtn.Text = "  " .. p.Name
            pBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
            pBtn.TextSize = 11
            pBtn.TextXAlignment = Enum.TextXAlignment.Left
            pBtn.AutoButtonColor = false
            
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0, 4)
            c.Parent = pBtn
            
            pBtn.MouseButton1Click:Connect(function()
                selectedTarget = p
                TargetStatusLbl.Text = "  Target: " .. p.Name
                TargetStatusLbl.TextColor3 = Color3.fromRGB(100, 255, 120)
                DropdownBtn.Text = "  " .. p.Name
                isPlayerListOpen = false
                TweenService:Create(PlayerScrollList, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                task.wait(0.2)
                PlayerScrollList.Visible = false
                DropdownArrow.Text = "▼"
            end)
        end
    end
end

DropdownBtn.MouseButton1Click:Connect(function()
    isPlayerListOpen = not isPlayerListOpen
    if isPlayerListOpen then
        refreshPlayerDropdown()
        PlayerScrollList.Visible = true
        TweenService:Create(PlayerScrollList, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 120)}):Play()
        DropdownArrow.Text = "▲"
    else
        TweenService:Create(PlayerScrollList, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
        task.wait(0.2)
        PlayerScrollList.Visible = false
        DropdownArrow.Text = "▼"
    end
end)

createButton(MiscPage, "Refresh Player List", refreshPlayerDropdown)

createCategory(MiscPage, "TARGET ACTIONS & TP")

createButton(MiscPage, "Teleport to Target", function()
    pcall(function()
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            local myChar = LocalPlayer.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                myChar.HumanoidRootPart.CFrame = selectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
            end
        end
    end)
end)

local flingActive = false
local bangActive = false
local viewConnection = nil
local activeThrust = nil

createButton(MiscPage, "Fling Target", function()
    if flingActive then return end
    flingActive = true
    
    pcall(function()
        if not selectedTarget or not selectedTarget.Character or not selectedTarget.Character:FindFirstChild("HumanoidRootPart") then 
            flingActive = false
            return 
        end
        local myChar = LocalPlayer.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then 
            flingActive = false
            return 
        end
        
        local hrp = myChar.HumanoidRootPart
        
        if not activeThrust then
            activeThrust = Instance.new('BodyThrust', hrp)
            activeThrust.Force = Vector3.new(9999, 9999, 9999)
            activeThrust.Name = "YeetForce"
        end

        local connection
        connection = RunService.Heartbeat:Connect(function()
            if not flingActive or not selectedTarget or not selectedTarget.Character or not selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                if connection then connection:Disconnect() end
                if activeThrust then activeThrust:Destroy(); activeThrust = nil end
                flingActive = false
                return
            end

            local targetChar = selectedTarget.Character
            local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")

            if not targetHrp or (targetHumanoid and targetHumanoid.Health <= 0) or not targetChar:FindFirstChild("Head") then
                if connection then connection:Disconnect() end
                if activeThrust then activeThrust:Destroy(); activeThrust = nil end
                flingActive = false
                return
            end

            hrp.CFrame = targetHrp.CFrame
            activeThrust.Location = targetHrp.Position
        end)
    end)
end)

createButton(MiscPage, "Un-Fling", function()
    flingActive = false
    if activeThrust then
        activeThrust:Destroy()
        activeThrust = nil
    end
end)

createButton(MiscPage, "Bang Target", function()
    if bangActive then return end
    bangActive = true
    
    pcall(function()
        if not selectedTarget or not selectedTarget.Character or not selectedTarget.Character:FindFirstChild("HumanoidRootPart") then 
            bangActive = false
            return 
        end
        
        task.spawn(function()
            while bangActive do
                if not selectedTarget or not selectedTarget.Character or not selectedTarget.Character:FindFirstChild("HumanoidRootPart") then break end
                local targetHrp = selectedTarget.Character.HumanoidRootPart
                local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not myHrp then break end
                
                myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 1.2)
                task.wait(0.12)
                if not bangActive then break end
                myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, -0.2)
                task.wait(0.12)
            end
            bangActive = false
        end)
    end)
end)

createButton(MiscPage, "Un-Bang", function()
    bangActive = false
end)

createButton(MiscPage, "View Target", function()
    pcall(function()
        if not selectedTarget or not selectedTarget.Character or not selectedTarget.Character:FindFirstChild("Head") then return end
        if viewConnection then viewConnection:Disconnect() end
        
        viewConnection = RunService.RenderStepped:Connect(function()
            if selectedTarget.Character and selectedTarget.Character:FindFirstChild("Head") then
                Camera.CameraSubject = selectedTarget.Character.Head
            end
        end)
    end)
end)

createButton(MiscPage, "Un-View", function()
    pcall(function()
        if viewConnection then
            viewConnection:Disconnect()
            viewConnection = nil
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            Camera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end)
end)


-- === SETTINGS TAB CONTENT ===
local SettingsLabel = Instance.new("TextLabel")
SettingsLabel.Parent = SettingsPage
SettingsLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
SettingsLabel.BackgroundTransparency = 0.4
SettingsLabel.Size = UDim2.new(1, 0, 0, 26)
SettingsLabel.Font = Enum.Font.GothamBold
SettingsLabel.Text = "  TOGGLE GUI KEYBIND"
SettingsLabel.TextColor3 = Color3.fromRGB(140, 140, 180)
SettingsLabel.TextSize = 10
SettingsLabel.TextXAlignment = Enum.TextXAlignment.Left

local cornerS = Instance.new("UICorner")
cornerS.CornerRadius = UDim.new(0, 5)
cornerS.Parent = SettingsLabel

local strokeLbl = Instance.new("UIStroke")
strokeLbl.Color = Color3.fromRGB(50, 50, 75)
strokeLbl.Thickness = 1
strokeLbl.Parent = SettingsLabel

local currentKeybind = Enum.KeyCode.RightShift

-- Ô Nhập phím tắt hiện đại kiểu Pro Dropdown / Box Pro
local KeybindContainer = Instance.new("Frame")
KeybindContainer.Parent = SettingsPage
KeybindContainer.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
KeybindContainer.BackgroundTransparency = 0.15
KeybindContainer.Size = UDim2.new(1, 0, 0, 36)

local kcCorner = Instance.new("UICorner")
kcCorner.CornerRadius = UDim.new(0, 6)
kcCorner.Parent = KeybindContainer

local kcStroke = Instance.new("UIStroke")
kcStroke.Color = Color3.fromRGB(60, 60, 85)
kcStroke.Thickness = 1
kcStroke.Parent = KeybindContainer

local KeybindBtn = Instance.new("TextButton")
KeybindBtn.Parent = KeybindContainer
KeybindBtn.BackgroundTransparency = 1
KeybindBtn.Size = UDim2.new(1, -30, 1, 0)
KeybindBtn.Position = UDim2.new(0, 6, 0, 0)
KeybindBtn.Font = Enum.Font.GothamMedium
KeybindBtn.Text = "  Key: RightShift (Click to Change)"
KeybindBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
KeybindBtn.TextSize = 11
KeybindBtn.TextXAlignment = Enum.TextXAlignment.Left
KeybindBtn.AutoButtonColor = false

local KeybindEditIcon = Instance.new("TextLabel")
KeybindEditIcon.Parent = KeybindContainer
KeybindEditIcon.BackgroundTransparency = 1
KeybindEditIcon.Position = UDim2.new(1, -30, 0, 0)
KeybindEditIcon.Size = UDim2.new(0, 30, 1, 0)
KeybindEditIcon.Font = Enum.Font.GothamBold
KeybindEditIcon.Text = "⌨"
KeybindEditIcon.TextColor3 = Color3.fromRGB(150, 150, 180)
KeybindEditIcon.TextSize = 11

local listeningForKey = false

KeybindBtn.MouseButton1Click:Connect(function()
    listeningForKey = true
    KeybindBtn.Text = "  Press any key..."
    KeybindBtn.TextColor3 = Color3.fromRGB(255, 210, 60)
end)

createCategory(SettingsPage, "SCRIPT INFORMATION")

local InfoLbl = Instance.new("TextLabel")
InfoLbl.Parent = SettingsPage
InfoLbl.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
InfoLbl.BackgroundTransparency = 0.15
InfoLbl.Size = UDim2.new(1, 0, 0, 65)
InfoLbl.Font = Enum.Font.GothamMedium
InfoLbl.Text = "  Author: Dark-exploits\n  Version: v1.00 PRO\n  Game: Murder Mystery 2"
InfoLbl.TextColor3 = Color3.fromRGB(180, 180, 210)
InfoLbl.TextSize = 10
InfoLbl.TextXAlignment = Enum.TextXAlignment.Left
InfoLbl.TextWrapped = true

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = InfoLbl

local infoStroke = Instance.new("UIStroke")
infoStroke.Color = Color3.fromRGB(60, 60, 85)
infoStroke.Thickness = 1
infoStroke.Parent = InfoLbl

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.25), {Size = UDim2.new(0, 340, 0, 38)}):Play()
        MinimizeBtn.Text = "+"
        PagesContainer.Visible = false
        NavBar.Visible = false
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.25), {Size = UDim2.new(0, 340, 0, 450)}):Play()
        MinimizeBtn.Text = "─"
        NavBar.Visible = true
        PagesContainer.Visible = true
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if listeningForKey then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            currentKeybind = input.KeyCode
            KeybindBtn.Text = "  Key: " .. currentKeybind.Name .. " (Click to Change)"
            KeybindBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
            listeningForKey = false
        end
    elseif not gameProcessed then
        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == currentKeybind then
            MainFrame.Visible = not MainFrame.Visible
        end
    end
end)

print("MM2 DARK CLASSIC HUB Loaded Successfully!")