

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "bundesRp"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local NightUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()

local Window = NightUI:MakeWindow({
    Name = "Night System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "NightUI_Config"
})

local AimbotTab = Window:MakeTab({Name = "Aimbot", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local SilentAimTab = Window:MakeTab({Name = "Silent Aim", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local PlayerTab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local VehicleTab = Window:MakeTab({Name = "Vehicle", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local PoliceTab = Window:MakeTab({Name = "Polizei", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local PhoneTab = Window:MakeTab({Name = "Phone", Icon = "rbxassetid://4483345997", PremiumOnly = false})
local MobileUITab = Window:MakeTab({Name = "Mobile UI", Icon = "rbxassetid://4483345997", PremiumOnly = false})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local camera = Workspace.CurrentCamera

local pcFlyEnabled, mobileFlyEnabled = false, false
local pcVFlyEnabled, mobileVFlyEnabled = false, false
local flySpeed, vFlySpeed = 50, 80

local noclipEnabled = false
local walkSpeedEnabled = false
local jumpPowerEnabled = false
local walkSpeedVal = 16
local jumpPowerVal = 50

local aimbotConfig = { Enabled = false, TargetPart = "Head", Smoothness = 0.2, FOVRadius = 150, ShowFOV = false }
local silentAimConfig = { Enabled = false, AutoShoot = false, FOVRadius = 150, ShowFOV = false, Cooldown = 0.5 }

local autoTaserConfig = { Enabled = false, LastFired = 0 }
local autoCuffConfig = { Enabled = false, LastFired = 0 }

local jobTeleportMode = "Bei Job-Koordinaten bleiben"
local targetJobCoords = Vector3.new(3986.672, 28.15, 22.826)

local vehicleKeybind = "X"
local mobileUp, mobileDown, mobileForward, mobileBackward = false, false, false, false
local mobileAiming = false
local mobileShooting = false
local lastShotTime = 0

local showPhoneApp = false
local customAppButton = nil
local customAppInterface = nil

local WantedDatabase = {}
local GlobalEvents = ReplicatedStorage:FindFirstChild("shared/network@GlobalEvents")

if GlobalEvents then
    local function handleWantedEvent(userId, level)
        if userId and level then
            if level > 0 then WantedDatabase[tonumber(userId)] = level
            else WantedDatabase[tonumber(userId)] = nil end
        end
    end

    local updateWanted = GlobalEvents:FindFirstChild("UpdateOnlinePlayersCrime_WantedLevel")
    if updateWanted and updateWanted:IsA("RemoteEvent") then
        updateWanted.OnClientEvent:Connect(handleWantedEvent)
    end

    local setWanted = GlobalEvents:FindFirstChild("SetWantedLevel")
    if setWanted and setWanted:IsA("RemoteEvent") then
        setWanted.OnClientEvent:Connect(handleWantedEvent)
    end
end

local function checkWantedStatus(player)
    local level = WantedDatabase[player.UserId]
    if level and level > 0 then return true, tostring(level) end
    return false, ""
end

local function getKeyList()
    local keys = {"None"}
    for i = 65, 90 do table.insert(keys, string.char(i)) end
    for i = 48, 57 do table.insert(keys, string.char(i)) end
    for i = 1, 12 do table.insert(keys, "F" .. i) end
    return keys
end

local aimbotOverlay = Drawing.new("Circle")
aimbotOverlay.Thickness = 1.5
aimbotOverlay.Filled = false
aimbotOverlay.Transparency = 1
aimbotOverlay.Visible = false

local silentOverlay = Drawing.new("Circle")
silentOverlay.Thickness = 1.5
silentOverlay.Filled = false
silentOverlay.Transparency = 1
silentOverlay.Visible = false

local MobileUI = Instance.new("ScreenGui")
MobileUI.Name = "NightMobileUI"
MobileUI.ResetOnSpawn = false
MobileUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local uiSuccess = pcall(function() MobileUI.Parent = CoreGui end)
if not uiSuccess then MobileUI.Parent = LocalPlayer:WaitForChild("PlayerGui") end
MobileUI.Enabled = true

local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.new(0, 260, 0, 220)
MainContainer.Position = UDim2.new(1, -270, 0.5, -110)
MainContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainContainer.BackgroundTransparency = 0.25
MainContainer.Parent = MobileUI
Instance.new("UICorner", MainContainer).CornerRadius = UDim.new(0, 10)

local PanelStroke = Instance.new("UIStroke", MainContainer)
PanelStroke.Color = Color3.fromRGB(0, 170, 255)
PanelStroke.Thickness = 1.5

local DragHandle = Instance.new("Frame")
DragHandle.Size = UDim2.new(1, 0, 0, 24)
DragHandle.BackgroundTransparency = 1
DragHandle.Parent = MainContainer

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -10, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Mobile Controller"
TitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TitleLabel.TextSize = 12
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = DragHandle

local DragIcon = Instance.new("Frame")
DragIcon.Size = UDim2.new(0, 30, 0, 4)
DragIcon.Position = UDim2.new(0.5, -15, 0.5, -2)
DragIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragIcon.BackgroundTransparency = 0.5
DragIcon.Parent = DragHandle
Instance.new("UICorner", DragIcon).CornerRadius = UDim.new(1, 0)

local dragging, dragInput, dragStart, startPos
DragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MainContainer.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
DragHandle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local ButtonGrid = Instance.new("Frame")
ButtonGrid.Size = UDim2.new(1, -10, 1, -28)
ButtonGrid.Position = UDim2.new(0, 5, 0, 24)
ButtonGrid.BackgroundTransparency = 1
ButtonGrid.Parent = MainContainer

local function createToggleButton(text, pos, size, defaultState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = size; btn.Position = pos
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(0, 140, 230) or Color3.fromRGB(35, 35, 35)
    btn.BackgroundTransparency = 0.2; btn.Text = text; btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11; btn.Font = Enum.Font.GothamBold; btn.AutoButtonColor = false; btn.Parent = ButtonGrid
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local active = defaultState
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.BackgroundColor3 = active and Color3.fromRGB(0, 140, 230) or Color3.fromRGB(35, 35, 35)
        callback(active)
    end)
    return btn
end

local function createHoldButton(text, pos, size, callback)
    local btn = Instance.new("TextButton")
    btn.Size = size; btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.BackgroundTransparency = 0.2; btn.Text = text; btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12; btn.Font = Enum.Font.GothamBold; btn.AutoButtonColor = false; btn.Parent = ButtonGrid
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local tw = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            callback(true)
            TweenService:Create(btn, tw, {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            callback(false)
            TweenService:Create(btn, tw, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
        end
    end)
    return btn
end

local btnFly = createToggleButton("FLY", UDim2.new(0, 0, 0, 0), UDim2.new(0, 58, 0, 32), false, function(st)
    if st then startFly(true) else stopFly() end
end)
local btnVFly = createToggleButton("V-FLY", UDim2.new(0, 62, 0, 0), UDim2.new(0, 58, 0, 32), false, function(st)
    mobileVFlyEnabled = st
end)
local btnUp = createHoldButton("▲", UDim2.new(0, 124, 0, 0), UDim2.new(0, 58, 0, 32), function(act) mobileUp = act end)
local btnDown = createHoldButton("▼", UDim2.new(0, 186, 0, 0), UDim2.new(0, 58, 0, 32), function(act) mobileDown = act end)

local btnAutoTaser = createToggleButton("A-Taser", UDim2.new(0, 0, 0, 36), UDim2.new(0, 58, 0, 32), false, function(st) autoTaserConfig.Enabled = st end)
local btnAutoCuff = createToggleButton("A-Cuff", UDim2.new(0, 62, 0, 36), UDim2.new(0, 58, 0, 32), false, function(st) autoCuffConfig.Enabled = st end)
local btnW = createHoldButton("W", UDim2.new(0, 124, 0, 36), UDim2.new(0, 58, 0, 32), function(act) mobileForward = act end)
local btnS = createHoldButton("S", UDim2.new(0, 186, 0, 36), UDim2.new(0, 58, 0, 32), function(act) mobileBackward = act end)

local btnAimbot = createToggleButton("Aimbot", UDim2.new(0, 0, 0, 76), UDim2.new(0, 80, 0, 32), false, function(st) aimbotConfig.Enabled = st end)
local btnAimOV = createToggleButton("Aim OV", UDim2.new(0, 84, 0, 76), UDim2.new(0, 78, 0, 32), false, function(st) aimbotConfig.ShowFOV = st end)
local btnLockMode = Instance.new("TextButton")
btnLockMode.Size = UDim2.new(0, 82, 0, 32)
btnLockMode.Position = UDim2.new(0, 166, 0, 76)
btnLockMode.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
btnLockMode.Text = "Lock: HOLD"
btnLockMode.TextColor3 = Color3.fromRGB(255, 255, 255)
btnLockMode.TextSize = 10
btnLockMode.Font = Enum.Font.GothamBold
btnLockMode.Parent = ButtonGrid
Instance.new("UICorner", btnLockMode).CornerRadius = UDim.new(0, 6)

local aimbotLockMode = "Hold"
btnLockMode.MouseButton1Click:Connect(function()
    if aimbotLockMode == "Hold" then
        aimbotLockMode = "Always"; btnLockMode.Text = "Lock: ALWAYS"; btnLockMode.BackgroundColor3 = Color3.fromRGB(180, 70, 0)
    else
        aimbotLockMode = "Hold"; btnLockMode.Text = "Lock: HOLD"; btnLockMode.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    end
end)

local btnAimAction = createHoldButton("AIM", UDim2.new(0, 0, 0, 112), UDim2.new(0, 248, 0, 32), function(act) mobileAiming = act end)
local btnSilent = createToggleButton("Silent", UDim2.new(0, 0, 0, 150), UDim2.new(0, 80, 0, 32), false, function(st) silentAimConfig.Enabled = st end)
local btnSilentOV = createToggleButton("Silent OV", UDim2.new(0, 84, 0, 150), UDim2.new(0, 78, 0, 32), false, function(st) silentAimConfig.ShowFOV = st end)
local btnAutoFire = createToggleButton("Auto-Fire", UDim2.new(0, 166, 0, 150), UDim2.new(0, 82, 0, 32), false, function(st) silentAimConfig.AutoShoot = st end)
local btnFireAction = createHoldButton("FIRE", UDim2.new(0, 0, 0, 186), UDim2.new(0, 248, 0, 32), function(act) mobileShooting = act end)

local flyBodyVel, flyBodyGyro
local activeVBodyVel, activeVBodyGyro, lastVehRoot
local moveState = {Forward = false, Backward = false, Left = false, Right = false, Up = false, Down = false}

local function resetMoveState()
    for k in pairs(moveState) do moveState[k] = false end
    mobileUp, mobileDown, mobileForward, mobileBackward = false, false, false, false
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe or (not pcFlyEnabled and not pcVFlyEnabled) then return end
    if input.KeyCode == Enum.KeyCode.W then moveState.Forward = true end
    if input.KeyCode == Enum.KeyCode.S then moveState.Backward = true end
    if input.KeyCode == Enum.KeyCode.A then moveState.Left = true end
    if input.KeyCode == Enum.KeyCode.D then moveState.Right = true end
    if input.KeyCode == Enum.KeyCode.Space then moveState.Up = true end
    if input.KeyCode == Enum.KeyCode.LeftShift then moveState.Down = true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then moveState.Forward = false end
    if input.KeyCode == Enum.KeyCode.S then moveState.Backward = false end
    if input.KeyCode == Enum.KeyCode.A then moveState.Left = false end
    if input.KeyCode == Enum.KeyCode.D then moveState.Right = false end
    if input.KeyCode == Enum.KeyCode.Space then moveState.Up = false end
    if input.KeyCode == Enum.KeyCode.LeftShift then moveState.Down = false end
end)

function stopFly()
    pcFlyEnabled = false; mobileFlyEnabled = false; resetMoveState()
    pcall(function()
        if flyBodyVel then flyBodyVel:Destroy() flyBodyVel = nil end
        if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end)
end

function startFly(isMobile)
    local char = LocalPlayer.Character; if not char then return end
    local hrp, hum = char:FindFirstChild("HumanoidRootPart"), char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    stopFly()
    
    if isMobile then mobileFlyEnabled = true else pcFlyEnabled = true end
    hum.PlatformStand = true
    pcall(function()
        flyBodyGyro = Instance.new("BodyGyro", hrp); flyBodyGyro.P, flyBodyGyro.maxTorque = 9e4, Vector3.new(9e9, 9e9, 9e9)
        flyBodyVel = Instance.new("BodyVelocity", hrp); flyBodyVel.velocity, flyBodyVel.maxForce = Vector3.new(0, 0, 0), Vector3.new(9e9, 9e9, 9e9)
    end)
end

local function getVehicleRoot()
    local vehicleFolder = Workspace:FindFirstChild("VehicleFolder")
    local camSubject = camera.CameraSubject
    if camSubject and vehicleFolder and camSubject:IsDescendantOf(vehicleFolder) then
        if camSubject:IsA("BasePart") then return camSubject.AssemblyRootPart or camSubject end
        if camSubject:IsA("Model") and camSubject.PrimaryPart then return camSubject.PrimaryPart.AssemblyRootPart or camSubject.PrimaryPart end
    end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum and hum.SeatPart then return hum.SeatPart.AssemblyRootPart or hum.SeatPart end
    return nil
end

local function GetTargetInFOV(fovRadius, targetPartName)
    local target, shortestDistance = nil, fovRadius
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild(targetPartName) then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local part = p.Character[targetPartName]
                local pos, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - (camera.ViewportSize / 2)).Magnitude
                    if dist <= shortestDistance then
                        shortestDistance = dist
                        target = part
                    end
                end
            end
        end
    end
    return target
end

local function ExecuteShot(targetPart)
    if targetPart then
        local tPos = targetPart.Position
        local dir = (tPos - camera.CFrame.Position).Unit
        local events = ReplicatedStorage:FindFirstChild("shared/network@GlobalEvents")
        if events then
            if events:FindFirstChild("UpdateUpperBodyPitch") then events.UpdateUpperBodyPitch:FireServer(11, math.asin(dir.Y)) end
            if events:FindFirstChild("GunShoot") then events.GunShoot:FireServer(tPos, dir, 1787948593.0831) end
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    local key = input.KeyCode
    if not key then return end
    local keyName = key.Name
    if vehicleKeybind ~= "None" and keyName == vehicleKeybind then pcVFlyEnabled = not pcVFlyEnabled end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.UserInputType == Enum.UserInputType.MouseButton1 and silentAimConfig.Enabled and not silentAimConfig.AutoShoot then
        local targetPart = GetTargetInFOV(silentAimConfig.FOVRadius, "Head")
        if targetPart then ExecuteShot(targetPart) end
    end
end)

RunService.Stepped:Connect(function()
    if noclipEnabled then
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local camCF = camera.CFrame
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    
    if pcFlyEnabled or mobileFlyEnabled then
        local moveVector = Vector3.new(0, 0, 0)
        if pcFlyEnabled then
            if moveState.Forward then moveVector = moveVector + camCF.LookVector end
            if moveState.Backward then moveVector = moveVector - camCF.LookVector end
            if moveState.Right then moveVector = moveVector + camCF.RightVector end
            if moveState.Left then moveVector = moveVector - camCF.RightVector end
            if moveState.Up then moveVector = moveVector + Vector3.new(0, 1, 0) end
            if moveState.Down then moveVector = moveVector - Vector3.new(0, 1, 0) end
        elseif mobileFlyEnabled and hum then
            local moveDir = hum.MoveDirection
            if moveDir.Magnitude > 0 then
                local flatLook = (camCF.LookVector * Vector3.new(1,0,1)).Unit
                local flatRight = (camCF.RightVector * Vector3.new(1,0,1)).Unit
                moveVector = (camCF.LookVector * moveDir.Unit:Dot(flatLook)) + (camCF.RightVector * moveDir.Unit:Dot(flatRight))
            end
            if mobileUp then moveVector = moveVector + Vector3.new(0, 1, 0) end
            if mobileDown then moveVector = moveVector - Vector3.new(0, 1, 0) end
            if mobileForward then moveVector = moveVector + camCF.LookVector end
            if mobileBackward then moveVector = moveVector - camCF.LookVector end
        end
        if flyBodyVel and flyBodyGyro then
            flyBodyGyro.cframe = camCF
            flyBodyVel.velocity = moveVector.Magnitude > 0.05 and moveVector.Unit * flySpeed or Vector3.new(0, 0, 0)
        end
    end

    if pcVFlyEnabled or mobileVFlyEnabled then
        local vehRoot = getVehicleRoot()
        if vehRoot then
            if vehRoot ~= lastVehRoot then
                if activeVBodyVel then activeVBodyVel:Destroy() end; if activeVBodyGyro then activeVBodyGyro:Destroy() end
                activeVBodyGyro = Instance.new("BodyGyro"); activeVBodyGyro.P = 15000; activeVBodyGyro.D = 1000
                activeVBodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9); activeVBodyGyro.Parent = vehRoot
                activeVBodyVel = Instance.new("BodyVelocity"); activeVBodyVel.velocity = Vector3.new(0, 0, 0)
                activeVBodyVel.maxForce = Vector3.new(9e9, 9e9, 9e9); activeVBodyVel.Parent = vehRoot
                lastVehRoot = vehRoot
            end

            local moveVector = Vector3.new(0, 0, 0)
            activeVBodyGyro.cframe = camCF
            
            if pcVFlyEnabled then
                if moveState.Forward then moveVector = moveVector + camCF.LookVector end
                if moveState.Backward then moveVector = moveVector - camCF.LookVector end
                if moveState.Right then moveVector = moveVector + camCF.RightVector end
                if moveState.Left then moveVector = moveVector - camCF.LeftVector end
                if moveState.Up then moveVector = moveVector + Vector3.new(0, 1, 0) end
                if moveState.Down then moveVector = moveVector - Vector3.new(0, 1, 0) end
            elseif mobileVFlyEnabled then
                if mobileForward then moveVector = moveVector + camCF.LookVector end
                if mobileBackward then moveVector = moveVector - camCF.LookVector end
                if mobileUp then moveVector = moveVector + Vector3.new(0, 1, 0) end
                if mobileDown then moveVector = moveVector - Vector3.new(0, 1, 0) end
            end

            if moveVector.Magnitude > 0.05 then
                activeVBodyVel.velocity = moveVector.Unit * vFlySpeed
            else
                activeVBodyVel.velocity = Vector3.new(0, 0, 0)
                pcall(function() vehRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0); vehRoot.AssemblyAngularVelocity = Vector3.new(0, 0, 0) end)
            end
        else
            if activeVBodyVel then activeVBodyVel:Destroy(); activeVBodyVel = nil end; if activeVBodyGyro then activeVBodyGyro:Destroy(); activeVBodyGyro = nil end
            lastVehRoot = nil
        end
    else
        if activeVBodyVel then activeVBodyVel:Destroy(); activeVBodyVel = nil end; if activeVBodyGyro then activeVBodyGyro:Destroy(); activeVBodyGyro = nil end
        lastVehRoot = nil
    end

    if hum and hum.Health > 0 then
        if walkSpeedEnabled then pcall(function() hum.WalkSpeed = walkSpeedVal end)
        else pcall(function() hum.WalkSpeed = 16 end) end
        if jumpPowerEnabled then pcall(function() hum.UseJumpPower = true; hum.JumpPower = jumpPowerVal end)
        else pcall(function() hum.UseJumpPower = true; hum.JumpPower = 50 end) end
    end

    aimbotOverlay.Position = camera.ViewportSize / 2
    aimbotOverlay.Radius = aimbotConfig.FOVRadius
    aimbotOverlay.Visible = aimbotConfig.ShowFOV and aimbotConfig.Enabled
    aimbotOverlay.Color = aimbotConfig.Enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    local shouldAim = false
    if aimbotConfig.Enabled then
        if aimbotLockMode == "Always" then
            shouldAim = true
        else
            if mobileAiming or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then shouldAim = true end
        end
    end

    if shouldAim then
        local targetPart = GetTargetInFOV(aimbotConfig.FOVRadius, aimbotConfig.TargetPart)
        if targetPart then
            local targetCF = CFrame.new(camera.CFrame.Position, targetPart.Position)
            camera.CFrame = camera.CFrame:Lerp(targetCF, aimbotConfig.Smoothness)
        end
    end

    silentOverlay.Position = camera.ViewportSize / 2
    silentOverlay.Radius = silentAimConfig.FOVRadius
    silentOverlay.Visible = silentAimConfig.ShowFOV and silentAimConfig.Enabled
    silentOverlay.Color = silentAimConfig.Enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    if silentAimConfig.Enabled then
        local canShoot = (tick() - lastShotTime >= silentAimConfig.Cooldown)
        if canShoot then
            if silentAimConfig.AutoShoot or mobileShooting then
                local targetPart = GetTargetInFOV(silentAimConfig.FOVRadius, "Head")
                if targetPart then ExecuteShot(targetPart); lastShotTime = tick() end
            end
        end
    end
end)

local espSettings = { Master = false, Tracers = true, Name = true, Job = true, Health = true, HPBar = true, Wanted = true }

local function getCustomJobName(player)
    if not player or not player.Team then return "Buerger" end
    local name = string.lower(player.Team.Name or "")
    local color = player.Team.TeamColor and player.Team.TeamColor.Color or Color3.fromRGB(255, 255, 255)
    
    if string.find(name, "poliz") or string.find(name, "police") or string.find(name, "cop") or string.find(name, "sheriff") or string.find(name, "sek") then return "Polizei"
    elseif string.find(name, "feuer") or string.find(name, "fire") then return "Feuerwehr"
    elseif string.find(name, "sanit") or string.find(name, "sani") or string.find(name, "kranken") or string.find(name, "medic") or string.find(name, "arzt") or string.find(name, "rettung") then return "Krankenwagen"
    elseif string.find(name, "adac") or string.find(name, "abschlep") or string.find(name, "mechanic") or string.find(name, "tow") or string.find(name, "pannenhilfe") then return "ADAC"
    elseif string.find(name, "stadtreinigung") or string.find(name, "reinigung") or string.find(name, "muell") or string.find(name, "trash") then return "Stadtreinigung"
    elseif string.find(name, "prison") or string.find(name, "gefangen") or string.find(name, "knast") then return "Gefangener"
    elseif string.find(name, "buerger") or string.find(name, "zivil") or string.find(name, "citizen") then return "Buerger" end
    
    local r, g, b = color.R, color.G, color.B
    if r > 0.8 and g > 0.8 and b > 0.8 then return "Buerger"
    elseif b > r and b > g then return "Polizei"
    elseif r > g and r > b and g < 0.4 then return "Feuerwehr"
    elseif r > 0.7 and g > 0.6 and b < 0.3 then return "ADAC"
    elseif r > 0.25 and r < 0.65 and g > 0.1 and g < 0.45 and b < 0.3 then return "Stadtreinigung"
    elseif g > r and g > b then return "Gefangener" end
    return player.Team.Name
end

local tracers, labels, hpBars, hpBarBgs = {}, {}, {}, {}

local function createESP(player)
    if player == LocalPlayer or tracers[player] then return end
    pcall(function()
        local line = Drawing.new("Line")
        line.Thickness = 1.5; line.Transparency = 1; line.Color = Color3.fromRGB(255, 255, 255); line.Visible = false
        tracers[player] = line

        local text = Drawing.new("Text")
        text.Size = 16; text.Center = true; text.Outline = true; text.OutlineColor = Color3.fromRGB(0, 0, 0)
        text.Color = Color3.fromRGB(255, 255, 255); text.Visible = false
        labels[player] = text

        local hpBg = Drawing.new("Line")
        hpBg.Thickness = 4; hpBg.Color = Color3.fromRGB(0, 0, 0); hpBg.Transparency = 1; hpBg.Visible = false
        hpBarBgs[player] = hpBg

        local hpBar = Drawing.new("Line")
        hpBar.Thickness = 2; hpBar.Transparency = 1; hpBar.Visible = false
        hpBars[player] = hpBar
    end)
end

local function removeESP(player)
    pcall(function()
        if tracers[player] then tracers[player]:Destroy() tracers[player] = nil end
        if labels[player] then labels[player]:Destroy() labels[player] = nil end
        if hpBarBgs[player] then hpBarBgs[player]:Destroy() hpBarBgs[player] = nil end
        if hpBars[player] then hpBars[player]:Destroy() hpBars[player] = nil end
    end)
end

Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)
for _, p in ipairs(Players:GetPlayers()) do createESP(p) end

RunService.RenderStepped:Connect(function()
    local vpSize = camera.ViewportSize
    local topCenter = Vector2.new(vpSize.X / 2, 0)
    
    for player, line in pairs(tracers) do
        local label = labels[player]
        local hpBg = hpBarBgs[player]
        local hpBar = hpBars[player]
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        
        if espSettings.Master and hrp and hum and hum.Health > 0 then
            local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local teamColor = player.Team and player.Team.TeamColor.Color or Color3.fromRGB(255, 255, 255)
                local health = hum.Health
                local maxHealth = hum.MaxHealth
                local healthPct = math.clamp(health / math.max(maxHealth, 1), 0, 1)

                if espSettings.Tracers and line then
                    line.From = topCenter; line.To = Vector2.new(screenPos.X, screenPos.Y)
                    line.Color = teamColor; line.Visible = true
                elseif line then line.Visible = false end

                if espSettings.HPBar then
                    local barHeight = 40
                    local barX = screenPos.X - 30 
                    local barYStart = screenPos.Y + (barHeight / 2)
                    local barYEnd = screenPos.Y - (barHeight / 2)

                    if hpBg then hpBg.From = Vector2.new(barX, barYStart); hpBg.To = Vector2.new(barX, barYEnd); hpBg.Visible = true end
                    if hpBar then hpBar.From = Vector2.new(barX, barYStart); hpBar.To = Vector2.new(barX, barYStart - (barHeight * healthPct))
                        hpBar.Color = Color3.fromHSV(healthPct * 0.3, 1, 1); hpBar.Visible = true
                    end
                else
                    if hpBg then hpBg.Visible = false end; if hpBar then hpBar.Visible = false end
                end

                if label then
                    local textComponents = {}
                    local textCustomColor = teamColor

                    if espSettings.Name then table.insert(textComponents, player.DisplayName) end
                    if espSettings.Job then table.insert(textComponents, "[" .. getCustomJobName(player) .. "]") end
                    
                    if espSettings.Wanted then
                        local isWanted, wantedLevel = checkWantedStatus(player)
                        if isWanted then
                            table.insert(textComponents, "\n[WANTED Level " .. wantedLevel .. "]")
                            textCustomColor = Color3.fromRGB(255, 128, 0)
                        end
                    end

                    if espSettings.Health then
                        if health <= 1.1 then table.insert(textComponents, "| 1 HP!"); textCustomColor = Color3.fromRGB(255, 0, 0) 
                        elseif health <= 15 then table.insert(textComponents, "| LOW HP (" .. math.floor(health) .. ")"); textCustomColor = Color3.fromRGB(255, 100, 0)
                        else table.insert(textComponents, "| " .. math.floor(health) .. " HP") end
                    end

                    if #textComponents > 0 then
                        label.Text = table.concat(textComponents, " ")
                        label.Position = Vector2.new(screenPos.X, screenPos.Y + 12)
                        label.Color = textCustomColor
                        label.Visible = true
                    else label.Visible = false end
                end
            else
                if line then line.Visible = false end; if label then label.Visible = false end
                if hpBg then hpBg.Visible = false end; if hpBar then hpBar.Visible = false end
            end
        else
            if line then line.Visible = false end; if label then label.Visible = false end
            if hpBg then hpBg.Visible = false end; if hpBar then hpBar.Visible = false end
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if showPhoneApp then
        pcall(function()
            local phoneApps = LocalPlayer.PlayerGui:FindFirstChild("App")
            if phoneApps then
                local appsGrid = phoneApps.Content.Phone.Display.App.Content.AppHome.Apps
                local phoneDisplay = phoneApps.Content.Phone.Display
                
                if appsGrid and not appsGrid:FindFirstChild("NightSystemApp") then
                    
                    if not customAppButton then
                        customAppButton = Instance.new("TextButton")
                        customAppButton.Name = "NightSystemApp"
                        customAppButton.Size = UDim2.new(0, 36, 0, 36)
                        customAppButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                        customAppButton.LayoutOrder = 99999
                        customAppButton.Text = "NIGHT\nSYSTEM"
                        customAppButton.TextScaled = false
                        customAppButton.TextSize = 8
                        customAppButton.TextColor3 = Color3.fromRGB(0, 140, 255)
                        customAppButton.Font = Enum.Font.GothamBlack
                        
                        local corner = Instance.new("UICorner", customAppButton)
                        corner.CornerRadius = UDim.new(0.2, 0)
                        
                        local stroke = Instance.new("UIStroke", customAppButton)
                        stroke.Color = Color3.fromRGB(0, 140, 255)
                        stroke.Thickness = 1

                        customAppInterface = Instance.new("Frame")
                        customAppInterface.Name = "NightSystemInterface"
                        customAppInterface.Size = UDim2.new(0.85, 0, 0.85, 0)
                        customAppInterface.Position = UDim2.new(0.075, 0, 0.075, 0)
                        customAppInterface.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                        customAppInterface.ZIndex = 50
                        customAppInterface.Visible = false
                        
                        local intCorner = Instance.new("UICorner", customAppInterface)
                        intCorner.CornerRadius = UDim.new(0, 8)
                        
                        local intStroke = Instance.new("UIStroke", customAppInterface)
                        intStroke.Color = Color3.fromRGB(0, 140, 255)
                        intStroke.Thickness = 1.5
                        
                        local header = Instance.new("Frame", customAppInterface)
                        header.Size = UDim2.new(1, 0, 0, 25)
                        header.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                        header.ZIndex = 51
                        
                        local headCorner = Instance.new("UICorner", header)
                        headCorner.CornerRadius = UDim.new(0, 8)
                        
                        local title = Instance.new("TextLabel", header)
                        title.Size = UDim2.new(1, -30, 1, 0)
                        title.Position = UDim2.new(0, 10, 0, 0)
                        title.Text = "Night System"
                        title.TextColor3 = Color3.fromRGB(0, 140, 255)
                        title.Font = Enum.Font.GothamBold
                        title.TextSize = 10
                        title.TextXAlignment = Enum.TextXAlignment.Left
                        title.BackgroundTransparency = 1
                        title.ZIndex = 52
                        
                        local closeBtn = Instance.new("TextButton", header)
                        closeBtn.Size = UDim2.new(0, 25, 0, 25)
                        closeBtn.Position = UDim2.new(1, -25, 0, 0)
                        closeBtn.Text = "X"
                        closeBtn.TextColor3 = Color3.fromRGB(200, 50, 50)
                        closeBtn.BackgroundTransparency = 1
                        closeBtn.Font = Enum.Font.GothamBold
                        closeBtn.TextSize = 10
                        closeBtn.ZIndex = 52
                        
                        closeBtn.MouseButton1Click:Connect(function()
                            customAppInterface.Visible = false
                        end)
                        
                        local scroll = Instance.new("ScrollingFrame", customAppInterface)
                        scroll.Size = UDim2.new(1, 0, 1, -45)
                        scroll.Position = UDim2.new(0, 0, 0, 25)
                        scroll.BackgroundTransparency = 1
                        scroll.CanvasSize = UDim2.new(0, 0, 0, 280)
                        scroll.ScrollBarThickness = 2
                        scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 140, 255)
                        scroll.ZIndex = 51
                        
                        local listLayout = Instance.new("UIListLayout", scroll)
                        listLayout.Padding = UDim.new(0, 4)
                        listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
                        
                        local pad = Instance.new("UIPadding", scroll)
                        pad.PaddingTop = UDim.new(0, 4)
                        
                        local features = {
                            "ESP:\nZeigt Spieler, Jobs, Health & Wanted-Level.",
                            "Aimbot & Silent Aim:\nPerfektes Auto-Targeting.",
                            "Fly Modus:\nPlayer- und Vehicle-Fly (PC & Mobile).",
                            "Polizei:\nAutomatisches Tasern und Cuffen.",
                            "Auto-Boost:\nSpeed Multiplier und Instant-Boost.",
                            "Player Stats:\nCustom WalkSpeed und JumpPower.",
                            "Mobile UI:\nDrag-and-Drop Overlay fuer Handy."
                        }
                        
                        for i, text in ipairs(features) do
                            local lbl = Instance.new("TextLabel", scroll)
                            lbl.Size = UDim2.new(0.92, 0, 0, 32)
                            lbl.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            lbl.Text = text
                            lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
                            lbl.Font = Enum.Font.GothamMedium
                            lbl.TextSize = 9
                            lbl.TextWrapped = true
                            lbl.LayoutOrder = i
                            lbl.ZIndex = 52
                            Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 4)
                        end
                        
                        local footer = Instance.new("TextLabel", customAppInterface)
                        footer.Size = UDim2.new(1, 0, 0, 20)
                        footer.Position = UDim2.new(0, 0, 1, -20)
                        footer.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                        footer.Text = "Development by Maxi | Night System"
                        footer.TextColor3 = Color3.fromRGB(100, 100, 100)
                        footer.Font = Enum.Font.Gotham
                        footer.TextSize = 8
                        footer.ZIndex = 52
                        
                        local footCorner = Instance.new("UICorner", footer)
                        footCorner.CornerRadius = UDim.new(0, 8)
                        
                        local footBlock = Instance.new("Frame", footer)
                        footBlock.Size = UDim2.new(1, 0, 0, 8)
                        footBlock.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                        footBlock.BorderSizePixel = 0
                        footBlock.ZIndex = 51
                        
                        customAppButton.MouseButton1Click:Connect(function()
                            if phoneDisplay then
                                customAppInterface.Parent = phoneDisplay
                                customAppInterface.Visible = true
                            end
                        end)
                    end
                    
                    customAppButton.Parent = appsGrid
                end
            end
        end)
    end

    local myChar = LocalPlayer.Character
    local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar.PrimaryPart)
    if not myRoot then return end

    local events = ReplicatedStorage:FindFirstChild("shared/network@GlobalEvents")
    
    if autoTaserConfig.Enabled and tick() - autoTaserConfig.LastFired >= 0.1 then 
        local taserEvent = events and events:FindFirstChild("TaserFire")
        if taserEvent then
            for _, player in ipairs(Players:GetPlayers()) do
                if player == LocalPlayer then continue end
                if checkWantedStatus(player) then
                    local char = player.Character
                    local targetRoot = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    
                    if targetRoot and hum and hum.Health > 0 then
                        if (targetRoot.Position - myRoot.Position).Magnitude <= 50 then
                            local tPos = targetRoot.Position
                            local dir = (tPos - camera.CFrame.Position).Unit
                            pcall(function() taserEvent:FireServer(tPos, dir) end)
                            autoTaserConfig.LastFired = tick()
                            break 
                        end
                    end
                end
            end
        end
    end

    if autoCuffConfig.Enabled and tick() - autoCuffConfig.LastFired >= 1 then
        local hasHandcuffs = myChar:FindFirstChild("Handcuffs")
        
        if hasHandcuffs then
            for _, player in ipairs(Players:GetPlayers()) do
                if player == LocalPlayer then continue end
                
                if checkWantedStatus(player) then
                    local char = player.Character
                    local targetRoot = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    
                    if targetRoot and hum and hum.Health > 0 then
                        if (targetRoot.Position - myRoot.Position).Magnitude <= 50 then
                            
                            if events then
                                pcall(function()
                                    if events:FindFirstChild("HandcuffPlayer") then events.HandcuffPlayer:FireServer(player) end
                                    if events:FindFirstChild("Cuff") then events.Cuff:FireServer(player) end
                                end)
                            end
                            
                            for _, desc in ipairs(char:GetDescendants()) do
                                if desc:IsA("ProximityPrompt") then
                                    pcall(function() fireproximityprompt(desc, 1, true) end)
                                end
                            end
                            
                            autoCuffConfig.LastFired = tick()
                            break
                        end
                        
                    end
                end
            end
        end
    end
end)

AimbotTab:AddSection({ Name = "Main Configurations" })
AimbotTab:AddToggle({Name = "Aimbot", Default = false, Callback = function(v) aimbotConfig.Enabled = v end})
AimbotTab:AddDropdown({Name = "Target Part", Default = "Head", Options = {"Head", "HumanoidRootPart"}, Callback = function(v) aimbotConfig.TargetPart = v end})
AimbotTab:AddSlider({Name = "Smoothness", Min = 0.05, Max = 1, Default = 0.2, Color = Color3.fromRGB(255, 255, 255), Increment = 0.05, ValueName = "Smooth", Callback = function(v) aimbotConfig.Smoothness = v end})

AimbotTab:AddSection({ Name = "Field of View (FOV)" })
AimbotTab:AddToggle({Name = "Show FOV Circle", Default = false, Callback = function(v) aimbotConfig.ShowFOV = v end})
AimbotTab:AddSlider({Name = "FOV Radius", Min = 20, Max = 600, Default = 150, Color = Color3.fromRGB(255, 255, 255), Increment = 10, ValueName = "Radius", Callback = function(v) aimbotConfig.FOVRadius = v end})

SilentAimTab:AddSection({ Name = "Main Configurations" })
SilentAimTab:AddToggle({Name = "Silent Aim", Default = false, Callback = function(v) silentAimConfig.Enabled = v end})
SilentAimTab:AddToggle({Name = "Auto-Fire", Default = false, Callback = function(v) silentAimConfig.AutoShoot = v end})
SilentAimTab:AddSlider({Name = "Shot Cooldown", Min = 0.1, Max = 2, Default = 0.5, Color = Color3.fromRGB(255, 255, 255), Increment = 0.1, ValueName = "Sec", Callback = function(v) silentAimConfig.Cooldown = v end})

SilentAimTab:AddSection({ Name = "Field of View (FOV)" })
SilentAimTab:AddToggle({Name = "Show FOV Circle", Default = false, Callback = function(v) silentAimConfig.ShowFOV = v end})
SilentAimTab:AddSlider({Name = "FOV Radius", Min = 20, Max = 600, Default = 150, Color = Color3.fromRGB(255, 255, 255), Increment = 10, ValueName = "Radius", Callback = function(v) silentAimConfig.FOVRadius = v end})

VisualsTab:AddSection({ Name = "Master Controls" })
VisualsTab:AddToggle({Name = "ESP", Default = false, Callback = function(v) espSettings.Master = v end})

VisualsTab:AddSection({ Name = "ESP Settings" })
VisualsTab:AddToggle({Name = "Tracers", Default = true, Callback = function(v) espSettings.Tracers = v end})
VisualsTab:AddToggle({Name = "Names", Default = true, Callback = function(v) espSettings.Name = v end})
VisualsTab:AddToggle({Name = "Jobs", Default = true, Callback = function(v) espSettings.Job = v end})
VisualsTab:AddToggle({Name = "Wanted Status", Default = true, Callback = function(v) espSettings.Wanted = v end})
VisualsTab:AddToggle({Name = "Health", Default = true, Callback = function(v) espSettings.Health = v end})
VisualsTab:AddToggle({Name = "Health Bars", Default = true, Callback = function(v) espSettings.HPBar = v end})

PlayerTab:AddSection({ Name = "Character Actions" })
PlayerTab:AddButton({
    Name = "Respawn",
    Callback = function()
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid").Health = 0
            end
        end)
    end
})

