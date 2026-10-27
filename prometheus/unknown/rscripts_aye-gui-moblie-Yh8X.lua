if game.PlaceId == 4924922222 then



local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua

        local Window = Rayfield:CreateWindow({
   Name = "AYE GUI",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Aye10ku",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
FileName = "aye10ku Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "sirius", -- The Discord invite code, do not include discord.gg/
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "aye10ku Hub",
      Subtitle = "Key System",
      Note = "v.1 key=key123lol",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key "key123lol"
  }
})

local MainTab = Window:CreateTab("home🏡", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("main",true/false) -- The 2nd argument is to tell if its only a Title and doesnt contain elements
            Rayfield:Notify({
   Title = "you did it",
   Content = "cool gui",
   Duration = 5,
   Image = nil,
local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})
local Button = mainTab:CreateButton({
   Name = "admin",
   Callback = function()
  loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Slider Example",
   Range = {0, 100},
   Increment = 1,
   Suffix = "speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})