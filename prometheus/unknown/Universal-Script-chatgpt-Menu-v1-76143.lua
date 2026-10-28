loadstring([[
-- ULTIMATE CHATGPT MENU (SCROLLABLE)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ULTIMATE_CHATGPT_MENU"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(320, 420)
frame.Position = UDim2.fromScale(0.1, 0.2)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,140,0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "ULTIMATE CHATGPT MENU"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255,140,0)
title.BackgroundTransparency = 1

-- SCROLLING FRAME
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0,0,0,40)
scroll.Size = UDim2.new(1,0,1,-40)
scroll.CanvasSize = UDim2.new(0,0,0,1200)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,6)

-- BUTTON CREATOR
local function button(text, callback)
	local b = Instance.new("TextButton", scroll)
	b.Size = UDim2.new(1,-20,0,32)
	b.Position = UDim2.new(0,10,0,0)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(35,20,0)
	b.TextColor3 = Color3.new(1,1,1)
	b.MouseButton1Click:Connect(callback)
end

------------------------------------------------
-- SCRIPT BUTTONS
------------------------------------------------

button("Infinite Yield", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
end)

button("Owl Hub", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Owl%20Hub.lua"))()
end)

button("Fly GUI", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
end)

button("Noclip", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Noclip.lua"))()
end)

button("Fling GUI", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/130275/scripts/Fling%20GUI%20V3.lua"))()
end)

button("Coolkid GUI", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/205803/scripts/Coolkid%20gui%20v1.lua"))()
end)

button("1x1x1x1 Revenge", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/207807/scripts/1x1x1x1%20Revenge%20Script.lua"))()
end)

button("Kill Aura", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/210956/scripts/kill%20aura.lua"))()
end)

button("Arsenal Aimbot", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/78535/scripts/Arsenal%20Script%20Lithium%20Best%20Keyless%20and%20Free.lua"))()
end)

button("MM2 Cheat", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/187632/scripts/MM2%20Cheat%20BETA.lua"))()
end)

------------------------------------------------
-- MENU CONTROLS
------------------------------------------------

button("Close Menu (+ to reopen)", function()
	frame.Visible = false
end)

button("KILL MENU (PERMANENT)", function()
	gui:Destroy()
end)

-- + KEY TO TOGGLE
UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.Equals then
		frame.Visible = not frame.Visible
	end
end)

print("ULTIMATE CHATGPT MENU LOADED")
]])()
