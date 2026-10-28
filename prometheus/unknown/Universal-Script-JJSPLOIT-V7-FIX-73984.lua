local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")


pcall(function()
    if CoreGui:FindFirstChild("LoadingScreen") then
        CoreGui.LoadingScreen:Destroy()
    end
end)


local gui = Instance.new("ScreenGui")
gui.Name = "LoadingScreen"
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999999
gui.Parent = CoreGui


local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 1
bg.ZIndex = 2
bg.Parent = gui


local logo = Instance.new("ImageLabel")
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(0, 170, 0, 170)
logo.Position = UDim2.new(0.5, -85, 0.32, -85)
logo.Image = "rbxassetid://137842439297855"
logo.ImageTransparency = 1
logo.ZIndex = 3
logo.Parent = bg

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = logo


local border = Instance.new("ImageLabel")
border.BackgroundTransparency = 1
border.Size = UDim2.new(0, 210, 0, 210)
border.Position = UDim2.new(0.5, -105, 0.32, -105)
border.Image = "rbxassetid://10925039049"
border.ImageColor3 = Color3.fromRGB(0, 0, 0)
border.ImageTransparency = 1
border.ZIndex = 3
border.Parent = bg

TweenService:Create(border, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
    Rotation = 360
}):Play()


local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0.58, 0)
title.BackgroundTransparency = 1
title.Text = "JJSPLOIT"
title.Font = Enum.Font.Cartoon
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(110, 180, 255)
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
title.TextTransparency = 1
title.ZIndex = 4
title.Parent = bg


local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1, 0, 0, 60)
percent.Position = UDim2.new(0, 0, 0.70, 0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.Cartoon
percent.TextScaled = true
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.TextStrokeTransparency = 0
percent.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
percent.TextTransparency = 1
percent.ZIndex = 4
percent.Parent = bg

-- Barra BG
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.7, 0, 0.035, 0)
barBG.Position = UDim2.new(0.15, 0, 0.80, 0)
barBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBG.BackgroundTransparency = 1
barBG.BorderSizePixel = 0
barBG.ZIndex = 3
barBG.Parent = bg
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1, 0)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(40, 140, 255)
bar.BackgroundTransparency = 1
bar.BorderSizePixel = 0
bar.ZIndex = 4
bar.Parent = barBG
Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

Instance.new("UIGradient", bar).Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 120, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}

-- Neon da barra
local neon = Instance.new("UIStroke")
neon.Thickness = 6
neon.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
neon.LineJoinMode = Enum.LineJoinMode.Round
neon.Color = Color3.fromRGB(135, 206, 250)
neon.Parent = barBG

local neonGrad = Instance.new("UIGradient")
neonGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(135, 206, 250)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(135, 206, 250))
}
neonGrad.Parent = neon

task.spawn(function()
    while gui.Parent do
        neonGrad.Rotation = (neonGrad.Rotation + 1) % 360
        task.wait(0.01)
    end
end)


local spawnDots = true

local function spawnDot()
    if not spawnDots then return end

    local dot = Instance.new("Frame")
    local size = math.random(4, 14)
    dot.Size = UDim2.new(0, size, 0, size)
    dot.BackgroundColor3 = Color3.fromRGB(110, 180, 255)
    dot.BorderSizePixel = 0
    dot.ZIndex = 5
    dot.Parent = bg

    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local sx, sy = math.random(), math.random()
    dot.Position = UDim2.new(sx, 0, sy, 0)

    local ex = sx + (math.random(-30, 30) / 100)
    local ey = sy + (math.random(-30, 30) / 100)

    local tween = TweenService:Create(
        dot,
        TweenInfo.new(math.random(4, 8)),
        { Position = UDim2.new(ex, 0, ey, 0), BackgroundTransparency = 1 }
    )

    tween:Play()
    tween.Completed:Connect(function()
        if dot then dot:Destroy() end
    end)
end

task.spawn(function()
    while gui.Parent and spawnDots do
        spawnDot()
        task.wait(0.12)
    end
end)


local function playTween(obj, props, dur)
    local t = TweenService:Create(obj, TweenInfo.new(dur), props)
    t:Play()
    t.Completed:Wait()
end

