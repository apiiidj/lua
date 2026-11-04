-- =============================================
-- [ SFLY FE STYLE MENU - THICK TEXT EDITION ]
-- Credits: A.N Arziki / FORESTFIRE0014
-- Font: Arcade | Thick Text | Auto Detect | Red Outline
-- =============================================

local P, R, LP = game:GetService("Players"), game:GetService("RunService"), game:GetService("Players").LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- =============================================
-- GET PARENT GUI
-- =============================================
local function getParentGui()
    local parent
    pcall(function() if gethui then parent = gethui() end end)
    if not parent then pcall(function() parent = CoreGui end) end
    if not parent then parent = LP:WaitForChild("PlayerGui") end
    return parent
end

-- =============================================
-- DETEKSI EXECUTOR
-- =============================================
local function detectExecutor()
    local success, name = pcall(function()
        if identifyexecutor then return identifyexecutor() end
        return nil
    end)
    if success and name then return name end

    local executors = {
        {name = "Synapse X", check = function() return syn and syn.protect_gui end},
        {name = "Script-Ware", check = function() return script_key ~= nil end},
        {name = "KRNL", check = function() return krnl and krnl.loadstring end},
        {name = "Fluxus", check = function() return fluxus ~= nil end},
        {name = "Delta", check = function() return delta ~= nil end},
        {name = "Hydrogen", check = function() return hydrogen ~= nil end},
        {name = "SirHurt", check = function() return is_sirhurt_closure ~= nil end},
        {name = "Oxygen U", check = function() return oxygen ~= nil end},
        {name = "Electron", check = function() return electron ~= nil end},
        {name = "Triggersoft", check = function() return triggersoft ~= nil end},
        {name = "JJSploit", check = function() return Kavo ~= nil or WeAreDevs ~= nil end},
        {name = "Codex", check = function() return codex ~= nil end},
        {name = "Arceus X", check = function() return ARCEUSX ~= nil or arceus ~= nil end},
        {name = "Vega X", check = function() return VegaX ~= nil end},
        {name = "Evon", check = function() return evon ~= nil end},
        {name = "Solara", check = function() return solara ~= nil end},
        {name = "Wave", check = function() return wave ~= nil end},
        {name = "Nihon", check = function() return nihon ~= nil end},
        {name = "Ronix", check = function() return ronix ~= nil end},
        {name = "Swift", check = function() return swift ~= nil end},
        {name = "Cryptic", check = function() return cryptic ~= nil end},
        {name = "Celery", check = function() return celery ~= nil end},
        {name = "MacSploit", check = function() return macsploit ~= nil end}
    }

    for _, exec in ipairs(executors) do
        local ok, result = pcall(exec.check)
        if ok and result then return exec.name end
    end

    return "Unknown Executor"
end

local EXECUTOR_NAME = detectExecutor()
local EXPLOITER_NAME = LP.DisplayName .. " (" .. LP.Name .. ")"

-- =============================================
-- HELPER: THICK TEXT (TEXTSTROKE)
-- =============================================
local function makeThick(label, thickness)
    local stroke = Instance.new("UIStroke", label)
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = thickness or 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    return stroke
end

-- =============================================
-- MAIN GUI
-- =============================================
local SG = Instance.new("ScreenGui")
SG.Name = "SFLY_FE_Menu"
SG.Parent = getParentGui()
SG.ResetOnSpawn = false
SG.DisplayOrder = 999
SG.IgnoreGuiInset = true

-- Overlay
local Overlay = Instance.new("Frame", SG)
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Overlay.BackgroundTransparency = 0.85
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 0

-- Main Frame
local MF = Instance.new("Frame", SG)
MF.Name = "MainFrame"
MF.Size = UDim2.new(0, 380, 0, 310)
MF.Position = UDim2.new(0.5, -190, 0.5, -155)
MF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MF.BorderSizePixel = 3
MF.BorderColor3 = Color3.fromRGB(255, 0, 0)
MF.Active = true
MF.Draggable = true
MF.ZIndex = 2

local MFCorner = Instance.new("UICorner", MF)
MFCorner.CornerRadius = UDim.new(0, 8)

local MFStroke = Instance.new("UIStroke", MF)
MFStroke.Color = Color3.fromRGB(255, 0, 0)
MFStroke.Thickness = 3

-- Judul
local Title = Instance.new("TextLabel", MF)
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundTransparency = 1
Title.Text = "SFLY FE"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.Arcade
Title.TextSize = 42
Title.ZIndex = 3
makeThick(Title, 3)

