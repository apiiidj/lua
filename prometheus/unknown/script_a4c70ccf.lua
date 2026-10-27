-- Gui to Lua
-- Version: 3.2

-- Instances:

local Scaryelevatorscript = Instance.new("ScreenGui")
local background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local tptopremiumroom = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local tptoredroom = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local tptoviproom = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local tptomegaviproom = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local Infniteyield = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")

--Properties:

Scaryelevatorscript.Name = "Scary elevator script"
Scaryelevatorscript.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Scaryelevatorscript.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

background.Name = "background"
background.Parent = Scaryelevatorscript
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Position = UDim2.new(0.354415268, 0, 0.278225809, 0)
background.Size = UDim2.new(0, 320, 0, 220)

UICorner.Parent = background

tptopremiumroom.Name = "tp to premium room"
tptopremiumroom.Parent = background
tptopremiumroom.BackgroundColor3 = Color3.fromRGB(118, 0, 0)
tptopremiumroom.BorderColor3 = Color3.fromRGB(0, 0, 0)
tptopremiumroom.BorderSizePixel = 0
tptopremiumroom.Position = UDim2.new(0.111728385, 0, 0.163636357, 0)
tptopremiumroom.Size = UDim2.new(0, 49, 0, 49)
tptopremiumroom.Font = Enum.Font.Creepster
tptopremiumroom.Text = "tp to premium room"
tptopremiumroom.TextColor3 = Color3.fromRGB(255, 255, 255)
tptopremiumroom.TextScaled = true
tptopremiumroom.TextSize = 14.000
tptopremiumroom.TextWrapped = true
tptopremiumroom.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(326.654053, 32.3724174, -262.752045, -0.00872956496, 3.2709913e-08, -0.999961913, 3.81968025e-12, 1, 3.2711128e-08, 0.999961913, 2.81734358e-10, -0.00872956496)
end)

UICorner_2.Parent = tptopremiumroom

tptoredroom.Name = "tp to red room"
tptoredroom.Parent = background
tptoredroom.BackgroundColor3 = Color3.fromRGB(118, 0, 0)
tptoredroom.BorderColor3 = Color3.fromRGB(0, 0, 0)
tptoredroom.BorderSizePixel = 0
tptoredroom.Position = UDim2.new(0.314750493, 0, 0.163636357, 0)
tptoredroom.Size = UDim2.new(0, 49, 0, 49)
tptoredroom.Font = Enum.Font.Creepster
tptoredroom.Text = "tp to red room"
tptoredroom.TextColor3 = Color3.fromRGB(255, 255, 255)
tptoredroom.TextScaled = true
tptoredroom.TextSize = 14.000
tptoredroom.TextWrapped = true
tptoredroom.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(229.025375, 31.1435127, -221.405075, -0.0261850674, 1.00157171e-08, -0.999657094, -4.92150818e-08, 1, 1.13082947e-08, 0.999657094, 4.94943144e-08, -0.0261850674) 
end)

UICorner_3.Parent = tptoredroom

tptoviproom.Name = "tp to vip room"
tptoviproom.Parent = background
tptoviproom.BackgroundColor3 = Color3.fromRGB(118, 0, 0)
tptoviproom.BorderColor3 = Color3.fromRGB(0, 0, 0)
tptoviproom.BorderSizePixel = 0
tptoviproom.Position = UDim2.new(0.524125457, 0, 0.163636357, 0)
tptoviproom.Size = UDim2.new(0, 49, 0, 49)
tptoviproom.Font = Enum.Font.Creepster
tptoviproom.Text = "tp to vip room"
tptoviproom.TextColor3 = Color3.fromRGB(255, 255, 255)
tptoviproom.TextScaled = true
tptoviproom.TextSize = 14.000
tptoviproom.TextWrapped = true
tptoviproom.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(323.366882, 32.3724174, -157.219971, -0.00873796549, 5.98282668e-09, -0.999961853, 2.36819258e-08, 1, 5.77611514e-09, 0.999961853, -2.363055e-08, -0.00873796549)
end)