PlayerTab:AddSection({ Name = "Movement Mods" })
PlayerTab:AddToggle({Name = "Speed", Default = false, Callback = function(v) walkSpeedEnabled = v end})
PlayerTab:AddSlider({Name = "Speed Value", Min = 16, Max = 250, Default = 16, Color = Color3.fromRGB(255, 255, 255), Increment = 1, ValueName = "Speed", Callback = function(v) walkSpeedVal = v end})
PlayerTab:AddToggle({Name = "Jump", Default = false, Callback = function(v) jumpPowerEnabled = v end})
PlayerTab:AddSlider({Name = "Jump Power", Min = 50, Max = 300, Default = 50, Color = Color3.fromRGB(255, 255, 255), Increment = 1, ValueName = "Power", Callback = function(v) jumpPowerVal = v end})

PlayerTab:AddSection({ Name = "Flight & Physics" })
PlayerTab:AddToggle({Name = "Noclip", Default = false, Callback = function(v) noclipEnabled = v end})
PlayerTab:AddToggle({Name = "Fly", Default = false, Callback = function(v) if v then startFly(false) else stopFly() end end})
PlayerTab:AddSlider({Name = "Fly Speed", Min = 10, Max = 300, Default = 50, Color = Color3.fromRGB(255, 255, 255), Increment = 1, ValueName = "Speed", Callback = function(v) flySpeed = v end})

