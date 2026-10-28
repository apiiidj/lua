--[[

          _             _             _             _             _              _      
        /\ \           /\ \         /\ \           /\ \         /\ \           /\ \     
       /  \ \         /  \ \       /  \ \         /  \ \       /  \ \         /  \ \    
      / /\ \ \       / /\ \ \     / /\ \ \       / /\ \ \     / /\ \ \       / /\ \ \   
     / / /\ \ \     / / /\ \ \   / / /\ \ \     / / /\ \ \   / / /\ \ \     / / /\ \ \  
    / / /  \ \_\   / / /  \ \_\ / / /  \ \_\   / / /  \ \_\ / / /  \ \_\   / / /  \ \_\ 
   / / /    \/_/  / / /   / / // / /    \/_/  / / /   / / // / /    \/_/  / / /    \/_/ 
  / / /          / / /   / / // / /          / / /   / / // / /          / / /          
 / / /________  / / /___/ / // / /________  / / /___/ / // / /________  / / /________   
/ / /_________\/ / /____\/ // / /_________\/ / /____\/ // / /_________\/ / /_________\  
\/____________/\/_________/ \/____________/\/_________/ \/____________/\/____________/  


A Script Hub by N4ri aimed at making Scripts easy to find.
You only need a few clicks to find a script you need.
You can search for scripts to save time.
You can even suggest scripts to the developer.


https://wearedevs.net
https://cocotechnology.tech


]]--

local lib = loadstring(game:HttpGet(('https://gitlab.com/cococc/cocoscripthub/-/raw/master/CocoLib'),true))()
local window = lib:CreateWindow()

-- Game Scripts --

window:CreateButtonF1("Arsenal (Dark Hub)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))()
end)

window:CreateButtonF1("Jailbreak (Panther Hub)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Splooshhy/PantherHub/main/main/sexy/script.lua"))()
	setclipboard("https://discord.gg/YgvrgEjQ8G")
	game.StarterGui:SetCore("SendNotification",  {
		Title = "Coco Hub";
		Text = "This Script requires a key, i've copied the discord link for you, paste the link into your browser.";
		Icon = "http://www.roblox.com/asset/?id=5114892367";
		Duration = 10;
		Button1 = "OK";
	})
end)

window:CreateButtonF1("Murder Mystery 2 (Eclipse MM2)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script'),true))()
end)

window:CreateButtonF1("Murder Mystery 2 (Vynixu's)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Scripts/master/Vynixius%20MM2", true))()
end)

window:CreateButtonF1("Murder Mystery 2 (Drifter0507)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Drifter0507/mm2/main/mm2", true))()
end)

window:CreateButtonF1("Speed Run 4 (Vynixu's)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Scripts/master/Speed%20Run%204", true))()
end)

window:CreateButtonF1("Tower of Hell (Vynixu's)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Scripts/master/Tower%20of%20Hell", true))()
end)

window:CreateButtonF1("Build a Boat for Treasure (Toxic Mods)", function()
	loadstring(game:HttpGet(("https://toxicmods.mattlawz.xyz/scripts/buildaboat.lua"), true))()
end)

window:CreateButtonF1("Pistol 1V1 (Joe22)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/joe22-cool/Pistol_1v1/main/Script.lua"))()
end)

window:CreateButtonF1("Prison Life (Vynixu's)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Scripts/master/Vynixius%20Prison%20Life"))()
end)

window:CreateButtonF1("The Wild West (Lace)", function()
	loadstring(game:HttpGet('https://pastebinp.com/raw/gGtYE8mc'))()
end)

window:CreateButtonF1("Shindo (Mhee Hub)", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/Av8NMSSq",true))()
end)

window:CreateButtonF1("Amongst Us (Psykek)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Psykek66/eee/main/AUGUI.txt", true))()
end)

window:CreateButtonF1("KAT! (Modded Lime X)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/LimeXKAT'),true))()
end)

