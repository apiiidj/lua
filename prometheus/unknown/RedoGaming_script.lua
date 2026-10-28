--[[
Redo Hub V1.1
Made by RedoGaming - youtube.com/RedoGaming

No scripts are made by me, I made this hub for people wanting to be able to execute just one script
that has all of their favourite games inside of it. TL;DR - for ease of access.
--]]

--[[
Paid exploits supported:
ScriptWare - Full support - script-ware.com
Synapse X - Full support - x.synapse.to
Protosmasher - Almost full support - protosmasher.net
SirHurt - Partial support - sirhurt.net
NoobHaxx - No support.

Free exploits supported:
Coco Z - Full Support - wearedevs.net
KRNL - Almost full support - krnl.gg
Omega X - Almost full support - robloxhacks.co
Imperious - Partial support - robloxhacks.co
--]]

 -- Execution menu

 -- Age of Heroes
 if game.PlaceId == 4866692557 then
    loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/be18f86270b8b3bf3ac4e92f5549e767/raw/7f0760a48ce5eb33af43f935d0894e19a80b10c9/age%2520of%2520heroes'))()
    print"Age of Heroes GUI Loaded."
 end

 -- Beeswarm Simulator
 if game.PlaceId == 1537690962 then
    shared.autoload = false -- change to profile name if you want to autoload (afking/autojoin). eg. shared.autoload = "profile"
    loadstring(game:GetObjects("rbxassetid://4384103988")[0X1].Source)("Pepsi Swarm")
    print"Beeswarm Simulator GUI Loaded."
 end

 -- Elemental Battlegrounds
 if game.PlaceId == 566399244 then
    _G.darkmode = false
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Kiraraa/s/main/1.lua'))()
    print"Elemental Battlegrounds GUI Loaded."
 end

-- Arsenal
if game.PlaceId == 286090429 then
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))()
   print"Arsenal GUI Loaded."
end

-- Phantom Forces
if game.PlaceId == 292439477 then
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Project-Evolution/Main/main/Loader.lua", true))()
   print"Phantom Forces GUI Loaded."
end

-- Counter Blox
if game.PlaceId == 301549746 then
   loadstring(game:HttpGet(('https://pastebin.com/raw/JTZ2LyiS'),true))()
   print"Counter Blox GUI Loaded."
end

-- Sharkbite
if game.PlaceId == 734159876 then
   loadstring(game:GetObjects("rbxassetid://3623753581")[1].Source)()
   loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/f80b2272e832e187a49bf132e10cc8a6/raw/fdabd50edb3c2d3366027536e7275331f6141e58/sharkbite'))()
   print"Sharkbite GUI Loaded"
end

-- Nerf FPS
if game.PlaceId == 625364452 then
   loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/75558e81cbd858813732c088643e3110/raw/6b7798ea3ca33fcc8855db155085206db1fa06f1/nerf%2520fps%2520redo%2520hub'))()
   print"Nerf FPS GUI Loaded."
end

-- Polybattle
if game.PlaceId == 4716045691 then
   loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/517cacd66359b2f13700b0fd4356dc49/raw/608ad0011824e8ee833983617bfd06d804179a55/polybattle%2520redo%2520hub'))()
   print"Polybattle GUI Loaded."
end

-- Giant Survival
if game.PlaceId == 4003872968 then
   loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/3484dfe5ad42447a63205c95cdf5ee50/raw/49bb93aac5d58e99e9b6e3069059c61354776ba1/giant%2520survival%2520redo%2520hub'))()
   print"Giant Survival GUI Loaded."
end

-- Bloxburg
if game.PlaceId == 185655149 then
   loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/c6b6ea8531c5e732708ab83438bb33c5/raw/1d02f99bbd9f0ca96a84146ece94f376d5c67e42/bloxburg%2520redo%2520hub'))()
   print"Bloxburg GUI Loaded."
end
