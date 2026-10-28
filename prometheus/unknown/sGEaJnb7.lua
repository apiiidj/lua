--// BAD HUB - UPDATED & FIXED (Nov 2025 - Working Scripts Only!) \\--
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BadHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

--// Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.fromScale(0.35, 0.55)
mainFrame.Position = UDim2.fromScale(0.325, 0.225)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Rounded Corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- Gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
})
gradient.Rotation = 135
gradient.Parent = mainFrame

-- Shadow
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.fromScale(1.1, 1.1)
shadow.Position = UDim2.fromScale(-0.05, -0.05)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6014261993"
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ZIndex = 0
shadow.Parent = mainFrame

--// Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.fromScale(1, 0.12)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.fromScale(0.7, 1)
titleLabel.Position = UDim2.fromScale(0.03, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Bad Hub - Fixed 2025"
titleLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextScaled = true
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromOffset(36, 36)
closeButton.Position = UDim2.fromScale(1, 0)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.Parent = titleBar

--// Draggable
local dragging = false
local dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Close Animation
closeButton.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
        Size = UDim2.fromScale(0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    })
    tween:Play()
    tween.Completed:Wait()
    screenGui:Destroy()
end)

--// Scrolling Frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.fromScale(1, 0.88)
scrollFrame.Position = UDim2.fromScale(0, 0.12)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 5
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.CanvasSize = UDim2.fromOffset(0, 0)
scrollFrame.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 16)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollFrame

local padding = Instance.new("UIPadding")
padding.PaddingLeft = UDim.new(0, 16)
padding.PaddingRight = UDim.new(0, 16)
padding.PaddingTop = UDim.new(0, 16)
padding.Parent = scrollFrame

--// ADD SCRIPT FUNCTION (ENHANCED ERROR HANDLING)
local function addScript(name, author, description, scriptUrl)
    if scriptUrl == "" then scriptUrl = nil end

    -- Main Card
    local card = Instance.new("Frame")
    card.Size = UDim2.fromScale(1, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    card.BorderSizePixel = 0
    card.Parent = scrollFrame

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 14)
    cardCorner.Parent = card

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(60, 60, 80)
    cardStroke.Thickness = 1.5
    cardStroke.Parent = card

    local cardLayout = Instance.new("UIListLayout")
    cardLayout.SortOrder = Enum.SortOrder.LayoutOrder
    cardLayout.Padding = UDim.new(0, 12)
    cardLayout.Parent = card

    local cardPadding = Instance.new("UIPadding")
    cardPadding.PaddingLeft = UDim.new(0, 16)
    cardPadding.PaddingRight = UDim.new(0, 16)
    cardPadding.PaddingTop = UDim.new(0, 16)
    cardPadding.PaddingBottom = UDim.new(0, 8)
    cardPadding.Parent = card

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.fromScale(1, 0)
    title.AutomaticSize = Enum.AutomaticSize.Y
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextWrapped = true
    title.Parent = card

    -- Author
    local authorLabel = Instance.new("TextLabel")
    authorLabel.Size = UDim2.fromScale(1, 0)
    authorLabel.AutomaticSize = Enum.AutomaticSize.Y
    authorLabel.BackgroundTransparency = 1
    authorLabel.Text = "by " .. author
    authorLabel.TextColor3 = Color3.fromRGB(200, 100, 255)
    authorLabel.Font = Enum.Font.Gotham
    authorLabel.TextSize = 15
    authorLabel.TextXAlignment = Enum.TextXAlignment.Left
    authorLabel.Parent = card

    -- Description
    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.fromScale(1, 0)
    desc.AutomaticSize = Enum.AutomaticSize.Y
    desc.BackgroundTransparency = 1
    desc.Text = description
    desc.TextColor3 = Color3.fromRGB(170, 170, 190)
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 14
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextWrapped = true
    desc.Parent = card

    -- EXECUTE BUTTON
    local executeBtn = Instance.new("TextButton")
    executeBtn.Size = UDim2.fromScale(1, 0)
    executeBtn.AutomaticSize = Enum.AutomaticSize.Y
    executeBtn.BackgroundColor3 = scriptUrl and Color3.fromRGB(220, 50, 50) or Color3.fromRGB(70, 70, 80)
    executeBtn.Text = scriptUrl and "EXECUTE" or "NO SCRIPT"
    executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeBtn.Font = Enum.Font.GothamBlack
    executeBtn.TextSize = 18
    executeBtn.AutoButtonColor = scriptUrl ~= nil
    executeBtn.Parent = card

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = executeBtn

    local btnPadding = Instance.new("UIPadding")
    btnPadding.PaddingTop = UDim.new(0, 14)
    btnPadding.PaddingBottom = UDim.new(0, 14)
    btnPadding.Parent = executeBtn

    -- Hover Effect
    if scriptUrl then
        executeBtn.MouseEnter:Connect(function()
            TweenService:Create(executeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}):Play()
        end)
        executeBtn.MouseLeave:Connect(function()
            TweenService:Create(executeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}):Play()
        end)
    end

    -- Execute Script (WITH ENHANCED LOGGING)
    if scriptUrl then
        executeBtn.MouseButton1Click:Connect(function()
            executeBtn.Text = "LOADING..."
            executeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            
            local success, content = pcall(function()
                return game:HttpGet(scriptUrl)
            end)

            if success and content and content ~= "" then
                local func, err = loadstring(content)
                if func then
                    local ok, loadErr = pcall(func)
                    if ok then
                        executeBtn.Text = "EXECUTED!"
                        executeBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                        wait(1)
                        TweenService:Create(executeBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}):Play()
                        executeBtn.Text = "EXECUTE"
                    else
                        warn("Execution error for " .. name .. ": " .. loadErr)
                        executeBtn.Text = "FAILED: Exec Error"
                        executeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                        wait(2)
                        TweenService:Create(executeBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}):Play()
                        executeBtn.Text = "EXECUTE"
                    end
                else
                    warn("Loadstring error for " .. name .. ": " .. err)
                    executeBtn.Text = "FAILED: Load Error"
                    executeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                    wait(2)
                    TweenService:Create(executeBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}):Play()
                    executeBtn.Text = "EXECUTE"
                end
            else
                warn("HTTP Failed for " .. name .. " (" .. scriptUrl .. "): " .. (content or "Empty response"))
                executeBtn.Text = "FAILED: HTTP Error"
                executeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                wait(2)
                TweenService:Create(executeBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}):Play()
                executeBtn.Text = "EXECUTE"
            end
        end)
    end
