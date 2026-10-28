
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Arsenal Hack")

local VisualsSection = Window:NewSection("Visuals")
local MiscSection = Window:NewSection("Misc")
local AimbotSection = Window:NewSection("Aimbot")
local GunModsSection = Window:NewSection("Gun Mods")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local espEnabled = false
local espConnection
local drawLinesEnabled = false
local lines = {}
local tracerConnection

local function createHollowBox()
    local box = Instance.new("BillboardGui")
    box.Size = UDim2.new(4, 0, 5, 0)
    box.AlwaysOnTop = true
    box.Adornee = nil
    box.Name = "PlayerBox"

    local borderThickness = 0.05

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, borderThickness, 0)
    top.Position = UDim2.new(0, 0, 0, 0)
    top.BackgroundColor3 = Color3.new(1, 0, 0)
    top.BorderSizePixel = 0
    top.Parent = box

    local bottom = Instance.new("Frame")
    bottom.Size = UDim2.new(1, 0, borderThickness, 0)
    bottom.Position = UDim2.new(0, 0, 1 - borderThickness, 0)
    bottom.BackgroundColor3 = Color3.new(1, 0, 0)
    bottom.BorderSizePixel = 0
    bottom.Parent = box

    local left = Instance.new("Frame")
    left.Size = UDim2.new(borderThickness, 0, 1, 0)
    left.Position = UDim2.new(0, 0, 0, 0)
    left.BackgroundColor3 = Color3.new(1, 0, 0)
    left.BorderSizePixel = 0
    left.Parent = box

    local right = Instance.new("Frame")
    right.Size = UDim2.new(borderThickness, 0, 1, 0)
    right.Position = UDim2.new(1 - borderThickness, 0, 0, 0)
    right.BackgroundColor3 = Color3.new(1, 0, 0)
    right.BorderSizePixel = 0
    right.Parent = box

    return box
end

local function isEnemyTeam(player)
    return player.Team ~= LocalPlayer.Team
end

local function highlightAllPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isEnemyTeam(player) then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("PlayerBox") then
                    local box = createHollowBox()
                    box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                    box.Parent = player.Character
                end
            end
        else
            if player.Character and player.Character:FindFirstChild("PlayerBox") then
                player.Character.PlayerBox:Destroy()
            end
        end
    end
end

local function onPlayerRemoving(player)
    if player.Character and player.Character:FindFirstChild("PlayerBox") then
        player.Character.PlayerBox:Destroy()
    end
end

local function toggleESP(state)
    if state then
        espConnection = RunService.RenderStepped:Connect(highlightAllPlayers)
        Players.PlayerRemoving:Connect(onPlayerRemoving)
    else
        if espConnection then
            espConnection:Disconnect()
            espConnection = nil
        end
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("PlayerBox") then
                player.Character.PlayerBox:Destroy()
            end
        end
    end
end

local function createLine()
    local line = Drawing.new("Line")
    line.Visible = true
    line.Thickness = 3
    line.Color = Color3.new(1, 0, 0)
    return line
end

