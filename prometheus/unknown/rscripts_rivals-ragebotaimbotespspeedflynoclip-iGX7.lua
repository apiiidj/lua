-- [[ Rscripts Risk Notice ]]
-- This script is not verified by rscripts.net. Deal with caution.
--
-- Stay safe:
--   • Never log in on unofficial Roblox sites or lookalike domains.
--   • Real Roblox links use roblox.com (check the .com ending).
--   • Treat fake Roblox login / "claim reward" pages as phishing.
-- [[ End Rscripts Risk Notice ]]

--[[ v1.0.0 https://wearedevs.net ]] 
return(function(...)
    -- [[ 1. Key & Configuration Setup ]]
    local W = {"v/:l2/FUe2WlTHBX])6#Z", "yousmall", "Rivals Yousmall Hub"}
    local CorrectKey = "yousmall"
    local HubTitle = "Rivals Yousmall Hub"
    
    -- 요청하신 pCloud 주소로 변경되었습니다.
    local KeySystemURL = "https://u.pcloud.link/publink/show?code=XZ5hVQJZAXWGYCN5kXXUHkPGJsaFVJvxROPX" 

    local Camera = game:GetService("Workspace").CurrentCamera
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")

    -- [[ 2. Rivals Hub Main Cheat Framework ]]
    local function ExecutiveFramework()
        print("[" .. HubTitle .. "] Framework Successfully Loaded.")

        local AimbotEnabled = false
        local EspEnabled = false
        local NoRecoilEnabled = false

        local MainGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local Title = Instance.new("TextLabel")
        local AimBtn = Instance.new("TextButton")
        local EspBtn = Instance.new("TextButton")
        local RecoilBtn = Instance.new("TextButton")

        MainGui.Name = "YousmallHubMain"
        MainGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
        MainGui.ResetOnSpawn = false

        Frame.Size = UDim2.new(0, 250, 0, 240)
        Frame.Position = UDim2.new(0.1, 0, 0.3, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        Frame.BorderSizePixel = 0
        Frame.Active = true
        Frame.Draggable = true
        Frame.Parent = MainGui

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 10)
        Corner.Parent = Frame

        Title.Size = UDim2.new(1, 0, 0, 40)
        Title.Text = HubTitle
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 16
        Title.Font = Enum.Font.SourceSansBold
        Title.BackgroundTransparency = 1
        Title.Parent = Frame

        local function styleButton(btn, text, pos)
            btn.Size = UDim2.new(0, 210, 0, 40)
            btn.Position = pos
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            btn.Text = text .. " : OFF"
            btn.TextColor3 = Color3.fromRGB(255, 100, 100)
            btn.TextSize = 15
            btn.Font = Enum.Font.SourceSansBold
            btn.Parent = Frame
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn
        end

        styleButton(AimBtn, "🎯 Smart Aimbot", UDim2.new(0, 20, 0, 55))
        styleButton(EspBtn, "👁️ Player ESP", UDim2.new(0, 20, 0, 110))
        styleButton(RecoilBtn, "⚡ No Recoil", UDim2.new(0, 20, 0, 165))

        local function GetClosestPlayer()
            local ClosestPlayer = nil
            local ShortestDistance = math.huge
            local MousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
                    local char = player.Character
                    if char and char:FindFirstChild("Head") and char:FindFirstChildOfClass("Humanoid") then
                        if char:FindFirstChildOfClass("Humanoid").Health > 0 then
                            local Position, OnScreen = Camera:WorldToViewportPoint(char.Head.Position)
                            if OnScreen then
                                local Distance = (Vector2.new(Position.X, Position.Y) - MousePos).Magnitude
                                if Distance < ShortestDistance then
                                    ClosestPlayer = player
                                    ShortestDistance = Distance
                                end
                            end
                        end
                    end
                end
            end
            return ClosestPlayer
        end

        RunService.RenderStepped:Connect(function()
            if AimbotEnabled then
                local Target = GetClosestPlayer()
                if Target and Target.Character and Target.Character:FindFirstChild("Head") then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, Target.Character.Head.Position)
                end
            end
            if NoRecoilEnabled then
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    char:FindFirstChildOfClass("Humanoid").CameraOffset = Vector3.new(0, 0, 0)
                end
            end
        end)

        local function CreateEspBoxes()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        if not char:FindFirstChild("EspBoxContainer") then
                            local folder = Instance.new("Folder")
                            folder.Name = "EspBoxContainer"
                            folder.Parent = char

                            local box = Instance.new("BoxHandleAdornment")
                            box.Name = "EspBox"
                            box.Size = Vector3.new(4, 6, 4)
                            box.Color3 = Color3.fromRGB(255, 0, 0)
                            box.AlwaysOnTop = true
                            box.ZIndex = 5
                            box.Transparency = 0.6
                            box.Adornee = char:FindFirstChild("HumanoidRootPart")
                            box.Parent = folder
                        end
                    end
                end
            end
        end

        local function ClearEspBoxes()
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("EspBoxContainer") then
                    player.Character:FindFirstChild("EspBoxContainer"):Destroy()
                end
            end
        end

        RunService.Heartbeat:Connect(function()
            if EspEnabled then CreateEspBoxes() else ClearEspBoxes() end
        end)

        AimBtn.MouseButton1Click:Connect(function()
            AimbotEnabled = not AimbotEnabled
            AimBtn.Text = "🎯 Smart Aimbot : " .. (AimbotEnabled and "ON" or "OFF")
            AimBtn.TextColor3 = AimbotEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
        end)

        EspBtn.MouseButton1Click:Connect(function()
            EspEnabled = not EspEnabled
            EspBtn.Text = "👁️ Player ESP : " .. (EspEnabled and "ON" or "OFF")
            EspBtn.TextColor3 = EspEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
            if not EspEnabled then ClearEspBoxes() end
        end)

        RecoilBtn.MouseButton1Click:Connect(function()
            NoRecoilEnabled = not NoRecoilEnabled
            RecoilBtn.Text = "⚡ No Recoil : " .. (NoRecoilEnabled and "ON" or "OFF")
            RecoilBtn.TextColor3 = NoRecoilEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
        end)
    end

    -- [[ 3. Key System Login UI Configuration ]]
    local KeyGui = Instance.new("ScreenGui")
    local KeyFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local KeyInput = Instance.new("TextBox")
    local CheckButton = Instance.new("TextButton")
    local GetKeyButton = Instance.new("TextButton")

    KeyGui.Name = "RivalsKeySystem"
    KeyGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
    KeyGui.ResetOnSpawn = false

    -- 하단 박스가 사라져 세로 길이를 원래 크기(180)로 줄여 더 정돈된 느낌을 줍니다.
    KeyFrame.Size = UDim2.new(0, 320, 0, 180) 
    KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
    KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    KeyFrame.BorderSizePixel = 0
    KeyFrame.Active = true
    KeyFrame.Draggable = true
    KeyFrame.Parent = KeyGui

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 12)
    FrameCorner.Parent = KeyFrame

    TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    TitleLabel.Text = "🔑 " .. HubTitle .. " - Login"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = KeyFrame

    KeyInput.Size = UDim2.new(0, 260, 0, 40)
    KeyInput.Position = UDim2.new(0.5, -130, 0, 55)
    KeyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    KeyInput.BorderSizePixel = 0
    KeyInput.Text = ""
    KeyInput.PlaceholderText = "Enter Key Here..."
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.TextSize = 16
    KeyInput.Font = Enum.Font.SourceSans
    KeyInput.Parent = KeyFrame

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = KeyInput

    CheckButton.Size = UDim2.new(0, 120, 0, 35)
    CheckButton.Position = UDim2.new(0.5, -130, 0, 115)
    CheckButton.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
    CheckButton.BorderSizePixel = 0
    CheckButton.Text = "Verify Key"
    CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckButton.TextSize = 16
    CheckButton.Font = Enum.Font.SourceSansBold
    CheckButton.Parent = KeyFrame

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = CheckButton

    GetKeyButton.Size = UDim2.new(0, 120, 0, 35)
    GetKeyButton.Position = UDim2.new(0.5, 10, 0, 115)
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(200, 120, 0)
    GetKeyButton.BorderSizePixel = 0
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 16
GetKeyButton.Font = Enum.Font.SourceSansBold
GetKeyButton.Parent = KeyFrame
local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyButton
-- [[ 4. Event Connectors & Link Handling ]]
GetKeyButton.MouseButton1Click:Connect(function()
if setclipboard then setclipboard(KeySystemURL) end
if toclipboard then toclipboard(KeySystemURL) end
if setuclipboard then setuclipboard(KeySystemURL) end
pcall(function()
if request then request({Url = KeySystemURL, Method = "GET"}) end
end)
pcall(function()
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = HubTitle,
Text = "Link copied! Paste it into your browser.",
Duration = 4
})
end)
GetKeyButton.Text = "Copied!"
GetKeyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 110)
task.wait(2)
GetKeyButton.Text = "Get Key"
GetKeyButton.BackgroundColor3 = Color3.fromRGB(200, 120, 0)
end)
CheckButton.MouseButton1Click:Connect(function()
if KeyInput.Text == CorrectKey then
CheckButton.Text = "Access Granted!"
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
task.wait(1)
KeyGui:Destroy()
ExecutiveFramework()
else
CheckButton.Text = "Invalid Key!"
CheckButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
KeyInput.Text = ""
task.wait(1.5)
CheckButton.Text = "Verify Key"
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
end
end)
end)(...)