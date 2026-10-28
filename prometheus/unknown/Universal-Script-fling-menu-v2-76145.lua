loadstring([[
-- FLING MENU
local UIS = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FLING_MENU"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(300, 150)
frame.Position = UDim2.fromScale(0.05, 0.25)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20) -- Black theme
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "FLING MENU"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24

local function button(text, y, callback)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(callback)
end

-- LOAD FLING SCRIPT
button("Load Fling GUI", 50, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/130275/scripts/Fling%20GUI%20V3.lua"))()
end)

-- CLOSE MENU
button("Close Menu (+ to reopen)", 90, function()
    frame.Visible = false
end)

-- TOGGLE MENU WITH '+'
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Equals then
        frame.Visible = not frame.Visible
    end
end)

print("FLING MENU LOADED")
]])()
