

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "FlickFPS"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()
local Window = OrionLib:MakeWindow({Name = "Universal Exploit", HidePremium = false, SaveConfig = false, ConfigFolder = "NightAimbot"})

local Settings = {
    AimbotEnabled = true,
    WallCheck = true,
    FOVEnabled = true,
    FOVRadius = 150,
    TargetPart = "Head",
    TeamCheck = false,
    ESPEnabled = true,
    ESPLine = true,
    ESPHealth = true,
    ESPTeamText = true,
    HitboxEnabled = false,
    HitboxSize = 10,
    FlyEnabled = false,
    FlySpeed = 50,
    CrosshairEnabled = true,
    CrosshairStyle = "Bild: Kreuz (+)",
    CrosshairSize = 8,
    CrosshairGap = 0,
    CrosshairRainbow = true,
    UseTeamColor = false,
    FOVCircleColor = Color3.fromRGB(255, 85, 85),
    ESPLineColor = Color3.fromRGB(255, 255, 255),
    ESPTextColor = Color3.fromRGB(255, 255, 255),
    CrosshairColor = Color3.fromRGB(255, 255, 255),
    
    SilentAimEnabled = true,
    SilentAimFOV = 255,
    SilentAimFOVEnabled = true,
    SilentAimFOVCircleColor = Color3.fromRGB(0, 255, 0),
    TriggerBotEnabled = false,
    TriggerBotDelay = 0
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 60
FOVCircle.Radius = Settings.FOVRadius
FOVCircle.Filled = false
FOVCircle.Color = Settings.FOVCircleColor
FOVCircle.Visible = Settings.FOVEnabled

local SilentFOVCircle = Drawing.new("Circle")
SilentFOVCircle.Thickness = 2
SilentFOVCircle.NumSides = 60
SilentFOVCircle.Radius = Settings.SilentAimFOV
SilentFOVCircle.Filled = false
SilentFOVCircle.Color = Settings.SilentAimFOVCircleColor
SilentFOVCircle.Visible = Settings.SilentAimEnabled

local CH_Pool = { Lines = {}, Circles = {}, Dot = Drawing.new("Circle") }
CH_Pool.Dot.Filled = true
CH_Pool.Dot.Visible = false
for i = 1, 12 do
    CH_Pool.Lines[i] = Drawing.new("Line")
    CH_Pool.Lines[i].Thickness = 2
    CH_Pool.Lines[i].Visible = false
end
for i = 1, 2 do
    CH_Pool.Circles[i] = Drawing.new("Circle")
    CH_Pool.Circles[i].Filled = false
    CH_Pool.Circles[i].Thickness = 1.5
    CH_Pool.Circles[i].NumSides = 30
    CH_Pool.Circles[i].Visible = false
end

local function ClearCrosshair()
    CH_Pool.Dot.Visible = false
    for _, line in pairs(CH_Pool.Lines) do line.Visible = false end
    for _, circle in pairs(CH_Pool.Circles) do circle.Visible = false end
end

local ESP_Table = {}
local function CreateESP(player)
    local esp = {
        Line = Drawing.new("Line"),
        HealthBg = Drawing.new("Line"),
        HealthBar = Drawing.new("Line"),
        TeamText = Drawing.new("Text")
    }
    esp.Line.Thickness = 1.5
    esp.Line.Transparency = 0.8
    esp.HealthBg.Thickness = 4
    esp.HealthBg.Color = Color3.fromRGB(0,0,0)
    esp.HealthBg.Transparency = 1
    esp.HealthBar.Thickness = 2
    esp.HealthBar.Color = Color3.fromRGB(0,255,0)
    esp.HealthBar.Transparency = 1
    esp.TeamText.Size = 13
    esp.TeamText.Center = true
    esp.TeamText.Outline = true
    esp.TeamText.Transparency = 1
    esp.TeamText.Visible = false
    ESP_Table[player] = esp
end
local function RemoveESP(player)
    if ESP_Table[player] then
        for _, drawing in pairs(ESP_Table[player]) do drawing:Remove() end
        ESP_Table[player] = nil
    end
end
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then CreateESP(player) end
end
Players.PlayerAdded:Connect(function(player) if player ~= LocalPlayer then CreateESP(player) end end)
Players.PlayerRemoving:Connect(RemoveESP)

local function IsTeammate(player)
    if not Settings.TeamCheck then return false end
    if player.Team and LocalPlayer.Team then return player.Team == LocalPlayer.Team end
    return false
end

local function isPartVisible(part, character)
    if not Settings.WallCheck then return true end
    local origin = Camera.CFrame.Position
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    raycastParams.IgnoreWater = true
    
    local result = workspace:Raycast(origin, part.Position - origin, raycastParams)
    if result and result.Instance then
        return result.Instance:IsDescendantOf(character)
    end
    return true
end

local function getClosestPlayerToCursor()
    local mousePos = UserInputService:GetMouseLocation()
    local closestPart = nil
    local closestScreenDist = Settings.FOVRadius

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not IsTeammate(player) and player.Character then
            local part = player.Character:FindFirstChild(Settings.TargetPart)
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if part and hum and hum.Health > 0 then
                local screenPoint, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen and isPartVisible(part, player.Character) then
                    local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - mousePos).Magnitude
                    if dist < closestScreenDist then
                        closestScreenDist = dist
                        closestPart = part
                    end
                end
            end
        end
    end
    return closestPart
