-- [[ CONFIGURASI AWAL ]]
local enabled = false
local isResting = false
local autoRestEnabled = true
local currentMode = "1 Per 1"
local orbitRange, orbitSpeed, attackInterval, teleportTime = 23, 20, 1.3, 0.1
local restDelay, beforeRestDelay = 2, 2
local angle, lastAttack, lastTargetSwitch, lastRestFull, zeroStackTick = 0, 0, 0, 0, 0
local currentTarget = nil
local allIndex = 1
local minimized = false
local sideMenuOpen = false
local isJoining = false
local currentSelectorTab = "MAGIC"

-- [[ CONFIG AUTO JOIN ]]
local Pilihan_Mode = "Siege"
local Pilihan_Diff = "Hard"

-- [[ CONFIG MISC ]]
local walkSpeedVal, jumpPowerVal, infJumpEnabled = 16, 50, false
local autoPotionClick = false -- Dikawal oleh menu Misc

-- [[ CONFIG SELECTIONS ]]
local selections = {
    ["MAGIC"] = { buy = {}, activeBuy = false, activeStop = false },
    ["RELIC"] = { buy = {}, activeBuy = false, activeStop = false },
    ["STAFF"] = { buy = {}, activeBuy = false, activeStop = false },
    ["TRAVELER"] = { activeBuyAll = false }
}

-- [[ WARNA TIER & MUTATION ]]
local rarityColors = {
    ["Common"] = Color3.fromRGB(255, 255, 255), ["Uncommon"] = Color3.fromRGB(85, 255, 127),
    ["Rare"] = Color3.fromRGB(0, 170, 255), ["Magical"] = Color3.fromRGB(85, 255, 255),
    ["Epic"] = Color3.fromRGB(170, 0, 255), ["Legendary"] = Color3.fromRGB(255, 170, 0),
    ["Mythical"] = Color3.fromRGB(255, 0, 127), ["Godly"] = Color3.fromRGB(0, 255, 255),
    ["Prismatic"] = Color3.fromRGB(255, 255, 255)
}
local mutationColors = {
    ["Shiny"] = Color3.fromRGB(255, 255, 0), ["Corrupted"] = Color3.fromRGB(255, 0, 0),
    ["Albino"] = Color3.fromRGB(255, 255, 255), ["Negative"] = Color3.fromRGB(50, 50, 50),
    ["Golden"] = Color3.fromRGB(255, 215, 0)
}

-- [[ SENARAI ITEMS ]]
local relicItems = {"Frostheart Gem", "Netherflame Crystal", "Moonveil Gem", "Starforge Ruby", "Aether Crystal", "Bloodhex Ruby", "Ember Shard", "Starlume Crystal", "Spellweave Gem", "Sunflare Amber"}
local staffItems = {"Starter Staff", "Apprentice Staff", "Master's Staff", "Energy Staff", "Earth Staff", "Fire Staff", "Wind Staff", "Lightning Staff", "Nature Staff", "Water Staff", "Light Staff", "Holy Staff", "Explosion Staff", "Dark Staff", "Flower Staff", "Void Staff", "Dusk Staff", "Mystic Staff", "Venom Staff", "Reaper Staff", "Lunar Staff", "Atomic Staff", "Fractal Staff"}
local magicItems = {"Fire Flies", "Earth Slam", "Energy Blast", "Fire Ball", "Wind Slice", "Boulder Roll", "Water Bullets", "Wind Cyclone", "Tsunami", "Light Beam", "Light Ray", "Holy Light", "Flower Bloom", "Purify", "Void Slash", "Void Heart", "Venom Surge", "Reaper Frenzy", "Lunar Shatter", "Atomic Blast", "Fractal Cleave"}

-- [[ PATHS ]]
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Utility").Network.Events.RemoteEvent
local PlayerGui = player:WaitForChild("PlayerGui")
local MainData = player:WaitForChild("Data"):WaitForChild("MainData")

-- UI Shop Paths
local relicShopUI = PlayerGui:WaitForChild("Main").Frames.RelicShop.MainFrame.ScrollFrame
local staffShopUI = PlayerGui:WaitForChild("Main").Frames.StaffShop.MainFrame.ScrollFrame
local magicShopUI = PlayerGui:WaitForChild("Main").Frames.MagicShop.MainFrame.ScrollFrame

-- [[ FUNCTIONS ]]
local function InternalClick(btn)
    if not btn then return end
    pcall(function()
        if getconnections then
            for _, c in pairs(getconnections(btn.MouseButton1Click)) do c:Fire() end
            for _, c in pairs(getconnections(btn.Activated)) do c:Fire() end
        end
        if firesignal then 
            firesignal(btn.MouseButton1Click) 
            firesignal(btn.Activated) 
        end
    end)
end

