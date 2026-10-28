loadstring([[
-- CHATGPT AHH V2
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "CHATGPT_AHH_V2"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(300, 380)
frame.Position = UDim2.fromScale(0.1, 0.25)
frame.BackgroundColor3 = Color3.fromRGB(15,0,0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "CHATGPT AHH V2"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,0,0)
title.BackgroundTransparency = 1

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0,0,0,40)
scroll.Size = UDim2.new(1,0,1,-40)
scroll.CanvasSize = UDim2.new(0,0,0,800)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,6)

-- BUTTON MAKER
local function btn(text, func)
	local b = Instance.new("TextButton", scroll)
	b.Size = UDim2.new(1,-20,0,32)
	b.Position = UDim2.new(0,10,0,0)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(40,0,0)
	b.TextColor3 = Color3.new(1,1,1)
	b.MouseButton1Click:Connect(func)
end

------------------------------------------------
-- SCRIPTS
------------------------------------------------

btn("Infinite Yield (Admin)", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
end)

btn("Owl Hub", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Owl%20Hub.lua"))()
end)

btn("Noclip", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Noclip.lua"))()
end)

btn("Fly GUI", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
end)

------------------------------------------------
-- AUTO FARM (GAME SPECIFIC)
------------------------------------------------

btn("Auto Farm (Game Specific)", function()
	warn("Paste your game-specific auto farm here")
end)

btn("Auto Farm Slot 2", function()
	warn("Add another auto farm script here")
end)

------------------------------------------------
-- AIMBOTS (GAME SPECIFIC)
------------------------------------------------

btn("Aimbot (Game Specific)", function()
	warn("Paste your aimbot for this game here")
end)

btn("Arsenal Aimbot Example", function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/78535/scripts/Arsenal%20Script%20Lithium%20Best%20Keyless%20and%20Free.lua"))()
end)

------------------------------------------------
-- MENU CONTROLS
------------------------------------------------

btn("Close Menu (+ to reopen)", function()
	frame.Visible = false
end)

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.Equals then
		frame.Visible = not frame.Visible
	end
end)

print("CHATGPT AHH V2 LOADED")
]])()