task.spawn(function()
    local t = {
        {bg, {BackgroundTransparency = 0}, 1},
        {logo, {ImageTransparency = 0}, 1},
        {border, {ImageTransparency = 0}, 1},
        {title, {TextTransparency = 0}, 1},
        {percent, {TextTransparency = 0}, 1},
        {barBG, {BackgroundTransparency = 0.3}, 1},
        {bar, {BackgroundTransparency = 0}, 1},
    }
    for _, v in ipairs(t) do playTween(v[1], v[2], v[3]) end
end)


local start = tick()
local duration = 7
local hb

hb = RunService.Heartbeat:Connect(function()
    local p = math.min((tick() - start) / duration, 1)
    percent.Text = math.floor(p * 100).."%"
    bar.Size = UDim2.new(p, 0, 1, 0)

    if p >= 1 then
        hb:Disconnect()

        
        spawnDots = false  

        for _, dot in ipairs(bg:GetChildren()) do
            if dot:IsA("Frame") and dot ~= bar and dot ~= barBG then
                TweenService:Create(dot, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
            end
        end

        
        local items = {
            {bg, {BackgroundTransparency = 1}},
            {logo, {ImageTransparency = 1}},
            {border, {ImageTransparency = 1}},
            {title, {TextTransparency = 1}},
            {percent, {TextTransparency = 1}},
            {barBG, {BackgroundTransparency = 1}},
            {bar, {BackgroundTransparency = 1}},
            {neon, {Transparency = 1}},
        }

        for _, v in ipairs(items) do
            TweenService:Create(v[1], TweenInfo.new(1), v[2]):Play()
        end

        task.wait(1.1)
        gui:Destroy()
    end
end)
wait(7)

local HttpService = game:GetService("HttpService")            

local folderName = "scriptsalve"            
local fileName = folderName.."/saved_scripts.json"            

if makefolder then            
    pcall(function()            
        makefolder(folderName)            
    end)            
end            

local function loadData()            
    local ok,data = pcall(function()            
        if readfile then            
            return readfile(fileName)
        end
    end)
            
    if ok and data then            
        return HttpService:JSONDecode(data)
    end            
    return {}            
end            

local function saveData(tbl)            
    if writefile then            
        writefile(fileName, HttpService:JSONEncode(tbl))
    end            
end            

local savedScripts = loadData()            

local gui = Instance.new("ScreenGui", gethui())            
gui.Name = "JJSploitGui"            
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling            
gui.ResetOnSpawn = false            

local frame = Instance.new("Frame", gui)            
frame.ZIndex = 6            
frame.BackgroundColor3 = Color3.fromRGB(255,255,255)            
frame.Size = UDim2.new(0.8,0,0.9,0)            
frame.Position = UDim2.new(0.1,0,0.05,0)            
frame.BackgroundTransparency = 0.5            

local neon = Instance.new("UIStroke", frame)
neon.Thickness = 6
neon.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
neon.LineJoinMode = Enum.LineJoinMode.Round
neon.Color = Color3.fromRGB(135,206,250)

local neonGrad = Instance.new("UIGradient", neon)
neonGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(135,206,250)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,0,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(135,206,250))
}
neonGrad.Rotation = 0

task.spawn(function()
    while true do
        neonGrad.Rotation = (neonGrad.Rotation + 1) % 360
        task.wait(0.01)
    end
end)

local grad = Instance.new("UIGradient", frame)            
grad.Color = ColorSequence.new{            
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50,120,255)),            
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))            
}            
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)            

local tabSel = Instance.new("Frame", frame)            
tabSel.Size = UDim2.new(1,-20,0,40)            
tabSel.Position = UDim2.new(0,10,0,5)            
tabSel.BackgroundTransparency = 1       

local btnTabInfo = Instance.new("TextButton", tabSel)
btnTabInfo.Size = UDim2.new(0.20,-6,1,0)
btnTabInfo.BackgroundColor3 = Color3.fromRGB(24,155,255)
btnTabInfo.BackgroundTransparency = 0.5
btnTabInfo.Text = "INFO"
btnTabInfo.TextSize = 22
btnTabInfo.TextColor3 = Color3.fromRGB(255,255,255)
btnTabInfo.Font = Enum.Font.Roboto
Instance.new("UICorner", btnTabInfo).CornerRadius = UDim.new(0,20)

