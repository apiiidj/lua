-- ================================================
--   HEXAGUI v6  |  Horizontal Retro Edition + Lite
--   Compatible with: Synapse X, KRNL, Fluxus, etc.
-- ================================================

local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local LocalPlayer      = Players.LocalPlayer

-- ════════════════════════════════════════════════
--   THEMES
-- ════════════════════════════════════════════════

local C = { -- Full version (red)
    Title        = "[ HEXAGUI v6 ]",
    Accent       = Color3.fromRGB(220, 30, 30),
    AccentDim    = Color3.fromRGB(110, 10, 10),
    BG           = Color3.fromRGB(10, 0, 0),
    Surface      = Color3.fromRGB(22, 5, 5),
    SurfaceHi    = Color3.fromRGB(38, 10, 10),
    Text         = Color3.fromRGB(255, 200, 200),
    SubText      = Color3.fromRGB(150, 80, 80),
    ToggleOn     = Color3.fromRGB(220, 30, 30),
    ToggleOff    = Color3.fromRGB(50, 10, 10),
    Valid_Key    = "ARCH_81ayU19g410plM",
    Keybind      = Enum.KeyCode.RightShift,
}

local CLite = { -- Lite version (light blue)
    Title        = "[ HEXAGUI LITE ]",
    Accent       = Color3.fromRGB(120, 200, 255),
    AccentDim    = Color3.fromRGB(50, 90, 120),
    BG           = Color3.fromRGB(4, 10, 14),
    Surface      = Color3.fromRGB(14, 26, 34),
    SurfaceHi    = Color3.fromRGB(22, 42, 54),
    Text         = Color3.fromRGB(215, 240, 255),
    SubText      = Color3.fromRGB(110, 160, 185),
    ToggleOn     = Color3.fromRGB(120, 200, 255),
    ToggleOff    = Color3.fromRGB(30, 55, 70),
    Keybind      = Enum.KeyCode.RightShift,
}

local PW      = 0.94
local PH      = 270
local TITLEH  = 44
local TABH    = 38
local CONTOFF = TITLEH + TABH + 2

-- ════════════════════════════════════════════════
--   HELPERS (generic, theme passed in per call)
-- ════════════════════════════════════════════════

local function tw(obj, props, t)
    TweenService:Create(obj, TweenInfo.new(t or 0.12, Enum.EasingStyle.Quad), props):Play()
end

local function stroke(parent, color, thick)
    local s = Instance.new("UIStroke", parent)
    s.Color        = color
    s.Thickness    = thick or 1
    s.LineJoinMode = Enum.LineJoinMode.Miter
    return s
end

local function lbl(parent, props)
    local l = Instance.new("TextLabel", parent)
    l.BackgroundTransparency = 1
    l.Font        = Enum.Font.Code
    l.TextWrapped = true
    for k, v in pairs(props) do l[k] = v end
    return l
end

-- ════════════════════════════════════════════════
--   HUB BUILDER  (builds one full hub: title bar,
--   tabs, content — used for both Full and Lite)
--
--   theme: color table (C or CLite)
--   opts: {
--     Title      = string,
--     Noclip     = bool  -- include Noclip toggle
--     Addons     = bool  -- include ADD-ONS tab (player targeter)
--   }
-- ════════════════════════════════════════════════