-- [[ AUTO CLICK POTION MINIGAME ]]
task.spawn(function()
    while true do
        local minigame = PlayerGui:FindFirstChild("PotionMinigame")
        if minigame and minigame:FindFirstChild("Frame") then
            local frame = minigame.Frame
            local connection = frame.ChildAdded:Connect(function(obj)
                if autoPotionClick and obj.Name == "Circle" then
                    task.wait()
                    InternalClick(obj)
                end
            end)
            for _, child in pairs(frame:GetChildren()) do
                if autoPotionClick and child.Name == "Circle" then
                    InternalClick(child)
                end
            end
            while minigame.Parent == PlayerGui do task.wait(1) end
            connection:Disconnect()
        end
        task.wait(1)
    end
end)

local function getItemColor(itemUI)
    if not itemUI then return Color3.new(1,1,1) end
    for mName, mColor in pairs(mutationColors) do if itemUI:FindFirstChild(mName, true) or (itemUI:FindFirstChild("Mutation") and itemUI.Mutation.Text:find(mName)) then return mColor end end
    for rName, rColor in pairs(rarityColors) do if itemUI:FindFirstChild(rName, true) or (itemUI:FindFirstChild("Tier") and itemUI.Tier.Text:find(rName)) then return rColor end end
    return Color3.new(1,1,1)
end

local function getStackCount()
    local count, hasUI = 0, false
    pcall(function()
        local myChar = player.Character
        local stackUI = myChar and myChar:FindFirstChild("StackUI", true)
        if stackUI and stackUI:FindFirstChild("Frame") then
            hasUI = true
            for _, child in pairs(stackUI.Frame:GetChildren()) do
                if child:IsA("GuiObject") and child.Visible == true then
                    local color = child:IsA("Frame") and child.BackgroundColor3 or (child:IsA("ImageLabel") and child.ImageColor3)
                    if color and (color.r + color.g + color.b) > 1.8 then count = count + 1 end
                end
            end
        end
    end)
    return count, hasUI
end

-- [[ AUTO JOIN SEQUENCE ]]
local function runJoinSequence()
    if isJoining or not enabled then return end
    isJoining = true
    pcall(function()
        InternalClick(PlayerGui.Main.HUDButtons.Buttons.Portal.TextButton)
        task.wait(2.5)
        local lobby = PlayerGui:FindFirstChild("Lobby")
        if lobby and lobby:FindFirstChild("GamemodeSelection") then
            local modeSelect = lobby.GamemodeSelection
            local btn = modeSelect:FindFirstChild(Pilihan_Mode)
            InternalClick(btn and (btn:IsA("GuiButton") and btn or btn:FindFirstChildWhichIsA("GuiButton", true)) or modeSelect.Default.ImageButton)
            task.wait(1.5)
            local diffBtn = lobby.Map.Difficulties:FindFirstChild(Pilihan_Diff)
            if diffBtn then InternalClick(diffBtn) end
            task.wait(1.0)
            InternalClick(lobby.Map.Start)
        end
    end)
    task.wait(5)
    isJoining = false
end

-- [[ AUTO BUY LOOP ]]
task.spawn(function()
    while task.wait(0.8) do
        local cfg = { {relicShopUI, "RELIC", "BuyRelic"}, {staffShopUI, "STAFF", "BuyStaff"}, {magicShopUI, "MAGIC", "BuyMagic"} }
        for _, s in pairs(cfg) do
            local data = selections[s[2]]
            if data and data.activeBuy and #data.buy > 0 then
                for _, itm in pairs(data.buy) do
                    local ui = s[1]:FindFirstChild(itm)
                    if ui and ui:FindFirstChild("Stock") and not ui.Stock.Text:find("X0") then 
                        remote:FireServer(s[3], {[1] = itm}, tick())
                        if data.activeStop then enabled = false; break end 
                    end
                end
            end
        end
    end
end)

-- [[ UI BUILD ]]
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui")); ScreenGui.Name = "ProToolV7_Final"; ScreenGui.ResetOnSpawn = false
local MainFrame = Instance.new("Frame", ScreenGui); MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); MainFrame.Position = UDim2.new(0.5, -120, 0.5, -160); MainFrame.Size = UDim2.new(0, 240, 0, 360); MainFrame.BorderSizePixel = 0; Instance.new("UICorner", MainFrame)
local TitleBar = Instance.new("Frame", MainFrame); TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30); TitleBar.Size = UDim2.new(1, 0, 0, 30); TitleBar.ZIndex = 500; Instance.new("UICorner", TitleBar)
local TitleLabel = Instance.new("TextLabel", TitleBar); TitleLabel.Text = "brew a potion"; TitleLabel.TextColor3 = Color3.new(1,1,1); TitleLabel.Size = UDim2.new(1, -60, 1, 0); TitleLabel.BackgroundTransparency = 1; TitleLabel.Font = Enum.Font.GothamBold; TitleLabel.TextSize = 10; TitleLabel.ZIndex = 501
local CloseBtn = Instance.new("TextButton", TitleBar); CloseBtn.Text = "X"; CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40); CloseBtn.Position = UDim2.new(1, -28, 0, 3); CloseBtn.Size = UDim2.new(0, 24, 0, 24); CloseBtn.TextColor3 = Color3.new(1,1,1); CloseBtn.ZIndex = 501; Instance.new("UICorner", CloseBtn)
local MinBtn = Instance.new("TextButton", TitleBar); MinBtn.Text = "-"; MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60); MinBtn.Position = UDim2.new(1, -55, 0, 3); MinBtn.Size = UDim2.new(0, 24, 0, 24); MinBtn.TextColor3 = Color3.new(1,1,1); MinBtn.ZIndex = 501; Instance.new("UICorner", MinBtn)
local OpenSideBtn = Instance.new("TextButton", MainFrame); OpenSideBtn.Size = UDim2.new(0, 20, 0, 40); OpenSideBtn.Position = UDim2.new(0, -20, 0.4, 0); OpenSideBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); OpenSideBtn.Text = ">"; OpenSideBtn.TextColor3 = Color3.new(1,1,1); OpenSideBtn.Font = Enum.Font.GothamBold; OpenSideBtn.ZIndex = 100; Instance.new("UICorner", OpenSideBtn).CornerRadius = UDim.new(0, 4)

