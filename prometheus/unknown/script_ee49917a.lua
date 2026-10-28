--[[  Thunder Hub (Redz UI) — all-in-one build
      - Fixed tab creation (Name/Icon)
      - Fixed broken buttons/callbacks
      - Removed/reduced duplicate service/var redeclarations
      - Clean connections + respawn handling
      - Intro plays (3s) and cleans up
      - Emote buttons (R15) + rig auto-loader button
      - Vehicle fly/boost, spectate/follow, anti-AFK, spinbot, TP tool, reset, etc.
]]

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

-- ================= Thunder Hub Intro (Blue w/ tiny green accent) =================
do
    local TweenService = game:GetService("TweenService")
    local RunService  = game:GetService("RunService")
    local guiParent   = (gethui and gethui()) or game:GetService("CoreGui")

    if _G.ThunderIntro_Stop then
        pcall(_G.ThunderIntro_Stop)
        _G.ThunderIntro_Stop = nil
    end

    local BLUE  = Color3.fromRGB(64, 145, 255)
    local GREEN = Color3.fromRGB(60, 255, 160) -- small accent

    local function Start(opts)
        opts = opts or {}
        local SIZE            = opts.size or 140
        local STROKE_THICK    = 18
        local CORNER          = 18
        local DURATION        = opts.duration -- seconds (nil = no auto-despawn)
        local SPIN_STEP_DEG   = 90
        local SPIN_STEP_TIME  = 0.6
        local BREATH_MIN, BREATH_MAX = 0.98, 1.02

        local gui = Instance.new("ScreenGui")
        gui.Name = "ThunderIntro"
        gui.IgnoreGuiInset, gui.ResetOnSpawn = true, false
        gui.Parent = guiParent

        local root = Instance.new("Frame")
        root.Size = UDim2.fromOffset(SIZE, SIZE)
        root.AnchorPoint = Vector2.new(0.5, 0.5)
        root.Position = UDim2.fromScale(0.5, 0.5)
        root.BackgroundTransparency = 1
        root.Parent = gui

        local ring = Instance.new("Frame")
        ring.Size = UDim2.fromScale(1, 1)
        ring.BackgroundTransparency = 1
        ring.Parent = root
        Instance.new("UICorner", ring).CornerRadius = UDim.new(0, CORNER)
        local ringStroke = Instance.new("UIStroke")
        ringStroke.Thickness = STROKE_THICK
        ringStroke.Color = BLUE
        ringStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        ringStroke.Parent = ring

        local glow = Instance.new("Frame")
        glow.Size = UDim2.fromScale(1, 1)
        glow.BackgroundTransparency = 1
        glow.ZIndex = ring.ZIndex - 1
        glow.Parent = root
        Instance.new("UICorner", glow).CornerRadius = UDim.new(0, CORNER)
        local glowStroke = Instance.new("UIStroke")
        glowStroke.Thickness = 30
        glowStroke.Color = BLUE
        glowStroke.Transparency = 0.75
        glowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        glowStroke.Parent = glow

        local inner = Instance.new("Frame")
        local innerSize = SIZE - STROKE_THICK * 2
        inner.Size = UDim2.fromOffset(innerSize, innerSize)
        inner.AnchorPoint = Vector2.new(0.5, 0.5)
        inner.Position = UDim2.fromScale(0.5, 0.5)
        inner.BackgroundTransparency = 1
        inner.ZIndex = 5
        inner.Parent = root

        local function mkBar(w, h, x, y, rot)
            local f = Instance.new("Frame")
            f.Size = UDim2.fromOffset(math.floor(innerSize*w), math.floor(innerSize*h))
            f.AnchorPoint = Vector2.new(0.5, 0.5)
            f.Position = UDim2.fromOffset(math.floor(innerSize*x), math.floor(innerSize*y))
            f.Rotation = rot
            f.BackgroundColor3 = BLUE
            f.BorderSizePixel = 0
            f.ZIndex = 6
            f.Parent = inner
            local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 10) c.Parent = f
            return f
        end
        local boltTop   = mkBar(0.55, 0.18, 0.44, 0.36, -24)
        local boltLower = mkBar(0.40, 0.22, 0.58, 0.64, -24)

        local function addSheen(frame)
            local g = Instance.new("UIGradient")
            g.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,255,255)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(220,240,255)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255,255,255)),
            }
            g.Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0.00, 0.35),
                NumberSequenceKeypoint.new(0.50, 0.05),
                NumberSequenceKeypoint.new(1.00, 0.35),
            }
            g.Parent = frame
            return g
        end
        local g1 = addSheen(boltTop)
        local g2 = addSheen(boltLower)

        local dot = Instance.new("Frame")
        dot.Size = UDim2.fromOffset(6, 6)
        dot.BackgroundColor3 = GREEN
        dot.BorderSizePixel = 0
        dot.ZIndex = 7
        dot.Parent = inner
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local ringScale = Instance.new("UIScale", ring)
        ringScale.Scale = 1

        local alive, hbConn = true, nil
        _G.ThunderIntro_Stop = function()
            alive = false
            if hbConn then hbConn:Disconnect() end
            if gui and gui.Parent then gui:Destroy() end
        end

        task.spawn(function()
            while alive do
                local tw1 = TweenService:Create(ring, TweenInfo.new(SPIN_STEP_TIME, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Rotation = ring.Rotation + SPIN_STEP_DEG})
                local tw2 = TweenService:Create(glow, TweenInfo.new(SPIN_STEP_TIME, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Rotation = glow.Rotation + SPIN_STEP_DEG})
                tw1:Play()
                tw2:Play()
                tw1.Completed:Wait()
            end
        end)

        task.spawn(function()
            while alive do
                TweenService:Create(ringScale, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Scale = BREATH_MAX}):Play()
                task.wait(0.45)
                TweenService:Create(ringScale, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Scale = BREATH_MIN}):Play()
                task.wait(0.45)
            end
        end)

        task.spawn(function()
            while alive do
                TweenService:Create(g1, TweenInfo.new(0.9, Enum.EasingStyle.Linear), {Rotation = (g1.Rotation + 180) % 360}):Play()
                TweenService:Create(g2, TweenInfo.new(0.9, Enum.EasingStyle.Linear), {Rotation = (g2.Rotation + 180) % 360}):Play()
                task.wait(0.9)
            end
        end)

        local t0 = os.clock()
        hbConn = RunService.Heartbeat:Connect(function()
            if not alive then return end
            local t = os.clock() - t0
            local r = innerSize * 0.26
            local cx, cy = innerSize/2, innerSize/2
            local ang = t * 2.2
            local x = cx + math.cos(ang) * r
            local y = cy + math.sin(ang) * r
            dot.Position = UDim2.fromOffset(x-3, y-3)
        end)

        if DURATION and DURATION > 0 then
            task.delay(DURATION, function()
                if not alive then return end
                TweenService:Create(ringStroke, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Transparency = 1}):Play()
                TweenService:Create(glowStroke, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Transparency = 1}):Play()
                TweenService:Create(boltTop,    TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
                TweenService:Create(boltLower,  TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
                TweenService:Create(dot,        TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
                task.wait(0.36)
                _G.ThunderIntro_Stop()
            end)
        end
    end

    -- play a quick 3s intro
    Start({duration = 3})
end

-- ================= Redz Hub UI =================
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
    Title = "Thunder hub",
    SubTitle = "Best hub in the world",
    SaveFolder = "ThunderboyHubConfig"
})

