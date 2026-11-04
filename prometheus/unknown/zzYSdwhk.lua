local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Ocerium_Project/main/Library.lua"))()

Window = Library.Main("ScriptLoader (iOS)","V") -- change "LeftAlt" to key that you want will hide gui

--//tab
local Tab = Window.NewTab("Main")

--//section
local Section = Tab.NewSection("Main")

--// Button
local Button = Section.NewButton("Flying Gui",function()
loadstring(game:HttpGet("https://pastebin.com/raw/VddKrfF4"))();
end)

--// Button
local Button = Section.NewButton("Moon UI (Kinda like admin)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH/MoonUI-v13-102-SCRIPTS/main/MoonUI%20v13!"))()
end)

--// Button
local Button = Section.NewButton("Animations R15",function()
loadstring(game:HttpGet('https://pastebin.com/raw/0MLPL32f'))()
end)

--// Button
local Button = Section.NewButton("Night Toggle",function()

--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Toggles the time of day between night and morning.

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

lighting = game:GetService("Lighting")
if lighting.TimeOfDay == "00:00:00" then
    lighting.TimeOfDay = 11
else 
    lighting.TimeOfDay = 24
end

end)

local Button = Section.NewButton("Keyboard script (Click V, to toggle the gui.)",function()
loadstring(game:HttpGet(('https://pastefy.ga/QNqILuWb/raw'),true))()
end)

local Button = Section.NewButton("Infinite yield (admin, does not work on all games)",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

--//tab
local Tab = Window.NewTab("Player")

--//section
local Section = Tab.NewSection("Player")

--// Button
local Button = Section.NewButton("ESP Script",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ghsstx/Main-Lua/main/Script"))()
end)

--// Button
local Button = Section.NewButton("BTools (Clientsided)",function()
--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Gives your player the old system of building tools

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

backpack = game:GetService("Players").LocalPlayer.Backpack

hammer = Instance.new("HopperBin")
hammer.Name = "Hammer"
hammer.BinType = 4
hammer.Parent = backpack

cloneTool = Instance.new("HopperBin")
cloneTool.Name = "Clone"
cloneTool.BinType = 3
cloneTool.Parent = backpack

grabTool = Instance.new("HopperBin")
grabTool.Name = "Grab"
grabTool.BinType = 2
grabTool.Parent = backpack
end)

--// Button
local Button = Section.NewButton("Korblox script (needs recolor)",function()
-- hats https://www.roblox.com/catalog?Category=1&CreatorName=DuckXander&CreatorType=Group&salesTypeFilter=1

-- script below
-- | Made by GROUD

function Align(Part0,Part1,Position,Angle)
    local AlignPos = Instance.new('AlignPosition', Part1);
    AlignPos.Parent.CanCollide = false;
    AlignPos.ApplyAtCenterOfMass = true;
    AlignPos.MaxForce = 67752;
    AlignPos.MaxVelocity = math.huge/9e110;
    AlignPos.ReactionForceEnabled = false;
    AlignPos.Responsiveness = 200;
    AlignPos.RigidityEnabled = false;
    local AlignOri = Instance.new('AlignOrientation', Part1);
    AlignOri.MaxAngularVelocity = math.huge/9e110;
    AlignOri.MaxTorque = 67752;
    AlignOri.PrimaryAxisOnly = false;
    AlignOri.ReactionTorqueEnabled = false;
    AlignOri.Responsiveness = 200;
    AlignOri.RigidityEnabled = false;
    local AttachmentA=Instance.new('Attachment',Part1);
    local AttachmentB=Instance.new('Attachment',Part0);
    AttachmentA.Name = "BruhA"
    AttachmentB.Name = "BruhB"
    AttachmentB.Orientation = Angle
    AttachmentB.Position = Position
    AlignPos.Attachment0 = AttachmentA;
    AlignPos.Attachment1 = AttachmentB;
    AlignOri.Attachment0 = AttachmentA;
    AlignOri.Attachment1 = AttachmentB;
end

User = game:GetService("Players").LocalPlayer
Body = User.Character
Soul = Body.Humanoid

FakeLeg = Body.RightUpperLeg:Clone()
FakeLeg.Transparency = 1
Body.RightUpperLeg:Destroy()
FakeLeg.Parent = Body
Body.RightUpperLeg.RightUpperLeg:Destroy()

local Korblox = Body["Recolor (For Korblox)"]
Korblox.Handle.Massless = true
Korblox.Handle:BreakJoints()

Align(FakeLeg,Korblox.Handle,Vector3.new(0,.25,0),Vector3.new(0,0,0))

game:GetService("RunService").Heartbeat:connect(function(t)
    if Korblox:FindFirstChild("Handle", true) then
        Korblox.Handle.Velocity = Vector3.new(0, 30,0)
    end;
end)
end)

local Button = Section.NewButton("Click teleport",function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click Teleport by scriptworld"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

local Button = Section.NewButton("Float Script (Cant stop)",function()
--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Makes your character float into the air

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
Re-execute to toggle off and on.
]]

player = game:GetService("Players").LocalPlayer

--Remove BodyVelocity to remove float
if player.Character.HumanoidRootPart:FindFirstChild("WRDBodyVelocity") then
    player.Character.HumanoidRootPart.WRDBodyVelocity:Destroy()
--Insert BodyVelocity to add float
else
    local bodyVelocity = Instance.new("BodyVelocity")
    --So we know what specific instance to remove when toggle off
    bodyVelocity.Name = "WRDBodyVelocity"
    bodyVelocity.Parent = player.Character.HumanoidRootPart
end
end)

