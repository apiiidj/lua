local uiLoader = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/dollarware/main/library.lua'))

local ui = uiLoader({
    rounding = false, -- Whether certain features get rounded
    theme = 'orange', -- The theme. Available themes are: cherry, orange, lemon, lime, raspberry, blueberry, grape, watermelon
    smoothDragging = false -- Smooth dragging
})

ui.autoDisableToggles = true -- All toggles will automatically be disabled when the ui is destroyed (window is closed)

-- Make a window
local window = ui.newWindow({
    text = 'Katware', -- Title of window
    resize = true, -- Ability to resize
    size = Vector2.new(650, 500), -- Increased window size for bulk opener
    position = nil -- Custom position, defaults to roughly the bottom right corner
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local camera = workspace.CurrentCamera
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Models to track and their corresponding labels
local modelsToTrack = {
    CrateModelHW = "Halloween Crate",
    Sacrifice = "Sacrifice",
    CrateModel = "Tier 0 Crate",
    CrateModel_T1 = "Normal Crate",
    CrateModel_T2 = "Tier 2 Crate",
    CrateModel_T0 = "Tier 0 Crate",
    GemPickupModel = "Gem Pickup" -- Added gem pickup
}

-- ESP enabled states
local espEnabled = {
    players = false,
    crates = false,
    sacrifice = false,
    gems = false -- Added gems ESP toggle
}

-- Teleport settings
local teleportEnabled = {
    crates = false,
    sacrifice = false,
    gems = false -- Added gems teleport toggle
}

-- Bulk Opener Variables
local bulkOpenerAmounts = {
    halloween = 50,
    blackmarket = 50,
    t0 = 50
}

-- Cursor aimbot enabled state
local aimbotEnabled = false
local isLeftClickHeld = false
local aimbotSmoothing = 0.5 -- Smoothing factor for aimbot
local fovRadius = 100 -- FOV circle radius
local showFovCircle = false

-- Rapid Fire No Scope macro
local rapidFireEnabled = false

-- Anti-AFK Variables
local antiAfkEnabled = false
local antiAfkGui = nil
local antiAfkConnection = nil

-- Logs Variables
local logs = {}
local maxLogs = 8
local logsSection = nil
local logLabels = {} -- Keep track of static labels

-- Crate Counter Variables
local crateCounter = {
    hwCrates = 0,
    t0Crates = 0
}

-- Gem Counter Variable
local gemCounter = 0

-- Create Crate Counter GUI
local function createCrateCounterGUI()
    local playerGui = player:WaitForChild("PlayerGui")
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CrateCounterGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    -- Create Frame
    local frame = Instance.new("Frame")
    frame.Name = "CounterFrame"
    frame.Size = UDim2.new(0, 300, 0, 150) -- Increased height for gem counter
    frame.Position = UDim2.new(1, -320, 1, -170) -- Adjusted position for larger frame
    frame.BackgroundTransparency = 0.3
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    frame.Parent = screenGui
    
    -- Add corner rounding
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    -- Create HW Crate Counter Label
    local hwLabel = Instance.new("TextLabel")
    hwLabel.Name = "HWLabel"
    hwLabel.Size = UDim2.new(1, 0, 0.33, 0)
    hwLabel.Position = UDim2.new(0, 0, 0, 0)
    hwLabel.BackgroundTransparency = 1
    hwLabel.Text = "HW Crates: 0"
    hwLabel.TextColor3 = Color3.fromRGB(138, 43, 226) -- Purple Halloween color
    hwLabel.TextScaled = true
    hwLabel.Font = Enum.Font.SourceSansBold
    hwLabel.TextStrokeTransparency = 0
    hwLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    hwLabel.Parent = frame
    
    -- Create T0 Crate Counter Label
    local t0Label = Instance.new("TextLabel")
    t0Label.Name = "T0Label"
    t0Label.Size = UDim2.new(1, 0, 0.33, 0)
    t0Label.Position = UDim2.new(0, 0, 0.33, 0)
    t0Label.BackgroundTransparency = 1
    t0Label.Text = "T0 Crates: 0"
    t0Label.TextColor3 = Color3.fromRGB(128, 128, 128) -- Grey color for T0
    t0Label.TextScaled = true
    t0Label.Font = Enum.Font.SourceSansBold
    t0Label.TextStrokeTransparency = 0
    t0Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    t0Label.Parent = frame
    
    -- Create Gem Counter Label
    local gemLabel = Instance.new("TextLabel")
    gemLabel.Name = "GemLabel"
    gemLabel.Size = UDim2.new(1, 0, 0.34, 0)
    gemLabel.Position = UDim2.new(0, 0, 0.66, 0)
    gemLabel.BackgroundTransparency = 1
    gemLabel.Text = "Gems: 0"
    gemLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red color for gems
    gemLabel.TextScaled = true
    gemLabel.Font = Enum.Font.SourceSansBold
    gemLabel.TextStrokeTransparency = 0
    gemLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    gemLabel.Parent = frame
    
    return screenGui
end

-- Create the counter GUI
local crateCounterGui = createCrateCounterGUI()

-- Function to add log entry to UI
local function addLog(message, logType)
    local timestamp = os.date("[%H:%M:%S]")
    local logEntry = {
        time = timestamp,
        message = message,
        type = logType or "info"
    }
    
    table.insert(logs, 1, logEntry) -- Insert at beginning for newest first
    
    -- Remove old logs if we exceed max
    if #logs > maxLogs then
        table.remove(logs, maxLogs + 1)
    end
    
    -- Update the logs section if it exists
    if logsSection then
        updateLogsInUI()
    end
    
    -- Also show in chat for immediate feedback
    local chatColor = Color3.fromRGB(255, 255, 255)
    if logType == "success" then chatColor = Color3.fromRGB(0, 255, 0)
    elseif logType == "warning" then chatColor = Color3.fromRGB(255, 165, 0)
    elseif logType == "error" then chatColor = Color3.fromRGB(255, 100, 100)
    elseif logType == "anti-afk" then chatColor = Color3.fromRGB(0, 255, 255) end
    
    pcall(function()
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = timestamp .. " " .. message;
            Color = chatColor;
            Font = Enum.Font.SourceSans;
            TextSize = 16;
        })
    end)
