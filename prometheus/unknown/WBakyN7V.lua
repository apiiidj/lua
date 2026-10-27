
-- Gui to Lua

-- Version: 3.2

local rc7 = Instance.new("ScreenGui")
local mini = Instance.new("ImageButton")
local passpage = Instance.new("ImageLabel")
local submit = Instance.new("TextButton")
local user = Instance.new("TextBox")
local pass = Instance.new("TextBox")
local close = Instance.new("TextButton")
local minimize = Instance.new("TextButton")
local mainpage = Instance.new("ImageLabel")
local input = Instance.new("TextBox")
local output = Instance.new("TextBox")
local exe = Instance.new("TextButton")
local clear = Instance.new("TextButton")
local open = Instance.new("TextButton")
local roxploit = Instance.new("TextButton")
local dex = Instance.new("TextButton")
local close_2 = Instance.new("TextButton")
local minimize_2 = Instance.new("TextButton")

--Properties:

rc7.Name = "rc7"
rc7.Parent = game.CoreGui
rc7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

mini.Name = "mini"
mini.Parent = rc7
mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mini.BackgroundTransparency = 1.000
mini.BorderColor3 = Color3.fromRGB(0, 0, 0)
mini.BorderSizePixel = 0
mini.Position = UDim2.new(0, 0, 0.894399107, 0)
mini.Size = UDim2.new(0, 58, 0, 60)
mini.Visible = false
mini.Image = "http://www.roblox.com/asset/?id=14416021390"
mini.MouseButton1Down:connect(function()
	mainpage.Visible = true
mini.Visible = false
end)

passpage.Name = "passpage"
passpage.Parent = rc7
passpage.Active = true
passpage.BackgroundTransparency = 1
passpage.Position = UDim2.new(0.171028033, 0, 0.178529739, 0)
passpage.Size = UDim2.new(0, 349, 0, 363)
passpage.Image = "rbxassetid://125202567174656"

submit.Name = "submit"
submit.Parent = passpage
submit.BackgroundTransparency = 1
submit.Position = UDim2.new(0.35, 0, 0.6, 0)
submit.Size = UDim2.new(0, 100, 0, 30)
submit.Font = Enum.Font.SourceSans
submit.Text = ""
submit.TextTransparency = 1
submit.MouseButton1Down:connect(function()
    if pass.Text == "" then
        passpage.Visible = false
        mainpage.Visible = true
    else
        pass.Text = ""
        wait(2)
        pass.Text = ""
    end
end)

user.Name = "user"
user.Parent = passpage
user.BackgroundTransparency = 1
user.Position = UDim2.new(0.23, 0, 0.39, 0)
user.Size = UDim2.new(0, 160, 0, 21)
user.Font = Enum.Font.SourceSans
user.Text = ""
user.TextTransparency = 1
user.Active = false
user.Selectable = false

pass.Name = "pass"
pass.Parent = passpage
pass.BackgroundTransparency = 1
pass.Position = UDim2.new(0.23, 0, 0.48, 0)
pass.Size = UDim2.new(0, 160, 0, 21)
pass.Font = Enum.Font.SourceSans
pass.Text = ""
pass.TextTransparency = 1
pass.Active = false
pass.Selectable = false

close.Name = "close"
close.Parent = passpage
close.BackgroundTransparency = 1
close.Position = UDim2.new(0.88, 0, 0, 0)
close.Size = UDim2.new(0, 41, 0, 24)
close.Font = Enum.Font.SourceSans
close.Text = ""
close.TextTransparency = 1
close.MouseButton1Down:connect(function()
    passpage.Visible = false
end)

