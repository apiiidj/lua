

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "MurderVSsheriff"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()



local LoaderWindow = OrionLib:MakeWindow({Name = "NIGHT SYSTEM | BOOTING", HidePremium = false, SaveConfig = false, IntroEnabled = false})

local LoaderTab = LoaderWindow:MakeTab({Name = "Loader", Icon = "rbxassetid://4483345998"})

local StatusParagraph = LoaderTab:AddParagraph("System Status", "Initializing Night System...")
local ProgressParagraph = LoaderTab:AddParagraph("Progress", "0%")

task.spawn(function()
    local steps = {
        {msg = "Connecting to Night-Servers...", prg = "20%", wait = 0.5},
        {msg = "Fetching MvS Database...", prg = "45%", wait = 0.5},
        {msg = "Bypassing Local Anticheat...", prg = "70%", wait = 0.5},
        {msg = "Injecting KREASS V2 Modules...", prg = "90%", wait = 0.5},
        {msg = "Finishing Setup...", prg = "100%", wait = 0.3}
    }

    for _, step in ipairs(steps) do
        StatusParagraph:Set(step.msg)
        ProgressParagraph:Set(step.prg)
        task.wait(step.wait)
    end

    OrionLib:Destroy()
    task.wait(0.2)

    
    local OrionMain = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()
    local Window = OrionMain:MakeWindow({Name = "Night System", HidePremium = false, SaveConfig = true, ConfigFolder = "MvS_Ultimate_V2", IntroEnabled = true})

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local Camera = workspace.CurrentCamera
    local UIS = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local Config = {
        Skeleton = true,
        Hitbox = false,
        Size = 15,
        Tracers = false,
        Names = true,
        Health = true,
        MainColor = Color3.fromRGB(255, 0, 0),
        FlyKey = Enum.KeyCode.F,
        Noclip = false,
        WalkSpeed = 16
    }

    
    local SilentAimConfig = {
        Enabled = false,
        AutoShoot = false,
        AutoShootDelay = 0.1,
        FOV = 150,
        ShowFOV = true,
        TeamCheck = false,
        TargetPart = "Head",
        FOVMode = "FOV"
    }

    
    local KnifeConfig = {
        Mode = "3D Distance", 
        MaxRange = 5000       
    }

    
    local Visuals = {}

    local function createLine()
        local line = Drawing.new("Line")
        line.Thickness = 1.5
        line.Transparency = 1
        line.Visible = false
        return line
    end

    local function createText()
        local text = Drawing.new("Text")
        text.Size = 16
        text.Center = true
        text.Outline = true
        text.OutlineColor = Color3.fromRGB(0, 0, 0)
        text.Visible = false
        return text
    end

    local function addVisuals(player)
        if player == LocalPlayer then return end
        Visuals[player] = {
            Tracer = Drawing.new("Line"),
            NameTag = createText(),
            HealthText = createText(),
            Skel = {
                H2T = createLine(), LUA = createLine(), LLA = createLine(), LH = createLine(),
                RUA = createLine(), RLA = createLine(), RH = createLine(),
                LUL = createLine(), LLL = createLine(), LF = createLine(),
                RUL = createLine(), RLL = createLine(), RF = createLine()
            }
        }
    end

    for _, p in ipairs(Players:GetPlayers()) do addVisuals(p) end
    Players.PlayerAdded:Connect(addVisuals)

    Players.PlayerRemoving:Connect(function(player)
        if Visuals[player] then
            Visuals[player].Tracer:Remove()
            Visuals[player].NameTag:Remove()
            Visuals[player].HealthText:Remove()
            for _, line in pairs(Visuals[player].Skel) do line:Remove() end
            Visuals[player] = nil
        end
    end)

    
    local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345998"})
    local CombatTab = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://4483362458"})
    local PlayerTab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998"})
    local SilentAimTab = Window:MakeTab({Name = "Silent Aim", Icon = "rbxassetid://4483362458"})
    local KnifeTab = Window:MakeTab({Name = "Knife", Icon = "rbxassetid://4483362458"})

    
    VisualsTab:AddToggle({Name = "Names", Default = true, Callback = function(v) Config.Names = v end})
    VisualsTab:AddToggle({Name = "Health Display", Default = true, Callback = function(v) Config.Health = v end})
    VisualsTab:AddToggle({Name = "Skeleton", Default = true, Callback = function(v) Config.Skeleton = v end})
    VisualsTab:AddToggle({Name = "Tracers", Default = false, Callback = function(v) Config.Tracers = v end})
    VisualsTab:AddColorpicker({Name = "ESP Color", Default = Config.MainColor, Callback = function(v) Config.MainColor = v end})

    
    CombatTab:AddToggle({Name = "Hitbox Expander", Default = false, Callback = function(v) Config.Hitbox = v end})
    CombatTab:AddSlider({Name = "Hitbox Size", Min = 2, Max = 60, Default = 15, Callback = function(v) Config.Size = v end})

    
    PlayerTab:AddSlider({Name = "WalkSpeed", Min = 16, Max = 250, Default = 16, Callback = function(v) Config.WalkSpeed = v end})
    PlayerTab:AddToggle({Name = "Noclip", Default = false, Callback = function(v) Config.Noclip = v end})

    
    SilentAimTab:AddToggle({
        Name = "Silent Aim Aktiv",
        Default = false,
        Callback = function(v) SilentAimConfig.Enabled = v end
    })
    SilentAimTab:AddToggle({
        Name = "Auto Shoot (Triggerbot)",
        Default = false,
        Callback = function(v) SilentAimConfig.AutoShoot = v end
    })
    SilentAimTab:AddSlider({
        Name = "Auto Shoot Verzögerung",
        Min = 0.05, Max = 0.5, Default = 0.1, Increment = 0.01, ValueName = "s",
        Callback = function(v) SilentAimConfig.AutoShootDelay = v end
    })
    SilentAimTab:AddSlider({
        Name = "FOV Radius",
        Min = 30, Max = 500, Default = 150, Increment = 5, ValueName = "px",
        Callback = function(v) SilentAimConfig.FOV = v end
    })
    SilentAimTab:AddToggle({
        Name = "FOV Kreis anzeigen",
        Default = true,
        Callback = function(v) SilentAimConfig.ShowFOV = v end
    })
    SilentAimTab:AddDropdown({
        Name = "FOV Modus",
        Default = "FOV",
        Options = {"FOV", "Global"},
        Callback = function(v) SilentAimConfig.FOVMode = v end
    })
    SilentAimTab:AddToggle({
        Name = "Team Check (nur Gegner)",
        Default = false,
        Callback = function(v) SilentAimConfig.TeamCheck = v end
    })
    SilentAimTab:AddDropdown({
        Name = "Zielteil",
        Default = "Head",
        Options = {"Head", "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso"},
        Callback = function(v) SilentAimConfig.TargetPart = v end
    })

    
    local AutoKillEnabled = false

    local function KillNearest()
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if not remotes then return end
        local throwStart = remotes:FindFirstChild("ThrowStart")
        local throwHit = remotes:FindFirstChild("ThrowHit")
        if not throwStart or not throwHit then return end

        local bestPlayer = nil
        local bestValue = math.huge
        local mousePos = UIS:GetMouseLocation()
        local cameraPos = Camera.CFrame.Position

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hum = player.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    local root = player.Character.HumanoidRootPart
                    local targetPos = root.Position

                    if KnifeConfig.Mode == "3D Distance" then
                        local dist3D = (targetPos - cameraPos).Magnitude
                        if dist3D <= KnifeConfig.MaxRange and dist3D < bestValue then
                            bestValue = dist3D
                            bestPlayer = player
                        end
                    else 
                        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
                        if onScreen then
                            local distScreen = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                            if distScreen < bestValue then
                                bestValue = distScreen
                                bestPlayer = player
                            end
                        end
                    end
                end
            end
        end

        if bestPlayer then
            local targetPart = bestPlayer.Character:FindFirstChild(SilentAimConfig.TargetPart) or bestPlayer.Character.HumanoidRootPart
            local origin = Camera.CFrame.Position
            local direction = (targetPart.Position - origin).Unit

            throwStart:FireServer(origin, direction)
            throwHit:FireServer(targetPart, targetPart.Position)
        end
    end

    KnifeTab:AddButton({
        Name = "Kill Nearest Enemy",
        Callback = function() KillNearest() end
    })

    KnifeTab:AddToggle({
        Name = "Auto Kill",
        Default = false,
        Callback = function(v) AutoKillEnabled = v end
    })

    KnifeTab:AddDropdown({
        Name = "Zielauswahl-Modus",
        Default = KnifeConfig.Mode,
        Options = {"3D Distance", "Screen Distance"},
        Callback = function(v) KnifeConfig.Mode = v end
    })

    KnifeTab:AddSlider({
        Name = "Maximale Reichweite (Studs)",
        Min = 100,
        Max = 10000,
        Default = KnifeConfig.MaxRange,
        Increment = 100,
        ValueName = "studs",
        Callback = function(v) KnifeConfig.MaxRange = v end
    })

    
    task.spawn(function()
        while true do
            task.wait(0.2)
            if AutoKillEnabled then
                KillNearest()
            end
        end
    end)

    
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Thickness = 1.5
    FOVCircle.NumSides = 60
    FOVCircle.Radius = SilentAimConfig.FOV
    FOVCircle.Filled = false
    FOVCircle.Visible = false
    FOVCircle.Color = Color3.fromRGB(255, 255, 255)

    local function GetClosestPlayer()
        local closestPlayer = nil
        local shortestDistance = (SilentAimConfig.FOVMode == "Global") and math.huge or SilentAimConfig.FOV
        local mousePos = UIS:GetMouseLocation()

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(SilentAimConfig.TargetPart) then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    if SilentAimConfig.TeamCheck and player.Team == LocalPlayer.Team then continue end
                    local targetPart = player.Character[SilentAimConfig.TargetPart]
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
        return closestPlayer
    end

    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if not checkcaller() and SilentAimConfig.Enabled and method == "FireServer" and self.Name == "ShootGun" then
            local target = GetClosestPlayer()
            if target and target.Character and target.Character:FindFirstChild(SilentAimConfig.TargetPart) then
                local targetPart = target.Character[SilentAimConfig.TargetPart]
                args[2] = targetPart.Position
                args[3] = targetPart
                args[4] = targetPart.Position
                return oldNamecall(self, unpack(args))
            end
        end
        return oldNamecall(self, ...)
    end)

    task.spawn(function()
        while true do
            task.wait(SilentAimConfig.AutoShootDelay)
            if SilentAimConfig.Enabled and SilentAimConfig.AutoShoot then
                local target = GetClosestPlayer()
                if target and target.Character and target.Character:FindFirstChild(SilentAimConfig.TargetPart) then
                    local shootRemote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("ShootGun")
                    if shootRemote then
                        local targetPart = target.Character[SilentAimConfig.TargetPart]
                        local origin = Camera.CFrame.Position
                        shootRemote:FireServer(origin, targetPart.Position, targetPart, targetPart.Position)
                    end
                end
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        local mousePos = UIS:GetMouseLocation()
        FOVCircle.Position = mousePos
        FOVCircle.Radius = SilentAimConfig.FOV
        FOVCircle.Visible = SilentAimConfig.ShowFOV and SilentAimConfig.Enabled
    end)

    
    local flyEnabled = false
    local flySpeed = 100
    local bodyVelocity, bodyGyro

    local function toggleFly()
        local character = LocalPlayer.Character
        if not character then return end
        local hum = character:FindFirstChild("Humanoid")
        local root = character:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        flyEnabled = not flyEnabled
        if flyEnabled then
            hum.PlatformStand = true
            bodyVelocity = Instance.new("BodyVelocity", root)
            bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bodyGyro = Instance.new("BodyGyro", root)
            bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            bodyGyro.P = 10000
        else
            hum.PlatformStand = false
            if bodyVelocity then bodyVelocity:Destroy() end
            if bodyGyro then bodyGyro:Destroy() end
        end
    end

    local flyToggleUI = PlayerTab:AddToggle({Name = "Fly Mode", Default = false, Callback = function(v) if flyEnabled ~= v then toggleFly() end end})
    PlayerTab:AddSlider({Name = "Fly Speed", Min = 10, Max = 500, Default = 100, Callback = function(v) flySpeed = v end})
    PlayerTab:AddDropdown({Name = "Fly Keybind", Default = "F", Options = {"F", "G", "H", "J", "K", "L", "X", "C", "V", "B"}, Callback = function(v)
        local keyMap = {["F"]=Enum.KeyCode.F,["G"]=Enum.KeyCode.G,["H"]=Enum.KeyCode.H,["J"]=Enum.KeyCode.J,["K"]=Enum.KeyCode.K,["L"]=Enum.KeyCode.L,["X"]=Enum.KeyCode.X,["C"]=Enum.KeyCode.C,["V"]=Enum.KeyCode.V,["B"]=Enum.KeyCode.B}
        Config.FlyKey = keyMap[v]
    end})

    UIS.InputBegan:Connect(function(input, g)
        if not g and input.KeyCode == Config.FlyKey then flyToggleUI:Set(not flyEnabled) end
    end)

    
    local function getP(char, name)
        local p = char:FindFirstChild(name)
        if p then
            local pos, onScreen = Camera:WorldToViewportPoint(p.Position)
            return onScreen and Vector2.new(pos.X, pos.Y) or nil
        end
    end

    local function connect(l, p1, p2)
        if p1 and p2 then
            l.From = p1; l.To = p2; l.Color = Config.MainColor; l.Visible = true
        else l.Visible = false end
    end

    
    task.spawn(function()
        while true do
            if Config.Noclip then
                local character = LocalPlayer.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end
            task.wait(0.5)
        end
    end)

    
    RunService.RenderStepped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Config.WalkSpeed
        end

        for player, vis in pairs(Visuals) do
            local char = player.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if hrp and hum and hum.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                local healthPercent = hum.Health / hum.MaxHealth
                local healthColor = Color3.fromRGB(255 * (1 - healthPercent), 255 * healthPercent, 0)

                if onScreen and Config.Names then
                    vis.NameTag.Position = Vector2.new(pos.X, pos.Y - 45)
                    vis.NameTag.Text = player.Name
                    vis.NameTag.Color = Color3.fromRGB(255,255,255)
                    vis.NameTag.Size = 17
                    vis.NameTag.Visible = true
                else vis.NameTag.Visible = false end

                if onScreen and Config.Health then
                    vis.HealthText.Position = Vector2.new(pos.X, pos.Y - 28)
                    vis.HealthText.Text = string.format("%.0f / %.0f HP", hum.Health, hum.MaxHealth)
                    vis.HealthText.Color = healthColor
                    vis.HealthText.Size = 13
                    vis.HealthText.Visible = true
                else vis.HealthText.Visible = false end

                if Config.Hitbox and player.Team ~= LocalPlayer.Team then
                    hrp.Size = Vector3.new(Config.Size, Config.Size, Config.Size)
                    hrp.Transparency = 0.8
                    hrp.CanCollide = false
                    local sBox = hrp:FindFirstChild("NightHitbox") or Instance.new("SelectionBox", hrp)
                    sBox.Name = "NightHitbox"
                    sBox.Adornee = hrp
                    sBox.Color3 = Config.MainColor
                    sBox.Visible = true
                else
                    if hrp.Size ~= Vector3.new(2,2,1) then hrp.Size = Vector3.new(2,2,1) end
                    if hrp:FindFirstChild("NightHitbox") then hrp.NightHitbox.Visible = false end
                end

                if onScreen and Config.Skeleton then
                    local head = getP(char, "Head")
                    local UT = getP(char, "UpperTorso") or getP(char, "Torso")
                    local LT = getP(char, "LowerTorso") or getP(char, "Torso")
                    local LUA, LLA = getP(char, "LeftUpperArm"), getP(char, "LeftLowerArm")
                    local RUA, RLA = getP(char, "RightUpperArm"), getP(char, "RightLowerArm")
                    local LUL, LLL = getP(char, "LeftUpperLeg"), getP(char, "LeftLowerLeg")
                    local RUL, RLL = getP(char, "RightUpperLeg"), getP(char, "RightLowerLeg")

                    connect(vis.Skel.H2T, head, UT)
                    connect(vis.Skel.LUA, UT, LUA)
                    connect(vis.Skel.LLA, LUA, LLA)
                    connect(vis.Skel.RUA, UT, RUA)
                    connect(vis.Skel.RLA, RUA, RLA)
                    connect(vis.Skel.LUL, LT, LUL)
                    connect(vis.Skel.LLL, LUL, LLL)
                    connect(vis.Skel.RUL, LT, RUL)
                    connect(vis.Skel.RLL, RUL, RLL)
                else
                    for _, l in pairs(vis.Skel) do l.Visible = false end
                end

                if onScreen and Config.Tracers then
                    vis.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    vis.Tracer.To = Vector2.new(pos.X, pos.Y)
                    vis.Tracer.Color = Config.MainColor
                    vis.Tracer.Thickness = 1.5
                    vis.Tracer.Visible = true
                else vis.Tracer.Visible = false end
            else
                vis.NameTag.Visible = false
                vis.HealthText.Visible = false
                vis.Tracer.Visible = false
                for _, l in pairs(vis.Skel) do l.Visible = false end
            end
        end
    end)

    
    task.spawn(function()
        while true do
            if flyEnabled and bodyVelocity then
                local dir = Vector3.new(0,0,0)
                local cam = Camera.CFrame
                if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end

                if dir.Magnitude > 0 then bodyVelocity.Velocity = dir.Unit * flySpeed
                else bodyVelocity.Velocity = Vector3.new(0,0,0) end
                bodyGyro.CFrame = cam
            end
            task.wait()
        end
    end)

    OrionMain:Init()
end)