end

-- Function to update logs in the UI section
local function updateLogsInUI()
    if not logsSection then return end
    
    -- Clear existing log entries from UI
    for _, entry in ipairs(logEntries) do
        if entry and entry.destroy then
            pcall(function() entry:destroy() end)
        end
    end
    logEntries = {}
    
    -- Add current logs as label elements in the UI
    for i, log in ipairs(logs) do
        if i <= 8 then -- Only show latest 8 in UI to prevent clutter
            local logText = log.time .. " " .. log.message
            local labelElement = logsSection:addLabel({
                text = logText
            })
            table.insert(logEntries, labelElement)
        end
    end
end

-- Function to clear logs
local function clearLogs()
    logs = {}
    if logsSection then
        updateLogsInUI()
    end
    addLog("All logs cleared!", "warning")
end

-- Function to update the counter display
local function updateCrateCounterDisplay()
    local hwLabel = crateCounterGui.CounterFrame.HWLabel
    local t0Label = crateCounterGui.CounterFrame.T0Label
    local gemLabel = crateCounterGui.CounterFrame.GemLabel
    
    hwLabel.Text = "HW Crates: " .. crateCounter.hwCrates
    t0Label.Text = "T0 Crates: " .. crateCounter.t0Crates
    gemLabel.Text = "Gems: " .. gemCounter
end

-- Function to increment crate counter
local function incrementCrateCounter(crateType)
    if crateType == "HW" then
        crateCounter.hwCrates = crateCounter.hwCrates + 1
    elseif crateType == "T0" then
        crateCounter.t0Crates = crateCounter.t0Crates + 1
    end
    updateCrateCounterDisplay()
end

-- Function to increment gem counter
local function incrementGemCounter()
    gemCounter = gemCounter + 1
    updateCrateCounterDisplay()
end

-- Bulk Crate Opening Functions
local function openHalloweenCrates(amount)
    local ohString1 = "43"
    local ohNumber2 = 2
    local ohString3 = "SID"
    local ohString4 = "cratet1_hw"
    
    addLog("Opening " .. amount .. " Halloween crates...", "success")
    
    for i = 1, amount do
        game:GetService("ReplicatedStorage").GameEvents.Misk.RequestOpenCrate:FireServer(ohString1, ohNumber2, ohString3, ohString4)
        if i % 10 == 0 then -- Wait every 10 crates to prevent potential rate limiting
            wait(0.1)
        end
    end
    
    addLog("Finished opening " .. amount .. " Halloween crates!", "success")
end

local function openBlackMarketCrates(amount)
    local ohString1 = "43"
    local ohNumber2 = 2
    local ohString3 = "SID"
    local ohString4 = "cratet1_bm"
    
    addLog("Opening " .. amount .. " Black Market crates...", "success")
    
    for i = 1, amount do
        game:GetService("ReplicatedStorage").GameEvents.Misk.RequestOpenCrate:FireServer(ohString1, ohNumber2, ohString3, ohString4)
        if i % 10 == 0 then -- Wait every 10 crates to prevent potential rate limiting
            wait(0.1)
        end
    end
    
    addLog("Finished opening " .. amount .. " Black Market crates!", "success")
