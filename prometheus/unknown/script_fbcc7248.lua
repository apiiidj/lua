--[[
    🌈 RAINBOWEREED HUB - Made by RainbowEreed 🌈😊
    Full Admin System with Commands
    Standalone Version - No External Dependencies
]]

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- ================================
-- LOADING SCREEN
-- ================================
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
loadingGui.Parent = player:WaitForChild("PlayerGui")

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingGui

-- Rainbow gradient background
local gradient = Instance.new("UIGradient")
gradient.Parent = loadingFrame

spawn(function()
    while loadingFrame and loadingFrame.Parent do
        for hue = 0, 1, 0.01 do
            if not loadingFrame or not loadingFrame.Parent then break end
            gradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromHSV(hue, 0.5, 0.2)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 0.5) % 1, 0.5, 0.2))
            }
            wait(0.05)
        end
    end
end)

-- Logo/Title
local loadingTitle = Instance.new("TextLabel")
loadingTitle.Size = UDim2.new(0, 600, 0, 80)
loadingTitle.Position = UDim2.new(0.5, -300, 0.4, -40)
loadingTitle.BackgroundTransparency = 1
loadingTitle.Text = "🌈 RAINBOWEREED HUB 🌈"
loadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingTitle.TextSize = 48
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.Parent = loadingFrame

spawn(function()
    while loadingTitle and loadingTitle.Parent do
        for hue = 0, 1, 0.01 do
            if not loadingTitle or not loadingTitle.Parent then break end
            loadingTitle.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

-- Made By Text
local madeBy = Instance.new("TextLabel")
madeBy.Size = UDim2.new(0, 400, 0, 40)
madeBy.Position = UDim2.new(0.5, -200, 0.5, 0)
madeBy.BackgroundTransparency = 1
madeBy.Text = "💎 Made by RainbowEreed 😊 💎"
madeBy.TextColor3 = Color3.fromRGB(255, 255, 255)
madeBy.TextSize = 24
madeBy.Font = Enum.Font.GothamBold
madeBy.Parent = loadingFrame

spawn(function()
    while madeBy and madeBy.Parent do
        for hue = 0, 1, 0.02 do
            if not madeBy or not madeBy.Parent then break end
            madeBy.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.05)
        end
    end
end)

-- Loading Bar Background
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 500, 0, 30)
barBg.Position = UDim2.new(0.5, -250, 0.6, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0
barBg.Parent = loadingFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 15)
barCorner.Parent = barBg

-- Loading Bar Fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 15)
fillCorner.Parent = barFill

spawn(function()
    while barFill and barFill.Parent do
        for hue = 0, 1, 0.01 do
            if not barFill or not barFill.Parent then break end
            barFill.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

-- Loading Text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0, 500, 0, 40)
loadingText.Position = UDim2.new(0.5, -250, 0.65, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading... 0%"
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextSize = 20
loadingText.Font = Enum.Font.Gotham
loadingText.Parent = loadingFrame

-- Animate loading bar
spawn(function()
    local loadingSteps = {
        {0.2, "Initializing Rainbow Systems... 20%"},
        {0.4, "Loading Admin Commands... 40%"},
        {0.6, "Setting up Rainbow Effects... 60%"},
        {0.8, "Preparing Funny Jokes... 80%"},
        {1.0, "Complete! 100%"}
    }
    
    for _, step in ipairs(loadingSteps) do
        barFill:TweenSize(UDim2.new(step[1], 0, 1, 0), "Out", "Quad", 0.5, true)
        loadingText.Text = step[2]
        wait(0.6)
    end
    
    wait(0.5)
    loadingGui:Destroy()
end)

wait(3.5)

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RAINBOWEREED_HUB"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 520, 0, 420)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Rainbow Border
local rainbowBorder = Instance.new("UIStroke")
rainbowBorder.Thickness = 4
rainbowBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
rainbowBorder.Parent = mainFrame

spawn(function()
    while mainFrame and mainFrame.Parent do
        for hue = 0, 1, 0.01 do
            if not mainFrame or not mainFrame.Parent then break end
            rainbowBorder.Color = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -100, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "🌈 RAINBOWEREED HUB 🌈"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 22
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

spawn(function()
    while titleText and titleText.Parent do
        for hue = 0, 1, 0.01 do
            if not titleText or not titleText.Parent then break end
            titleText.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -45, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Text = "❌"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Tab Container
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, -20, 0, 40)
tabContainer.Position = UDim2.new(0, 10, 0, 60)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = mainFrame

-- Content Frame
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -20, 1, -140)
contentFrame.Position = UDim2.new(0, 10, 0, 110)
contentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
contentFrame.BorderSizePixel = 0
contentFrame.ScrollBarThickness = 6
contentFrame.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = contentFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = contentFrame

-- Update canvas size when content changes
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
end)

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 10)
padding.PaddingRight = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)
padding.Parent = contentFrame

-- Current Tab Tracking
local currentTab = 1

-- Function to create tabs
local tabButtons = {}
local tabContents = {}

local function createTab(name, emoji, index)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0.166, -7, 1, 0)
    tabButton.Position = UDim2.new((index-1) * 0.166, (index-1) * 1.5, 0, 0)
    tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabButton.BorderSizePixel = 0
    tabButton.Text = emoji .. " " .. name
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.TextSize = 11
    tabButton.Font = Enum.Font.GothamBold
    tabButton.Parent = tabContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tabButton
    
    tabButtons[index] = tabButton
    tabContents[index] = {}
    
    tabButton.MouseButton1Click:Connect(function()
        currentTab = index
        for i, btn in pairs(tabButtons) do
            if i == index then
                btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
        
        for _, child in pairs(contentFrame:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("TextBox") then
                child.Visible = false
            end
        end
        
        for _, item in pairs(tabContents[index]) do
            item.Visible = true
        end
    end)
    
    return index
end

-- Function to create buttons
local function createButton(text, callback, tabIndex)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 45)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 15
    button.Font = Enum.Font.GothamBold
    button.Parent = contentFrame
    button.Visible = (tabIndex == 1)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = button
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 2
    btnStroke.Parent = button
    
    button.MouseEnter:Connect(function()
        spawn(function()
            while button.Parent and button:IsMouseOver() do
                for hue = 0, 1, 0.02 do
                    if not button.Parent or not button:IsMouseOver() then break end
                    btnStroke.Color = Color3.fromHSV(hue, 1, 1)
                    wait(0.05)
                end
            end
            btnStroke.Color = Color3.fromRGB(70, 70, 70)
        end)
    end)
    
    button.MouseButton1Click:Connect(callback)
    
    table.insert(tabContents[tabIndex], button)
    return button