window:CreateButtonF1("Assassin (bockatta)", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/bockatta/Atta/main/Assassin%20Shitter'))();
end)

window:CreateButtonF1("Ragdoll Engine (Vynixu's)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/RegularVynixu/Scripts/master/Vynixius%20Ragdoll%20Engine'),true))()
end)

window:CreateButtonF1("Strucid (Project Evolution)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Project-Evolution/Main/main/Loader.lua", true))()
end)

window:CreateButtonF1("SharkBite (Unknown Developer)", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/YYVLbzVg", true))()
end)

window:CreateButtonF1("SharkBite (Pepsi Byte)", function()
	loadstring(game:GetObjects("rbxassetid://3623753581")[1].Source)()
end)

window:CreateButtonF1("Unit Classified (LittleDyingDuck)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LittleDyingDuck/UnitClassified/master/unit.lua"))()
end)

window:CreateButtonF1("Nerf FPS (Redo Hub)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/RedoGaming/RedoHub/main/script'),true))()
end)

window:CreateButtonF1("PolyBattle (Redo Hub)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/RedoGaming/RedoHub/main/script'),true))()
end)

window:CreateButtonF1("Word Bomb (N4ri, Based off AngelD23's Script)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/Unpatchabomb/master/Unpatchabomb'),true))()
end)

window:CreateButtonF1("Murder Mystery 2 (N4ri, Based off Vynixu's Script)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/MM2%20Admin%20Panel'),true))()
end)

window:CreateButtonF1("Flee The Facility (Unknown Developer)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/Flee%20The%20Facility'),true))()
end)

window:CreateButtonF1("Ninja Legends (Jxnt)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/NinjaLegends'),true))()
end)

window:CreateButtonF1("Ninja Legends 2 (Orion)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LaDamage/Obfuscated/main/NinjaLegends2.lua" ,true))()
end)

window:CreateButtonF1("De Pride Isle Sanatorium (Unknown Developer)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/DivineSisters" ,true))()
end)

window:CreateButtonF1("Hide and Seek Extreme (Zyrex)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/Kraken_Hub.txt", true))()
end)

window:CreateButtonF1("D-DAY (Project Ripple)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/iQAIRHUB/Project-Ripple/main/D-DAY/V3.0.3",true))()
end)

window:CreateButtonF1("Welcome to Bloxburg (Dark Hub)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init",true))()
end)

window:CreateButtonF1("A Bizzare Journey (A.I Hub)", function()
	pcall(function()
		local content = game:HttpGet("https://raw.githubusercontent.com/ClairSonata/A.I-Hub/main/Intro.lua")
		assert(loadstring(content))()
	end)
end)

window:CreateButtonF1("A Bizzare Journey (BimbusCoder)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BimbusCoder/Roblox-Scripts/master/ABJ", true))()
end)

window:CreateButtonF1("Ro-Ghoul (z4gs)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/z4gs/scripts/master/Ro-Ghoul%20Auto%20Farm.lua",true))()
end)

window:CreateButtonF1("Counter Blox : Roblox Offensive (Hex Hub)", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/venosu/Hex-Hub/main/hexhub.lua'))()
end)

window:CreateButtonF1("Big Paintball (Unknown Developer)", function()
	loadstring(game:HttpGet('https://pastebinp.com/raw/PuaaGKsT'))()
end)

window:CreateButtonF1("Bee Swarm Simulator (Infinity Lua)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infinitylua/Luascripts/main/KJFsdEj8sXrja.lua"))()
end)

window:CreateButtonF1("Your Bizarre Adventure (Escanor)", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/JE9Masic​"))()
end)

window:CreateButtonF1("Stands Online v21 (Kryptonite X)", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/jeP2Tvvm", true))()
end)

window:CreateButtonF1("Kings Piece (egoD)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/AltsegoD/script/master/KingPiece.lua')))()
end)

window:CreateButtonF1("RoBeats (notclosure)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/notclosure/new-years/main/happ.lua"))()
end)