end

local function openT0Crates(amount)
    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

    local ohString1 = "66"
    local ohNumber2 = 63
    local ohString3 = "SID"
    local ohString4 = "cratet1"

    addLog("Opening " .. amount .. " T0 crates...", "success")
    
    for i = 1, amount do
        game:GetService("ReplicatedStorage").GameEvents.Misk.RequestOpenCrate:FireServer(ohString1, ohNumber2, ohString3, ohString4)
        if i % 10 == 0 then -- Wait every 10 crates to prevent potential rate limiting
            wait(0.1)
        end
    end
    
    addLog("Finished opening " .. amount .. " T0 crates!", "success")
end

-- FOV Circle creation
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 64
fovCircle.Radius = fovRadius
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Transparency = 0.7
fovCircle.Visible = false

-- ESP colors (updated with specific crate colors and gem color)
local espColors = {
    players = Color3.fromRGB(255, 0, 0),
    tier0Crate = Color3.fromRGB(128, 128, 128), -- Grey for Tier 0 Crate
    halloweenCrate = Color3.fromRGB(138, 43, 226), -- Purple Halloween color
    sacrifice = Color3.fromRGB(0, 0, 0), -- Black outline
    regularCrates = Color3.fromRGB(0, 255, 0), -- Green for other crates
    gems = Color3.fromRGB(255, 0, 0) -- Red for gem pickups
}

-- Cache for tracked objects to avoid repeated searches
local trackedModels = {}
local trackedPlayers = {}
local trackedGems = {} -- New cache for gem pickups

-- Teleport function with return teleport feature
local function teleportToModel(model)
    if not model or not model.Parent then return end
    
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local humanoidRootPart = character.HumanoidRootPart
    
    -- Store original position before teleporting
    local originalPosition = humanoidRootPart.Position
    local originalCFrame = humanoidRootPart.CFrame
    
    -- Get the model's position
    local targetPosition
    if model:FindFirstChild("HumanoidRootPart") then
        targetPosition = model.HumanoidRootPart.Position
    elseif model.PrimaryPart then
        targetPosition = model.PrimaryPart.Position
    else
        -- Find the first part in the model to use as reference
        local firstPart = model:FindFirstChildOfClass("Part") or model:FindFirstChildOfClass("MeshPart")
        if firstPart then
            targetPosition = firstPart.Position
        else
            return -- No valid part found
        end
    end
    
    -- Teleport slightly above the target to avoid getting stuck
    targetPosition = targetPosition + Vector3.new(0, 5, 0)
    
    -- Perform the teleport
    humanoidRootPart.CFrame = CFrame.new(targetPosition)
    
    -- Increment counter if it's a trackable item
    if model.Name == "CrateModelHW" then
        incrementCrateCounter("HW")
    elseif model.Name == "CrateModel_T0" or model.Name == "CrateModel" then
        incrementCrateCounter("T0")
    elseif model.Name == "GemPickupModel" then
        incrementGemCounter()
    end
    
    -- Notify the player
    pcall(function()
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Teleported to " .. modelsToTrack[model.Name] .. "!";
            Color = Color3.fromRGB(0, 255, 255);
            Font = Enum.Font.SourceSansBold;
            TextSize = 20;
        })
    end)
    
    -- Wait 0.5 seconds and teleport back to original position
    spawn(function()
        wait(0.5)
        -- Check if character still exists before teleporting back
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = originalCFrame
            
            -- Notify about return teleport
            pcall(function()
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "Returned to original position!";
                    Color = Color3.fromRGB(255, 255, 0);
                    Font = Enum.Font.SourceSansBold;
                    TextSize = 18;
                })
            end)
        end
    end)
end

-- Function to create an outline
local function createOutline(model, color)
    local highlight = Instance.new("Highlight")
    highlight.Parent = model
    highlight.Adornee = model
    highlight.FillColor = color
    highlight.OutlineColor = color
    highlight.FillTransparency = 1 -- Make the fill transparent
    highlight.OutlineTransparency = 0 -- Make the outline visible
    highlight.Name = "ESPHighlight"
    return highlight
end

-- Function to create a label above the model
local function createLabel(model, text)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(1, 0, 1, 0)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = model
    billboardGui.Name = "ESPLabel"

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.Parent = billboardGui

    return textLabel
end

-- Function to update the text size based on distance
local function updateTextSize(textLabel, model)
    if not model.Parent or not textLabel.Parent then return end
    local distance = (model.Position - camera.CFrame.Position).Magnitude
    local scaleFactor = math.clamp(100 / distance, 0.5, 3) -- Improved scaling
    textLabel.TextScaled = false
    textLabel.TextSize = math.floor(14 * scaleFactor)
end