-- Close Button
local CloseBtn = Instance.new("TextButton", MF)
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 7)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.Font = Enum.Font.Arcade
CloseBtn.TextSize = 18
CloseBtn.ZIndex = 5
makeThick(CloseBtn, 2)

local closeCorner = Instance.new("UICorner", CloseBtn)
closeCorner.CornerRadius = UDim.new(0, 6)

-- Minimize Button
local MinBtn = Instance.new("TextButton", MF)
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -66, 0, 7)
MinBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
MinBtn.BorderSizePixel = 0
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.Arcade
MinBtn.TextSize = 18
MinBtn.ZIndex = 5
makeThick(MinBtn, 2)

local minCorner = Instance.new("UICorner", MinBtn)
minCorner.CornerRadius = UDim.new(0, 6)

-- Panels
local LeftPanel = Instance.new("Frame", MF)
LeftPanel.Size = UDim2.new(0, 160, 1, -80)
LeftPanel.Position = UDim2.new(0, 15, 0, 55)
LeftPanel.BackgroundTransparency = 1
LeftPanel.ZIndex = 3

local LeftLayout = Instance.new("UIListLayout", LeftPanel)
LeftLayout.Padding = UDim.new(0, 8)
LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder

local MidPanel = Instance.new("Frame", MF)
MidPanel.Size = UDim2.new(0, 130, 1, -80)
MidPanel.Position = UDim2.new(0, 185, 0, 55)
MidPanel.BackgroundTransparency = 1
MidPanel.ZIndex = 3

local MidLayout = Instance.new("UIListLayout", MidPanel)
MidLayout.Padding = UDim.new(0, 8)
MidLayout.SortOrder = Enum.SortOrder.LayoutOrder

local RightPanel = Instance.new("Frame", MF)
RightPanel.Size = UDim2.new(0, 50, 0, 120)
RightPanel.Position = UDim2.new(0, 325, 0, 100)
RightPanel.BackgroundTransparency = 1
RightPanel.ZIndex = 3

-- Info Bawah
local InfoLabel = Instance.new("TextLabel", MF)
InfoLabel.Size = UDim2.new(1, -20, 0, 20)
InfoLabel.Position = UDim2.new(0, 10, 1, -25)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "SCP 096+TOUCH FLING | DOG HUB | FORSAKEN PLUS"
InfoLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
InfoLabel.Font = Enum.Font.Arcade
InfoLabel.TextSize = 11
InfoLabel.ZIndex = 3
makeThick(InfoLabel, 2)

-- =============================================
-- SUB MENU
-- =============================================
local SubMenu = Instance.new("Frame", SG)
SubMenu.Name = "SubMenu"
SubMenu.Size = UDim2.new(0, 280, 0, 400)
SubMenu.Position = UDim2.new(0.5, -140, 0.5, -200)
SubMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SubMenu.BorderSizePixel = 3
SubMenu.BorderColor3 = Color3.fromRGB(255, 0, 0)
SubMenu.Active = true
SubMenu.Draggable = true
SubMenu.Visible = false
SubMenu.ZIndex = 20

local SubCorner = Instance.new("UICorner", SubMenu)
SubCorner.CornerRadius = UDim.new(0, 8)

local SubStroke = Instance.new("UIStroke", SubMenu)
SubStroke.Color = Color3.fromRGB(255, 0, 0)
SubStroke.Thickness = 3

-- Judul SubMenu
local SubTitle = Instance.new("TextLabel", SubMenu)
SubTitle.Size = UDim2.new(1, 0, 0, 38)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "SCRIPT LIST"
SubTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
SubTitle.Font = Enum.Font.Arcade
SubTitle.TextSize = 28
SubTitle.ZIndex = 21
makeThick(SubTitle, 3)

-- Close SubMenu
local SubCloseBtn = Instance.new("TextButton", SubMenu)
SubCloseBtn.Size = UDim2.new(0, 26, 0, 26)
SubCloseBtn.Position = UDim2.new(1, -32, 0, 6)
SubCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SubCloseBtn.BorderSizePixel = 0
SubCloseBtn.Text = "X"
SubCloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
SubCloseBtn.Font = Enum.Font.Arcade
SubCloseBtn.TextSize = 16
SubCloseBtn.ZIndex = 22
makeThick(SubCloseBtn, 2)

local subCloseCorner = Instance.new("UICorner", SubCloseBtn)
subCloseCorner.CornerRadius = UDim.new(0, 6)

