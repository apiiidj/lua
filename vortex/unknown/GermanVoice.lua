

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "RH5KTH"
getgenv().scriptidentifier = "GermanVoice"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/RH5KTH/ws-loader"))()
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/NightSyste/NightUI/refs/heads/main/Night.lua'))()


OrionLib.MakeNotification = function() end
OrionLib.MakeNotifi = function() end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

local Window = OrionLib:MakeWindow({
    Name = "German Voice",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "GermanVoice",
    IntroEnabled = false
})


local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

MainTab:AddSection({
    Name = "Auto Plays The Spinner (Stand near the Spinner)"
})

local autoSpinnerConnection
MainTab:AddToggle({
    Name = "Auto Play Spinner",
    Default = false,
    Callback = function(enabled)
        if autoSpinnerConnection then
            autoSpinnerConnection:Disconnect()
            autoSpinnerConnection = nil
        end

        if enabled then
            autoSpinnerConnection = RunService.Heartbeat:Connect(function()
                pcall(function()
                    local env = workspace:FindFirstChild("Environment")
                    local poi = env and env:FindFirstChild("PointOfInterest")
                    local games = poi and poi:FindFirstChild("SpinnerGames")
                    local slot = games and games:FindFirstChild("SlotMinigame")
                    local btn = slot and slot:FindFirstChild("Button")
                    local head = btn and btn:FindFirstChild("Head")
                    local prompt = head and head:FindFirstChild("ProximityPrompt")

                    if prompt then
                        prompt:InputHoldBegin()
                    end
                end)
            end)
        end
    end
})

MainTab:AddSection({
    Name = "Anti Ragdoll"
})

local antiRagdollEnabled = false
local antiRagdollConnections = {}

MainTab:AddToggle({
    Name = "Anti Ragdoll",
    Default = false,
    Callback = function(enabled)
        antiRagdollEnabled = enabled

        for _, conn in pairs(antiRagdollConnections) do
            if conn then
                conn:Disconnect()
            end
        end
        antiRagdollConnections = {}

        if antiRagdollEnabled then
            local conn1 = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if not character then return end

                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    local state = humanoid:GetState()
                    if state == Enum.HumanoidStateType.Physics
                        or state == Enum.HumanoidStateType.Ragdoll
                        or state == Enum.HumanoidStateType.FallingDown then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end

                    if humanoid.PlatformStand then
                        humanoid.PlatformStand = false
                    end
                end
            end)
            table.insert(antiRagdollConnections, conn1)

            local conn2 = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if not character then return end

                local shouldGetUp = false
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("Motor6D") and not part.Enabled then
                        shouldGetUp = true
                        part.Enabled = true
                    end
                end

                if shouldGetUp then
                    local humanoid = character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                        humanoid.PlatformStand = false
                    end
                end
            end)
            table.insert(antiRagdollConnections, conn2)

            local function hookCharacter(char)
                local humanoid = char:WaitForChild("Humanoid")
                if humanoid then
                    local conn3 = humanoid.StateChanged:Connect(function(_, newState)
                        if antiRagdollEnabled then
                            if newState == Enum.HumanoidStateType.Physics
                                or newState == Enum.HumanoidStateType.Ragdoll
                                or newState == Enum.HumanoidStateType.FallingDown then
                                task.wait(0.1)
                                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                                humanoid.PlatformStand = false
                            end
                        end
                    end)
                    table.insert(antiRagdollConnections, conn3)
                end
            end

            if LocalPlayer.Character then
                hookCharacter(LocalPlayer.Character)
            end

            local conn4 = LocalPlayer.CharacterAdded:Connect(hookCharacter)
            table.insert(antiRagdollConnections, conn4)
        end
    end
})


local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://7734058803",
    PremiumOnly = false
})

local noclipConnection
MiscTab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(enabled)
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end

        if enabled then
            noclipConnection = RunService.Stepped:Connect(function()
                local character = LocalPlayer.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
})

local flyEnabled = false
local flyConnections = {}
local flyInstances = {}

