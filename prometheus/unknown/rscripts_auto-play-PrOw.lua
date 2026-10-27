-- SERVICES
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI SETUP
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ScriptHub"
ScreenGui.ResetOnSpawn = false

-- TOGGLE BUTTON
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 120, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.Text = "☰ Script Hub"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 16
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local toggleCorner = Instance.new("UICorner", ToggleButton)
toggleCorner.CornerRadius = UDim.new(0, 8)

-- MAIN PANEL
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local mainCorner = Instance.new("UICorner", MainFrame)
mainCorner.CornerRadius = UDim.new(0, 12)

-- TITLE
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🔥 Mobile Script Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- SCROLLABLE BUTTON HOLDER SETUP
local ScrollFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollFrame.Size = UDim2.new(1, -20, 1, -50)
ScrollFrame.Position = UDim2.new(0, 10, 0, 45)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

local Layout = Instance.new("UIListLayout", ScrollFrame)
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
end)

-- FUNCTION TO CREATE BUTTONS
local function createScriptButton(name, color, callback)
    local btn = Instance.new("TextButton", ScrollFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)

    btn.MouseButton1Click:Connect(function()
        local success, err = pcall(callback)
        if not success then
            btn.Text = "❌ Failed"
            btn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
            warn("Script failed to run:", err)
        else
            btn.Text = "✅ Success"
            btn.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
        end
        wait(2)
        btn.Text = name
        btn.BackgroundColor3 = color
    end)
end

-- WORKING SCRIPT BUTTONS
createScriptButton("🌌 Infinite Yield", Color3.fromRGB(85, 85, 255), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createScriptButton("🔍 Dex Explorer", Color3.fromRGB(120, 90, 255), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

createScriptButton("🚀 Fly Script", Color3.fromRGB(50, 200, 150), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

createScriptButton("🧱 BTools (FE)", Color3.fromRGB(255, 200, 50), function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

createScriptButton("🔥 HoHo Hub - Blox Fruits", Color3.fromRGB(255, 100, 0), function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
end)

createScriptButton("🌴 VG Hub", Color3.fromRGB(0, 220, 180), function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
end)

createScriptButton("🔫 Arsenal Silent Aim", Color3.fromRGB(180, 80, 255), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Malrand/Malrand/main/Arsenal"))()
end)

createScriptButton("🚪 Doors Auto Win", Color3.fromRGB(90, 160, 255), function()
    loadstring(game:HttpGet('https://pastebin.com/raw/GY5dvcJq'))()
end)

createScriptButton("📀 Hitbox Expander", Color3.fromRGB(200, 100, 255), function()
    loadstring(game:HttpGet("http://gameovers.net/Scripts/Free/HitboxExpander/main.lua"))()
end)

createScriptButton("👣 Walk on Walls", Color3.fromRGB(100, 255, 255), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/5T7KsEWy"))()
end)

-- ♟️ CHESS CLUB AUTO PLAY SCRIPT
createScriptButton("♟️ Auto Play Chess", Color3.fromRGB(255, 255, 100), function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local lplr = Players.LocalPlayer

    local sundown
    local success, err = pcall(function()
        sundown = require(lplr:WaitForChild("PlayerScripts"):WaitForChild("AI"):WaitForChild("Sunfish"))
    end)

    if not success then
        warn("Failed to load chess AI:", err)
        return
    end

    local screenGui = Instance.new("ScreenGui", lplr:WaitForChild("PlayerGui"))
    screenGui.Name = "AutoPlayUI"

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 50)
    button.Position = UDim2.new(0.5, -75, 1, -60)
    button.Text = "Auto Play"
    button.BackgroundColor3 = Color3.fromRGB(30, 150, 250)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        local activetableset = ReplicatedStorage:WaitForChild("InternalClientEvents"):WaitForChild("GetActiveTableset"):Invoke()
        local fen = activetableset and activetableset.FEN and activetableset.FEN.Value
        if fen then
            local bestMove = tostring(sundown:GetBestMove(fen, 1750))
            ReplicatedStorage:WaitForChild("Chess"):WaitForChild("SubmitMove"):InvokeServer(bestMove)
        else
            warn("FEN not available or table not active.")
        end
    end)
end)

-- TOGGLE FUNCTION
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)