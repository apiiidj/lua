loadstring([[
-- PHENIEOX MENU (FINAL)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Char, Hum, HRP
local function refreshChar()
	Char = Player.Character or Player.CharacterAdded:Wait()
	Hum = Char:WaitForChild("Humanoid")
	HRP = Char:WaitForChild("HumanoidRootPart")
end
refreshChar()
Player.CharacterAdded:Connect(refreshChar)

-- STATES
local speedOn, jumpMode, airJumpOn = false, 0, false
local floatOn, swimOn = false, false

local loaded = {}
local function once(name, func)
	if not loaded[name] then
		loaded[name] = true
		func()
	end
end

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "phenieox"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(260, 880)
frame.Position = UDim2.fromScale(0.05, 0.12)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "PHENIEOX"
title.TextColor3 = Color3.fromRGB(255,120,0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22

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

-- MOVEMENT
button("Speed Toggle (100)", 50, function()
	speedOn = not speedOn
	Hum.WalkSpeed = speedOn and 100 or 16
end)

button("Double Jump", 90, function() jumpMode = 2 airJumpOn = false end)
button("Triple Jump", 130, function() jumpMode = 3 airJumpOn = false end)
button("Infinite Jump", 170, function() jumpMode = math.huge airJumpOn = false end)

button("Air Jump Toggle", 210, function()
	airJumpOn = not airJumpOn
	jumpMode = 0
end)

local jumps = 0
UIS.JumpRequest:Connect(function()
	if airJumpOn then
		Hum:ChangeState(Enum.HumanoidStateType.Jumping)
	elseif jumpMode > 0 and jumps < jumpMode then
		jumps += 1
		Hum:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

Hum.StateChanged:Connect(function(_, s)
	if s == Enum.HumanoidStateType.Landed then jumps = 0 end
end)

button("Float Toggle", 250, function()
	floatOn = not floatOn
end)

RunService.RenderStepped:Connect(function()
	if floatOn then
		HRP.Velocity = Vector3.new(HRP.Velocity.X, 2, HRP.Velocity.Z)
	end
end)

button("Swim Toggle", 290, function()
	swimOn = not swimOn
	Hum:ChangeState(swimOn and Enum.HumanoidStateType.Swimming or Enum.HumanoidStateType.Running)
end)

-- EXTERNAL SCRIPTS
button("Fly", 330, function()
	once("fly", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
	end)
end)

button("Infinite Yield", 370, function()
	once("iy", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
	end)
end)

button("Ez Hub", 410, function()
	once("ez", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Ez%20Hub.lua"))()
	end)
end)

button("Owl Hub", 450, function()
	once("owl", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Owl%20Hub.lua"))()
	end)
end)

button("Noclip", 490, function()
	once("noclip", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Noclip.lua"))()
	end)
end)

button("Fling GUI V3", 530, function()
	once("fling", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/130275/scripts/Fling%20GUI%20V3.lua"))()
	end)
end)

button("Coolkid GUI v1", 570, function()
	once("coolkid", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/205803/scripts/Coolkid%20gui%20v1.lua"))()
	end)
end)

button("1x1x1x1 Revenge", 610, function()
	once("revenge", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/207807/scripts/1x1x1x1%20Revenge%20Script.lua"))()
	end)
end)

button("c00l clan GUI", 650, function()
	once("c00l", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/201243/scripts/c00l%20clan%20GUI.lua"))()
	end)
end)

button("Kill Aura", 690, function()
	once("killaura", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/210956/scripts/kill%20aura.lua"))()
	end)
end)

button("Arsenal Lithium", 730, function()
	once("arsenal", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/78535/scripts/Arsenal%20Script%20Lithium%20Best%20Keyless%20and%20Free.lua"))()
	end)
end)

button("AirHub Aimbot", 770, function()
	once("airhub", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/187632/scripts/AirHub%20-%20Aimbot%20Script.lua"))()
	end)
end)

button("MM2 Cheat BETA", 810, function()
	once("mm2", function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/187632/scripts/MM2%20Cheat%20BETA.lua"))()
	end)
end)

-- CTRL + CLICK TP
Mouse.Button1Down:Connect(function()
	if UIS:IsKeyDown(Enum.KeyCode.LeftControl) and Mouse.Hit then
		HRP.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0,3,0))
	end
end)

button("Close Menu (+ to reopen)", 850, function()
	frame.Visible = false
end)

UIS.InputBegan:Connect(function(i,gp)
	if gp then return end
	if i.KeyCode == Enum.KeyCode.Equals then
		frame.Visible = not frame.Visible
	end
end)

print("PHENIEOX LOADED | ALL SCRIPTS INTEGRATED")
]])()