-- Add a minimize button with original Redz asset
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://140277466436367",
        BackgroundTransparency = 0
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})

-- Tabs (fixed keyed args)
local UniversalTab = Window:MakeTab({ Name = "Universal", Icon = "server" })
local GamesTab     = Window:MakeTab({ Name = "Games",     Icon = "gamepad-2" })
local PlayerTab    = Window:MakeTab({ Name = "player",    Icon = "person-standing" })
local WorldTab     = Window:MakeTab({ Name = "world",     Icon = "globe" })
local RainTab      = Window:MakeTab({ Name = "Rain",      Icon = "cloud-rain" })
local HubsTab      = Window:MakeTab({ Name = "Hubs",      Icon = "scroll-text" })
Window:SelectTab(UniversalTab)

-- Services / shared vars
local Players            = game:GetService("Players")
local RunService         = game:GetService("RunService")
local UserInputService   = game:GetService("UserInputService")
local TeleportService    = game:GetService("TeleportService")
local HttpService        = game:GetService("HttpService")

local player  = Players.LocalPlayer
local placeId = game.PlaceId

-- Always-run universal (pcall to avoid halting UI)
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
end)

-- Example per-game hook
if placeId == 109983668079237 then
    print("Detected Skibidi Game!")
end

-- ================= Player tab: WalkSpeed & JumpPower =================
do
    local walkSpeedEnabled, walkSpeedValue = false, 16
    PlayerTab:AddToggle({
        Name = "Walk Speed",
        Description = "toggle custom WalkSpeed",
        Default = false,
        Callback = function(on)
            walkSpeedEnabled = on
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = on and walkSpeedValue or 16 end
        end
    })
    PlayerTab:AddSlider({
        Name = "Walk Speed (ws)",
        Min = 8, Max = 300, Increase = 1, Default = 16,
        Callback = function(v)
            walkSpeedValue = v
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum and walkSpeedEnabled then hum.WalkSpeed = v end
        end
    })

    local jumpPowerEnabled, jumpPowerValue = false, 50
    PlayerTab:AddToggle({
        Name = "Jump Power",
        Description = "toggle custom JumpPower",
        Default = false,
        Callback = function(on)
            jumpPowerEnabled = on
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = on and jumpPowerValue or 50 end
        end
    })
    PlayerTab:AddSlider({
        Name = "Jump Power amount",
        Min = 50, Max = 1000, Increase = 10, Default = 50,
        Callback = function(v)
            jumpPowerValue = v
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum and jumpPowerEnabled then hum.JumpPower = v end
        end
    })