PlayerTab:AddSection({ Name = "Teleportation" })
local selectedPlayerToTp = nil
local function getPlayerList()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then table.insert(names, p.DisplayName .. " (@" .. p.Name .. ")") end end
    if #names == 0 then table.insert(names, "No Players Found") end
    return names
end
local tpDropdown = PlayerTab:AddDropdown({Name = "Select Player", Default = getPlayerList()[1], Options = getPlayerList(), Callback = function(v) selectedPlayerToTp = v end})
local function refreshPlayersSafely() pcall(function() if tpDropdown and tpDropdown.Refresh then tpDropdown:Refresh(getPlayerList(), true) end end) end
Players.PlayerAdded:Connect(refreshPlayersSafely); Players.PlayerRemoving:Connect(refreshPlayersSafely)

PlayerTab:AddButton({Name = "Teleport", Callback = function()
    if not selectedPlayerToTp or selectedPlayerToTp == "No Players Found" then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p.DisplayName .. " (@" .. p.Name .. ")" == selectedPlayerToTp then
            local targetChar, myChar = p.Character, LocalPlayer.Character
            if targetChar and myChar and targetChar:FindFirstChild("HumanoidRootPart") and myChar:FindFirstChild("HumanoidRootPart") then
                pcall(function() myChar:PivotTo(targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)) end)
            end break
        end
    end
end})