-- Function to clean up ESP elements
local function cleanupESP(object)
    local highlight = object:FindFirstChild("ESPHighlight")
    local label = object:FindFirstChild("ESPLabel")
    if highlight then highlight:Destroy() end
    if label then label:Destroy() end
end

-- Function to check for gem pickups in WorldIgnore.Pickups
local function checkForGems()
    if not espEnabled.gems and not teleportEnabled.gems then return end
    
    local worldIgnore = workspace:FindFirstChild("WorldIgnore")
    if not worldIgnore then return end
    
    local pickups = worldIgnore:FindFirstChild("Pickups")
    if not pickups then return end
    
    -- Clean up destroyed gems from cache
    for i = #trackedGems, 1, -1 do
        if not trackedGems[i] or not trackedGems[i].Parent then
            table.remove(trackedGems, i)
        end
    end
    
    -- Search for GemPickupModel instances
    for _, model in ipairs(pickups:GetChildren()) do
        if model:IsA("Model") and model.Name == "GemPickupModel" then
            local alreadyTracked = false
            for _, tracked in ipairs(trackedGems) do
                if tracked == model then
                    alreadyTracked = true
                    break
                end
            end
            
            if not alreadyTracked then
                -- Add ESP if enabled
                if espEnabled.gems then
                    createOutline(model, espColors.gems)
                    createLabel(model, "Gem Pickup")
                end
                
                table.insert(trackedGems, model)
                
                -- Teleport if enabled
                if teleportEnabled.gems then
                    teleportToModel(model)
                end
                
                -- Notify the player
                pcall(function()
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = "Gem Pickup spawned!";
                        Color = espColors.gems;
                        Font = Enum.Font.SourceSansBold;
                        TextSize = 24;
                    })
                end)
            end
        end
    end
end

-- Function to check for models in the workspace (fixed ESP with specific colors + teleport)
local function checkForModels()
    if not espEnabled.crates and not espEnabled.sacrifice and not teleportEnabled.crates and not teleportEnabled.sacrifice then return end
    
    -- Clean up destroyed models from cache
    for i = #trackedModels, 1, -1 do
        if not trackedModels[i] or not trackedModels[i].Parent then
            table.remove(trackedModels, i)
        end
    end
    
    -- Search through workspace descendants for models
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and modelsToTrack[model.Name] and model.Name ~= "GemPickupModel" then
            local alreadyTracked = false
            for _, tracked in ipairs(trackedModels) do
                if tracked == model then
                    alreadyTracked = true
                    break
                end
            end
            
            if not alreadyTracked then
                local color
                local isESPEnabled
                local isTeleportEnabled
                
                -- Assign specific colors based on model name
                if model.Name == "Sacrifice" then
                    color = espColors.sacrifice
                    isESPEnabled = espEnabled.sacrifice
                    isTeleportEnabled = teleportEnabled.sacrifice
                elseif model.Name == "CrateModelHW" then -- Halloween Crate
                    color = espColors.halloweenCrate
                    isESPEnabled = espEnabled.crates
                    isTeleportEnabled = teleportEnabled.crates
                elseif model.Name == "CrateModel_T0" or model.Name == "CrateModel" then -- Tier 0 Crate
                    color = espColors.tier0Crate
                    isESPEnabled = espEnabled.crates
                    isTeleportEnabled = teleportEnabled.crates
                else -- All other crates (T1, T2, etc.)
                    color = espColors.regularCrates
                    isESPEnabled = espEnabled.crates
                    isTeleportEnabled = teleportEnabled.crates
                end
                
                -- Add ESP if enabled
                if isESPEnabled then
                    createOutline(model, color)
                    createLabel(model, modelsToTrack[model.Name])
                end
                
                table.insert(trackedModels, model)
                
                -- Teleport if enabled
                if isTeleportEnabled then
                    teleportToModel(model)
                end
                
                -- Notify the player
                pcall(function()
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = model.Name .. " has spawned!";
                        Color = color;
                        Font = Enum.Font.SourceSansBold;
                        TextSize = 24;
                    })
                end)
            end
        end
    end
end

-- Function to check for players in the workspace (fixed ESP)
local function checkForPlayers()
    if not espEnabled.players then 
        -- Clean up player ESP if disabled
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                cleanupESP(plr.Character.HumanoidRootPart)
            end
        end
        return 
    end
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Players.LocalPlayer then
            local character = plr.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = character.HumanoidRootPart
                if not humanoidRootPart:FindFirstChild("ESPHighlight") then
                    createOutline(humanoidRootPart, espColors.players)
                    createLabel(humanoidRootPart, plr.Name) -- Add player name label
                end
            end
        end
    end
end

