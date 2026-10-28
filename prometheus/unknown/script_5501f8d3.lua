-- GUI to Lua 
-- Version: 0.0.3

-- Instances:

local JjSploitExecutor = Instance.new("ScreenGui")
local JJSploit_1 = Instance.new("ImageButton")
local UICorner_1 = Instance.new("UICorner")
local UIStroke_1 = Instance.new("UIStroke")
local Frame_1 = Instance.new("Frame")
local Exe_1 = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")
local UIStroke_2 = Instance.new("UIStroke")
local Home_1 = Instance.new("ImageButton")
local UICorner_3 = Instance.new("UICorner")
local UIStroke_3 = Instance.new("UIStroke")
local Exit_1 = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local UIStroke_4 = Instance.new("UIStroke")
local HomeFrame_1 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_1 = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local ImageLabel_1 = Instance.new("ImageLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
local ExecutorFrame_1 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local TextBox_1 = Instance.new("TextBox")
local UICorner_7 = Instance.new("UICorner")
local TextButton_1 = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local UIStroke_5 = Instance.new("UIStroke")
local TextButton_2 = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local UIStroke_6 = Instance.new("UIStroke")

-- Properties:
JjSploitExecutor.Name = "JjSploitExecutor"
JjSploitExecutor.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
JjSploitExecutor.ResetOnSpawn = false

JJSploit_1.Name = "JJSploit"
JJSploit_1.Parent = JjSploitExecutor
JJSploit_1.Active = true
JJSploit_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
JJSploit_1.BorderColor3 = Color3.fromRGB(0,0,0)
JJSploit_1.BorderSizePixel = 0
JJSploit_1.Position = UDim2.new(0.439415693, 0,0.0643254519, 0)
JJSploit_1.Size = UDim2.new(0, 100,0, 100)
JJSploit_1.Image = "rbxassetid://133529270285722"
JJSploit_1.ImageColor3 = Color3.fromRGB(235,235,235)
JJSploit_1.ScaleType = Enum.ScaleType.Crop

UICorner_1.Parent = JJSploit_1

UIStroke_1.Parent = JJSploit_1
UIStroke_1.Thickness = 5

Frame_1.Parent = JjSploitExecutor
Frame_1.BackgroundColor3 = Color3.fromRGB(17,36,66)
Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_1.BorderSizePixel = 0
Frame_1.Position = UDim2.new(0.927921414, 0,0, 0)
Frame_1.Size = UDim2.new(0.0718390793, 0,1, 0)
Frame_1.Visible = false

Exe_1.Name = "Exe"
Exe_1.Parent = Frame_1
Exe_1.Active = true
Exe_1.BackgroundColor3 = Color3.fromRGB(36,56,100)
Exe_1.BorderColor3 = Color3.fromRGB(0,0,0)
Exe_1.BorderSizePixel = 0
Exe_1.Position = UDim2.new(0.108333334, 0,0.238178015, 0)
Exe_1.Size = UDim2.new(0, 47,0, 43)
Exe_1.Image = "rbxassetid://14418797585"

UICorner_2.Parent = Exe_1

UIStroke_2.Parent = Exe_1
UIStroke_2.Thickness = 5

Home_1.Name = "Home"
Home_1.Parent = Frame_1
Home_1.Active = true
Home_1.BackgroundColor3 = Color3.fromRGB(36,56,100)
Home_1.BorderColor3 = Color3.fromRGB(0,0,0)
Home_1.BorderSizePixel = 0
Home_1.Position = UDim2.new(0.100000001, 0,0.097357437, 0)
Home_1.Size = UDim2.new(0, 48,0, 50)
Home_1.Image = "rbxassetid://4034483344"

UICorner_3.Parent = Home_1

UIStroke_3.Parent = Home_1
UIStroke_3.Thickness = 5

Exit_1.Name = "Exit"
Exit_1.Parent = Frame_1
Exit_1.Active = true
Exit_1.BackgroundColor3 = Color3.fromRGB(36,56,100)
Exit_1.BorderColor3 = Color3.fromRGB(0,0,0)
Exit_1.BorderSizePixel = 0
Exit_1.Position = UDim2.new(0.108333334, 0,0.88490957, 0)
Exit_1.Size = UDim2.new(0, 47,0, 43)
Exit_1.Image = "rbxassetid://6264845452"

UICorner_4.Parent = Exit_1

UIStroke_4.Parent = Exit_1
UIStroke_4.Thickness = 5

HomeFrame_1.Name = "HomeFrame"
HomeFrame_1.Parent = JjSploitExecutor
HomeFrame_1.BackgroundColor3 = Color3.fromRGB(17,36,66)
HomeFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
HomeFrame_1.BorderSizePixel = 0
HomeFrame_1.Position = UDim2.new(0.0167624522, 0,0.0173852574, 0)
HomeFrame_1.Size = UDim2.new(0.875239432, 0,0.933588326, 0)
HomeFrame_1.Visible = false

UICorner_5.Parent = HomeFrame_1

TextLabel_1.Parent = HomeFrame_1
TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_1.BackgroundTransparency = 1
TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_1.BorderSizePixel = 0
TextLabel_1.Position = UDim2.new(0.253077984, 0,0.236499071, 0)
TextLabel_1.Size = UDim2.new(0, 360,0, 50)
TextLabel_1.Font = Enum.Font.Unknown
TextLabel_1.Text = "I'm the best progammer On Earth"
TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_1.TextScaled = true
TextLabel_1.TextSize = 14
TextLabel_1.TextStrokeTransparency = 0
TextLabel_1.TextWrapped = true

TextLabel_2.Parent = HomeFrame_1
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.253077984, 0,0.0968342647, 0)
TextLabel_2.Size = UDim2.new(0, 360,0, 50)
TextLabel_2.Font = Enum.Font.Unknown
TextLabel_2.Text = "FarwdW Dev's. "
TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextStrokeTransparency = 0
TextLabel_2.TextWrapped = true

