

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "SniperVSrunner"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local ConfigFolder = "NightConfig"
local ConfigFile = ConfigFolder .. "/settings.json"

local Config = {
    AimEnabled = false,
    AimPart = "Head",
    AimSmooth = 0.2,
    AimTeamCheck = false,
    ShowAimFOV = true,
    AimFOVRadius = 150,
    AimFOVColor = Color3.fromRGB(255, 255, 255),

    SilentAim = false,
    SilentWallbang = true,
    SilentPart = "Head",
    ShowSilentFOV = true,
    SilentFOVRadius = 160,
    SilentFOVColor = Color3.fromRGB(130, 80, 255),
    SilentShootDelay = 0.1,
    SilentHitAllInFOV = true,

    AutoKillSniper = false,
    AutoKillAutoShoot = true,
    AutoKillWallbang = true,
    AutoKillPart = "Head",
    AutoKillDelay = 0.05,
    AutoLockCamera = true,

    SniperLaser = true,
    SniperWarn = true,
    LaserColorMode = "Blue-Purple",
    LaserColor = Color3.fromRGB(130, 80, 255),
    LaserThickness = 2,

    ESPEnabled = false,
    ESPNames = true,
    ESPTeams = true,
    ESPTracers = true,
    ESPColorMode = "Team",
    ESPCustomColor = Color3.fromRGB(255, 60, 60),

    SpeedToggle = false,
    WalkSpeed = 50,
    FlyToggle = false,
    FlySpeed = 50,
    AntiVoid = true,
    AntiVoidHeight = -30,

    AutoVote = false,
    VoteDelay = 2,

    AutoSave = true,
    AntiAFK = true,
    MobileHUD = false
}

local function SaveConfiguration()
    if not writefile then return false end
    local success = pcall(function()
        if makefolder and isfolder and not isfolder(ConfigFolder) then
            makefolder(ConfigFolder)
        end
        local data = {}
        for k, v in pairs(Config) do
            if typeof(v) == "Color3" then
                data[k] = {__type = "Color3", r = v.R, g = v.G, b = v.B}
            elseif type(v) ~= "function" and type(v) ~= "thread" then
                data[k] = v
            end
        end
        writefile(ConfigFile, HttpService:JSONEncode(data))
    end)
    return success
end

local function LoadConfiguration()
    if not (readfile and isfile and isfile(ConfigFile)) then return false end
    local success = pcall(function()
        local raw = readfile(ConfigFile)
        local decoded = HttpService:JSONDecode(raw)
        for k, v in pairs(decoded) do
            if type(v) == "table" and v.__type == "Color3" then
                Config[k] = Color3.new(v.r, v.g, v.b)
            elseif Config[k] ~= nil then
                Config[k] = v
            end
        end
    end)
    return success
end

local function AutoSaveTrigger()
    if Config.AutoSave then
        task.spawn(SaveConfiguration)
    end
end

LoadConfiguration()

local Connections = {}
local ActiveThreads = {}
local ESPCache = {}
local SniperLines = {}
local ActiveSnipers = {}
local LastShotTime = 0
local CurrentAutoKillTarget = nil
local LastSafeCFrame = nil
local LastAntiVoidTeleport = 0
local MobileGui = nil

local Remotes = {
    FireSniper = nil,
    AimRemote = nil,
    ReloadSound = nil,
    SniperDecal = nil,
    VoteRemote = nil,
}

local function FindInstanceByName(name, className)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild(name) then
        local obj = events:FindFirstChild(name)
        if not className or obj:IsA(className) then return obj end
    end

    local rsObj = ReplicatedStorage:FindFirstChild(name)
    if rsObj and (not className or rsObj:IsA(className)) then return rsObj end

    if getnilinstances then
        local s, objs = pcall(getnilinstances)
        if s and type(objs) == "table" then
            for _, obj in ipairs(objs) do
                if obj.Name == name and (not className or obj:IsA(className)) then
                    return obj
                end
            end
        end
    end

    for _, obj in ipairs(game:GetDescendants()) do
        if obj.Name == name and (not className or obj:IsA(className)) then
            return obj
        end
    end

    return nil
end

local function GetFireSniper()
    if Remotes.FireSniper then
        local ok = pcall(function() return Remotes.FireSniper.Name end)
        if ok then return Remotes.FireSniper end
    end
    Remotes.FireSniper = FindInstanceByName("FireSniper")
    return Remotes.FireSniper
end

local function GetAimRemote()
    if Remotes.AimRemote then
        local ok = pcall(function() return Remotes.AimRemote.Name end)
        if ok then return Remotes.AimRemote end
    end
    Remotes.AimRemote = FindInstanceByName("AimRemote")
    return Remotes.AimRemote
end

local function GetVoteRemote()
    local lib = ReplicatedStorage:FindFirstChild("Libraries")
    if lib then
        local mm = lib:FindFirstChild("MainModule")
        if mm then
            local re = mm:FindFirstChild("RemoteEvent")
            if re and re:IsA("RemoteEvent") then return re end
        end
    end
    for _, desc in ipairs(ReplicatedStorage:GetDescendants()) do
        if desc.Name == "RemoteEvent" and desc.Parent and desc.Parent.Name == "MainModule" then
            return desc
        end
    end
    return FindInstanceByName("RemoteEvent", "RemoteEvent")
end

local function InitRemotes()
    Remotes.FireSniper = GetFireSniper()
    Remotes.AimRemote = GetAimRemote()
    Remotes.ReloadSound = FindInstanceByName("ReloadSoundEvent") or FindInstanceByName("ReloadSound")
    Remotes.SniperDecal = FindInstanceByName("SniperDecal")
    Remotes.VoteRemote = GetVoteRemote()
end

task.spawn(InitRemotes)

local function IsVisible(part)
    if not part then return false end
    local startPos = Camera.CFrame.Position
    local targetPos = part.Position
    local direction = (targetPos - startPos)

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}

    local result = Workspace:Raycast(startPos, direction, raycastParams)
    if result and result.Instance then
        return result.Instance:IsDescendantOf(part.Parent)
    end
    return true
end