end

local function getSilentAimTarget()
    local mousePos = UserInputService:GetMouseLocation()
    local closestPart = nil
    local closestScreenDist = Settings.SilentAimFOV

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not IsTeammate(player) and player.Character then
            local part = player.Character:FindFirstChild(Settings.TargetPart)
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if part and hum and hum.Health > 0 then
                local screenPoint, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen and isPartVisible(part, player.Character) then
                    local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - mousePos).Magnitude
                    if dist < closestScreenDist then
                        closestScreenDist = dist
                        closestPart = part
                    end
                end
            end
        end
    end
    return closestPart
end

local BulletHandlerModule = ReplicatedStorage:FindFirstChild("ModuleScripts") and ReplicatedStorage.ModuleScripts:FindFirstChild("GunModules") and ReplicatedStorage.ModuleScripts.GunModules:FindFirstChild("BulletHandler")
if BulletHandlerModule then
    local BulletHandler = require(BulletHandlerModule)
    if BulletHandler and type(BulletHandler.Fire) == "function" then
        local oldFire = BulletHandler.Fire
        BulletHandler.Fire = function(p6)
            if Settings.SilentAimEnabled then
                local closestTarget = getSilentAimTarget()
                if closestTarget then
                    local origin = p6.Origin
                    local newDirection = (closestTarget.Position - origin).Unit
                    p6.Direction = newDirection
                end
            end
            return oldFire(p6)
        end
    end
end

local function getNil(name, class)
    for _, v in next, getnilinstances() do
        if v.ClassName == class and v.Name == name then return v end
    end
    return nil
end

task.spawn(function()
    local args = { [1] = 1782052868.7524734, [2] = Vector3.new(-66.06808471679688, 9.639116287231445, 112.75896453857422) }
    local checkFire = LocalPlayer:FindFirstChild("CheckFire")
    if checkFire then checkFire:FireServer(unpack(args)) end
end)

task.spawn(function()
    local args = {
        [1] = {
            ["Type"] = "Bullet",
            ["Index"] = 1782052868.7524734,
            ["Origin"] = Vector3.new(-69.50228118896484, 7.594357967376709, 108.81075286865234),
            ["Owner"] = getNil("Br4yzelkus473", "Model"),
            ["Endpoint"] = Vector3.new(-685.748291015625, -212.95033264160156, -341.60919189453125),
            ["Life"] = 5,
            ["Force"] = 130,
            ["Gravity"] = 0,
            ["Wind"] = Vector3.zero
        }
    }
    local remote = ReplicatedStorage:FindFirstChild("ModuleScripts") and ReplicatedStorage.ModuleScripts:FindFirstChild("GunModules") and ReplicatedStorage.ModuleScripts.GunModules:FindFirstChild("Remote")
    if remote and remote:FindFirstChild("ProjectileRender") then
        remote.ProjectileRender:FireServer(unpack(args))
    end
end)