local function BuildHub(theme, opts)
    local Gui = Instance.new("ScreenGui")
    Gui.Name           = opts.Title:gsub("[%[%]%s]", "") .. "_Gui"
    Gui.ResetOnSpawn   = false
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Gui.IgnoreGuiInset = true
    Gui.Parent         = (gethui and gethui()) or game:GetService("CoreGui")

    local Win = Instance.new("Frame", Gui)
    Win.Name             = "Win"
    Win.Size             = UDim2.new(PW, 0, 0, PH)
    Win.Position         = UDim2.new((1-PW)/2, 0, 0.5, -PH/2)
    Win.BackgroundColor3 = theme.BG
    Win.BorderSizePixel  = 0
    Win.ClipsDescendants = true
    Win.Visible          = false
    stroke(Win, theme.Accent, 2)

    local TBar = Instance.new("Frame", Win)
    TBar.Size             = UDim2.new(1, 0, 0, TITLEH)
    TBar.BackgroundColor3 = theme.Surface
    TBar.BorderSizePixel  = 0
    TBar.ZIndex           = 3

    local TBotLine = Instance.new("Frame", TBar)
    TBotLine.Size             = UDim2.new(1, 0, 0, 2)
    TBotLine.Position         = UDim2.new(0, 0, 1, -2)
    TBotLine.BackgroundColor3 = theme.Accent
    TBotLine.BorderSizePixel  = 0

    local TitleLbl = lbl(TBar, {
        Size           = UDim2.new(1, -110, 1, 0),
        Position       = UDim2.new(0, 14, 0, 0),
        TextSize       = 15,
        TextColor3     = theme.Accent,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text           = opts.Title,
        ZIndex         = 4,
    })

    local blink = true
    task.spawn(function()
        while Win.Parent do
            task.wait(0.55)
            TitleLbl.Text = blink and opts.Title .. " _" or opts.Title
            blink = not blink
        end
    end)

    local function makeWinBtn(xOff, bg, txt)
        local b = Instance.new("TextButton", TBar)
        b.Size             = UDim2.new(0, 46, 0, 32)
        b.Position         = UDim2.new(1, xOff, 0.5, -16)
        b.BackgroundColor3 = bg
        b.Font             = Enum.Font.Code
        b.TextSize         = 13
        b.TextColor3       = Color3.fromRGB(255, 255, 255)
        b.Text             = txt
        b.BorderSizePixel  = 0
        b.ZIndex           = 4
        b.AutoButtonColor  = false
        stroke(b, theme.Accent, 1)
        return b
    end

    local CloseBtn = makeWinBtn(-50,  Color3.fromRGB(160, 20, 20), "[X]")
    local MinBtn   = makeWinBtn(-100, Color3.fromRGB(140, 90, 10), "[-]")

    CloseBtn.MouseButton1Click:Connect(function()
        tw(Win, { Position = UDim2.new((1-PW)/2, 0, 1.5, 0) }, 0.25)
        task.delay(0.3, function() Win.Visible = false end)
    end)

    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        tw(Win, { Size = minimized
            and UDim2.new(PW, 0, 0, TITLEH)
            or  UDim2.new(PW, 0, 0, PH) }, 0.2)
        MinBtn.Text = minimized and "[+]" or "[-]"
    end)

    local drag, dStart, dOrigin = false, nil, nil
    TBar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then
            drag=true; dStart=i.Position; dOrigin=Win.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement
                  or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - dStart
            Win.Position = UDim2.new(
                dOrigin.X.Scale, dOrigin.X.Offset + d.X,
                dOrigin.Y.Scale, dOrigin.Y.Offset + d.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then drag = false end
    end)

    local TabBar = Instance.new("ScrollingFrame", Win)
    TabBar.Size                = UDim2.new(1, 0, 0, TABH)
    TabBar.Position            = UDim2.new(0, 0, 0, TITLEH)
    TabBar.BackgroundColor3    = theme.Surface
    TabBar.BorderSizePixel     = 0
    TabBar.ScrollBarThickness  = 0
    TabBar.CanvasSize          = UDim2.new(0, 0, 0, 0)
    TabBar.AutomaticCanvasSize = Enum.AutomaticSize.X
    TabBar.ScrollingDirection  = Enum.ScrollingDirection.X
    TabBar.ZIndex              = 3

    local TabRowLayout = Instance.new("UIListLayout", TabBar)
    TabRowLayout.FillDirection = Enum.FillDirection.Horizontal
    TabRowLayout.SortOrder     = Enum.SortOrder.LayoutOrder
    TabRowLayout.Padding       = UDim.new(0, 0)

    local TabSep = Instance.new("Frame", Win)
    TabSep.Size             = UDim2.new(1, 0, 0, 2)
    TabSep.Position         = UDim2.new(0, 0, 0, TITLEH + TABH)
    TabSep.BackgroundColor3 = theme.AccentDim
    TabSep.BorderSizePixel  = 0

    local ContentArea = Instance.new("Frame", Win)
    ContentArea.Size             = UDim2.new(1, 0, 1, -CONTOFF)
    ContentArea.Position         = UDim2.new(0, 0, 0, CONTOFF)
    ContentArea.BackgroundTransparency = 1
    ContentArea.ClipsDescendants = true

    local Tabs, ActiveTab = {}, nil

    local function newHScroll(parent)
        local s = Instance.new("ScrollingFrame", parent)
        s.Size                 = UDim2.new(1, 0, 1, 0)
        s.BackgroundTransparency = 1
        s.BorderSizePixel      = 0
        s.ScrollBarThickness   = 4
        s.ScrollBarImageColor3 = theme.AccentDim
        s.CanvasSize           = UDim2.new(0, 0, 0, 0)
        s.AutomaticCanvasSize  = Enum.AutomaticSize.X
        s.ScrollingDirection   = Enum.ScrollingDirection.X
        local ll = Instance.new("UIListLayout", s)
        ll.FillDirection     = Enum.FillDirection.Horizontal
        ll.Padding           = UDim.new(0, 6)
        ll.SortOrder         = Enum.SortOrder.LayoutOrder
        ll.VerticalAlignment = Enum.VerticalAlignment.Center
        local p = Instance.new("UIPadding", s)
        p.PaddingLeft   = UDim.new(0, 10)
        p.PaddingRight  = UDim.new(0, 10)
        p.PaddingTop    = UDim.new(0, 8)
        p.PaddingBottom = UDim.new(0, 8)
        return s
    end

    local function selectTab(tab)
        if ActiveTab == tab then return end
        if ActiveTab then
            ActiveTab.Btn.BackgroundColor3 = theme.Surface
            ActiveTab.Btn.TextColor3       = theme.SubText
            local ln = ActiveTab.Btn:FindFirstChild("AL")
            if ln then ln:Destroy() end
            ActiveTab.Page.Visible = false
        end
        ActiveTab = tab
        tab.Btn.BackgroundColor3 = theme.SurfaceHi
        tab.Btn.TextColor3       = theme.Accent
        local ln = Instance.new("Frame", tab.Btn)
        ln.Name             = "AL"
        ln.Size             = UDim2.new(1, 0, 0, 3)
        ln.Position         = UDim2.new(0, 0, 1, -3)
        ln.BackgroundColor3 = theme.Accent
        ln.BorderSizePixel  = 0
        tab.Page.Visible    = true
    end

    local function addTab(name)
        local btn = Instance.new("TextButton", TabBar)
        btn.Size             = UDim2.new(0, 110, 1, 0)
        btn.BackgroundColor3 = theme.Surface
        btn.Font             = Enum.Font.Code
        btn.TextSize         = 13
        btn.TextColor3       = theme.SubText
        btn.Text             = name:upper()
        btn.BorderSizePixel  = 0
        btn.LayoutOrder      = #Tabs + 1
        btn.ZIndex           = 3
        btn.AutoButtonColor  = false
        local page = newHScroll(ContentArea)
        page.Visible = false
        local t = { Btn = btn, Page = page, Els = {} }
        table.insert(Tabs, t)
        btn.MouseButton1Click:Connect(function() selectTab(t) end)
        if #Tabs == 1 then selectTab(t) end
        return t
    end

    local function addSection(tab, txt)
        local f = Instance.new("Frame", tab.Page)
        f.Size                   = UDim2.new(0, 14, 1, -20)
        f.BackgroundTransparency = 1
        f.LayoutOrder            = #tab.Els + 1
        local div = Instance.new("Frame", f)
        div.Size             = UDim2.new(0, 2, 1, 0)
        div.Position         = UDim2.new(0.5, -1, 0, 0)
        div.BackgroundColor3 = theme.AccentDim
        div.BorderSizePixel  = 0
        lbl(f, {
            Size      = UDim2.new(0, 90, 0, 14),
            Position  = UDim2.new(0.5, -45, 0, -16),
            TextSize  = 9,
            TextColor3 = theme.AccentDim,
            Text      = txt:upper()
        })
        table.insert(tab.Els, f)
    end

    local function addButton(tab, txt, cb)
        local btn = Instance.new("TextButton", tab.Page)
        btn.Size             = UDim2.new(0, 148, 1, -20)
        btn.BackgroundColor3 = theme.Surface
        btn.Font             = Enum.Font.Code
        btn.TextSize         = 13
        btn.TextColor3       = theme.Text
        btn.Text             = txt
        btn.BorderSizePixel  = 0
        btn.LayoutOrder      = #tab.Els + 1
        btn.AutoButtonColor  = false
        btn.TextWrapped      = true
        stroke(btn, theme.AccentDim, 1)
        btn.MouseButton1Click:Connect(function()
            tw(btn, { BackgroundColor3 = theme.AccentDim }, 0.08)
            task.delay(0.2, function() tw(btn, { BackgroundColor3 = theme.Surface }, 0.15) end)
            if cb then task.spawn(cb) end
        end)
        table.insert(tab.Els, btn)
        return btn
    end

    local function addToggle(tab, txt, default, cb)
        local state = default or false
        local col = Instance.new("Frame", tab.Page)
        col.Size             = UDim2.new(0, 148, 1, -20)
        col.BackgroundColor3 = theme.Surface
        col.BorderSizePixel  = 0
        col.LayoutOrder      = #tab.Els + 1
        stroke(col, theme.AccentDim, 1)
        lbl(col, {
            Size           = UDim2.new(1, -8, 0.55, 0),
            Position       = UDim2.new(0, 8, 0, 0),
            TextSize       = 13,
            TextColor3     = theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            Text           = txt
        })
        local box = Instance.new("Frame", col)
        box.Size             = UDim2.new(1, -16, 0, 26)
        box.Position         = UDim2.new(0, 8, 1, -34)
        box.BackgroundColor3 = state and theme.ToggleOn or theme.ToggleOff
        box.BorderSizePixel  = 0
        stroke(box, theme.Accent, 1)
        local boxTxt = lbl(box, {
            Size       = UDim2.new(1, 0, 1, 0),
            TextSize   = 12,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text       = state and "ON" or "OFF"
        })
        local hit = Instance.new("TextButton", col)
        hit.Size                   = UDim2.new(1, 0, 1, 0)
        hit.BackgroundTransparency = 1
        hit.Text                   = ""
        hit.AutoButtonColor        = false
        hit.MouseButton1Click:Connect(function()
            state = not state
            tw(box, { BackgroundColor3 = state and theme.ToggleOn or theme.ToggleOff })
            boxTxt.Text = state and "ON" or "OFF"
            if cb then cb(state) end
        end)
        table.insert(tab.Els, col)
        return {
            Set = function(v)
                state = v
                tw(box, { BackgroundColor3 = v and theme.ToggleOn or theme.ToggleOff })
                boxTxt.Text = v and "ON" or "OFF"
                if cb then cb(v) end
            end
        }
    end

    UserInputService.InputBegan:Connect(function(i, gpe)
        if gpe then return end
        if i.KeyCode == theme.Keybind then
            if Win.Visible then
                tw(Win, { Position = UDim2.new((1-PW)/2, 0, 1.5, 0) }, 0.2)
                task.delay(0.25, function() Win.Visible = false end)
            else
                Win.Visible  = true
                Win.Position = UDim2.new((1-PW)/2, 0, 1.5, 0)
                tw(Win, { Position = UDim2.new((1-PW)/2, 0, 0.5, -PH/2) }, 0.25)
            end
        end
    end)

    -- ═══════════ TABS ═══════════

    local tPlayer = addTab("PLAYER")

    addButton(tPlayer, ">> NOCLIP FLY", function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/199791/scripts/Smooth%20Noclip%20Fly%20by%20AGBest.lua"))()
    end)
    addButton(tPlayer, ">> TP WALK", function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/198418/scripts/Tpwalk.lua"))()
    end)
    addButton(tPlayer, ">> CUSTOM ANIMS", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GAE-SIMPLIFIED-27193"))()
    end)
    addButton(tPlayer, ">> EMOTES", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
    end)
    addButton(tPlayer, ">> ANTIFLING", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Antifling-131275"))()
    end)
    addButton(tPlayer, ">> SILLY SADBOY", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Silly-Sadboy-15795"))()
    end)
    addButton(tPlayer, ">> GOD MODE", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Omniman-Script-NDS-134458"))()
    end)
    addButton(tPlayer, ">> PASTEBIN", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end)
    addButton(tPlayer, ">> INF YIELD", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    addButton(tPlayer, ">> TP TOOL", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Damanhhi/-/refs/heads/main/teleport%20bypass"))()
    end)

    addSection(tPlayer, "TOGGLES")

    local noclipConn
    if opts.Noclip then
        addToggle(tPlayer, "Noclip", false, function(on)
            if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
            if on then
                noclipConn = RunService.Stepped:Connect(function()
                    local char = LocalPlayer.Character
                    if not char then return end
                    for _, p in ipairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then p.CanCollide = false end
                    end
                end)
            else
                local char = LocalPlayer.Character
                if char then
                    for _, p in ipairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then p.CanCollide = true end
                    end
                end
            end
        end)
    end

    addToggle(tPlayer, "Speed Boost", false, function(on)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = on and 50 or 16
        end
    end)

    local jumpConn
    addToggle(tPlayer, "Infinite Jump", false, function(on)
        if jumpConn then jumpConn:Disconnect(); jumpConn = nil end
        if on then
            jumpConn = UserInputService.JumpRequest:Connect(function()
                local char = LocalPlayer.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum:GetState() ~= Enum.HumanoidStateType.Dead then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end)

    addButton(tPlayer, ">> RESET CHAR", function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = 0 end
        end
    end)

    -- VISUAL TAB
    local tVisual = addTab("VISUAL")

    addToggle(tVisual, "Fullbright", false, function(on)
        local L = game:GetService("Lighting")
        L.Brightness    = on and 5 or 1
        L.GlobalShadows = not on
    end)

    local espHighlights = {}
    local function removeESP()
        for _, h in pairs(espHighlights) do
            if type(h) ~= "boolean" then
                if typeof(h) == "RBXScriptConnection" then h:Disconnect()
                elseif h and h.Parent then h:Destroy() end
            end
        end
        espHighlights = {}
    end

    local function applyESP()
        removeESP()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local function highlightChar(char)
                    if not char then return end
                    local old = espHighlights[plr.UserId]
                    if old and typeof(old) ~= "RBXScriptConnection" and old.Parent then old:Destroy() end
                    local h = Instance.new("Highlight", char)
                    h.FillColor        = theme.Accent
                    h.OutlineColor     = theme.Text
                    h.FillTransparency = 0.5
                    h.DepthMode        = Enum.HighlightDepthMode.AlwaysOnTop
                    espHighlights[plr.UserId] = h
                end
                highlightChar(plr.Character)
                espHighlights[plr.UserId.."_conn"] = plr.CharacterAdded:Connect(function(char)
                    task.wait(0.1)
                    if espHighlights[plr.UserId.."_on"] then highlightChar(char) end
                end)
                espHighlights[plr.UserId.."_on"] = true
            end
        end
    end

    addToggle(tVisual, "ESP", false, function(on)
        if on then applyESP() else removeESP() end
    end)

    -- ADD-ONS TAB (player targeter — Full only)
    local tAddons
    if opts.Addons then
        tAddons = addTab("ADD-ONS")

        local tpWidget = Instance.new("Frame", tAddons.Page)
        tpWidget.Size             = UDim2.new(0, 220, 1, -20)
        tpWidget.BackgroundColor3 = theme.Surface
        tpWidget.BorderSizePixel  = 0
        tpWidget.LayoutOrder      = #tAddons.Els + 1
        stroke(tpWidget, theme.AccentDim, 1)

        lbl(tpWidget, {
            Size           = UDim2.new(1, -8, 0, 22),
            Position       = UDim2.new(0, 8, 0, 4),
            TextSize       = 11,
            TextColor3     = theme.Accent,
            TextXAlignment = Enum.TextXAlignment.Left,
            Text           = ">> TP TO PLAYER"
        })

        local tpInputBG = Instance.new("Frame", tpWidget)
        tpInputBG.Size             = UDim2.new(1, -16, 0, 32)
        tpInputBG.Position         = UDim2.new(0, 8, 0, 28)
        tpInputBG.BackgroundColor3 = theme.BG
        tpInputBG.BorderSizePixel  = 0
        stroke(tpInputBG, theme.AccentDim, 1)

        local tpInput = Instance.new("TextBox", tpInputBG)
        tpInput.Size                   = UDim2.new(1, -12, 1, 0)
        tpInput.Position               = UDim2.new(0, 6, 0, 0)
        tpInput.BackgroundTransparency = 1
        tpInput.Font                   = Enum.Font.Code
        tpInput.TextSize               = 13
        tpInput.TextColor3             = theme.Text
        tpInput.PlaceholderText        = "PLAYER NAME..."
        tpInput.PlaceholderColor3      = theme.SubText
        tpInput.TextXAlignment         = Enum.TextXAlignment.Left
        tpInput.ClearTextOnFocus       = false
        tpInput.Text                   = ""

        local tpBtn = Instance.new("TextButton", tpWidget)
        tpBtn.Size             = UDim2.new(1, -16, 0, 32)
        tpBtn.Position         = UDim2.new(0, 8, 0, 64)
        tpBtn.BackgroundColor3 = theme.Surface
        tpBtn.Font             = Enum.Font.Code
        tpBtn.TextSize         = 13
        tpBtn.TextColor3       = theme.Text
        tpBtn.Text             = "[ TELEPORT ]"
        tpBtn.BorderSizePixel  = 0
        tpBtn.AutoButtonColor  = false
        stroke(tpBtn, theme.Accent, 1)

        local tpStatus = lbl(tpWidget, {
            Size           = UDim2.new(1, -16, 0, 20),
            Position       = UDim2.new(0, 8, 0, 100),
            TextSize       = 11,
            TextColor3     = theme.SubText,
            TextXAlignment = Enum.TextXAlignment.Left,
            Text           = ""
        })

        tpBtn.MouseButton1Click:Connect(function()
            tw(tpBtn, { BackgroundColor3 = theme.AccentDim }, 0.08)
            task.delay(0.2, function() tw(tpBtn, { BackgroundColor3 = theme.Surface }, 0.15) end)
            local query = tpInput.Text:lower()
            if query == "" then
                tpStatus.TextColor3 = Color3.fromRGB(220, 80, 80)
                tpStatus.Text = ">> NO NAME ENTERED"
                return
            end
            local target
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr.Name:lower():find(query) or plr.DisplayName:lower():find(query) then
                    target = plr; break
                end
            end
            if not target then
                tpStatus.TextColor3 = Color3.fromRGB(220, 80, 80)
                tpStatus.Text = ">> PLAYER NOT FOUND"
                return
            end
            local myChar    = LocalPlayer.Character
            local theirChar = target.Character
            if not myChar or not theirChar then
                tpStatus.TextColor3 = Color3.fromRGB(220, 80, 80)
                tpStatus.Text = ">> CHARACTER NOT LOADED"
                return
            end
            local root = myChar:FindFirstChild("HumanoidRootPart")
            local dest = theirChar:FindFirstChild("HumanoidRootPart")
            if root and dest then
                root.CFrame = dest.CFrame + Vector3.new(0, 3, 0)
                tpStatus.TextColor3 = Color3.fromRGB(0, 220, 80)
                tpStatus.Text = ">> TELEPORTED TO " .. target.Name:upper()
            else
                tpStatus.TextColor3 = Color3.fromRGB(220, 80, 80)
                tpStatus.Text = ">> TP FAILED"
            end
        end)

        table.insert(tAddons.Els, tpWidget)
        addSection(tAddons, "SCRIPTS")
        addButton(tAddons, ">> CADUCUS FE", function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Caducus-Fe-script-49625"))()
        end)
    end

    -- CONFIG TAB
    local tConfig = addTab("CONFIG")
    addButton(tConfig, "TOGGLE: R.SHIFT", nil)
    addButton(tConfig, "DRAG: TITLE BAR", nil)
    addButton(tConfig, "MIN: [-] BUTTON", nil)
    addSection(tConfig, "SYSTEM")
    addButton(tConfig, ">> UNLOAD", function()
        removeESP()
        if noclipConn then noclipConn:Disconnect() end
        if jumpConn   then jumpConn:Disconnect()   end
        tw(Win, { Position = UDim2.new((1-PW)/2, 0, 1.5, 0) }, 0.3)
        task.delay(0.35, function() Gui:Destroy() end)
    end)

    return Win, Gui
end

-- ════════════════════════════════════════════════
--   KEY SYSTEM  (gateway: valid key -> Full hub,
--   or "HEXAGUI v1 Lite" button -> Lite hub, no key)
-- ════════════════════════════════════════════════

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name           = "HEXAGUI_KeyGate"
KeyGui.ResetOnSpawn   = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.IgnoreGuiInset = true
KeyGui.Parent         = (gethui and gethui()) or game:GetService("CoreGui")

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Name             = "KeyFrame"
KeyFrame.Size             = UDim2.new(PW, 0, 0, PH)
KeyFrame.Position         = UDim2.new((1-PW)/2, 0, 0.5, -PH/2)
KeyFrame.BackgroundColor3 = C.BG
KeyFrame.BorderSizePixel  = 0
KeyFrame.ClipsDescendants = true
stroke(KeyFrame, C.Accent, 2)

local KTBar = Instance.new("Frame", KeyFrame)
KTBar.Size             = UDim2.new(1, 0, 0, TITLEH)
KTBar.BackgroundColor3 = C.Surface
KTBar.BorderSizePixel  = 0

local KTLine = Instance.new("Frame", KTBar)
KTLine.Size             = UDim2.new(1, 0, 0, 2)
KTLine.Position         = UDim2.new(0, 0, 1, -2)
KTLine.BackgroundColor3 = C.Accent
KTLine.BorderSizePixel  = 0

lbl(KTBar, {
    Size       = UDim2.new(1, 0, 1, 0),
    TextSize   = 15,
    TextColor3 = C.Accent,
    Text       = "[ HEXAGUI v6 ]  //  KEY REQUIRED"
})

local KBody = Instance.new("Frame", KeyFrame)
KBody.Size                   = UDim2.new(1, 0, 1, -TITLEH)
KBody.Position               = UDim2.new(0, 0, 0, TITLEH)
KBody.BackgroundTransparency = 1

lbl(KBody, {
    Size           = UDim2.new(1, -40, 0, 24),
    Position       = UDim2.new(0, 20, 0, 8),
    TextSize       = 13,
    TextColor3     = C.SubText,
    TextXAlignment = Enum.TextXAlignment.Left,
    Text           = ">> GET KEY AT:  discord.gg/J4c7SPekA5"
})

local KInputBG = Instance.new("Frame", KBody)
KInputBG.Size             = UDim2.new(0.55, -30, 0, 40)
KInputBG.Position         = UDim2.new(0, 20, 0, 40)
KInputBG.BackgroundColor3 = C.Surface
KInputBG.BorderSizePixel  = 0
stroke(KInputBG, C.AccentDim, 1)

local KInput = Instance.new("TextBox", KInputBG)
KInput.Size                   = UDim2.new(1, -16, 1, 0)
KInput.Position               = UDim2.new(0, 8, 0, 0)
KInput.BackgroundTransparency = 1
KInput.Font                   = Enum.Font.Code
KInput.TextSize               = 14
KInput.TextColor3             = C.Text
KInput.PlaceholderText        = "ENTER KEY..."
KInput.PlaceholderColor3      = C.SubText
KInput.TextXAlignment         = Enum.TextXAlignment.Left
KInput.ClearTextOnFocus       = false
KInput.Text                   = ""

local KSubmit = Instance.new("TextButton", KBody)
KSubmit.Size             = UDim2.new(0, 130, 0, 40)
KSubmit.Position         = UDim2.new(0.55, -10, 0, 40)
KSubmit.BackgroundColor3 = C.Surface
KSubmit.Font             = Enum.Font.Code
KSubmit.TextSize         = 14
KSubmit.TextColor3       = C.Text
KSubmit.Text             = "[ SUBMIT ]"
KSubmit.BorderSizePixel  = 0
KSubmit.AutoButtonColor  = false
stroke(KSubmit, C.Accent, 1)

-- HEXAGUI v1 Lite button (keyless entry)
local KLiteBtn = Instance.new("TextButton", KBody)
KLiteBtn.Size             = UDim2.new(1, -40, 0, 34)
KLiteBtn.Position         = UDim2.new(0, 20, 0, 88)
KLiteBtn.BackgroundColor3 = C.Surface
KLiteBtn.Font             = Enum.Font.Code
KLiteBtn.TextSize         = 13
KLiteBtn.TextColor3       = CLite.Accent
KLiteBtn.Text             = "[ HEXAGUI v1 LITE ]"
KLiteBtn.BorderSizePixel  = 0
KLiteBtn.AutoButtonColor  = false
stroke(KLiteBtn, CLite.Accent, 1)

local KStatus = lbl(KBody, {
    Size           = UDim2.new(1, -40, 0, 24),
    Position       = UDim2.new(0, 20, 0, 128),
    TextSize       = 12,
    TextColor3     = C.SubText,
    TextXAlignment = Enum.TextXAlignment.Left,
    Text           = ""
})

local function collapseKeyGate(onDone)
    tw(KeyFrame, { Position = UDim2.new((1-PW)/2, 0, -1.5, 0) }, 0.3)
    task.delay(0.35, function()
        KeyGui:Destroy()
        if onDone then onDone() end
    end)
end

KSubmit.MouseButton1Click:Connect(function()
    if KInput.Text == C.Valid_Key then
        KStatus.TextColor3 = Color3.fromRGB(0, 220, 80)
        KStatus.Text       = ">> ACCESS GRANTED. LOADING..."
        tw(KSubmit, { BackgroundColor3 = Color3.fromRGB(0, 100, 30) }, 0.1)
        task.wait(0.9)
        collapseKeyGate(function()
            local Win = BuildHub(C, { Title = C.Title, Noclip = true, Addons = true })
            Win.Visible = true
            Win.Position = UDim2.new((1-PW)/2, 0, 1.5, 0)
            tw(Win, { Position = UDim2.new((1-PW)/2, 0, 0.5, -PH/2) }, 0.3)
        end)
    else
        KStatus.TextColor3 = Color3.fromRGB(220, 50, 50)
        KStatus.Text       = ">> INVALID KEY. JOIN DISCORD FOR ACCESS."
        tw(KInputBG, { BackgroundColor3 = Color3.fromRGB(60, 5, 5) }, 0.1)
        task.delay(0.4, function() tw(KInputBG, { BackgroundColor3 = C.Surface }, 0.2) end)
    end
end)

KLiteBtn.MouseButton1Click:Connect(function()
    tw(KLiteBtn, { BackgroundColor3 = CLite.AccentDim }, 0.08)
    collapseKeyGate(function()
        local Win = BuildHub(CLite, { Title = CLite.Title, Noclip = false, Addons = false })
        Win.Visible = true
        Win.Position = UDim2.new((1-PW)/2, 0, 1.5, 0)
        tw(Win, { Position = UDim2.new((1-PW)/2, 0, 0.5, -PH/2) }, 0.3)
    end)
end)

KInput.FocusLost:Connect(function(enter)
    if enter then KSubmit.MouseButton1Click:Fire() end
end)

-- Boot animation
KeyFrame.Position               = UDim2.new((1-PW)/2, 0, 1.5, 0)
KeyFrame.BackgroundTransparency = 1
tw(KeyFrame, { BackgroundTransparency = 0 }, 0.2)
tw(KeyFrame, { Position = UDim2.new((1-PW)/2, 0, 0.5, -PH/2) }, 0.35)