-- Improved cursor aimbot function (targets nearest player to cursor)
local function aimbot()
    if not aimbotEnabled then return end
    
    local target = nil
    local shortestDistance = math.huge
    local mousePos = Vector2.new(mouse.X, mouse.Y)

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Players.LocalPlayer then
            local character = plr.Character
            if character and character:FindFirstChild("Head") and character:FindFirstChild("HumanoidRootPart") then
                local head = character.Head
                local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
                
                if onScreen then
                    -- Target the head position, move up significantly to ensure it's at head level
                    local targetPos = Vector2.new(screenPos.X, screenPos.Y - 50)
                    local distance = (targetPos - mousePos).Magnitude
                    
                    -- Only target players within FOV circle and closer than current target
                    if distance <= fovRadius and distance < shortestDistance then
                        shortestDistance = distance
                        target = targetPos
                    end
                end
            end
        end
    end

    if target and isLeftClickHeld then
        -- Smooth mouse movement
        local currentPos = Vector2.new(mouse.X, mouse.Y)
        local targetPos = target
        local smoothPos = currentPos:lerp(targetPos, aimbotSmoothing)
        
        -- Use mousemoverel for more reliable movement
        local deltaX = smoothPos.X - currentPos.X
        local deltaY = smoothPos.Y - currentPos.Y
        mousemoverel(deltaX, deltaY)
    end
end

-- Update FOV circle position
local function updateFovCircle()
    if showFovCircle and aimbotEnabled then
        fovCircle.Position = Vector2.new(mouse.X, mouse.Y)
        fovCircle.Radius = fovRadius
        fovCircle.Visible = true
    else
        fovCircle.Visible = false
    end
end

-- Connect functions with optimized delays
local modelCheckDelay = 0.3 -- Check every 0.3 seconds
local gemCheckDelay = 0.2 -- Check gems more frequently since they might spawn and disappear quickly
local playerCheckDelay = 0.5 -- Check players less frequently
local lastModelCheck = tick()
local lastGemCheck = tick()
local lastPlayerCheck = tick()

RunService.Stepped:Connect(function()
    local currentTime = tick()
    
    if currentTime - lastModelCheck >= modelCheckDelay then
        checkForModels()
        lastModelCheck = currentTime
    end
    
    if currentTime - lastGemCheck >= gemCheckDelay then
        checkForGems()
        lastGemCheck = currentTime
    end
    
    if currentTime - lastPlayerCheck >= playerCheckDelay then
        checkForPlayers()
        lastPlayerCheck = currentTime
    end
end)

-- Optimized text size updates (less frequent)
local textUpdateDelay = 0.1 -- Update every 0.1 seconds instead of every frame
local lastTextUpdate = tick()

RunService.RenderStepped:Connect(function()
    if tick() - lastTextUpdate >= textUpdateDelay then
        -- Update text for tracked models
        for _, model in ipairs(trackedModels) do
            if model.Parent then
                local label = model:FindFirstChild("ESPLabel")
                if label and label:FindFirstChildOfClass("TextLabel") then
                    updateTextSize(label.TextLabel, model)
                end
            end
        end
        
        -- Update text for tracked gems
        for _, gem in ipairs(trackedGems) do
            if gem.Parent then
                local label = gem:FindFirstChild("ESPLabel")
                if label and label:FindFirstChildOfClass("TextLabel") then
                    updateTextSize(label.TextLabel, gem)
                end
            end
        end
        
        -- Update text for players
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= Players.LocalPlayer and plr.Character then
                local humanoidRootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local label = humanoidRootPart:FindFirstChild("ESPLabel")
                    if label and label:FindFirstChildOfClass("TextLabel") then
                        updateTextSize(label.TextLabel, humanoidRootPart)
                    end
                end
            end
        end
        
        lastTextUpdate = tick()
    end
end)

-- Update aimbot and FOV circle
RunService.RenderStepped:Connect(aimbot)
RunService.RenderStepped:Connect(updateFovCircle)

-- Detect left mouse button press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isLeftClickHeld = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isLeftClickHeld = false
        -- Trigger rapid fire macro when left click is released
        if rapidFireEnabled then
            spawn(rapidFireNoScope)
        end
    end
end)

-- Clean up function for when ESP is disabled
local function toggleESP(espType, enabled)
    if not enabled then
        if espType == "players" then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    cleanupESP(plr.Character.HumanoidRootPart)
                end
            end
        elseif espType == "crates" or espType == "sacrifice" then
            for _, model in ipairs(trackedModels) do
                if model.Parent then
                    local shouldClean = false
                    if espType == "crates" and model.Name ~= "Sacrifice" then
                        shouldClean = true
                    elseif espType == "sacrifice" and model.Name == "Sacrifice" then
                        shouldClean = true
                    end
                    
                    if shouldClean then
                        cleanupESP(model)
                    end
                end
            end
        elseif espType == "gems" then
            for _, gem in ipairs(trackedGems) do
                if gem.Parent then
                    cleanupESP(gem)
                end
            end
        end
    end
