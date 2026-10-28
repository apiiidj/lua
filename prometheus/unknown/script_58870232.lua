-- key is "TS is not here :P"

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Rivals idk",
   LoadingTitle = "Loading",
   LoadingSubtitle = "by BlockMaster",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Rivals Hub",
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "Rivals script",
      RememberJoins = true 
   },
   KeySystem = true,
   KeySettings = {
      Title = "Key System",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/Rivals script) for the key!",
      FileName = "RivalsKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "TS is not here :P"
   }
})

local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Main")

local Button = Tab:CreateButton({
   Name = "Aimbot",
   Info = "Locks onto players heads",
   Interact = 'idk :P',
   Callback = function()
   local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
Aimbot.Load()
   end,
})

local Button = Tab:CreateButton({
   Name = "ESP",
   Info = "Highlights players",
   Interact = 'irdk :P',
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Fly",
   Info = "Lets you fly",
   Interact = 'Press space to toggle fly off',
   Callback = function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/199791/scripts/Smooth%20Noclip%20Fly%20by%20AGBest.lua"))()
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Info = "Lets you walk faster",
   Range = {16, 500},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value 
   end,
})

local Slider = Tab:CreateSlider({
   Name = "JumpPower",
   Info = "Lets you jump higher",
   Range = {50, 500},
   Increment = 10,
   Suffix = "jump power",
   CurrentValue = 50,
   Flag = "Slider1",
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local Button = Tab:CreateButton({
   Name = "Inf yield",
   Info = "FE admin commands",
   Interact = 'ACTIVE FE ADMIN COMMANDS',
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})