local function updateLines()
    for _, line in ipairs(lines) do
        line.Visible = false
    end

    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local index = 1
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and isEnemyTeam(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local rootPart = character.HumanoidRootPart
            local worldPosition = rootPart.Position
            local screenPosition, onScreen = Camera:WorldToViewportPoint(worldPosition)

            if onScreen then
                local line = lines[index] or createLine()
                line.From = screenCenter
                line.To = Vector2.new(screenPosition.X, screenPosition.Y)
                line.Visible = true

                lines[index] = line
                index = index + 1
            end
        end
    end

    for i = index, #lines do
        lines[i].Visible = false
    end
end

local function cleanupLines()
    for _, line in ipairs(lines) do
        line.Visible = false
        line:Remove()
    end
    lines = {}
end

local function toggleLineDrawing(state)
    if state then
        tracerConnection = RunService.RenderStepped:Connect(updateLines)
    else
        if tracerConnection then
            tracerConnection:Disconnect()
            tracerConnection = nil
        end
        cleanupLines()
    end
end

VisualsSection:CreateToggle("Enemy Boxes", function(state)
    espEnabled = state
    toggleESP(state)
end)

VisualsSection:CreateToggle("Enemy Tracers", function(state)
    drawLinesEnabled = state
    toggleLineDrawing(state)
end)

MiscSection:CreateButton("Strafe/bhop", function()
    local STRAFE_SPEED = 30
    local AIR_MULTIPLIER = 1.5
    local BHOP_POWER = 40

    local player = Players.LocalPlayer
    local mouse = player:GetMouse()

    local moveKeys = {
        W = false,
        A = false,
        S = false,
        D = false,
        Space = false
    }

    local function getChar()
        return player.Character or player.CharacterAdded:Wait()
    end

    local function getRoot()
        local char = getChar()
        return char:FindFirstChild("HumanoidRootPart")
    end

    local function getHumanoid()
        local char = getChar()
        return char:FindFirstChild("Humanoid")
    end

    local function calculateMoveDirection()
        local dir = Vector3.new(0, 0, 0)
        local char = getChar()
        if not char then return dir end
        
        local cf = workspace.CurrentCamera.CFrame
        
        if moveKeys.W then
            dir = dir + cf.LookVector
        end
        if moveKeys.S then
            dir = dir - cf.LookVector
        end
        if moveKeys.A then
            dir = dir - cf.RightVector
        end
        if moveKeys.D then
            dir = dir + cf.RightVector
        end
        
        dir = Vector3.new(dir.X, 0, dir.Z).Unit
        return dir
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.W then
            moveKeys.W = true
        elseif input.KeyCode == Enum.KeyCode.A then
            moveKeys.A = true
        elseif input.KeyCode == Enum.KeyCode.S then
            moveKeys.S = true
        elseif input.KeyCode == Enum.KeyCode.D then
            moveKeys.D = true
        elseif input.KeyCode == Enum.KeyCode.Space then
            moveKeys.Space = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.W then
            moveKeys.W = false
        elseif input.KeyCode == Enum.KeyCode.A then
            moveKeys.A = false
        elseif input.KeyCode == Enum.KeyCode.S then
            moveKeys.S = false
        elseif input.KeyCode == Enum.KeyCode.D then
            moveKeys.D = false
        elseif input.KeyCode == Enum.KeyCode.Space then
            moveKeys.Space = false
        end
    end)

    RunService.Heartbeat:Connect(function()
        local char = getChar()
        local root = getRoot()
        local humanoid = getHumanoid()
        
        if not char or not root or not humanoid then return end
        
        local moveDir = calculateMoveDirection()
        local isInAir = humanoid:GetState() == Enum.HumanoidStateType.Jumping or 
                        humanoid:GetState() == Enum.HumanoidStateType.Freefall
        
        if moveDir.Magnitude > 0 then
            local speed = STRAFE_SPEED
            if isInAir then
                speed = speed * AIR_MULTIPLIER
            end
            
            local newVel = moveDir * speed
            root.Velocity = Vector3.new(
                newVel.X,
                root.Velocity.Y,
                newVel.Z
            )
            
            if moveKeys.Space and root.Velocity.Y < 1 then
                root.Velocity = Vector3.new(
                    root.Velocity.X,
                    BHOP_POWER,
                    root.Velocity.Z
                )
            end
        end
    end)
end)

MiscSection:CreateButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
end)

MiscSection:CreateButton("NoClip(N)", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local noclip = false

    UIS.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.N then
            noclip = not noclip
        end
    end)

    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        else
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and not part.CanCollide then
                    part.CanCollide = true
                end
            end
        end
    end)
end)

local LockedPlayer = nil
local LastKnownPosition = nil
local FieldOfView = 40
local CenterPrioritizationFactor = 0.5
local AimbotEnabled = false

local function isEnemyTeam(player)
    if not LocalPlayer.Team or not player.Team then
        return false
    end
    return LocalPlayer.Team ~= player.Team
end

local function getTargetBodyPart()
    local randomValue = math.random()
    if randomValue <= 0.7 then
        return "UpperTorso"
    else
        return "Head"
    end
end

local function getClosestEnemyPlayerToCrosshair()
    local mousePosition = UserInputService:GetMouseLocation()
    local closestPlayer = nil
    local closestDistance = math.huge
    local cameraPosition = Camera.CFrame.Position
    local cameraForward = Camera.CFrame.LookVector
    local centerOfScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and isEnemyTeam(player) then
            local targetBodyPartName = getTargetBodyPart()
            local bodyPart = player.Character:FindFirstChild(targetBodyPartName)
            
            if bodyPart then
                local screenPosition, onScreen = Camera:WorldToViewportPoint(bodyPart.Position)

                if onScreen then
                    local playerPosition = bodyPart.Position - cameraPosition
                    local angle = math.acos(cameraForward:Dot(playerPosition.Unit)) * (180 / math.pi)

                    if angle <= FieldOfView / 2 then
                        local screenDist = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude
                        local distanceFromCenter = (Vector2.new(screenPosition.X, screenPosition.Y) - centerOfScreen).Magnitude * CenterPrioritizationFactor
                        local distanceToPlayer = (LocalPlayer.Character.Head.Position - bodyPart.Position).Magnitude

                        local weightedScore = screenDist + distanceFromCenter + distanceToPlayer

                        if weightedScore < closestDistance then
                            closestDistance = weightedScore
                            closestPlayer = {player = player, bodyPart = targetBodyPartName}
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function lockCameraOnPlayer(targetData)
    if targetData and targetData.player.Character then
        local bodyPart = targetData.player.Character:FindFirstChild(targetData.bodyPart)
        
        if bodyPart then
            LockedPlayer = targetData.player
            LastKnownPosition = bodyPart.Position

            RunService:BindToRenderStep("LockCamera", Enum.RenderPriority.Camera.Value, function()
                if LockedPlayer and LockedPlayer.Character and isEnemyTeam(LockedPlayer) then
                    local currentBodyPart = LockedPlayer.Character:FindFirstChild(targetData.bodyPart)
                    
                    if currentBodyPart then
                        local targetPosition = currentBodyPart.Position

                        if (targetPosition - LastKnownPosition).Magnitude > 5 then
                            RunService:UnbindFromRenderStep("LockCamera")
                            LockedPlayer = nil
                            LastKnownPosition = nil
                            return
                        end

                        LastKnownPosition = targetPosition
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                    else
                        RunService:UnbindFromRenderStep("LockCamera")
                        LockedPlayer = nil
                        LastKnownPosition = nil
                    end
                else
                    RunService:UnbindFromRenderStep("LockCamera")
                    LockedPlayer = nil
                    LastKnownPosition = nil
                end
            end)
        end
    end