local AAControls = Instance.new("Frame", MainFrame); AAControls.Size = UDim2.new(1,0,0,110); AAControls.Position = UDim2.new(0,0,0,30); AAControls.BackgroundTransparency = 1; AAControls.ZIndex = 50
local ToggleBtn = Instance.new("TextButton", AAControls); ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 130, 70); ToggleBtn.Position = UDim2.new(0.05, 0, 0.05, 0); ToggleBtn.Size = UDim2.new(0.43, 0, 0, 26); ToggleBtn.Text = "START"; ToggleBtn.Font = Enum.Font.GothamBold; ToggleBtn.TextColor3 = Color3.new(1,1,1); ToggleBtn.TextSize = 9; Instance.new("UICorner", ToggleBtn)
local ModeBtn = Instance.new("TextButton", AAControls); ModeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 120); ModeBtn.Position = UDim2.new(0.52, 0, 0.05, 0); ModeBtn.Size = UDim2.new(0.43, 0, 0, 26); ModeBtn.Text = "1 Per 1"; ModeBtn.Font = Enum.Font.GothamBold; ModeBtn.TextColor3 = Color3.new(1,1,1); ModeBtn.TextSize = 9; Instance.new("UICorner", ModeBtn)
local JoinModeBtn = Instance.new("TextButton", AAControls); JoinModeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); JoinModeBtn.Position = UDim2.new(0.05, 0, 0.32, 0); JoinModeBtn.Size = UDim2.new(0.43, 0, 0, 24); JoinModeBtn.Text = "SIEGE"; JoinModeBtn.Font = Enum.Font.GothamBold; JoinModeBtn.TextColor3 = Color3.fromRGB(200, 200, 200); JoinModeBtn.TextSize = 8; Instance.new("UICorner", JoinModeBtn)
local JoinDiffBtn = Instance.new("TextButton", AAControls); JoinDiffBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); JoinDiffBtn.Position = UDim2.new(0.52, 0, 0.32, 0); JoinDiffBtn.Size = UDim2.new(0.43, 0, 0, 24); JoinDiffBtn.Text = "HARD"; JoinDiffBtn.Font = Enum.Font.GothamBold; JoinDiffBtn.TextColor3 = Color3.fromRGB(200, 200, 200); JoinDiffBtn.TextSize = 8; Instance.new("UICorner", JoinDiffBtn)
local AutoRestBtn = Instance.new("TextButton", AAControls); AutoRestBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 80); AutoRestBtn.Position = UDim2.new(0.05, 0, 0.58, 0); AutoRestBtn.Size = UDim2.new(0.9, 0, 0, 22); AutoRestBtn.Text = "AUTO REST: ON"; AutoRestBtn.Font = Enum.Font.GothamBold; AutoRestBtn.TextColor3 = Color3.new(1,1,1); AutoRestBtn.TextSize = 9; Instance.new("UICorner", AutoRestBtn)

local InfoFrame = Instance.new("Frame", MainFrame); InfoFrame.Size = UDim2.new(1,0,0,45); InfoFrame.Position = UDim2.new(0,0,0,315); InfoFrame.BackgroundTransparency = 1; InfoFrame.ZIndex = 50
local ManaDisplay = Instance.new("TextLabel", InfoFrame); ManaDisplay.Size = UDim2.new(0.9, 0, 0, 25); ManaDisplay.Position = UDim2.new(0.05, 0, 0, 0); ManaDisplay.BackgroundColor3 = Color3.fromRGB(25, 25, 40); ManaDisplay.Text = "WHITE STACKS: 0"; ManaDisplay.TextColor3 = Color3.fromRGB(0, 255, 255); ManaDisplay.Font = Enum.Font.GothamBold; ManaDisplay.TextSize = 11; Instance.new("UICorner", ManaDisplay)
local DebugLabel = Instance.new("TextLabel", InfoFrame); DebugLabel.Size = UDim2.new(0.9, 0, 0, 15); DebugLabel.Position = UDim2.new(0.05, 0, 0.6, 0); DebugLabel.BackgroundTransparency = 1; DebugLabel.Text = "Status: Idle"; DebugLabel.TextColor3 = Color3.fromRGB(200, 200, 200); DebugLabel.Font = Enum.Font.Gotham; DebugLabel.TextSize = 8

