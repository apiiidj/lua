loadstring([[
-- Global Pats Menu
_G.PatsMenu = _G.PatsMenu or {}

-- Create the main ScreenGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PatsMenu"
screenGui.Parent = playerGui

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 300)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true -- draggable

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "Pats Menu"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = mainFrame

-- Scrolling frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1,0,1,-30)
scrollFrame.Position = UDim2.new(0,0,0,30)
scrollFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.BackgroundTransparency = 1
scrollFrame.Parent = mainFrame

-- UIListLayout for buttons
local layout = Instance.new("UIListLayout")
layout.Parent = scrollFrame
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0,5)

-- Helper function to create toggle buttons
local function createToggle(name, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,-10,0,40)
    button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    button.TextColor3 = Color3.new(1,1,1)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Text = name .. " : OFF"
    button.Parent = scrollFrame

    local enabled = false
    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            button.Text = name .. " : ON"
            button.BackgroundColor3 = Color3.fromRGB(170,0,0)
        else
            button.Text = name .. " : OFF"
            button.BackgroundColor3 = Color3.fromRGB(0,170,0)
        end
        callback(enabled)
    end)

    -- Update CanvasSize
    local contentSize = layout.AbsoluteContentSize
    scrollFrame.CanvasSize = UDim2.new(0,0,0,contentSize.Y + 5)
end

-- Sit/Stand toggle
local sitting = false
createToggle("Sit/Stand", function(on)
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    sitting = not sitting
    if sitting then
        humanoid.Sit = true
    else
        humanoid.Sit = false
    end
end)

-- Infinite Yield toggle
createToggle("Infinite Yield", function(on)
    if on then
        pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
        end)
    end
end)

-- Infinite Jump toggle
createToggle("Infinite Jump", function(on)
    if on then
        pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
        end)
    end
end)

print("Pats Menu loaded! Dragable, scrollable, toggles ready.")
]])()