local Button = Section.NewButton("Remove arms",function()
--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Removes your characters arms

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

character = game:GetService("Players").LocalPlayer.Character

--R6 Rigs
leftArm = character:FindFirstChild("Left Arm")
if leftArm then leftArm:Destroy() end
rightArm = character:FindFirstChild("Right Arm")
if rightArm then rightArm:Destroy() end

--R15 Rigs
leftUpperArm = character:FindFirstChild("LeftUpperArm")
if leftUpperArm then leftUpperArm:Destroy() end
leftLowerArm = character:FindFirstChild("LeftLowerArm")
if leftLowerArm then leftLowerArm:Destroy() end
leftFoot = character:FindFirstChild("LeftFoot")
if leftFoot then leftFoot:Destroy() end
rightUpperArm = character:FindFirstChild("RightUpperArm")
if rightUpperArm then rightUpperArm:Destroy() end
rightLowerArm = character:FindFirstChild("RightLowerArm")
if rightLowerArm then rightLowerArm:Destroy() end
rightFoot = character:FindFirstChild("RightFoot")
if rightFoot then rightFoot:Destroy() end
end)

--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Removes your characters legs

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

character = game:GetService("Players").LocalPlayer.Character

--R6 Rigs
leftLeg = character:FindFirstChild("Left Leg")
if leftLeg then leftLeg:Destroy() end
rightLeg = character:FindFirstChild("Right Leg")
if rightLeg then rightLeg:Destroy() end

local Button = Section.NewButton("Remove legs",function()
--R15 Rigs
leftUpperLeg = character:FindFirstChild("LeftUpperLeg")
if leftUpperLeg then leftUpperLeg:Destroy() end
leftLowerLeg = character:FindFirstChild("LeftLowerLeg")
if leftLowerLeg then leftLowerLeg:Destroy() end
leftFoot = character:FindFirstChild("LeftFoot")
if leftFoot then leftFoot:Destroy() end
rightUpperLeg = character:FindFirstChild("RightUpperLeg")
if rightUpperLeg then rightUpperLeg:Destroy() end
rightLowerLeg = character:FindFirstChild("RightLowerLeg")
if rightLowerLeg then rightLowerLeg:Destroy() end
rightFoot = character:FindFirstChild("RightFoot")
if rightFoot then rightFoot:Destroy() end
end)

local Button = Section.NewButton("Headless script (clientsided)",function()

game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
end
end)

--// Button
local Button = Section.NewButton("Tall script (scales need to be up at 100% for it to work",function()
--Shit ass script made by failedmite57926

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

function rm()
	for i,v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then
			if v.Name == "Handle" or v.Name == "Head" then
				if Character.Head:FindFirstChild("OriginalSize") then
					Character.Head.OriginalSize:Destroy()
				end
			else
				for i,cav in pairs(v:GetDescendants()) do
					if cav:IsA("Attachment") then
						if cav:FindFirstChild("OriginalPosition") then
							cav.OriginalPosition:Destroy()  
						end
					end
				end
				v:FindFirstChild("OriginalSize"):Destroy()
				if v:FindFirstChild("AvatarPartScaleType") then
					v:FindFirstChild("AvatarPartScaleType"):Destroy()
				end
			end
		end
	end
end

rm()
wait(0.5)
Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
wait(1)

rm()
wait(0.5)
Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
wait(1)

rm()
wait(0.5)
Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
wait(1)

rm()
wait(0.5)
Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
wait(1)

rm()
wait(0.5)
Humanoid:FindFirstChild("HeadScale"):Destroy()
wait(1)
end)

--//tab
local Tab = Window.NewTab("Games")

--//section
local Section = Tab.NewSection("Games")

--// Button
local Button = Section.NewButton("MM2, Madcity and Prisonlife",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/kiko200000000/idka/main/BaconDux%20Hub'),true))()
end)

--// Button
local Button = Section.NewButton("Aimviewer",function()

--Credits to the scripter

-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- // Vars
local Terrain = Workspace.Terrain
local LocalPlayer = Players.LocalPlayer
local Beams = {}

local Colours = {
    At = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0, 0)),
    Away = ColorSequence.new(Color3.new(0, 1, 0), Color3.new(0, 1, 0))
}

