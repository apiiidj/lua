-- ============================================================
-- TEAM BLACK EXECUTOR - BASE ORIGINAL + SCRIPTS RÁPIDOS
-- Tema: Fundo Transparente, Bordas Brancas, Sem Imagens
-- ============================================================

local Players = game:GetService("Players")

local LP = Players.LocalPlayer

-- ============================================================
-- CRIAÇÃO DA INTERFACE (BASE DO PRIMEIRO SCRIPT)
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Painel Principal (Fundo Preto, Borda Branca)
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.300
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.5, -275, 0.5, -160)
Frame.Size = UDim2.new(0, 550, 0, 320)
Frame.Active = true
Frame.Draggable = true

-- Título (Apenas um texto flutuante, sem barra de fundo)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = Frame
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1 -- Fundo totalmente transparente
TitleLabel.Text = "team black join today!"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Caixa de Texto (Fundo Preto, Borda Branca)
local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderSizePixel = 1
TextBox.ClipsDescendants = true
TextBox.Position = UDim2.new(0.02, 0, 0.15, 0)
TextBox.Size = UDim2.new(0.70, 0, 0.65, 0)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Code
TextBox.MultiLine = true
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.PlaceholderText = "-- Digite seu script Lua aqui..."

-- Botão Auto Username Fill
local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0.02, 0, 0.08, 0)
TextButton.Size = UDim2.new(0, 150, 0, 25)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Auto Username Fill"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000

-- Botões de Ação (Execute, Clear, Respawn, R6)
local Execute = Instance.new("TextButton")
Execute.Name = "Execute"
Execute.Parent = Frame
Execute.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderColor3 = Color3.fromRGB(255, 255, 255)
Execute.Position = UDim2.new(0.02, 0, 0.85, 0)
Execute.Size = UDim2.new(0.16, 0, 0.10, 0)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextScaled = true
Execute.TextSize = 14.000

local Clear = Instance.new("TextButton")
Clear.Name = "Clear"
Clear.Parent = Frame
Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderColor3 = Color3.fromRGB(255, 255, 255)
Clear.Position = UDim2.new(0.20, 0, 0.85, 0)
Clear.Size = UDim2.new(0.16, 0, 0.10, 0)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextScaled = true
Clear.TextSize = 14.000

local Respawn = Instance.new("TextButton")
Respawn.Name = "Respawn"
Respawn.Parent = Frame
Respawn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Respawn.BorderColor3 = Color3.fromRGB(255, 255, 255)
Respawn.Position = UDim2.new(0.38, 0, 0.85, 0)
Respawn.Size = UDim2.new(0.16, 0, 0.10, 0)
Respawn.Font = Enum.Font.SourceSans
Respawn.Text = "Reset"
Respawn.TextColor3 = Color3.fromRGB(255, 255, 255)
Respawn.TextScaled = true
Respawn.TextSize = 14.000

local R6 = Instance.new("TextButton")
R6.Name = "R6"
R6.Parent = Frame
R6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
R6.BorderColor3 = Color3.fromRGB(255, 255, 255)
R6.Position = UDim2.new(0.56, 0, 0.85, 0)
R6.Size = UDim2.new(0.16, 0, 0.10, 0)
R6.Font = Enum.Font.SourceSans
R6.Text = "Body Type"
R6.TextColor3 = Color3.fromRGB(255, 255, 255)
R6.TextScaled = true
R6.TextSize = 14.000

-- ============================================================
-- BARRA LATERAL DIREITA — SCRIPTS RÁPIDOS (Fundo Transparente)
-- ============================================================
local SIDEBAR_WIDTH = 160

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, SIDEBAR_WIDTH, 1, -30)
sidebar.Position = UDim2.new(1, -SIDEBAR_WIDTH, 0, 30)
sidebar.BackgroundTransparency = 1 -- Fundo totalmente transparente
sidebar.BorderSizePixel = 0 -- Sem borda externa
sidebar.Parent = Frame

local sidebarScroll = Instance.new("ScrollingFrame")
sidebarScroll.Size = UDim2.new(1, -8, 1, -8)
sidebarScroll.Position = UDim2.new(0, 4, 0, 4)
sidebarScroll.BackgroundTransparency = 1 -- Fundo transparente
sidebarScroll.BorderSizePixel = 0
sidebarScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebarScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
sidebarScroll.ScrollBarThickness = 6
sidebarScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
sidebarScroll.Parent = sidebar

