---повер слап симулятор

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Phonk Scripts",
    LoadingTitle = "phonk scripts is loaded",
    LoadingSubtitle = "by milfhunter",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 })
getgenv().eggf = {
    e1 =  false,
    e2 = false, 
    e3 = false,
    e4 = false, 
    e5 = false,
    e6 = false,
    e7 = false ,
    e8 = false,
}
getgenv().Settings = {
    farm1 = false,
    farm2 = false,
    farm3 = false,
    farm4 = false,
    fram5 = false,
    farm6 = false,
    spin1 = false,
    spin2 = false,
    
}
getgenv().Wins = {
   wins1 = false, 
   wins2 = false,
   wins3 = false,
}
 local Tab = Window:CreateTab("AutoFarm ") 
local ea = Window:CreateTab("Auto Hatch")
local tp = Window:CreateTab("misc")
local cr = Window:CreateTab("Credits")
--таглы и кнопки 

local Section = Tab:CreateSection("Auto farm other")

 local Toggle = Tab:CreateToggle({
    Name = "Farm Height",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.farm1 = State
   
            local ohNumber1 = 1
            local ohString2 = "Food"
            local ohString3 = "Burger"

            game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(ohNumber1, ohString2, ohString3)
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm Mew",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.farm2 = State
        
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm Body",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.farm3 = State
        
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm Care",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.farm4 = State

        local ohNumber1 = 1
        local ohString2 = "Skincare"
        local ohString3 = "Cleanser"

        game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(ohNumber1, ohString2, ohString3)
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm Hair",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.farm5 = State
local ohNumber1 = 1
local ohString2 = "Roller"
local ohString3 = "Roller"

game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(ohNumber1, ohString2, ohString3)

    end,
 })


 local Toggle = Tab:CreateToggle({
    Name = "Farm Teeth",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.farm6 = State


local ohNumber1 = 1
local ohString2 = "Toothbrush"
local ohString3 = "Toothbrush"

game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(ohNumber1, ohString2, ohString3)

    end,
 })    


 local Section = Tab:CreateSection("Auto Wins")

local Toggle = Tab:CreateToggle({
    Name = "Farm Edgar Davis",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Wins.wins1 = State

    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm DJ Best",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Wins.wins2 = State

    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "Farm Top Guy",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Wins.wins3 = State

    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm Moai",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Wins.wins4 = State

    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Farm Giga sigma",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Wins.wins5 = State

    end,
 })


 --egs
 local Toggle = ea:CreateToggle({
    Name = "20 wins ",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        eggf.e1 = State

    end,
 })

 local Toggle = ea:CreateToggle({
    Name = "200 wins ",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        eggf.e2 = State

    end,
 })

 local Toggle = ea:CreateToggle({
    Name = "2000 wins ",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        eggf.e3 = State

    end,
 })
 local Toggle = ea:CreateToggle({
    Name = "50000 wins ",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        eggf.e4 = State

    end,
 })

 --spins
 local Section = tp:CreateSection("Auto Spin")
 local Toggle = tp:CreateToggle({
    Name = "Normal Wheel",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.spin1 = State

    end,
 })

 local Toggle = tp:CreateToggle({
    Name = "Normal Wheel",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(State)
        Settings.spin2 = State

    end,
 })

--tasks

 task.spawn(function()
    while task.wait() do
        if Settings.farm1 then


local ohString1 = "ClickStat"
local ohNumber2 = 1



game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onClick:FireServer()
        end
    end
end)

 task.spawn(function()
    while task.wait() do
        if Settings.farm2 then


local ohString1 = "ClickStat"
local ohNumber2 = 1



game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.MewRequest:FireServer()
        end
    end
end)



task.spawn(function()
    while task.wait() do
        if Settings.farm3 then


local ohString1 = "ClickStat"
local ohNumber2 = 1

    game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onPushupBarComplete:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.farm4 then


local ohString1 = "ClickStat"
local ohNumber2 = 1

    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onClick:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.farm5 then


local ohString1 = "ClickStat"
local ohNumber2 = 1

    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onClick:FireServer()
        end
    end
end)