-- [[ PAGES ]]
local Pages = {}; local SideButtons = {}; local currentPageName = "AUTO ATTACK"
local function createPage(name)
    local f = Instance.new("ScrollingFrame", MainFrame); f.Name = name .. "Page"; f.BackgroundTransparency = 1; f.ScrollBarThickness = 2; f.ZIndex = 20; f.Visible = false; f.CanvasSize = UDim2.new(0, 0, 0, 0); f.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Pages[name] = f; return f
end
local PageAA = createPage("AUTO ATTACK"); local PageMagic = createPage("MAGIC"); local PageRelic = createPage("RELIC"); local PageStaff = createPage("STAFF"); local PageTravel = createPage("TRAVELER"); local PageMisc = createPage("MISC")

local SelectorFrame = Instance.new("Frame", MainFrame); SelectorFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); SelectorFrame.Position = UDim2.new(1, 5, 0, 0); SelectorFrame.Size = UDim2.new(0, 150, 0, 300); SelectorFrame.Visible = false; SelectorFrame.ZIndex = 350; Instance.new("UICorner", SelectorFrame)
local SelectorScroll = Instance.new("ScrollingFrame", SelectorFrame); SelectorScroll.Size = UDim2.new(1, -10, 1, -10); SelectorScroll.Position = UDim2.new(0, 5, 0, 5); SelectorScroll.BackgroundTransparency = 1; SelectorScroll.ScrollBarThickness = 2; SelectorScroll.CanvasSize = UDim2.new(0, 0, 0, 0); SelectorScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y; SelectorScroll.ZIndex = 351; Instance.new("UIListLayout", SelectorScroll).Padding = UDim.new(0, 3)