VehicleTab:AddSection({ Name = "Vehicle Flight" })
VehicleTab:AddToggle({Name = "Vehicle Fly", Default = false, Callback = function(v) pcVFlyEnabled = v end})
VehicleTab:AddSlider({Name = "Flight Speed", Min = 20, Max = 1000, Default = 100, Color = Color3.fromRGB(255, 255, 255), Increment = 10, ValueName = "Speed", Callback = function(v) vFlySpeed = v end})
VehicleTab:AddDropdown({Name = "Toggle Keybind", Default = "X", Options = getKeyList(), Callback = function(v) vehicleKeybind = v end})
VehicleTab:AddButton({Name = "Exit Vehicle", Callback = function()
    pcall(function()
        local Event = ReplicatedStorage:FindFirstChild("shared/network@GlobalEvents")
        if Event and Event:FindFirstChild("ExitDrivingSeat") then Event.ExitDrivingSeat:FireServer() end
    end)
end})

VehicleTab:AddSection({ Name = "Boost & Acceleration" })
local enableBoosts = true
local vehicleSpeedMultiplier = 1
local instantBoostMultiplier = 2.5
local accelerationMultiplier = 2
local accelerationEnabled = false
local accelerationConnection = nil
local baseBoostSpeed = 50

local function getVehicleAndRoot()
    local root = getVehicleRoot()
    if not root then return nil, nil end
    local vehicle = root:FindFirstAncestorOfClass("Model")
    if not vehicle then return nil, nil end
    return vehicle, root
