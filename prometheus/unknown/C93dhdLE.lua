-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Page1 = Instance.new("Folder")
local ClickTP = Instance.new("TextButton")
local Page2Button = Instance.new("TextButton")
local Rejoin = Instance.new("TextButton")
local Floatpad = Instance.new("TextButton")
local HatHub = Instance.new("TextButton")
local InfJump = Instance.new("TextButton")
local InfiniteYield = Instance.new("TextButton")
local Music = Instance.new("TextButton")
local NamelessAdmin = Instance.new("TextButton")
local PrizzLife = Instance.new("TextButton")
local Rejoin_2 = Instance.new("TextButton")
local Ring = Instance.new("TextButton")
local Snail = Instance.new("TextButton")
local SpamDecal = Instance.new("TextButton")
local Useless = Instance.new("TextButton")
local Useless_2 = Instance.new("TextButton")
local Useless_3 = Instance.new("TextButton")
local Useless_4 = Instance.new("TextButton")
local Useless_5 = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local Hide = Instance.new("TextButton")
local Page2 = Instance.new("Folder")
local Message = Instance.new("TextButton")
local TextLabel_4 = Instance.new("TextLabel")
local Hint = Instance.new("TextButton")
local CrashServerLifeInParadise = Instance.new("TextButton")
local KillAll = Instance.new("TextButton")
local TextLabel_5 = Instance.new("TextLabel")
local Page2Button_2 = Instance.new("TextButton")
local TextLabel_6 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.2463267, 0, 0.309927374, 0)
Frame.Size = UDim2.new(0, 594, 0, 368)
Frame.Active = true
Frame.Draggable = true

Page1.Name = "Page1"
Page1.Parent = Frame

ClickTP.Name = "ClickTP"
ClickTP.Parent = Page1
ClickTP.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClickTP.BorderColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.Position = UDim2.new(0.00229148986, 0, 0.722826064, 0)
ClickTP.Size = UDim2.new(0, 99, 0, 50)
ClickTP.Font = Enum.Font.SourceSans
ClickTP.Text = "Click TP"
ClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.TextSize = 14.000
ClickTP.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Click%20Teleport.lua"))()
end)

Page2Button.Name = "Page2Button"
Page2Button.Parent = Page1
Page2Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page2Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
Page2Button.Position = UDim2.new(0.931584418, 0, 0.907608688, 0)
Page2Button.Size = UDim2.new(0, 39, 0, 34)
Page2Button.Font = Enum.Font.SourceSans
Page2Button.Text = ">"
Page2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Page2Button.TextScaled = true
Page2Button.TextSize = 14.000
Page2Button.TextWrapped = true
Page2Button.MouseButton1Click:Connect(function()
	for _, child in pairs(Page1:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = false
		end
	end

	for _, child in pairs(Page2:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = true
		end
	end
end)


Rejoin.Name = "Rejoin"
Rejoin.Parent = Page1
Rejoin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rejoin.BorderColor3 = Color3.fromRGB(255, 255, 255)
Rejoin.Position = UDim2.new(0.337308317, 0, 0.722826064, 0)
Rejoin.Size = UDim2.new(0, 99, 0, 50)
Rejoin.Font = Enum.Font.SourceSans
Rejoin.Text = "Rejoin"
Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
Rejoin.TextSize = 14.000
Rejoin.MouseButton1Click:Connect(function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
	local ts = game:GetService("TeleportService")



	local p = game:GetService("Players").LocalPlayer







	ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
end)

Floatpad.Name = "Floatpad"
Floatpad.Parent = Page1
Floatpad.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Floatpad.BorderColor3 = Color3.fromRGB(255, 255, 255)
Floatpad.Position = UDim2.new(0.506734014, 0, 0.475652277, 0)
Floatpad.Size = UDim2.new(0, 99, 0, 50)
Floatpad.Font = Enum.Font.SourceSans
Floatpad.Text = "Float Pad"
Floatpad.TextColor3 = Color3.fromRGB(255, 255, 255)
Floatpad.TextSize = 14.000

HatHub.Name = "HatHub"
HatHub.Parent = Page1
HatHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HatHub.BorderColor3 = Color3.fromRGB(255, 255, 255)
HatHub.Position = UDim2.new(0, 0, 0.478260875, 0)
HatHub.Size = UDim2.new(0, 99, 0, 50)
HatHub.Font = Enum.Font.SourceSans
HatHub.Text = "Hat Hub"
HatHub.TextColor3 = Color3.fromRGB(255, 255, 255)
HatHub.TextSize = 14.000
HatHub.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
end)

InfJump.Name = "InfJump"
InfJump.Parent = Page1
InfJump.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfJump.BorderColor3 = Color3.fromRGB(255, 255, 255)
InfJump.Position = UDim2.new(0.165591151, 0, 0.722826064, 0)
InfJump.Size = UDim2.new(0, 99, 0, 50)
InfJump.Font = Enum.Font.SourceSans
InfJump.Text = "Infinite Jump"
InfJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJump.TextSize = 14.000
InfJump.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
end)

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = Page1
InfiniteYield.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.BorderColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.Position = UDim2.new(0, 0, 0.25, 0)
InfiniteYield.Size = UDim2.new(0, 99, 0, 50)
InfiniteYield.Font = Enum.Font.SourceSans
InfiniteYield.Text = "Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.TextSize = 14.000
InfiniteYield.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