ImageLabel_1.Parent = HomeFrame_1
ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_1.BorderSizePixel = 0
ImageLabel_1.Position = UDim2.new(0.0150478799, 0,0.0502793305, 0)
ImageLabel_1.Size = UDim2.new(0, 161,0, 157)
ImageLabel_1.Image = "rbxassetid://13922962620"

TextLabel_3.Parent = HomeFrame_1
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.253077984, 0,0.63314712, 0)
TextLabel_3.Size = UDim2.new(0, 360,0, 50)
TextLabel_3.Font = Enum.Font.Unknown
TextLabel_3.Text = "Created of JJSploit. "
TextLabel_3.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextStrokeTransparency = 0
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = HomeFrame_1
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.253077984, 0,0.493482322, 0)
TextLabel_4.Size = UDim2.new(0, 360,0, 50)
TextLabel_4.Font = Enum.Font.Unknown
TextLabel_4.Text = "WeAreDevs"
TextLabel_4.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14
TextLabel_4.TextStrokeTransparency = 0
TextLabel_4.TextWrapped = true

ImageLabel_2.Parent = HomeFrame_1
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.0150478799, 0,0.446927369, 0)
ImageLabel_2.Size = UDim2.new(0, 161,0, 157)
ImageLabel_2.Image = "rbxassetid://79159724721875"

ExecutorFrame_1.Name = "ExecutorFrame"
ExecutorFrame_1.Parent = JjSploitExecutor
ExecutorFrame_1.BackgroundColor3 = Color3.fromRGB(17,36,66)
ExecutorFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
ExecutorFrame_1.BorderSizePixel = 0
ExecutorFrame_1.Position = UDim2.new(0.0167624522, 0,0.0173852574, 0)
ExecutorFrame_1.Size = UDim2.new(0.875239432, 0,0.933588326, 0)
ExecutorFrame_1.Visible = false

UICorner_6.Parent = ExecutorFrame_1

