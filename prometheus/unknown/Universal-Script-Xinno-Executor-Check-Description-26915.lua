-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local unfe = Instance.new("TextButton")
local clear = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")
local scripthub = Instance.new("Frame")
local InfiniteYield = Instance.new("TextButton")
local Noclip = Instance.new("TextButton")
local tophat = Instance.new("TextButton")
local Fly = Instance.new("TextButton")
local Fling = Instance.new("TextButton")
local InfiniteJump = Instance.new("TextButton")
local ESP = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0376569033, 0, 0.0451203175, 0)
Frame.Size = UDim2.new(0, 395, 0, 178)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(21, 0, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, -0.0858895704, 0)
TextLabel.Size = UDim2.new(0, 395, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Xinno Executor"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.ClipsDescendants = true
TextBox.Position = UDim2.new(0, 0, 0.195009291, 0)
TextBox.Size = UDim2.new(0, 395, 0, 131)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.PlaceholderText = "-- Put The Script Here"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 20.000
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

unfe.Name = "unfe"
unfe.Parent = Frame
unfe.BackgroundColor3 = Color3.fromRGB(17, 0, 255)
unfe.BorderColor3 = Color3.fromRGB(0, 0, 0)
unfe.Position = UDim2.new(0, 0, 0.765320182, 0)
unfe.Size = UDim2.new(0, 197, 0, 41)
unfe.Font = Enum.Font.SourceSans
unfe.Text = "Execute"
unfe.TextColor3 = Color3.fromRGB(0, 0, 0)
unfe.TextScaled = true
unfe.TextSize = 14.000
unfe.TextWrapped = true

clear.Name = "clear"
clear.Parent = Frame
clear.BackgroundColor3 = Color3.fromRGB(17, 0, 255)
clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
clear.Position = UDim2.new(0.498734176, 0, 0.765320182, 0)
clear.Size = UDim2.new(0, 199, 0, 41)
clear.Font = Enum.Font.SourceSans
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(0, 0, 0)
clear.TextScaled = true
clear.TextSize = 14.000
clear.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(172, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.64810127, 0, -0.0858895779, 0)
TextButton.Size = UDim2.new(0, 139, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Script Hub"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

scripthub.Name = "scripthub"
scripthub.Parent = Frame
scripthub.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
scripthub.BorderColor3 = Color3.fromRGB(0, 0, 0)
scripthub.BorderSizePixel = 0
scripthub.Position = UDim2.new(0, 0, -0.0898876414, 0)
scripthub.Size = UDim2.new(0, 396, 0, 193)
scripthub.Visible = false

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = scripthub
InfiniteYield.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
InfiniteYield.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.BorderSizePixel = 0
InfiniteYield.Position = UDim2.new(0.0303030312, 0, 0.367875636, 0)
InfiniteYield.Size = UDim2.new(0, 108, 0, 50)
InfiniteYield.Font = Enum.Font.SourceSans
InfiniteYield.Text = "Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.TextScaled = true
InfiniteYield.TextSize = 14.000
InfiniteYield.TextWrapped = true

Noclip.Name = "Noclip"
Noclip.Parent = scripthub
Noclip.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
Noclip.BorderColor3 = Color3.fromRGB(0, 0, 0)
Noclip.BorderSizePixel = 0
Noclip.Position = UDim2.new(0.356060594, 0, 0.367875636, 0)
Noclip.Size = UDim2.new(0, 108, 0, 50)
Noclip.Font = Enum.Font.SourceSans
Noclip.Text = "Noclip"
Noclip.TextColor3 = Color3.fromRGB(0, 0, 0)
Noclip.TextScaled = true
Noclip.TextSize = 14.000
Noclip.TextWrapped = true

tophat.Name = "tophat"
tophat.Parent = scripthub
tophat.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
tophat.BorderColor3 = Color3.fromRGB(0, 0, 0)
tophat.BorderSizePixel = 0
tophat.Position = UDim2.new(0.0303030312, 0, 0.0518134721, 0)
tophat.Size = UDim2.new(0, 366, 0, 50)
tophat.Font = Enum.Font.SourceSans
tophat.Text = "Close"
tophat.TextColor3 = Color3.fromRGB(0, 0, 0)
tophat.TextScaled = true
tophat.TextSize = 14.000
tophat.TextWrapped = true

Fly.Name = "Fly"
Fly.Parent = scripthub
Fly.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
Fly.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.681818187, 0, 0.367875636, 0)
Fly.Size = UDim2.new(0, 108, 0, 50)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "Fly"
Fly.TextColor3 = Color3.fromRGB(0, 0, 0)
Fly.TextScaled = true
Fly.TextSize = 14.000
Fly.TextWrapped = true

Fling.Name = "Fling"
Fling.Parent = scripthub
Fling.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
Fling.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fling.BorderSizePixel = 0
Fling.Position = UDim2.new(0.0303030312, 0, 0.678756475, 0)
Fling.Size = UDim2.new(0, 108, 0, 50)
Fling.Font = Enum.Font.SourceSans
Fling.Text = "Fling"
Fling.TextColor3 = Color3.fromRGB(0, 0, 0)
Fling.TextScaled = true
Fling.TextSize = 14.000
Fling.TextWrapped = true

InfiniteJump.Name = "InfiniteJump"
InfiniteJump.Parent = scripthub
InfiniteJump.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
InfiniteJump.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfiniteJump.BorderSizePixel = 0
InfiniteJump.Position = UDim2.new(0.356060594, 0, 0.678756475, 0)
InfiniteJump.Size = UDim2.new(0, 108, 0, 50)
InfiniteJump.Font = Enum.Font.SourceSans
InfiniteJump.Text = "Infinite Jump"
InfiniteJump.TextColor3 = Color3.fromRGB(0, 0, 0)
InfiniteJump.TextScaled = true
InfiniteJump.TextSize = 14.000
InfiniteJump.TextWrapped = true

ESP.Name = "ESP"
ESP.Parent = scripthub
ESP.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
ESP.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESP.BorderSizePixel = 0
ESP.Position = UDim2.new(0.681818187, 0, 0.678756475, 0)
ESP.Size = UDim2.new(0, 108, 0, 50)
ESP.Font = Enum.Font.SourceSans
ESP.Text = "ESP"
ESP.TextColor3 = Color3.fromRGB(0, 0, 0)
ESP.TextScaled = true
ESP.TextSize = 14.000
ESP.TextWrapped = true

local function executeScript()
	local script = TextBox.Text
	if script ~= "" then
		loadstring(script)()
	else
		print("No script entered")
	end
end

unfe.MouseButton1Click:Connect(executeScript)

clear.MouseButton1Click:Connect(function()
	TextBox.Text = ""
end)

TextButton.MouseButton1Click:Connect(function()
	if scripthub.Position ~= Frame.Position then
		scripthub.Visible = not scripthub.Visible
	end
end)

tophat.MouseButton1Down:Connect(function()
	scripthub.Visible = false
end)

InfiniteYield.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

Noclip.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MaksBloxX/NoClipScript/main/NoClip%20Roblox", true))()
end)

Fly.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

Fling.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0',true))()
end)

InfiniteJump.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
end)

ESP.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/WRD%20ESP.txt"))()
end)

Frame.Draggable = true
Frame.Active = true