end

-- ================= Infinite Jump =================
do
    local infJumpEnabled, infJumpConn
    PlayerTab:AddToggle({
        Name = "Infinite Jump",
        Default = false,
        Callback = function(on)
            infJumpEnabled = on
            if on then
                if infJumpConn then infJumpConn:Disconnect() end
                infJumpConn = UserInputService.JumpRequest:Connect(function()
                    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
                end)
            else
                if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
            end
        end
    })
end

-- ================= Freeze Toggle =================
do
    PlayerTab:AddToggle({
        Name = "Freeze",
        Description = "anchor your HumanoidRootPart",
        Default = false,
        Callback = function(on)
            local char = player.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored = on end
        end
    })
end

-- ================= God Mode (client-side heal) =================
do
    local godConn
    PlayerTab:AddToggle({
        Name = "God Mode (client-side heal)",
        Default = false,
        Callback = function(on)
            if godConn then godConn:Disconnect() godConn = nil end
            if on then
                local function attach(char)
                    local hum = char:WaitForChild("Humanoid")
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                    hum:GetPropertyChangedSignal("Health"):Connect(function()
                        if hum.Health < hum.MaxHealth then hum.Health = hum.MaxHealth end
                    end)
                end
                if player.Character then attach(player.Character) end
                godConn = player.CharacterAdded:Connect(attach)
            end
        end
    })
end

-- ================= Vehicle fly & boost =================
do
    local vehicleFlyEnabled, vehicleFlySpeed = false, 5
    local vehicleBoostEnabled, vehicleBoostMultiplier = false, 1.2

    local function GetVehicleFromDescendant(d)
        return d:FindFirstAncestor(Players.LocalPlayer.Name .. "'s Car")
            or (d:FindFirstAncestor("Body") and d:FindFirstAncestor("Body").Parent)
            or (d:FindFirstAncestor("Misc") and d:FindFirstAncestor("Misc").Parent)
            or d:FindFirstAncestorWhichIsA("Model")
    end

    RunService.Stepped:Connect(function()
        if not (vehicleFlyEnabled or vehicleBoostEnabled) then return end
        local lpChar = player.Character
        local hum = lpChar and lpChar:FindFirstChildOfClass("Humanoid")
        local seat = hum and hum.SeatPart
        if seat and seat:IsA("VehicleSeat") then
            local vehicle = GetVehicleFromDescendant(seat)
            if vehicle and vehicle:IsA("Model") then
                if not vehicle.PrimaryPart then
                    vehicle.PrimaryPart = (seat.Parent == vehicle) and seat or vehicle:FindFirstChildWhichIsA("BasePart")
                end
                if vehicleFlyEnabled and vehicle.PrimaryPart then
                    local lookVector = workspace.CurrentCamera.CFrame.LookVector
                    local mv = Vector3.new(
                        (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                        (UserInputService:IsKeyDown(Enum.KeyCode.E) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.Q) and 1 or 0),
                        (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
                    )
                    local relative = CFrame.new(Vector3.zero, lookVector):VectorToWorldSpace(mv)
                    vehicle:SetPrimaryPartCFrame(vehicle.PrimaryPart.CFrame + (mv.Magnitude > 0 and relative.Unit or relative) * vehicleFlySpeed)
                    seat.AssemblyLinearVelocity  = Vector3.zero
                    seat.AssemblyAngularVelocity = Vector3.zero
                end
                if vehicleBoostEnabled and UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    seat.AssemblyLinearVelocity = seat.AssemblyLinearVelocity * Vector3.new(vehicleBoostMultiplier, 1, vehicleBoostMultiplier)
                end
            end
        end
    end)

    PlayerTab:AddToggle({ Name = "Vehicle Fly", Default = false, Callback = function(v) vehicleFlyEnabled = v end })
    PlayerTab:AddSlider({ Name = "VFly Speed", Min = 1, Max = 100, Default = 5, Callback = function(v) vehicleFlySpeed = v end })
    WorldTab:AddToggle({ Name = "Vehicle Boost", Default = false, Callback = function(v) vehicleBoostEnabled = v end })
    WorldTab:AddSlider({ Name = "Boost Multiplier", Min = 1, Max = 3, Default = 1.2, Callback = function(v) vehicleBoostMultiplier = v end })
end

-- ================= Fake Lag =================
do
    local fakeLagEnabled, thread
    PlayerTab:AddToggle({
        Name = "Fake Lag",
        Default = false,
        Callback = function(on)
            fakeLagEnabled = on
            if on then
                if thread then task.cancel(thread) end
                thread = task.spawn(function()
                    while fakeLagEnabled do
                        local char = player.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Anchored = true
                            task.wait(0.2)
                            hrp.Anchored = false
                        end
                        task.wait()
                    end
                end)
            else
                if thread then task.cancel(thread) thread = nil end
            end
        end
    })
end

-- ================= Script Buttons =================
UniversalTab:AddButton({ Name = "RTX Shader", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/p0e1/1/refs/heads/main/SimpleShader.lua"))() end)
end })

GamesTab:AddButton({ Name = "Trashcan Man", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))() end)
end })

