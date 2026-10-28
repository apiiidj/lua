local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
local infjump_bool = false
local uis = game:GetService("UserInputService")

uis.JumpRequest:Connect(function()
	local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

	if infjump_bool then
		if humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

game.StarterGui:SetCore("SendNotification", {
	Title = "Void Admin",
	Text = "Loaded! Type '!cmds' to get the command list.",
	Duration = 6
})

player.Chatted:Connect(function(message)
	if message:sub(1,6) == "!speed" then
		local speed_value = tonumber(message:match("!speed%s+(%d+)"))
		local humanoid = player.Character:WaitForChild("Humanoid")

		humanoid.WalkSpeed = speed_value

	elseif message:sub(1, 5) == "!cmds" then
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 350, 0, 350)
		frame.Position = UDim2.new(0, 700, 0, 200)
		frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		frame.BackgroundTransparency = 0.4
		frame.Parent = screenGui

		local close_button = Instance.new("TextButton")
		close_button.Size = UDim2.new(0, 25, 0, 25)
		close_button.Position = UDim2.new(0, 325, 0, 0)
		close_button.Text = "X"
		close_button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		close_button.BackgroundTransparency = 0.4
		close_button.TextColor3 = Color3.fromRGB(255, 255, 255)
		close_button.Parent = frame

		close_button.MouseButton1Click:Connect(function()
			frame:Destroy()
		end)

		local speed_label = Instance.new("TextLabel")
		speed_label.Size = UDim2.new(0, 325, 0, 25)
		speed_label.Position = UDim2.new(0, 0, 0, 30)
		speed_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		speed_label.BackgroundTransparency = 0.4
		speed_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		speed_label.Text = "!speed <value>"
		speed_label.TextScaled = true
		speed_label.Parent = frame

		local jump_label = Instance.new("TextLabel")
		jump_label.Size = UDim2.new(0, 325, 0, 25)
		jump_label.Position = UDim2.new(0, 0, 0, 55)
		jump_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		jump_label.BackgroundTransparency = 0.4
		jump_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		jump_label.Text = "!jumppower <value>"
		jump_label.TextScaled = true
		jump_label.Parent = frame

		local sit_label = Instance.new("TextLabel")
		sit_label.Size = UDim2.new(0, 325, 0, 25)
		sit_label.Position = UDim2.new(0, 0, 0, 80)
		sit_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		sit_label.BackgroundTransparency = 0.4
		sit_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		sit_label.Text = "!sit"
		sit_label.TextScaled = true
		sit_label.Parent = frame

		local noclip_label = Instance.new("TextLabel")
		noclip_label.Size = UDim2.new(0, 325, 0, 25)
		noclip_label.Position = UDim2.new(0, 0, 0, 108)
		noclip_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		noclip_label.BackgroundTransparency = 0.4
		noclip_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		noclip_label.Text = "!noclip <enable/disable>"
		noclip_label.TextScaled = true
		noclip_label.Parent = frame

		local infjump_label = Instance.new("TextLabel")
		infjump_label.Size = UDim2.new(0, 325, 0, 25)
		infjump_label.Position = UDim2.new(0, 0, 0, 138)
		infjump_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		infjump_label.BackgroundTransparency = 0.4
		infjump_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		infjump_label.Text = "!infjump <enable/disable>"
		infjump_label.TextScaled = true
		infjump_label.Parent = frame

		local esp_label = Instance.new("TextLabel")
		esp_label.Size = UDim2.new(0, 325, 0, 25)
		esp_label.Position = UDim2.new(0, 0, 0, 165)
		esp_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		esp_label.BackgroundTransparency = 0.4
		esp_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		esp_label.Text = "!esp"
		esp_label.TextScaled = true
		esp_label.Parent = frame

		local tracers_label = Instance.new("TextLabel")
		tracers_label.Size = UDim2.new(0, 325, 0, 25)
		tracers_label.Position = UDim2.new(0, 0, 0, 190)
		tracers_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		tracers_label.BackgroundTransparency = 0.4
		tracers_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		tracers_label.Text = "!tracers"
		tracers_label.TextScaled = true
		tracers_label.Parent = frame
	
		local player_tp_label = Instance.new("TextLabel")
		player_tp_label.Size = UDim2.new(0, 325, 0, 25)
		player_tp_label.Position = UDim2.new(0, 0, 0, 215)
		player_tp_label.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		player_tp_label.BackgroundTransparency = 0.4
		player_tp_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		player_tp_label.Text = "!playertp <username>"
		player_tp_label.TextScaled = true
		player_tp_label.Parent = frame
	
	elseif message:sub(1, 10) == "!jumppower" then
		local jump_value = tonumber(message:match("!jumppower%s+(%d+)"))
		local humanoid = player.Character:WaitForChild("Humanoid")

		humanoid.JumpPower = jump_value
		humanoid.UseJumpPower = true

	elseif message:sub(1, 4) == "!sit" then
		local humanoid = player.Character:WaitForChild("Humanoid")

		humanoid.Sit = true

	elseif message:sub(1, 7) == "!noclip" then
		local Noclip_value = message:match("!noclip%s+(%a+)")

		if Noclip_value == "enable" then
			local character = game.Players.LocalPlayer.Character

			if character then
				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		elseif Noclip_value == "disable" then
			local character = game.Players.LocalPlayer.Character

			if character then
				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = true
					end
				end
			end
		end
	elseif message:sub(1, 8) == "!infjump" then
		local infjump_value = message:match("!infjump%s+(%a+)")

		if infjump_value == "enable" then
			infjump_bool = true
		elseif infjump_value == "disable" then
			infjump_bool = false
		end
	elseif message:sub(1, 4) == "!esp" then
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/WRD%20ESP.lua"))()
	elseif message:sub(1, 8) == "!tracers" then
		loadstring(game:HttpGet("https://gist.githubusercontent.com/TreeByte403/77b87e0a424e480cfd43164003c4b99c/raw/e9c3906c50801a09dc0b5c89e1efae978efafe39/tracers.lua"))()
	elseif message:sub(1, 9) == "!playertp" then
		local target_player = message:match("!playertp%s+([%w_]+)")

		if target_player then
			local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
			local target = game.Players:FindFirstChild(target_player)
			local target_hrp = target.Character:WaitForChild("HumanoidRootPart")
			local target_pos = target_hrp.Position

			hrp.CFrame = CFrame.new(target_pos)
		end
	end
end)