end

AimbotSection:CreateToggle("Aimbot (RCLICK)", function(state)
    AimbotEnabled = state
    if not AimbotEnabled then
        RunService:UnbindFromRenderStep("LockCamera")
        LockedPlayer = nil
        LastKnownPosition = nil
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotEnabled then
        local closestPlayer = getClosestEnemyPlayerToCrosshair()
        lockCameraOnPlayer(closestPlayer)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RunService:UnbindFromRenderStep("LockCamera")
        LockedPlayer = nil
        LastKnownPosition = nil
    end
end)

local isModificationEnabled = false
local modificationCoroutine = nil

local function modifyPlayerParts()
    while isModificationEnabled do
        for _, v in pairs(Players:GetPlayers()) do
            if v.Name ~= LocalPlayer.Name and v.Character then
                local parts = {
                    "RightUpperLeg", 
                    "LeftUpperLeg", 
                    "HeadHB", 
                    "HumanoidRootPart"
                }
                
                for _, partName in ipairs(parts) do
                    local part = v.Character:FindFirstChild(partName)
                    if part then
                        part.CanCollide = false
                        part.Transparency = 10
                        part.Size = Vector3.new(10, 10, 10)
                    end
                end
            end
        end
        wait(1)
    end
    
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name ~= LocalPlayer.Name and v.Character then
            local parts = {
                "RightUpperLeg", 
                "LeftUpperLeg", 
                "HeadHB", 
                "HumanoidRootPart"
            }
            
            for _, partName in ipairs(parts) do
                local part = v.Character:FindFirstChild(partName)
                if part then
                    part.CanCollide = true
                    part.Transparency = 0
                    part.Size = Vector3.new(1, 1, 1)
                end
            end
        end
    end
end

AimbotSection:CreateToggle("Silent Aim", function(state)
    isModificationEnabled = state
    
    if state then
        modificationCoroutine = coroutine.create(modifyPlayerParts)
        coroutine.resume(modificationCoroutine)
    else
        modificationCoroutine = nil
    end
end)

AimbotSection:CreateToggle("TriggerBot", function(state)
    if state then
        getgenv().AutoClickConnection = RunService.RenderStepped:Connect(function()
            local Mouse = LocalPlayer:GetMouse()

            if Mouse.Target and Mouse.Target.Parent then
                local TargetPlayer = Players:GetPlayerFromCharacter(Mouse.Target.Parent)
                
                if TargetPlayer and TargetPlayer ~= LocalPlayer then
                    if not TargetPlayer.Team or TargetPlayer.Team ~= LocalPlayer.Team then
                        mouse1press()
                        wait()
                        mouse1release()
                    end
                end
            end
        end)
    else
        if getgenv().AutoClickConnection then
            getgenv().AutoClickConnection:Disconnect()
        end
    end
end)

GunModsSection:CreateButton("Infinite Ammo", function()
    for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
        for i,c in next, v:GetChildren() do
            for i,x in next, getconnections(c.Changed) do
                x:Disable()
            end
            if c.Name == "Ammo" or c.Name == "StoredAmmo" then
                c.Value = 300
            end
        end
    end
end)

GunModsSection:CreateButton("Infinite Range", function()
    for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
        for i,c in next, v:GetChildren() do
            for i,x in next, getconnections(c.Changed) do
                x:Disable()
            end
            if c.Name == "Range" then
                c.Value = 9e9
            end
        end
    end
end)

GunModsSection:CreateButton("100% Accuracy", function()
    for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
        for i,c in next, v:GetChildren() do
            for i,x in next, getconnections(c.Changed) do
                x:Disable()
            end
            if c.Name == "AReload" or c.Name == "RecoilControl" or c.Name == "EReload" or c.Name == "SReload" or c.Name == "ReloadTime" or c.Name == "EquipTime" or c.Name == "Spread" or c.Name == "MaxSpread" then
                c.Value = 0
            end
        end
    end
end)

GunModsSection:CreateButton("Fire Rate", function()
    for i,v in next, game.ReplicatedStorage.Weapons:GetChildren() do
        for i,c in next, v:GetChildren() do
            for i,x in next, getconnections(c.Changed) do
                x:Disable()
            end
            if c.Name == "FireRate" or c.Name == "BFireRate" then
                c.Value = 0.02
            end
        end
    end
end)

GunModsSection:CreateButton("All Weapons Automatic", function()
    for _, weapon in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
        for _, child in pairs(weapon:GetChildren()) do
            if child:IsA("ModuleScript") then
                local weaponData = require(child)
                if weaponData.Auto == false then
                    weaponData.Auto = true
                end
            end
        end
    end
end)
