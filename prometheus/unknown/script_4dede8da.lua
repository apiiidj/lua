local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Packet Client V4 | Sirius Ver | Universal",
   Icon = 4483362458, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Sirius Ver ",
   LoadingSubtitle = "Packet Client",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "hub rayfied"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "tyk9X5P7AQ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "key join the discord server for the key ty.",
      Subtitle = "Key System",
      Note = "join https://discord.gg/tyk9X5P7AQ, -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"thanksforusing"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("main")

Rayfield:Notify({
   Title = "have fun!",
   Content = "from xszx <3",
   Duration = 5,
   Image = 4483362458,
})

local Button = MainTab:CreateButton({
   Name = "♾infinite jump",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {0, 300},
   Increment = 1,
   Suffix = "🚤Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local aimTab = Window:CreateTab("🎯Aim", nil) -- Title, Image
local Section = aimTab:CreateSection("aimbot clients")

local Button = aimTab:CreateButton({
   Name = "airhub not airhub 2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
   end,
})

local themesTab = Window:CreateTab("🎨themes", nil) -- Title, Image
local Section = themesTab:CreateSection("normal themes not custom")


local selfTab = Window:CreateTab("💣self destruct", nil) -- Title, Image
local Section = selfTab:CreateSection("💣self destruct")

local Button = selfTab:CreateButton({
    Name = "💣self destruct",
   Callback = function()
   Rayfield:Destroy()
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Inf Jump toggle if you want",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "dex explorer",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
   end,
})

local Input = MainTab:CreateInput({
   Name = "JumpPower",
   CurrentValue = "40",
   PlaceholderText = "40-1-200",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Text)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Text)
   end,
})

local Button = MainTab:CreateButton({
   Name = "se if its working by printing hello",
   Callback = function()
   print('hello')
   end,
})

local Section = MainTab:CreateSection("🎲misc")

local Button = MainTab:CreateButton({
    Name = "infinite yeld",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
   end,
})

local bindTab = Window:CreateTab("🔠binds", nil) -- Title, Image
local Section = bindTab:CreateSection("binds")
    
local Button = MainTab:CreateButton({
   Name = "left ctrl+left mouse button to teleport",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Click%20Teleport.txt"))()
   end,
})

local Keybind = bindTab:CreateKeybind({
   Name = "infinite jump keybind",
   CurrentKeybind = "",
   HoldToInteract = false,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "ezhub",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "rejoin",
   Callback = function()
   game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
   end,
})

local Button = themesTab:CreateButton({
   Name = "Default",
   Callback = function()
   Window.ModifyTheme('Default')
   end,
})

local Button = themesTab:CreateButton({
   Name = "AmberGlow",
   Callback = function()
   Window.ModifyTheme('AmberGlow')
   end,
})

local Button = themesTab:CreateButton({
   Name = "Amethyst",
   Callback = function()
   Window.ModifyTheme('Amethyst')
   end,
})

local Button = themesTab:CreateButton({
   Name = "Bloom",
   Callback = function()
   Window.ModifyTheme('Bloom')
   end,
})

local Button = themesTab:CreateButton({
   Name = "DarkBlue",
   Callback = function()
   Window.ModifyTheme('DarkBlue')
   end,
})

local Button = themesTab:CreateButton({
   Name = "Green",
   Callback = function()
   Window.ModifyTheme('Green')
   end,
})

local Button = themesTab:CreateButton({
   Name = "Light",
   Callback = function()
   Window.ModifyTheme('Light')
   end,
})

local Button = themesTab:CreateButton({
   Name = "Ocean",
   Callback = function()
   Window.ModifyTheme('Ocean')
   end,
})

local Button = themesTab:CreateButton({
   Name = "Serenity",
   Callback = function()
   Window.ModifyTheme('Serenity')
   end,
})

local Button = MainTab:CreateButton({
   Name = "esp",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/WRD%20ESP.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "some invisible",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Invisible%20Character.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "critical strike gui cheat",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Critical%20Strike%20GUI.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "fly",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Fly.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "btools",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "esp and aimbot",
   Callback = function()
   loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Universal%20ESP%20+%20Aimbot.txt"))()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "night toggle",
   CurrentValue = false,
   Flag = "night", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   
   end,
})

Rayfield:Notify({
   Title = "have fun",
   Content = "from xszx <3",
   Duration = 6.5,
   Image = 99853776673657,
})