GamesTab:AddButton({ Name = "99 nights with diddy", Callback = function()
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ago106/SpaceHub/refs/heads/main/loader.lua'))() end)
end })

GamesTab:AddButton({ Name = "MM2", Callback = function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
    end)
end })

UniversalTab:AddButton({ Name = "F3X", Callback = function()
    pcall(function() loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)() end)
end })

UniversalTab:AddButton({ Name = "Dex Explorer", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))() end)
end })

UniversalTab:AddButton({ Name = "Infinite Yield", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
end })

GamesTab:AddButton({ Name = "BedWars", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))() end)
end })

GamesTab:AddButton({ Name = "tabse", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))() end)
end })

GamesTab:AddButton({
    Name = "grow my balls",
    Callback = function()
        repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
        local scripts = {
            [126884695634066] = "https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Garden/Garden-V1.lua",
            [81440632616906]  = "https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/DigEarth/V1.lua",
        }
        local url = scripts[game.PlaceId]
        if url then
            pcall(function() loadstring(game:HttpGetAsync(url))() end)
            pcall(function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/untitled.lua"))() end)
        end
    end
})

GamesTab:AddButton({ Name = "alive Rails", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Qiwikox12/stubrawl/refs/heads/main/DeadRails.txt"))() end)
end })

GamesTab:AddButton({ Name = "windows", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/NuIlFire/NullFire/main/loader.lua"))() end)
end })

GamesTab:AddButton({ Name = "Rivalz (keyed)", Callback = function()
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/rivals/venoxware'))() end)
end })

GamesTab:AddButton({
    Name = "Forsaken (keyd)",
    Description = "forskaen",
    Callback = function()
        if getgenv then
            getgenv().BloxtrapRPC        = "true"
            getgenv().DebugNotifications = "false"
            getgenv().TrackMePlease      = "true"
        end
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))() end)
    end
})

GamesTab:AddButton({ Name = "Slap my cheeks (keyed)", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))() end)
end })

HubsTab:AddButton({ Name = "Nut Hub", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/working/main/pc"))() end)
end })

HubsTab:AddButton({ Name = "Forge Hub", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))() end)
end })

HubsTab:AddButton({ Name = "Ghost Hub", Callback = function()
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))() end)
end })

HubsTab:AddButton({ Name = "Script Hub (Xeno)", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/scripthubv3xeno/refs/heads/main/scripthubv3", true))() end)
end })

HubsTab:AddButton({ Name = "Serenade Hub", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Serenade-Hub-14102"))() end)
end })

HubsTab:AddButton({ Name = "RINNS Hub", Callback = function()
    pcall(function() loadstring(game:HttpGet("https://scriptblox.com/raw/Horrors-RNG-PHOBIA-1-RINNS-HUB-Support-Solara-14329"))() end)
end })

