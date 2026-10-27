local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

local function CallRaidFunction()
	for i = 1, 50 do
		local args = {
			"CreateSoundFromRoot",
			1e+120
		}

		RemoteEvent:FireServer(unpack(args))

		task.wait(0.1)
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Raid Caller Script:",
		Text = "You have called for a Raid!",
		Duration = 2.5
	})
end

local function onPlayerChatted(message: string)
	local trimmed = message:match("^%s*(.-)%s*$")

	if trimmed:lower() == "/callraid" then
		CallRaidFunction()
	end
end

LocalPlayer.Chatted:Connect(onPlayerChatted)

task.wait(0.1)

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Raid Caller Script:",
	Text = "You can call raids now, say /CallRaid in chat to start a Raid!",
	Duration = 6.5
})

task.wait(0.5)

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Raid Caller Script:",
	Text = "Also, it's better to do this at night ingame on a base with alot of People XD",
	Duration = 6.5
})

-- WeAreDevs Obfuscator won't work bruh🥀 --
-- Also I'm too lazy to remake it so it might be buggy XD --

-- This script adds a Command for raiding.

-- What it does is when you Type "/CallRaid" it makes a sound that has a range of 1e+120 which yeah... Attracts ALL the Listeners (Maybe) Also it's only one command I might add some soon tho
-- (or no :3) 