local function IsValidTarget(plr)
    if not plr or plr == LocalPlayer then return false end
    local char = plr.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp or hum.Health <= 0 then return false end
    if Config.AimTeamCheck and plr.Team and LocalPlayer.Team and plr.Team == LocalPlayer.Team then
        return false
    end
    return true
end

local function GetTarget(partName, fovRadius, checkVisibility)
    partName = partName or "Head"
    fovRadius = fovRadius or 150
    checkVisibility = (checkVisibility == nil) and true or checkVisibility

    local closest = nil
    local shortestDist = fovRadius
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, plr in pairs(Players:GetPlayers()) do
        if IsValidTarget(plr) then
            local char = plr.Character
            local part = char and (char:FindFirstChild(partName) or char:FindFirstChild("HumanoidRootPart"))
            if part then
                if not checkVisibility or IsVisible(part) then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local screenDist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                        if screenDist < shortestDist then
                            shortestDist = screenDist
                            closest = plr
                        end
                    end
                end
            end
        end
    end
    return closest
end

local function GetAllTargetsInFOV(partName, fovRadius, checkVisibility)
    partName = partName or "Head"
    fovRadius = fovRadius or 160
    checkVisibility = (checkVisibility == nil) and true or checkVisibility

    local targets = {}
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, plr in pairs(Players:GetPlayers()) do
        if IsValidTarget(plr) then
            local char = plr.Character
            local part = char and (char:FindFirstChild(partName) or char:FindFirstChild("HumanoidRootPart"))
            if part then
                if not checkVisibility or IsVisible(part) then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local screenDist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                        if screenDist <= fovRadius then
                            table.insert(targets, plr)
                        end
                    end
                end
            end
        end
    end
    return targets
end

local function FireShotAtTarget(target, partName, allowWallbang)
    local remote = GetFireSniper()
    if not remote then return false end
    if not target or not target.Character then return false end

    local char = target.Character
    local part = char:FindFirstChild(partName or "Head") 
        or char:FindFirstChild("HumanoidRootPart") 
        or char:FindFirstChild("Torso") 
        or char:FindFirstChild("UpperTorso")
    if not part then return false end

    if not allowWallbang and not IsVisible(part) then
        return false
    end

    local myChar = LocalPlayer.Character
    local myHead = myChar and (myChar:FindFirstChild("Head") or myChar:FindFirstChild("HumanoidRootPart"))
    local myPos = myHead and myHead.Position or Camera.CFrame.Position
    local targetPos = part.Position
    local direction = (targetPos - myPos).Unit

    local pointBlankPos = targetPos - (direction * 0.2)

    pcall(function()
        remote:FireServer(
            pointBlankPos,
            direction,
            false,
            part,
            targetPos,
            Vector3.new(0, 1, 0),
            1
        )
    end)

    pcall(function()
        remote:FireServer(
            myPos,
            direction,
            false,
            part,
            targetPos,
            Vector3.new(0, 1, 0),
            1
        )
    end)

    pcall(function()
        remote:FireServer(
            myPos,
            direction,
            false,
            nil,
            targetPos,
            Vector3.new(0, 1, 0),
            1
        )
    end)

    local aim = GetAimRemote()
    if aim then
        pcall(function()
            aim:FireServer(true, myPos, direction)
        end)
    end

    local reload = Remotes.ReloadSound or FindInstanceByName("ReloadSoundEvent") or FindInstanceByName("ReloadSound")
    if reload then
        pcall(function()
            reload:FireServer("Bullet")
        end)
    end

    return true
end

local function TriggerSilentAim()
    if not Config.SilentAim then return end
    local needVisCheck = not Config.SilentWallbang

    if Config.SilentHitAllInFOV then
        local targets = GetAllTargetsInFOV(Config.SilentPart, Config.SilentFOVRadius, needVisCheck)
        for _, target in ipairs(targets) do
            FireShotAtTarget(target, Config.SilentPart, Config.SilentWallbang)
        end
    else
        local target = GetTarget(Config.SilentPart, Config.SilentFOVRadius, needVisCheck)
        if target then
            FireShotAtTarget(target, Config.SilentPart, Config.SilentWallbang)
        end
    end
end

Connections.SilentAimClick = UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if Config.SilentAim then
            TriggerSilentAim()
        end
    end
end)

local function StartAutoKillSniper()
    if ActiveThreads.AutoKill then return end
    ActiveThreads.AutoKill = task.spawn(function()
        while Config.AutoKillSniper do
            local foundTarget = false
            for _, plr in pairs(Players:GetPlayers()) do
                if not Config.AutoKillSniper then break end
                if IsValidTarget(plr) then
                    local char = plr.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    local part = char and (char:FindFirstChild(Config.AutoKillPart) or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head") or char:FindFirstChild("Torso"))
                    
                    local canShoot = Config.AutoKillWallbang or (part and IsVisible(part))
                    if part and hum and hum.Health > 0 and canShoot then
                        foundTarget = true
                        CurrentAutoKillTarget = plr
                        
                        if Config.AutoLockCamera then
                            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, part.Position)
                        end
                        
                        if Config.AutoKillAutoShoot ~= false then
                            FireShotAtTarget(plr, Config.AutoKillPart, Config.AutoKillWallbang)
                        end
                        
                        local waitDelay = math.clamp(Config.AutoKillDelay or 0.05, 0.01, 1)
                        task.wait(waitDelay)
                    end
                end
            end
            if not foundTarget then
                CurrentAutoKillTarget = nil
                task.wait(0.05)
            end
        end
        CurrentAutoKillTarget = nil
        ActiveThreads.AutoKill = nil
    end)
end