Music.Name = "Music"
Music.Parent = Page1
Music.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Music.BorderColor3 = Color3.fromRGB(255, 255, 255)
Music.Position = UDim2.new(0.674616635, 0, 0.475652277, 0)
Music.Size = UDim2.new(0, 99, 0, 50)
Music.Font = Enum.Font.SourceSans
Music.Text = "Music"
Music.TextColor3 = Color3.fromRGB(255, 255, 255)
Music.TextSize = 14.000

NamelessAdmin.Name = "NamelessAdmin"
NamelessAdmin.Parent = Page1
NamelessAdmin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NamelessAdmin.BorderColor3 = Color3.fromRGB(255, 255, 255)
NamelessAdmin.Position = UDim2.new(0.168654174, 0, 0.25, 0)
NamelessAdmin.Size = UDim2.new(0, 99, 0, 50)
NamelessAdmin.Font = Enum.Font.SourceSans
NamelessAdmin.Text = "Nameless Admin"
NamelessAdmin.TextColor3 = Color3.fromRGB(255, 255, 255)
NamelessAdmin.TextSize = 14.000
NamelessAdmin.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

PrizzLife.Name = "Prizz Life"
PrizzLife.Parent = Page1
PrizzLife.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PrizzLife.BorderColor3 = Color3.fromRGB(255, 255, 255)
PrizzLife.Position = UDim2.new(0.337308347, 0, 0.25, 0)
PrizzLife.Size = UDim2.new(0, 99, 0, 50)
PrizzLife.Font = Enum.Font.SourceSans
PrizzLife.Text = "Prizz"
PrizzLife.TextColor3 = Color3.fromRGB(255, 255, 255)
PrizzLife.TextSize = 14.000
PrizzLife.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()
end)

Rejoin_2.Name = "Rejoin"
Rejoin_2.Parent = Page1
Rejoin_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rejoin_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Rejoin_2.Position = UDim2.new(0.507341981, 0, 0.722826064, 0)
Rejoin_2.Size = UDim2.new(0, 99, 0, 50)
Rejoin_2.Font = Enum.Font.SourceSans
Rejoin_2.Text = "Reset"
Rejoin_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Rejoin_2.TextSize = 14.000
Rejoin_2.MouseButton1Click:Connect(function()
	
end)

Ring.Name = "Ring"
Ring.Parent = Page1
Ring.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Ring.BorderColor3 = Color3.fromRGB(255, 255, 255)
Ring.Position = UDim2.new(0.338383824, 0, 0.475652277, 0)
Ring.Size = UDim2.new(0, 99, 0, 50)
Ring.Font = Enum.Font.SourceSans
Ring.Text = "Ring"
Ring.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring.TextSize = 14.000
Ring.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://rscripts.net/raw/super-ring-parts-v4-by-lukas_1741980981842_td0ummjymf.txt",true))()
end)

