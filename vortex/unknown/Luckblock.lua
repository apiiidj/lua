

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "Luckblock"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()


local Window = OrionLib:MakeWindow({Name = "Lucky Block", HidePremium = false, SaveConfig = true})


local MainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})

MainTab:AddButton({
    Name = "Spawn Rainbow Block",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").SpawnRainbowBlock
        Event:FireServer()
    end
})


local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345999", PremiumOnly = false})


local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer




local flying = false
local flySpeed = 50
local flyConnection = nil
local bv, bg = nil, nil

local function stopFly()
    flying = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    if bv then bv:Destroy() bv = nil end
    if bg then bg:Destroy() bg = nil end

    local char = LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").PlatformStand = false
    end
end

local function startFly()
    stopFly()
    flying = true

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local humanoid = char:WaitForChild("Humanoid")

    bv = Instance.new("BodyVelocity")
    bv.Name = "FlyVelocity"
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Velocity = Vector3.zero
    bv.Parent = hrp

    bg = Instance.new("BodyGyro")
    bg.Name = "FlyGyro"
    bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    bg.CFrame = hrp.CFrame
    bg.Parent = hrp

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flying or not char or not hrp or not hrp.Parent or not humanoid or humanoid.Health <= 0 then
            stopFly()
            return
        end

        humanoid.PlatformStand = true
        local cam = workspace.CurrentCamera
        bg.CFrame = cam.CFrame

        local moveDir = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
        end

        bv.Velocity = moveDir * flySpeed
    end)
end


VisualsTab:AddToggle({
    Name = "Fly Aktivieren",
    Default = false,
    Callback = function(Value)
        if Value then
            startFly()
        else
            stopFly()
        end
    end
})


VisualsTab:AddSlider({
    Name = "Fly Speed Wert",
    Min = 10,
    Max = 300,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        flySpeed = Value
    end
})




local speedEnabled = false
local currentSpeed = 16

local function applySpeed()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if speedEnabled then
            char.Humanoid.WalkSpeed = currentSpeed
        else
            char.Humanoid.WalkSpeed = 16
        end
    end
end

VisualsTab:AddToggle({
    Name = "WalkSpeed Aktivieren",
    Default = false,
    Callback = function(Value)
        speedEnabled = Value
        applySpeed()
    end
})

VisualsTab:AddSlider({
    Name = "WalkSpeed Wert",
    Min = 16,
    Max = 300,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        currentSpeed = Value
        if speedEnabled then
            applySpeed()
        end
    end
})

RunService.RenderStepped:Connect(function()
    if speedEnabled then
        applySpeed()
    end
end)


OrionLib:Init()