local btnTab1 = btnTabInfo:Clone()
btnTab1.Parent = tabSel
btnTab1.Position = UDim2.new(0.20,3,0,0)
btnTab1.Text = "LUA EXECUTOR"

local btnTab2 = btnTabInfo:Clone()
btnTab2.Parent = tabSel
btnTab2.Position = UDim2.new(0.40,6,0,0)
btnTab2.Text = "SCRIPT HUB"

local btnTab3 = btnTabInfo:Clone()
btnTab3.Parent = tabSel
btnTab3.Position = UDim2.new(0.60,9,0,0)
btnTab3.Text = "SEARCH"

local btnTabSaved = btnTabInfo:Clone()
btnTabSaved.Parent = tabSel
btnTabSaved.Position = UDim2.new(0.80,12,0,0)
btnTabSaved.Text = "SALVOS"

local tab1 = Instance.new("Frame", frame)
tab1.Size = UDim2.new(1,0,1,-50)
tab1.Position = UDim2.new(0,0,0,50)
tab1.BackgroundTransparency = 1
tab1.Visible = false

local textBox = Instance.new("TextBox", tab1)
textBox.Size = UDim2.new(1,-20,1,-70)
textBox.Position = UDim2.new(0,10,0,0)
textBox.BackgroundTransparency = 0.7
textBox.TextSize = 22
textBox.TextColor3 = Color3.fromRGB(255,255,255)
textBox.MultiLine = true
textBox.ClearTextOnFocus = false
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.Font = Enum.Font.Code
textBox.Text = "--paste your lua script"
textBox.TextWrapped = false
textBox.AutomaticSize = Enum.AutomaticSize.Y
textBox.ClipsDescendants = true
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0,20)

local buttonsFrame = Instance.new("Frame", tab1)
buttonsFrame.Size = UDim2.new(1,-20,0,50)
buttonsFrame.Position = UDim2.new(0,10,1,-60)
buttonsFrame.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", buttonsFrame)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0,10)

local function createBtn(text)
    local b = Instance.new("TextButton", buttonsFrame)
    b.Size = UDim2.new(0,150,1,0)
    b.BackgroundTransparency = 0.3
    b.BackgroundColor3 = Color3.fromRGB(50,120,255)
    b.Text = text
    b.TextSize = 18
    b.Font = Enum.Font.Roboto
    b.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)
    return b
end

local execBtn = createBtn("EXECUTAR")
local copyBtn = createBtn("COPIAR")
local clearBtn = createBtn("LIMPAR")
local saveBtn = createBtn("SALVAR")

execBtn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(textBox.Text)()
    end)
end)

copyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(textBox.Text)
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    textBox.Text = ""
end)

local tabSaved = Instance.new("ScrollingFrame", frame)
tabSaved.Visible = false
tabSaved.Size = UDim2.new(1,-20,1,-55)
tabSaved.Position = UDim2.new(0,10,0,50)
tabSaved.BackgroundTransparency = 1
tabSaved.ScrollBarThickness = 6
Instance.new("UICorner", tabSaved).CornerRadius = UDim.new(0,10)

local savedLayout = Instance.new("UIListLayout", tabSaved)
savedLayout.Padding = UDim.new(0,8)

local function refreshSaved()
    for _,v in pairs(tabSaved:GetChildren()) do
        if v:IsA("Frame") then v:Destroy() end
    end

    for i,data in ipairs(savedScripts) do
        local holder = Instance.new("Frame", tabSaved)
        holder.Size = UDim2.new(1,-10,0,40)
        holder.BackgroundTransparency = 1

        local lay = Instance.new("UIListLayout", holder)
        lay.FillDirection = Enum.FillDirection.Horizontal
        lay.Padding = UDim.new(0,6)

        local name = Instance.new("TextBox", holder)
        name.Size = UDim2.new(0.45,0,1,0)
        name.BackgroundTransparency = 0.3
        name.BackgroundColor3 = Color3.fromRGB(24,155,255)
        name.Text = data.name
        name.TextColor3 = Color3.fromRGB(255,255,255)
        name.TextScaled = true
        Instance.new("UICorner", name).CornerRadius = UDim.new(0,10)

        name.FocusLost:Connect(function()
            data.name = name.Text
            saveData(savedScripts)
        end)

        local exec = Instance.new("TextButton", holder)
        exec.Size = UDim2.new(0.27,0,1,0) -- Aumentado para ocupar espaço do botão removido
        exec.BackgroundColor3 = Color3.fromRGB(0,120,255)
        exec.TextColor3 = Color3.fromRGB(255,255,255)
        exec.Text = "EXECUTAR"
        exec.TextScaled = true
        Instance.new("UICorner", exec).CornerRadius = UDim.new(0,10)

        local del = Instance.new("TextButton", holder)
        del.Size = UDim2.new(0.27,0,1,0) -- Aumentado para ocupar espaço do botão removido
        del.BackgroundColor3 = Color3.fromRGB(200,60,60)
        del.TextColor3 = Color3.fromRGB(255,255,255)
        del.Text = "EXCLUIR"
        del.TextScaled = true
        Instance.new("UICorner", del).CornerRadius = UDim.new(0,10)

        exec.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(data.code)()
            end)
        end)

        del.MouseButton1Click:Connect(function()
            table.remove(savedScripts, i)
            saveData(savedScripts)
            refreshSaved()
        end)
    end