Snail.Name = "Snail"
Snail.Parent = Page1
Snail.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Snail.BorderColor3 = Color3.fromRGB(255, 255, 255)
Snail.Position = UDim2.new(0.170033664, 0, 0.475652277, 0)
Snail.Size = UDim2.new(0, 99, 0, 50)
Snail.Font = Enum.Font.SourceSans
Snail.Text = "Snail"
Snail.TextColor3 = Color3.fromRGB(255, 255, 255)
Snail.TextSize = 14.000
Snail.MouseButton1Click:Connect(function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]

--[[
	           ,."""""""""""""".,
	        .d"                  "b.
	      .d                        b.
	    ."         .. depso ..        ".
	   P        z$*"        "*e.        9.
	  A       d"                "b       A
	 J       J    .e*""""""%c     A       L
	A       A    d"          $     L      A
	#       %   d      d**y  'L    %      #
	#       %   $     $ ,, Y  .$   %      #       _ _ 
	#       %   $     *  """   F   %      #      (@)@)
	#       V    4.    $.   .e"    Y      #        % %
	#        $    *.    """"     .Y      V         $ $
	#        'b     "b.      ..e*       Y         .eeee
	V         '$      ""eeee""        eP         A     %
	 Y         eb                ..d*"         _#    O %
	 I    _e%*""""*$ee......ee$*"eeeeeeeezee$**"       $
	  V ,"                                            B
	  J'                                        _,e=""
	.'#######################################DWB''

	Made by Depso - not mine lmao
	The SNAIL Script V2
	
	To update the config, run the script again.
]]

	_G.Snail_Config = {
		Speed = 0.4,
		TunnelSpeed = 2,

		--// Offsets
		Offset = CFrame.new(0,-1,0),
		TunnelOffset = CFrame.new(0,-2,0), -- This is added to the Offset

		--// Control
		Teleport = Enum.KeyCode.E,
		Tunnel = Enum.KeyCode.Q,
		ResetCamera = Enum.KeyCode.R,

		TunnelIsToggle = false,
		DistanceChangesSpeed = true,
		UseCameraRotaton = false, -- Old movement

		Distance = 5,

		--// Animations
		RotationEffect = false,
		Enabled = true, -- If disabled, the script will not run after death
		DirtParticles = true,
		Sounds = true,

		--// Trail Style
		Color = ColorSequence.new{ -- Time Position, Value
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 171, 3)), 
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(132, 255, 0))
		},
		Transparency = NumberSequence.new{ 
			NumberSequenceKeypoint.new(0.00, 0.40), 
			NumberSequenceKeypoint.new(1.00, 1.00)
		},
		Length = 0.3, -- 0: Disabled

		--// Dirt style
		DirtColor = ColorSequence.new{ -- Time Position, Value
			ColorSequenceKeypoint.new(0, Color3.fromRGB(193, 135, 0)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(158, 84, 0))
		},
		DirtSize = NumberSequence.new{ 
			NumberSequenceKeypoint.new(0, 0.2), 
			NumberSequenceKeypoint.new(1, 0.25)
		},

		--// Sounds
		Audios = {
			Teleport = {
				SoundId = 507863457
			},
			Tunnel = {
				SoundId = 9114127078,
				Looped = true,
				PlaybackSpeed = 1.2
			},
		},

		--// Misc (Advanced)
		Max_Height = 15,
		Root_Height = 4,
	}

	------------------------------

	if _G.Snail_Ran then return end
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MastersMZ-Scripts/Scripts/master/Snail%20Script/Snail%20Script%20V2.lua'))()

end)

SpamDecal.Name = "SpamDecal"
SpamDecal.Parent = Page1
SpamDecal.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpamDecal.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpamDecal.Position = UDim2.new(0.841283321, 0, 0.475652277, 0)
SpamDecal.Size = UDim2.new(0, 94, 0, 50)
SpamDecal.Font = Enum.Font.SourceSans
SpamDecal.Text = "Spam Decal"
SpamDecal.TextColor3 = Color3.fromRGB(255, 255, 255)
SpamDecal.TextSize = 14.000
SpamDecal.MouseButton1Click:Connect(function()
	local decalId = "rbxassetid://141747285"

	local faces = {
		Enum.NormalId.Front,
		Enum.NormalId.Back,
		Enum.NormalId.Left,
		Enum.NormalId.Right,
		Enum.NormalId.Top,
		Enum.NormalId.Bottom,
	}

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") then
			for _, face in ipairs(faces) do
				local decal = Instance.new("Decal")
				decal.Texture = decalId
				decal.Face = face
				decal.Parent = obj
			end
		end
	end
end)

Useless.Name = "Useless"
Useless.Parent = Page1
Useless.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless.Position = UDim2.new(0.505962551, 0, 0.247391418, 0)
Useless.Size = UDim2.new(0, 99, 0, 50)
Useless.Font = Enum.Font.SourceSans
Useless.Text = "Empty"
Useless.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless.TextSize = 14.000

Useless_2.Name = "Useless"
Useless_2.Parent = Page1
Useless_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_2.Position = UDim2.new(0.674616694, 0, 0.247391418, 0)
Useless_2.Size = UDim2.new(0, 99, 0, 50)
Useless_2.Font = Enum.Font.SourceSans
Useless_2.Text = "Empty"
Useless_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_2.TextSize = 14.000

Useless_3.Name = "Useless"
Useless_3.Parent = Page1
Useless_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_3.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_3.Position = UDim2.new(0.841283321, 0, 0.247391418, 0)
Useless_3.Size = UDim2.new(0, 94, 0, 50)
Useless_3.Font = Enum.Font.SourceSans
Useless_3.Text = "Empty"
Useless_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_3.TextSize = 14.000

Useless_4.Name = "Useless"
Useless_4.Parent = Page1
Useless_4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_4.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_4.Position = UDim2.new(0.674312711, 0, 0.720217526, 0)
Useless_4.Size = UDim2.new(0, 99, 0, 50)
Useless_4.Font = Enum.Font.SourceSans
Useless_4.Text = "Empty"
Useless_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_4.TextSize = 14.000

Useless_5.Name = "Useless"
Useless_5.Parent = Page1
Useless_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_5.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_5.Position = UDim2.new(0.840979397, 0, 0.720217526, 0)
Useless_5.Size = UDim2.new(0, 93, 0, 50)
Useless_5.Font = Enum.Font.SourceSans
Useless_5.Text = "Empty"
Useless_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_5.TextSize = 14.000

TextLabel.Parent = Page1
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.328790426, 0, 0.630434811, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 34)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Other"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Page1
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.325423419, 0, 0.385869563, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 34)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Troll"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Page1
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.328790456, 0, 0.135869563, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 34)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Admin Commands"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

Hide.Name = "Hide"
Hide.Parent = Frame
Hide.BackgroundColor3 = Color3.fromRGB(77, 0, 1)
Hide.BorderColor3 = Color3.fromRGB(255, 255, 255)
Hide.Position = UDim2.new(0.906331897, 0, 0, 0)
Hide.Size = UDim2.new(0, 55, 0, 50)
Hide.ZIndex = 2
Hide.Font = Enum.Font.SourceSans
Hide.Text = "-"
Hide.TextColor3 = Color3.fromRGB(255, 255, 255)
Hide.TextSize = 14.000
Hide.MouseButton1Click:Connect(function()
	Frame.Visible = false
	game.StarterGui:SetCore("SendNotification", {
		Title = "Notification",
		Text = "Press H to show",
		Duration = 5
	})
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
		Frame.Visible = true
	end
end)


Page2.Name = "Page2"
Page2.Parent = Frame

Message.Name = "Message"
Message.Parent = Page2
Message.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderColor3 = Color3.fromRGB(255, 255, 255)
Message.Position = UDim2.new(-0.00107551343, 0, 0.228260875, 0)
Message.Size = UDim2.new(0, 99, 0, 50)
Message.Visible = false
Message.Font = Enum.Font.SourceSans
Message.Text = "Message"
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextSize = 14.000
Message.MouseButton1Click:Connect(function()
	local messageinstance = game.Instance == Instance.new("Message")
	messageinstance.Text = "SDVHVETCTT IS BACK"
end)

TextLabel_4.Parent = Page2
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.328790456, 0, 0.135869563, 0)
TextLabel_4.Size = UDim2.new(0, 200, 0, 34)
TextLabel_4.Visible = false
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "More"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

Hint.Name = "Hint"
Hint.Parent = Page2
Hint.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Hint.BorderColor3 = Color3.fromRGB(255, 255, 255)
Hint.Position = UDim2.new(0.165591151, 0, 0.228260875, 0)
Hint.Size = UDim2.new(0, 99, 0, 50)
Hint.Visible = false
Hint.Font = Enum.Font.SourceSans
Hint.Text = "Hint"
Hint.TextColor3 = Color3.fromRGB(255, 255, 255)
Hint.TextSize = 14.000
Hint.MouseButton1Click:Connect(function()
	local hintinstance = game.Instance == Instance.new("Hint")
	hintinstance.Text = "SDVHVETCTT IS BACK"
end)

CrashServerLifeInParadise.Name = "Crash Server (Life In Paradise)"
CrashServerLifeInParadise.Parent = Page2
CrashServerLifeInParadise.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CrashServerLifeInParadise.BorderColor3 = Color3.fromRGB(255, 255, 255)
CrashServerLifeInParadise.Position = UDim2.new(0.327207327, 0, 0.228260875, 0)
CrashServerLifeInParadise.Size = UDim2.new(0, 99, 0, 50)
CrashServerLifeInParadise.Visible = false
CrashServerLifeInParadise.Font = Enum.Font.SourceSans
CrashServerLifeInParadise.Text = "Crash Server (life in paradise)"
CrashServerLifeInParadise.TextColor3 = Color3.fromRGB(255, 255, 255)
CrashServerLifeInParadise.TextScaled = true
CrashServerLifeInParadise.TextSize = 14.000
CrashServerLifeInParadise.TextWrapped = true
CrashServerLifeInParadise.MouseButton1Click:Connect(function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
	-- join my discord
	game:GetService'RunService'.RenderStepped:Connect(function()
		task.spawn(function() -- prevent blocking frame render
			for i=0,1000,1 do


				local args = {
					[1] = {
						[1] = "Wear",
						[2] = "11297746",
						[3] = "Hats"
					}
				}

				game:GetService("ReplicatedStorage").WearItem:FireServer(unpack(args))
			end
		end)
	end)
end)

KillAll.Name = "Kill All"
KillAll.Parent = Page2
KillAll.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
KillAll.BorderColor3 = Color3.fromRGB(255, 255, 255)
KillAll.Position = UDim2.new(0.49724099, 0, 0.228260875, 0)
KillAll.Size = UDim2.new(0, 99, 0, 50)
KillAll.Visible = false
KillAll.Font = Enum.Font.SourceSans
KillAll.Text = "Kill All (only if game has weapons)"
KillAll.TextColor3 = Color3.fromRGB(255, 255, 255)
KillAll.TextScaled = true
KillAll.TextSize = 14.000
KillAll.TextWrapped = true
KillAll.MouseButton1Click:Connect(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Not finished yet!",
		Text = "This feature isn't finished yet.",
		Duration = 5
	})
end)

TextLabel_5.Parent = Page2
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.184009284, 0, 0.663043499, 0)
TextLabel_5.Size = UDim2.new(0, 361, 0, 46)
TextLabel_5.Visible = false
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "This is all in my hack panel. More features will be added. You may suggest features in the comments :)"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

Page2Button_2.Name = "Page2Button"
Page2Button_2.Parent = Page2
Page2Button_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page2Button_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Page2Button_2.Position = UDim2.new(-0.00107551343, 0, 0.907608688, 0)
Page2Button_2.Size = UDim2.new(0, 39, 0, 34)
Page2Button_2.Visible = false
Page2Button_2.Font = Enum.Font.SourceSans
Page2Button_2.Text = "<"
Page2Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Page2Button_2.TextScaled = true
Page2Button_2.TextSize = 14.000
Page2Button_2.TextWrapped = true
Page2Button_2.MouseButton1Click:Connect(function()
	for _, child in pairs(Page1:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = true
		end
	end

	for _, child in pairs(Page2:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = false
		end
	end
end)

TextLabel_6.Parent = Frame
TextLabel_6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.Position = UDim2.new(-5.13763929e-08, 0, 0, 0)
TextLabel_6.Size = UDim2.new(0, 594, 0, 50)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = "sdvhvetctt5 hack panel"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true
TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left