MiscTab:AddToggle({
    Name = "Fly",
    Default = false,
    Callback = function(enabled)
        local character = LocalPlayer.Character
        if not character then return end

        local hrp = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        if not hrp or not humanoid then return end

        flyEnabled = enabled

        for _, conn in ipairs(flyConnections) do
            if conn then conn:Disconnect() end
        end
        flyConnections = {}

        for _, inst in pairs(flyInstances) do
            if inst then inst:Destroy() end
        end
        flyInstances = {}

        if flyEnabled then
            local bg = Instance.new("BodyGyro")
            bg.P = 90000
            bg.MaxTorque = Vector3.new(90000, 90000, 90000)
            bg.CFrame = hrp.CFrame
            bg.Parent = hrp

            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(90000, 90000, 90000)
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.Parent = hrp

            flyInstances = {
                BodyGyro = bg,
                BodyVelocity = bv
            }

            local keys = {
                W = false,
                A = false,
                S = false,
                D = false,
                Space = false,
                LeftControl = false
            }

            table.insert(flyConnections, UserInputService.InputBegan:Connect(function(input, gpe)
                if not gpe and input.UserInputType == Enum.UserInputType.Keyboard and keys[input.KeyCode.Name] ~= nil then
                    keys[input.KeyCode.Name] = true
                end
            end))

            table.insert(flyConnections, UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard and keys[input.KeyCode.Name] ~= nil then
                    keys[input.KeyCode.Name] = false
                end
            end))

            table.insert(flyConnections, RunService.Heartbeat:Connect(function()
                local moveDir = Vector3.new()
                local cam = workspace.CurrentCamera

                if keys.W then moveDir = moveDir + cam.CFrame.LookVector end
                if keys.S then moveDir = moveDir - cam.CFrame.LookVector end
                if keys.A then moveDir = moveDir - cam.CFrame.RightVector end
                if keys.D then moveDir = moveDir + cam.CFrame.RightVector end
                if keys.Space then moveDir = moveDir + Vector3.new(0, 1, 0) end
                if keys.LeftControl then moveDir = moveDir - Vector3.new(0, 1, 0) end

                if moveDir.Magnitude > 0 then
                    moveDir = moveDir.Unit * 150
                end

                if flyInstances.BodyVelocity then
                    flyInstances.BodyVelocity.Velocity = moveDir
                end

                if flyInstances.BodyGyro then
                    flyInstances.BodyGyro.CFrame = cam.CFrame
                end
            end))

            humanoid.PlatformStand = true
        else
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end
})

local infJumpConnection
MiscTab:AddToggle({
    Name = "Inf Jump",
    Default = false,
    Callback = function(enabled)
        if infJumpConnection then
            infJumpConnection:Disconnect()
            infJumpConnection = nil
        end

        if enabled then
            infJumpConnection = UserInputService.JumpRequest:Connect(function()
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end
})

local currentWalkSpeed = 16
local currentJumpPower = 50

local function getHumanoid()
    local character = LocalPlayer.Character
    return character and character:FindFirstChild("Humanoid")
end

local initialHum = getHumanoid()
if initialHum then
    currentWalkSpeed = initialHum.WalkSpeed
    currentJumpPower = initialHum.JumpPower
end

local function applyHumanoidStats(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.WalkSpeed = currentWalkSpeed
        humanoid.JumpPower = currentJumpPower
    end
end

LocalPlayer.CharacterAdded:Connect(applyHumanoidStats)
if LocalPlayer.Character then
    applyHumanoidStats(LocalPlayer.Character)
end

MiscTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 500,
    Increment = 1,
    Default = currentWalkSpeed,
    ValueName = "Speed",
    Callback = function(value)
        currentWalkSpeed = value
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.WalkSpeed = value
        else
            task.wait(0.5)
            humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end
})

MiscTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 500,
    Increment = 1,
    Default = currentJumpPower,
    ValueName = "Power",
    Callback = function(value)
        currentJumpPower = value
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.JumpPower = value
        else
            task.wait(0.5)
            humanoid = getHumanoid()
            if humanoid then
                humanoid.JumpPower = value
            end
        end
    end
})


local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://7733992789",
    PremiumOnly = false
})

local locations = {
    { name = "Leaderboard", cframe = CFrame.new(-124.84660339355, 5.2480249404907, 82.184791564941) },
    { name = "Tree House",  cframe = CFrame.new(-331.76126098633, 41.764930725098, -215.9174041748) },
    { name = "Spinner",     cframe = CFrame.new(-531.45776367188, 5.3156952857971, -226.83279418945) },
    { name = "Obby",        cframe = CFrame.new(270.0188293457, 5.2480249404907, -21.698335647583) },
    { name = "Camp Fire",   cframe = CFrame.new(-302.22491455078, 6.4515089988708, 243.78918457031) },
    { name = "Middle",      cframe = CFrame.new(-119.75520324707, 13.515551567078, -20.345983505249) },
    { name = "Shop",        cframe = CFrame.new(-248.02697753906, 5.9216246604919, -47.490081787109) },
    { name = "Soccer",      cframe = CFrame.new(-342.5754699707, 5.1053681373596, -107.95389556885) },
    { name = "Vip Lounge",  cframe = CFrame.new(-119.68654632568, 5.2480249404907, 146.0291595459) }
}