local function CreateByteBuffer(byteArray)
    if buffer and buffer.create and buffer.writeu8 then
        local b = buffer.create(#byteArray)
        for i = 1, #byteArray do
            buffer.writeu8(b, i - 1, byteArray[i])
        end
        return b
    end
    return byteArray
end

local function FireVoteServer()
    if not Remotes.VoteRemote then Remotes.VoteRemote = GetVoteRemote() end
    if Remotes.VoteRemote then
        local payload = CreateByteBuffer({ 92, 5, 2 })
        local success = pcall(function()
            Remotes.VoteRemote:FireServer(payload)
        end)
        return success
    end
    return false
end

local function StartAutoVoteLoop()
    if ActiveThreads.AutoVote then return end
    ActiveThreads.AutoVote = task.spawn(function()
        while Config.AutoVote do
            FireVoteServer()
            task.wait(Config.VoteDelay or 2)
        end
        ActiveThreads.AutoVote = nil
    end)
end

local FlyKeys = {W = false, A = false, S = false, D = false, Space = false, LShift = false}
local FlyVel, FlyGyro

Connections.FlyKeyDown = UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.W then FlyKeys.W = true
    elseif input.KeyCode == Enum.KeyCode.A then FlyKeys.A = true
    elseif input.KeyCode == Enum.KeyCode.S then FlyKeys.S = true
    elseif input.KeyCode == Enum.KeyCode.D then FlyKeys.D = true
    elseif input.KeyCode == Enum.KeyCode.Space then FlyKeys.Space = true
    elseif input.KeyCode == Enum.KeyCode.LeftShift then FlyKeys.LShift = true end
end)

Connections.FlyKeyUp = UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then FlyKeys.W = false
    elseif input.KeyCode == Enum.KeyCode.A then FlyKeys.A = false
    elseif input.KeyCode == Enum.KeyCode.S then FlyKeys.S = false
    elseif input.KeyCode == Enum.KeyCode.D then FlyKeys.D = false
    elseif input.KeyCode == Enum.KeyCode.Space then FlyKeys.Space = false
    elseif input.KeyCode == Enum.KeyCode.LeftShift then FlyKeys.LShift = false end
end)

local function StartFly()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
        local hrp = char.HumanoidRootPart
        if FlyVel then FlyVel:Destroy() end
        if FlyGyro then FlyGyro:Destroy() end

        FlyVel = Instance.new("BodyVelocity")
        FlyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        FlyVel.Velocity = Vector3.zero
        FlyVel.Parent = hrp

        FlyGyro = Instance.new("BodyGyro")
        FlyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        FlyGyro.P = 10000
        FlyGyro.CFrame = Camera.CFrame
        FlyGyro.Parent = hrp

        char.Humanoid.PlatformStand = true
    end
end

local function StopFly()
    if FlyVel then FlyVel:Destroy(); FlyVel = nil end
    if FlyGyro then FlyGyro:Destroy(); FlyGyro = nil end
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.PlatformStand = false
    end
end

local function DistanceToSegment(p, a, b)
    local ab = b - a
    local ap = p - a
    local abLenSq = ab:Dot(ab)
    if abLenSq == 0 then
        return (p - a).Magnitude
    end
    local t = math.clamp(ap:Dot(ab) / abLenSq, 0, 1)
    local closest = a + ab * t
    return (p - closest).Magnitude
end

local function GetCurrentLaserColor()
    if Config.LaserColorMode == "Blue-Purple" then
        return Color3.fromRGB(130, 80, 255)
    elseif Config.LaserColorMode == "Rainbow" then
        return Color3.fromHSV((tick() % 4) / 4, 1, 1)
    elseif Config.LaserColorMode == "Red" then
        return Color3.fromRGB(255, 40, 40)
    else
        return Config.LaserColor or Color3.fromRGB(130, 80, 255)
    end
end

local AimFOVCircle = Drawing.new("Circle")
AimFOVCircle.Thickness = 1.5
AimFOVCircle.Visible = false
AimFOVCircle.Transparency = 0.7
AimFOVCircle.Color = Config.AimFOVColor
AimFOVCircle.Filled = false

local SilentFOVCircle = Drawing.new("Circle")
SilentFOVCircle.Thickness = 1.5
SilentFOVCircle.Visible = false
SilentFOVCircle.Transparency = 0.7
SilentFOVCircle.Color = Config.SilentFOVColor
SilentFOVCircle.Filled = false

local WarnText = Drawing.new("Text")
WarnText.Size = 26
WarnText.Center = true
WarnText.Outline = true
WarnText.Color = Color3.fromRGB(255, 30, 30)
WarnText.Visible = false

local function RemoveESP(plr)
    if ESPCache[plr] then
        pcall(function()
            if ESPCache[plr].Line then ESPCache[plr].Line:Remove() end
            if ESPCache[plr].Text then ESPCache[plr].Text:Remove() end
        end)
        ESPCache[plr] = nil
    end
end

local function RemoveSniperLine(plr)
    if SniperLines[plr] then
        pcall(function() SniperLines[plr]:Remove() end)
        SniperLines[plr] = nil
    end
end

local function CreateESP(plr)
    RemoveESP(plr)
    local line = Drawing.new("Line")
    line.Thickness = 1.5
    line.Visible = false
    
    local text = Drawing.new("Text")
    text.Size = 14
    text.Center = true
    text.Outline = true
    text.Visible = false
    
    ESPCache[plr] = {Line = line, Text = text}
end

local function GetSniperLine(plr)
    if not SniperLines[plr] then
        local line = Drawing.new("Line")
        line.Thickness = Config.LaserThickness or 2
        line.Visible = false
        SniperLines[plr] = line
    end
    return SniperLines[plr]
end

local function ReadU8(b, offset)
    if typeof(b) == "buffer" then
        return buffer.readu8(b, offset)
    elseif type(b) == "string" then
        return string.byte(b, offset + 1)
    end
    return 0
end

local function ReadF32(b, offset)
    if typeof(b) == "buffer" then
        return buffer.readf32(b, offset)
    elseif type(b) == "string" and string.unpack then
        return string.unpack("<f", string.sub(b, offset + 1, offset + 4))
    end
    return 0
end

local function BufferLen(b)
    if typeof(b) == "buffer" then
        return buffer.len(b)
    elseif type(b) == "string" then
        return #b
    end
    return 0
end

