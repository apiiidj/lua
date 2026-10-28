loadstring([[
-- RAMS AIMBOT v1
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Char, Hum, HRP
local function refreshChar()
    Char = Player.Character or Player.CharacterAdded:Wait()
    Hum = Char:WaitForChild("Humanoid")
    HRP = Char:WaitForChild("HumanoidRootPart")
end
refreshChar()
Player.CharacterAdded:Connect(refreshChar)

-- STATES
local speedOn = false
local espOn = false
local espObjects = {}

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RAMS_AIMBOT"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(260, 300)
frame.Position = UDim2.fromScale(0.05, 0.25)
frame.BackgroundColor3 = Color3.fromRGB(255,182,193) -- Pink color
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "RAMS AIMBOT v1"
title.TextColor3 = Color3.fromRGB(255,20,147)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22

local function button(text, y, callback)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(255,105,180)
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(callback)
end

-- SPEED TOGGLE
button("Speed Toggle (100)", 50, function()
    speedOn = not speedOn
    Hum.WalkSpeed = speedOn and 100 or 16
end)

-- ESP TOGGLE
local function clearESP()
    for _, v in pairs(espObjects) do
        if v then v:Destroy() end
    end
    espObjects = {}
end

local function addESP(plr)
    if plr == Player or not plr.Character then return end

    local h = Instance.new("Highlight")
    h.FillColor = Color3.fromRGB(255,182,193)
    h.FillTransparency = 0.5
    h.Parent = plr.Character

    table.insert(espObjects, h)
end

button("ESP Toggle", 90, function()
    espOn = not espOn
    clearESP()
    if espOn then
        for _, p in pairs(Players:GetPlayers()) do
            addESP(p)
            p.CharacterAdded:Connect(function()
                if espOn then task.wait(1) addESP(p) end
            end)
        end
    end
end)

-- OWL HUB BUTTON
button("Load Owl Hub", 130, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Owl%20Hub.lua"))()
end)

-- CLOSE BUTTON
button("Close Menu (+ to reopen)", 170, function()
    frame.Visible = false
end)

-- TOGGLE MENU WITH '+'
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Equals then
        frame.Visible = not frame.Visible
    end
end)

print("RAMS AIMBOT v1 LOADED")
]])()