end

local function triggerBoost()
    if not enableBoosts then return end
    local vehicle, root = getVehicleAndRoot()
    if vehicle and root then
        local lookVector = root.CFrame.LookVector
        root.AssemblyLinearVelocity = root.AssemblyLinearVelocity + (lookVector * (baseBoostSpeed * instantBoostMultiplier))
    end
end

VehicleTab:AddToggle({Name = "Enable Boosts", Default = true, Callback = function(v) enableBoosts = v
    if not v and accelerationEnabled then accelerationEnabled = false
        if accelerationConnection then accelerationConnection:Disconnect() accelerationConnection = nil end
    end
end})
VehicleTab:AddSlider({Name = "Speed Multiplier", Min = 0.5, Max = 5, Increment = 0.1, Default = 1, ValueName = "x", Color = Color3.fromRGB(255, 255, 255), Callback = function(v) vehicleSpeedMultiplier = v end})
VehicleTab:AddButton({Name = "Instant Speed Boost", Callback = triggerBoost})
VehicleTab:AddBind({Name = "Instant Boost Keybind", Default = Enum.KeyCode.F3, Hold = false, Callback = triggerBoost})
VehicleTab:AddSlider({Name = "Instant Boost Strength", Min = 1, Max = 10, Increment = 0.5, Default = 2.5, ValueName = "x", Color = Color3.fromRGB(255, 255, 255), Callback = function(v) instantBoostMultiplier = v end})
VehicleTab:AddToggle({Name = "Acceleration Boost", Default = false, Callback = function(v)
    accelerationEnabled = v
    if v then
        if accelerationConnection then accelerationConnection:Disconnect() end
        accelerationConnection = RunService.Heartbeat:Connect(function()
            if not enableBoosts or not accelerationEnabled then return end
            local vehicle, root = getVehicleAndRoot()
            if not vehicle or not root then return end
            local velocity = root.AssemblyLinearVelocity
            if velocity.Magnitude < 0.1 then return end
            local lookVec = root.CFrame.LookVector
            local isW = UserInputService:IsKeyDown(Enum.KeyCode.W) or UserInputService:IsKeyDown(Enum.KeyCode.Up)
            local isS = UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.Down)
            local moveDir = velocity.Unit:Dot(lookVec)
            if velocity.Magnitude > 1 then
                if isW and moveDir > -0.2 then root.AssemblyLinearVelocity = velocity * (1 + (accelerationMultiplier - 1) * 0.015)
                elseif isS and moveDir < 0.2 then root.AssemblyLinearVelocity = velocity * (1 + (accelerationMultiplier - 1) * 0.015) end
            end
            if (isS and moveDir > 0.3) or (isW and moveDir < -0.3) then root.AssemblyLinearVelocity = velocity * 0.94 end
        end)
    else
        if accelerationConnection then accelerationConnection:Disconnect() accelerationConnection = nil end
    end
end})
VehicleTab:AddSlider({Name = "Acceleration Multiplier", Min = 1, Max = 5, Increment = 0.1, Default = 2, ValueName = "x", Color = Color3.fromRGB(255, 255, 255), Callback = function(v) accelerationMultiplier = v end})