TextBox_1.Parent = ExecutorFrame_1
TextBox_1.Active = true
TextBox_1.BackgroundColor3 = Color3.fromRGB(12,26,36)
TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
TextBox_1.BorderSizePixel = 0
TextBox_1.CursorPosition = -1
TextBox_1.MultiLine = true
TextBox_1.Position = UDim2.new(0.0232558139, 0,0.0502793305, 0)
TextBox_1.Size = UDim2.new(0.945280433, 0,0.754189968, 0)
TextBox_1.Font = Enum.Font.SourceSans
TextBox_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
TextBox_1.PlaceholderText = ""
TextBox_1.Text = "You Can Copy And Paste Into Executor JJSploit's"
TextBox_1.TextColor3 = Color3.fromRGB(255,255,255)
TextBox_1.TextSize = 20
TextBox_1.TextXAlignment = Enum.TextXAlignment.Left
TextBox_1.TextYAlignment = Enum.TextYAlignment.Top

UICorner_7.Parent = TextBox_1

TextButton_1.Parent = ExecutorFrame_1
TextButton_1.Active = true
TextButton_1.BackgroundColor3 = Color3.fromRGB(36,56,100)
TextButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
TextButton_1.BorderSizePixel = 0
TextButton_1.Position = UDim2.new(0.101231188, 0,0.839851022, 0)
TextButton_1.Size = UDim2.new(0.273597807, 0,0.0931098685, 0)
TextButton_1.Font = Enum.Font.SourceSans
TextButton_1.Text = "Executor"
TextButton_1.TextColor3 = Color3.fromRGB(255,255,255)
TextButton_1.TextScaled = true
TextButton_1.TextSize = 14
TextButton_1.TextWrapped = true

UICorner_8.Parent = TextButton_1

UIStroke_5.Parent = TextButton_1
UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_5.Thickness = 5