local function ProcessLaserBuffer(b, playersTable)
    local len = BufferLen(b)
    if len < 27 then return end

    local op = ReadU8(b, 0)
    if op ~= 22 then return end

    local startX = ReadF32(b, 2)
    local startY = ReadF32(b, 6)
    local startZ = ReadF32(b, 10)
    local startPos = Vector3.new(startX, startY, startZ)

    local endX = ReadF32(b, 15)
    local endY = ReadF32(b, 19)
    local endZ = ReadF32(b, 23)
    local endPos = Vector3.new(endX, endY, endZ)

    local isAiming = true
    if len >= 29 then
        isAiming = (ReadU8(b, 28) == 1)
    end

    local shooter = nil
    if type(playersTable) == "table" then
        shooter = playersTable[1]
    elseif typeof(playersTable) == "Instance" then
        shooter = playersTable
    end

    if shooter then
        local shooterName = typeof(shooter) == "Instance" and shooter.Name or tostring(shooter)
        if shooter == LocalPlayer or shooterName == LocalPlayer.Name then return end

        ActiveSnipers[shooter] = {
            Shooter = shooter,
            Name = shooterName,
            Start = startPos,
            End = endPos,
            Active = isAiming,
            Tick = tick()
        }
    end
end

local function HookSniperLaser()
    local mainRemote = GetVoteRemote()
    if mainRemote and not Connections.MainRemoteLaserListener then
        Connections.MainRemoteLaserListener = mainRemote.OnClientEvent:Connect(function(arg1, arg2)
            pcall(function()
                ProcessLaserBuffer(arg1, arg2)
            end)
        end)
    end

    local sniperEvent = FindInstanceByName("SniperAimLaser", "RemoteEvent")
    if sniperEvent and not Connections.SniperLaserListener then
        Connections.SniperLaserListener = sniperEvent.OnClientEvent:Connect(function(shooter, startPos, endPos, isAiming)
            if shooter and shooter ~= LocalPlayer then
                local shooterName = typeof(shooter) == "Instance" and shooter.Name or tostring(shooter)
                if shooterName == LocalPlayer.Name then return end
                ActiveSnipers[shooter] = {
                    Shooter = shooter,
                    Name = shooterName,
                    Start = startPos,
                    End = endPos,
                    Active = (isAiming == nil) or (isAiming == true),
                    Tick = tick()
                }
            end
        end)
    end
end

task.spawn(function()
    while true do
        if not Connections.MainRemoteLaserListener or not Connections.SniperLaserListener then
            HookSniperLaser()
        end
        task.wait(2)
    end
end)

Connections.RenderStepped = RunService.RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    AimFOVCircle.Position = screenCenter
    AimFOVCircle.Radius = Config.AimFOVRadius
    AimFOVCircle.Color = Config.AimFOVColor
    AimFOVCircle.Visible = Config.ShowAimFOV and (Config.AimEnabled or Config.ShowAimFOV)

    SilentFOVCircle.Position = screenCenter
    SilentFOVCircle.Radius = Config.SilentFOVRadius
    SilentFOVCircle.Color = Config.SilentFOVColor
    SilentFOVCircle.Visible = Config.ShowSilentFOV and (Config.SilentAim or Config.ShowSilentFOV)

    if Config.AimEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = GetTarget(Config.AimPart, Config.AimFOVRadius, true)
        if target and target.Character then
            local part = target.Character:FindFirstChild(Config.AimPart) or target.Character:FindFirstChild("HumanoidRootPart")
            if part then
                local targetCF = CFrame.lookAt(Camera.CFrame.Position, part.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCF, math.clamp(Config.AimSmooth, 0.01, 1))
            end
        end
    end

    if Config.AutoKillSniper and Config.AutoLockCamera and CurrentAutoKillTarget then
        if IsValidTarget(CurrentAutoKillTarget) then
            local char = CurrentAutoKillTarget.Character
            local part = char and (char:FindFirstChild(Config.AutoKillPart) or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head"))
            if part then
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, part.Position)
            end
        else
            CurrentAutoKillTarget = nil
        end
    end

    if Config.SilentAim then
        local now = tick()
        local delay = math.clamp(Config.SilentShootDelay or 0.1, 0.05, 1)
        if now - LastShotTime >= delay then
            TriggerSilentAim()
            LastShotTime = now
        end
    end

    if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
        local hum = char.Humanoid
        local hrp = char.HumanoidRootPart
        if hum.Health > 0 then
            if hum.FloorMaterial ~= Enum.Material.Air then
                LastSafeCFrame = hrp.CFrame
            elseif Config.FlyToggle and hrp.Position.Y > ((Config.AntiVoidHeight or -30) + 20) then
                LastSafeCFrame = hrp.CFrame
            end

            if Config.AntiVoid then
                local voidLimit = Config.AntiVoidHeight or -30
                local fallenLimit = (Workspace.FallenPartsDestroyHeight or -500) + 60
                if hrp.Position.Y <= voidLimit or hrp.Position.Y <= fallenLimit then
                    if (tick() - LastAntiVoidTeleport) > 0.3 then
                        LastAntiVoidTeleport = tick()
                        if LastSafeCFrame then
                            hrp.CFrame = LastSafeCFrame + Vector3.new(0, 3, 0)
                        else
                            hrp.CFrame = CFrame.new(hrp.Position.X, math.max(voidLimit + 50, 30), hrp.Position.Z)
                        end
                        pcall(function()
                            hrp.AssemblyLinearVelocity = Vector3.zero
                            hrp.AssemblyAngularVelocity = Vector3.zero
                        end)
                        pcall(function()
                            hrp.Velocity = Vector3.zero
                            hrp.RotVelocity = Vector3.zero
                        end)
                    end
                end
            end
        end
    end

    if Config.SpeedToggle and char and char:FindFirstChild("Humanoid") then
        if not Config.FlyToggle then
            char.Humanoid.WalkSpeed = Config.WalkSpeed
        end
    end

    if Config.FlyToggle and FlyVel and FlyGyro and char and char:FindFirstChild("HumanoidRootPart") then
        local move = Vector3.zero
        local cf = Camera.CFrame
        if FlyKeys.W then move = move + cf.LookVector end
        if FlyKeys.S then move = move - cf.LookVector end
        if FlyKeys.A then move = move - cf.RightVector end
        if FlyKeys.D then move = move + cf.RightVector end
        if FlyKeys.Space then move = move + Vector3.new(0, 1, 0) end
        if FlyKeys.LShift then move = move - Vector3.new(0, 1, 0) end
        if move.Magnitude > 0 then move = move.Unit * Config.FlySpeed end
        
        FlyVel.Velocity = move
        FlyGyro.CFrame = cf
    end

    local isWarned = false
    local warningShooter = ""

    for plr, data in pairs(ActiveSnipers) do
        local line = GetSniperLine(plr)
        local isRecent = data.Active and ((tick() - data.Tick) < 1.8)

        if isRecent then
            if Config.SniperLaser then
                local sPos, sVis = Camera:WorldToViewportPoint(data.Start)
                local ePos, eVis = Camera:WorldToViewportPoint(data.End)
                if sVis or eVis then
                    line.Visible = true
                    line.From = Vector2.new(sPos.X, sPos.Y)
                    line.To = Vector2.new(ePos.X, ePos.Y)
                    line.Color = GetCurrentLaserColor()
                    line.Thickness = Config.LaserThickness or 2
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end

            if Config.SniperWarn and char and char:FindFirstChild("HumanoidRootPart") then
                local myPos = char.HumanoidRootPart.Position
                local distToBeam = DistanceToSegment(myPos, data.Start, data.End)
                local distToEnd = (data.End - myPos).Magnitude

                if distToBeam < 7 or distToEnd < 16 then
                    isWarned = true
                    warningShooter = data.Name or "Sniper"
                end
            end
        else
            line.Visible = false
        end
    end

    if isWarned then
        local flash = math.abs(math.sin(tick() * 9))
        WarnText.Visible = true
        WarnText.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * 0.28)
        WarnText.Color = Color3.fromRGB(255, math.floor(30 + flash * 75), math.floor(30 + flash * 75))
        WarnText.Text = "[!] WARNING: " .. warningShooter .. " is aiming at you! [!]"
    else
        WarnText.Visible = false
    end

    if not Config.ESPEnabled then
        for plr in pairs(ESPCache) do RemoveESP(plr) end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if IsValidTarget(plr) then
                if not ESPCache[plr] then CreateESP(plr) end
                local cache = ESPCache[plr]
                if cache then
                    local pChar = plr.Character
                    local hrp = pChar and pChar:FindFirstChild("HumanoidRootPart")
                    local head = pChar and pChar:FindFirstChild("Head")

                    if hrp and head then
                        local hrpPos, hrpVis = Camera:WorldToViewportPoint(hrp.Position)
                        local headPos, headVis = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                        local col = Config.ESPCustomColor
                        if Config.ESPColorMode == "Team" and plr.TeamColor then
                            col = plr.TeamColor.Color
                        end

                        if Config.ESPTracers and hrpVis then
                            cache.Line.Visible = true
                            cache.Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            cache.Line.To = Vector2.new(hrpPos.X, hrpPos.Y)
                            cache.Line.Color = col
                        else
                            cache.Line.Visible = false
                        end

                        if Config.ESPNames and headVis then
                            local txt = plr.Name
                            if Config.ESPTeams and plr.Team then
                                txt = txt .. " [" .. plr.Team.Name .. "]"
                            end
                            cache.Text.Visible = true
                            cache.Text.Position = Vector2.new(headPos.X, headPos.Y - 20)
                            cache.Text.Text = txt
                            cache.Text.Color = col
                        else
                            cache.Text.Visible = false
                        end
                    else
                        RemoveESP(plr)
                    end
                end
            else
                RemoveESP(plr)
            end
        end
    end