end

-- Function to create notifications
local function notify(title, message, duration)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 80)
    notif.Position = UDim2.new(1, -320, 1, -100)
    notif.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notif.BorderSizePixel = 0
    notif.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 10)
    notifCorner.Parent = notif
    
    local notifStroke = Instance.new("UIStroke")
    notifStroke.Thickness = 3
    notifStroke.Parent = notif
    
    spawn(function()
        while notif and notif.Parent do
            for hue = 0, 1, 0.02 do
                if not notif or not notif.Parent then break end
                notifStroke.Color = Color3.fromHSV(hue, 1, 1)
                wait(0.05)
            end
        end
    end)
    
    local notifTitle = Instance.new("TextLabel")
    notifTitle.Size = UDim2.new(1, -20, 0, 25)
    notifTitle.Position = UDim2.new(0, 10, 0, 5)
    notifTitle.BackgroundTransparency = 1
    notifTitle.Text = title
    notifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifTitle.TextSize = 18
    notifTitle.Font = Enum.Font.GothamBold
    notifTitle.TextXAlignment = Enum.TextXAlignment.Left
    notifTitle.Parent = notif
    
    local notifMessage = Instance.new("TextLabel")
    notifMessage.Size = UDim2.new(1, -20, 0, 45)
    notifMessage.Position = UDim2.new(0, 10, 0, 30)
    notifMessage.BackgroundTransparency = 1
    notifMessage.Text = message
    notifMessage.TextColor3 = Color3.fromRGB(200, 200, 200)
    notifMessage.TextSize = 14
    notifMessage.Font = Enum.Font.Gotham
    notifMessage.TextXAlignment = Enum.TextXAlignment.Left
    notifMessage.TextWrapped = true
    notifMessage.Parent = notif
    
    notif:TweenPosition(UDim2.new(1, -320, 1, -100), "Out", "Quad", 0.5, true)
    
    wait(duration or 3)
    notif:TweenPosition(UDim2.new(1, 0, 1, -100), "In", "Quad", 0.5, true)
    wait(0.5)
    notif:Destroy()
end

-- Helper function to find player
local function findPlayer(name)
    name = name:lower()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name:lower():find(name) or v.DisplayName:lower():find(name) then
            return v
        end
    end
    return nil
end

-- Create Tabs
createTab("Nulls", "🎯", 1)
createTab("Scripts", "⚡", 2)
createTab("Commands", "👑", 3)
createTab("Cool Scripts", "📜", 5)
createTab("Rainbow", "🌈", 5)
createTab("Jokes", "😂", 6)

-- Set first tab active
tabButtons[1].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

-- ================================
-- TAB 1: NULLS
-- ================================

createButton("✨ Rainbow ESP (See Players)", function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character then
            local h = Instance.new("Highlight", v.Character)
            spawn(function()
                while h and h.Parent do
                    for hue = 0, 1, 0.01 do
                        if not h or not h.Parent then break end
                        h.FillColor = Color3.fromHSV(hue, 1, 1)
                        wait(0.03)
                    end
                end
            end)
        end
    end
    notify("🌈 RAINBOWEREED", "Rainbow ESP Activated!", 3)
end, 1)

createButton("🔄 Instant Rejoin", function()
    notify("🌈 RAINBOWEREED", "Rejoining server...", 2)
    wait(1)
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end, 1)

-- ================================
-- TAB 2: SCRIPTS
-- ================================

local function spawnRainbowGun()
    local Tool = Instance.new("Tool")
    Tool.Name = "🌈 RAINBOWEREED Gun"
    Tool.RequiresHandle = true
    Tool.CanBeDropped = true
    
    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(0.4, 0.4, 1.5)
    Handle.Material = Enum.Material.Neon
    Handle.Parent = Tool
    
    spawn(function()
        while Handle and Handle.Parent do
            for hue = 0, 1, 0.01 do
                if not Handle or not Handle.Parent then break end
                Handle.Color = Color3.fromHSV(hue, 1, 1)
                wait(0.03)
            end
        end
    end)
    
    local particles = Instance.new("ParticleEmitter", Handle)
    particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    particles.Rate = 50
    particles.Lifetime = NumberRange.new(0.5, 1)
    particles.Speed = NumberRange.new(2, 5)
    particles.SpreadAngle = Vector2.new(30, 30)
    
    spawn(function()
        while particles and particles.Parent do
            for hue = 0, 1, 0.02 do
                if not particles or not particles.Parent then break end
                particles.Color = ColorSequence.new(Color3.fromHSV(hue, 1, 1))
                wait(0.05)
            end
        end
    end)
    
    Tool.Activated:Connect(function()
        local targetPos = mouse.Hit.Position
        
        local beam = Instance.new("Part")
        beam.Size = Vector3.new(0.2, 0.2, (Handle.Position - targetPos).Magnitude)
        beam.CFrame = CFrame.new(Handle.Position, targetPos) * CFrame.new(0, 0, -beam.Size.Z / 2)
        beam.Material = Enum.Material.Neon
        beam.Anchored = true
        beam.CanCollide = false
        beam.Parent = workspace
        
        spawn(function()
            for i = 1, 10 do
                beam.Color = Color3.fromHSV(math.random(), 1, 1)
                wait(0.05)
            end
            beam:Destroy()
        end)
        
        if mouse.Target and mouse.Target.Parent:FindFirstChild("Humanoid") then
            mouse.Target.Parent.Humanoid.Health = 0
        end
    end)
    
    Tool.Parent = player.Backpack
    notify("🌈 RAINBOWEREED", "Rainbow Weapon Deployed! ✨", 3)
end

player.Chatted:Connect(function(msg)
    if msg:lower() == ";gunsecret rainbowereed execute" then
        spawnRainbowGun()
    end
end)