TextButton_2.Parent = ExecutorFrame_1
TextButton_2.Active = true
TextButton_2.BackgroundColor3 = Color3.fromRGB(36,56,100)
TextButton_2.BorderColor3 = Color3.fromRGB(0,0,0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.555403531, 0,0.839851022, 0)
TextButton_2.Size = UDim2.new(0.273597807, 0,0.0931098685, 0)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "Clear"
TextButton_2.TextColor3 = Color3.fromRGB(255,255,255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14
TextButton_2.TextWrapped = true

UICorner_9.Parent = TextButton_2

UIStroke_6.Parent = TextButton_2
UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_6.Thickness = 5

local function tfeaHMdWBfcPIfoM()
local script = Instance.new("LocalScript",JJSploit_1)
local holding = false

script.Parent.MouseButton1Down:Connect(function()
	if not holding then
		holding = true
		task.wait()
	end
end)

script.Parent.MouseButton1Up:Connect(function()
	if holding then
		holding = false
		script.Parent.Parent.Frame.Visible = true
		script.Parent.Parent.Frame.Position = UDim2.new(3, 0,0, 0)
		script.Parent.Parent.Frame:TweenPosition(UDim2.new(0.928, 0,0, 0), "InOut", "Quad", 0.3)
		script.Parent.Visible = false
	end
end)
end
coroutine.wrap(tfeaHMdWBfcPIfoM)()


local function jYmjXZXZqnBqRrgl()
local script = Instance.new("LocalScript",JJSploit_1)
script.Parent.Draggable = true
script.Parent.Active = true
end
coroutine.wrap(jYmjXZXZqnBqRrgl)()


local function AceNuxzVokITpgsi()
local script = Instance.new("LocalScript",Exe_1)
local TweenService = game:GetService("TweenService")

local frameexecutor = script.Parent.Parent.Parent:WaitForChild("ExecutorFrame")
local open = false

-- Tween settings
local tweenInfo = TweenInfo.new(
	0.2, -- duration
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

-- Function to fade all GUI objects inside the frame
local function FadeAll(guiObject, transparency)
	for _, descendant in ipairs(guiObject:GetDescendants()) do
		if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
			TweenService:Create(descendant, tweenInfo, {
				TextTransparency = transparency,
				TextStrokeTransparency = transparency
			}):Play()
		elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
			TweenService:Create(descendant, tweenInfo, {
				ImageTransparency = transparency
			}):Play()
		elseif descendant:IsA("Frame") then
			TweenService:Create(descendant, tweenInfo, {
				BackgroundTransparency = transparency
			}):Play()
		end
	end
	-- Also apply to the main frame
	TweenService:Create(guiObject, tweenInfo, {
		BackgroundTransparency = transparency
	}):Play()
end

script.Parent.MouseButton1Down:Connect(function()
	if not open then
		frameexecutor.Visible = true
		FadeAll(frameexecutor, 0) -- fade in

		frameexecutor:TweenPosition(
			UDim2.new(0.017, 0, 0.017, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.2,
			true
		)

		open = true
	else
		FadeAll(frameexecutor, 1) -- fade out

		frameexecutor:TweenPosition(
			UDim2.new(0.053, 0, 0.023, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.2,
			true
		)

		task.wait(0.2)
		frameexecutor.Visible = false
		open = false
	end
end)

end
coroutine.wrap(AceNuxzVokITpgsi)()


local function elQZbUpeWpLnasXY()
local script = Instance.new("LocalScript",Home_1)
local TweenService = game:GetService("TweenService")

local frameexecutor = script.Parent.Parent.Parent:WaitForChild("HomeFrame")
local open = false

-- Tween settings
local tweenInfo = TweenInfo.new(
	0.2, -- duration
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

-- Function to fade all GUI objects inside the frame
local function FadeAll(guiObject, transparency)
	for _, descendant in ipairs(guiObject:GetDescendants()) do
		if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
			TweenService:Create(descendant, tweenInfo, {
				TextTransparency = transparency,
				TextStrokeTransparency = transparency
			}):Play()
		elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
			TweenService:Create(descendant, tweenInfo, {
				ImageTransparency = transparency
			}):Play()
		elseif descendant:IsA("Frame") then
			TweenService:Create(descendant, tweenInfo, {
				BackgroundTransparency = transparency
			}):Play()
		end
	end
	-- Also apply to the main frame
	TweenService:Create(guiObject, tweenInfo, {
		BackgroundTransparency = transparency
	}):Play()
end

script.Parent.MouseButton1Down:Connect(function()
	if not open then
		frameexecutor.Visible = true
		FadeAll(frameexecutor, 0) -- fade in

		frameexecutor:TweenPosition(
			UDim2.new(0.017, 0, 0.017, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.2,
			true
		)

		open = true
	else
		FadeAll(frameexecutor, 1) -- fade out

		frameexecutor:TweenPosition(
			UDim2.new(0.053, 0, 0.023, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.2,
			true
		)

		task.wait(0.2)
		frameexecutor.Visible = false
		open = false
	end
end)

end
coroutine.wrap(elQZbUpeWpLnasXY)()


local function QUTLMVtvunpzioLn()
local script = Instance.new("LocalScript",Exit_1)
local button = script.Parent.Parent.Parent.JJSploit
local frame = script.Parent.Parent

script.Parent.MouseButton1Down:Connect(function()
	frame:TweenPosition(UDim2.new(3, 0,0, 0), "InOut", "Quad", 0.3)
	button.Visible = true
	wait(0.3)
	frame.Visible = false
end)
end
coroutine.wrap(QUTLMVtvunpzioLn)()


local function hGasCAGnMMHkuWoj()
local script = Instance.new("LocalScript",TextButton_1)
local textbox = script.Parent.Parent.TextBox

script.Parent.MouseButton1Down:Connect(function()
	local func = textbox.Text
	if func then
		loadstring(func)
	else
		warn("This Error While Wrong Typing Script or Deleted Https Script. Please Try Again")
	end
end)
end
coroutine.wrap(hGasCAGnMMHkuWoj)()


local function YYDDkbZwiXoNWkGU()
local script = Instance.new("LocalScript",TextButton_2)
local textbox = script.Parent.Parent.TextBox

script.Parent.MouseButton1Down:Connect(function()
textbox.Text = ""
end)
end
coroutine.wrap(YYDDkbZwiXoNWkGU)()