end)

Connections.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr)
    RemoveESP(plr)
    RemoveSniperLine(plr)
    ActiveSnipers[plr] = nil
end)

Connections.CharacterAdded = LocalPlayer.CharacterAdded:Connect(function()
    LastSafeCFrame = nil
    LastAntiVoidTeleport = 0
    if Config.FlyToggle then
        task.wait(0.5)
        StartFly()
    end
end)

Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.zero)
        end)
    end
end)

local function CreateMobileHUD()
    if MobileGui then
        MobileGui.Enabled = Config.MobileHUD
        return
    end

    local parent = nil
    if gethui then
        parent = gethui()
    elseif syn and syn.protect_gui then
        local g = Instance.new("ScreenGui")
        syn.protect_gui(g)
        g.Parent = game:GetService("CoreGui")
        parent = g
    elseif game:GetService("CoreGui"):FindFirstChild("RobloxGui") then
        parent = game:GetService("CoreGui")
    else
        parent = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NightMobileHUD"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = parent
    MobileGui = ScreenGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 260, 0, 155)
    MainFrame.Position = UDim2.new(0.02, 0, 0.4, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(130, 80, 255)
    UIStroke.Thickness = 1.2
    UIStroke.Parent = MainFrame

    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 24)
    TitleBar.BackgroundTransparency = 1
    TitleBar.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -30, 1, 0)
    TitleLabel.Position = UDim2.new(0, 8, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Night Mobile HUD"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 11
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 18, 0, 18)
    MinBtn.Position = UDim2.new(1, -22, 0, 3)
    MinBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
    MinBtn.TextSize = 13
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.Parent = TitleBar

    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 4)
    MinCorner.Parent = MinBtn

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -12, 1, -28)
    ContentFrame.Position = UDim2.new(0, 6, 0, 24)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Padding = UDim.new(0, 4)
    ListLayout.Parent = ContentFrame

    local function CreateRow(order)
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, 0, 0, 25)
        row.BackgroundTransparency = 1
        row.LayoutOrder = order
        row.Parent = ContentFrame

        local rowLayout = Instance.new("UIListLayout")
        rowLayout.FillDirection = Enum.FillDirection.Horizontal
        rowLayout.SortOrder = Enum.SortOrder.LayoutOrder
        rowLayout.Padding = UDim.new(0, 4)
        rowLayout.Parent = row
        return row
    end

    local function CreateBtn(parentRow, text, getVal, setVal, flexSize)
        local btn = Instance.new("TextButton")
        btn.Size = flexSize or UDim2.new(0.315, 0, 1, 0)
        btn.BackgroundColor3 = getVal() and Color3.fromRGB(130, 80, 255) or Color3.fromRGB(35, 35, 42)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamSemibold
        btn.Parent = parentRow

        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 5)
        c.Parent = btn

        local s = Instance.new("UIStroke")
        s.Color = getVal() and Color3.fromRGB(180, 140, 255) or Color3.fromRGB(55, 55, 65)
        s.Thickness = 1
        s.Parent = btn

        btn.MouseButton1Click:Connect(function()
            local newVal = not getVal()
            setVal(newVal)
            btn.BackgroundColor3 = newVal and Color3.fromRGB(130, 80, 255) or Color3.fromRGB(35, 35, 42)
            s.Color = newVal and Color3.fromRGB(180, 140, 255) or Color3.fromRGB(55, 55, 65)
            AutoSaveTrigger()
        end)
        return btn
    end

    local row1 = CreateRow(1)
    CreateBtn(row1, "Silent Aim", function() return Config.SilentAim end, function(v) Config.SilentAim = v end)
    CreateBtn(row1, "Wallbang", function() return Config.SilentWallbang end, function(v) Config.SilentWallbang = v end)
    CreateBtn(row1, "FOV", function() return Config.ShowSilentFOV end, function(v) Config.ShowSilentFOV = v end)

    local row2 = CreateRow(2)
    CreateBtn(row2, "Aimbot", function() return Config.AimEnabled end, function(v) Config.AimEnabled = v end)
    CreateBtn(row2, "Wallbang", function() return Config.AutoKillWallbang end, function(v) Config.AutoKillWallbang = v end)
    CreateBtn(row2, "FOV", function() return Config.ShowAimFOV end, function(v) Config.ShowAimFOV = v end)

    local row3 = CreateRow(3)
    CreateBtn(row3, "ESP", function() return Config.ESPEnabled end, function(v) Config.ESPEnabled = v end)
    CreateBtn(row3, "Tracers", function() return Config.ESPTracers end, function(v) Config.ESPTracers = v end)
    CreateBtn(row3, "Names", function() return Config.ESPNames end, function(v) Config.ESPNames = v end)

    local row4 = CreateRow(4)
    CreateBtn(row4, "AutoKill All", function() return Config.AutoKillSniper end, function(v)
        Config.AutoKillSniper = v
        if v then StartAutoKillSniper() end
    end, UDim2.new(0.485, 0, 1, 0))
    CreateBtn(row4, "Sniper Radar", function() return Config.SniperLaser end, function(v)
        Config.SniperLaser = v
    end, UDim2.new(0.485, 0, 1, 0))

    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        ContentFrame.Visible = not minimized
        MainFrame.Size = minimized and UDim2.new(0, 260, 0, 24) or UDim2.new(0, 260, 0, 155)
        MinBtn.Text = minimized and "+" or "-"
    end)

    ScreenGui.Enabled = Config.MobileHUD
