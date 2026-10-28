loadstring([[
-- CHATGPT AHH MENU
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
local jumpMode = 0
local airJumpOn = false
local floatOn = false
local swimOn = false
local espOn = false
local espObjects = {}

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "CHATGPT_AHH_MENU"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(300, 500)
frame.Position = UDim2.fromScale(0.05, 0.25)
frame.BackgroundColor3 = Color3.fromRGB(255,255,255) -- White theme
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "CHATGPT AHH MENU"
title.TextColor3 = Color3.fromRGB(0,0,0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24

local function button(text, y, callback)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(200,200,200)
    b.TextColor3 = Color3.fromRGB(0,0,0)
    b.MouseButton1Click:Connect(callback)
end

local yPos = 50

-- PHENIEOX FEATURES
button("PHENIEOX: Speed Toggle (100)", yPos, function()
    speedOn = not speedOn
    Hum.WalkSpeed = speedOn and 100 or 16
end)
yPos = yPos + 40

button("PHENIEOX: Double Jump", yPos, function() jumpMode = 2 airJumpOn = false end)
yPos = yPos + 40
button("PHENIEOX: Triple Jump", yPos, function() jumpMode = 3 airJumpOn = false end)
yPos = yPos + 40
button("PHENIEOX: Infinite Jump", yPos, function() jumpMode = math.huge airJumpOn = false end)
yPos = yPos + 40
button("PHENIEOX: Air Jump Toggle", yPos, function() airJumpOn = not airJumpOn jumpMode = 0 end)
yPos = yPos + 40
button("PHENIEOX: Float Toggle", yPos, function() floatOn = not floatOn end)
yPos = yPos + 40
button("PHENIEOX: Swim Toggle", yPos, function() swimOn = not swimOn Hum:ChangeState(swimOn and Enum.HumanoidStateType.Swimming or Enum.HumanoidStateType.Running) end)
yPos = yPos + 40
button("PHENIEOX: ESP Toggle", yPos, function()
    espOn = not espOn
    local function clearESP()
        for _, v in pairs(espObjects) do if v then v:Destroy() end end
        espObjects = {}
    end
    local function addESP(plr)
        if plr == Player or not plr.Character then return end
        local h = Instance.new("Highlight")
        h.FillColor = Color3.fromRGB(255,80,80)
        h.FillTransparency = 0.5
        h.Parent = plr.Character
        local b = Instance.new("BillboardGui")
        b.Size = UDim2.fromOffset(100,30)
        b.AlwaysOnTop = true
        b.Adornee = plr.Character:WaitForChild("Head")
        b.Parent = plr.Character
        local t = Instance.new("TextLabel", b)
        t.Size = UDim2.fromScale(1,1)
        t.BackgroundTransparency = 1
        t.Text = plr.Name
        t.TextColor3 = Color3.new(0,0,0)
        t.TextStrokeTransparency = 0
        t.Font = Enum.Font.GothamBold
        t.TextSize = 14
        table.insert(espObjects, h)
        table.insert(espObjects, b)
    end
    clearESP()
    if espOn then
        for _, p in pairs(Players:GetPlayers()) do
            addESP(p)
            p.CharacterAdded:Connect(function() if espOn then task.wait(1) addESP(p) end end)
        end
    end
end)
yPos = yPos + 40

-- RAMS AIMBOT
button("RAMS AIMBOT: Load Owl Hub", yPos, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Owl%20Hub.lua"))()
end)
yPos = yPos + 40

-- JERTECH ESP
button("JERTECH ESP: Kill Menu", yPos, function()
    gui:Destroy()
end)
yPos = yPos + 40

-- FLING MENU
button("FLING MENU: Load Fling GUI", yPos, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/130275/scripts/Fling%20GUI%20V3.lua"))()
end)
yPos = yPos + 40

-- CLOSE MENU
button("Close Menu (+ to reopen)", yPos, function()
    frame.Visible = false
end)

-- JUMP & AIR JUMP HANDLING
local jumps = 0
UIS.JumpRequest:Connect(function()
    if airJumpOn then
        Hum:ChangeState(Enum.HumanoidStateType.Jumping)
    elseif jumpMode > 0 and jumps < jumpMode then
        jumps += 1
        Hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
Hum.StateChanged:Connect(function(_, new)
    if new == Enum.HumanoidStateType.Landed then jumps = 0 end
end)

-- FLOAT HANDLING
RunService.RenderStepped:Connect(function()
    if floatOn then
        HRP.Velocity = Vector3.new(HRP.Velocity.X, 2, HRP.Velocity.Z)
    end
end)

-- CTRL+CLICK TP
Mouse.Button1Down:Connect(function()
    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) and Mouse.Hit then
        HRP.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0,3,0))
    end
end)

-- MENU TOGGLE
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Equals then
        frame.Visible = not frame.Visible
    end
end)

print("CHATGPT AHH MENU LOADED")
]])()