local function refreshSelectorUI()
    for _, child in pairs(SelectorScroll:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    local tabData = selections[currentSelectorTab]
    local list = (currentSelectorTab == "RELIC") and relicItems or (currentSelectorTab == "STAFF") and staffItems or (currentSelectorTab == "MAGIC") and magicItems or {}
    local shopUI = (currentSelectorTab == "RELIC") and relicShopUI or (currentSelectorTab == "STAFF") and staffShopUI or magicShopUI
    for _, itemName in pairs(list) do
        local b = Instance.new("TextButton", SelectorScroll); b.Size = UDim2.new(1, 0, 0, 25); b.Text = itemName; b.Font = Enum.Font.Gotham; b.TextSize = 8; b.ZIndex = 360; b.Active = true; Instance.new("UICorner", b)
        local isSelected = table.find(tabData.buy, itemName); b.BackgroundColor3 = isSelected and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(35, 35, 35)
        local itemF = shopUI:FindFirstChild(itemName); b.TextColor3 = getItemColor(itemF)
        b.MouseButton1Click:Connect(function()
            if currentSelectorTab == "MAGIC" then table.clear(tabData.buy); table.insert(tabData.buy, itemName) else local index = table.find(tabData.buy, itemName); if index then table.remove(tabData.buy, index) else table.insert(tabData.buy, itemName) end end
            refreshSelectorUI()
        end)
    end
end

local function showPage(name)
    currentPageName = name; for k, v in pairs(Pages) do v.Visible = (k == name) end
    for bName, btn in pairs(SideButtons) do btn.BackgroundColor3 = (bName == name) and Color3.fromRGB(80, 80, 80) or Color3.fromRGB(40, 40, 40) end
    AAControls.Visible = (name == "AUTO ATTACK"); InfoFrame.Visible = (name == "AUTO ATTACK")
    SelectorFrame.Visible = false
    if name == "AUTO ATTACK" then Pages[name].Size, Pages[name].Position = UDim2.new(1, -10, 0, 170), UDim2.new(0, 5, 0, 140)
    else Pages[name].Size, Pages[name].Position = UDim2.new(1, -10, 1, -50), UDim2.new(0, 5, 0, 40) end
end

-- [[ SHOP BUILDERS ]]
local shopLabels = { ["RELIC"] = {}, ["STAFF"] = {}, ["MAGIC"] = {} }
local function setupShopPage(page, tabName, items)
    local mainL = Instance.new("Frame", page); mainL.Size = UDim2.new(1,0,1,0); mainL.BackgroundTransparency = 1; local mLayout = Instance.new("UIListLayout", mainL); mLayout.Padding = UDim.new(0, 10); mLayout.SortOrder = Enum.SortOrder.LayoutOrder; mainL.ZIndex = 30
    local header = Instance.new("TextLabel", mainL); header.Size = UDim2.new(1, 0, 0, 25); header.BackgroundTransparency = 1; header.Text = "~(restock)~ " .. tabName:lower(); header.TextColor3 = Color3.new(1,1,1); header.Font = Enum.Font.GothamBold; header.TextSize = 10; header.LayoutOrder = 1; header.ZIndex = 31
    local listF = Instance.new("Frame", mainL); listF.Size = UDim2.new(1, 0, 0, 0); listF.BackgroundTransparency = 1; listF.AutomaticSize = Enum.AutomaticSize.Y; listF.LayoutOrder = 2; listF.ZIndex = 31; Instance.new("UIListLayout", listF).Padding = UDim.new(0, 2)
    for _, itm in pairs(items) do
        local l = Instance.new("TextLabel", listF); l.Size = UDim2.new(1, 0, 0, 18); l.BackgroundTransparency = 1; l.Text = ""; l.Font = Enum.Font.Code; l.TextSize = 8; l.TextXAlignment = 0; l.Visible = false; l.ZIndex = 32; shopLabels[tabName][itm] = l
    end
    local function createRow(title, target, order)
        local f = Instance.new("Frame", mainL); f.Size = UDim2.new(1,0,0,50); f.BackgroundTransparency = 1; f.LayoutOrder = order; f.ZIndex = 31
        local lbl = Instance.new("TextLabel", f); lbl.Size = UDim2.new(1,0,0,15); lbl.Text = title; lbl.TextColor3 = Color3.new(1,1,1); lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 8; lbl.BackgroundTransparency = 1; lbl.TextXAlignment = 0; lbl.ZIndex = 32
        local btn = Instance.new("TextButton", f); btn.Position = UDim2.new(0,0,0,20); btn.Size = UDim2.new(0.6,0,0,22); btn.BackgroundColor3 = Color3.fromRGB(40,40,40); btn.Text = "SELECT ITEMS..."; btn.TextColor3 = Color3.fromRGB(0,255,255); btn.TextSize = 7; btn.ZIndex = 35; btn.Active = true; Instance.new("UICorner", btn)
        local swBg = Instance.new("TextButton", f); swBg.Position = UDim2.new(0.7,0,0.4,0); swBg.Size = UDim2.new(0,30,0,14); swBg.BackgroundColor3 = Color3.fromRGB(50,50,50); swBg.Text = ""; swBg.ZIndex = 35; swBg.Active = true; Instance.new("UICorner", swBg).CornerRadius = UDim.new(1,0)
        local swDot = Instance.new("Frame", swBg); swDot.Position = UDim2.new(0,2,0.5,-5); swDot.Size = UDim2.new(0,10,0,10); swDot.BackgroundColor3 = Color3.new(1,1,1); swDot.ZIndex = 36; Instance.new("UICorner", swDot).CornerRadius = UDim.new(1,0)
        btn.MouseButton1Click:Connect(function() currentSelectorTab = tabName; refreshSelectorUI(); SelectorFrame.Visible = not SelectorFrame.Visible end)
        swBg.MouseButton1Click:Connect(function() local key = (target == "buy" and "activeBuy" or "activeStop"); selections[tabName][key] = not selections[tabName][key]; local act = selections[tabName][key]; swBg.BackgroundColor3 = act and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(50, 50, 50); swDot:TweenPosition(act and UDim2.new(1,-12,0.5,-5) or UDim2.new(0,2,0.5,-5), "Out", "Quad", 0.15, true) end)
    end
    createRow("AUTO BUY MODE", "buy", 3); createRow("AUTO STOP AFTER BUY", "stop", 4)
end

-- [[ TRAVELER PAGE (CLEANED) ]]
local function setupTravelerPage()
    local mainL = Instance.new("Frame", PageTravel)
    mainL.Size = UDim2.new(1,0,1,0)
    mainL.BackgroundTransparency = 1
    
    local comingSoon = Instance.new("TextLabel", mainL)
    comingSoon.Size = UDim2.new(1, 0, 1, 0)
    comingSoon.BackgroundTransparency = 1
    comingSoon.Text = "~(coming soon)~"
    comingSoon.TextColor3 = Color3.fromRGB(200, 200, 200)
    comingSoon.Font = Enum.Font.GothamBold
    comingSoon.TextSize = 14
    comingSoon.ZIndex = 31
end

local function setupMiscPage()
    local mainL = Instance.new("Frame", PageMisc); mainL.Size = UDim2.new(1,0,1,0); mainL.BackgroundTransparency = 1; Instance.new("UIListLayout", mainL).Padding = UDim.new(0, 10); mainL.ZIndex = 30
    local function createMiscSlider(title, min, max, startVal, callback)
        local frame = Instance.new("Frame", mainL); frame.Size = UDim2.new(1, 0, 0, 45); frame.BackgroundTransparency = 1; frame.ZIndex = 31
        local lbl = Instance.new("TextLabel", frame); lbl.Size = UDim2.new(0.6, 0, 0, 15); lbl.Text = title; lbl.TextColor3 = Color3.new(1,1,1); lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 9; lbl.BackgroundTransparency = 1; lbl.TextXAlignment = 0; lbl.ZIndex = 32
        local inp = Instance.new("TextBox", frame); inp.Size = UDim2.new(0.3, 0, 0, 18); inp.Position = UDim2.new(0.65, 0, 0, 0); inp.Text = tostring(startVal); inp.BackgroundColor3 = Color3.fromRGB(30, 30, 30); inp.TextColor3 = Color3.new(1,1,1); inp.Font = Enum.Font.GothamBold; inp.TextSize = 9; Instance.new("UICorner", inp); inp.ZIndex = 32
        local back = Instance.new("Frame", frame); back.Size = UDim2.new(0.9, 0, 0, 4); back.Position = UDim2.new(0, 5, 0, 30); back.BackgroundColor3 = Color3.fromRGB(45, 45, 45); Instance.new("UICorner", back); back.ZIndex = 32
        local fill = Instance.new("Frame", back); fill.Size = UDim2.new((startVal-min)/(max-min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(0, 130, 200); Instance.new("UICorner", fill); fill.ZIndex = 33
        local handle = Instance.new("TextButton", back); handle.Size = UDim2.new(0, 16, 0, 16); handle.Position = UDim2.new((startVal-min)/(max-min), -8, 0.5, -8); handle.BackgroundColor3 = Color3.new(1,1,1); handle.Text = ""; Instance.new("UICorner", handle).CornerRadius = UDim.new(1, 0); handle.ZIndex = 200; handle.Active = true
        local drag = false
        handle.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = true end end)
        game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = false end end)
        game:GetService("UserInputService").InputChanged:Connect(function(i) if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then 
            local p = math.clamp((i.Position.X - back.AbsolutePosition.X) / back.AbsoluteSize.X, 0, 1); fill.Size = UDim2.new(p, 0, 1, 0); handle.Position = UDim2.new(p, -8, 0.5, -8); local v = math.floor(min + (max-min)*p); inp.Text = tostring(v); callback(v) end end)
    end
    createMiscSlider("WalkSpeed", 16, 200, 16, function(v) if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = v end end)
    createMiscSlider("JumpPower", 50, 500, 50, function(v) if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.UseJumpPower = true; player.Character.Humanoid.JumpPower = v end end)
    local function createMiscSwitch(title, callback)
        local swF = Instance.new("Frame", mainL); swF.Size = UDim2.new(1,0,0,30); swF.BackgroundTransparency = 1; swF.ZIndex = 31
        local swBg = Instance.new("TextButton", swF); swBg.Position = UDim2.new(0.75,0,0.2,0); swBg.Size = UDim2.new(0,32,0,16); swBg.BackgroundColor3 = Color3.fromRGB(50,50,50); swBg.Text = ""; Instance.new("UICorner", swBg).CornerRadius = UDim.new(1,0); swBg.ZIndex = 35; swBg.Active = true
        local swDot = Instance.new("Frame", swBg); swDot.Position = UDim2.new(0,2,0.5,-6); swDot.Size = UDim2.new(0,12,0,12); swDot.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", swDot).CornerRadius = UDim.new(1,0); swDot.ZIndex = 36
        local swT = Instance.new("TextLabel", swF); swT.Size = UDim2.new(0.7,0,1,0); swT.Text = title; swT.TextColor3 = Color3.new(1,1,1); swT.Font = Enum.Font.GothamBold; swT.TextSize = 9; swT.BackgroundTransparency = 1; swT.TextXAlignment = 0
        local act = false; swBg.MouseButton1Click:Connect(function() act = not act; swBg.BackgroundColor3 = act and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(50, 50, 50); swDot:TweenPosition(act and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6), "Out", "Quad", 0.15, true); callback(act) end)
    end
    createMiscSwitch("INFINITE JUMP", function(v) infJumpEnabled = v end)
    createMiscSwitch("POTION AUTO CLICK", function(v) autoPotionClick = v end)
