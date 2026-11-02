local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local function playSound(id)
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. id
    s.Parent = SoundService
    s:Play()
    s.Ended:Connect(function() s:Destroy() end)
end

playSound("2865227271")

local function makeCorner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = parent
end

local function makeButton(parent, pos, size, text, bg, ts)
    local b = Instance.new("TextButton")
    b.Position = pos
    b.Size = size
    b.Text = text
    b.BackgroundColor3 = bg or Color3.fromRGB(160, 82, 45)
    b.TextColor3 = Color3.fromRGB(255, 248, 220)
    b.Font = Enum.Font.Fondamento
    b.TextSize = ts or 16
    b.Parent = parent
    makeCorner(b, 10)
    return b
end

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperRingPartsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 420)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(205, 170, 125)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
makeCorner(MainFrame, 20)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Super Parts v4"
Title.TextColor3 = Color3.fromRGB(101, 67, 33)
Title.BackgroundColor3 = Color3.fromRGB(222, 184, 135)
Title.Font = Enum.Font.Fondamento
Title.TextSize = 22
Title.Parent = MainFrame
makeCorner(Title, 20)

local ToggleButton = makeButton(MainFrame, UDim2.new(0.1, 0, 0.11, 0), UDim2.new(0.8, 0, 0, 28), "Mode Off", nil, 16)

local DecreaseRadius = makeButton(MainFrame, UDim2.new(0.1, 0, 0.21, 0), UDim2.new(0.2, 0, 0, 26), "<", Color3.fromRGB(139, 69, 19), 16)
local IncreaseRadius = makeButton(MainFrame, UDim2.new(0.7, 0, 0.21, 0), UDim2.new(0.2, 0, 0, 26), ">", Color3.fromRGB(139, 69, 19), 16)
local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0.4, 0, 0, 26)
RadiusDisplay.Position = UDim2.new(0.3, 0, 0.21, 0)
RadiusDisplay.Text = "Radius: 50"
RadiusDisplay.BackgroundColor3 = Color3.fromRGB(210, 180, 140)
RadiusDisplay.TextColor3 = Color3.fromRGB(101, 67, 33)
RadiusDisplay.Font = Enum.Font.Fondamento
RadiusDisplay.TextSize = 15
RadiusDisplay.Parent = MainFrame
makeCorner(RadiusDisplay, 10)

local SpeedDown = makeButton(MainFrame, UDim2.new(0.1, 0, 0.30, 0), UDim2.new(0.2, 0, 0, 26), "<<", Color3.fromRGB(139, 69, 19), 15)
local SpeedUp = makeButton(MainFrame, UDim2.new(0.7, 0, 0.30, 0), UDim2.new(0.2, 0, 0, 26), ">>", Color3.fromRGB(139, 69, 19), 15)
local SpeedDisplay = Instance.new("TextLabel")
SpeedDisplay.Size = UDim2.new(0.4, 0, 0, 26)
SpeedDisplay.Position = UDim2.new(0.3, 0, 0.30, 0)
SpeedDisplay.Text = "Speed: 10"
SpeedDisplay.BackgroundColor3 = Color3.fromRGB(210, 180, 140)
SpeedDisplay.TextColor3 = Color3.fromRGB(101, 67, 33)
SpeedDisplay.Font = Enum.Font.Fondamento
SpeedDisplay.TextSize = 15
SpeedDisplay.Parent = MainFrame
makeCorner(SpeedDisplay, 10)

local ModeButton = makeButton(MainFrame, UDim2.new(0.1, 0, 0.39, 0), UDim2.new(0.8, 0, 0, 26), "Plane: Horizontal (H)", Color3.fromRGB(139, 69, 19), 15)

local shapeButtons = {}
local shapes = {
    {id="ring", label="Ring"},
    {id="aura", label="Aura"},
    {id="heart", label="Heart"},
    {id="sphere", label="Sphere"},
    {id="wall", label="Wall"},
    {id="tornado", label="Tornado"},
}

for i, sh in ipairs(shapes) do
    local col = (i - 1) % 2
    local row = math.floor((i - 1) / 2)
    local btn = makeButton(MainFrame,
        UDim2.new(0.1 + col * 0.42, 0, 0.49 + row * 0.07, 0),
        UDim2.new(0.38, 0, 0, 24),
        sh.label,
        Color3.fromRGB(139, 69, 19),
        14)
    shapeButtons[sh.id] = btn
end