-- ================= Spectate & Follow =================
do
    local Camera = workspace.CurrentCamera

    -- Spectate
    local spectating, spectateTargetName
    local function getPlayerList()
        local list = {}
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl ~= player then table.insert(list, pl.Name) end
        end
        return list
    end
    local spectateDropdown = WorldTab:AddDropdown({
        Name = "Spectate Player",
        Options = getPlayerList(),
        Callback = function(val) spectateTargetName = val end
    })
    local function updateSpectateList() spectateDropdown:UpdateOptions(getPlayerList()) end
    Players.PlayerAdded:Connect(function()
        task.wait(0.5)
        updateSpectateList()
    end)
    Players.PlayerRemoving:Connect(updateSpectateList)

    WorldTab:AddToggle({
        Name = "Spectate",
        Default = false,
        Callback = function(on)
            spectating = on
            if not on then
                Camera.CameraType = Enum.CameraType.Custom
                local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if hum then Camera.CameraSubject = hum end
            end
        end
    })

    RunService.RenderStepped:Connect(function()
        if spectating and spectateTargetName then
            local t = Players:FindFirstChild(spectateTargetName)
            local head = t and t.Character and t.Character:FindFirstChild("Head")
            if head then
                Camera.CameraType = Enum.CameraType.Scriptable
                Camera.CFrame = CFrame.new(head.Position + Vector3.new(0, 5, 10), head.Position)
            end
        end
    end)

    -- Follow
    local following, followName
    local followDropdown = WorldTab:AddDropdown({
        Name = "Follow Player",
        Options = getPlayerList(),
        Callback = function(val) followName = val end
    })
    local function updateFollowList() followDropdown:UpdateOptions(getPlayerList()) end
    Players.PlayerAdded:Connect(function()
        task.wait(0.5)
        updateFollowList()
    end)
    Players.PlayerRemoving:Connect(updateFollowList)

    WorldTab:AddToggle({
        Name = "Follow",
        Default = false,
        Callback = function(on) following = on end
    })

    RunService.Heartbeat:Connect(function()
        if following and followName then
            local tgt = Players:FindFirstChild(followName)
            local myChar = player.Character
            if tgt and tgt.Character and myChar then
                local tHRP = tgt.Character:FindFirstChild("HumanoidRootPart")
                local mHRP = myChar:FindFirstChild("HumanoidRootPart")
                if tHRP and mHRP and (tHRP.Position - mHRP.Position).Magnitude > 5 then
                    mHRP.CFrame = mHRP.CFrame:Lerp(CFrame.new(tHRP.Position - Vector3.new(0,0,2)), 0.2)
                end
            end
        end
    end)
end

-- Quick follow buttons
do
    local savedPos
    UniversalTab:AddButton({
        Name = "Follow Thunder",
        Callback = function()
            local target = Players:FindFirstChild("qt69z")
            if target then
                RunService.RenderStepped:Connect(function()
                    local tChar = target.Character
                    local pChar = player.Character
                    if tChar and pChar then
                        local tHRP = tChar:FindFirstChild("HumanoidRootPart")
                        local pHRP = pChar:FindFirstChild("HumanoidRootPart")
                        if tHRP and pHRP then
                            pHRP.CFrame = tHRP.CFrame * CFrame.new(0, 0, 2)
                        end
                    end
                end)
            end
        end
    })
    UniversalTab:AddButton({
        Name = "Follow Rain",
        Callback = function()
            local target = Players:FindFirstChild("grugguyi")
            if target then
                RunService.RenderStepped:Connect(function()
                    local tChar = target.Character
                    local pChar = player.Character
                    if tChar and pChar then
                        local tHRP = tChar:FindFirstChild("HumanoidRootPart")
                        local pHRP = pChar:FindFirstChild("HumanoidRootPart")
                        if tHRP and pHRP then
                            pHRP.CFrame = tHRP.CFrame * CFrame.new(0, 0, 2)
                        end
                    end
                end)
            end
        end
    })
    UniversalTab:AddButton({
        Name = "Save pos",
        Callback = function()
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                savedPos = hrp.Position
                warn("[PORTAL] Saved position at:", savedPos)
            end
        end
    })
    UniversalTab:AddButton({
        Name = "Tp to saved pos ",
        Callback = function()
            if savedPos then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(savedPos + Vector3.new(0, 5, 0))
                    warn("[PORTAL] Teleported to saved location.")
                end
            else
                warn("[PORTAL] No position saved yet.")
            end
        end
    })
end