end

local Window = OrionLib:MakeWindow({
    Name = "Night System",
    Icon = "rbxassetid://71392308711379",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "NightConfig"
})

local MobileTab = Window:MakeTab({
    Name = "Mobile UI",
    Icon = "rbxassetid://10734975692"
})

MobileTab:AddSection({Name = "Floating Mobile HUD"})

MobileTab:AddToggle({
    Name = "Floating Mobile HUD",
    Default = Config.MobileHUD,
    Callback = function(v)
        Config.MobileHUD = v
        AutoSaveTrigger()
        if v and not MobileGui then
            CreateMobileHUD()
        elseif MobileGui then
            MobileGui.Enabled = v
        end
    end
})

local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://98232288704820"
})

CombatTab:AddSection({Name = "Aimbot"})

CombatTab:AddToggle({
    Name = "Aimbot",
    Default = Config.AimEnabled,
    Callback = function(v)
        Config.AimEnabled = v
        AutoSaveTrigger()
    end
})

CombatTab:AddToggle({
    Name = "Team Check",
    Default = Config.AimTeamCheck,
    Callback = function(v)
        Config.AimTeamCheck = v
        AutoSaveTrigger()
    end
})

CombatTab:AddDropdown({
    Name = "Target Part",
    Default = Config.AimPart,
    Options = {"Head", "HumanoidRootPart", "Torso"},
    Callback = function(v)
        Config.AimPart = v
        AutoSaveTrigger()
    end
})

CombatTab:AddSlider({
    Name = "Smoothness",
    Min = 0.01,
    Max = 1,
    Default = Config.AimSmooth,
    Increment = 0.01,
    ValueName = "Speed",
    Callback = function(v)
        Config.AimSmooth = v
        AutoSaveTrigger()
    end
})

CombatTab:AddSection({Name = "Aim FOV"})

CombatTab:AddToggle({
    Name = "Show Aim FOV",
    Default = Config.ShowAimFOV,
    Callback = function(v)
        Config.ShowAimFOV = v
        AutoSaveTrigger()
    end
})

CombatTab:AddSlider({
    Name = "Aim FOV Radius",
    Min = 10,
    Max = 800,
    Default = Config.AimFOVRadius,
    Increment = 5,
    ValueName = "px",
    Callback = function(v)
        Config.AimFOVRadius = v
        AutoSaveTrigger()
    end
})

CombatTab:AddColorpicker({
    Name = "Aim FOV Color",
    Default = Config.AimFOVColor,
    Callback = function(v)
        Config.AimFOVColor = v
        AutoSaveTrigger()
    end
})

local SilentTab = Window:MakeTab({
    Name = "Silent Aim",
    Icon = "rbxassetid://138025957139303"
})

SilentTab:AddSection({Name = "Silent Aim & AutoShoot"})

SilentTab:AddToggle({
    Name = "Silent Aim (AutoShoot)",
    Default = Config.SilentAim,
    Callback = function(v)
        Config.SilentAim = v
        AutoSaveTrigger()
    end
})

SilentTab:AddToggle({
    Name = "Wallbang",
    Default = Config.SilentWallbang,
    Callback = function(v)
        Config.SilentWallbang = v
        AutoSaveTrigger()
    end
})

SilentTab:AddToggle({
    Name = "Hit All in FOV",
    Default = Config.SilentHitAllInFOV,
    Callback = function(v)
        Config.SilentHitAllInFOV = v
        AutoSaveTrigger()
    end
})