for _, loc in ipairs(locations) do
    TeleportTab:AddButton({
        Name = loc.name,
        Callback = function()
            local character = LocalPlayer.Character
            local hrp = character and character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = loc.cframe
            end
        end
    })
end


local PianoTab = Window:MakeTab({
    Name = "Piano",
    Icon = "rbxassetid://7734020554",
    PremiumOnly = false
})

PianoTab:AddButton({
    Name = "Talentless Piano",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/TALENTLESS.lua", true))()
        end)
    end
})


local PlayerTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://7743875962",
    PremiumOnly = false
})

local playerFolder = workspace:FindFirstChild("PlayerCharacters")
    or workspace:FindFirstChild("Players")
    or workspace:FindFirstChild("Characters")

if not playerFolder then
    for _, child in ipairs(workspace:GetChildren()) do
        if child:IsA("Folder") and child:FindFirstChild("Humanoid") then
            playerFolder = child
            break
        end
    end
end

if not playerFolder then
    playerFolder = Players
end

local function getPlayerList()
    local list = {}
    if playerFolder then
        for _, child in ipairs(playerFolder:GetChildren()) do
            local isTarget = false
            if child:IsA("Model") and child:FindFirstChild("Humanoid") and child.Name ~= LocalPlayer.Name then
                isTarget = true
            elseif child:IsA("Player") and child.Name ~= LocalPlayer.Name then
                isTarget = true
            end

            if isTarget then
                table.insert(list, child.Name)
            end
        end
    end
    return list
end

local playerList = getPlayerList()
local selectedPlayer = playerList[1] or ""

local playerDropdown = PlayerTab:AddDropdown({
    Name = "Player",
    Options = playerList,
    Default = selectedPlayer,
    Callback = function(val)
        if type(val) == "table" then
            selectedPlayer = val[1] or ""
        else
            selectedPlayer = val or ""
        end
    end
})

task.spawn(function()
    while task.wait(3) do
        if playerFolder and playerDropdown then
            local current = selectedPlayer
            local newList = getPlayerList()
            playerDropdown:Refresh(newList, true)

            if current ~= "" and table.find(newList, current) then
                playerDropdown:Set(current)
                selectedPlayer = current
            else
                selectedPlayer = newList[1] or ""
                playerDropdown:Set(selectedPlayer)
            end
        end
    end
end)

local function getTargetCharacter(name)
    if not playerFolder or not name or name == "" then return nil end
    if playerFolder:IsA("Players") then
        local p = playerFolder:FindFirstChild(name)
        return p and p.Character
    else
        return playerFolder:FindFirstChild(name)
    end
end

local viewPlayerEnabled = false
local viewPlayerConnection

PlayerTab:AddToggle({
    Name = "View Player",
    Default = false,
    Callback = function(enabled)
        viewPlayerEnabled = enabled
        local camera = workspace.CurrentCamera

        if viewPlayerConnection then
            viewPlayerConnection:Disconnect()
            viewPlayerConnection = nil
        end

        if viewPlayerEnabled then
            viewPlayerConnection = RunService.RenderStepped:Connect(function()
                local targetChar = getTargetCharacter(selectedPlayer)
                local hum = targetChar and targetChar:FindFirstChild("Humanoid")
                if hum then
                    camera.CameraType = Enum.CameraType.Custom
                    camera.CameraSubject = hum
                end
            end)
        else
            camera.CameraType = Enum.CameraType.Custom
            local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if myHum then
                camera.CameraSubject = myHum
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "Teleport Player",
    Callback = function()
        local targetChar = getTargetCharacter(selectedPlayer)
        local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if targetHrp and myHrp then
            myHrp.CFrame = targetHrp.CFrame
        end
    end
})

local loopTeleportEnabled = false
local loopTeleportConnection

PlayerTab:AddToggle({
    Name = "Loop Teleport to Player",
    Default = false,
    Callback = function(enabled)
        loopTeleportEnabled = enabled

        if loopTeleportConnection then
            loopTeleportConnection:Disconnect()
            loopTeleportConnection = nil
        end

        if loopTeleportEnabled then
            loopTeleportConnection = RunService.Heartbeat:Connect(function()
                local targetChar = getTargetCharacter(selectedPlayer)
                local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                if targetHrp and myHrp then
                    myHrp.CFrame = targetHrp.CFrame
                end
            end)
        end
    end
})

