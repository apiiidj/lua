-- Gui to Lua
-- Version: 3.2

-- Instances:

local BoiExecutor = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CodeBox = Instance.new("TextBox")
local Clear = Instance.new("TextButton")
local Execute = Instance.new("TextButton")
local ScriptHub = Instance.new("TextButton")
local ScrollingScriptHub = Instance.new("ScrollingFrame")
local Button1 = Instance.new("TextButton")
local Button2 = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local Closed = Instance.new("TextButton")

--Properties:

BoiExecutor.Name = "Boi Executor"
BoiExecutor.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
BoiExecutor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BoiExecutor.ResetOnSpawn = false

Frame.Parent = BoiExecutor
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BackgroundTransparency = 0.050
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.198252693, 0, 0.217013896, 0)
Frame.Size = UDim2.new(0, 537, 0, 325)

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Title.BackgroundTransparency = 0.050
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 537, 0, 51)
Title.Font = Enum.Font.SourceSans
Title.Text = "FarwdW Executor"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

CodeBox.Name = "CodeBox"
CodeBox.Parent = Frame
CodeBox.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
CodeBox.BackgroundTransparency = 0.100
CodeBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
CodeBox.BorderSizePixel = 0
CodeBox.Position = UDim2.new(0.0316573568, 0, 0.190769225, 0)
CodeBox.Size = UDim2.new(0, 391, 0, 181)
CodeBox.ClearTextOnFocus = false
CodeBox.Font = Enum.Font.SourceSans
CodeBox.MultiLine = true
CodeBox.Text = ""
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.TextSize = 25.000
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top

Clear.Name = "Clear"
Clear.Parent = Frame
Clear.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Clear.BackgroundTransparency = 0.100
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.398510247, 0, 0.796923101, 0)
Clear.Size = UDim2.new(0, 175, 0, 39)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clean"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextScaled = true
Clear.TextSize = 14.000
Clear.TextWrapped = true

Execute.Name = "Execute"
Execute.Parent = Frame
Execute.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Execute.BackgroundTransparency = 0.100
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.0316573568, 0, 0.796923101, 0)
Execute.Size = UDim2.new(0, 175, 0, 39)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextScaled = true
Execute.TextSize = 14.000
Execute.TextWrapped = true

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = Frame
ScriptHub.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
ScriptHub.BackgroundTransparency = 0.100
ScriptHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptHub.BorderSizePixel = 0
ScriptHub.Position = UDim2.new(0.759776533, 0, 0.796923101, 0)
ScriptHub.Size = UDim2.new(0, 119, 0, 39)
ScriptHub.Font = Enum.Font.SourceSans
ScriptHub.Text = "Scripthub"
ScriptHub.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptHub.TextScaled = true
ScriptHub.TextSize = 14.000
ScriptHub.TextWrapped = true

ScrollingScriptHub.Name = "Scrolling ScriptHub"
ScrollingScriptHub.Parent = Frame
ScrollingScriptHub.Active = true
ScrollingScriptHub.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
ScrollingScriptHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingScriptHub.BorderSizePixel = 0
ScrollingScriptHub.Position = UDim2.new(0.776536286, 0, 0.190769225, 0)
ScrollingScriptHub.Size = UDim2.new(0, 110, 0, 181)
ScrollingScriptHub.Visible = false

Button1.Name = "Button1"
Button1.Parent = ScrollingScriptHub
Button1.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Button1.BackgroundTransparency = 0.100
Button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button1.BorderSizePixel = 0
Button1.Size = UDim2.new(0, 90, 0, 39)
Button1.Font = Enum.Font.SourceSans
Button1.Text = "Infinite Yield"
Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
Button1.TextScaled = true
Button1.TextSize = 14.000
Button1.TextWrapped = true

Button2.Name = "Button2"
Button2.Parent = ScrollingScriptHub
Button2.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Button2.BackgroundTransparency = 0.100
Button2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button2.BorderSizePixel = 0
Button2.Position = UDim2.new(0, 0, 0.0718232021, 0)
Button2.Size = UDim2.new(0, 90, 0, 39)
Button2.Font = Enum.Font.SourceSans
Button2.Text = "Hello, World"
Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
Button2.TextScaled = true
Button2.TextSize = 14.000
Button2.TextWrapped = true

UICorner.Parent = ScrollingScriptHub

UICorner_2.Parent = Frame

Closed.Name = "Closed"
Closed.Parent = Frame
Closed.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Closed.BorderColor3 = Color3.fromRGB(0, 0, 0)
Closed.BorderSizePixel = 0
Closed.Position = UDim2.new(0.899441361, 0, 0, 0)
Closed.Size = UDim2.new(0, 54, 0, 50)
Closed.Font = Enum.Font.SourceSans
Closed.Text = "X"
Closed.TextColor3 = Color3.fromRGB(0, 0, 0)
Closed.TextScaled = true
Closed.TextSize = 14.000
Closed.TextStrokeColor3 = Color3.fromRGB(81, 0, 0)
Closed.TextWrapped = true

-- Scripts:

local function UQUQX_fake_script() -- Button1.LocalScript 
	local script = Instance.new('LocalScript', Button1)

	
	script.Parent.MouseButton1Down:Connect(function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
	end)
end
coroutine.wrap(UQUQX_fake_script)()
local function DYLJ_fake_script() -- Button2.LocalScript 
	local script = Instance.new('LocalScript', Button2)

	
	script.Parent.MouseButton1Down:Connect(function()
		print("Hello, World")
	end)
end
coroutine.wrap(DYLJ_fake_script)()
local function LEGZ_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local execute = script.Parent.Execute
	local clean = script.Parent.Clear
	local scripthubbutton = script.Parent.ScriptHub
	-- [THIS IS NOT CHATGPT SCRIPT ITS HUMAN SCRIPT THESE TYPING SCRIPT
	
	-- I WAS DOING MAKING SCRIPT IN VC STREAM] --
	
	local framescripthub = script.Parent["Scrolling ScriptHub"]
	local codebox = script.Parent.CodeBox
	local close = script.Parent.Closed
	local isopen = false
	execute.MouseButton1Down:Connect(function()
		
		local func = loadstring(codebox)
		
		if func then
			func()
		else
			warn("Error Leak")
		end
	end)
	
	scripthubbutton.MouseButton1Down:Connect(function()
		if not isopen then
			isopen = true
			framescripthub.Visible = true
			framescripthub.Size = UDim2.new(0, 110,0, 0)
			framescripthub:TweenSize(UDim2.new(0, 110,0, 181), "InOut", "Quad", 0.5)
		else
			framescripthub:TweenSize(UDim2.new(0, 110,0, 0), "InOut", "Quad", 0.5)
			wait(0.6)
			framescripthub.Visible = false
			isopen = false
		end
	end)
	
	clean.MouseButton1Down:Connect(function()
		codebox.Text = ""
	end)
	
	script.Parent.Draggable = true
	script.Parent.Active = true
	
	close.MouseButton1Down:Connect(function()
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(LEGZ_fake_script)()