

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "6D8Z7E"
getgenv().scriptidentifier = "berlin-v2-autofarm"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/6D8Z7E/ws-loader"))()




if not game:IsLoaded() then
    game.Loaded:Wait()
end


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local CASH_TWEEN_SPEED = 35


local Settings = { Enabled = false }
local Runtime = {
    Generation = 0,
    LastMoneyCFrame = nil,
    ActiveTween = nil,
    NoclipConnection = nil,
    AntiAfkConnection = nil,
    CollisionStates = {},
    HoldCFrame = nil,
}
local Controls = {}
local StatusLabel = nil


Runtime.AntiAfkConnection = LocalPlayer.Idled:Connect(function()
    local cameraCFrame = workspace.CurrentCamera and workspace.CurrentCamera.CFrame or CFrame.new()
    VirtualUser:CaptureController()
    VirtualUser:Button2Down(Vector2.zero, cameraCFrame)
    task.wait(0.1)
    VirtualUser:Button2Up(Vector2.zero, cameraCFrame)
end)

local function setStatus(text)
    if StatusLabel then
        StatusLabel:Set(text)
    end
end


local function getRootPart()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    return character:WaitForChild("HumanoidRootPart")
end

local function getTargetPart(instance)
    if instance:IsA("BasePart") then return instance end
    if instance:IsA("Model") then
        return instance.PrimaryPart or instance:FindFirstChild("HumanoidRootPart") or instance:FindFirstChildWhichIsA("BasePart", true)
    end
    return instance:FindFirstChildWhichIsA("BasePart", true)
end

local function isRunning(generation)
    return Settings.Enabled and Runtime.Generation == generation
end