local sbList = Instance.new("UIListLayout")
sbList.Padding = UDim.new(0, 4)
sbList.SortOrder = Enum.SortOrder.LayoutOrder
sbList.Parent = sidebarScroll

local sbPad = Instance.new("UIPadding")
sbPad.PaddingTop = UDim.new(0, 4)
sbPad.PaddingLeft = UDim.new(0, 4)
sbPad.PaddingRight = UDim.new(0, 4)
sbPad.PaddingBottom = UDim.new(0, 6)
sbPad.Parent = sidebarScroll

-- ============================================================
-- LÓGICA DOS BOTÕES PRINCIPAIS
-- ============================================================

-- Executar Script
Execute.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    if code ~= "" then
        local ok, err = pcall(function()
            local f = loadstring(code)
            if f then f() end
        end)
        if not ok then warn("Erro: " .. tostring(err)) end
    end
end)

-- Limpar
Clear.MouseButton1Click:Connect(function()
    TextBox.Text = ""
end)

-- Resetar Personagem
Respawn.MouseButton1Click:Connect(function()
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end
end)

-- Trocar Tipo de Corpo (Placeholder)
R6.MouseButton1Click:Connect(function()
    warn("Body Type Switch precisa de um script externo.")
end)

-- Auto Username Fill (Placeholder)
TextButton.MouseButton1Click:Connect(function()
    TextBox.Text = "-- Insira seu script de Auto Username aqui"
end)

-- ============================================================
-- FUNÇÕES AUXILIARES PARA OS SCRIPTS RÁPIDOS
-- ============================================================
local function safeGet(url)
    url = url:gsub("%s+", "")
    local ok, r = pcall(game.HttpGet, game, url, true)
    if ok and r and #r > 5 then return r end
    
    local httpFn
    pcall(function() if request then httpFn = request end end)
    pcall(function() if not httpFn and syn and syn.request then httpFn = syn.request end end)
    pcall(function() if not httpFn and http_request then httpFn = http_request end end)
    
    if httpFn then
        local res, done = nil, false
        task.spawn(function()
            local ok2, rr = pcall(httpFn, {Url = url, Method = "GET"})
            if ok2 and rr and rr.Body then res = rr.Body end
            done = true
        end)
        local t0 = tick()
        while not done and (tick() - t0) < 8 do task.wait(0.1) end
        return res
    end
    return nil
end

