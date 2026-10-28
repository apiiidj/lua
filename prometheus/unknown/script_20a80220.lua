-- 🚀 ⛏️ Dig to Earth's CORE! GUI v1.1 | Feb 2026 | TOGGLES ONLY | ALT + VM/VPN!
-- All prizes now LOOP on toggle (Inf Spins/Cash/Pets)
-- Executor: Solara (wearedevs.net) → Paste/Exec in game

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Globals for loops
getgenv().InfSpinLoop = false
getgenv().CashLoop = false
getgenv().PetLoop = false
local InfSpinConnection = nil
local CashConnection = nil
local PetConnection = nil

local Window = Rayfield:CreateWindow({
   Name = "Sandman's ⛏️ Core Digger GUI ⚠️",
   LoadingTitle = "Loading ⛏️ Dig to Earth's CORE! Tools...",
   LoadingSubtitle = "Infinite Spins/Cash/Pets | Toggle Edition v1.1",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DigToCoreSandman",
      FileName = "v1.1"
   },
   Discord = { Enabled = false },
   KeySystem = false
})

local MainTab = Window:CreateTab("⛏️ Auto Prizes", 4483362458)
local SectionLoops = MainTab:CreateSection("🔄 Toggle Loops (ON = Spam Fire)")
local SectionUtils = MainTab:CreateSection("⚙️ Utils")

-- Inf Spins Toggle (Loop arg 10)
MainTab:CreateToggle({
   Name = "♾️ Auto Inf Spins Loop",
   CurrentValue = false,
   Flag = "AutoInfSpins",
   Callback = function(Value)
      getgenv().InfSpinLoop = Value
      if Value then
         InfSpinConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if getgenv().InfSpinLoop then
               local args = {10}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
               end)
            end
         end)
         Rayfield:Notify({
            Title = "Auto Inf Spins ACTIVE",
            Content = "Spamming spins... (Toggle OFF to stop)",
            Duration = 3
         })
      else
         if InfSpinConnection then
            InfSpinConnection:Disconnect()
            InfSpinConnection = nil
         end
         Rayfield:Notify({
            Title = "Auto Inf Spins STOPPED",
            Content = "Loop disconnected.",
            Duration = 2
         })
      end
   end
})

-- 10x Cash Toggle (Loop arg 8)
MainTab:CreateToggle({
   Name = "💰 Auto 10x Cash Loop (Inf Money)",
   CurrentValue = false,
   Flag = "AutoCash",
   Callback = function(Value)
      getgenv().CashLoop = Value
      if Value then
         CashConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if getgenv().CashLoop then
               local args = {8}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
               end)
            end
         end)
         Rayfield:Notify({
            Title = "Auto Cash ACTIVE",
            Content = "Spamming 10x Cash... (Toggle OFF to stop)",
            Duration = 3
         })
      else
         if CashConnection then
            CashConnection:Disconnect()
            CashConnection = nil
         end
         Rayfield:Notify({
            Title = "Auto Cash STOPPED",
            Content = "Loop disconnected.",
            Duration = 2
         })
      end
   end
})

-- Dominus Pet Toggle (Loop arg 4)
MainTab:CreateToggle({
   Name = "🐾 Auto Dominus Pet Loop",
   CurrentValue = false,
   Flag = "AutoPet",
   Callback = function(Value)
      getgenv().PetLoop = Value
      if Value then
         PetConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if getgenv().PetLoop then
               local args = {4}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
               end)
            end
         end)
         Rayfield:Notify({
            Title = "Auto Pet ACTIVE",
            Content = "Spamming Dominus Pet... (Toggle OFF to stop)",
            Duration = 3
         })
      else
         if PetConnection then
            PetConnection:Disconnect()
            PetConnection = nil
         end
         Rayfield:Notify({
            Title = "Auto Pet STOPPED",
            Content = "Loop disconnected.",
            Duration = 2
         })
      end
   end
})

-- Utils
MainTab:CreateButton({
   Name = "🔄 Rejoin Server",
   Callback = function()
      Rayfield:Notify({Title = "Rejoining...", Content = "Back to digging!", Duration = 2})
      game:GetService("TeleportService"):Teleport(game.PlaceId)
   end
})

-- Load Notify
Rayfield:Notify({
   Title = "⛏️ Core GUI v1.1 LOADED! 🎉",
   Content = "Pearl, MS - Feb 15, 2026 8:41 PM CST\nAll toggles = LOOP SPAM!\nTurn ON for inf prizes ⚠️ ALT + Spoof",
   Duration = 7,
   Image = 4483362458
})