local animActions = {
    {
        name = "Bang V2",
        r6 = "https://pastebin.com/raw/aPSHMV6K",
        r15 = "https://pastebin.com/raw/1ePMTt9n"
    },
    {
        name = "Get Banged",
        r6 = "https://pastebin.com/raw/zHbw7ND1",
        r15 = "https://pastebin.com/raw/7hvcjDnW"
    },
    {
        name = "Suck",
        r6 = "https://pastebin.com/raw/SymCfnAW",
        r15 = "https://pastebin.com/raw/p8yxRfr4"
    },
    {
        name = "Get Suc",
        r6 = "https://pastebin.com/raw/FPu4e2Qh",
        r15 = "https://pastebin.com/raw/DyPP2tAF"
    },
    {
        name = "Jerk",
        r6 = "https://pastefy.app/wa3v2Vgm/raw",
        r15 = "https://pastefy.app/YZoglOyJ/raw"
    }
}

for _, action in ipairs(animActions) do
    PlayerTab:AddButton({
        Name = action.name,
        Callback = function()
            local character = LocalPlayer.Character
            if not character then return end

            if character:FindFirstChild("Torso") ~= nil then
                loadstring(game:HttpGet(action.r6))()
            else
                loadstring(game:HttpGet(action.r15))()
            end
        end
    })
end


local ServerTab = Window:MakeTab({
    Name = "Server",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

ServerTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

ServerTab:AddButton({
    Name = "Server Hop",
    Callback = function()
        local success, result = pcall(function()
            local response = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100")
            return HttpService:JSONDecode(response)
        end)

        if success and result and result.data then
            local currentJobId = game.JobId
            for _, s in ipairs(result.data) do
                if s.playing < s.maxPlayers and currentJobId ~= s.id then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    return
                end
            end
        end
    end
})

ServerTab:AddButton({
    Name = "Server Hop To Lowest Server",
    Callback = function()
        local cursor = ""
        local foundServer = nil

        while true do
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and ("&cursor=" .. cursor) or "")
            local success, result = pcall(function()
                local response = game:HttpGet(url)
                return HttpService:JSONDecode(response)
            end)

            if not success or not result or not result.data then
                break
            end

            for _, s in ipairs(result.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    foundServer = s
                    break
                end
            end

            if foundServer or not result.nextPageCursor then
                break
            end

            cursor = result.nextPageCursor
        end

        if foundServer then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, foundServer.id, LocalPlayer)
        end
    end
})


local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})


local antiAfkEnabled = false
local antiAfkConnection = nil
local antiAfkThread = nil

local function sendAntiAfkInput()
    
    pcall(function()
        if VirtualInputManager then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.RightControl, false, game)
        end
    end)

    
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

SettingsTab:AddToggle({
    Name = "Anti AFK",
    Default = false,
    Callback = function(enabled)
        antiAfkEnabled = enabled

        if antiAfkConnection then
            antiAfkConnection:Disconnect()
            antiAfkConnection = nil
        end
        if antiAfkThread then
            task.cancel(antiAfkThread)
            antiAfkThread = nil
        end

        if antiAfkEnabled then
            
            if getconnections then
                for _, conn in pairs(getconnections(LocalPlayer.Idled)) do
                    if conn.Disable then
                        conn:Disable()
                    elseif conn.Disconnect then
                        conn:Disconnect()
                    end
                end
            end

            
            antiAfkConnection = LocalPlayer.Idled:Connect(function()
                if antiAfkEnabled then
                    sendAntiAfkInput()
                end
            end)

            
            antiAfkThread = task.spawn(function()
                while antiAfkEnabled do
                    task.wait(300)
                    if antiAfkEnabled then
                        sendAntiAfkInput()
                    end
                end
            end)
        end
    end
})

SettingsTab:AddButton({
    Name = "Smart Reset",
    Callback = function()
        local character = LocalPlayer.Character
        if not character then return end

        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local savedCFrame = hrp.CFrame

        character:BreakJoints()

        local newChar = LocalPlayer.CharacterAdded:Wait()
        task.wait(0.5)

        local newHrp = newChar:FindFirstChild("HumanoidRootPart")
        if newHrp then
            newHrp.CFrame = savedCFrame
        end
    end
})

SettingsTab:AddButton({
    Name = "Join Discord",
    Callback = function()
        local req = request or http_request or (http and http.request) or (syn and syn.request)
        if req then
            pcall(function()
                req({
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        Origin = "https://discord.com"
                    },
                    Body = HttpService:JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = { code = "8nKxKcerCv" },
                        nonce = HttpService:GenerateGUID(false)
                    })
                })
            end)
        end
        if setclipboard then
            setclipboard("https://discord.gg/8nKxKcerCv")
        end
    end
})

OrionLib:Init()