task.spawn(function()
    local args = {
        [1] = 0,
        [2] = 0,
        [3] = 1,
        [4] = 0.8,
        [5] = CFrame.new(-66.06808471679688, 9.639116287231445, 112.75896453857422, 0.5913095474243164, -0.22438260912895203, 0.7746002674102783, 0, 0.960512638092041, 0.2782368063926697, -0.8064447641372681, -0.16452407836914062, 0.5679602026939392),
        [6] = Vector3.new(-75.25591278076172, 6.338844299316406, 106.02218627929688),
        [7] = getNil("Part", "Part"),
        [8] = 11,
        [9] = 1782052868.7524734
    }
    local checkShot = LocalPlayer:FindFirstChild("CheckShot")
    if checkShot then checkShot:FireServer(unpack(args)) end
end)

task.spawn(function()
    while task.wait(0.2) do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                if Settings.HitboxEnabled and not IsTeammate(player) then
                    hrp.Size = Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize)
                    hrp.Transparency = 0.7
                    hrp.Color = Color3.fromRGB(255,0,0)
                    hrp.Material = Enum.Material.Neon
                    hrp.CanCollide = false
                else
                    hrp.Size = Vector3.new(2,2,1)
                    hrp.Transparency = 1
                    hrp.CanCollide = true
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(math.max(0.01, Settings.TriggerBotDelay))
        if Settings.TriggerBotEnabled and Mouse.Target then
            local model = Mouse.Target:FindFirstAncestorOfClass("Model")
            local player = model and Players:GetPlayerFromCharacter(model)
            if player and player ~= LocalPlayer and not IsTeammate(player) then
                local hum = model:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    if mouse1click then
                        mouse1click()
                    elseif mouse1press and mouse1release then
                        mouse1press()
                        task.wait(0.02)
                        mouse1release()
                    end
                end
            end
        end
    end
end)

local FlyBV, FlyBG