end

game:GetService("UserInputService").JumpRequest:Connect(function() if infJumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid:ChangeState("Jumping") end end)

setupShopPage(PageRelic, "RELIC", relicItems); setupShopPage(PageStaff, "STAFF", staffItems); setupShopPage(PageMagic, "MAGIC", magicItems); setupTravelerPage(); setupMiscPage()

-- [[ SIDE MENU ]]
local SideFrame = Instance.new("Frame", MainFrame); SideFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); SideFrame.Position = UDim2.new(0, -135, 0, 0); SideFrame.Size = UDim2.new(0, 130, 0, 310); SideFrame.Visible = false; SideFrame.ZIndex = 400; Instance.new("UICorner", SideFrame)
local SideScroll = Instance.new("ScrollingFrame", SideFrame); SideScroll.Size = UDim2.new(1, -10, 1, -10); SideScroll.Position = UDim2.new(0, 5, 0, 5); SideScroll.BackgroundTransparency = 1; SideScroll.ScrollBarThickness = 0; SideScroll.CanvasSize = UDim2.new(0, 0, 2.2, 0); SideScroll.ZIndex = 401; Instance.new("UIListLayout", SideScroll).Padding = UDim.new(0, 5)
local function createSideBtn(name)
    local btn = Instance.new("TextButton", SideScroll); btn.Size = UDim2.new(1, 0, 0, 32); btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); btn.Text = name; btn.TextColor3 = Color3.fromRGB(200, 200, 200); btn.Font = Enum.Font.GothamBold; btn.TextSize = 8; btn.ZIndex = 410; btn.Active = true; Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function() showPage(name) end); SideButtons[name] = btn
end
createSideBtn("AUTO ATTACK"); createSideBtn("MAGIC"); createSideBtn("RELIC"); createSideBtn("STAFF"); createSideBtn("TRAVELER"); createSideBtn("MISC")