-- // Checks if the beam is hitting our character and can't go through walls
local function IsBeamHit(Beam: Beam, MousePos: Vector3)
    -- // Get our character
    local Character = LocalPlayer.Character
    local Attachment = Beam.Attachment1

    -- // Workout the direction
    local Origin = Beam.Attachment0.WorldPosition
    local Direction = MousePos - Origin

    -- // Fire the ray, making sure it hits something (should unless aiming at sky?)
    local raycastParms = RaycastParams.new()
    raycastParms.FilterDescendantsInstances = {Character, Workspace.CurrentCamera}
    local RaycastResult = Workspace:Raycast(Origin, Direction * 2, raycastParms) -- // Multiplied by 2 as ray might fall too short
    if (not RaycastResult) then
        Beam.Color = Colours.Away
        Attachment.WorldPosition = MousePos
        return
    end

    -- // Set the colour based upon if aiming at us or not
    if (Character) then
        Beam.Color = RaycastResult.Instance:IsDescendantOf(Character) and Colours.At or Colours.Away
    end

    -- // Set the position so the beam can't go through walls
    Attachment.WorldPosition = RaycastResult.Position
end

-- // Creates a beam with the default properties
local function CreateBeam(Character: Model)
    -- // Create beam
    local Beam = Instance.new("Beam", Character)

    -- // Set important properties
    Beam.Attachment0 = Character:WaitForChild("Head"):WaitForChild("FaceCenterAttachment")
    Beam.Enabled = Character:FindFirstChild("GunScript", true) ~= nil

    -- // Set visual properties
    Beam.Width0 = 0.1
    Beam.Width1 = 0.1

    -- // Add to beam table so can modify all at once
    table.insert(Beams, Beam)

    -- // Return
    return Beam
end

-- // Apply whenever we get a new character
local function OnCharacter(Character: Model)
    -- // Make sure character exists
    if (not Character) then
        return
    end

    -- // Wait for the MousePos
    local MousePos = Character:WaitForChild("BodyEffects"):WaitForChild("MousePos")

    -- // Create the beam
    local Beam = CreateBeam(Character)

    -- // Attachment for the mouse position
    local Attachment = Instance.new("Attachment", Terrain)
    Beam.Attachment1 = Attachment

    -- // Constantly update when MousePos updates
    IsBeamHit(Beam, MousePos.Value)
    MousePos.Changed:Connect(function()
        IsBeamHit(Beam, MousePos.Value)
    end)

    -- // See whenever they equip a gun
    Character.DescendantAdded:Connect(function(Descendant)
        -- // Check if it is a gun, set enabled
        if (Descendant.Name == "GunScript") then
            Beam.Enabled = true
        end
    end)

    -- // See whenever they unequip a gun
    Character.DescendantRemoving:Connect(function(Descendant)
        -- // Check if it is a gun, set disabled
        if (Descendant.Name == "GunScript") then
            Beam.Enabled = false
        end
    end)
end

-- // Apply on each player
local function OnPlayer(Player: Player)
    OnCharacter(Player.Character)
    Player.CharacterAdded:Connect(OnCharacter)
end

for _, v in ipairs(Players:GetPlayers()) do
    OnPlayer(v)
end

-- // Redo for each new player
Players.PlayerAdded:Connect(OnPlayer)

end)

--// Button
local Button = Section.NewButton("DaHood Script (Faded)",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded/main/YesEpic", true))()
end)

local Button = Section.NewButton("Jenga script",function()
loadstring(game:HttpGet("https://pastebin.com/raw/Z46FpSD0"))();
end)

local Button = Section.NewButton("Arsenal",function()
loadstring(game:HttpGet("https://pastebin.com/raw/2naF10wC"))()
end)

local Button = Section.NewButton("Bloxfruits",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/SonicHub.lua"))()
end)

--// Button
local Button = Section.NewButton("Brookhaven script (Car fly script)",function()
loadstring (game: HttpGet ("https://pastebin.com/raw/MHE1cbWF")) ()
end)

--// Button
local Button = Section.NewButton("Prisonlife admin",function()
loadstring(game:HttpGet('https://pastebin.com/raw/iZ64yzjE'))();
end)

--// Button
local Button = Section.NewButton("put roblox is shutting down message with a disguise",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/game-hax/uca/main/release/uca.min.lua"))()
end)

--//tab
local Tab = Window.NewTab("More scripts")

--//section
local Section = Tab.NewSection("More")

--// Button
local Button = Section.NewButton("Aimlock",function()
loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
end)

--// Button
local Button = Section.NewButton("Boombox script",function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/MirayXS/Aux/main/Pineapple.lua"), true))()
end)

--//tab
local Tab = Window.NewTab("Paid scripts & credits")

--//section
local Section = Tab.NewSection("Paid & Credits (Toggle on something to support us)")

--//Toggles
local EnabledToggle = Section.NewToggle("discord.gg/scriptworld - dog military armor",function(bool)
-- code here
end,true) -- "true" is the default value of toggle

--//Toggles
local EnabledToggle = Section.NewToggle("Aimlock script (DM Dog military armor)",function(bool)
-- code here
end,true) -- "true" is the default value of toggle