PoliceTab:AddSection({ Name = "Automatische Erkennung" })
PoliceTab:AddToggle({Name = "Auto Taser (Wanted)", Default = false, Callback = function(v) autoTaserConfig.Enabled = v end})
PoliceTab:AddToggle({Name = "Auto Cuff (Wanted)", Default = false, Callback = function(v) autoCuffConfig.Enabled = v end})

PoliceTab:AddSection({ Name = "Job Teleport Einstellungen" })
PoliceTab:AddDropdown({Name = "Teleport Modus", Default = "Bei Job-Koordinaten bleiben", Options = {"Bei Job-Koordinaten bleiben", "Zurück-Teleportieren (Ursprung)"}, Callback = function(v) jobTeleportMode = v end})

PoliceTab:AddSection({ Name = "Job Aktionen" })
PoliceTab:AddButton({
    Name = "Job Ausrüsten (Start Job)",
    Callback = function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local oldCFrame = hrp and hrp.CFrame
        if hrp then hrp.CFrame = CFrame.new(targetJobCoords) end
        task.wait(0.2)
        pcall(function()
            local events = ReplicatedStorage:FindFirstChild("shared/network@GlobalEvents")
            if events and events:FindFirstChild("StartJob") then events.StartJob:FireServer(3, 1) end
        end)
        if jobTeleportMode == "Zurück-Teleportieren (Ursprung)" and oldCFrame and hrp then task.wait(0.3) hrp.CFrame = oldCFrame end
    end
})
PoliceTab:AddButton({
    Name = "Job Beenden (Quit Job)",
    Callback = function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local oldCFrame = hrp and hrp.CFrame
        if hrp then hrp.CFrame = CFrame.new(targetJobCoords) end
        task.wait(0.2)
        pcall(function()
            local events = ReplicatedStorage:FindFirstChild("shared/network@GlobalEvents")
            if events and events:FindFirstChild("QuitJob") then events.QuitJob:FireServer() end
        end)
        if jobTeleportMode == "Zurück-Teleportieren (Ursprung)" and oldCFrame and hrp then task.wait(0.3) hrp.CFrame = oldCFrame end
    end
})

PhoneTab:AddSection({ Name = "App Injection" })
PhoneTab:AddToggle({
    Name = "Night System App injizieren",
    Default = false,
    Callback = function(v)
        showPhoneApp = v
        if not v then
            if customAppButton then customAppButton.Parent = nil end
            if customAppInterface then 
                customAppInterface.Parent = nil 
                customAppInterface.Visible = false 
            end
        end
    end
})

MobileUITab:AddSection({ Name = "Overlay Controls" })
MobileUITab:AddToggle({Name = "Show Mobile UI", Default = true, Callback = function(v) MobileUI.Enabled = v end})

NightUI:Init()