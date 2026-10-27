local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Brookhaven Admin script📜",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "By UNKNOWN",
    Icon = 0,
    Theme = "Default",
})

local Tab = Window.CreateTab(4483362458, "Teleport")
local Tab_1 = Window.CreateTab(4483363458, "Player")
local Tab_2 = Window.CreateTab(4483363458, "Misc")

local spawn_button = Tab:CreateButton({
    Name = "Spawn",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-61, 4, -1)
    end,
})

local bank_button = Tab:CreateButton({
    Name = "Bank",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(1, 4, 255)
    end,
})

local rockstar_button = Tab:CreateButton({
    Name = "Rockstar",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-40, 4, 253)
    end,
})

local dentist_button = Tab:CreateButton({
    Name = "Dentist",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-69, 4, 247)
    end,
})

local StarBrooks_button = Tab:CreateButton({
    Name = "StarBrooks Coffee",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-104, 4, 257)
    end,
})

local Library_button = Tab:CreateButton({
    Name = "Library",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-130, 4, 255)
    end,
})

local arcade_button = Tab:CreateButton({
    Name = "Arcade",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-168, 3, -122)
    end,
})

local ice_button = Tab:CreateButton({
    Name = "Ice cream",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-124, 4, -125)
    end,
})

local club_button = Tab:CreateButton({
    Name = "Club Brooks",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-102, 4, -116)
    end,
})

local hair_nails_button = Tab:CreateButton({
    Name = "Hair & Nails",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-76, 4, -121)
    end,
})

local apartments_button = Tab:CreateButton({
    Name = "Brookhaven Apartments",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-42, 4, -118)
    end,
})

local rotten_robbie_button = Tab:CreateButton({
    Name = "Rotten Robbie",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(123, 3, -294)
    end,
})

local police_button = Tab:CreateButton({
    Name = "Police",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-120, 4, 7)
    end,
})

local hospital_button = Tab:CreateButton({
    Name = "Hospital",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-304, 4, 31)
    end,
})

local speed_slider = Tab_1:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    CurrentValue = 16,
    Increment = 1,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        humanoid.WalkSpeed = Value
    end,
})

local jump_slider = Tab_1:CreateSlider({
    Name = "JumpPower",
    Range = {50, 300},
    CurrentValue = 16,
    Increment = 1,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        humanoid.JumpPower = Value
    end,
})

local sit_button = Tab_1:CreateButton({
    Name = "sit",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        humanoid.Sit = true
    end,
})

local fly_gui_button = Tab_2:CreateButton({
    Name = "Fly gui v3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end,
})

local infinite_yield_button = Tab_2:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

local b_tools_button = Tab_2:CreateButton({
    Name = "B-tools",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end,
})