local function createSliderMain(parent, title, min, max, startVal, yPos, callback)
    local frame = Instance.new("Frame", parent); frame.BackgroundTransparency = 1; frame.Size = UDim2.new(1, 0, 0, 40); frame.Position = UDim2.new(0, 0, 0, yPos); frame.ZIndex = 25
    local label = Instance.new("TextLabel", frame); label.Text = title; label.Size = UDim2.new(0.6, 0, 0, 15); label.TextColor3 = Color3.fromRGB(200, 200, 200); label.BackgroundTransparency = 1; label.Font = Enum.Font.Gotham; label.TextSize = 8; label.TextXAlignment = 0; label.ZIndex = 26
    local input = Instance.new("TextBox", frame); input.Text = tostring(startVal); input.Size = UDim2.new(0.3, 0, 0, 16); input.Position = UDim2.new(0.65, 0, 0, 0); input.BackgroundColor3 = Color3.fromRGB(30, 30, 30); input.TextColor3 = Color3.new(1,1,1); input.Font = Enum.Font.GothamBold; input.TextSize = 9; input.ZIndex = 26; Instance.new("UICorner", input)
    local back = Instance.new("Frame", frame); back.BackgroundColor3 = Color3.fromRGB(45, 45, 45); back.Position = UDim2.new(0, 5, 0, 22); back.Size = UDim2.new(0.9, 0, 0, 3); back.ZIndex = 26; Instance.new("UICorner", back)
    local fill = Instance.new("Frame", back); fill.BackgroundColor3 = Color3.fromRGB(0, 130, 200); fill.Size = UDim2.new((startVal-min)/(max-min), 0, 1, 0); fill.ZIndex = 26; Instance.new("UICorner", fill)
    local handle = Instance.new("TextButton", back); handle.Size = UDim2.new(0, 12, 0, 12); handle.Position = UDim2.new((startVal-min)/(max-min), -6, 0.5, -6); handle.BackgroundColor3 = Color3.new(1,1,1); handle.Text = ""; handle.ZIndex = 200; handle.Active = true; Instance.new("UICorner", handle).CornerRadius = UDim.new(1, 0)
    local drag = false
    handle.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = true end end)
    game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = false end end)
    game:GetService("UserInputService").InputChanged:Connect(function(i) if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local p = math.clamp((i.Position.X - back.AbsolutePosition.X) / back.AbsoluteSize.X, 0, 1); fill.Size = UDim2.new(p, 0, 1, 0); handle.Position = UDim2.new(p, -6, 0.5, -6); local val = math.floor((min + (max-min)*p)*100)/100; input.Text = tostring(val); callback(val) end end)
end
createSliderMain(PageAA, "Orbit Range", 1, 50, 23, 0, function(v) orbitRange = v end); createSliderMain(PageAA, "Orbit Speed", 0, 200, 20, 40, function(v) orbitSpeed = v end); createSliderMain(PageAA, "Attack Interval", 0, 10, 1.3, 80, function(v) attackInterval = v end); createSliderMain(PageAA, "TP Delay", 0, 10, 0.1, 120, function(v) teleportTime = v end); createSliderMain(PageAA, "Delay After Full", 0, 20, 2, 160, function(v) restDelay = v end); createSliderMain(PageAA, "Delay Before Rest", 0, 10, 2, 200, function(v) beforeRestDelay = v end)

task.spawn(function()
    while task.wait(1) do
        local cfg = { {relicShopUI, "RELIC", relicItems}, {staffShopUI, "STAFF", staffItems}, {magicShopUI, "MAGIC", magicItems} }
        for _, s in pairs(cfg) do for _, itm in pairs(s[3]) do pcall(function() local ui = s[1]:FindFirstChild(itm); local l = shopLabels[s[2]][itm]
            if ui and l then if ui:FindFirstChild("Stock") and ui.Stock.Text:find("X0") then l.Visible = false else l.Visible = true; l.Text = string.format("%-18s -------- %s %s", itm, ui.Stock.Text, ui.Price.Text); l.TextColor3 = getItemColor(ui) end end end) end end
    end
end)