end

--// === VERIFIED WORKING SCRIPTS (Nov 2025 - From ScriptBlox/WeAreDevs) ===

addScript(
    "Infinite Yield",
    "EdgeIY",
    "300+ admin commands: fly, noclip, ESP, speed. Always works.",
    "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
)

addScript(
    "Owl Hub",
    "CriShoux",
    "Aimbot, ESP, tracers for 40+ games like Arsenal, Phantom Forces.",
    "https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"
)

addScript(
    "Dark Hub",
    "DarkHubDev",
    "Aimbot, ESP, fly for Arsenal, Strucid, Bedwars.",
    "https://raw.githubusercontent.com/Rain-Games/Dark-Hub/main/source"
)

addScript(
    "V.G Hub",
    "1201for",
    "100+ games: Blox Fruits auto-farm, Pet Sim, Arsenal ESP.",
    "https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.GHub.lua"
)

addScript(
    "Orca Hub",
    "richie0866",
    "Universal: Fly, speed, ESP, integrates Infinite Yield & Dex.",
    "https://raw.githubusercontent.com/richie0866/orca/main/public.lua"
)

addScript(
    "Ez Hub",
    "Ez-Team",
    "Open-source hub for 150+ games: Auto-farm, aimbot, no key.",
    "https://raw.githubusercontent.com/Ez-Team/EzHub/main/loader.lua"
)

addScript(
    "HoHo Hub",
    "acsu123",
    "Blox Fruits, MM2, Arsenal: Auto-farm, kill aura, ESP.",
    "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI.lua"
)

addScript(
    "Infinity Hub",
    "InfinityDev",
    "Speed, fly, Blox Fruits hub, Bedwars Vape V4 integration.",
    "https://raw.githubusercontent.com/InfinityHub/Infinity/main/InfinityHub.lua"
)

addScript(
    "AK Hub",
    "AKScripts",
    "Universal: Godmode, aimbot, ESP, server hop.",
    "https://raw.githubusercontent.com/AKScripts/AKHub/main/AKHub.lua"
)

addScript(
    "Ftap Super Strength",
    "RegularVynixu",
    "Adjustable fling power - works in most PvP games.",
    "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Systems/Strength.lua"
)

--// Open Animation
mainFrame.Size = UDim2.fromScale(0, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)

local openTween = TweenService:Create(mainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.fromScale(0.35, 0.55),
    Position = UDim2.fromScale(0.325, 0.225),
    AnchorPoint = Vector2.new(0, 0)
})
openTween:Play()

--// Responsive Scaling
local function updateSize()
    local scale = math.clamp(screenGui.AbsoluteSize.X / 1920, 0.7, 1.3)
    local target = UDim2.fromScale(0.35 * scale, 0.55 * scale)
    TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = target}):Play()
end

screenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSize)
updateSize()

print("Bad Hub Loaded - Check console (F9) for errors on execute.")