SilentTab:AddDropdown({
    Name = "Target Part",
    Default = Config.SilentPart,
    Options = {"Head", "HumanoidRootPart", "Torso"},
    Callback = function(v)
        Config.SilentPart = v
        AutoSaveTrigger()
    end
})

SilentTab:AddSection({Name = "Silent FOV"})

SilentTab:AddToggle({
    Name = "Show Silent FOV",
    Default = Config.ShowSilentFOV,
    Callback = function(v)
        Config.ShowSilentFOV = v
        AutoSaveTrigger()
    end
})

SilentTab:AddSlider({
    Name = "Silent FOV Radius",
    Min = 10,
    Max = 800,
    Default = Config.SilentFOVRadius,
    Increment = 5,
    ValueName = "px",
    Callback = function(v)
        Config.SilentFOVRadius = v
        AutoSaveTrigger()
    end
})

SilentTab:AddColorpicker({
    Name = "Silent FOV Color",
    Default = Config.SilentFOVColor,
    Callback = function(v)
        Config.SilentFOVColor = v
        AutoSaveTrigger()
    end
})

SilentTab:AddSection({Name = "Timing"})

SilentTab:AddSlider({
    Name = "Shoot Delay (s)",
    Min = 0.05,
    Max = 1,
    Default = Config.SilentShootDelay,
    Increment = 0.05,
    ValueName = "s",
    Callback = function(v)
        Config.SilentShootDelay = v
        AutoSaveTrigger()
    end
})

local AutoKillTab = Window:MakeTab({
    Name = "AutoKill",
    Icon = "rbxassetid://7733964719"
})

AutoKillTab:AddSection({Name = "AutoKill & AutoShoot"})

AutoKillTab:AddToggle({
    Name = "AutoKill (AutoShoot)",
    Default = Config.AutoKillSniper,
    Callback = function(v)
        Config.AutoKillSniper = v
        AutoSaveTrigger()
        if v then StartAutoKillSniper() end
    end
})

AutoKillTab:AddToggle({
    Name = "AutoShoot",
    Default = Config.AutoKillAutoShoot,
    Callback = function(v)
        Config.AutoKillAutoShoot = v
        AutoSaveTrigger()
    end
})

AutoKillTab:AddToggle({
    Name = "AimLock / Lock Camera",
    Default = Config.AutoLockCamera,
    Callback = function(v)
        Config.AutoLockCamera = v
        AutoSaveTrigger()
    end
})

AutoKillTab:AddToggle({
    Name = "Wallbang",
    Default = Config.AutoKillWallbang,
    Callback = function(v)
        Config.AutoKillWallbang = v
        AutoSaveTrigger()
    end
})

AutoKillTab:AddDropdown({
    Name = "Target Part",
    Default = Config.AutoKillPart,
    Options = {"Head", "HumanoidRootPart", "Torso"},
    Callback = function(v)
        Config.AutoKillPart = v
        AutoSaveTrigger()
    end
})

AutoKillTab:AddSlider({
    Name = "Shoot Delay (s)",
    Min = 0.01,
    Max = 0.5,
    Default = Config.AutoKillDelay,
    Increment = 0.01,
    ValueName = "s",
    Callback = function(v)
        Config.AutoKillDelay = v
        AutoSaveTrigger()
    end
})

local RadarTab = Window:MakeTab({
    Name = "Sniper Radar",
    Icon = "rbxassetid://89652930608206"
})

RadarTab:AddSection({Name = "Laser & Aim Radar"})

RadarTab:AddToggle({
    Name = "Laser ESP",
    Default = Config.SniperLaser,
    Callback = function(v)
        Config.SniperLaser = v
        AutoSaveTrigger()
    end
})

RadarTab:AddToggle({
    Name = "Aim Warning",
    Default = Config.SniperWarn,
    Callback = function(v)
        Config.SniperWarn = v
        AutoSaveTrigger()
    end
})

RadarTab:AddDropdown({
    Name = "Laser Color Mode",
    Default = Config.LaserColorMode,
    Options = {"Blue-Purple", "Custom", "Rainbow", "Red"},
    Callback = function(v)
        Config.LaserColorMode = v
        AutoSaveTrigger()
    end
})

RadarTab:AddColorpicker({
    Name = "Laser Color",
    Default = Config.LaserColor,
    Callback = function(v)
        Config.LaserColor = v
        AutoSaveTrigger()
    end
})

RadarTab:AddSlider({
    Name = "Laser Thickness",
    Min = 1,
    Max = 6,
    Default = Config.LaserThickness,
    Increment = 1,
    ValueName = "px",
    Callback = function(v)
        Config.LaserThickness = v
        AutoSaveTrigger()
    end
})

local VisualsTab = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://140499484856973"
})

VisualsTab:AddSection({Name = "Player ESP"})

VisualsTab:AddToggle({
    Name = "Player ESP",
    Default = Config.ESPEnabled,
    Callback = function(v)
        Config.ESPEnabled = v
        AutoSaveTrigger()
    end
})

VisualsTab:AddToggle({
    Name = "Names",
    Default = Config.ESPNames,
    Callback = function(v)
        Config.ESPNames = v
        AutoSaveTrigger()
    end
})

VisualsTab:AddToggle({
    Name = "Teams",
    Default = Config.ESPTeams,
    Callback = function(v)
        Config.ESPTeams = v
        AutoSaveTrigger()
    end
})

VisualsTab:AddToggle({
    Name = "Tracers",
    Default = Config.ESPTracers,
    Callback = function(v)
        Config.ESPTracers = v
        AutoSaveTrigger()
    end
})

VisualsTab:AddDropdown({
    Name = "Color Mode",
    Default = Config.ESPColorMode,
    Options = {"Team", "Custom"},
    Callback = function(v)
        Config.ESPColorMode = v
        AutoSaveTrigger()
    end
})

VisualsTab:AddColorpicker({
    Name = "Custom Color",
    Default = Config.ESPCustomColor,
    Callback = function(v)
        Config.ESPCustomColor = v
        AutoSaveTrigger()
    end
})

local MovementTab = Window:MakeTab({
    Name = "Movement",
    Icon = "rbxassetid://105216135416947"
})

MovementTab:AddSection({Name = "Fly"})

