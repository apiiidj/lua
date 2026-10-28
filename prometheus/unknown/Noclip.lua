--[[
A distribution of https://wearedevs.net/scripts

Made by WeAreDevs
Created June 26, 2025

Description: Walk through walls, by disabling collision with anything your torso touches
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function onTouched(part)
	if not part:IsA("BasePart") then return end
	if not part.Anchored then return end
	if not part.CanCollide then return end

	local character = LocalPlayer.Character
	if not character then return end

	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- Prevent disabling floors
	if part.Position.Y < (hrp.Position.Y - hrp.Size.Y) then return end

	-- Passed all checks
	part.CanCollide = false
end

-- Wait for character and hook HRP
local function setup()
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	
	if char:FindFirstChild("Torso") then
		char.Torso.Touched:Connect(onTouched)
	elseif char:FindFirstChild("UpperTorso") then
		char.UpperTorso.Touched:Connect(onTouched)
	end
	
	local hrp = char:WaitForChild("HumanoidRootPart")
	hrp.Touched:Connect(onTouched)
end

if LocalPlayer.Character then
	setup()
end

LocalPlayer.CharacterAdded:Connect(setup)