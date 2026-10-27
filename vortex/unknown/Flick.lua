

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "SNN44R"
getgenv().scriptidentifier = "Flick"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/SNN44R/ws-loader"))()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LINKVERTISE_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/start?integrationId=ae351194-33ec-4ebd-98d6-c9784aa74119"
local LOOTLABS_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/start?integrationId=5c989eaf-f3b0-40e0-904a-1a91f00c1f09"
local WORKINK_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/start?integrationId=3534a8ab-821c-43b7-b63f-fcf0c689e592"
local CHECK_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/check"

local function httpGet(url)
    if request then
        local ok, r = pcall(request, {Url = url, Method = "GET"})
        if ok and r and r.Body then return r.Body end
    end
    if http_request then
        local ok, r = pcall(http_request, {Url = url, Method = "GET"})
        if ok and r and r.Body then return r.Body end
    end
    local ok, r = pcall(HttpService.GetAsync, HttpService, url)
    return ok and r or nil
end

local function getHwid()
    local ok, id = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    return ok and id or tostring(LocalPlayer.UserId)
end

local function verifyKey(key)
    if not key or key == "" then
        return false, {message = "No key provided"}
    end
    local url = CHECK_URL
        .. "?key="      .. HttpService:UrlEncode(key)
        .. "&hwid="     .. HttpService:UrlEncode(getHwid())
        .. "&userId="   .. tostring(LocalPlayer.UserId)
        .. "&username=" .. HttpService:UrlEncode(LocalPlayer.Name)
    local body = httpGet(url)
    if not body then
        return false, {message = "Could not reach API — check your internet connection"}
    end
    local ok, data = pcall(HttpService.JSONDecode, HttpService, body)
    if not ok or type(data) ~= "table" then
        return false, {message = "Unexpected response from API"}
    end
    return data.valid == true, data
end


 local OrionLib = loadstring(game:HttpGet('https://api.getvortex.vip/api/t/SNN44R/s/OrionLib'))()

local function Notify(title, content, duration)
    OrionLib:MakeNotification({
        Name = title or "ORVEX",
        Content = content or "",
        Image = "rbxassetid://4483345998",
        Time = duration or 5
    })
end

