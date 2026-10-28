-- created by nullifiedw and BREAD (DanXvo)
-- skid if youd like

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🎨 Art Hub - OP Hakx - CUSA 🎨", "GrapeTheme")

local bTab = Window:NewTab("🧱 Bypasses 🧱")
local bSection = bTab:NewSection("Cuffs, freezes, etc.")

bSection:NewButton("Unfreeze", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if hrp.Anchored then
        hrp.Anchored = false
    end

    if humanoid and humanoid.PlatformStand then
        humanoid.PlatformStand = false
    end

    hrp.Velocity = Vector3.new(0, 0, 0)
    hrp.RotVelocity = Vector3.new(0, 0, 0)
end)

bSection:NewButton("Bypass Cuffs", "Break cuffs so you can escape, dont do when cuffed by staff.", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.Health = 0
    end
end)

bSection:NewButton("Escape Jail (DOES NOT REMOVE PRISONER)", "Escape jail", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    local targetPosition = Vector3.new(122.82640838623047, 3.4384186267852783, 165.82994079589844)

    hrp.CFrame = CFrame.new(targetPosition)
end)

bSection:NewButton("Bypass Gate", "Bypass the Combat func", function()
    for _, part in workspace.Main.External.Bariers.Terminate:GetChildren() do 
        part:Destroy() 
    end
end)

local tTab = Window:NewTab("⚙️ Toggles ⚙️")
local tSection = tTab:NewSection("Toggle random but useful shit")

tSection:NewToggle("Anti Cuff", "ToggleInfo", function(state)
    if state then
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        getgenv().cuffEvade = true

        local function instaRespawn()
            if not cuffEvade then return end

            if not replicatesignal then 
                LocalPlayer.Character.Humanoid.Health = 0 
                return 
            end

            replicatesignal(LocalPlayer.ConnectDiedSignalBackend)
            task.wait(Players.RespawnTime - .01)
            replicatesignal(LocalPlayer.Kill)
        end

        LocalPlayer.CharacterAdded:Connect(function(char)
            char.ChildAdded:Connect(function(child)
                if child.Name == "LeftArmWeld" then
                    instaRespawn()
                end
            end)
        end)

        if LocalPlayer.Character then
            if LocalPlayer.Character:FindFirstChild("LeftArmWeld") then 
                instaRespawn()
            end

            LocalPlayer.Character.ChildAdded:Connect(function(child)
                if child.Name == "LeftArmWeld" then
                    instaRespawn()
                end
            end)
        end
    else
        print("Toggle Off")
    end
end)

tSection:NewToggle("Anti AFK", "ToggleInfo", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

local eTab = Window:NewTab("😈 Exploits 😈")
local eSection = eTab:NewSection("The real stuffz")

eSection:NewButton("Staff Check", "Check online staff", function()
    local guiShown = false

    local function createStaffGui(staffUsernames)
        if guiShown then return end
        guiShown = true

        local screenGui = Instance.new("ScreenGui")
        screenGui.Parent = game:GetService("CoreGui")

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 200, 0, 100)
        frame.Position = UDim2.new(0.5, -100, 0.5, -50)
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        frame.BorderSizePixel = 1
        frame.Parent = screenGui

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Position = UDim2.new(0, 0, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextScaled = true
        textLabel.Text = "Staff Online:\n" .. table.concat(staffUsernames, "\n")
        textLabel.Parent = frame

        wait(5)
        for i = 1, 50 do
            frame.BackgroundTransparency = i / 50
            textLabel.TextTransparency = i / 50
            wait(0.1)
        end
        screenGui:Destroy()
    end

    local function checkStaffPlayers()
        local staffUsernames = {}
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Team and player.Team.Name == "Staff" then
                table.insert(staffUsernames, player.Name)
            end
        end

        if #staffUsernames > 0 then
            createStaffGui(staffUsernames)
        end
    end

    game.Players.PlayerAdded:Connect(function(player)
        checkStaffPlayers()
    end)

    checkStaffPlayers()
end)

eSection:NewButton("Client Replication for CUSA", "basically fe bypass", function()
    print("Clicked")
end)

local mTab = Window:NewTab("📋 Misc 📋")
local mSection = mTab:NewSection("EVERY script needs this")

mSection:NewButton("BTools", "ButtonInfo", function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

mSection:NewSlider("WalkSpeed", "SliderInfo", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

mSection:NewSlider("JumpPower", "SliderInfo", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local tTab = Window:NewTab("⚡ Teleports ⚡")
local tSection = tTab:NewSection("Be careful")

tSection:NewButton("TP to Gate", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Target coordinates
local targetPos = Vector3.new(6.284707546234131, 3.249999761581421, 69.6431884765625)

-- Teleport
hrp.CFrame = CFrame.new(targetPos)

end)

tSection:NewButton("TP to Navy", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Target coordinates
local targetPos = Vector3.new(149.1151580810547, 3.249999761581421, -493.587158203125)

-- Teleport
hrp.CFrame = CFrame.new(targetPos)

end)

tSection:NewButton("TP to Marines", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Target coordinates
local targetPos = Vector3.new(-25.30335807800293, 3.249999761581421, -125.17765045166016)

-- Teleport
hrp.CFrame = CFrame.new(targetPos)

end)

tSection:NewButton("TP to Court", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Target coordinates
local targetPos = Vector3.new(345.0386047363281, 3.249999761581421, -133.3006591796875)

-- Teleport
hrp.CFrame = CFrame.new(targetPos)

end)

tSection:NewButton("TP to HQ", "ButtonInfo", function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Target coordinates
local targetPos = Vector3.new(-14.091154098510742, 10.819062232971191, -361.99365234375)

-- Teleport
hrp.CFrame = CFrame.new(targetPos)

end)