RunService.RenderStepped:Connect(function()
    local screenSize = Camera.ViewportSize
    local screenCenter = screenSize / 2
    local cx, cy = screenCenter.X, screenCenter.Y

    FOVCircle.Position = screenCenter
    FOVCircle.Radius = Settings.FOVRadius
    FOVCircle.Color = Settings.FOVCircleColor
    FOVCircle.Visible = Settings.FOVEnabled and Settings.AimbotEnabled

    SilentFOVCircle.Position = screenCenter
    SilentFOVCircle.Radius = Settings.SilentAimFOV
    SilentFOVCircle.Color = Settings.SilentAimFOVCircleColor
    SilentFOVCircle.Visible = Settings.SilentAimFOVEnabled and Settings.SilentAimEnabled

    ClearCrosshair()
    if Settings.CrosshairEnabled then
        local style = Settings.CrosshairStyle
        local size = Settings.CrosshairSize
        local gap = Settings.CrosshairGap
        local col = Settings.CrosshairColor
        if Settings.CrosshairRainbow then
            local hue = (os.clock() * 0.4) % 1
            col = Color3.fromHSV(hue, 0.9, 1)
        end
        if style == "Bild: Kreuz (+)" then
            CH_Pool.Lines[1].From = Vector2.new(cx - size, cy)
            CH_Pool.Lines[1].To = Vector2.new(cx + size, cy)
            CH_Pool.Lines[1].Color = col
            CH_Pool.Lines[1].Visible = true
            CH_Pool.Lines[2].From = Vector2.new(cx, cy - size)
            CH_Pool.Lines[2].To = Vector2.new(cx, cy + size)
            CH_Pool.Lines[2].Color = col
            CH_Pool.Lines[2].Visible = true
        elseif style == "Bild: Punkt (Dot)" then
            CH_Pool.Dot.Position = Vector2.new(cx, cy)
            CH_Pool.Dot.Radius = (size < 4) and 3 or (size / 2.5)
            CH_Pool.Dot.Color = col
            CH_Pool.Dot.Visible = true
        elseif style == "Standard" or style == "T-Shape" or style == "Horizontal Only" or style == "Vertical Only" then
            if style ~= "Vertical Only" then
                CH_Pool.Lines[1].From = Vector2.new(cx - gap, cy) CH_Pool.Lines[1].To = Vector2.new(cx - gap - size, cy) CH_Pool.Lines[1].Color = col CH_Pool.Lines[1].Visible = true
                CH_Pool.Lines[2].From = Vector2.new(cx + gap, cy) CH_Pool.Lines[2].To = Vector2.new(cx + gap + size, cy) CH_Pool.Lines[2].Color = col CH_Pool.Lines[2].Visible = true
            end
            if style ~= "Horizontal Only" then
                if style ~= "T-Shape" then
                    CH_Pool.Lines[3].From = Vector2.new(cx, cy - gap) CH_Pool.Lines[3].To = Vector2.new(cx, cy - gap - size) CH_Pool.Lines[3].Color = col CH_Pool.Lines[3].Visible = true
                end
                CH_Pool.Lines[4].From = Vector2.new(cx, cy + gap) CH_Pool.Lines[4].To = Vector2.new(cx, cy + gap + size) CH_Pool.Lines[4].Color = col CH_Pool.Lines[4].Visible = true
            end
        elseif style == "Circle" then
            CH_Pool.Circles[1].Position = Vector2.new(cx, cy) CH_Pool.Circles[1].Radius = gap + size CH_Pool.Circles[1].Color = col CH_Pool.Circles[1].Visible = true
        elseif style == "Box" then
            CH_Pool.Lines[1].From = Vector2.new(cx - size, cy - size) CH_Pool.Lines[1].To = Vector2.new(cx + size, cy - size) CH_Pool.Lines[1].Color = col CH_Pool.Lines[1].Visible = true
            CH_Pool.Lines[2].From = Vector2.new(cx - size, cy + size) CH_Pool.Lines[2].To = Vector2.new(cx + size, cy + size) CH_Pool.Lines[2].Color = col CH_Pool.Lines[2].Visible = true
            CH_Pool.Lines[3].From = Vector2.new(cx - size, cy - size) CH_Pool.Lines[3].To = Vector2.new(cx - size, cy + size) CH_Pool.Lines[3].Color = col CH_Pool.Lines[3].Visible = true
            CH_Pool.Lines[4].From = Vector2.new(cx + size, cy - size) CH_Pool.Lines[4].To = Vector2.new(cx + size, cy + size) CH_Pool.Lines[4].Color = col CH_Pool.Lines[4].Visible = true
        end
    end

    if Settings.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local targetPart = getClosestPlayerToCursor()
        if targetPart then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
        end
    end

    if Settings.FlyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local hum = LocalPlayer.Character.Humanoid
        if not FlyBV then FlyBV = Instance.new("BodyVelocity") FlyBV.MaxForce = Vector3.new(1e9,1e9,1e9) FlyBV.Parent = hrp end
        if not FlyBG then FlyBG = Instance.new("BodyGyro") FlyBG.MaxTorque = Vector3.new(1e9,1e9,1e9) FlyBG.Parent = hrp end
        FlyBG.CFrame = Camera.CFrame
        local moveDirection = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDirection = moveDirection - Vector3.new(0,1,0) end
        FlyBV.Velocity = (moveDirection.Magnitude > 0) and (moveDirection.Unit * Settings.FlySpeed) or Vector3.new(0,0,0)
        hum.PlatformStand = true
    else
        if FlyBV then FlyBV:Destroy() FlyBV = nil end
        if FlyBG then FlyBG:Destroy() FlyBG = nil end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = false end
    end

    for player, esp in pairs(ESP_Table) do
        if Settings.ESPEnabled and not IsTeammate(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local hrp = player.Character.HumanoidRootPart
            local hum = player.Character.Humanoid
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local isBot = player.UserId < 0 or string.find(string.lower(player.Name), "bot")
                local teamColor = (player.Team and player.TeamColor) and player.TeamColor.Color or Color3.fromRGB(255,255,255)
                local currentLineColor = Settings.UseTeamColor and teamColor or Settings.ESPLineColor
                local currentTextColor = Settings.UseTeamColor and teamColor or Settings.ESPTextColor
                local topPos = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0,3,0))
                local bottomPos = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0,3.5,0))
                if Settings.ESPLine then
                    esp.Line.From = Vector2.new(screenSize.X / 2, 0)
                    esp.Line.To = Vector2.new(pos.X, pos.Y)
                    esp.Line.Color = isBot and Color3.fromRGB(0,255,0) or currentLineColor
                    esp.Line.Visible = true
                else esp.Line.Visible = false end
                if Settings.ESPTeamText then
                    esp.TeamText.Text = isBot and "(BOT)" or "[" .. (player.Team and player.Team.Name or "Kein Team") .. "]"
                    esp.TeamText.Color = isBot and Color3.fromRGB(0,255,0) or currentTextColor
                    esp.TeamText.Position = Vector2.new(pos.X, topPos.Y - 20)
                    esp.TeamText.Visible = true
                else esp.TeamText.Visible = false end
                if Settings.ESPHealth then
                    local height = math.abs(topPos.Y - bottomPos.Y)
                    local xOffset = pos.X - (height / 2) - 8
                    local healthPct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                    esp.HealthBg.From = Vector2.new(xOffset, bottomPos.Y)
                    esp.HealthBg.To = Vector2.new(xOffset, topPos.Y)
                    esp.HealthBg.Visible = true
                    esp.HealthBar.From = Vector2.new(xOffset, bottomPos.Y)
                    esp.HealthBar.To = Vector2.new(xOffset, bottomPos.Y - (height * healthPct))
                    esp.HealthBar.Color = Color3.fromRGB(255 - (healthPct * 255), healthPct * 255, 0)
                    esp.HealthBar.Visible = true
                else esp.HealthBg.Visible = false esp.HealthBar.Visible = false end
            else esp.Line.Visible = false esp.TeamText.Visible = false esp.HealthBg.Visible = false esp.HealthBar.Visible = false end
        else esp.Line.Visible = false esp.TeamText.Visible = false esp.HealthBg.Visible = false esp.HealthBar.Visible = false end
    end