local function showKeyWindow()
    local Window = OrionLib:MakeWindow({
        Name = "ORVEX Authentication",
        HidePremium = false,
        SaveConfig = false,
        ConfigFolder = "ORVEX Auth",
        IntroText = "Loading ORVEX Auth...",
        IntroIcon = "rbxassetid://4483345998"
    })

    local KeyTab = Window:MakeTab({
        Name = "Enter Key",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
	    local HelpTab = Window:MakeTab({
        Name = "Help & Links",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    LocalPlayer4Letters = setmetatable({}, {
        __index = function(_, key)
            if key == "Name" then
                local name = game.Players.LocalPlayer.Name
                return name:sub(1, 3) .. "****"
            end
        end
    })

    KeyTab:AddParagraph("Welcome, " .. LocalPlayer4Letters.Name .. "!",
        "Please enter your key below.\n" ..
        "If you don't have one, click on a link in the 'Help & Links' tab."
    )

    local currentKey = ""
    KeyTab:AddTextbox({
        Name = "Key",
        Default = "",
        TextDisappear = false,
        Callback = function(value)
            currentKey = value
        end
    })

    KeyTab:AddButton({
        Name = "Submit Key",
        Callback = function()
            local inputKey = currentKey
            if not inputKey or inputKey == "" then
                Notify("Error", "Please enter a key first.", 3)
                return
            end

            local valid, data = verifyKey(inputKey)
            if valid then
                getgenv().VORTEX_KEY = inputKey
                pcall(function() Window:Destroy() end)
                OrionLib = loadstring(game:HttpGet('https://api.getvortex.vip/api/t/SNN44R/s/OrionLib'))()
                StartCheat()
            else
                if data and data.banned then
                    Notify("Banned", "You are banned. Reason: " .. (data.banReason or "no reason"), 5)
                else
                    Notify("Invalid Key", data and data.message or "Unknown error", 5)
                end
            end
        end
    })

    KeyTab:AddParagraph("Need a Key URL?",
        "Go in the 'Help & Links' tab to get a key URL."
    )


    HelpTab:AddParagraph("How to get a key",
        "1. Click one of the links below\n" ..
        "2. Open the link in your browser\n" ..
        "3. Complete the checkpoint\n" ..
        "4. Copy your key and paste it above\n" ..
        "5. Click 'Submit Key'"
    )

    HelpTab:AddButton({
        Name = "Linkvertise Key Link (6 hours)",
        Callback = function()
            setclipboard(LINKVERTISE_URL)
            Notify("URL Copied", "Open the link in your browser to get a key.", 4)
        end
    })

	HelpTab:AddButton({
        Name = "Work.ink Key Link (1 Day)",
        Callback = function()
            setclipboard(WORKINK_URL)
            Notify("URL Copied", "Open the link in your browser to get a key.", 4)
        end
    })

    HelpTab:AddParagraph("LootLabs", "Soon you can get a key from LootLabs, which lasts 12 hours. This feature is currently disabled due to a bug with LootLabs. Please use the other links for now.")

    OrionLib:Init()
end


function StartCheat()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TeleportService = game:GetService("TeleportService")
    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local CoreGui = game:GetService("CoreGui")

    
    local aimbotEnabled = false
    local aimbotTarget = nil
    local aimbotFOV = 130
    local showAimbotFOV = true
    local aimbotGlowFOV = false
    local aimbotRainbowFOV = false
    local aimbotRainbowHue = 0
    local aimbotKey = "LeftShift"
    local aimbotTargetPart = "Head" 
    local aimbotTargetPriority = "Nearest to Crosshair" 

    local AimbotFOVCircle = Drawing.new("Circle")
    AimbotFOVCircle.Visible = false
    AimbotFOVCircle.Radius = aimbotFOV
    AimbotFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    AimbotFOVCircle.Thickness = 2
    AimbotFOVCircle.Filled = false
    AimbotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local AimbotGlowCircle = Drawing.new("Circle")
    AimbotGlowCircle.Visible = false
    AimbotGlowCircle.Radius = aimbotFOV
    AimbotGlowCircle.Color = Color3.fromRGB(255, 216, 145)
    AimbotGlowCircle.Thickness = 1
    AimbotGlowCircle.Filled = true
    AimbotGlowCircle.Transparency = 0.7
    AimbotGlowCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    
    local triggerBotActive = false
    local lastTriggerTime = 0

    local TriggerBotFOVCircle = Drawing.new("Circle")
    TriggerBotFOVCircle.Visible = false
    TriggerBotFOVCircle.Radius = 50
    TriggerBotFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    TriggerBotFOVCircle.Thickness = 2
    TriggerBotFOVCircle.Filled = false
    TriggerBotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    
    local CrosshairDrawings = {}
    local crosshairRotationAngle = 0
    local crosshairLastUpdate = tick()

    local rainbowHue = 0
    local rainbowSpeed = 0.01

    
    local SnapLineDrawing = Drawing.new("Line")
    SnapLineDrawing.Visible = false
    SnapLineDrawing.Color = Color3.fromRGB(255, 216, 145)
    SnapLineDrawing.Thickness = 2

    
    local ESP_Data = {}
    local EspGui = Instance.new("ScreenGui")
    EspGui.Name = "ORVEX_ESP_Overlay"
    EspGui.Parent = CoreGui
    EspGui.IgnoreGuiInset = true

    local tpAngleX = 0
    local tpAngleY = 20
    local tpCurrentCamPos = Vector3.zero
    local tpCurrentCamLook = Vector3.zero
    local tpCameraActive = false
    local originalCameraType = Camera.CameraType

    local state = {
        
        AimbotEnabled = false, AimbotFOV = 300,
        ShowAimbotFOV = false, AimbotGlowFOV = false, AimbotRainbowFOV = false,
        AimbotKey = "LeftShift",
        AimbotWallCheck = false,
        AimbotTargetPart = "Head", 
        AimbotTargetPriority = "Nearest to Crosshair", 

        
        TriggerBot = false, TriggerBotDelay = 0.05,
        TriggerBotFOV = 50,
        TriggerBotKey = "LeftShift",
        TriggerBotWallCheck = false,

        
        SnapLine = false, SnapLineColor = Color3.fromRGB(255, 216, 145),
        SnapLineThickness = 2,

        
        CrosshairEnabled = false, CrosshairStyle = "Cross",
        CrosshairColor = Color3.fromRGB(255, 216, 145),
        CrosshairSize = 12, CrosshairThickness = 1, CrosshairGap = 4,
        CrosshairRotation = 0, CrosshairRotationSpeed = 0, CrosshairDynamic = false,
        ShowPlayerName = false, ShowPlayerHealth = false,
        ShowCorneredBox = false, ShowSelfESP = false,
        RenderRange = 500,

        
        Spinbot = false, SpinbotSpeed = 10,
    }

    
    local function IsVisible(targetHeadPosition, targetCharacter)
        if not targetCharacter then return false end
        local rayOrigin = Camera.CFrame.Position
        local rayDirection = (targetHeadPosition - rayOrigin).Unit * (targetHeadPosition - rayOrigin).Magnitude
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        local raycastResult = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        if not raycastResult then
            return true
        end
        local hitPart = raycastResult.Instance
        return hitPart:IsDescendantOf(targetCharacter)
    end

    local function createLine()
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Color3.new(1, 1, 1)
        line.BorderSizePixel = 0
        line.ZIndex = 4
        line.Visible = false
        line.Parent = EspGui
        return line
    end

    local function removeESP(player)
        local data = ESP_Data[player]
        if data then
            for _, v in pairs(data.Lines) do v:Destroy() end
            if data.NameTag then data.NameTag:Destroy() end
            if data.DistanceTag then data.DistanceTag:Destroy() end
            if data.HealthBg then data.HealthBg:Destroy() end
            if data.HealthBar then data.HealthBar:Destroy() end
            ESP_Data[player] = nil
        end
    end

    local function setupPlayer(player)
        if ESP_Data[player] then return end
        local elements = {
            Lines = {
                TLH = createLine(), TLV = createLine(), TRH = createLine(), TRV = createLine(),
                BLH = createLine(), BLV = createLine(), BRH = createLine(), BRV = createLine()
            },
            NameTag = Instance.new("TextLabel"),
            DistanceTag = Instance.new("TextLabel"),
            HealthBg = Instance.new("Frame"),
            HealthBar = Instance.new("Frame")
        }

        local function styleLabel(label)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1, 1, 1)
            label.Font = Enum.Font.GothamBold
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.new(0,0,0)
            label.Parent = EspGui
            label.Visible = false
        end

        styleLabel(elements.NameTag)
        styleLabel(elements.DistanceTag)

        elements.HealthBg.BackgroundColor3 = Color3.new(0, 0, 0)
        elements.HealthBg.BackgroundTransparency = 0.5
        elements.HealthBg.Parent = EspGui
        elements.HealthBar.Parent = elements.HealthBg
        ESP_Data[player] = elements
    end

    local function drawLine(line, p1, p2, thickness, color)
        local dist = (p1 - p2).Magnitude
        line.Size = UDim2.new(0, dist, 0, thickness)
        line.Position = UDim2.new(0, (p1.X + p2.X) / 2 - dist / 2, 0, (p1.Y + p2.Y) / 2 - thickness / 2)
        line.Rotation = math.atan2(p2.Y - p1.Y, p2.X - p1.X) * (180 / math.pi)
        line.BackgroundColor3 = color or Color3.new(1, 1, 1)
        line.Visible = true
    end

    local function updateESPVisuals()
        for player, e in pairs(ESP_Data) do
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")

            local skip = (player == LocalPlayer and not state.ShowSelfESP) or not player.Parent

            if skip then
                for _, l in pairs(e.Lines) do l.Visible = false end
                if e.NameTag then e.NameTag.Visible = false end
                if e.DistanceTag then e.DistanceTag.Visible = false end
                if e.HealthBg then e.HealthBg.Visible = false end
            else
                if hrp and hum and hum.Health > 0 then
                    local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
                    local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

                    if onScreen and distance <= state.RenderRange then
                        local displayColor = Color3.new(1, 1, 1)
                        local factor = 1 / (distance * (Camera.FieldOfView / 70)) * 1000
                        local w, h = 4 * factor, 6 * factor
                        local x, y = pos.X, pos.Y
                        local nameSize = math.clamp(factor * 0.4, 9, 14)
                        local thick = math.clamp(factor * 0.15, 1, 2)

                        local currentTopOffset = h/2 + 2

                        if state.ShowPlayerName then
                            e.NameTag.Visible = true
                            e.NameTag.Text = "@" .. player.Name
                            e.NameTag.TextColor3 = displayColor
                            e.NameTag.TextSize = nameSize
                            e.NameTag.Position = UDim2.new(0, x - 50, 0, y - currentTopOffset - nameSize)
                            e.NameTag.Size = UDim2.new(0, 100, 0, nameSize)
                            currentTopOffset = currentTopOffset + nameSize

                            e.DistanceTag.Visible = true
                            e.DistanceTag.Text = math.floor(distance) .. " studs"
                            e.DistanceTag.TextColor3 = Color3.new(0.7, 0.7, 0.7)
                            e.DistanceTag.TextSize = nameSize - 1
                            e.DistanceTag.Position = UDim2.new(0, x - 50, 0, y + h/2 + 2)
                            e.DistanceTag.Size = UDim2.new(0, 100, 0, nameSize)
                        else
                            e.NameTag.Visible = false
                            e.DistanceTag.Visible = false
                        end

                        if state.ShowCorneredBox then
                            local edge = w / 4
                            local function m(l, px, py, sx, sy)
                                l.Position = UDim2.new(0, px, 0, py)
                                l.Size = UDim2.new(0, sx, 0, sy)
                                l.BackgroundColor3 = displayColor
                                l.Visible = true
                            end
                            m(e.Lines.TLH, x-w/2, y-h/2, edge, thick)
                            m(e.Lines.TLV, x-w/2, y-h/2, thick, edge)
                            m(e.Lines.TRH, x+w/2-edge, y-h/2, edge, thick)
                            m(e.Lines.TRV, x+w/2, y-h/2, thick, edge)
                            m(e.Lines.BLH, x-w/2, y+h/2, edge, thick)
                            m(e.Lines.BLV, x-w/2, y+h/2-edge, thick, edge)
                            m(e.Lines.BRH, x+w/2-edge, y+h/2, edge, thick)
                            m(e.Lines.BRV, x+w/2, y+h/2-edge, thick, edge)
                        else
                            for _, l in pairs(e.Lines) do l.Visible = false end
                        end


                        if state.ShowPlayerHealth then
                            local barW = math.clamp(factor * 0.1, 2, 4)
                            e.HealthBg.Position = UDim2.new(0, x - w/2 - (barW + 4), 0, y - h/2)
                            e.HealthBg.Size = UDim2.new(0, barW, 0, h)
                            local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                            e.HealthBar.Size = UDim2.new(1, 0, hp, 0)
                            e.HealthBar.Position = UDim2.new(0, 0, 1-hp, 0)
                            e.HealthBar.BackgroundColor3 = Color3.fromHSV(hp * 0.3, 1, 1)
                            e.HealthBg.Visible = true
                        else
                            e.HealthBg.Visible = false
                        end
                    else
                        for _, l in pairs(e.Lines) do l.Visible = false end
                        if e.NameTag then e.NameTag.Visible = false end
                        if e.DistanceTag then e.DistanceTag.Visible = false end
                        if e.HealthBg then e.HealthBg.Visible = false end
                    end
                else
                    for _, l in pairs(e.Lines) do l.Visible = false end
                    if e.NameTag then e.NameTag.Visible = false end
                    if e.DistanceTag then e.DistanceTag.Visible = false end
                    if e.HealthBg then e.HealthBg.Visible = false end
                end
            end
        end
    end

    for _, p in ipairs(Players:GetPlayers()) do setupPlayer(p) end
    Players.PlayerAdded:Connect(setupPlayer)
    Players.PlayerRemoving:Connect(removeESP)
    RunService.RenderStepped:Connect(updateESPVisuals)



    local function CreateCrosshair()
        for _, drawing in pairs(CrosshairDrawings) do drawing:Remove() end
        CrosshairDrawings = {}
        if not state.CrosshairEnabled then return end

        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local size = state.CrosshairSize
        local gap = state.CrosshairGap
        local thickness = state.CrosshairThickness
        local rotation = math.rad(state.CrosshairRotation + crosshairRotationAngle)
        local cosRot, sinRot = math.cos(rotation), math.sin(rotation)

        local function rotatePoint(point)
            local x = point.X - screenCenter.X
            local y = point.Y - screenCenter.Y
            return Vector2.new(
                screenCenter.X + (x * cosRot - y * sinRot),
                screenCenter.Y + (x * sinRot + y * cosRot)
            )
        end

        if state.CrosshairStyle == "Cross" then
            local lines = {
                {from = Vector2.new(screenCenter.X, screenCenter.Y - size - gap), to = Vector2.new(screenCenter.X, screenCenter.Y - gap)},
                {from = Vector2.new(screenCenter.X, screenCenter.Y + size + gap), to = Vector2.new(screenCenter.X, screenCenter.Y + gap)},
                {from = Vector2.new(screenCenter.X - size - gap, screenCenter.Y), to = Vector2.new(screenCenter.X - gap, screenCenter.Y)},
                {from = Vector2.new(screenCenter.X + size + gap, screenCenter.Y), to = Vector2.new(screenCenter.X + gap, screenCenter.Y)}
            }
            for _, line in ipairs(lines) do
                local drawing = Drawing.new("Line")
                drawing.Thickness = thickness
                drawing.Color = state.CrosshairColor
                drawing.From = rotatePoint(line.from)
                drawing.To = rotatePoint(line.to)
                drawing.Visible = true
                table.insert(CrosshairDrawings, drawing)
            end
        elseif state.CrosshairStyle == "Dot" then
            local drawing = Drawing.new("Circle")
            drawing.Thickness = 1
            drawing.Color = state.CrosshairColor
            drawing.Radius = thickness
            drawing.Filled = true
            drawing.Position = screenCenter
            drawing.Visible = true
            table.insert(CrosshairDrawings, drawing)
        elseif state.CrosshairStyle == "Circle" then
            local drawing = Drawing.new("Circle")
            drawing.Thickness = thickness
            drawing.Color = state.CrosshairColor
            drawing.Radius = size
            drawing.Filled = false
            drawing.Position = screenCenter
            drawing.Visible = true
            table.insert(CrosshairDrawings, drawing)
            local dot = Drawing.new("Circle")
            dot.Thickness = 1
            dot.Color = state.CrosshairColor
            dot.Radius = 1
            dot.Filled = true
            dot.Position = screenCenter
            dot.Visible = true
            table.insert(CrosshairDrawings, dot)
        elseif state.CrosshairStyle == "Square" then
            local halfSize = size / 2
            local lines = {
                {from = Vector2.new(screenCenter.X - halfSize, screenCenter.Y - halfSize), to = Vector2.new(screenCenter.X + halfSize, screenCenter.Y - halfSize)},
                {from = Vector2.new(screenCenter.X - halfSize, screenCenter.Y + halfSize), to = Vector2.new(screenCenter.X + halfSize, screenCenter.Y + halfSize)},
                {from = Vector2.new(screenCenter.X - halfSize, screenCenter.Y - halfSize), to = Vector2.new(screenCenter.X - halfSize, screenCenter.Y + halfSize)},
                {from = Vector2.new(screenCenter.X + halfSize, screenCenter.Y - halfSize), to = Vector2.new(screenCenter.X + halfSize, screenCenter.Y + halfSize)}
            }
            for _, line in ipairs(lines) do
                local drawing = Drawing.new("Line")
                drawing.Thickness = thickness
                drawing.Color = state.CrosshairColor
                drawing.From = rotatePoint(line.from)
                drawing.To = rotatePoint(line.to)
                drawing.Visible = true
                table.insert(CrosshairDrawings, drawing)
            end
        end
    end

    local function UpdateCrosshair()
        if state.CrosshairRotationSpeed > 0 then
            local deltaTime = tick() - crosshairLastUpdate
            crosshairRotationAngle = (crosshairRotationAngle + (state.CrosshairRotationSpeed * deltaTime * 60)) % 360
            crosshairLastUpdate = tick()
        end

        local targetColor = state.CrosshairColor
        if state.CrosshairDynamic then
            local mouse = LocalPlayer:GetMouse()
            local mousePos = Vector2.new(mouse.X, mouse.Y)
            local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            local closestDistance, foundEnemy = 50, false
            local localTeam = LocalPlayer.Team

            for _, player in pairs(Players:GetPlayers()) do
                if player == LocalPlayer then continue end
                local character = player.Character
                if not character then continue end
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.Health <= 0 then continue end
                local head = character:FindFirstChild("Head")
                if not head then continue end
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if not onScreen then continue end
                local targetPos = Vector2.new(screenPos.X, screenPos.Y)
                if (mousePos - targetPos).Magnitude < closestDistance then foundEnemy = true break end
            end
            targetColor = foundEnemy and Color3.fromRGB(255, 216, 145) or state.CrosshairColor
        end

        for _, drawing in pairs(CrosshairDrawings) do
            if drawing.Color ~= targetColor then drawing.Color = targetColor end
        end
        CreateCrosshair()
    end

    local function ClearCrosshair()
        for _, drawing in pairs(CrosshairDrawings) do drawing:Remove() end
        CrosshairDrawings = {}
        crosshairRotationAngle = 0
        crosshairLastUpdate = tick()
    end

    local MainWindow = OrionLib:MakeWindow({
        Name = "ORVEX • Flick",
        HidePremium = false,
        SaveConfig = true,
        IntroEnabled = false,
        ConfigFolder = "ORVEXFlick",
    })

    local function Notify(title, content, duration)
        OrionLib:MakeNotification({
            Name = title or "ORVEX",
            Content = content or "",
            Image = "rbxassetid://4483345998",
            Time = duration or 3
        })
    end

    local InfoTab = MainWindow:MakeTab({
        Name = "Info",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    InfoTab:AddParagraph("Flick Cheat", [[Exclusive Cheat!

FEATURES:
• Aimbot - Lock onto targets within FOV when key is pressed
• Triggerbot - Auto shoot when crosshair is over enemy
• Accurate Crosshair - 4 perfect styles

CONTROLS:
• WASD = Movement
• Space = Jump
• Insert = Destroy UI]])
    InfoTab:AddButton({
        Name = "Server Hop",
        Callback = ServerHop
    })
    InfoTab:AddButton({
        Name = "Reset Character",
        Callback = ResetCharacter
    })
    InfoTab:AddButton({
        Name = "Unload Settings",
        Callback = UnloadAllSettings
    })
    InfoTab:AddButton({
        Name = "Join Discord",
        Callback = function()
            setclipboard("https://discord.gg/WzS5JfAx8C")
            Notify("Discord Link", "Discord Link copied to clipboard!", 5)
        end
    })

    
    local function GetAimbotTarget()
        local closestPlayer = nil
        local bestDistance = math.huge
        local mousePosition = UserInputService:GetMouseLocation()
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local localCharacter = LocalPlayer.Character
        local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            local character = player.Character
            if not character then continue end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then continue end
            local targetPart = character:FindFirstChild(aimbotTargetPart)
            if not targetPart then continue end

            local partPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            if not onScreen then continue end
            local screenPosition = Vector2.new(partPos.X, partPos.Y)

            
            local distanceToCenter = (screenPosition - screenCenter).Magnitude
            if distanceToCenter > aimbotFOV then continue end

            
            if state.AimbotWallCheck and not IsVisible(targetPart.Position, character) then
                continue
            end

            
            local priorityDistance
            if state.AimbotTargetPriority == "Nearest to Crosshair" then
                priorityDistance = (screenPosition - mousePosition).Magnitude
            elseif state.AimbotTargetPriority == "Nearest to Player" then
                if localRoot then
                    priorityDistance = (targetPart.Position - localRoot.Position).Magnitude
                else
                    priorityDistance = (screenPosition - mousePosition).Magnitude 
                end
            else
                priorityDistance = (screenPosition - mousePosition).Magnitude
            end

            if priorityDistance < bestDistance then
                bestDistance = priorityDistance
                closestPlayer = player
            end
        end

        return closestPlayer
    end

    local function LockCameraToTarget()
        if aimbotTarget and aimbotTarget.Character then
            local targetPart = aimbotTarget.Character:FindFirstChild(aimbotTargetPart)
            if targetPart then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
            else
                aimbotTarget = nil
            end
        end
    end

    local function isAimbotKeyDown()
        if aimbotKey == "MouseButton2" then
            return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        elseif aimbotKey == "MouseButton1" then
            return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
        elseif aimbotKey == "Q" then
            return UserInputService:IsKeyDown(Enum.KeyCode.Q)
        elseif aimbotKey == "E" then
            return UserInputService:IsKeyDown(Enum.KeyCode.E)
        elseif aimbotKey == "F" then
            return UserInputService:IsKeyDown(Enum.KeyCode.F)
        elseif aimbotKey == "LeftShift" then
            return UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
        elseif aimbotKey == "LeftControl" then
            return UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
        end
        return false
    end

    local function isLobbyVisible()
        local success, result = pcall(function()
            return LocalPlayer.PlayerGui.MainGui.MainFrame.Lobby.Currency.Visible == true
        end)
        return success and result or false
    end

    local aimbotHeartbeatConnection = nil
    local function StartAimbot()
        if aimbotHeartbeatConnection then aimbotHeartbeatConnection:Disconnect() end
        aimbotHeartbeatConnection = RunService.Heartbeat:Connect(function()
            if aimbotEnabled and not isLobbyVisible() and isAimbotKeyDown() then
                aimbotTarget = GetAimbotTarget()
                if aimbotTarget then
                    LockCameraToTarget()
                end
            end
        end)
    end

    local function StopAimbot()
        if aimbotHeartbeatConnection then
            aimbotHeartbeatConnection:Disconnect()
            aimbotHeartbeatConnection = nil
        end
        aimbotTarget = nil
    end

    local function UpdateAimbotFOVCircles()
        AimbotFOVCircle.Radius = aimbotFOV
        AimbotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        AimbotGlowCircle.Radius = aimbotFOV
        AimbotGlowCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        if showAimbotFOV and aimbotEnabled then
            AimbotFOVCircle.Visible = true
            AimbotGlowCircle.Visible = aimbotGlowFOV
        else
            AimbotFOVCircle.Visible = false
            AimbotGlowCircle.Visible = false
        end
    end

    local function UpdateRainbowAimbotCircle()
        if showAimbotFOV and aimbotEnabled and aimbotRainbowFOV then
            aimbotRainbowHue = (aimbotRainbowHue + 0.01) % 1
            local rainbowColor = Color3.fromHSV(aimbotRainbowHue, 1, 1)
            AimbotFOVCircle.Color = rainbowColor
            if aimbotGlowFOV then AimbotGlowCircle.Color = rainbowColor end
        elseif showAimbotFOV and aimbotEnabled then
            AimbotFOVCircle.Color = Color3.fromRGB(255, 216, 145)
            if aimbotGlowFOV then AimbotGlowCircle.Color = Color3.fromRGB(255, 216, 145) end
        end
    end

    
    local function GetSnapLineTarget()
        local closestPlayer = nil
        local closestDistance = math.huge
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local localTeam = LocalPlayer.Team
        for _, player in pairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            local character = player.Character
            if not character or not character:FindFirstChild("Humanoid") then continue end
            if character.Humanoid.Health <= 0 then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if not onScreen then continue end
            local targetPos = Vector2.new(screenPos.X, screenPos.Y)
            local distance = (screenCenter - targetPos).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = { Player = player, Part = head, ScreenPos = targetPos, WorldPos = head.Position }
            end
        end
        return closestPlayer
    end

    local function UpdateSnapLine()
        if not state.SnapLine then SnapLineDrawing.Visible = false return end
        local closestPlayer = GetSnapLineTarget()
        if not closestPlayer then SnapLineDrawing.Visible = false return end
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        SnapLineDrawing.From = closestPlayer.ScreenPos
        SnapLineDrawing.To = screenCenter
        SnapLineDrawing.Color = state.SnapLineColor
        SnapLineDrawing.Thickness = state.SnapLineThickness
        SnapLineDrawing.Visible = true
    end

    
    local function GetTriggerBotTarget()
        local closestTarget, closestDistance = nil, state.TriggerBotFOV
        local screenCenter, localTeam = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2), LocalPlayer.Team
        for _, player in pairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            local character = player.Character
            if not character or not character:FindFirstChild("Humanoid") then continue end
            if character.Humanoid.Health <= 0 then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if not onScreen then continue end
            local targetPos = Vector2.new(screenPos.X, screenPos.Y)
            local distance = (screenCenter - targetPos).Magnitude
            if distance < closestDistance then
                if state.TriggerBotWallCheck then
                    if not IsVisible(head.Position, character) then
                        continue
                    end
                end
                closestDistance = distance
                closestTarget = { Player = player, Part = head, ScreenPos = targetPos, WorldPos = head.Position }
            end
        end
        return closestTarget
    end

    local function FireTriggerBot()
        if not state.TriggerBot or not triggerBotActive then return end
        if tick() - lastTriggerTime < state.TriggerBotDelay then return end
        local target = GetTriggerBotTarget()
        if target then
            mouse1click()
            lastTriggerTime = tick()
        end
    end

    
    function ServerHop()
        Notify("Server Hop", "Searching for new server...", 2)
        local placeId, jobId = game.PlaceId, game.JobId
        for _ = 1, 10 do
            local success, result = pcall(function() return game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100") end)
            if success then
                local decoded = game:GetService("HttpService"):JSONDecode(result)
                local servers = {}
                for _, server in ipairs(decoded.data) do
                    if server.playing < server.maxPlayers and server.id ~= jobId then table.insert(servers, server.id) end
                end
                if #servers > 0 then
                    TeleportService:TeleportToPlaceInstance(placeId, servers[math.random(1, #servers)], LocalPlayer)
                    return
                end
            end
            task.wait(1)
        end
        Notify("Server Hop Failed", "Could not find a new server. Try again later.", 3)
    end

    function ResetCharacter()
        local character = LocalPlayer.Character
        if not character then 
            Notify("Error", "No character found to reset!", 3)
            return 
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then 
            Notify("Error", "No humanoid found!", 3)
            return 
        end

        local wasAimbot = state.AimbotEnabled

        if wasAimbot then state.AimbotEnabled = false StopAimbot() end

        local success, err = pcall(function() humanoid.Health = 0 end)
        if success then
            Notify("Character Reset", "Your character has been reset!", 3)
            task.spawn(function()
                repeat task.wait(0.5) character = LocalPlayer.Character until character and character:FindFirstChildOfClass("Humanoid")
                if wasAimbot then task.wait(1) state.AimbotEnabled = true StartAimbot() end
            end)
        else
            Notify("Reset Failed", "Could not reset character: " .. tostring(err), 3)
        end
    end

    function UnloadAllSettings()
        state.CrosshairEnabled = false
        state.AimbotEnabled = false
        state.ShowAimbotFOV = false
        state.AimbotGlowFOV = false
        state.AimbotRainbowFOV = false
        state.AimbotWallCheck = false
        state.TriggerBot = false
        state.TriggerBotWallCheck = false
        state.SnapLine = false
        state.ShowPlayerName = false
        state.ShowPlayerHealth = false
        state.ShowCorneredBox = false
        state.ShowSelfESP = false
        state.Spinbot = false

        state.AimbotFOV = 300
        state.TriggerBotDelay = 0.05
        state.TriggerBotFOV = 50
        state.SpinbotSpeed = 10
        state.RenderRange = 500
        state.FOVValue = 70
        state.CrosshairStyle = "Cross"
        state.CrosshairSize = 12
        state.CrosshairThickness = 1
        state.CrosshairGap = 4
        state.CrosshairRotation = 0
        state.CrosshairRotationSpeed = 0
        state.CrosshairDynamic = false
        state.SnapLineColor = Color3.fromRGB(255, 216, 145)
        state.CrosshairColor = Color3.fromRGB(255, 255, 255)
        state.AimbotTargetPart = "Head"
        state.AimbotTargetPriority = "Nearest to Crosshair"

        ClearCrosshair()
        StopAimbot()

        AimbotFOVCircle.Visible = false
        AimbotGlowCircle.Visible = false
        TriggerBotFOVCircle.Visible = false
        SnapLineDrawing.Visible = false


        pcall(function()
            local flagsToReset = {
                "CrosshairEnabled",
                "AimbotEnabled", 
                "ShowAimbotFOV", 
                "AimbotGlowFOV", 
                "AimbotRainbowFOV",
                "AimbotWallCheck",
                "ShowPlayerName", 
                "ShowPlayerHealth", 
                "ShowCorneredBox", 
                "ShowSelfESP", 
                "TriggerBot", 
                "TriggerBotWallCheck",
                "SnapLine", 
                "Spinbot",
                "CrosshairDynamic"
            }
            for _, flagName in ipairs(flagsToReset) do
                if OrionLib.Flags and OrionLib.Flags[flagName] and OrionLib.Flags[flagName].Set then
                    OrionLib.Flags[flagName]:Set(false)
                end
            end
            local slidersToReset = {
                {flag = "FOVValue", value = 5},
                {flag = "AimbotFOV", value = 300},
                {flag = "TriggerBotFOV", value = 50},
                {flag = "TriggerBotDelay", value = 0.05},
                {flag = "SpinbotSpeed", value = 10},
                {flag = "CrosshairSize", value = 12},
                {flag = "CrosshairThickness", value = 1},
                {flag = "CrosshairGap", value = 4},
                {flag = "CrosshairRotation", value = 0},
                {flag = "CrosshairRotationSpeed", value = 0},
                {flag = "SnapLineThickness", value = 2},
                {flag = "RenderRange", value = 500}
            }
            for _, sliderData in ipairs(slidersToReset) do
                if OrionLib.Flags and OrionLib.Flags[sliderData.flag] and OrionLib.Flags[sliderData.flag].Set then
                    OrionLib.Flags[sliderData.flag]:Set(sliderData.value)
                end
            end
            if OrionLib.Flags and OrionLib.Flags.CrosshairStyle and OrionLib.Flags.CrosshairStyle.Set then
                OrionLib.Flags.CrosshairStyle:Set("Cross")
            end
            if OrionLib.Flags and OrionLib.Flags.AimbotKey and OrionLib.Flags.AimbotKey.Set then
                OrionLib.Flags.AimbotKey:Set("MouseButton2")
            end
            if OrionLib.Flags and OrionLib.Flags.AimbotTargetPart and OrionLib.Flags.AimbotTargetPart.Set then
                OrionLib.Flags.AimbotTargetPart:Set("Head")
            end
            if OrionLib.Flags and OrionLib.Flags.AimbotTargetPriority and OrionLib.Flags.AimbotTargetPriority.Set then
                OrionLib.Flags.AimbotTargetPriority:Set("Nearest to Crosshair")
            end
            if OrionLib.Flags and OrionLib.Flags.TriggerBotKey and OrionLib.Flags.TriggerBotKey.Set then
                OrionLib.Flags.TriggerBotKey:Set("MouseButton2")
            end
            if OrionLib.Flags and OrionLib.Flags.SnapLineColor and OrionLib.Flags.SnapLineColor.Set then
                OrionLib.Flags.SnapLineColor:Set(Color3.fromRGB(255, 216, 145))
            end
            if OrionLib.Flags and OrionLib.Flags.CrosshairColor and OrionLib.Flags.CrosshairColor.Set then
                OrionLib.Flags.CrosshairColor:Set(Color3.fromRGB(255, 255, 255))
            end
        end)

        Notify("Settings Unloaded", "All settings have been reset to default! All toggles are now OFF.", 3)
    end

    
    local AimbotTab = MainWindow:MakeTab({
        Name = "Aimbot",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    AimbotTab:AddParagraph("Aimbot - Lock onto targets", [[Press and hold the bound key to lock onto the nearest enemy within FOV.]])
    AimbotTab:AddToggle({
        Name = "Enable Aimbot",
        Default = false,
        Flag = "AimbotEnabled",
        Save = true,
        Callback = function(Value)
            state.AimbotEnabled = Value
            aimbotEnabled = Value
            if Value then
                StartAimbot()
            else
                StopAimbot()
            end
        end
    })
    AimbotTab:AddSlider({
        Name = "Aimbot FOV Size",
        Min = 50,
        Max = 800,
        Default = 300,
        Increment = 10,
        Flag = "AimbotFOV",
        Save = true,
        Callback = function(Value)
            state.AimbotFOV = Value
            aimbotFOV = Value
            AimbotFOVCircle.Radius = Value
            AimbotGlowCircle.Radius = Value
        end
    })
    AimbotTab:AddDropdown({
        Name = "Target Part",
        Options = {"Head", "HumanoidRootPart"},
        Default = "Head",
        Flag = "AimbotTargetPart",
        Save = true,
        Callback = function(Value)
            state.AimbotTargetPart = Value
            aimbotTargetPart = Value
        end
    })
    AimbotTab:AddDropdown({
        Name = "Target Priority",
        Options = {"Nearest to Crosshair", "Nearest to Player"},
        Default = "Nearest to Crosshair",
        Flag = "AimbotTargetPriority",
        Save = true,
        Callback = function(Value)
            state.AimbotTargetPriority = Value
            aimbotTargetPriority = Value
        end
    })
    AimbotTab:AddToggle({
        Name = "WallCheck",
        Default = false,
        Flag = "AimbotWallCheck",
        Save = true,
        Callback = function(Value)
            state.AimbotWallCheck = Value
        end
    })
    AimbotTab:AddToggle({
        Name = "Show FOV Circle",
        Default = false,
        Flag = "ShowAimbotFOV",
        Save = true,
        Callback = function(Value)
            state.ShowAimbotFOV = Value
            showAimbotFOV = Value
        end
    })
    AimbotTab:AddToggle({
        Name = "Rainbow FOV Circle",
        Default = false,
        Flag = "AimbotRainbowFOV",
        Save = true,
        Callback = function(Value)
            state.AimbotRainbowFOV = Value
            aimbotRainbowFOV = Value
        end
    })
    AimbotTab:AddToggle({
        Name = "Glow FOV Circle (Filled)",
        Default = false,
        Flag = "AimbotGlowFOV",
        Save = true,
        Callback = function(Value)
            state.AimbotGlowFOV = Value
            aimbotGlowFOV = Value
        end
    })
    AimbotTab:AddDropdown({
        Name = "Aimbot Keybind",
        Options = {"MouseButton2", "MouseButton1", "Q", "E", "F", "LeftShift", "LeftControl"},
        Default = "LeftShift",
        Flag = "AimbotKey",
        Save = true,
        Callback = function(Value)
            state.AimbotKey = Value
            aimbotKey = Value
        end
    })

    local VisualsTab = MainWindow:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    VisualsTab:AddToggle({
        Name = "Show Player Name",
        Default = false,
        Flag = "ShowPlayerName",
        Save = true,
        Callback = function(Value)
            state.ShowPlayerName = Value
        end
    })
    VisualsTab:AddToggle({
        Name = "Show Player Health",
        Default = false,
        Flag = "ShowPlayerHealth",
        Save = true,
        Callback = function(Value)
            state.ShowPlayerHealth = Value
        end
    })
    VisualsTab:AddToggle({
        Name = "Show Cornered Box",
        Default = false,
        Flag = "ShowCorneredBox",
        Save = true,
        Callback = function(Value)
            state.ShowCorneredBox = Value
        end
    })
    VisualsTab:AddToggle({
        Name = "Show Self ESP",
        Default = false,
        Flag = "ShowSelfESP",
        Save = true,
        Callback = function(Value)
            state.ShowSelfESP = Value
        end
    })
    VisualsTab:AddSlider({
        Name = "Render Range",
        Min = 100,
        Max = 2000,
        Default = 500,
        Increment = 50,
        Flag = "RenderRange",
        Save = true,
        Callback = function(Value)
            state.RenderRange = Value
        end
    })

    local TriggerBotTab = MainWindow:MakeTab({
        Name = "TriggerBot",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    TriggerBotTab:AddToggle({
        Name = "Enable TriggerBot",
        Default = false,
        Flag = "TriggerBot",
        Save = true,
        Callback = function(Value)
            state.TriggerBot = Value
        end
    })
    TriggerBotTab:AddSlider({
        Name = "TriggerBot FOV",
        Min = 10,
        Max = 200,
        Default = 50,
        Increment = 5,
        Flag = "TriggerBotFOV",
        Save = true,
        Callback = function(Value)
            state.TriggerBotFOV = Value
            TriggerBotFOVCircle.Radius = Value
        end
    })
    TriggerBotTab:AddSlider({
        Name = "Shot Delay (Seconds)",
        Min = 0.01,
        Max = 0.5,
        Default = 0.05,
        Increment = 0.01,
        Flag = "TriggerBotDelay",
        Save = true,
        Callback = function(Value)
            state.TriggerBotDelay = Value
        end
    })

    TriggerBotTab:AddToggle({
        Name = "WallCheck",
        Default = false,
        Flag = "TriggerBotWallCheck",
        Save = true,
        Callback = function(Value)
            state.TriggerBotWallCheck = Value
        end
    })
    TriggerBotTab:AddToggle({
        Name = "Show FOV Circle",
        Default = true,
        Flag = "TriggerBotShowFOV",
        Save = true,
        Callback = function(Value)
            TriggerBotFOVCircle.Visible = Value and state.TriggerBot
        end
    })
    TriggerBotTab:AddDropdown({
        Name = "TriggerBot Keybind",
        Options = {"MouseButton2", "MouseButton1", "Q", "E", "F", "LeftShift", "LeftControl", "Toggle"},
        Default = "LeftShift",
        Flag = "TriggerBotKey",
        Save = true,
        Callback = function(Value)
            state.TriggerBotKey = Value
            triggerBotActive = false
            if Value == "Toggle" then
                Notify("TriggerBot Keybind", "Press T to toggle TriggerBot ON/OFF.", 3)
            end
        end
    })

    local SnapLineTab = MainWindow:MakeTab({
        Name = "Snap Line",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    SnapLineTab:AddToggle({
        Name = "Enable Snap Line",
        Default = false,
        Flag = "SnapLine",
        Save = true,
        Callback = function(Value)
            state.SnapLine = Value
        end
    })
    SnapLineTab:AddColorpicker({
        Name = "Line Color",
        Default = Color3.fromRGB(255, 216, 145),
        Flag = "SnapLineColor",
        Save = true,
        Callback = function(Value)
            state.SnapLineColor = Value
            SnapLineDrawing.Color = Value
        end
    })
    SnapLineTab:AddSlider({
        Name = "Line Thickness",
        Min = 1,
        Max = 10,
        Default = 2,
        Increment = 1,
        Flag = "SnapLineThickness",
        Save = true,
        Callback = function(Value)
            state.SnapLineThickness = Value
            SnapLineDrawing.Thickness = Value
        end
    })


    local SpinbotTab = MainWindow:MakeTab({
        Name = "Spinbot",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    SpinbotTab:AddToggle({
        Name = "Enable Spinbot",
        Default = false,
        Flag = "Spinbot",
        Save = true,
        Callback = function(Value)
            state.Spinbot = Value
        end
    })
    SpinbotTab:AddSlider({
        Name = "Spinbot Speed",
        Min = 1,
        Max = 50,
        Default = 10,
        Increment = 1,
        Flag = "SpinbotSpeed",
        Save = true,
        Callback = function(Value)
            state.SpinbotSpeed = Value
        end
    })


    local MiscTab = MainWindow:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    MiscTab:AddToggle({
        Name = "Enable Custom Crosshair",
        Default = false,
        Flag = "CrosshairEnabled",
        Save = true,
        Callback = function(Value)
            state.CrosshairEnabled = Value
            if Value then
                CreateCrosshair()
            else
                ClearCrosshair()
            end
        end
    })
    MiscTab:AddDropdown({
        Name = "Crosshair Style",
        Options = {"Cross", "Dot", "Circle", "Square"},
        Default = "Cross",
        Flag = "CrosshairStyle",
        Save = true,
        Callback = function(Value)
            state.CrosshairStyle = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })
    MiscTab:AddColorpicker({
        Name = "Crosshair Color",
        Default = Color3.fromRGB(255, 255, 255),
        Flag = "CrosshairColor",
        Save = true,
        Callback = function(Value)
            state.CrosshairColor = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })
    MiscTab:AddSlider({
        Name = "Crosshair Size",
        Min = 5,
        Max = 30,
        Default = 12,
        Increment = 1,
        Flag = "CrosshairSize",
        Save = true,
        Callback = function(Value)
            state.CrosshairSize = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })
    MiscTab:AddSlider({
        Name = "Crosshair Thickness",
        Min = 1,
        Max = 5,
        Default = 1,
        Increment = 1,
        Flag = "CrosshairThickness",
        Save = true,
        Callback = function(Value)
            state.CrosshairThickness = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })
    MiscTab:AddSlider({
        Name = "Crosshair Gap",
        Min = 0,
        Max = 10,
        Default = 4,
        Increment = 1,
        Flag = "CrosshairGap",
        Save = true,
        Callback = function(Value)
            state.CrosshairGap = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })
    MiscTab:AddSlider({
        Name = "Crosshair Rotation (degrees)",
        Min = 0,
        Max = 360,
        Default = 0,
        Increment = 15,
        Flag = "CrosshairRotation",
        Save = true,
        Callback = function(Value)
            state.CrosshairRotation = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })
    MiscTab:AddSlider({
        Name = "Rotation Speed (0 = off)",
        Min = 0,
        Max = 10,
        Default = 0,
        Increment = 0.5,
        Flag = "CrosshairRotationSpeed",
        Save = true,
        Callback = function(Value)
            state.CrosshairRotationSpeed = Value
            if state.CrosshairEnabled then
                crosshairLastUpdate = tick()
            end
        end
    })
    MiscTab:AddToggle({
        Name = "Dynamic Color (Red on enemy)",
        Default = false,
        Flag = "CrosshairDynamic",
        Save = true,
        Callback = function(Value)
            state.CrosshairDynamic = Value
            if state.CrosshairEnabled then
                CreateCrosshair()
            end
        end
    })

    
    UserInputService.InputBegan:Connect(function(input)
        if state.TriggerBot then
            if state.TriggerBotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then triggerBotActive = true
            elseif state.TriggerBotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then triggerBotActive = true
            elseif state.TriggerBotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then triggerBotActive = true
            elseif state.TriggerBotKey == "E" and input.KeyCode == Enum.KeyCode.E then triggerBotActive = true
            elseif state.TriggerBotKey == "F" and input.KeyCode == Enum.KeyCode.F then triggerBotActive = true
            elseif state.TriggerBotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then triggerBotActive = true
            elseif state.TriggerBotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then triggerBotActive = true
            elseif state.TriggerBotKey == "Toggle" and input.KeyCode == Enum.KeyCode.T then triggerBotActive = not triggerBotActive end
        end

    end)

    UserInputService.InputEnded:Connect(function(input)
        if state.TriggerBotKey ~= "Toggle" then
            if state.TriggerBotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then triggerBotActive = false
            elseif state.TriggerBotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then triggerBotActive = false
            elseif state.TriggerBotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then triggerBotActive = false
            elseif state.TriggerBotKey == "E" and input.KeyCode == Enum.KeyCode.E then triggerBotActive = false
            elseif state.TriggerBotKey == "F" and input.KeyCode == Enum.KeyCode.F then triggerBotActive = false
            elseif state.TriggerBotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then triggerBotActive = false
            elseif state.TriggerBotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then triggerBotActive = false end
        end
    end)

    RunService.RenderStepped:Connect(function(dt)
        UpdateAimbotFOVCircles()
        UpdateRainbowAimbotCircle()

        TriggerBotFOVCircle.Radius = state.TriggerBotFOV
        TriggerBotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        TriggerBotFOVCircle.Visible = state.TriggerBot


        if state.TriggerBot then FireTriggerBot() end
        UpdateSnapLine()
        if state.CrosshairEnabled then UpdateCrosshair() end

        if state.Spinbot then
            spinbotAngle = (spinbotAngle or 0) + state.SpinbotSpeed
            local char = LocalPlayer.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(spinbotAngle), 0) end
            end
        end
    end)

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Insert then
            OrionLib:Destroy()
            ClearCrosshair()
            StopAimbot()
            AimbotFOVCircle:Remove()
            AimbotGlowCircle:Remove()
            SnapLineDrawing:Remove()
            TriggerBotFOVCircle:Remove()
        end
    end)

    Notify("Orvex Flick loaded", "Sucessfully Loaded! Have fun ;^)", 5)
end

local cachedKey = getgenv().VORTEX_KEY or ""
local valid, data = verifyKey(cachedKey)

if valid then
    pcall(function() OrionLib:Destroy() end)
    OrionLib = loadstring(game:HttpGet('https://api.getvortex.vip/api/t/SNN44R/s/OrionLib'))()
    StartCheat()
else
    if data and data.banned then
        error("[ORVEX Auth] You are banned. Reason: " .. (data.banReason or "no reason given"), 0)
    else
        showKeyWindow()
    end
end