game:GetService("RunService").Heartbeat:Connect(function(dt)
    local s, hasU = getStackCount(); ManaDisplay.Text = "WHITE STACKS: " .. s
    if enabled and not isJoining then local pV = PlayerGui:FindFirstChild("Main") and PlayerGui.Main.HUDButtons.Buttons.Portal.Visible; if pV then task.spawn(runJoinSequence) end end
    if autoRestEnabled and hasU then if s == 0 then if zeroStackTick == 0 then zeroStackTick = tick() end; if tick() - zeroStackTick >= (beforeRestDelay or 2) then isResting = true end; lastRestFull = 0 elseif s >= 3 then if lastRestFull == 0 then lastRestFull = tick() end; if tick() - lastRestFull >= (restDelay or 2) then isResting = false end; zeroStackTick = 0 else zeroStackTick = 0 end else isResting = false end
    if not enabled then DebugLabel.Text = "Status: STOPPED"; return end
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if isResting and root then root.CFrame = CFrame.new(Vector3.new(-186, 170, -96)) return end
    local enemies = workspace:FindFirstChild("World") and workspace.World:FindFirstChild("RenderedEnemies")
    local valid = {}
    if enemies then for _, n in pairs(enemies:GetChildren()) do if n:FindFirstChild("Humanoid") and n.Humanoid.Health > 0 and n:FindFirstChild("HumanoidRootPart") then table.insert(valid, n) end end end
    if #valid > 0 then if currentMode == "1 Per 1" then if not currentTarget or not currentTarget.Parent or currentTarget.Humanoid.Health <= 0 then if tick() - lastTargetSwitch >= (teleportTime or 0.1) then local d = math.huge; for _, n in pairs(valid) do local dist = (root.Position - n.HumanoidRootPart.Position).Magnitude; if dist < d then d = dist; currentTarget = n end end lastTargetSwitch = tick() end end else if tick() - lastTargetSwitch >= (teleportTime or 0.1) then allIndex = (allIndex % #valid) + 1; currentTarget = valid[allIndex]; lastTargetSwitch = tick() end end else currentTarget = nil end
    if currentTarget and currentTarget:FindFirstChild("HumanoidRootPart") and root then
        local tRoot = currentTarget.HumanoidRootPart; angle = angle + (dt * (orbitSpeed or 20)); local x = math.cos(angle) * (orbitRange or 23); local z = math.sin(angle) * (orbitRange or 23); root.CFrame = CFrame.lookAt(tRoot.Position + Vector3.new(x, 4, z), tRoot.Position)
        if tick() - lastAttack >= (attackInterval or 1.3) then remote:FireServer("UseMove", {[1] = tRoot.CFrame * CFrame.Angles(-3.14, -1.09, -3.14)}, tick()); lastAttack = tick() end
        DebugLabel.Text = "Status: FARMING ✅"
    else DebugLabel.Text = "Status: WAITING... 🔍" end
end)

JoinModeBtn.MouseButton1Click:Connect(function() Pilihan_Mode = (Pilihan_Mode == "Siege") and "Raid" or "Siege"; JoinModeBtn.Text = Pilihan_Mode:upper() end)
JoinDiffBtn.MouseButton1Click:Connect(function() Pilihan_Diff = (Pilihan_Diff == "Hard") and "Normal" or "Hard"; JoinDiffBtn.Text = Pilihan_Diff:upper() end)
ToggleBtn.MouseButton1Click:Connect(function() enabled = not enabled; ToggleBtn.Text = enabled and "STOP" or "START"; ToggleBtn.BackgroundColor3 = enabled and Color3.fromRGB(130, 30, 30) or Color3.fromRGB(0, 130, 70); if enabled then task.spawn(runJoinSequence) end end)
ModeBtn.MouseButton1Click:Connect(function()
    if currentMode == "1 Per 1" then
        currentMode = "ALL"
        ModeBtn.Text = "ALL"
    else
        currentMode = "1 Per 1"
        ModeBtn.Text = "1 Per 1"
    end
end)
AutoRestBtn.MouseButton1Click:Connect(function() autoRestEnabled = not autoRestEnabled; AutoRestBtn.Text = autoRestEnabled and "AUTO REST: ON" or "AUTO REST: OFF"; AutoRestBtn.BackgroundColor3 = autoRestEnabled and Color3.fromRGB(0, 80, 80) or Color3.fromRGB(60, 60, 60) end)
OpenSideBtn.MouseButton1Click:Connect(function() sideMenuOpen = not sideMenuOpen; SideFrame.Visible = sideMenuOpen; OpenSideBtn.Text = sideMenuOpen and "<" or ">" end)
MinBtn.MouseButton1Click:Connect(function() minimized = not minimized; MainFrame.Size = minimized and UDim2.new(0, 240, 0, 30) or UDim2.new(0, 240, 0, 360); MinBtn.Text = minimized and "+" or "-"; local v = not minimized; OpenSideBtn.Visible = v; if minimized then AAControls.Visible, SideFrame.Visible, InfoFrame.Visible = false, false, false; for _, p in pairs(Pages) do p.Visible = false end else showPage(currentPageName); SideFrame.Visible = sideMenuOpen end end)
local UIS = game:GetService("UserInputService"); local dS, sP, dG; TitleBar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dG = true; dS = i.Position; sP = MainFrame.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dG = false end end) end end); UIS.InputChanged:Connect(function(i) if dG and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - dS; MainFrame.Position = UDim2.new(sP.X.Scale, sP.X.Offset + d.X, sP.Y.Scale, sP.Y.Offset + d.Y) end end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy(); enabled = false end)

-- [[ AUTO LEAVE ON DEATH ]]
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local deathGui = PlayerGui:FindFirstChild("Game") and PlayerGui.Game:FindFirstChild("DeathScreen")
            if deathGui and deathGui.Visible then
                local leaveBtn = deathGui:FindFirstChild("Leave", true)
                if leaveBtn then InternalClick(leaveBtn) end
            end
        end)
    end
end)

showPage("AUTO ATTACK")