window:CreateButtonF1("Blox Fruits (Mhee Hub)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BunnySalf/Hentai/main/MHEEHUB",true))()
end)

window:CreateButtonF1("RoCitizens (Inf Money)", function()
	game.Players.LocalPlayer.ChangeMoney:Fire(1000000000000)
end)

window:CreateButtonF1("Royale High (Diamond Farm, Use Alt)", function()
	loadstring(game:HttpGet('https://pastebinp.com/raw/5ftQCzsu'))()
end)

window:CreateButtonF1("Assassin! (Jonatan Chavez)", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Jonatanchavez3/B.A.C/main/Bad%20New'))()
end)

window:CreateButtonF1("Apocalypse Rising (CodeRepeat)", function()
	loadstring(game:HttpGet("https://pastebinp/raw/eCCmuezM", true))()
end)

window:CreateButtonF1("Notoriety (oofNotoriety)", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/RPCYGzpu",true))()
end)

window:CreateButtonF1("Murder Mystery 3 (ecez#9573)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EntityStrike/MM3-EntityStrike/main/MM3-EntityStrike-Script"))()
end)

window:CreateButtonF1("BloxBurg (AutoFarm, Unknown Developer)", function()
	loadstring(game:HttpGet("http://f1f46a0dd759fdae.paste.se/raw"))()
end)

window:CreateButtonF1("Breaking Point (asgar)", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/MLPypHYv', true))()
end)

window:CreateButtonF1("Breaking Point (Crap GUI V1)", function()
	loadstring(game:GetObjects("rbxassetid://1014703659")[1].Source)()
end)

window:CreateButtonF1("Azure Mines (90467)", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/AzureMines', true))()
end)

window:CreateButtonF1("Adopt Me (BloxiYT)", function()
	_G.SubToBloxiScripts = false
	loadstring(game:HttpGet("https://bloxhub.xyz/script/loader"))()
end)

window:CreateButtonF1("Elemental Battlegrounds (Kiraraa)", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/jyFwppd1", true))()
end)

window:CreateButtonF1("Sound Space (Owl Hub)", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/SiLeNSwOrD/OwlHub/master/OwlHub.txt'), true))()
end)

window:CreateButtonF1("Funky Friday (Wally)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua",true))()
end)

window:CreateButtonF1("King Legacy (Sky Hub)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/crack/main/skyhub"))()
end)

window:CreateButtonF1("Bed Wars (DiamondHands)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DiamondHands-Exploit/BedWarsExploit/main/Source.lua"))()
end)

window:CreateButtonF1("Islands (DiamondHands)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DiamondHands-Exploit/BedWarsExploit/main/Source.lua"))()
end)

-- Hubs --

window:CreateButtonF2("Pika Hub", function()
	loadstring(game:HttpGet("https://pika-cheat.cc/script.lua"))();
end)

window:CreateButtonF2("Panther Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Splooshhy/PantherHub/main/main/sexy/script.lua"))()
	setclipboard("https://discord.gg/YgvrgEjQ8G")
	game.StarterGui:SetCore("SendNotification",  {
		Title = "Coco Hub";
		Text = "This Script requires a key, i've copied the discord link for you, paste the link into your browser.";
		Icon = "http://www.roblox.com/asset/?id=5114892367";
		Duration = 10;
		Button1 = "OK";
	})
end)

window:CreateButtonF2("Domain Hub V2", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexsoftworks/Domain/main/source'),true))()
end)

window:CreateButtonF2("Impulse Hub", function()
	loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
end)

window:CreateButtonF2("Alpha X Hub", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/z6TfDmqP",true))()
end)

window:CreateButtonF2("Dark Hub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))()
end)

window:CreateButtonF2("Duck Hub", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/NougatBitz/DuckHub/master/window.lua'))()
end)

window:CreateButtonF2("Owl Hub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/SiLeNSwOrD/OwlHub/master/OwlHub.txt'), true))()
end)