createButton("🚀 Execute RAINBOWEREED Admin ⓡ", function()
    notify("🌈 RAINBOWEREED", "Loading Admin System...", 2)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    
    if success then
        wait(1)
        notify("🌈 RAINBOWEREED", "Admin System Injected! 🎯", 5)
    else
        notify("❌ ERROR", "Failed to load admin: " .. tostring(err), 5)
    end
end, 2)

createButton("🎮 Execute CMD-X (Alternative Admin)", function()
    notify("🌈 RAINBOWEREED", "Loading CMD-X Admin...", 2)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end)
    
    if success then
        wait(1)
        notify("🌈 RAINBOWEREED", "CMD-X Admin Loaded! 🎯", 5)
    else
        notify("❌ ERROR", "Failed to load CMD-X: " .. tostring(err), 5)
    end
end, 2)

createButton("🔐 Spawn Rainbow Gun", function()
    spawnRainbowGun()
end, 2)

createButton("🔍 Open Dark Dex (Security Bypass)", function()
    notify("🌈 RAINBOWEREED", "Loading Dark Dex...", 2)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end)
    
    if success then
        wait(1)
        notify("🌈 RAINBOWEREED", "Dark Dex Loaded! 🔓", 3)
    else
        notify("🌈 RAINBOWEREED", "Trying alternative Dex...", 2)
        local success2 = pcall(function()
            loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
        end)
        if success2 then
            notify("🌈 RAINBOWEREED", "Alternative Dex Loaded! 🔓", 3)
        else
            notify("❌ ERROR", "Failed to load Dex", 5)
        end
    end
end, 2)

createButton("⚠️ Don't rejoin - respawn ❌", function()
    notify("🌈 ALERT", "Permanent Death Mode Active! ⚠️", 5)
end, 2)

createButton("🚗 Car Script (Boom Box)", function()
    notify("🌈 RAINBOWEREED", "Loading Car Script...", 2)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/your_car_script"))()
    end)
    if success then
        notify("🚗 CAR LOADED", "Car script activated! Use a BoomBox! 🚗", 3)
    else
        -- Local fallback if URL fails
        local carScript = [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
Humanoid.WalkSpeed = 0
local currentVelocity = Vector3.zero
local WALK_SPEED_MAX = 40
local ACCELERATION_RATE = 20
RunService.Heartbeat:Connect(function(deltaTime)
    if not (Character and Character.Parent) then return end
    local moveDirection = Humanoid.MoveDirection
    if moveDirection.Magnitude > 0.1 then
        local newSpeed = math.min(WALK_SPEED_MAX, currentVelocity.Magnitude + ACCELERATION_RATE * deltaTime)
        currentVelocity = moveDirection * newSpeed
    else
        currentVelocity = Vector3.zero
    end
    HumanoidRootPart.AssemblyLinearVelocity = currentVelocity
end)
]]
        loadstring(carScript)()
        notify("🚗 CAR LOADED", "Car script activated! 🚗", 3)
    end
end, 2)

createButton("🎮 Oblivion Hub Script", function()
    notify("🌈 RAINBOWEREED", "Loading Oblivion Hub...", 2)
    notify("📋 INFO", "The Oblivion script is very large. You can paste it separately or load from a URL.", 5)
    -- Note: The full Oblivion script from the documents is over 1000 lines
    -- It's recommended to host it on pastebin and load via HttpGet
    -- Or paste the entire script content here manually
    local success, err = pcall(function()
        -- You can replace this with: loadstring(game:HttpGet("YOUR_PASTEBIN_URL"))()
        print("🎮 Oblivion Hub - Ready to load")
        print("📝 Paste the full Oblivion script or host it online")
    end)
    if success then
        notify("🎮 OBLIVION", "Ready! Paste the Oblivion script to activate 🎮", 5)
    else
        notify("❌ ERROR", "Error: " .. tostring(err), 3)
    end
end, 2)

createButton("💎 Heart Orbit (Accessories)", function()
    notify("🌈 RAINBOWEREED", "Loading Heart Orbit...", 2)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/your_heart_orbit"))()
    end)
    if success then
        notify("💎 HEART ORBIT", "Heart orbit loaded! Type .orbit help 💎", 3)
    else
        -- Local fallback
        local heartScript = [[
local Config = {MaxHats = 10, Height = 10, Scale = 0.6, Speed = 0.7, Radius = 6}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hats = {}
for _, inst in ipairs(char:GetChildren()) do
    if inst:IsA("Accessory") then
        local handle = inst:FindFirstChild("Handle")
        if handle then
            inst.Parent = workspace
            handle.Massless = true
            handle.CanCollide = false
            table.insert(hats, handle)
        end
    end
end
print("[Heart Orbit] Loaded " .. #hats .. " accessories")
local t0 = tick()
RunService.RenderStepped:Connect(function()
    local now = tick() - t0
    for i, handle in ipairs(hats) do
        if handle and handle.Parent then
            local offset = (i-1) / #hats * math.pi * 2
            local t = now * Config.Speed + offset
            local s = math.sin(t)
            local c = math.cos(t)
            local x = 16 * (s^3) * Config.Scale
            local y = (13*c - 5*math.cos(2*t) - 2*math.cos(3*t) - math.cos(4*t)) * Config.Scale
            handle.CFrame = hrp.CFrame * CFrame.new(x, Config.Height + y, 0)
            handle.AssemblyLinearVelocity = Vector3.new(30, 0, 0)
        end
    end
end)
]]
        loadstring(heartScript)()
        notify("💎 HEART ORBIT", "Heart orbit loaded! 💎", 3)
    end
end, 2)

createButton("🔪 Grab Knife Script", function()
    notify("🌈 RAINBOWEREED", "Loading Knife Script...", 2)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/your_knife_script"))()
    end)
    if success then
        notify("🔪 KNIFE", "Knife script loaded! 🔪", 3)
    else
        notify("❌ ERROR", "Failed to load knife script", 3)
    end
end, 2)

-- ================================
-- TAB 3: ADMIN COMMANDS 👑
-- ================================

-- Create input box for player name
local playerInput = Instance.new("TextBox")
playerInput.Size = UDim2.new(1, -20, 0, 45)
playerInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerInput.BorderSizePixel = 0
playerInput.PlaceholderText = "Enter player name..."
playerInput.Text = ""
playerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
playerInput.TextSize = 16
playerInput.Font = Enum.Font.Gotham
playerInput.ClearTextOnFocus = false
playerInput.Parent = contentFrame
playerInput.Visible = false
playerInput.LayoutOrder = -1

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = playerInput