minimize.Name = "minimize"
minimize.Parent = passpage
minimize.BackgroundTransparency = 1
minimize.Position = UDim2.new(0.85, 0, 0, 0)
minimize.Size = UDim2.new(0, 20, 0, 24)
minimize.Font = Enum.Font.SourceSans
minimize.Text = "-"
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.TextSize = 20
minimize.MouseButton1Down:connect(function()
    minimize.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

minimize.MouseButton1Up:connect(function()
    minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

minimize.Name = "minimize"
minimize.Parent = passpage
minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimize.BackgroundTransparency = 1.000
minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
minimize.BorderSizePixel = 0
minimize.Position = UDim2.new(0.598853886, 0, 0, 0)
minimize.Size = UDim2.new(0, 41, 0, 24)
minimize.Font = Enum.Font.SourceSans
minimize.Text = ""
minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
minimize.TextSize = 14.000

mainpage.Name = "mainpage"
mainpage.Parent = rc7
mainpage.Active = true
mainpage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainpage.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainpage.BorderSizePixel = 0
mainpage.Position = UDim2.new(0.171028033, 0, 0.178529739, 0)
mainpage.Size = UDim2.new(0, 349, 0, 363)
mainpage.Visible = false
mainpage.Image = "http://www.roblox.com/asset/?id=99644004482586"

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "scrollingFrame"
scrollingFrame.Parent = mainpage
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Position = UDim2.new(0.0343839526, 0, 0.0991735533, 0)
scrollingFrame.Size = UDim2.new(0, 296, 0, 239)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 239)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.ScrollBarImageTransparency = 1
scrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

local input = Instance.new("TextBox")
input.Name = "input"
input.Parent = scrollingFrame
input.BackgroundTransparency = 1
input.BorderColor3 = Color3.fromRGB(0, 0, 0)
input.BorderSizePixel = 0
input.Size = UDim2.new(1, 0, 0, 239)
input.Font = Enum.Font.Code
input.MultiLine = true
input.Text = ""
input.TextColor3 = Color3.fromRGB(0, 0, 0)
input.TextSize = 14
input.TextWrapped = false
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.ClearTextOnFocus = false
input.ClipsDescendants = false

input.Position = UDim2.new(0, 0, 0, 10)

local function updateCanvasSize()
    local textSize = input.TextBounds
    input.Size = UDim2.new(1, 0, 0, math.max(textSize.Y + 10, 239))
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, input.Size.Y.Offset)
end

input:GetPropertyChangedSignal("Text"):Connect(updateCanvasSize)
input.Focused:Connect(updateCanvasSize)
input.FocusLost:Connect(updateCanvasSize)

exe.Name = "exe"
exe.Parent = mainpage
exe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exe.BackgroundTransparency = 1
exe.BorderColor3 = Color3.fromRGB(0, 0, 0)
exe.BorderSizePixel = 0
exe.Position = UDim2.new(0.315186232, 0, 0.774104655, 0)
exe.Size = UDim2.new(0, 99, 0, 20)
exe.Font = Enum.Font.ArialBold
exe.Text = "Execute"
exe.TextColor3 = Color3.fromRGB(50, 110, 160)
exe.TextSize = 14.000
exe.TextTransparency = 1

output.Name = "output"
output.Parent = mainpage
output.Active = false
output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
output.BorderColor3 = Color3.fromRGB(0, 0, 0)
output.BackgroundTransparency = 1
output.BorderSizePixel = 0
output.Position = UDim2.new(0.0343839526, 0, 0.845730007, 0)
output.Size = UDim2.new(0, 296, 0, 52)
output.Font = Enum.Font.Code
output.Text = ""
output.TextColor3 = Color3.fromRGB(0, 0, 0)
output.TextSize = 14.000
output.TextWrapped = true
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top

exe.MouseButton1Down:connect(function()
    output.Text = ""
    
    local success, result = pcall(function()
        loadstring(input.Text)()
    end)

    if success then
        output.Text = "Script successfully executed!"
        output.TextColor3 = Color3.fromRGB(0, 0, 0)
        wait(2)
        output.Text = " "
    else
        output.Text = "Error: " .. result
        output.TextColor3 = Color3.fromRGB(255, 0, 0)
        warn("Error occurred during execution: " .. result)
        wait(5)
        output.Text = " "
    end
end)