-- ================= SpinBot =================
do
    local spinning, conn
    PlayerTab:AddToggle({
        Name = "SpinBot",
        Default = false,
        Callback = function(on)
            spinning = on
            if conn then conn:Disconnect() conn = nil end
            if on then
                conn = RunService.RenderStepped:Connect(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(15), 0) end
                end)
            end
        end
    })
end

-- ================= Anti-AFK (toggleable) =================
do
    local antiAFKConn
    PlayerTab:AddToggle({
        Name = "Anti-AFK",
        Default = false,
        Callback = function(on)
            if antiAFKConn then antiAFKConn:Disconnect() antiAFKConn = nil end
            if on then
                local vu = game:GetService("VirtualUser")
                antiAFKConn = player.Idled:Connect(function()
                    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            end
        end
    })
end

-- ================= Rejoin / Server Hop =================
WorldTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, player)
    end
})

WorldTab:AddButton({
    Name = "Server Hop",
    Callback = function()
        local ok, data = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)))
        end)
        if ok and data and data.data then
            for _, v in ipairs(data.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, player)
                    break
                end
            end
        end
    end
})

-- ================= Reset Character =================
PlayerTab:AddButton({
    Name = "Reset Character",
    Callback = function()
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end
})

-- ================= Rain tab: Emotes & Rig auto button =================
RainTab:AddButton({
    Name = "Emotes Pack",
    Callback = function()
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Free-emote/refs/heads/main/Delta%20mad%20stuffs"))() end)
    end
})

RainTab:AddButton({
    Name = "Rig Auto (R6/R15)",
    Callback = function()
        local plr = Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if hum.RigType == Enum.HumanoidRigType.R6 then
            pcall(function() loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() end)
        elseif hum.RigType == Enum.HumanoidRigType.R15 then
            pcall(function() loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))() end)
        else
            warn("Unknown rig type.")
        end
    end
})

-- ================= Egor Mode (toggle) =================
do
    local egorEnabled = false
    local runAnimId = "rbxassetid://913376220"
    local runTrack, runConn
    local lastHumanoid
    local originalWalkSpeed = 16

    local function getHumanoid()
        local char = player.Character or player.CharacterAdded:Wait()
        return char:FindFirstChildOfClass("Humanoid")
    end
    local function playRunAnimation(h)
        if runConn then runConn:Disconnect() runConn = nil end
        if runTrack then pcall(function() runTrack:Stop() end) runTrack = nil end
        local animator = h:FindFirstChildWhichIsA("Animator") or Instance.new("Animator", h)
        local runAnim = Instance.new("Animation")
        runAnim.AnimationId = runAnimId
        runTrack = animator:LoadAnimation(runAnim)
        runTrack.Priority = Enum.AnimationPriority.Movement
        runTrack:Play()
        runTrack:AdjustSpeed(6)
        runConn = RunService.RenderStepped:Connect(function()
            if h.Health <= 0 then return end
            if h.MoveDirection.Magnitude == 0 then
                if runTrack.IsPlaying then runTrack:Stop() end
            else
                if not runTrack.IsPlaying then runTrack:Play(); runTrack:AdjustSpeed(6) end
            end
        end)
    end
    local function stopRunAnimation()
        if runConn then runConn:Disconnect() runConn = nil end
        if runTrack then pcall(function() runTrack:Stop() end) runTrack = nil end
    end
    local function enableEgor()
        local hum = getHumanoid()
        if not hum then return end
        lastHumanoid = hum
        originalWalkSpeed = hum.WalkSpeed
        hum.WalkSpeed = 3
        playRunAnimation(hum)
    end
    local function disableEgor()
        stopRunAnimation()
        local hum = lastHumanoid or getHumanoid()
        if hum and hum.Parent then hum.WalkSpeed = originalWalkSpeed or 16 end
    end

    player.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid")
        lastHumanoid = hum
        if egorEnabled then
            task.defer(enableEgor)
        else
            originalWalkSpeed = hum.WalkSpeed
            stopRunAnimation()
        end
    end)

    RainTab:AddToggle({
        Name = "Egor Mode",
        Default = false,
        Callback = function(v)
            egorEnabled = v
            if v then enableEgor() else disableEgor() end
        end
    })
end