-- ============================================================
-- LISTA DE SCRIPTS RÁPIDOS
-- ============================================================
local quickScripts = {
    {"G00LKIC V2", "https://pastefy.app/ddkGSi8i/raw"},
    {"ESTIGMA", "https://rawscripts.net/raw/Universal-Script-Project-stigma-by-my-friend-jointeamck-9367"},
    {"G00BY EXEC V2", "https://pastefy.app/Lc9amolD/raw"},
    {"PROJETO LIGMA", "https://rawscripts.net/raw/Universal-Script-Project-Ligma-Fucking-Fe-bypass-25414"},
    {"MARIO.EXE", "https://rawscripts.net/raw/Universal-Script-Mario-EXE-lua-executor-17576"},
    {"EXECUTOR DE SCRIPT", "https://rawscripts.net/raw/Universal-Script-Script-Executor-UI-27379"},
    {"SERVIÇO SECRETO", "https://rawscripts.net/raw/Universal-Script-Secret-service-panel-Citizen-fake-25766"},
    {"UNRESTRICTED", "https://rawscripts.net/raw/Universal-Script-Unrestricted-Script-Executor-26373"},
    {"SIMPLE G00BY", "https://raw.githubusercontent.com/g00byd0lanxdd/g00by-executor/refs/heads/main/g00by%20executor"},
    {"SYNAPSE X", "https://pastebin.com/raw/ArWMY6Ve"},
    {"PHOTOMASHER", "https://pastebin.com/raw/AkU2spGc"},
    {"ARCEUS X", "https://pastefy.app/lcdPTBLg/raw"},
    {"Rc7", "https://raw.githubusercontent.com/PT-X3/Rc7-Test/refs/heads/main/Rc7.iua"},
    {"PROJETO G00BY", "https://pastefy.app/zdWzn6lL/raw"},
    {"ELYSIAN EXEC", "https://pastebin.com/raw/CsFAQyXr"},
    {"c00lkidd exec", "https://raw.githubusercontent.com/rtlsmonk/c00lgui-made-by-rtls_a1-on-discord/refs/heads/main/have-fun"},
    {"Synapse X Remake", "https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"},
    {"Grab v4", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"},
    {"TOPK3K V4", "https://raw.githubusercontent.com/KenzoSSto1/Topk3k-V4/main/topk3k.lua"},
    {"Super Ring V6", "https://rawscripts.net/raw/Universal-Script-Super-ring-Parts-V6-28581"},
    {"Fly V4", "https://pastefy.app/uwD60dpJ/raw"},
    {"Homem Invisível", "https://rawscripts.net/raw/Universal-Script-Awesome-Invisible-man-133400"},
    {"Anti Slap", "https://rawscripts.net/raw/Universal-Script-Anti-Slap-or-Fling-FOR-TROLL-GAMES-40702"},
    {"Delta Crack", "https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"},
    {"K00pgui", "https://pastes.io/raw/test-89401"},
    {"Grab Knife V4", "https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/Grab%20V4.txt"},
    {"Wall Hop V5", "https://rawscripts.net/raw/Universal-Script-Wall-Hop-V5-241707"},
    {"UTG Troll", "https://rawscripts.net/raw/Universal-Script-ULTIMATE-TROLLING-GUI-BY-FANCYKID-91109"},
    {"SF 1.5 Mobile", "https://raw.githubusercontent.com/g00byd0lanxdd/SF-1.5-MOBILE/refs/heads/main/SF%201.5%20MOBILE"},
    {"SF 1.2", "https://pastefy.app/Pu13Ovm0/raw"},
    {"SF 1.1", "https://pastefy.app/xj9lkBIv/raw"},
    {"Reborn c00lclan", "https://rawscripts.net/raw/Universal-Script-Reborn-c00lclan-v1-59164"},
    {"Fly V3 DARK", "https://rawscripts.net/raw/Universal-Script-Script-Fly-V3-DARK-50491"},
    {"Administrador do servidor", "https://rawscripts.net/raw/Universal-Script-server-admin-67330"},
    {"Shift Lock", "https://rawscripts.net/raw/Universal-Script-Shift-Lock-121871"},
    {"Administrador sem nome", "https://rawscripts.net/raw/Universal-Script-Nameless-Admin-23304"},
    {"Ban Hammer", "https://rawscripts.net/raw/Universal-Script-Ban-Hammer-Script-58232"},
    {"RuzHub", "https://rawscripts.net/raw/Universal-Script-RuzHub-239344"},
    {"Banana Hub", "https://raw.githubusercontent.com/aloaloalo322/sssdas/refs/heads/main/cc"},
    {"Fly Admin", "https://raw.githubusercontent.com/EchoX10/scripts/refs/heads/main/FlyAdmin"},
    {"c00lgui 007n7", "https://rawscripts.net/raw/Universal-Script-coolgui-95955"},
    {"Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"Fates ESP", "https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua"},
    {"Pwner Hub", "https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/PWNERHUB.lua"},
    {"DEX Explorer", "https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"},
    {"Arceus Aimbot", "https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"},
    {"Arceus Fly", "https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Fly.lua"}
}

-- ============================================================
-- CRIAR BOTÕES NA BARRA LATERAL
-- ============================================================
for _, data in ipairs(quickScripts) do
    local name, url = data[1], data[2]
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 26)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fundo preto para o botão
    btn.BackgroundTransparency = 0.3 -- Leve transparência para combinar
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 11
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(255, 255, 255) -- Borda branca
    btn.AutoButtonColor = false
    btn.Parent = sidebarScroll

    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) end)

    btn.MouseButton1Click:Connect(function()
        warn("Carregando " .. name)
        task.spawn(function()
            local src = safeGet(url)
            if src and #src > 10 then
                local fn = loadstring(src)
                if fn then
                    local ok = pcall(fn)
                    if ok then warn(name .. " OK"); return end
                end
            end
            warn("Falha ao carregar: " .. name)
        end)
    end)
end

warn("Team Black Executor carregado com sucesso!")