local TargetButton = makeButton(MainFrame, UDim2.new(0.1, 0, 0.72, 0), UDim2.new(0.8, 0, 0, 26), "🎯 Target: None", Color3.fromRGB(139, 69, 19), 15)
local TargetRingToggle = makeButton(MainFrame, UDim2.new(0.1, 0, 0.81, 0), UDim2.new(0.8, 0, 0, 24), "Target Shape Off", nil, 13)
local TPToTargetToggle = makeButton(MainFrame, UDim2.new(0.1, 0, 0.90, 0), UDim2.new(0.8, 0, 0, 24), "TP Blocks To Target: Off", nil, 13)

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 16)
Watermark.Position = UDim2.new(0, 0, 1, -16)
Watermark.Text = "Super Parts [V4] - Cracked By Projeto LKB"
Watermark.TextColor3 = Color3.fromRGB(101, 67, 33)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.Fondamento
Watermark.TextSize = 12
Watermark.Parent = MainFrame

local MinimizeButton = makeButton(MainFrame, UDim2.new(1, -35, 0, 5), UDim2.new(0, 30, 0, 30), "-", Color3.fromRGB(139, 69, 19), 18)
makeCorner(MinimizeButton, 15)

local allUI = {ToggleButton, DecreaseRadius, IncreaseRadius, RadiusDisplay, SpeedDown, SpeedUp, SpeedDisplay, ModeButton,
               TargetButton, TargetRingToggle, TPToTargetToggle, Watermark}
for _, b in pairs(shapeButtons) do table.insert(allUI, b) end

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame:TweenSize(minimized and UDim2.new(0, 260, 0, 40) or UDim2.new(0, 260, 0, 420), "Out", "Quad", 0.3, true)
    MinimizeButton.Text = minimized and "+" or "-"
    for _, v in ipairs(allUI) do v.Visible = not minimized end
    playSound("12221967")
end)

local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Player Selector
local targetPlayer, targetShapeEnabled, tpToTargetEnabled = nil, false, false

local PlayerSelector = Instance.new("Frame")
PlayerSelector.Size = UDim2.new(0, 260, 0, 300)
PlayerSelector.Position = UDim2.new(0.5, -130, 0.5, -150)
PlayerSelector.BackgroundColor3 = Color3.fromRGB(205, 170, 125)
PlayerSelector.BorderSizePixel = 0
PlayerSelector.Visible = false
PlayerSelector.ZIndex = 10
PlayerSelector.Parent = ScreenGui
makeCorner(PlayerSelector, 15)

local SelectorTitle = Instance.new("TextLabel")
SelectorTitle.Size = UDim2.new(1, 0, 0, 30)
SelectorTitle.Text = "Select Target Player"
SelectorTitle.TextColor3 = Color3.fromRGB(101, 67, 33)
SelectorTitle.BackgroundColor3 = Color3.fromRGB(222, 184, 135)
SelectorTitle.Font = Enum.Font.Fondamento
SelectorTitle.TextSize = 18
SelectorTitle.ZIndex = 11
SelectorTitle.Parent = PlayerSelector
makeCorner(SelectorTitle, 15)

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(0.9, 0, 0, 28)
SearchBox.Position = UDim2.new(0.05, 0, 0, 35)
SearchBox.PlaceholderText = "Type name (partial)..."
SearchBox.ClearTextOnFocus = false
SearchBox.BackgroundColor3 = Color3.fromRGB(255, 248, 220)
SearchBox.TextColor3 = Color3.fromRGB(101, 67, 33)
SearchBox.Font = Enum.Font.Fondamento
SearchBox.TextSize = 16
SearchBox.ZIndex = 11
SearchBox.Parent = PlayerSelector
makeCorner(SearchBox, 8)

local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Size = UDim2.new(0.9, 0, 0, 200)
PlayerList.Position = UDim2.new(0.05, 0, 0, 70)
PlayerList.BackgroundColor3 = Color3.fromRGB(222, 184, 135)
PlayerList.BorderSizePixel = 0
PlayerList.ScrollBarThickness = 6
PlayerList.ZIndex = 11
PlayerList.Parent = PlayerSelector
makeCorner(PlayerList, 8)

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 2)
ListLayout.Parent = PlayerList

local CloseSelector = makeButton(PlayerSelector, UDim2.new(1, -30, 0, 3), UDim2.new(0, 25, 0, 25), "X", Color3.fromRGB(139, 69, 19), 14)
CloseSelector.ZIndex = 12