-- Scroll untuk SubMenu
local SubScroll = Instance.new("ScrollingFrame", SubMenu)
SubScroll.Size = UDim2.new(1, -20, 1, -55)
SubScroll.Position = UDim2.new(0, 10, 0, 45)
SubScroll.BackgroundTransparency = 1
SubScroll.BorderSizePixel = 0
SubScroll.ScrollBarThickness = 4
SubScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
SubScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SubScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
SubScroll.ZIndex = 21

local SubLayout = Instance.new("UIListLayout", SubScroll)
SubLayout.Padding = UDim.new(0, 6)
SubLayout.SortOrder = Enum.SortOrder.LayoutOrder
SubLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- =============================================
-- FLOATING BUTTON
-- =============================================
local FloatingBtn = Instance.new("TextButton", SG)
FloatingBtn.Size = UDim2.new(0, 55, 0, 55)
FloatingBtn.Position = UDim2.new(0.5, -27, 1, -110)
FloatingBtn.AnchorPoint = Vector2.new(0.5, 0.5)
FloatingBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FloatingBtn.BorderSizePixel = 3
FloatingBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
FloatingBtn.Text = "SFLY"
FloatingBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
FloatingBtn.Font = Enum.Font.Arcade
FloatingBtn.TextSize = 14
FloatingBtn.Visible = false
FloatingBtn.Active = true
FloatingBtn.ZIndex = 10
makeThick(FloatingBtn, 2)

local floatCorner = Instance.new("UICorner", FloatingBtn)
floatCorner.CornerRadius = UDim.new(1, 0)
local floatStroke = Instance.new("UIStroke", FloatingBtn)
floatStroke.Color = Color3.fromRGB(255, 0, 0)
floatStroke.Thickness = 2

-- Drag Floating Button
local dragging, dragInput, dragStart, startPos, dragged = false, nil, nil, nil, false

FloatingBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragged = false
        dragStart = input.Position
        startPos = FloatingBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

FloatingBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then dragged = true end
        FloatingBtn.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- =============================================
-- FUNGSI BUAT TOMBOL
-- =============================================
local function createBoxButton(parent, text, size, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = size or UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.Arcade
    btn.TextSize = 14
    btn.ZIndex = 4
    makeThick(btn, 2)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 2

    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)

    return btn
end

-- =============================================
-- CLOSE -> FLOATING BUTTON
-- =============================================
CloseBtn.MouseButton1Click:Connect(function()
    pcall(function()
        MF.Visible = false
        Overlay.Visible = false
        SubMenu.Visible = false
        FloatingBtn.Visible = true
    end)
end)

FloatingBtn.MouseButton1Click:Connect(function()
    if not dragged then
        pcall(function()
            MF.Visible = true
            Overlay.Visible = true
            FloatingBtn.Visible = false
        end)
    end
    dragged = false
end)

-- Minimize
local minimized = false
local normalHeight = 310
local minHeight = 42

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        LeftPanel.Visible = false
        MidPanel.Visible = false
        RightPanel.Visible = false
        InfoLabel.Visible = false
        TweenService:Create(MF, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 380, 0, minHeight)}):Play()
    else
        TweenService:Create(MF, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 380, 0, normalHeight)}):Play()
        task.wait(0.25)
        LeftPanel.Visible = true
        MidPanel.Visible = true
        RightPanel.Visible = true
        InfoLabel.Visible = true
    end
end)

-- =============================================
-- TOMBOL SCRIPT
-- =============================================
createBoxButton(LeftPanel, "SCP 096+TOUCH FLING", UDim2.new(1, 0, 0, 42), function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/956CUUef"))()
    end)
end)

createBoxButton(LeftPanel, "DOG HUB", UDim2.new(1, 0, 0, 42), function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GzeWWPWN"))()
    end)
end)

createBoxButton(LeftPanel, "FORSAKEN PLUS", UDim2.new(1, 0, 0, 42), function()
    pcall(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Plus-216770"))()
    end)
end)

-- =============================================
-- EXECUTOR + EXPLOITER LABEL (Thick Text)
-- =============================================
local ExecLabel = Instance.new("TextLabel", MidPanel)
ExecLabel.Size = UDim2.new(1, 0, 0, 55)
ExecLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ExecLabel.BorderSizePixel = 2
ExecLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
ExecLabel.Text = "EXECUTOR:\n" .. EXECUTOR_NAME
ExecLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
ExecLabel.Font = Enum.Font.Arcade
ExecLabel.TextSize = 11
ExecLabel.TextWrapped = true
ExecLabel.ZIndex = 4
makeThick(ExecLabel, 2)