end

saveBtn.MouseButton1Click:Connect(function()
    if textBox.Text ~= "" then
        table.insert(savedScripts, {
            name = "Script salvo "..#savedScripts+1,
            code = textBox.Text
        })
        saveData(savedScripts)
        refreshSaved()
    end
end)

refreshSaved()

local tab2 = Instance.new("ScrollingFrame", frame)
tab2.Visible = false
tab2.Size = UDim2.new(1,-20,1,-55)
tab2.Position = UDim2.new(0,10,0,50)
tab2.BackgroundTransparency = 1
tab2.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)

local templateBtn = Instance.new("TextButton")
templateBtn.Size = UDim2.new(1,0,0,40)
templateBtn.BackgroundColor3 = Color3.fromRGB(24,155,255)
templateBtn.BackgroundTransparency = 0.5
templateBtn.TextColor3 = Color3.fromRGB(255,255,255)
templateBtn.TextSize = 22
templateBtn.Font = Enum.Font.Roboto
Instance.new("UICorner", templateBtn).CornerRadius = UDim.new(0,20)

local scripts = {
    {text="Infinite Jump", url="https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"},
    {text="Noclip", url="https://obj.wearedevs.net/2/scripts/Noclip.lua"},
    {text="TP Gui", url="https://obj.wearedevs.net/210956/scripts/tp%20gui.lua"}
}

for i,v in ipairs(scripts) do
    local btn = templateBtn:Clone()
    btn.Text = v.text
    btn.Position = UDim2.new(0,0,0,(45*(i-1)))
    btn.Parent = tab2
    btn.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(game:HttpGet(v.url))()
        end)
    end)
end

local tab3 = Instance.new("Frame", frame)
tab3.Visible = false
tab3.Size = UDim2.new(1,-20,1,-55)
tab3.Position = UDim2.new(0,10,0,50)
tab3.BackgroundTransparency = 1

local searchBox = Instance.new("TextBox", tab3)
searchBox.Size = UDim2.new(1,-20,0,40)
searchBox.Position = UDim2.new(0,10,0,0)
searchBox.Text = ""
searchBox.PlaceholderText = "Search ScriptBlox"
searchBox.TextSize = 20
searchBox.BackgroundColor3 = Color3.fromRGB(20,20,20)
searchBox.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0,12)

local searchBtn = Instance.new("TextButton", tab3)
searchBtn.Size = UDim2.new(0,150,0,40)
searchBtn.Position = UDim2.new(0,10,0,50)
searchBtn.Text = "SEARCH"
searchBtn.TextSize = 20
searchBtn.BackgroundColor3 = Color3.fromRGB(24,155,255)
searchBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", searchBtn).CornerRadius = UDim.new(0,12)

local results = Instance.new("ScrollingFrame", tab3)
results.Size = UDim2.new(1,-20,1,-100)
results.Position = UDim2.new(0,10,0,100)
results.CanvasSize = UDim2.new(0,0,0,0)
results.ScrollBarThickness = 6
results.BackgroundColor3 = Color3.fromRGB(15,15,15)
results.ScrollingDirection = Enum.ScrollingDirection.Y
results.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UICorner", results).CornerRadius = UDim.new(0,10)