-- ================= Shake Animation Toggle (single) =================
do
    local ANIM_ID        = 136720812089001
    local LOOPED         = true
    local PLAYBACK_SPEED = 1
    local ANIM_WEIGHT    = 99

    local track, originalRot
    local enabled = false
    local respawnConn

    local function loadAnimation(humanoid)
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then
            animator = Instance.new("Animator")
            animator.Parent = humanoid
        end
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://" .. ANIM_ID
        return animator:LoadAnimation(anim)
    end

    local function rotate180(hrp)
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(180), 0)
    end

    local function enableShake()
        if enabled then return end
        enabled = true

        local char = player.Character or player.CharacterAdded:Wait()
        local hum  = char:WaitForChild("Humanoid")
        local hrp  = char:WaitForChild("HumanoidRootPart")

        originalRot = hrp.CFrame - hrp.Position

        track = loadAnimation(hum)
        track.Looped = LOOPED
        track.Priority = Enum.AnimationPriority.Action
        track:Play(0, ANIM_WEIGHT)
        track:AdjustSpeed(PLAYBACK_SPEED)

        rotate180(hrp)

        if respawnConn then respawnConn:Disconnect() end
        respawnConn = player.CharacterAdded:Connect(function(nchar)
            if not enabled then return end
            local nhum = nchar:WaitForChild("Humanoid")
            local nhrp = nchar:WaitForChild("HumanoidRootPart")
            originalRot = nhrp.CFrame - nhrp.Position
            track = loadAnimation(nhum)
            track.Looped = LOOPED
            track.Priority = Enum.AnimationPriority.Action
            track:Play(0, ANIM_WEIGHT)
            track:AdjustSpeed(PLAYBACK_SPEED)
            rotate180(nhrp)
        end)
    end

    local function disableShake()
        if not enabled then return end
        enabled = false

        if track then
            pcall(function()
                track:Stop(0)
                track:Destroy()
            end)
            track = nil
        end

        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp and originalRot then
            hrp.CFrame = CFrame.new(hrp.Position) * originalRot
        end

        if respawnConn then
            respawnConn:Disconnect()
            respawnConn = nil
        end
    end

    RainTab:AddToggle({
        Name = "Shake Animation",
        Default = false,
        Callback = function(on)
            if on then enableShake() else disableShake() end
        end
    })
end