local execCorner = Instance.new("UICorner", ExecLabel)
execCorner.CornerRadius = UDim.new(0, 6)
local execStroke = Instance.new("UIStroke", ExecLabel)
execStroke.Color = Color3.fromRGB(255, 0, 0)
execStroke.Thickness = 2

local ExploitLabel = Instance.new("TextLabel", MidPanel)
ExploitLabel.Size = UDim2.new(1, 0, 0, 55)
ExploitLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ExploitLabel.BorderSizePixel = 2
ExploitLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
ExploitLabel.Text = "EXPLOITER:\n" .. EXPLOITER_NAME
ExploitLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
ExploitLabel.Font = Enum.Font.Arcade
ExploitLabel.TextSize = 11
ExploitLabel.TextWrapped = true
ExploitLabel.ZIndex = 4
makeThick(ExploitLabel, 2)

local exploitCorner = Instance.new("UICorner", ExploitLabel)
exploitCorner.CornerRadius = UDim.new(0, 6)
local exploitStroke = Instance.new("UIStroke", ExploitLabel)
exploitStroke.Color = Color3.fromRGB(255, 0, 0)
exploitStroke.Thickness = 2

-- =============================================
-- TOMBOL PANAH >>> (MERAH)
-- =============================================
local ArrowBtn = Instance.new("TextButton", RightPanel)
ArrowBtn.Size = UDim2.new(1, 0, 0, 60)
ArrowBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
ArrowBtn.BorderSizePixel = 3
ArrowBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
ArrowBtn.Text = ">>>"
ArrowBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ArrowBtn.Font = Enum.Font.Arcade
ArrowBtn.TextSize = 24
ArrowBtn.ZIndex = 4
makeThick(ArrowBtn, 3)

local arrowCorner = Instance.new("UICorner", ArrowBtn)
arrowCorner.CornerRadius = UDim.new(0, 6)
local arrowStroke = Instance.new("UIStroke", ArrowBtn)
arrowStroke.Color = Color3.fromRGB(255, 0, 0)
arrowStroke.Thickness = 2

ArrowBtn.MouseButton1Click:Connect(function()
    pcall(function()
        SubMenu.Visible = not SubMenu.Visible
        if SubMenu.Visible then
            SubMenu.Size = UDim2.new(0, 280, 0, 10)
            TweenService:Create(SubMenu, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Size = UDim2.new(0, 280, 0, 400)
            }):Play()
        end
    end)
end)

-- =============================================
-- TOMBOL DI SUBMENU (THICK TEXT)
-- =============================================
local function createSubBtn(text, link)
    local btn = Instance.new("TextButton", SubScroll)
    btn.Size = UDim2.new(0.95, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.Arcade
    btn.TextSize = 15
    btn.ZIndex = 22
    makeThick(btn, 3)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 2

    btn.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(game:HttpGet(link))()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "SFLY FE",
                Text = text .. " Loaded!",
                Duration = 2
            })
        end)
    end)

    return btn
end

-- =============================================
-- SCRIPT LIST DI SUBMENU
-- =============================================
createSubBtn("INFINITE YIELD", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
createSubBtn("DARK DEX", "https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Dex.lua")
createSubBtn("NAMELESS ADMIN", "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source")
createSubBtn("FATES ADMIN", "https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua")
createSubBtn("CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source")
createSubBtn("HYDROXIDE", "https://raw.githubusercontent.com/Upbolt/Hydroxide/master/main.lua")
createSubBtn("OWL HUB", "https://raw.githubusercontent.com/OwlHub/OwlHub/main/OwlHub.lua")
createSubBtn("REMOTE SPY", "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua")
createSubBtn("ORION", "https://raw.githubusercontent.com/Qanuir/orion-ui/refs/heads/main/source.lua")
createSubBtn("WINDUI", "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
createSubBtn("RAYFIELD", "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua")
createSubBtn("SIRHURT", "https://raw.githubusercontent.com/Sirhurt/Sirhurt/master/Sirhurt.lua")

-- SubMenu Close
SubCloseBtn.MouseButton1Click:Connect(function()
    SubMenu.Visible = false
end)

-- =============================================
-- NOTIFIKASI AWAL
-- =============================================
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "SFLY FE",
    Text = "Executor: " .. EXECUTOR_NAME .. " | Welcome " .. LP.Name,
    Duration = 5
})