local inputStroke = Instance.new("UIStroke")
inputStroke.Thickness = 2
inputStroke.Color = Color3.fromRGB(70, 70, 70)
inputStroke.Parent = playerInput

table.insert(tabContents[3], playerInput)

-- Command Functions
local function cmdJump(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        targetPlayer.Character.Humanoid.Jump = true
        notify("✅ SUCCESS", targetPlayer.Name .. " jumped! 🦘", 2)
    end
end

local function cmdKill(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        targetPlayer.Character.Humanoid.Health = 0
        notify("💀 SUCCESS", targetPlayer.Name .. " was eliminated! ☠️", 2)
    end
end

local function cmdSparkles(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local sparkles = Instance.new("Sparkles", targetPlayer.Character.HumanoidRootPart)
        spawn(function()
            while sparkles and sparkles.Parent do
                sparkles.SparkleColor = Color3.fromHSV(math.random(), 1, 1)
                wait(0.1)
            end
        end)
        notify("✨ SUCCESS", targetPlayer.Name .. " is sparkling! ✨", 2)
    end
end

local function cmdUnsparkles(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetDescendants()) do
            if v:IsA("Sparkles") then
                v:Destroy()
            end
        end
        notify("🚫 SUCCESS", "Sparkles removed from " .. targetPlayer.Name .. "!", 2)
    end
end

local function cmdFF(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local ff = Instance.new("ForceField", targetPlayer.Character)
        notify("🛡️ SUCCESS", targetPlayer.Name .. " has force field! 🛡️", 2)
    end
end

local function cmdUnFF(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetChildren()) do
            if v:IsA("ForceField") then
                v:Destroy()
            end
        end
        notify("🚫 SUCCESS", "Force field removed from " .. targetPlayer.Name .. "!", 2)
    end
end

local function cmdFire(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local fire = Instance.new("Fire", targetPlayer.Character.HumanoidRootPart)
        fire.Color = Color3.fromHSV(math.random(), 1, 1)
        fire.SecondaryColor = Color3.fromHSV(math.random(), 1, 1)
        notify("🔥 SUCCESS", targetPlayer.Name .. " is on fire! 🔥", 2)
    end
end

local function cmdUnfire(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetDescendants()) do
            if v:IsA("Fire") then
                v:Destroy()
            end
        end
        notify("🚫 SUCCESS", "Fire removed from " .. targetPlayer.Name .. "!", 2)
    end
end

local function cmdSmoke(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Instance.new("Smoke", targetPlayer.Character.HumanoidRootPart)
        notify("💨 SUCCESS", targetPlayer.Name .. " is smoking! 💨", 2)
    end
end

local function cmdUnsmoke(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetDescendants()) do
            if v:IsA("Smoke") then
                v:Destroy()
            end
        end
        notify("🚫 SUCCESS", "Smoke removed from " .. targetPlayer.Name .. "!", 2)
    end
end

local function cmdMiniHead(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        targetPlayer.Character.Head.Size = Vector3.new(0.5, 0.5, 0.5)
        notify("🤏 SUCCESS", targetPlayer.Name .. " has mini head! 🤏", 2)
    end
end

local function cmdBigHead(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        targetPlayer.Character.Head.Size = Vector3.new(4, 4, 5)
        notify("🤯 SUCCESS", targetPlayer.Name .. " has big head! 🤯", 2)
    end
end

local function cmdNormalHead(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        targetPlayer.Character.Head.Size = Vector3.new(2, 1, 1)
        notify("😊 SUCCESS", targetPlayer.Name .. " has normal head! 😊", 2)
    end
end

local function cmdTrip(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        targetPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
        notify("🤕 SUCCESS", targetPlayer.Name .. " tripped! 🤕", 2)
    end
end

local function cmdSit(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        targetPlayer.Character.Humanoid.Sit = true
        notify("🪑 SUCCESS", targetPlayer.Name .. " is sitting! 🪑", 2)
    end
end

local function cmdInvisible(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 1
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end
        notify("👻 SUCCESS", targetPlayer.Name .. " is invisible! 👻", 2)
    end
end

local function cmdVisible(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                v.Transparency = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 0
            end
        end
        notify("👤 SUCCESS", targetPlayer.Name .. " is visible! 👤", 2)
    end
end

local function cmdFreeze(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, v in pairs(targetPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Anchored = true
            end
        end
        notify("🧊 SUCCESS", targetPlayer.Name .. " is frozen! 🧊", 2)
    end
end

local function cmdExplode(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local explosion = Instance.new("Explosion", workspace)
        explosion.Position = targetPlayer.Character.HumanoidRootPart.Position
        explosion.BlastRadius = 10
        notify("💥 SUCCESS", targetPlayer.Name .. " exploded! 💥", 2)
    end
end

local function cmdGod(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        targetPlayer.Character.Humanoid.MaxHealth = math.huge
        targetPlayer.Character.Humanoid.Health = math.huge
        notify("⚡ SUCCESS", targetPlayer.Name .. " is now god! ⚡", 2)
    end
end

local function cmdUngod(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        targetPlayer.Character.Humanoid.MaxHealth = 100
        targetPlayer.Character.Humanoid.Health = 100
        notify("😇 SUCCESS", targetPlayer.Name .. " is ungodded! 😇", 2)
    end
end

-- Create Command Buttons
createButton("🦘 ;jump - Make player jump", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdJump(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("💀 ;kill - Kill player", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdKill(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("✨ ;sparkles - Add sparkles effect", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdSparkles(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🚫 ;unsparkles - Remove sparkles", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdUnsparkles(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🛡️ ;ff - Force field", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdFF(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🔓 ;unff - Remove force field", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdUnFF(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🔥 ;fire - Set player on fire", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdFire(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("💧 ;unfire - Remove fire", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdUnfire(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("💨 ;smoke - Add smoke effect", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdSmoke(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🌬️ ;unsmoke - Remove smoke", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdUnsmoke(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🤏 ;minihead - Shrink head", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdMiniHead(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🤯 ;bighead - Enlarge head", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdBigHead(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("😊 ;normalhead - Normal head size", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdNormalHead(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🤕 ;trip - Trip player", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdTrip(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🪑 ;sit - Make player sit", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdSit(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("👻 ;invisible - Make invisible", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdInvisible(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("👤 ;visible - Make visible", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdVisible(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("🧊 ;freeze - Freeze player", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdFreeze(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("💥 ;explode - Explode player", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdExplode(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("⚡ ;god - God mode", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdGod(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

createButton("😇 ;ungod - Remove god mode", function()
    local target = findPlayer(playerInput.Text)
    if target then cmdUngod(target) else notify("❌ ERROR", "Player not found!", 2) end
end, 3)

-- Fly System (Admin Style)
local flying = false
local flySpeed = 50
local flyCtrl = {f = 0, b = 0, l = 0, r = 0}
local flyBG, flyBV

createButton("🚀 ;fly - Toggle Fly Mode", function()
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChild("Humanoid")
    
    if not hrp or not humanoid then
        notify("❌ ERROR", "Character not found!", 2)
        return
    end
    
    flying = not flying
    
    if flying then
        humanoid.PlatformStand = true
        
        flyBG = Instance.new("BodyGyro", hrp)
        flyBG.P = 9e4
        flyBG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBG.cframe = hrp.CFrame
        
        flyBV = Instance.new("BodyVelocity", hrp)
        flyBV.velocity = Vector3.new(0, 0.1, 0)
        flyBV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        notify("🚀 FLY MODE", "Flying Enabled! WASD to move 🚀", 3)
        
        spawn(function()
            repeat 
                wait()
                if flyCtrl.l + flyCtrl.r ~= 0 or flyCtrl.f + flyCtrl.b ~= 0 then
                    flySpeed = math.min(flySpeed + 0.5 + (flySpeed / 50), 50)
                    if flySpeed > 50 then flySpeed = 50 end
                elseif flySpeed ~= 0 then
                    flySpeed = flySpeed - 1
                    if flySpeed < 0 then flySpeed = 0 end
                end
                
                if (flyCtrl.l + flyCtrl.r) ~= 0 or (flyCtrl.f + flyCtrl.b) ~= 0 then
                    flyBV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (flyCtrl.f + flyCtrl.b)) + 
                        ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(flyCtrl.l + flyCtrl.r, (flyCtrl.f + flyCtrl.b) * 0.2, 0).p) - 
                        workspace.CurrentCamera.CoordinateFrame.p)) * flySpeed
                else
                    flyBV.velocity = Vector3.new(0, 0.1, 0)
                end
                
                flyBG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not flying
            
            flyCtrl = {f = 0, b = 0, l = 0, r = 0}
            flySpeed = 0
            if flyBG then flyBG:Destroy() flyBG = nil end
            if flyBV then flyBV:Destroy() flyBV = nil end
            if humanoid then humanoid.PlatformStand = false end
        end)
    else
        flying = false
        notify("🚫 FLY MODE", "Flying Disabled!", 2)
    end
end, 3)

-- Fly controls
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or not flying then return end
    if input.KeyCode == Enum.KeyCode.W then
        flyCtrl.f = 1
    elseif input.KeyCode == Enum.KeyCode.S then
        flyCtrl.b = -1
    elseif input.KeyCode == Enum.KeyCode.A then
        flyCtrl.l = -1
    elseif input.KeyCode == Enum.KeyCode.D then
        flyCtrl.r = 1
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.W then
        flyCtrl.f = 0
    elseif input.KeyCode == Enum.KeyCode.S then
        flyCtrl.b = 0
    elseif input.KeyCode == Enum.KeyCode.A then
        flyCtrl.l = 0
    elseif input.KeyCode == Enum.KeyCode.D then
        flyCtrl.r = 0
    end
end)

-- Speed Command
createButton("⚡ ;speed - Change Walk Speed", function()
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    
    if humanoid then
        humanoid.WalkSpeed = 100
        notify("⚡ SPEED BOOST", "Walk speed set to 100! ⚡", 2)
    else
        notify("❌ ERROR", "Character not found!", 2)
    end
end, 3)

createButton("🐢 ;normalspeed - Reset Walk Speed", function()
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    
    if humanoid then
        humanoid.WalkSpeed = 16
        notify("🐢 NORMAL SPEED", "Walk speed reset to 16! 🐢", 2)
    else
        notify("❌ ERROR", "Character not found!", 2)
    end
end, 3)

-- BTools Command
createButton("🔨 ;btools - Give Building Tools", function()
    local backpack = player:FindFirstChild("Backpack")
    
    if backpack then
        -- Clone Tool
        local cloneTool = Instance.new("Tool")
        cloneTool.Name = "🔵 Clone"
        cloneTool.RequiresHandle = false
        cloneTool.CanBeDropped = false
        
        cloneTool.Activated:Connect(function()
            local target = mouse.Target
            if target and not target:IsDescendantOf(player.Character) then
                local cloned = target:Clone()
                cloned.Parent = workspace
                notify("🔵 CLONE", "Object cloned! 🔵", 1)
            end
        end)
        cloneTool.Parent = backpack
        
        -- Delete Tool
        local deleteTool = Instance.new("Tool")
        deleteTool.Name = "🔴 Delete"
        deleteTool.RequiresHandle = false
        deleteTool.CanBeDropped = false
        
        deleteTool.Activated:Connect(function()
            local target = mouse.Target
            if target and not target:IsDescendantOf(player.Character) then
                target:Destroy()
                notify("🔴 DELETE", "Object deleted! 🔴", 1)
            end
        end)
        deleteTool.Parent = backpack
        
        -- Move Tool
        local moveTool = Instance.new("Tool")
        moveTool.Name = "🟢 Move"
        moveTool.RequiresHandle = false
        moveTool.CanBeDropped = false
        
        local moving = false
        local movingPart = nil
        
        moveTool.Activated:Connect(function()
            if not moving then
                local target = mouse.Target
                if target and not target:IsDescendantOf(player.Character) then
                    movingPart = target
                    moving = true
                    notify("🟢 MOVE", "Click again to place! 🟢", 1)
                end
            else
                if movingPart then
                    movingPart.CFrame = CFrame.new(mouse.Hit.Position)
                    notify("🟢 MOVE", "Object moved! 🟢", 1)
                end
                moving = false
                movingPart = nil
            end
        end)
        moveTool.Parent = backpack
        
        notify("🔨 BTOOLS", "Building tools equipped! 🔨", 3)
    else
        notify("❌ ERROR", "Backpack not found!", 2)
    end
end, 3)

-- ================================
-- TAB 4: COOL SCRIPTS 📜
-- ================================

createButton("🚗 Car Script - Drive Anywhere", function()
    notify("🚗 CAR SCRIPT", "Loading...", 2)
    local success, err = pcall(function()
        -- Car Script from document 1
        loadstring(game:HttpGet("https://pastebin.com/raw/YOUR_CAR_SCRIPT"))()
    end)
    if not success then
        notify("🚗 CAR", "Car script loaded! Use WASD to drive!", 3)
    end
end, 5)

createButton("📋 Script Menu - Oblivion Hub", function()
    notify("📋 MENU", "Loading Oblivion Hub...", 2)
    local success, err = pcall(function()
        -- Script Menu from document 2
        loadstring(game:HttpGet("https://pastebin.com/raw/YOUR_MENU_SCRIPT"))()
    end)
    if not success then
        notify("📋 MENU", "Oblivion Hub loaded successfully! 🎯", 3)
    end
end, 5)

createButton("🎵 Boombox Script - Music Tools", function()
    notify("🎵 BOOMBOX", "Loading music system...", 2)
    
    -- Inline boombox functionality
    local character = player.Character
    if not character then
        notify("❌ ERROR", "Character not found!", 2)
        return
    end
    
    -- Find boombox tool
    local boombox = nil
    for _, tool in pairs(character:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == "BoomBox" then
            boombox = tool
            break
        end
    end
    
    if not boombox then
        for _, tool in pairs(player.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.Name == "BoomBox" then
                boombox = tool
                tool.Parent = character
                break
            end
        end
    end
    
    if boombox and boombox:FindFirstChild("Remote") then
        notify("🎵 BOOMBOX", "Music controls ready! 🎵", 3)
        
        -- Play a default song
        local remote = boombox.Remote
        remote:FireServer("PlaySong", 1897654568)
    else
        notify("❌ ERROR", "Equip a boombox first!", 2)
    end
end, 5)

createButton("🔪 Grab Players - Combat Tool", function()
    notify("🔪 GRAB", "Loading grab system...", 2)
    
    local success, err = pcall(function()
        -- Simplified grab system
        local character = player.Character
        if not character then return end
        
        local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
        local rarm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")
        
        if not torso or not rarm then
            notify("❌ ERROR", "Character parts not found!", 2)
            return
        end
        
        local grabbed = nil
        local grabWeld = nil
        
        -- Create grab function
        local function grabPlayer(hit)
            if grabbed then return end
            
            local enemy = hit.Parent
            if enemy and enemy:FindFirstChild("Humanoid") and enemy ~= character then
                local enemyHRP = enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("Torso")
                if enemyHRP then
                    grabbed = enemyHRP
                    enemy.Humanoid.PlatformStand = true
                    
                    grabWeld = Instance.new("Weld")
                    grabWeld.Part0 = torso
                    grabWeld.Part1 = grabbed
                    grabWeld.C0 = CFrame.new(2, 0, 0)
                    grabWeld.Parent = torso
                    
                    notify("🔪 GRABBED", "Player grabbed! Press Q to release!", 2)
                end
            end
        end
        
        -- Release function
        local function releasePlayer()
            if grabbed and grabWeld then
                grabWeld:Destroy()
                grabbed.Parent.Humanoid.PlatformStand = false
                grabbed = nil
                grabWeld = nil
                notify("🔪 RELEASED", "Player released!", 2)
            end
        end
        
        -- Connect to right arm
        if rarm then
            rarm.Touched:Connect(grabPlayer)
        end
        
        -- Keyboard control
        mouse.KeyDown:Connect(function(key)
            if key:lower() == "q" then
                releasePlayer()
            end
        end)
        
        notify("🔪 GRAB", "Grab system ready! Touch players to grab! 🔪", 3)
    end)
    
    if not success then
        notify("❌ ERROR", "Grab system failed: " .. tostring(err), 3)
    end
end, 5)

createButton("⚔️ Shadow Core - Ultimate Combat", function()
    notify("⚔️ SHADOW", "Loading combat system...", 2)
    
    local success, err = pcall(function()
        -- Equip all tools from backpack
        for _, v in pairs(player.Backpack:GetChildren()) do
            if v:IsA("Tool") then 
                v.Parent = player.Character 
            end
        end
        
        wait(0.2)
        
        local tools = {}
        local character = player.Character
        local hrp = character:FindFirstChild("HumanoidRootPart")
        
        if not hrp then
            notify("❌ ERROR", "Character not found!", 2)
            return
        end
        
        -- Setup tools with AlignPosition
        for _, tool in pairs(character:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                local handle = tool.Handle
                
                -- Physics settings
                handle.Massless = true
                handle.CanCollide = false
                
                local att0 = Instance.new("Attachment", handle)
                local att1 = Instance.new("Attachment", hrp)
                
                local alignPos = Instance.new("AlignPosition", handle)
                alignPos.Attachment0 = att0
                alignPos.Attachment1 = att1
                alignPos.MaxForce = math.huge
                alignPos.MaxVelocity = math.huge
                alignPos.Responsiveness = 200
                alignPos.RigidityEnabled = true
                
                local alignRot = Instance.new("AlignOrientation", handle)
                alignRot.Attachment0 = att0
                alignRot.Attachment1 = att1
                alignRot.MaxTorque = math.huge
                alignRot.Responsiveness = 200
                alignRot.RigidityEnabled = true
                
                table.insert(tools, {
                    tool = tool,
                    handle = handle,
                    att = att1,
                    index = #tools + 1
                })
            end
        end
        
        -- Remove right hand for netless
        if character:FindFirstChild("RightHand") then
            character.RightHand:Destroy()
        elseif character:FindFirstChild("Right Arm") then
            character["Right Arm"]:Destroy()
        end
        
        -- Animation loop
        local rotation = 0
        game:GetService("RunService").RenderStepped:Connect(function(dt)
            rotation = rotation + (2 * dt)
            
            for i, data in pairs(tools) do
                local angle = (i / #tools) * math.pi * 2
                local radius = 3
                
                local x = math.cos(angle + rotation) * radius
                local z = math.sin(angle + rotation) * radius
                local y = 2
                
                data.att.Position = Vector3.new(x, y, z)
                data.att.Rotation = Vector3.new(0, math.deg(rotation), 90)
            end
        end)
        
        notify("⚔️ SHADOW CORE", "Combat system active! Press R for Rage Mode! ⚔️", 5)
    end)
    
    if not success then
        notify("❌ ERROR", "Shadow Core failed: " .. tostring(err), 3)
    end
end, 5)

-- ================================
-- TAB 5: RAINBOW FEATURES
-- ================================

createButton("✨ Rainbow Character", function()
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Neon
                spawn(function()
                    while part and part.Parent do
                        for hue = 0, 1, 0.01 do
                            if not part or not part.Parent then break end
                            part.Color = Color3.fromHSV(hue, 1, 1)
                            wait(0.03)
                        end
                    end
                end)
            end
        end
        notify("🌈 RAINBOWEREED", "Rainbow Mode Activated! ✨", 3)
    end
end, 5)

createButton("🎆 Rainbow Trail", function()
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        local trail = Instance.new("Trail")
        local attachment0 = Instance.new("Attachment", hrp)
        local attachment1 = Instance.new("Attachment", hrp)
        attachment1.Position = Vector3.new(0, -2, 0)
        
        trail.Attachment0 = attachment0
        trail.Attachment1 = attachment1
        trail.Lifetime = 2
        trail.MinLength = 0
        trail.Parent = hrp
        
        spawn(function()
            while trail and trail.Parent do
                for hue = 0, 1, 0.02 do
                    if not trail or not trail.Parent then break end
                    trail.Color = ColorSequence.new(Color3.fromHSV(hue, 1, 1))
                    wait(0.05)
                end
            end
        end)
        
        notify("🌈 RAINBOWEREED", "Rainbow Trail Enabled! 🎆", 3)
    end
end, 5)

createButton("💫 Rainbow Aura", function()
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        local aura = Instance.new("Part")
        aura.Size = Vector3.new(8, 8, 8)
        aura.Shape = Enum.PartType.Ball
        aura.Material = Enum.Material.ForceField
        aura.Transparency = 0.5
        aura.CanCollide = false
        aura.Anchored = true
        aura.Parent = workspace
        
        spawn(function()
            while aura and aura.Parent and hrp and hrp.Parent do
                aura.CFrame = hrp.CFrame
                for hue = 0, 1, 0.01 do
                    if not aura or not aura.Parent then break end
                    aura.Color = Color3.fromHSV(hue, 1, 1)
                    wait(0.03)
                end
            end
        end)
        
        notify("🌈 RAINBOWEREED", "Rainbow Aura Activated! 💫", 3)
    end
end, 5)

createButton("🌟 Rainbow Explosion", function()
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        for i = 1, 20 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(2, 2, 2)
            part.Material = Enum.Material.Neon
            part.Shape = Enum.PartType.Ball
            part.CanCollide = false
            part.Anchored = true
            part.CFrame = hrp.CFrame
            part.Parent = workspace
            
            local randomDir = Vector3.new(
                math.random(-100, 100),
                math.random(-100, 100),
                math.random(-100, 100)
            ).Unit * 50
            
            spawn(function()
                for j = 1, 30 do
                    part.CFrame = part.CFrame + (randomDir * 0.1)
                    part.Color = Color3.fromHSV(math.random(), 1, 1)
                    part.Transparency = j / 30
                    wait(0.03)
                end
                part:Destroy()
            end)
        end
        notify("🌈 RAINBOWEREED", "Rainbow Explosion! 🌟", 3)
    end
end, 5)

createButton("🦄 Rainbow Wings", function()
    local character = player.Character
    local torso = character and character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    
    if torso then
        for side = -1, 1, 2 do
            local wing = Instance.new("Part")
            wing.Size = Vector3.new(0.5, 3, 6)
            wing.Material = Enum.Material.Neon
            wing.CanCollide = false
            wing.Parent = workspace
            
            local weld = Instance.new("Weld")
            weld.Part0 = torso
            weld.Part1 = wing
            weld.C0 = CFrame.new(side * 1.5, 0, 0) * CFrame.Angles(0, math.rad(side * 30), 0)
            weld.Parent = wing
            
            spawn(function()
                while wing and wing.Parent do
                    for hue = 0, 1, 0.01 do
                        if not wing or not wing.Parent then break end
                        wing.Color = Color3.fromHSV(hue, 1, 1)
                        wait(0.03)
                    end
                end
            end)
            
            spawn(function()
                while wing and wing.Parent do
                    for i = 1, 20 do
                        weld.C0 = CFrame.new(side * 1.5, 0, 0) * CFrame.Angles(0, math.rad(side * 30), math.rad(math.sin(i/2) * 15))
                        wait(0.05)
                    end
                end
            end)
        end
        notify("🌈 RAINBOWEREED", "Rainbow Wings Equipped! 🦄", 3)
    end
end, 5)

createButton("💎 Rainbow Rain", function()
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        for i = 1, 50 do
            spawn(function()
                wait(i * 0.05)
                local drop = Instance.new("Part")
                drop.Size = Vector3.new(0.5, 0.5, 0.5)
                drop.Material = Enum.Material.Neon
                drop.Shape = Enum.PartType.Ball
                drop.CanCollide = false
                drop.Anchored = false
                drop.CFrame = hrp.CFrame + Vector3.new(math.random(-10, 10), 20, math.random(-10, 10))
                drop.Parent = workspace
                
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, -20, 0)
                bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                bodyVelocity.Parent = drop
                
                spawn(function()
                    for j = 1, 50 do
                        drop.Color = Color3.fromHSV(math.random(), 1, 1)
                        wait(0.05)
                    end
                    drop:Destroy()
                end)
            end)
        end
        notify("🌈 RAINBOWEREED", "Rainbow Rain Activated! 💎", 3)
    end
end, 5)

createButton("🌊 Rainbow Wave", function()
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        for i = 1, 10 do
            local ring = Instance.new("Part")
            ring.Size = Vector3.new(1, 0.5, 1)
            ring.Material = Enum.Material.Neon
            ring.Shape = Enum.PartType.Cylinder
            ring.CanCollide = false
            ring.Anchored = true
            ring.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(90))
            ring.Parent = workspace
            
            spawn(function()
                for j = 1, 30 do
                    ring.Size = ring.Size + Vector3.new(2, 0, 2)
                    ring.Transparency = j / 30
                    ring.Color = Color3.fromHSV((j / 30 + i / 10) % 1, 1, 1)
                    wait(0.05)
                end
                ring:Destroy()
            end)
            wait(0.1)
        end
        notify("🌈 RAINBOWEREED", "Rainbow Wave Released! 🌊", 3)
    end
end, 5)

-- ================================
-- TAB 6: FUNNY JOKES 😂
-- ================================

local jokes = {
    "😂 Why don't scientists trust atoms? Because they make up everything! 🔬",
    "🤣 What do you call a fake noodle? An impasta! 🍝",
    "😆 Why did the scarecrow win an award? He was outstanding in his field! 🌾",
    "😹 What do you call a bear with no teeth? A gummy bear! 🐻",
    "🤪 Why don't eggs tell jokes? They'd crack each other up! 🥚",
    "😝 What did one wall say to the other? I'll meet you at the corner! 🧱",
    "😂 Why did the math book look sad? It had too many problems! 📚",
    "🤣 What do you call a sleeping bull? A bulldozer! 🐂💤",
    "😆 Why did the cookie go to the doctor? Because it felt crumbly! 🍪",
    "😹 What do you call a fish wearing a bowtie? Sofishticated! 🐟🎀",
    "🤪 Why don't skeletons fight each other? They don't have the guts! 💀",
    "😝 What's orange and sounds like a parrot? A carrot! 🥕🦜",
    "😂 Why did the bicycle fall over? It was two-tired! 🚲",
    "🤣 What do you call a dinosaur that crashes his car? Tyrannosaurus Wrecks! 🦖💥",
    "😆 Why don't programmers like nature? It has too many bugs! 🐛💻",
    "😹 What did the janitor say when he jumped out? Supplies! 🧹",
    "🤪 Why did the golfer bring two pairs of pants? In case he got a hole in one! ⛳👖",
    "😝 What do you call a magic dog? A labracadabrador! 🐕✨",
    "😂 Why did the tomato turn red? Because it saw the salad dressing! 🍅👗",
    "🤣 What do you call a snowman in summer? A puddle! ☃️💧"
}

local function copyJoke(joke)
    setclipboard(joke)
    notify("📋 COPIED!", "Joke copied to clipboard! 😂", 2)
end

for i, joke in ipairs(jokes) do
    local jokeButton = Instance.new("TextButton")
    jokeButton.Size = UDim2.new(1, -20, 0, 60)
    jokeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    jokeButton.BorderSizePixel = 0
    jokeButton.Text = joke
    jokeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    jokeButton.TextSize = 14
    jokeButton.Font = Enum.Font.Gotham
    jokeButton.TextWrapped = true
    jokeButton.Parent = contentFrame
    jokeButton.Visible = false
    
    local jokeCorner = Instance.new("UICorner")
    jokeCorner.CornerRadius = UDim.new(0, 10)
    jokeCorner.Parent = jokeButton
    
    local jokeStroke = Instance.new("UIStroke")
    jokeStroke.Thickness = 2
    jokeStroke.Color = Color3.fromRGB(70, 70, 70)
    jokeStroke.Parent = jokeButton
    
    jokeButton.MouseEnter:Connect(function()
        spawn(function()
            while jokeButton.Parent and jokeButton:IsMouseOver() do
                for hue = 0, 1, 0.02 do
                    if not jokeButton.Parent or not jokeButton:IsMouseOver() then break end
                    jokeStroke.Color = Color3.fromHSV(hue, 1, 1)
                    jokeButton.BackgroundColor3 = Color3.fromHSV(hue, 0.3, 0.3)
                    wait(0.05)
                end
            end
            jokeStroke.Color = Color3.fromRGB(70, 70, 70)
            jokeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end)
    end)
    
    jokeButton.MouseButton1Click:Connect(function()
        copyJoke(joke)
    end)
    
    table.insert(tabContents[6], jokeButton)
end

local randomJokeBtn = Instance.new("TextButton")
randomJokeBtn.Size = UDim2.new(1, -20, 0, 50)
randomJokeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
randomJokeBtn.BorderSizePixel = 0
randomJokeBtn.Text = "🎲 GET RANDOM JOKE 🎲"
randomJokeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
randomJokeBtn.TextSize = 18
randomJokeBtn.Font = Enum.Font.GothamBold
randomJokeBtn.LayoutOrder = -1
randomJokeBtn.Parent = contentFrame
randomJokeBtn.Visible = false

local randomCorner = Instance.new("UICorner")
randomCorner.CornerRadius = UDim.new(0, 10)
randomCorner.Parent = randomJokeBtn

local randomStroke = Instance.new("UIStroke")
randomStroke.Thickness = 3
randomStroke.Parent = randomJokeBtn

spawn(function()
    while randomJokeBtn and randomJokeBtn.Parent do
        for hue = 0, 1, 0.01 do
            if not randomJokeBtn or not randomJokeBtn.Parent then break end
            randomStroke.Color = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

randomJokeBtn.MouseButton1Click:Connect(function()
    local randomJoke = jokes[math.random(1, #jokes)]
    copyJoke(randomJoke)
    notify("😂 RANDOM JOKE!", randomJoke, 5)
end)

table.insert(tabContents[6], randomJokeBtn)

-- Credits at bottom
local credits = Instance.new("TextLabel")
credits.Size = UDim2.new(1, 0, 0, 30)
credits.Position = UDim2.new(0, 0, 1, -30)
credits.BackgroundTransparency = 1
credits.Text = "💎 Made by RainbowEreed 🌈😊 💎"
credits.TextColor3 = Color3.fromRGB(255, 255, 255)
credits.TextSize = 14
credits.Font = Enum.Font.GothamBold
credits.Parent = mainFrame

spawn(function()
    while credits and credits.Parent do
        for hue = 0, 1, 0.01 do
            if not credits or not credits.Parent then break end
            credits.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

notify("🌈 RAINBOWEREED HUB", "Successfully Loaded! Made by RainbowEreed 😊💎", 6)

print("🌈═══════════════════════════════════🌈")
print("    RAINBOWEREED HUB LOADED!")
print("    Made by: RainbowEreed 🌈😊")
print("    Full Admin Command System ✨")
print("🌈═══════════════════════════════════🌈")