end

-- Add menus and sections to the UI
local menu = window:addMenu({
    text = 'Main Features'
})

local section = menu:addSection({
    text = 'ESP & Aimbot',
    side = 'auto',
    showMinButton = true,
})

do
    local playerEspToggle = section:addToggle({
        text = 'Player ESP',
        state = false
    })

    playerEspToggle:bindToEvent('onToggle', function(newState)
        espEnabled.players = newState
        toggleESP("players", newState)
    end)

    local crateEspToggle = section:addToggle({
        text = 'Crate ESP',
        state = false
    })

    crateEspToggle:bindToEvent('onToggle', function(newState)
        espEnabled.crates = newState
        toggleESP("crates", newState)
    end)

    local sacrificeEspToggle = section:addToggle({
        text = 'Sacrifice Knife ESP',
        state = false
    })

    sacrificeEspToggle:bindToEvent('onToggle', function(newState)
        espEnabled.sacrifice = newState
        toggleESP("sacrifice", newState)
    end)

    -- New Gem ESP Toggle
    local gemEspToggle = section:addToggle({
        text = 'Gem Pickup ESP',
        state = false
    })

    gemEspToggle:bindToEvent('onToggle', function(newState)
        espEnabled.gems = newState
        toggleESP("gems", newState)
    end)

    local aimbotToggle = section:addToggle({
        text = 'Cursor Aimbot',
        state = false
    })

    aimbotToggle:bindToEvent('onToggle', function(newState)
        aimbotEnabled = newState
    end)

    local rapidFireToggle = section:addToggle({
        text = 'Rapid Fire No Scope',
        state = false
    })

    rapidFireToggle:bindToEvent('onToggle', function(newState)
        rapidFireEnabled = newState
    end)

    local fovToggle = section:addToggle({
        text = 'Show FOV Circle',
        state = false
    })

    fovToggle:bindToEvent('onToggle', function(newState)
        showFovCircle = newState
    end)

    local smoothingSlider = section:addSlider({
        text = 'Aimbot Smoothing',
        min = 0.1,
        max = 1.0,
        value = aimbotSmoothing,
        increment = 0.1
    })

    smoothingSlider:bindToEvent('onValueChange', function(newValue)
        aimbotSmoothing = newValue
    end)

    local fovSlider = section:addSlider({
        text = 'FOV Radius',
        min = 50,
        max = 300,
        value = fovRadius,
        increment = 10
    })

    fovSlider:bindToEvent('onValueChange', function(newValue)
        fovRadius = newValue
    end)
end

-- New Teleport Section
local teleportSection = menu:addSection({
    text = 'Teleport Features',
    side = 'right',
    showMinButton = true,
})

do
    local crateTeleportToggle = teleportSection:addToggle({
        text = 'Auto Teleport to Crates',
        state = false
    })

    crateTeleportToggle:bindToEvent('onToggle', function(newState)
        teleportEnabled.crates = newState
        if newState then
            pcall(function()
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "Auto teleport to crates enabled!";
                    Color = Color3.fromRGB(0, 255, 0);
                    Font = Enum.Font.SourceSansBold;
                    TextSize = 18;
                })
            end)
        end
    end)

    local sacrificeTeleportToggle = teleportSection:addToggle({
        text = 'Auto Teleport to Sacrifice',
        state = false
    })

    sacrificeTeleportToggle:bindToEvent('onToggle', function(newState)
        teleportEnabled.sacrifice = newState
        if newState then
            pcall(function()
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "Auto teleport to sacrifice enabled!";
                    Color = Color3.fromRGB(255, 165, 0);
                    Font = Enum.Font.SourceSansBold;
                    TextSize = 18;
                })
            end)
        end
    end)

    -- New Gem Teleport Toggle
    local gemTeleportToggle = teleportSection:addToggle({
        text = 'Auto Teleport to Gems',
        state = false
    })

    gemTeleportToggle:bindToEvent('onToggle', function(newState)
        teleportEnabled.gems = newState
        if newState then
            pcall(function()
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "Auto teleport to gems enabled!";
                    Color = Color3.fromRGB(255, 0, 0);
                    Font = Enum.Font.SourceSansBold;
                    TextSize = 18;
                })
            end)
        end
    end)

    -- Reset Counter Button
    local resetCounterButton = teleportSection:addButton({
        text = 'Reset All Counters'
    })

    resetCounterButton:bindToEvent('onPress', function()
        crateCounter.hwCrates = 0
        crateCounter.t0Crates = 0
        gemCounter = 0
        updateCrateCounterDisplay()
        pcall(function()
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "All counters reset!";
                Color = Color3.fromRGB(255, 255, 0);
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            })
        end)
    end)