UICorner_4.Parent = tptoviproom

tptomegaviproom.Name = "tp to mega vip room"
tptomegaviproom.Parent = background
tptomegaviproom.BackgroundColor3 = Color3.fromRGB(118, 0, 0)
tptomegaviproom.BorderColor3 = Color3.fromRGB(0, 0, 0)
tptomegaviproom.BorderSizePixel = 0
tptomegaviproom.Position = UDim2.new(0.730375469, 0, 0.163636357, 0)
tptomegaviproom.Size = UDim2.new(0, 49, 0, 49)
tptomegaviproom.Font = Enum.Font.Creepster
tptomegaviproom.Text = "tp to mega vip room"
tptomegaviproom.TextColor3 = Color3.fromRGB(255, 255, 255)
tptomegaviproom.TextScaled = true
tptomegaviproom.TextSize = 14.000
tptomegaviproom.TextWrapped = true
tptomegaviproom.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(322.430389, 32.3724174, -212.643082, -0.0349109322, -1.34943683e-08, -0.999390423, -4.53482141e-09, 1, -1.3344188e-08, 0.999390423, 4.06619938e-09, -0.0349109322)
end)

UICorner_5.Parent = tptomegaviproom

Title.Name = "Title"
Title.Parent = background
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 320, 0, 24)
Title.Font = Enum.Font.Creepster
Title.Text = "SCARY ELEVATOR FREE VIP ROOM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UICorner_6.Parent = Title

Infniteyield.Name = "Infnite yield"
Infniteyield.Parent = background
Infniteyield.BackgroundColor3 = Color3.fromRGB(118, 0, 0)
Infniteyield.BorderColor3 = Color3.fromRGB(0, 0, 0)
Infniteyield.BorderSizePixel = 0
Infniteyield.Position = UDim2.new(0.1875, 0, 0.49545455, 0)
Infniteyield.Size = UDim2.new(0, 200, 0, 86)
Infniteyield.Font = Enum.Font.Creepster
Infniteyield.Text = "INFNITE YIELD"
Infniteyield.TextColor3 = Color3.fromRGB(255, 255, 255)
Infniteyield.TextScaled = true
Infniteyield.TextSize = 14.000
Infniteyield.TextWrapped = true
Infniteyield.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
end)

UICorner_7.Parent = Infniteyield

-- Scripts:

local function QCHXQ_fake_script() -- tptopremiumroom.Script 
	local script = Instance.new('Script', tptopremiumroom)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(326.654053, 32.3724174, -262.752045, -0.00872956496, 3.2709913e-08, -0.999961913, 3.81968025e-12, 1, 3.2711128e-08, 0.999961913, 2.81734358e-10, -0.00872956496)
end
coroutine.wrap(QCHXQ_fake_script)()
local function LVYABRO_fake_script() -- tptoredroom.Script 
	local script = Instance.new('Script', tptoredroom)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(229.025375, 31.1435127, -221.405075, -0.0261850674, 1.00157171e-08, -0.999657094, -4.92150818e-08, 1, 1.13082947e-08, 0.999657094, 4.94943144e-08, -0.0261850674)
end
coroutine.wrap(LVYABRO_fake_script)()
local function QVZB_fake_script() -- tptoviproom.Script 
	local script = Instance.new('Script', tptoviproom)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(323.366882, 32.3724174, -157.219971, -0.00873796549, 5.98282668e-09, -0.999961853, 2.36819258e-08, 1, 5.77611514e-09, 0.999961853, -2.363055e-08, -0.00873796549)
end
coroutine.wrap(QVZB_fake_script)()
local function QSKGI_fake_script() -- tptomegaviproom.Script 
	local script = Instance.new('Script', tptomegaviproom)

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(322.430389, 32.3724174, -212.643082, -0.0349109322, -1.34943683e-08, -0.999390423, -4.53482141e-09, 1, -1.3344188e-08, 0.999390423, 4.06619938e-09, -0.0349109322)
end
coroutine.wrap(QSKGI_fake_script)()