local layout2 = Instance.new("UIListLayout", results)

local function SearchScripts(txt)
    for _,v in pairs(results:GetChildren()) do
        if v:IsA("Frame") then v:Destroy() end
    end

    local ok,response = pcall(function()
        return game:HttpGet("https://scriptblox.com/api/script/search?q="..txt.."&page=1&max=1000")
    end)
    if not ok then return end

    local data = HttpService:JSONDecode(response)
    if not data.result or not data.result.scripts then return end

    for _,info in ipairs(data.result.scripts) do
        local holder = Instance.new("Frame", results)
        holder.Size = UDim2.new(1,-10,0,40)
        holder.BackgroundTransparency = 1

        local lay = Instance.new("UIListLayout", holder)
        lay.FillDirection = Enum.FillDirection.Horizontal
        lay.Padding = UDim.new(0,6)

        local nameBtn = Instance.new("TextButton", holder)
        nameBtn.Size = UDim2.new(0.6,0,1,0)
        nameBtn.BackgroundColor3 = Color3.fromRGB(45,120,255)
        nameBtn.BackgroundTransparency = 0.2
        nameBtn.TextColor3 = Color3.fromRGB(255,255,255)
        nameBtn.Text = info.title
        nameBtn.TextSize = 18
        nameBtn.Font = Enum.Font.Roboto
        nameBtn.TextScaled = true
        nameBtn.TextWrapped = true
        nameBtn.ClipsDescendants = true
        nameBtn.TextXAlignment = Enum.TextXAlignment.Center
        Instance.new("UICorner", nameBtn).CornerRadius = UDim.new(0,8)

        local exec = Instance.new("TextButton", holder)
        exec.Size = UDim2.new(0.2,0,1,0)
        exec.BackgroundColor3 = Color3.fromRGB(0,120,255)
        exec.TextColor3 = Color3.fromRGB(255,255,255)
        exec.Text = "EXECUTAR"
        exec.TextSize = 18
        Instance.new("UICorner", exec).CornerRadius = UDim.new(0,8)

        local edit = Instance.new("TextButton", holder)
        edit.Size = UDim2.new(0.2,0,1,0)
        edit.BackgroundColor3 = Color3.fromRGB(0,120,255)
        edit.TextColor3 = Color3.fromRGB(255,255,255)
        edit.Text = "EDITAR"
        edit.TextSize = 18
        Instance.new("UICorner", edit).CornerRadius = UDim.new(0,8)

        exec.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(info.script)()
            end)
        end)

        edit.MouseButton1Click:Connect(function()
            textBox.Text = info.script
            tab1.Visible = true
            tab2.Visible = false
            tab3.Visible = false
            infoTab.Visible = false
            tabSaved.Visible = false
        end)
    end
end

searchBtn.MouseButton1Click:Connect(function()
    if searchBox.Text ~= "" then
        SearchScripts(searchBox.Text)
    end
end)

local btnOpen = Instance.new("ImageButton", gui)
btnOpen.Name = "btnOpen"
btnOpen.BackgroundTransparency = 1
btnOpen.Image = "rbxassetid://137842439297855"
btnOpen.Size = UDim2.new(0,50,0,50)
btnOpen.Position = UDim2.new(1,-60,0.5,0)
Instance.new("UICorner", btnOpen).CornerRadius = UDim.new(1,0)

local UIS = game:GetService("UserInputService")
local dragging, dragStart, startPos = false

local function update(input)
    local delta = input.Position - dragStart
    btnOpen.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

btnOpen.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = i.Position
        startPos = btnOpen.Position
    end
end)

btnOpen.InputEnded:Connect(function(i)
    dragging = false
end)

UIS.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        update(i)
    end
end)

frame.Visible = false
btnOpen.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

local draggingFrame = false
local dragStartFrame
local startPosFrame

local function updateFrame(input)
    local delta = input.Position - dragStartFrame
    frame.Position = UDim2.new(
        startPosFrame.X.Scale,
        startPosFrame.X.Offset + delta.X,
        startPosFrame.Y.Scale,
        startPosFrame.Y.Offset + delta.Y
    )
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingFrame = true
        dragStartFrame = input.Position
        startPosFrame = frame.Position
    end
end)

frame.InputEnded:Connect(function()
    draggingFrame = false
end)