end

-- NEW BULK CRATE OPENER MENU
local bulkMenu = window:addMenu({
    text = 'Bulk Crate Opener'
})

local bulkSection = bulkMenu:addSection({
    text = 'Halloween Crates',
    side = 'auto',
    showMinButton = true,
})

do
    local halloweenSlider = bulkSection:addSlider({
        text = 'Halloween Crate Amount',
        min = 5,
        max = 200,
        value = bulkOpenerAmounts.halloween,
        increment = 5
    })

    halloweenSlider:bindToEvent('onValueChange', function(newValue)
        bulkOpenerAmounts.halloween = newValue
    end)

    local halloweenOpenButton = bulkSection:addButton({
        text = 'Open Halloween Crates'
    })

    halloweenOpenButton:bindToEvent('onPress', function()
        spawn(function()
            openHalloweenCrates(bulkOpenerAmounts.halloween)
        end)
    end)
end

local bulkSection2 = bulkMenu:addSection({
    text = 'Black Market Crates',
    side = 'right',
    showMinButton = true,
})

do
    local blackMarketSlider = bulkSection2:addSlider({
        text = 'Black Market Amount',
        min = 5,
        max = 200,
        value = bulkOpenerAmounts.blackmarket,
        increment = 5
    })

    blackMarketSlider:bindToEvent('onValueChange', function(newValue)
        bulkOpenerAmounts.blackmarket = newValue
    end)

    local blackMarketOpenButton = bulkSection2:addButton({
        text = 'Open Black Market Crates'
    })

    blackMarketOpenButton:bindToEvent('onPress', function()
        spawn(function()
            openBlackMarketCrates(bulkOpenerAmounts.blackmarket)
        end)
    end)
end

local bulkSection3 = bulkMenu:addSection({
    text = 'T0 Crates',
    side = 'auto',
    showMinButton = true,
})

do
    local t0Slider = bulkSection3:addSlider({
        text = 'T0 Crate Amount',
        min = 5,
        max = 200,
        value = bulkOpenerAmounts.t0,
        increment = 5
    })

    t0Slider:bindToEvent('onValueChange', function(newValue)
        bulkOpenerAmounts.t0 = newValue
    end)

    local t0OpenButton = bulkSection3:addButton({
        text = 'Open T0 Crates'
    })

    t0OpenButton:bindToEvent('onPress', function()
        spawn(function()
            openT0Crates(bulkOpenerAmounts.t0)
        end)
    end)
end

-- Utils menu
local utilsMenu = window:addMenu({
    text = 'Utils'
})

local utilsSection = utilsMenu:addSection({
    text = 'Utility Features',
    side = 'auto',
    showMinButton = true
})

do
    local antiAfkToggle = utilsSection:addToggle({
        text = 'Anti-AFK',
        state = false
    })

    antiAfkToggle:bindToEvent('onToggle', function(newState)
        antiAfkEnabled = newState
        if newState then
            enableAntiAfk()
        else
            disableAntiAfk()
        end
    end)
end

-- Logs menu
local logsMenu = window:addMenu({
    text = 'Activity Logs'
})

logsSection = logsMenu:addSection({
    text = 'Live Activity Monitor',
    side = 'auto',
    showMinButton = false
})

do
    -- Add static labels that will show log information
    logsSection:addLabel({
        text = '=== ACTIVITY MONITOR ==='
    })
    
    logsSection:addLabel({
        text = 'Check chat for live log updates!'
    })
    
    local clearLogsButton = logsSection:addButton({
        text = 'Clear All Logs',
        style = 'small'
    })
    
    clearLogsButton:bindToEvent('onClick', function()
        clearLogs()
    end)
    
    local testAntiAfkButton = logsSection:addButton({
        text = 'Test Anti-AFK',
        style = 'small'
    })
    
    testAntiAfkButton:bindToEvent('onClick', function()
        addLog("SIMULATED KICK BLOCK - System working!", "error")
    end)
    
    -- Add status labels
    logsSection:addLabel({
        text = 'Status indicators:'
    })
    
    logsSection:addLabel({
        text = 'GREEN = System events'
    })
    
    logsSection:addLabel({
        text = 'RED = Blocked kicks/Gems'
    })
    
    logsSection:addLabel({
        text = 'CYAN = Anti-AFK ready'
    })
    
    logsSection:addLabel({
        text = 'ORANGE = Warnings'
    })
end

-- Colors menu
local colorsMenu = window:addMenu({
    text = 'ESP Colors'
})

