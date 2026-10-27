local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("LYKS Hub V.1 [FREE EDITION]", "BloodTheme")

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")


MainSection:NewButton("Back/Front Flip", "Faites de la Gymnastic lol", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7wDcPtLk"))()
end)

MainSection:NewToggle("Super-Human", "Cours vite et saute haut", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

MainSection:NewButton("Infinity Yield", "OMG tu as des commandes", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
end)


--LOCAL PLAYER
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("Walk Speed", "Cours aussi vite que tu veux", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump", "JUMP !!!", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Btools", "Obtiens le btools", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

-- Other
local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")

OtherSection:NewButton("Dex Explorer", "Ouvre le dex pour voir les secrets du jeu", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)

OtherSection:NewButton("Owl Hub", "Comme le Infinity Yield mais tkt", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/OwlHub.txt"))()
end)