clear.Name = "clear"
clear.Parent = mainpage
clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
clear.BackgroundTransparency = 1
clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
clear.BorderSizePixel = 0
clear.Position = UDim2.new(0.598853886, 0, 0.774104655, 0)
clear.Size = UDim2.new(0, 99, 0, 20)
clear.Font = Enum.Font.ArialBold
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(50, 110, 160)
clear.TextSize = 14.000
clear.TextTransparency = 1  -- Make the text transparent
clear.MouseButton1Down:connect(function()
    input.Text = " "
end)

open.Name = "open"
open.Parent = mainpage
open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
open.BackgroundTransparency = 1
open.BorderColor3 = Color3.fromRGB(0, 0, 0)
open.BorderSizePixel = 0
open.Position = UDim2.new(0.0343839526, 0, 0.774104655, 0)
open.Size = UDim2.new(0, 99, 0, 20)
open.Font = Enum.Font.ArialBold
open.Text = "Open"
open.TextColor3 = Color3.fromRGB(50, 110, 160)
open.TextSize = 14.000
open.TextTransparency = 1
open.MouseButton1Down:connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
end)

roxploit.Name = "roxploit"
roxploit.Parent = mainpage
roxploit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
roxploit.BackgroundTransparency = 1.000
roxploit.BorderColor3 = Color3.fromRGB(0, 0, 0)
roxploit.BorderSizePixel = 0
roxploit.Position = UDim2.new(0.904999971, 0, 0.799000025, 0)
roxploit.Size = UDim2.new(0, 29, 0, 29)
roxploit.Font = Enum.Font.SourceSans
roxploit.Text = ""
roxploit.TextColor3 = Color3.fromRGB(0, 0, 0)
roxploit.TextSize = 14.000
roxploit.MouseButton1Down:connect(function()
loadstring(game:GetObjects("rbxassetid://364364477")[1].Source)()
end)

dex.Name = "dex"
dex.Parent = mainpage
dex.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dex.BackgroundTransparency = 1.000
dex.BorderColor3 = Color3.fromRGB(0, 0, 0)
dex.BorderSizePixel = 0
dex.Position = UDim2.new(0.904999971, 0, 0.910000026, 0)
dex.Size = UDim2.new(0, 29, 0, 29)
dex.Font = Enum.Font.SourceSans
dex.Text = ""
dex.TextColor3 = Color3.fromRGB(0, 0, 0)
dex.TextSize = 14.000
dex.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)

close_2.Name = "close"
close_2.Parent = mainpage
close_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close_2.BackgroundTransparency = 1.000
close_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
close_2.BorderSizePixel = 0
close_2.Position = UDim2.new(0.88252151, 0, 0, 0)
close_2.Size = UDim2.new(0, 41, 0, 24)
close_2.Font = Enum.Font.SourceSans
close_2.Text = ""
close_2.TextColor3 = Color3.fromRGB(0, 0, 0)
close_2.TextSize = 14.000
close_2.MouseButton1Down:connect(function()
	mainpage.Visible = false
end)

minimize_2.Name = "minimize"
minimize_2.Parent = mainpage
minimize_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimize_2.BackgroundTransparency = 1.000
minimize_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
minimize_2.BorderSizePixel = 0
minimize_2.Position = UDim2.new(0.598853886, 0, 0, 0)
minimize_2.Size = UDim2.new(0, 41, 0, 24)
minimize_2.Font = Enum.Font.SourceSans
minimize_2.Text = ""
minimize_2.TextColor3 = Color3.fromRGB(0, 0, 0)
minimize_2.TextSize = 14.000
minimize_2.MouseButton1Down:connect(function()
	mainpage.Visible = false
	mini.Visible = true
end)

-- Scripts:

local function HXRD_fake_script() -- passpage.Dragify 
	local script = Instance.new('LocalScript', passpage)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
dragToggle = nil
	    local dragSpeed = 6
	    dragInput = nil
	    dragStart = nil
	    local dragPos = nil
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(HXRD_fake_script)()
local function EERUFD_fake_script() -- mainpage.Dragify 
	local script = Instance.new('LocalScript', mainpage)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(EERUFD_fake_script)()