local function resetTarget()
    targetPlayer = nil
    TargetButton.Text = "🎯 Target: None"
    TargetButton.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
    targetShapeEnabled = false
    TargetRingToggle.Text = "Target Shape Off"
    TargetRingToggle.BackgroundColor3 = Color3.fromRGB(160, 82, 45)
    tpToTargetEnabled = false
    TPToTargetToggle.Text = "TP Blocks To Target: Off"
    TPToTargetToggle.BackgroundColor3 = Color3.fromRGB(160, 82, 45)
end

local function refreshPlayerList(filter)
    for _, c in ipairs(PlayerList:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    filter = string.lower(filter or "")
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and (filter == "" or string.find(string.lower(p.Name), filter, 1, true)) then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -6, 0, 26)
            btn.BackgroundColor3 = Color3.fromRGB(210, 180, 140)
            btn.TextColor3 = Color3.fromRGB(101, 67, 33)
            btn.Font = Enum.Font.Fondamento
            btn.TextSize = 15
            btn.Text = p.Name
            btn.ZIndex = 12
            btn.Parent = PlayerList
            makeCorner(btn, 6)
            btn.MouseButton1Click:Connect(function()
                targetPlayer = p
                TargetButton.Text = "🎯 Target: " .. p.Name
                TargetButton.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
                PlayerSelector.Visible = false
                playSound("12221967")
            end)
        end
    end
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 4)
end

TargetButton.MouseButton1Click:Connect(function()
    PlayerSelector.Visible = not PlayerSelector.Visible
    if PlayerSelector.Visible then
        refreshPlayerList("")
        SearchBox.Text = ""
    end
    playSound("12221967")
end)
CloseSelector.MouseButton1Click:Connect(function() PlayerSelector.Visible = false; playSound("12221967") end)
SearchBox:GetPropertyChangedSignal("Text"):Connect(function() refreshPlayerList(SearchBox.Text) end)
Players.PlayerAdded:Connect(function() if PlayerSelector.Visible then refreshPlayerList(SearchBox.Text) end end)
Players.PlayerRemoving:Connect(function(p)
    if targetPlayer == p then resetTarget() end
    if PlayerSelector.Visible then refreshPlayerList(SearchBox.Text) end
end)

-- Network setup
if not getgenv().Network then
    getgenv().Network = { BaseParts = {}, Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424) }
    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end
    LocalPlayer.ReplicationFocus = workspace
    RunService.Heartbeat:Connect(function()
        sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
        for _, Part in pairs(Network.BaseParts) do
            if Part:IsDescendantOf(workspace) then Part.Velocity = Network.Velocity end
        end
    end)
end

-- Parts tracking
local radius, rotationSpeed, attractionStrength = 50, 10, 1000
local activeMode = "off"
local planeMode = "horizontal"
local parts = {}
local globalTime = 0

local function isInCharacter(part)
    for _, plr in ipairs(Players:GetPlayers()) do
        local char = plr.Character
        if char and (part.Parent == char or part:IsDescendantOf(char)) then
            return true
        end
    end
    return false
end

local function retain(part)
    if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(workspace) then
        if isInCharacter(part) then return false end
        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        part.CanCollide = false
        return true
    end
    return false
end

local function addPart(part)
    if retain(part) and not table.find(parts, part) then table.insert(parts, part) end
end

local function removePart(part)
    local i = table.find(parts, part)
    if i then table.remove(parts, i) end
end

for _, p in ipairs(workspace:GetDescendants()) do addPart(p) end
workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

local function getHRP(player)
    local char = player and player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

-- ============================================
-- SHAPES
-- ============================================