end)

local AimbotTab = Window:MakeTab({Name = "Aimbot", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SilentTab = Window:MakeTab({Name = "SilentAim", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ESPTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local CustomTab = Window:MakeTab({Name = "Fadenkreuz", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MiscTab = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false})

AimbotTab:AddToggle({Name = "Aimbot", Default = false, Callback = function(Value) Settings.AimbotEnabled = Value end})
AimbotTab:AddToggle({Name = "Wall Check", Default = false, Callback = function(Value) Settings.WallCheck = Value end})
AimbotTab:AddToggle({Name = "Team Check", Default = false, Callback = function(Value) Settings.TeamCheck = Value end})
AimbotTab:AddToggle({Name = "FOV Kreis", Default = false, Callback = function(Value) Settings.FOVEnabled = Value end})
AimbotTab:AddSlider({Name = "FOV Radius", Min = 30, Max = 500, Default = 150, Color = Color3.fromRGB(255,255,255), Increment = 5, ValueName = "px", Callback = function(Value) Settings.FOVRadius = Value end})
AimbotTab:AddColorpicker({Name = "FOV Kreis Farbe", Default = Color3.fromRGB(255,85,85), Callback = function(Value) Settings.FOVCircleColor = Value end})
AimbotTab:AddDropdown({Name = "Ziel-Körperteil", Default = "Head", Options = {"Head", "HumanoidRootPart"}, Callback = function(Value) Settings.TargetPart = Value end})

SilentTab:AddSection({Name = "Silent Aim Settings"})
SilentTab:AddToggle({Name = "Silent Aim", Default = true, Callback = function(Value) Settings.SilentAimEnabled = Value end})
SilentTab:AddSlider({Name = "Silent Aim FOV", Min = 30, Max = 500, Default = 200, Color = Color3.fromRGB(0,255,0), Increment = 5, ValueName = "px", Callback = function(Value) Settings.SilentAimFOV = Value end})
SilentTab:AddToggle({Name = "Silent FOV", Default = true, Callback = function(Value) Settings.SilentAimFOVEnabled = Value end})
SilentTab:AddColorpicker({Name = "Silent FOV Farbe", Default = Color3.fromRGB(0,255,0), Callback = function(Value) Settings.SilentAimFOVCircleColor = Value end})

SilentTab:AddSection({Name = "Trigger Bot"})
SilentTab:AddToggle({Name = "Trigger Bot", Default = false, Callback = function(Value) Settings.TriggerBotEnabled = Value end})
SilentTab:AddSlider({Name = "Verzögerung", Min = 0, Max = 1, Default = 0, Color = Color3.fromRGB(255,165,0), Increment = 0.05, ValueName = "s", Callback = function(Value) Settings.TriggerBotDelay = Value end})

ESPTab:AddToggle({Name = "ESP", Default = true, Callback = function(Value) Settings.ESPEnabled = Value end})
ESPTab:AddToggle({Name = "Tracer Linien", Default = true, Callback = function(Value) Settings.ESPLine = Value end})
ESPTab:AddToggle({Name = "Team-Name ect", Default = true, Callback = function(Value) Settings.ESPTeamText = Value end})
ESPTab:AddToggle({Name = "Health esp", Default = true, Callback = function(Value) Settings.ESPHealth = Value end})

CustomTab:AddToggle({Name = "Fadenkreuz", Default = true, Callback = function(Value) Settings.CrosshairEnabled = Value end})
CustomTab:AddToggle({Name = "Regenbogen", Default = true, Callback = function(Value) Settings.CrosshairRainbow = Value end})
CustomTab:AddDropdown({Name = "Fadenkreuze", Default = "Bild: Kreuz (+)", Options = {"Bild: Kreuz (+)","Bild: Punkt (Dot)","Standard","T-Shape","Circle","Box"}, Callback = function(Value) Settings.CrosshairStyle = Value end})
CustomTab:AddSlider({Name = "Größe", Min = 2, Max = 40, Default = 10, Color = Color3.fromRGB(255,255,255), Increment = 1, ValueName = "px", Callback = function(Value) Settings.CrosshairSize = Value end})
CustomTab:AddSlider({Name = "Mittel-Lücke", Min = 0, Max = 20, Default = 0, Color = Color3.fromRGB(255,255,255), Increment = 1, ValueName = "px", Callback = function(Value) Settings.CrosshairGap = Value end})
CustomTab:AddColorpicker({Name = "Fadenkreuz Farbe", Default = Color3.fromRGB(255,255,255), Callback = function(Value) Settings.CrosshairColor = Value end})

MiscTab:AddToggle({Name = "Hitbox", Default = false, Callback = function(Value) Settings.HitboxEnabled = Value end})
MiscTab:AddSlider({Name = "Hitbox Größe", Min = 2, Max = 30, Default = 10, Color = Color3.fromRGB(255,0,0), Increment = 1, ValueName = "Studs", Callback = function(Value) Settings.HitboxSize = Value end})
MiscTab:AddToggle({Name = "Fly", Default = false, Callback = function(Value) Settings.FlyEnabled = Value end})
MiscTab:AddSlider({Name = "Fly Geschwindigkeit", Min = 10, Max = 200, Default = 50, Color = Color3.fromRGB(0,255,255), Increment = 5, ValueName = "Speed", Callback = function(Value) Settings.FlySpeed = Value end})

OrionLib:Init()