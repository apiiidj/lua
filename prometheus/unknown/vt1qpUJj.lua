local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Zombie Story hub V1", "GrapeTheme")

--Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

MainSection:NewButton("Zombie Aimbot [NEW]", "Zombie AIMBOT | NEW", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/d8DwcsGq"))() -- Load and execute the disable script
end)


MainSection:NewButton("Zombie ESP", "Zombie ESP", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/56gjreLf"))() -- Load and execute the disable script
end)



MainSection:NewButton("Full Bright", "FullBright", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/HRmc3vtk"))() -- Load and execute the disable script
end)

MainSection:NewButton("Hit box expander", "Hitbox expander", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YEJbc8rv"))() -- Load and execute the disable script
end)

--Other
local Other = Window:NewTab("Universal")
local OtherSection = Other:NewSection("Universal")

OtherSection:NewButton("CatBypass", "Let's you swear some crazy shit", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/shadow62x/catbypass/main/upfix"))() -- Load and execute the disable script
end)

OtherSection:NewButton("Infinite Yield", "Can be used to fly in Zombie story ig, and all the other features can also be used too!", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

OtherSection:NewButton("Dex V2", "A really usefull script used to make scripts by finding the propriety of the certain thing you are looking for, which in this case zombie story is : Zombies", function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)