MovementTab:AddToggle({
    Name = "Fly",
    Default = Config.FlyToggle,
    Callback = function(v)
        Config.FlyToggle = v
        AutoSaveTrigger()
        if v then StartFly() else StopFly() end
    end
})

MovementTab:AddSlider({
    Name = "Fly Speed",
    Min = 16,
    Max = 300,
    Default = Config.FlySpeed,
    Increment = 1,
    ValueName = "Speed",
    Callback = function(v)
        Config.FlySpeed = v
        AutoSaveTrigger()
    end
})

MovementTab:AddSection({Name = "WalkSpeed"})

MovementTab:AddToggle({
    Name = "Speed",
    Default = Config.SpeedToggle,
    Callback = function(v)
        Config.SpeedToggle = v
        AutoSaveTrigger()
        if not v then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 16
            end
        end
    end
})

MovementTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 300,
    Default = Config.WalkSpeed,
    Increment = 1,
    ValueName = "Speed",
    Callback = function(v)
        Config.WalkSpeed = v
        AutoSaveTrigger()
    end
})

MovementTab:AddSection({Name = "Anti-Void"})

MovementTab:AddToggle({
    Name = "Anti-Void",
    Default = Config.AntiVoid,
    Callback = function(v)
        Config.AntiVoid = v
        AutoSaveTrigger()
    end
})

MovementTab:AddSlider({
    Name = "Void Height",
    Min = -200,
    Max = 0,
    Default = Config.AntiVoidHeight,
    Increment = 5,
    ValueName = "Y",
    Callback = function(v)
        Config.AntiVoidHeight = v
        AutoSaveTrigger()
    end
})

local GameTab = Window:MakeTab({
    Name = "Voting",
    Icon = "rbxassetid://114187792807811"
})

GameTab:AddSection({Name = "Auto Vote"})

GameTab:AddToggle({
    Name = "Auto Vote",
    Default = Config.AutoVote,
    Callback = function(v)
        Config.AutoVote = v
        AutoSaveTrigger()
        if v then
            StartAutoVoteLoop()
            OrionLib:MakeNotification({
                Name = "Auto Vote",
                Content = "Auto Vote active.",
                Image = "rbxassetid://114187792807811",
                Time = 2
            })
        end
    end
})

GameTab:AddSlider({
    Name = "Vote Delay (s)",
    Min = 0.5,
    Max = 10,
    Default = Config.VoteDelay,
    Increment = 0.5,
    ValueName = "s",
    Callback = function(v)
        Config.VoteDelay = v
        AutoSaveTrigger()
    end
})

GameTab:AddButton({
    Name = "Vote Now",
    Icon = "rbxassetid://114187792807811",
    Callback = function()
        local success = FireVoteServer()
        if success then
            OrionLib:MakeNotification({
                Name = "Vote",
                Content = "Vote sent successfully!",
                Image = "rbxassetid://114187792807811",
                Time = 2.5
            })
        else
            OrionLib:MakeNotification({
                Name = "Vote Error",
                Content = "Remote not found.",
                Image = "rbxassetid://121450316772412",
                Time = 2.5
            })
        end
    end
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://121450316772412"
})

SettingsTab:AddSection({Name = "Configuration"})

SettingsTab:AddToggle({
    Name = "Auto Save Config",
    Default = Config.AutoSave,
    Callback = function(v)
        Config.AutoSave = v
        if v then SaveConfiguration() end
    end
})

SettingsTab:AddButton({
    Name = "Save Config Now",
    Icon = "rbxassetid://121450316772412",
    Callback = function()
        local success = SaveConfiguration()
        if success then
            OrionLib:MakeNotification({
                Name = "Config",
                Content = "Settings saved to " .. ConfigFile,
                Image = "rbxassetid://121450316772412",
                Time = 2.5
            })
        else
            OrionLib:MakeNotification({
                Name = "Config Error",
                Content = "Failed to write config file.",
                Image = "rbxassetid://121450316772412",
                Time = 2.5
            })
        end
    end
})

SettingsTab:AddButton({
    Name = "Load Config Now",
    Icon = "rbxassetid://121450316772412",
    Callback = function()
        local success = LoadConfiguration()
        if success then
            OrionLib:MakeNotification({
                Name = "Config",
                Content = "Settings loaded successfully!",
                Image = "rbxassetid://121450316772412",
                Time = 2.5
            })
        else
            OrionLib:MakeNotification({
                Name = "Config",
                Content = "No saved settings found.",
                Image = "rbxassetid://121450316772412",
                Time = 2.5
            })
        end
    end
})

SettingsTab:AddSection({Name = "Utilities"})

SettingsTab:AddToggle({
    Name = "Anti AFK",
    Default = Config.AntiAFK,
    Callback = function(v)
        Config.AntiAFK = v
        AutoSaveTrigger()
    end
})

SettingsTab:AddSection({Name = "Management"})

SettingsTab:AddButton({
    Name = "Re-scan Remotes",
    Icon = "rbxassetid://121450316772412",
    Callback = function()
        InitRemotes()
        OrionLib:MakeNotification({
            Name = "Remotes",
            Content = "Remotes re-scanned and initialized.",
            Image = "rbxassetid://121450316772412",
            Time = 2.5
        })
    end
})

SettingsTab:AddButton({
    Name = "Unload Script",
    Icon = "rbxassetid://7733964719",
    Callback = function()
        for _, conn in pairs(Connections) do
            if conn and conn.Disconnect then pcall(function() conn:Disconnect() end) end
        end
        pcall(function() AimFOVCircle:Remove() end)
        pcall(function() SilentFOVCircle:Remove() end)
        pcall(function() WarnText:Remove() end)
        for plr in pairs(ESPCache) do RemoveESP(plr) end
        for plr in pairs(SniperLines) do RemoveSniperLine(plr) end
        StopFly()
        if MobileGui then pcall(function() MobileGui:Destroy() end) end
        if OrionLib and OrionLib.Destroy then
            pcall(function() OrionLib:Destroy() end)
        end
    end
})

if UserInputService.TouchEnabled then
    Config.MobileHUD = true
end
if Config.MobileHUD then
    task.spawn(CreateMobileHUD)
end

OrionLib:Init()