-- ================= Thunder Hub: Emote Buttons (R15) =================
-- === Sticky Emotes (move-safe) + Stop button ===
do
    local Players      = game:GetService("Players")
    local RunService   = game:GetService("RunService")
    local plr          = Players.LocalPlayer

    -- your labels + catalog emote IDs
    local EMOTES = {
        {"head lock",            80739353343234},
        {"omni man",             99299473056611},
        {"Rambunctious",        108128682361404},
        {"wally east",          116838147343307},
        {"suiiiii",             107447321843426},
        {"shake it so good",    114346581785531},
        {"shake it V2",          80688358107664},
        {"egor aura",           121789523581713},
        {"i wana run away",     135431679610889},
        {"i show meat",         115140785623125},
        {"egor emote",           95867379888918},
        {"fake death",          114899970878842},
        {"rat dance",               98603994713783},
        {"take the L",             112884830175040},
        {"peter griffin pose",     120437019363089},
        {"laying down",             99027487055457},
        {"defualt dance",           99818263438846},
        {"bubbly sit",             120319548179122},
        {"relaxed sit",             99568437064777},
        {"nuh uh",                  79464705501947},
        {"floss",                     5917570207},
        {"skibdi",                 124828909173982},
        {"mewing",                 107998220191434},
        {"what you want",          100576647621125},
        {"floating gojo",          103040723950430},
        {"gojo hounored one",      101048167923779},
        {"gojo dead",              123470584988273},
        {"locked in",              132031811973422},
        {"spining t pose",          73243020510644},
        {"/e headless korblox",     97391997488948},
        {"monster mash",           122241742551119},
        {"hug",                      90854093665637},
        {"russain dance",           74608751145756},
        {"lay on side",             93783301712817},
        {"spite",                   71794098263966},
        {"wheel",                  101051308884863},
        {"hakari dance",           109979421798215},
        {"no no no",                90330877197434},
        {"/e dance2",              134859909130355},
        {"r6 sit",                  82003739769858},
        {"/e dance 2012",          110226648097430},
    }

    -- internal state
    local currentTracks = {}
    local keepAliveConn = nil
    local lastAnimate   = nil
    local playingEmote  = { label = nil, id = nil }

    local function getHumanoid()
        local char = plr.Character or plr.CharacterAdded:Wait()
        return char:FindFirstChildOfClass("Humanoid"), char
    end

    local function ensureAnimator(h)
        local a = h:FindFirstChildOfClass("Animator")
        if not a then a = Instance.new("Animator", h) end
        return a
    end

    local function disableDefaultAnimate(char)
        local a = char and char:FindFirstChild("Animate")
        if a and a:IsA("LocalScript") then
            lastAnimate = a
            a.Disabled = true
        else
            lastAnimate = nil
        end
    end

    local function enableDefaultAnimate()
        if lastAnimate and lastAnimate.Parent then
            lastAnimate.Disabled = false
        end
        lastAnimate = nil
    end

    local function diffNewTracks(animator, before)
        local seen = {}
        for _,t in ipairs(before) do seen[t] = true end
        local new = {}
        for _,t in ipairs(animator:GetPlayingAnimationTracks()) do
            if not seen[t] then table.insert(new, t) end
        end
        return new
    end

    local function ensureInDescription(h, label, id)
        local desc   = h:GetAppliedDescription()
        local emotes = desc:GetEmotes() or {}
        local key    = ("E_%s_%d"):format(label:gsub("%W",""), id)
        emotes[key]  = { id }
        desc:SetEmotes(emotes)
        h:ApplyDescription(desc)
    end

    local function stopEmote()
        if keepAliveConn then keepAliveConn:Disconnect() keepAliveConn = nil end
        for _,t in ipairs(currentTracks) do pcall(function() t:Stop(0) end) end
        currentTracks = {}
        playingEmote  = { label = nil, id = nil }
        enableDefaultAnimate()
    end

    -- UI: Stop button
    RainTab:AddButton({
        Name = "Stop Emote",
        Callback = stopEmote
    })

    -- replay logic that survives movement & other overrides
    local function playStickyEmote(label, id)
        local h, char = getHumanoid()
        if not h then return end
        if h.RigType ~= Enum.HumanoidRigType.R15 then
            warn(("[Emotes] %s requires R15."):format(label))
            return
        end

        local animator = ensureAnimator(h)
        local before   = animator:GetPlayingAnimationTracks()

        -- try play; if Roblox says “not in emote list”, inject then retry
        local ok, track = pcall(function()
            return h:PlayEmoteAndGetAnimTrackById(id)
        end)
        if not ok or not track then
            ensureInDescription(h, label, id)
            ok, track = pcall(function()
                return h:PlayEmoteAndGetAnimTrackById(id)
            end)
            if not ok or not track then
                warn(string.format("[Emotes] Failed to play '%s' (%d): %s", label, id, tostring(track)))
                return
            end
        end

        -- find which tracks started because of the emote
        task.wait() -- tiny yield so tracks register
        local newTracks = diffNewTracks(animator, before)
        if #newTracks == 0 and typeof(track) == "Instance" then
            newTracks = { track }
        end
        currentTracks = newTracks

        -- make it “sticky”: block default run/walk from overriding
        disableDefaultAnimate(char)

        -- loop & keep alive
        for _,t in ipairs(currentTracks) do pcall(function() t.Looped = true end) end
        playingEmote = { label = label, id = id }

        if keepAliveConn then keepAliveConn:Disconnect() keepAliveConn = nil end
        keepAliveConn = RunService.Heartbeat:Connect(function()
            -- if *all* emote tracks stopped, replay
            local allStopped = true
            for _,t in ipairs(currentTracks) do
                if t.IsPlaying then allStopped = false break end
            end
            if allStopped and playingEmote.id then
                local beforeReplay = animator:GetPlayingAnimationTracks()
                pcall(function() h:PlayEmoteAndGetAnimTrackById(playingEmote.id) end)
                task.wait()
                currentTracks = diffNewTracks(animator, beforeReplay)
                for _,t in ipairs(currentTracks) do pcall(function() t.Looped = true end) end
            end
        end)
    end

    -- rebuild state safely on respawn
    plr.CharacterAdded:Connect(function(newChar)
        stopEmote() -- clean any leftover connections
        -- let default Animate run on fresh spawn until user plays a new emote
    end)

    -- build a button per emote
    for _, pair in ipairs(EMOTES) do
        local label, id = pair[1], pair[2]
        RainTab:AddButton({
            Name = label,
            Callback = function()
                playStickyEmote(label, id)
            end
        })
    end
end

-- ================= TP Tool =================
WorldTab:AddButton({
    Name = "TP Tool",
    Description = "Click-to-teleport tool",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Teleport Tool"
        tool.Activated:Connect(function()
            local mouse = player:GetMouse()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(pos.X, pos.Y, pos.Z) end
        end)
        tool.Parent = player.Backpack
    end
})