task.spawn(function()
    while task.wait() do
        if Settings.farm6 then


local ohString1 = "ClickStat"
local ohNumber2 = 1

    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onClick:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Wins.wins1 then
            local ohString1 = "Edgar"
            local ohInstance2 = workspace.Zones["1"].Interactables.Mogging.NPC.Edgar.Table
            local ohString3 = "1"

            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onEnterNPCTable:FireServer(ohString1, ohInstance2, ohString3)
            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onClickRequest:FireServer()

        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Wins.wins2 then
            local ohString1 = "DJBest"
            local ohInstance2 = workspace.Zones["1"].Interactables.Mogging.NPC.DJBest.Table
            local ohString3 = "1"

            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onEnterNPCTable:FireServer(ohString1, ohInstance2, ohString3)
            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onClickRequest:FireServer()

        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Wins.wins3 then
            local ohString1 = "TopGuy"
            local ohInstance2 = workspace.Zones["1"].Interactables.Mogging.NPC.TopGuy.Table
            local ohString3 = "1"

            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onEnterNPCTable:FireServer(ohString1, ohInstance2, ohString3)
            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onClickRequest:FireServer()

        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Wins.wins4 then
            local ohString1 = "Moai"
            local ohInstance2 = workspace.Zones["1"].Interactables.Mogging.NPC.Moai.Table
            local ohString3 = "1"

            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onEnterNPCTable:FireServer(ohString1, ohInstance2, ohString3)
            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onClickRequest:FireServer()

        end
    end
end)



task.spawn(function()
    while task.wait() do
        if Wins.wins5 then
            local ohString1 = "Champion"
            local ohInstance2 = workspace.Zones["1"].Interactables.Mogging.NPC.Champion.Table
            local ohString3 = "1"

            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onEnterNPCTable:FireServer(ohString1, ohInstance2, ohString3)
            game:GetService("ReplicatedStorage").Packages.Knit.Services.MoggingService.RE.onClickRequest:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if eggf.e1 then
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Single"
local ohString2 = "Basic"

game:GetService("ReplicatedStorage").Packages.Knit.Services.EggOpeningService.RF.Hatch:InvokeServer(ohString1, ohString2)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if eggf.e2 then
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Single"
local ohString2 = "Good"

game:GetService("ReplicatedStorage").Packages.Knit.Services.EggOpeningService.RF.Hatch:InvokeServer(ohString1, ohString2)
        end
    end
end)
task.spawn(function()
    while task.wait() do
        if eggf.e3 then
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Single"
local ohString2 = "Epic"

game:GetService("ReplicatedStorage").Packages.Knit.Services.EggOpeningService.RF.Hatch:InvokeServer(ohString1, ohString2)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if eggf.e4 then
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Single"
local ohString2 = "Good"

game:GetService("ReplicatedStorage").Packages.Knit.Services.EggOpeningService.RF.Hatch:InvokeServer(ohString1, ohString2)
         end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.spin1 then

            local ohString1 = "Normal"
            local ohBoolean2 = false

            game:GetService("ReplicatedStorage").Packages.Knit.Services.SpinService.RF.Spin:InvokeServer(ohString1, ohBoolean2)

         end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.spin2 then
            local ohString1 = "Epic"
            local ohBoolean2 = false

            game:GetService("ReplicatedStorage").Packages.Knit.Services.SpinService.RF.Spin:InvokeServer(ohString1, ohBoolean2)

         end
    end
end)






--credits 
local Label = cr:CreateLabel("by:milfhunter.")
local Button = cr:CreateButton({
    Name = "Discord Server",
    Callback = function()
        setclipboard("https://discord.gg/pE95b3EUYs")
    end,
 })

 Rayfield:Notify({
    Title = "PhonkScript",
    Content = "Thank you for using our script",
    Duration = 6.5,
    Image = 0,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })

 local Button = cr:CreateButton({
    Name = "destroy ui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })