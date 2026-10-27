local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- H/P BUTTON
local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0.5, -25, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BorderColor3 = Color3.fromRGB(0, 0, 0)
button.BorderSizePixel = 3
button.Text = "h/p"
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.TextSize = 18
button.Font = Enum.Font.SourceSansBold
button.Active = true
button.Draggable = true

-- SPINNING RING
local spin = Instance.new("Frame")
spin.Parent = button
spin.Size = UDim2.new(1, 10, 1, 10)
spin.Position = UDim2.new(0, -5, 0, -5)
spin.BackgroundTransparency = 1

local stroke = Instance.new("UIStroke")
stroke.Parent = spin
stroke.Color = Color3.fromRGB(0, 0, 0)
stroke.Thickness = 3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

game:GetService("RunService").RenderStepped:Connect(function()
    spin.Rotation = (spin.Rotation + 2) % 360
end)

-- EXECUTOR FRAME
local executor = Instance.new("Frame")
executor.Parent = gui
executor.Size = UDim2.new(0, 350, 0, 230)
executor.Position = UDim2.new(0.5, -175, 0.5, -115)
executor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
executor.BorderColor3 = Color3.fromRGB(0, 0, 0)
executor.BorderSizePixel = 3
executor.Visible = false
executor.Active = true
executor.Draggable = true

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = executor
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 2
title.Text = "h0imerpr1me Executor"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextSize = 16
title.Font = Enum.Font.SourceSansBold

-- KOD KUTUSU
local box = Instance.new("TextBox")
box.Parent = executor
box.Size = UDim2.new(0.58, -10, 0, 140)
box.Position = UDim2.new(0, 8, 0, 38)
box.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
box.BorderColor3 = Color3.fromRGB(80, 80, 80)
box.BorderSizePixel = 2
box.TextColor3 = Color3.fromRGB(0, 0, 0)
box.Text = "-- put lua script here"
box.TextWrapped = true
box.TextXAlignment = Enum.TextXAlignment.Left
box.TextYAlignment = Enum.TextYAlignment.Top
box.ClearTextOnFocus = false
box.MultiLine = true
box.Font = Enum.Font.Code
box.TextSize = 13

-- SCRIPT LİSTESİ (kaydırılabilir)
local scriptListFrame = Instance.new("ScrollingFrame")
scriptListFrame.Parent = executor
scriptListFrame.Size = UDim2.new(0.28, -10, 0, 140)
scriptListFrame.Position = UDim2.new(0.66, 8, 0, 38)
scriptListFrame.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
scriptListFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
scriptListFrame.BorderSizePixel = 2
scriptListFrame.ScrollBarThickness = 6
scriptListFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)
scriptListFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scriptListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scriptListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = scriptListFrame
listLayout.Padding = UDim.new(0, 5)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Hata gösterme
local errorLabel = Instance.new("TextLabel")
errorLabel.Parent = executor
errorLabel.Size = UDim2.new(0.9, 0, 0, 18)
errorLabel.Position = UDim2.new(0.05, 0, 0, 185)
errorLabel.BackgroundTransparency = 1
errorLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
errorLabel.TextSize = 12
errorLabel.Text = ""
errorLabel.TextWrapped = true
errorLabel.Visible = false

-- EXECUTE BUTTON
local exec = Instance.new("TextButton")
exec.Parent = executor
exec.Size = UDim2.new(0.30, -5, 0, 28)
exec.Position = UDim2.new(0.02, 0, 1, -35)
exec.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
exec.BorderColor3 = Color3.fromRGB(0, 0, 0)
exec.BorderSizePixel = 2
exec.Text = "Execute"
exec.TextColor3 = Color3.fromRGB(0, 0, 0)
exec.Font = Enum.Font.SourceSansBold
exec.TextSize = 14

-- CLEAR BUTTON
local clear = Instance.new("TextButton")
clear.Parent = executor
clear.Size = UDim2.new(0.30, -5, 0, 28)
clear.Position = UDim2.new(0.35, 0, 1, -35)
clear.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
clear.BorderSizePixel = 2
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(0, 0, 0)
clear.Font = Enum.Font.SourceSansBold
clear.TextSize = 14

-- R6 BUTTON
local r6Btn = Instance.new("TextButton")
r6Btn.Parent = executor
r6Btn.Size = UDim2.new(0.30, -5, 0, 28)
r6Btn.Position = UDim2.new(0.68, 0, 1, -35)
r6Btn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
r6Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
r6Btn.BorderSizePixel = 2
r6Btn.Text = "R6"
r6Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
r6Btn.Font = Enum.Font.SourceSansBold
r6Btn.TextSize = 14

r6Btn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/NEn2Lmng"))()
    end)
end)

-- OPEN / CLOSE
button.MouseButton1Click:Connect(function()
    executor.Visible = not executor.Visible
end)

-- EXECUTE (özel komutlar dahil)
exec.MouseButton1Click:Connect(function()
    errorLabel.Visible = false
    errorLabel.Text = ""
    
    local code = box.Text:lower()  -- büyük/küçük harf duyarsız
    
    -- 1. Polaria özel komutu
    if code:find('require%(123255432303221%):pload%("heimerprime"%)') then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Polaria-56385"))()
        end)
        return
    end
    
    -- 2. Grab Knife v3 özel komutu (her iki username varyasyonu)
    if code:find('require%(2829943043%):run%("heimerprime","i baked you a pie"%)') 
    or code:find('require%(2829943043%):run%("username","i baked you a pie"%)') then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-grab-knife-v3-131636"))()
        end)
        return
    end
    
    -- Normal çalıştırma
    if code == "" or code:match("^%s*$") or code == "-- put lua script here" then return end
    
    local func, err = loadstring(code)
    if not func then
        errorLabel.Text = "Syntax hatası: " .. (err or "?")
        errorLabel.Visible = true
        return
    end
    
    local success, result = pcall(func)
    if not success then
        errorLabel.Text = "Çalışma hatası: " .. tostring(result)
        errorLabel.Visible = true
    end
end)

-- CLEAR
clear.MouseButton1Click:Connect(function()
    box.Text = ""
    errorLabel.Visible = false
end)

-- Script ekleme fonksiyonu
local function addScriptButton(name, code)
    local btn = Instance.new("TextButton")
    btn.Parent = scriptListFrame
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
    btn.BorderSizePixel = 1
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.Font = Enum.Font.SourceSansSemibold
    btn.TextSize = 13
    btn.TextTruncate = Enum.TextTruncate.SplitWord
    
    btn.MouseButton1Click:Connect(function()
        box.Text = code
    end)
end

-- TÜM SCRIPT TUŞLARI
addScriptButton("John Doe", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-John-doe-135854"))()]])
addScriptButton("Spectrum Glitcher", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spectrum-Glitcher-47547"))()]])
addScriptButton("k00pgui", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-K00pguo-Lua-nothing-works-today-42705"))()]])
addScriptButton("c00lgui", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-140314"))()]])
addScriptButton("B2S Gui", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-blue2spooky-gui-reborn-41879"))()]])
addScriptButton("Grab Knife v3", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-grab-knife-v3-131636"))()]])
addScriptButton("Server Admin", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Server-admin-74029"))()]])
addScriptButton("Bluudud Gui", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bluudud-gui-50126"))()]])
addScriptButton("Bluudud", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bluudud-Forsaken-NOT-MADE-BY-ME-73288"))()]])
addScriptButton("Java Gui", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Java1x3x5x6-Reimagined-Gui-133104"))()]])
addScriptButton("Cuboos93 Gui", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Cuboos93-Gui-V11-140639"))()]])
addScriptButton("Tubuus97 GUI", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tuubus97-Gui-V2-77919"))()]])
addScriptButton("Ban Hammer", [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ban-Hammer-128356"))()]])
addScriptButton("Omni God .TxT", [[loadstring(game:HttpGet("https://obj.wearedevs.net/207807/scripts/Omni%20God%20Of%20Destruction.lua"))()]])