UIS.InputChanged:Connect(function(input)
    if draggingFrame and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateFrame(input)
    end
end)

local infoTab = Instance.new("Frame", frame)
infoTab.Visible = true
infoTab.Size = UDim2.new(1,-20,1,-55)
infoTab.Position = UDim2.new(0,10,0,50)
infoTab.BackgroundTransparency = 1

local UIListInfo = Instance.new("UIListLayout", infoTab)
UIListInfo.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListInfo.VerticalAlignment = Enum.VerticalAlignment.Center
UIListInfo.Padding = UDim.new(0,8)

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local profileImage = Instance.new("ImageLabel")
profileImage.Parent = infoTab
profileImage.Size = UDim2.new(0, 100, 0, 100)
profileImage.Position = UDim2.new(0.5, -50, 0, -10)
profileImage.BackgroundTransparency = 1
profileImage.ZIndex = 999

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 100)
corner.Parent = profileImage

local content, isReady = Players:GetUserThumbnailAsync(
    localPlayer.UserId,
    Enum.ThumbnailType.HeadShot,
    Enum.ThumbnailSize.Size150x150
)
profileImage.Image = content

local function newInfoLabel(txt)
    local l = Instance.new("TextLabel", infoTab)
    l.Size = UDim2.new(1, -40, 0, 36)
    l.BackgroundTransparency = 0.4
    l.BackgroundColor3 = Color3.fromRGB(24,155,255)
    l.TextColor3 = Color3.fromRGB(255,255,255)
    l.Font = Enum.Font.Roboto
    l.TextSize = 18
    l.Text = txt
    Instance.new("UICorner", l).CornerRadius = UDim.new(0,8)
    return l
end

local fpsLabel = newInfoLabel("FPS: 0")
local pingLabel = newInfoLabel("Ping: 0 ms")
local gameNameLabel = newInfoLabel("Jogo: ...")
local playersLabel = newInfoLabel("Jogadores: ...")
local maxPlayersLabel = newInfoLabel("Máximo no Servidor: ...")

local MarketplaceService = game:GetService("MarketplaceService")
pcall(function()
    local info = MarketplaceService:GetProductInfo(game.PlaceId)
    if info and info.Name then
        gameNameLabel.Text = "Jogo: " .. info.Name
    end
end)

playersLabel.Text = "Jogadores: " .. #game.Players:GetPlayers()
maxPlayersLabel.Text = "Máximo no Servidor: " .. tostring(game.Players.MaxPlayers)

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local lastTick = tick()

RunService.Heartbeat:Connect(function()
    local now = tick()
    local dt = now - lastTick
    if dt > 0 then
        local fps = math.floor(1 / dt)
        fpsLabel.Text = "FPS: " .. fps
    end
    lastTick = now

    local ok, pingVal = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if ok and pingVal then
        pingLabel.Text = "Ping: " .. math.floor(pingVal) .. " ms"
    else
        pingLabel.Text = "Ping: N/A"
    end

    playersLabel.Text = "Jogadores: " .. #game.Players:GetPlayers()
end)

btnTabInfo.MouseButton1Click:Connect(function()
    infoTab.Visible = true
    tab1.Visible = false
    tab2.Visible = false
    tab3.Visible = false
    tabSaved.Visible = false
end)

btnTab1.MouseButton1Click:Connect(function()
    infoTab.Visible = false
    tab1.Visible = true
    tab2.Visible = false
    tab3.Visible = false
    tabSaved.Visible = false
end)

btnTab2.MouseButton1Click:Connect(function()
    infoTab.Visible = false
    tab1.Visible = false
    tab2.Visible = true
    tab3.Visible = false
    tabSaved.Visible = false
end)

btnTab3.MouseButton1Click:Connect(function()
    infoTab.Visible = false
    tab1.Visible = false
    tab2.Visible = false
    tab3.Visible = true
    tabSaved.Visible = false
end)

btnTabSaved.MouseButton1Click:Connect(function()
    infoTab.Visible = false
    tab1.Visible = false
    tab2.Visible = false
    tab3.Visible = false
    tabSaved.Visible = true
end)

infoTab.Visible = true
tab1.Visible = false
tab2.Visible = false
tab3.Visible = false
tabSaved.Visible = false