local function startNoclip()
    if Runtime.NoclipConnection then return end
    Runtime.NoclipConnection = RunService.Stepped:Connect(function()
        if not Settings.Enabled then return end
        local character = LocalPlayer.Character
        if not character then return end
        for _, descendant in ipairs(character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                if Runtime.CollisionStates[descendant] == nil then
                    Runtime.CollisionStates[descendant] = descendant.CanCollide
                end
                descendant.CanCollide = false
            end
        end
        if Runtime.HoldCFrame then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.AssemblyLinearVelocity = Vector3.zero
                rootPart.AssemblyAngularVelocity = Vector3.zero
                rootPart.CFrame = Runtime.HoldCFrame
            end
        end
    end)
end

local function stopNoclip()
    if Runtime.NoclipConnection then
        Runtime.NoclipConnection:Disconnect()
        Runtime.NoclipConnection = nil
    end
    for part, canCollide in pairs(Runtime.CollisionStates) do
        if part and part.Parent then
            part.CanCollide = canCollide
        end
    end
    table.clear(Runtime.CollisionStates)
    Runtime.HoldCFrame = nil
end

local function cancelCashTween()
    if Runtime.ActiveTween then
        Runtime.ActiveTween:Cancel()
        Runtime.ActiveTween = nil
    end
end

local function teleportToCFrame(targetCFrame, generation)
    if not isRunning(generation) then return false end
    Runtime.HoldCFrame = nil
    local rootPart = getRootPart()
    rootPart.AssemblyLinearVelocity = Vector3.zero
    rootPart.AssemblyAngularVelocity = Vector3.zero
    rootPart.CFrame = targetCFrame
    return isRunning(generation)
end

local function tweenCashToCFrame(targetCFrame, generation)
    if not isRunning(generation) then return false end
    Runtime.HoldCFrame = nil
    local rootPart = getRootPart()
    local distance = (rootPart.Position - targetCFrame.Position).Magnitude
    local duration = math.max(distance / CASH_TWEEN_SPEED, 0.05)
    rootPart.AssemblyLinearVelocity = Vector3.zero
    rootPart.AssemblyAngularVelocity = Vector3.zero
    local tween = TweenService:Create(rootPart, TweenInfo.new(duration, Enum.EasingStyle.Linear), { CFrame = targetCFrame })
    Runtime.ActiveTween = tween
    tween:Play()
    local playbackState = tween.Completed:Wait()
    if Runtime.ActiveTween == tween then
        Runtime.ActiveTween = nil
    end
    return isRunning(generation) and playbackState == Enum.PlaybackState.Completed
end

local function holdAtCFrame(targetCFrame, generation)
    if not teleportToCFrame(targetCFrame, generation) then return false end
    Runtime.HoldCFrame = targetCFrame
    return true
end

local function triggerPrompt(prompt)
    assert(prompt and prompt:IsA("ProximityPrompt"), "ProximityPrompt nicht gefunden.")
    if type(fireproximityprompt) == "function" then
        fireproximityprompt(prompt)
        return
    end
    prompt:InputHoldBegin()
    task.wait(math.max(prompt.HoldDuration, 0.1))
    prompt:InputHoldEnd()
end

local function getPromptPart(prompt)
    local current = prompt.Parent
    while current and current ~= workspace do
        if current:IsA("BasePart") then return current end
        current = current.Parent
    end
    return nil
end

local function getMoneyTimer()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    local moneyStatus = playerGui and playerGui:FindFirstChild("MoneyStatus")
    local imageLabel = moneyStatus and moneyStatus:FindFirstChild("ImageLabel")
    return imageLabel and imageLabel:FindFirstChild("Zeit"), moneyStatus
end

local function isGuiVisible(instance, stopAt)
    local current = instance
    while current and current ~= stopAt do
        if current:IsA("GuiObject") and not current.Visible then return false end
        if current:IsA("LayerCollector") and not current.Enabled then return false end
        current = current.Parent
    end
    return current == stopAt
end

local function isATMRequested()
    local zeit, moneyStatus = getMoneyTimer()
    if not zeit or not moneyStatus then return false end
    if not isGuiVisible(zeit, moneyStatus.Parent) then return false end
    return zeit.Text == "Besuche einen Bankomaten!"
end

local function waitForMoney(index, generation)
    local name = "Geld" .. index
    while isRunning(generation) do
        if isATMRequested() then return nil, "ATM" end
        local money = workspace:FindFirstChild(name)
        if money then return money, "READY" end
        setStatus("Warte auf " .. name .. " ...")
        task.wait(0.25)
    end
    return nil, "STOPPED"
end

local function isMoneyInvisible(hauptGeld)
    local foundPart = false
    if hauptGeld:IsA("BasePart") then
        foundPart = true
        if hauptGeld.Transparency < 1 then return false end
    end
    for _, descendant in ipairs(hauptGeld:GetDescendants()) do
        if descendant:IsA("BasePart") then
            foundPart = true
            if descendant.Transparency < 1 then return false end
        end
    end
    return foundPart
end

local function isMoneyTimerActive()
    return not isATMRequested()
end

local function waitForCollectibleMoney(hauptGeld, index, waitCFrame, generation)
    Runtime.HoldCFrame = waitCFrame
    while isRunning(generation) and hauptGeld.Parent do
        if isATMRequested() then return "ATM" end
        local timerActive = isMoneyTimerActive()
        local moneyVisible = not isMoneyInvisible(hauptGeld)
        if timerActive and moneyVisible then return "READY" end
        if not timerActive then
            setStatus(string.format("Geldanzeige nicht bereit. Warte vor Geld%d ...", index))
        else
            setStatus(string.format("Geld%d ist unsichtbar. Warte auf Respawn ...", index))
        end
        task.wait(0.1)
    end
    return "STOPPED"
end

local function collectMoney(index, generation)
    local money, moneyState = waitForMoney(index, generation)
    if not money then return moneyState end
    if not isRunning(generation) then return "STOPPED" end

    local hauptGeld = money:WaitForChild("HauptGeld", 10)
    assert(hauptGeld, money.Name .. ".HauptGeld wurde nicht gefunden.")
    local bargeld = hauptGeld:WaitForChild("Bargeld", 10)
    assert(bargeld, money.Name .. ".HauptGeld.Bargeld wurde nicht gefunden.")
    local prompt
    if bargeld:IsA("ProximityPrompt") then
        prompt = bargeld
    else
        prompt = bargeld:FindFirstChildWhichIsA("ProximityPrompt", true)
    end
    assert(prompt, "Kein ProximityPrompt bei " .. bargeld:GetFullName() .. " gefunden.")
    local teleportTarget = prompt.Parent
    assert(teleportTarget, "Der ProximityPrompt hat kein Parent-Objekt.")
    local moneyPart = getTargetPart(teleportTarget)
    assert(moneyPart, "Das Geldobjekt enthält kein BasePart.")
    Runtime.LastMoneyCFrame = moneyPart.CFrame

    local collectPosition = (moneyPart.CFrame * CFrame.new(0, 0, -3)).Position
    local collectCFrame = CFrame.lookAt(collectPosition, moneyPart.Position)
    local belowPosition = collectPosition - Vector3.new(0, 10, 0)
    local belowCFrame = CFrame.lookAt(belowPosition, moneyPart.Position)

    while isRunning(generation) do
        setStatus(string.format("Warte 10 Studs unter Geld%d ...", index))
        if not holdAtCFrame(belowCFrame, generation) then return "STOPPED" end
        local collectibleState = waitForCollectibleMoney(hauptGeld, index, belowCFrame, generation)
        if collectibleState ~= "READY" then return collectibleState end
        setStatus(string.format("Tween zu Geld%d ...", index))
        if not tweenCashToCFrame(collectCFrame, generation) then return "STOPPED" end
        if isATMRequested() then return "ATM" end
        if isMoneyTimerActive() and not isMoneyInvisible(hauptGeld) then break end
    end

    setStatus(string.format("Sammle Geld%d ...", index))
    triggerPrompt(prompt)
    if not holdAtCFrame(belowCFrame, generation) then return "STOPPED" end
    while isRunning(generation) and money.Parent and not isMoneyInvisible(hauptGeld) do
        if isATMRequested() then return "ATM" end
        task.wait(0.1)
    end
    return isRunning(generation) and "COLLECTED" or "STOPPED"
end

local function waitForATMText(generation)
    setStatus('Warte auf "Besuche einen Bankomaten!" ...')
    while isRunning(generation) do
        local zeit = getMoneyTimer()
        if zeit and zeit.Text == "Besuche einen Bankomaten!" then return true end
        task.wait(0.25)
    end
    return false
end

local function getBelowMoneyCFrame(index)
    local money = workspace:FindFirstChild("Geld" .. index)
    local hauptGeld = money and money:FindFirstChild("HauptGeld")
    local moneyPart = hauptGeld and getTargetPart(hauptGeld)
    if not moneyPart then return nil end
    local collectPosition = (moneyPart.CFrame * CFrame.new(0, 0, -3)).Position
    local belowPosition = collectPosition - Vector3.new(0, 10, 0)
    return CFrame.lookAt(belowPosition, moneyPart.Position)
end

local function useATM(generation)
    if not waitForATMText(generation) then return false end
    local bankautomaten = workspace:WaitForChild("Bankautomaten", 10)
    assert(bankautomaten, "workspace.Bankautomaten wurde nicht gefunden.")
    local atm = bankautomaten:GetChildren()[3]
    assert(atm, "workspace.Bankautomaten:GetChildren()[3] wurde nicht gefunden.")
    local prompt = atm:FindFirstChild("ATMPrompt", true)
    assert(prompt and prompt:IsA("ProximityPrompt"), "ATMPrompt wurde nicht gefunden.")
    local promptPart = getPromptPart(prompt)
    assert(promptPart, "Kein BasePart für ATMPrompt wurde gefunden.")
    local atmPosition = (promptPart.CFrame * CFrame.new(0, 0, -2)).Position
    local atmCFrame = CFrame.lookAt(atmPosition, promptPart.Position)

    setStatus("Teleport zum Bankomaten ...")
    if not teleportToCFrame(atmCFrame, generation) then return false end
    if not isRunning(generation) then return false end

    while isRunning(generation) and isATMRequested() do
        setStatus("Benutze Bankomaten ...")
        triggerPrompt(prompt)
        local retryDelay = math.max(prompt.HoldDuration + 0.25, 0.5)
        local retryAt = os.clock() + retryDelay
        while isRunning(generation) and isATMRequested() and os.clock() < retryAt do
            task.wait(0.1)
        end
    end

    if not isRunning(generation) then return false end
    local waitCFrame = getBelowMoneyCFrame(1)
    if not waitCFrame and Runtime.LastMoneyCFrame then
        waitCFrame = Runtime.LastMoneyCFrame * CFrame.new(0, -10, 0)
    end
    assert(waitCFrame, "Keine Geldposition zum Warten gefunden.")
    setStatus("Warte 10 Studs unter Geld1 auf neues Geld ...")
    return holdAtCFrame(waitCFrame, generation)
end

local function runFarm(generation)
    while isRunning(generation) do
        local goToATM = false
        for index = 1, 6 do
            local result = collectMoney(index, generation)
            if result == "ATM" then
                goToATM = true
                break
            end
            if result ~= "COLLECTED" then
                return
            end
        end
        if not goToATM then
            setStatus("Alle Geldstapel gesammelt. Warte 10 Studs unter dem Geld ...")
            local waitCFrame = getBelowMoneyCFrame(6)
            if not waitCFrame and Runtime.LastMoneyCFrame then
                waitCFrame = Runtime.LastMoneyCFrame * CFrame.new(0, -10, 0)
            end
            assert(waitCFrame, "Die letzte Geldposition wurde nicht gespeichert.")
            if not holdAtCFrame(waitCFrame, generation) then return end
        else
            cancelCashTween()
            setStatus("Bankomaten-Auftrag erkannt.")
        end
        if not useATM(generation) then return end
        setStatus("Zyklus abgeschlossen. Warte auf neues Geld ...")
    end
end

local function stopFarm(syncToggle)
    Settings.Enabled = false
    Runtime.Generation += 1
    cancelCashTween()
    stopNoclip()
    setStatus("Auto Farm gestoppt.")
    if syncToggle and Controls.AutoFarm then
        pcall(function() Controls.AutoFarm:Set(false) end)
    end
end

local function startFarm()
    if Settings.Enabled then return end
    Settings.Enabled = true
    Runtime.Generation += 1
    startNoclip()
    local generation = Runtime.Generation
    setStatus("Auto Farm gestartet.")
    task.spawn(function()
        local success, farmError = pcall(runFarm, generation)
        if not success and isRunning(generation) then
            Rayfield:Notify({
                Title = "Auto Farm Fehler",
                Content = tostring(farmError),
                Duration = 6,
            })
            stopFarm(true)
        end
    end)
end





local Window = Rayfield:CreateWindow({
    Name = "Berlin V2 Auto Farm",
    Icon = 0,
    LoadingTitle = "Berlin V2 Auto Farm",
    LoadingSubtitle = "by Messe Nord",
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = true,
    KeySettings = {
        Title = "🔑 Need Key",
        Subtitle = "Enter Key",
        Note = "Get the key on our discord:https://discord.gg/m7cme4Hegh",
        FileName = "BerlinV2Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {
            "FuckBerlinV2"  
        }
    }
})


local FarmTab = Window:CreateTab("Auto Farm", "banknote")

StatusLabel = FarmTab:CreateLabel("Status: Auto Farm is ready.", 0, Color3.fromRGB(200, 200, 200), false)

Controls.AutoFarm = FarmTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        if Value then
            startFarm()
        else
            stopFarm(false)
        end
    end
})


Window:OnDestroy(function()
    stopFarm(false)
    if Runtime.AntiAfkConnection then
        Runtime.AntiAfkConnection:Disconnect()
        Runtime.AntiAfkConnection = nil
    end
end)

FarmTab:Select()

Rayfield:Notify({
    Title = "Berlin V2",
    Content = "Auto Farm loaded..",
    Duration = 4
})