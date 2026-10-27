local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

-- [ SETTINGS ]
local myName = "S  c  r  i  p  t    b  y    Z  a  y  n"
local myBio  = "Welcome  " .. lp.Name .. "  !!"

-- [ GUI CREATION - DRAGGABLE BUTTON ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ZaynDraggableHub"

local MainButton = Instance.new("TextButton")
MainButton.Size = UDim2.new(0, 150, 0, 45)
MainButton.Position = UDim2.new(0.5, -75, 0.1, 0)
MainButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainButton.Text = "EXECUTE ZAYN"
MainButton.TextColor3 = Color3.new(1, 1, 1)
MainButton.Font = Enum.Font.GothamBold
MainButton.TextSize = 14
MainButton.Parent = ScreenGui

-- Rounded Corners & Stroke
local Corner = Instance.new("UICorner", MainButton)
Corner.CornerRadius = UDim.new(0, 8)
local Stroke = Instance.new("UIStroke", MainButton)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255, 0, 0)

-- [ DRAGGABLE LOGIC ]
local dragging, dragInput, dragStart, startPos
MainButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainButton.Position
    end
end)

MainButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

MainButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- [ RECT RGB & EXECUTE ]
local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE", 5)

MainButton.MouseButton1Click:Connect(function()
    -- 1. Execute Invincible Flight
    pcall(function()
        loadstring(game:HttpGet("https://obj.wearedevs.net/197198/scripts/invincible%20flight%20animation.lua"))()
    end)
    
    -- 2. Set Name & Bio (Rect Effect)
    if RE then
        local NameEvent = RE:FindFirstChild("1RPNam1eTex1t")
        local ColorEvent = RE:FindFirstChild("1RPNam1eColo1r")
        
        NameEvent:FireServer("RolePlayName", myName)
        NameEvent:FireServer("RolePlayBio", myBio)

        -- Smooth RGB Loop for Button & Name
        task.spawn(function()
            local h = 0
            while true do
                h = (h + 0.005) % 1
                local c = Color3.fromHSV(h, 1, 1)
                Stroke.Color = c -- बटन का बॉर्डर चमकेगा
                ColorEvent:FireServer("PickingRPNameColor", c)
                ColorEvent:FireServer("PickingRPBioColor", c)
                task.wait(0.05)
            end
        end)
    end
    
    MainButton.Text = "LOADED!"
    task.wait(1)
    MainButton.Text = "ZAYN ACTIVE"
end)