local section = colorsMenu:addSection({
    text = 'Customize Colors',
    side = 'auto',
    showMinButton = false
})

do
    local playerEspColorPicker = section:addColorPicker({
        text = 'Player ESP Color',
        color = espColors.players
    })

    playerEspColorPicker:bindToEvent('onColorChange', function(newColor)
        espColors.players = newColor
        -- Update all existing player highlights immediately
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= Players.LocalPlayer then
                local character = plr.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local highlight = character.HumanoidRootPart:FindFirstChild("ESPHighlight")
                    if highlight then
                        highlight.OutlineColor = newColor
                        highlight.FillColor = newColor
                    end
                end
            end
        end
    end)

    local tier0CrateColorPicker = section:addColorPicker({
        text = 'Tier 0 Crate Color',
        color = espColors.tier0Crate
    })

    tier0CrateColorPicker:bindToEvent('onColorChange', function(newColor)
        espColors.tier0Crate = newColor
        -- Update all existing tier 0 crate highlights immediately
        for _, model in ipairs(trackedModels) do
            if model.Parent and (model.Name == "CrateModel_T0" or model.Name == "CrateModel") then
                local highlight = model:FindFirstChild("ESPHighlight")
                if highlight then
                    highlight.OutlineColor = newColor
                    highlight.FillColor = newColor
                end
            end
        end
    end)

    local halloweenCrateColorPicker = section:addColorPicker({
        text = 'Halloween Crate Color',
        color = espColors.halloweenCrate
    })

    halloweenCrateColorPicker:bindToEvent('onColorChange', function(newColor)
        espColors.halloweenCrate = newColor
        -- Update all existing halloween crate highlights immediately
        for _, model in ipairs(trackedModels) do
            if model.Parent and model.Name == "CrateModelHW" then
                local highlight = model:FindFirstChild("ESPHighlight")
                if highlight then
                    highlight.OutlineColor = newColor
                    highlight.FillColor = newColor
                end
            end
        end
    end)

    local regularCrateColorPicker = section:addColorPicker({
        text = 'Regular Crate Color',
        color = espColors.regularCrates
    })

    regularCrateColorPicker:bindToEvent('onColorChange', function(newColor)
        espColors.regularCrates = newColor
        -- Update all existing regular crate highlights immediately
        for _, model in ipairs(trackedModels) do
            if model.Parent and (model.Name == "CrateModel_T1" or model.Name == "CrateModel_T2") then
                local highlight = model:FindFirstChild("ESPHighlight")
                if highlight then
                    highlight.OutlineColor = newColor
                    highlight.FillColor = newColor
                end
            end
        end
    end)

    local sacrificeEspColorPicker = section:addColorPicker({
        text = 'Sacrifice Knife Color',
        color = espColors.sacrifice
    })

    sacrificeEspColorPicker:bindToEvent('onColorChange', function(newColor)
        espColors.sacrifice = newColor
        -- Update all existing sacrifice highlights immediately
        for _, model in ipairs(trackedModels) do
            if model.Parent and model.Name == "Sacrifice" then
                local highlight = model:FindFirstChild("ESPHighlight")
                if highlight then
                    highlight.OutlineColor = newColor
                    highlight.FillColor = newColor
                end
            end
        end
    end)

    -- New Gem ESP Color Picker
    local gemEspColorPicker = section:addColorPicker({
        text = 'Gem Pickup Color',
        color = espColors.gems
    })

    gemEspColorPicker:bindToEvent('onColorChange', function(newColor)
        espColors.gems = newColor
        -- Update all existing gem highlights immediately
        for _, gem in ipairs(trackedGems) do
            if gem.Parent then
                local highlight = gem:FindFirstChild("ESPHighlight")
                if highlight then
                    highlight.OutlineColor = newColor
                    highlight.FillColor = newColor
                end
            end
        end
        -- Also update the counter GUI color
        local gemLabel = crateCounterGui.CounterFrame.GemLabel
        gemLabel.TextColor3 = newColor
    end)
end

-- Initialize the counter display
updateCrateCounterDisplay()

-- Add initial log entry
addLog("FuzzHub v2.2 with Bulk Opener loaded successfully!", "success")

-- Anti-AFK Functions
local function enableAntiAfk()
    if antiAfkConnection then return end -- Already enabled
    
    addLog("Anti-AFK system activated!", "success")
    
    local bb = game:service('VirtualUser')
    antiAfkConnection = game:service('Players').LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        addLog("BLOCKED IDLE KICK ATTEMPT!", "error")
        wait(2)
        addLog("System ready - monitoring for kicks", "anti-afk")
    end)
end

local function disableAntiAfk()
    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
        addLog("Anti-AFK system deactivated", "warning")
    end
end