local function applyShape(center, mode)
    local count = #parts
    if count == 0 then return end
    local t = globalTime

    for i, part in ipairs(parts) do
        if part.Parent and part:IsDescendantOf(workspace) and not part.Anchored then
            local target
            local frac = (i - 1) / count

            if mode == "ring" then
                if planeMode == "vertical" then
                    local angle = frac * math.pi * 2 + math.rad(rotationSpeed) * t
                    local r = radius
                    target = center + Vector3.new(
                        math.cos(angle) * r,
                        math.sin(angle) * r,
                        math.sin(angle) * 0.001
                    )
                else
                    local angle = frac * math.pi * 2 + math.rad(rotationSpeed) * t
                    target = center + Vector3.new(
                        math.cos(angle) * radius,
                        math.sin(frac * math.pi * 4) * 2,
                        math.sin(angle) * radius
                    )
                end

            elseif mode == "aura" then
                local phi = frac * math.pi * 2 + t * 0.5
                local theta = (frac * 13.37 + i * 0.7) % math.pi
                local pulse = 1 + math.sin(t * 2 + i) * 0.15
                local r = radius * 0.7 * pulse
                target = center + Vector3.new(
                    math.sin(theta) * math.cos(phi) * r,
                    math.cos(theta) * r + math.sin(t * 3 + i) * 2,
                    math.sin(theta) * math.sin(phi) * r
                )

            elseif mode == "heart" then
                -- Cœur 3D fixe (pas de battement)
                local a = frac * math.pi * 2 + math.rad(rotationSpeed) * t
                local sx = 16 * math.sin(a)^3
                local sy = 13 * math.cos(a) - 5 * math.cos(2*a) - 2 * math.cos(3*a) - math.cos(4*a)
                local s = radius / 20
                target = center + Vector3.new(
                    sx * s,
                    -sy * s + 5,
                    math.sin(frac * math.pi * 6) * (radius * 0.15)
                )

            elseif mode == "sphere" then
                -- Sphère fixe (pas de rotation)
                local phi = math.acos(1 - 2 * frac)
                local theta = math.pi * (1 + math.sqrt(5)) * i
                local r = radius
                target = center + Vector3.new(
                    math.sin(phi) * math.cos(theta) * r,
                    math.cos(phi) * r,
                    math.sin(phi) * math.sin(theta) * r
                )

            elseif mode == "wall" then
                local cam = workspace.CurrentCamera
                local look = cam and cam.CFrame.LookVector or Vector3.new(0, 0, -1)
                local right = cam and cam.CFrame.RightVector or Vector3.new(1, 0, 0)
                local up = Vector3.new(0, 1, 0)
                local cols = math.ceil(math.sqrt(count))
                local row = math.floor((i - 1) / cols)
                local col = (i - 1) % cols
                local spread = radius / 1.5
                local spacing = (spread * 2) / math.max(cols - 1, 1)
                target = center
                    + look * 8
                    + right * (-spread + col * spacing)
                    + up * (-spread * 0.5 + row * spacing)

            elseif mode == "tornado" then
                local angle = frac * math.pi * 12 + math.rad(rotationSpeed) * t
                local h = (frac * 2 - 1) * radius * 1.5
                local r = radius * 0.8 * (1 - math.abs(frac - 0.5) * 1.5)
                target = center + Vector3.new(
                    math.cos(angle) * r,
                    h,
                    math.sin(angle) * r
                )
            end

            if target then
                part.Velocity = (target - part.Position).Unit * attractionStrength
            end
        end
    end
end

-- ============================================
-- BOUCLES
-- ============================================

RunService.Heartbeat:Connect(function(dt)
    globalTime = globalTime + dt

    if activeMode ~= "off" then
        local hrp = getHRP(LocalPlayer)
        if hrp then applyShape(hrp.Position, activeMode) end
    end

    if targetShapeEnabled and targetPlayer then
        local hrp = getHRP(targetPlayer)
        if hrp then applyShape(hrp.Position, activeMode) end
    end
end)

local tpOffsets = setmetatable({}, {__mode = "k"})
RunService.Heartbeat:Connect(function()
    if not tpToTargetEnabled or not targetPlayer then return end
    local hrp = getHRP(targetPlayer)
    if not hrp then return end
    local center = hrp.Position
    for _, part in ipairs(parts) do
        if part.Parent and part:IsDescendantOf(workspace) and not part.Anchored then
            if not tpOffsets[part] then
                tpOffsets[part] = Vector3.new(
                    math.random(-8, 8) / 10,
                    math.random(0, 15) / 10,
                    math.random(-8, 8) / 10
                )
            end
            local targetPos = center + tpOffsets[part]
            local dist = (targetPos - part.Position).Magnitude
            if dist < 1 then
                part.Velocity = Vector3.zero
                part.CFrame = CFrame.new(targetPos)
            else
                part.Velocity = (targetPos - part.Position).Unit * attractionStrength
            end
        end
    end
end)

-- ============================================
-- UI LOGIC
-- ============================================

local SHAPE_LABELS = {
    ring = "Ring", aura = "Aura", heart = "Heart",
    sphere = "Sphere", wall = "Wall", tornado = "Tornado"
}