window:CreateButtonF2("Redo Hub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/RedoGaming/RedoHub/window/script'),true))()
end)

window:CreateButtonF2("Kraken Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/Kraken_Hub.txt", true))()
end)

window:CreateButtonF2("Oxie Hub", function()
	loadstring(game:HttpGet(('https://github.com/MarsQQ/ScriptHubScripts/blob/master/OxieHub'),true))()
end)

window:CreateButtonF2("Zyrex Hub", function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/ZyrexHub"),true))()
end)

window:CreateButtonF2("EHub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/EHUBWINNING/KRNL/window/Script.lua'),true))()
end)

window:CreateButtonF2("Mhee Hub", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/Av8NMSSq",true))()
end)

window:CreateButtonF2("Bruh Hub", function()
	loadstring(game:HttpGet("https://bruh.keshsenpai.com/.lua"))()
end)

window:CreateButtonF2("Project Evolution", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Project-Evolution/Main/main/Loader.lua", true))()
end)

window:CreateButtonF2("Cattoware", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/CatzCode/cat/main/Cattoware.lua'))()
end)

window:CreateButtonF2("ReeHub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/botdevXD/ReeHub/main/ReeHub.lua", true))()
end)

window:CreateButtonF2("Ez Hub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
end)

window:CreateButtonF2("Fathom Hub", function()
	loadstring(game:HttpGet("https://pastebinp.com/raw/UmhaEvTT",true))()
end)

window:CreateButtonF2("A.I Hub", function()
	pcall(function()
		local content = game:HttpGet("https://raw.githubusercontent.com/ClairSonata/A.I-Hub/main/Intro.lua")
		assert(loadstring(content))()
	end)
end)

-- Universal Scripts

window:CreateButtonF3("Owl Hub", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/SiLeNSwOrD/OwlHub/master/OwlHub.txt'), true))()
end)

window:CreateButtonF3("CMD-X", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

window:CreateButtonF3("Infinite Yield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

window:CreateButtonF3("Reviz Admin", function()
	loadstring(game:HttpGet(('https://pastebinp.com/raw/Hv2BEncA'),true))()
end)

window:CreateButtonF3("Invisible Fling", function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Denverrz/scripts/master/Invisible_Fling_Revamp.lua"),true))()
end)

window:CreateButtonF3("Click TP Tool", function()
	loadstring(game:HttpGet(('https://gitlab.com/cccontrol/cccontrol/-/raw/master/ExtraScripts/ClickTPTool'),true))()
end)

window:CreateButtonF3("Dex V2", function()
	loadstring(game:HttpGet("https://gitlab.com/cccontrol/cccontrol/-/raw/master/ExtraScripts/DexV2"))
end)

window:CreateButtonF3("Dark Dex", function()
	loadstring(game:HttpGet(('https://gitlab.com/cccontrol/cccontrol/-/raw/master/ExtraScripts/DarkDex'),true))()
end)

window:CreateButtonF3("R15 GUI", function()
	loadstring(game:HttpGet("https://gitlab.com/Tsuniox/lua-stuff/-/raw/master/R15GUI.lua"))()
end)

window:CreateButtonF3("ChetBypasser", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/bedra45/chetbypasser/main/chetbypass'),true))()
end)

window:CreateButtonF3("OPFinality", function()
	loadstring(game:HttpGet(('https://gitlab.com/cccontrol/cccontrol/-/raw/master/ExtraScripts/OPFinality'),true))()
end)

window:CreateButtonF3("FE Punch Fling", function()
	loadstring(game:HttpGet(('https://pastebinp/raw/YPZ0wNaw'),true))()
end)

window:CreateButtonF3("CC Aimbot V1", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/CCAimbot'),true))()
end)

window:CreateButtonF3("CC Aimbot V2", function()
	loadstring(game:HttpGet(('https://gitlab.com/marsscripts/marsscripts/-/raw/master/CCAimbotV2'),true))()
end)