local function updateShapeButtons()
    for id, btn in pairs(shapeButtons) do
        btn.BackgroundColor3 = (activeMode == id) and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(139, 69, 19)
    end
    ToggleButton.Text = activeMode ~= "off" and ("Mode: " .. (SHAPE_LABELS[activeMode] or "?")) or "Mode Off"
    ToggleButton.BackgroundColor3 = activeMode ~= "off" and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
end

local function setActiveMode(mode)
    activeMode = mode
    if mode ~= "off" then
        targetShapeEnabled = false
        tpToTargetEnabled = false
        TargetRingToggle.Text = "Target Shape Off"
        TargetRingToggle.BackgroundColor3 = Color3.fromRGB(160, 82, 45)
        TPToTargetToggle.Text = "TP Blocks To Target: Off"
        TPToTargetToggle.BackgroundColor3 = Color3.fromRGB(160, 82, 45)
    end
    updateShapeButtons()
end

ToggleButton.MouseButton1Click:Connect(function()
    setActiveMode(activeMode == "off" and "ring" or "off")
    playSound("12221967")
end)

for id, btn in pairs(shapeButtons) do
    btn.MouseButton1Click:Connect(function()
        setActiveMode(activeMode == id and "off" or id)
        playSound("12221967")
    end)
end

TargetRingToggle.MouseButton1Click:Connect(function()
    if not targetPlayer then TargetButton.Text = "🎯 Select target first!" return end
    targetShapeEnabled = not targetShapeEnabled
    if targetShapeEnabled then
        activeMode = activeMode ~= "off" and activeMode or "ring"
        updateShapeButtons()
        tpToTargetEnabled = false
        TPToTargetToggle.Text = "TP Blocks To Target: Off"
        TPToTargetToggle.BackgroundColor3 = Color3.fromRGB(160, 82, 45)
    end
    TargetRingToggle.Text = targetShapeEnabled and "Target Shape On" or "Target Shape Off"
    TargetRingToggle.BackgroundColor3 = targetShapeEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
    playSound("12221967")
end)

TPToTargetToggle.MouseButton1Click:Connect(function()
    if not targetPlayer then TargetButton.Text = "🎯 Select target first!" return end
    tpToTargetEnabled = not tpToTargetEnabled
    if tpToTargetEnabled then
        activeMode = "off"
        updateShapeButtons()
        targetShapeEnabled = false
        TargetRingToggle.Text = "Target Shape Off"
        TargetRingToggle.BackgroundColor3 = Color3.fromRGB(160, 82, 45)
    end
    TPToTargetToggle.Text = tpToTargetEnabled and "TP Blocks To Target: On" or "TP Blocks To Target: Off"
    TPToTargetToggle.BackgroundColor3 = tpToTargetEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
    playSound("12221967")
end)

DecreaseRadius.MouseButton1Click:Connect(function()
    radius = math.max(10, radius - 5)
    RadiusDisplay.Text = "Radius: " .. radius
    playSound("12221967")
end)
IncreaseRadius.MouseButton1Click:Connect(function()
    radius = math.min(150, radius + 5)
    RadiusDisplay.Text = "Radius: " .. radius
    playSound("12221967")
end)

SpeedDown.MouseButton1Click:Connect(function()
    rotationSpeed = math.max(1, rotationSpeed - 2)
    SpeedDisplay.Text = "Speed: " .. rotationSpeed
    playSound("12221967")
end)
SpeedUp.MouseButton1Click:Connect(function()
    rotationSpeed = math.min(50, rotationSpeed + 2)
    SpeedDisplay.Text = "Speed: " .. rotationSpeed
    playSound("12221967")
end)

ModeButton.MouseButton1Click:Connect(function()
    planeMode = (planeMode == "horizontal") and "vertical" or "horizontal"
    ModeButton.Text = "Plane: " .. (planeMode == "horizontal" and "Horizontal (H)" or "Vertical (V)")
    playSound("12221967")
end)

updateShapeButtons()

-- Notifications
StarterGui:SetCore("SendNotification", { Title = "Join me Discord !", Text = "For More Op Scripts !", Duration = 5 })
local ok, content = pcall(function()
    return Players:GetUserThumbnailAsync(Players:GetUserIdFromNameAsync("NannaDev"), Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end)
StarterGui:SetCore("SendNotification", { Title = "Enjoy Super Parts [V4]", Text = "Cracked By .gg/3kZ7dKbJPe", Icon = ok and content or nil, Duration = 5 })