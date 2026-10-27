

-- This file was protected using Vortex Obfuscator [ClydeProtection]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")










local Library = {
    Elements = {},
    ThemeObjects = {},
    Connections = {},
    Flags = {},
    SearchRegistry = {},
    Themes = {
        Default = {
            Main = Color3.fromRGB(20, 20, 22),
            Second = Color3.fromRGB(30, 30, 32),
            Stroke = Color3.fromRGB(60, 60, 65),
            Divider = Color3.fromRGB(40, 40, 45),
            Text = Color3.fromRGB(240, 240, 245),
            TextDark = Color3.fromRGB(160, 160, 165),
            MainTransparency = 0.1,
            SecondTransparency = 0.15,
            FrameTransparency = 0.2
        }
    },
    SelectedTheme = "Default",
    Font = Enum.Font.Gotham
}

local ConfigFolder, ConfigPath, SaveEnabled = nil, nil, false

local function SaveConfig()
    if not SaveEnabled or not ConfigPath then return end
    local toSave = {}
    for flagName, element in pairs(Library.Flags) do
        if element and element.Value ~= nil then
            toSave[flagName] = element.Value
        end
    end
    pcall(function()
        writefile(ConfigPath, HttpService:JSONEncode(toSave))
    end)
end

local function LoadConfig()
    if not ConfigPath then return end
    local raw
    pcall(function()
        raw = readfile(ConfigPath)
    end)
    if raw then
        pcall(function()
            local loaded = HttpService:JSONDecode(raw)
            for flagName, value in pairs(loaded) do
                if Library.Flags[flagName] and Library.Flags[flagName].Set then
                    Library.Flags[flagName]:Set(value)
                end
            end
        end)
    end
end

local function GetIcon(IconName)
    return nil
end

function Library:CleanupInstance()
    for _, instance in pairs(game:GetService("CoreGui"):GetChildren()) do
        if instance:IsA("ScreenGui") and instance.Name:match("^[A-Z]%d%d%d$") then
            instance:Destroy()
        end
    end
end

Library:CleanupInstance()
local Container = Instance.new("ScreenGui")
Container.Name = string.char(math.random(65, 90))..tostring(math.random(100, 999))
Container.DisplayOrder = 2147483647
Container.Parent = game:GetService("CoreGui")

function Library:IsRunning()
    return Container and Container.Parent == game:GetService("CoreGui")
end

local function AddConnection(Signal, Function)
    if (not Library:IsRunning()) then return end
    local SignalConnect = Signal:Connect(Function)
    table.insert(Library.Connections, SignalConnect)
    return SignalConnect
end

task.spawn(function()
    while (Library:IsRunning()) do wait() end
    for _, Connection in next, Library.Connections do Connection:Disconnect() end
end)

local function MakeDraggable(DragPoint, Main)
    local IsResizing = false
    pcall(function()
        local Dragging, DragInput, MousePos, FramePos = false
        DragPoint.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                if not IsResizing then
                    Dragging = true
                    MousePos = Input.Position
                    FramePos = Main.Position
                end
                Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then Dragging = false end
                end)
            end
        end)
        DragPoint.InputChanged:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                DragInput = Input
            end
        end)
        UserInputService.InputChanged:Connect(function(Input)
            if Input == DragInput and Dragging and not IsResizing then
                local Delta = Input.Position - MousePos
                TweenService:Create(Main, TweenInfo.new(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
                }):Play()
            end
        end)
    end)
    return function(resizing)
        IsResizing = resizing
        if resizing then Dragging = false end
    end
end

local function MakeResizable(ResizeButton, Main, MinSize, MaxSize, SetResizingCallback)
end

local function Create(Name, Properties, Children)
    local Object = Instance.new(Name)
    for i, v in next, Properties or {} do Object[i] = v end
    for i, v in next, Children or {} do v.Parent = Object end
    return Object
end

local function CreateElement(ElementName, ElementFunction)
    Library.Elements[ElementName] = function(...) return ElementFunction(...) end
end

local function MakeElement(ElementName, ...)
    return Library.Elements[ElementName](...)
end

local function SetProps(Element, Props)
    table.foreach(Props, function(Property, Value) Element[Property] = Value end)
    return Element
end

local function SetChildren(Element, Children)
    table.foreach(Children, function(_, Child) Child.Parent = Element end)
    return Element
end

local function Round(Number, Factor)
    local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
    if Result < 0 then Result = Result + Factor end
    return Result
end

local function ReturnProperty(Object)
    if Object:IsA("Frame") or Object:IsA("TextButton") then return "BackgroundColor3" end
    if Object:IsA("ScrollingFrame") then return "ScrollBarImageColor3" end
    if Object:IsA("UIStroke") then return "Color" end
    if Object:IsA("TextLabel") or Object:IsA("TextBox") then return "TextColor3" end
    if Object:IsA("ImageLabel") or Object:IsA("ImageButton") then return "ImageColor3" end
end

local function AddThemeObject(Object, Type)
    if not Library.ThemeObjects[Type] then Library.ThemeObjects[Type] = {} end
    table.insert(Library.ThemeObjects[Type], Object)
    Object[ReturnProperty(Object)] = Library.Themes[Library.SelectedTheme][Type]
    return Object
end

local function SetTheme()
    for Name, Type in pairs(Library.ThemeObjects) do
        for _, Object in pairs(Type) do
            Object[ReturnProperty(Object)] = Library.Themes[Library.SelectedTheme][Name]
        end
    end
end

local WhitelistedMouse = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3, Enum.UserInputType.Touch}
local BlacklistedKeys = {Enum.KeyCode.Unknown, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Up, Enum.KeyCode.Left, Enum.KeyCode.Down, Enum.KeyCode.Right, Enum.KeyCode.Slash, Enum.KeyCode.Tab, Enum.KeyCode.Backspace, Enum.KeyCode.Escape}

local function CheckKey(Table, Key)
    for _, v in next, Table do if v == Key then return true end end
end

local TypeBadgeColors = {
    Toggle      = Color3.fromRGB(255, 216, 145),
    Button      = Color3.fromRGB(200, 120, 60),
    Slider      = Color3.fromRGB(9, 149, 98),
    Dropdown    = Color3.fromRGB(160, 80, 200),
    Bind        = Color3.fromRGB(220, 180, 40),
    Colorpicker = Color3.fromRGB(220, 80, 120),
    Textbox     = Color3.fromRGB(80, 160, 220),
    Tab         = Color3.fromRGB(255, 216, 145),
}

local TypeBadgeLabels = {
    Toggle      = "TOG",
    Button      = "BTN",
    Slider      = "SLD",
    Dropdown    = "DROP",
    Bind        = "BIND",
    Colorpicker = "CLR",
    Textbox     = "TXT",
    Tab         = "TAB",
}

CreateElement("Corner", function(Scale, Offset)
    return Create("UICorner", {CornerRadius = UDim.new(Scale or 0, Offset or 12)})
end)
CreateElement("Stroke", function(Color, Thickness)
    return Create("UIStroke", {Color = Color or Color3.fromRGB(255,255,255), Thickness = Thickness or 0.5})
end)
CreateElement("List", function(Scale, Offset)
    return Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(Scale or 0, Offset or 0)})
end)
CreateElement("Padding", function(Bottom, Left, Right, Top)
    return Create("UIPadding", {
        PaddingBottom = UDim.new(0, Bottom or 4),
        PaddingLeft   = UDim.new(0, Left   or 4),
        PaddingRight  = UDim.new(0, Right  or 4),
        PaddingTop    = UDim.new(0, Top    or 4)
    })
end)
CreateElement("TFrame", function()
    return Create("Frame", {BackgroundTransparency = 1})
end)
CreateElement("Frame", function(Color)
    return Create("Frame", {BackgroundColor3 = Color or Color3.fromRGB(255,255,255), BorderSizePixel = 0})
end)
CreateElement("RoundFrame", function(Color, Scale, Offset)
    return Create("Frame", {BackgroundColor3 = Color or Color3.fromRGB(255,255,255), BorderSizePixel = 0}, {
        Create("UICorner", {CornerRadius = UDim.new(Scale, Offset)})
    })
end)
CreateElement("Button", function()
    local Button = Create("TextButton", {Text = "", AutoButtonColor = false, BackgroundTransparency = 1, BorderSizePixel = 0})
    Button.MouseButton1Click:Connect(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://6895079853"
        sound.Volume = 0.5
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 1)
    end)
    return Button
end)
CreateElement("ScrollFrame", function(Color, Width)
    return Create("ScrollingFrame", {
        BackgroundTransparency = 1,
        MidImage = "rbxassetid://7445543667",
        BottomImage = "rbxassetid://7445543667",
        TopImage = "rbxassetid://7445543667",
        ScrollBarImageColor3 = Color,
        BorderSizePixel = 0,
        ScrollBarThickness = Width,
        CanvasSize = UDim2.new(0,0,0,0)
    })
end)
CreateElement("Image", function(ImageID)
    local ImageNew = Create("ImageLabel", {Image = ImageID, BackgroundTransparency = 1})
    if GetIcon(ImageID) ~= nil then ImageNew.Image = GetIcon(ImageID) end
    return ImageNew
end)
CreateElement("ImageButton", function(ImageID)
    return Create("ImageButton", {Image = ImageID, BackgroundTransparency = 1})
end)
CreateElement("Label", function(Text, TextSize, Transparency)
    return Create("TextLabel", {
        Text = Text or "",
        TextColor3 = Color3.fromRGB(240,240,240),
        TextTransparency = Transparency or 0,
        TextSize = TextSize or 15,
        Font = Enum.Font.GothamSemibold,
        RichText = true,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left
    })
end)

local NotificationHolder = SetProps(SetChildren(MakeElement("TFrame"), {
    SetProps(MakeElement("List"), {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        Padding = UDim.new(0, 5)
    })
}), {
    Position = UDim2.new(1, -25, 1, -25),
    Size = UDim2.new(0, 300, 1, -25),
    AnchorPoint = Vector2.new(1, 1),
    Parent = Container
})

function Library:MakeNotification(NotificationConfig)
    spawn(function()
        NotificationConfig.Name    = NotificationConfig.Name    or "Notification"
        NotificationConfig.Content = NotificationConfig.Content or "Test"
        NotificationConfig.Image   = NotificationConfig.Image   or "rbxassetid://4384403532"
        NotificationConfig.Time    = NotificationConfig.Time    or 15

        local NotificationParent = SetProps(MakeElement("TFrame"), {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Parent = NotificationHolder
        })

        local NotificationFrame = SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(25,25,25), 0, 10), {
            Parent = NotificationParent,
            Size = UDim2.new(1, 0, 0, 0),
            Position = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 0.15,
            AutomaticSize = Enum.AutomaticSize.Y
        }), {
            MakeElement("Stroke", Color3.fromRGB(93,93,93), 1.2),
            MakeElement("Padding", 12, 12, 12, 12),
            SetProps(MakeElement("Image", NotificationConfig.Image), {
                Size = UDim2.new(0, 20, 0, 20),
                ImageColor3 = Color3.fromRGB(240,240,240),
                Name = "Icon"
            }),
            SetProps(MakeElement("Label", NotificationConfig.Name, 15), {
                Size = UDim2.new(1, -30, 0, 20),
                Position = UDim2.new(0, 30, 0, 0),
                Font = Enum.Font.FredokaOne,
                Name = "Title"
            }),
            SetProps(MakeElement("Label", NotificationConfig.Content, 14), {
                Size = UDim2.new(1, 0, 0, 0),
                Position = UDim2.new(0, 0, 0, 25),
                Font = Enum.Font.FredokaOne,
                Name = "Content",
                AutomaticSize = Enum.AutomaticSize.Y,
                TextColor3 = Color3.fromRGB(200,200,200),
                TextWrapped = true
            })
        })

        TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0,0,0,0)}):Play()
        wait(NotificationConfig.Time)
        TweenService:Create(NotificationFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(1,0,0,0)}):Play()
        wait(0.8)
        NotificationParent:Destroy()
    end)
end

function Library:MakeWindow(WindowConfig)
    local FirstTab = true
    local Minimized = false
    local UIHidden = false

    WindowConfig = WindowConfig or {}
    WindowConfig.Name            = WindowConfig.Name            or "ORVΞX"
    WindowConfig.HidePremium     = WindowConfig.HidePremium     or false
    if WindowConfig.IntroEnabled == nil then WindowConfig.IntroEnabled = true end
    WindowConfig.IntroToggleIcon = WindowConfig.IntroToggleIcon or "rbxassetid://4483345998"
    WindowConfig.IntroText       = WindowConfig.IntroText       or "Starting ORVΞX"
    WindowConfig.CloseCallback   = WindowConfig.CloseCallback   or function() end
    WindowConfig.ShowIcon        = WindowConfig.ShowIcon        or false
    WindowConfig.Icon            = WindowConfig.Icon            or "rbxassetid://4483345998"
    WindowConfig.IntroIcon       = WindowConfig.IntroIcon       or "rbxassetid://4483345998"

    if WindowConfig.SaveConfig and WindowConfig.ConfigFolder then
        ConfigFolder = WindowConfig.ConfigFolder
        ConfigPath = ConfigFolder .. "/" .. tostring(game.PlaceId) .. ".json"
        SaveEnabled = true
    end

    local TabHolder = AddThemeObject(SetChildren(SetProps(MakeElement("ScrollFrame", Color3.fromRGB(255,255,255), 4), {
        Size = UDim2.new(1, 0, 1, -50)
    }), {
        MakeElement("List"),
        MakeElement("Padding", 8, 0, 0, 8)
    }), "Divider")

    AddConnection(TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolder.UIListLayout.AbsoluteContentSize.Y + 16)
    end)

    local MinimizeBtn = SetChildren(SetProps(MakeElement("Button"), {
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }), {
        AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://7072719338"), {
            Position = UDim2.new(0, 9, 0, 6),
            Size = UDim2.new(0, 18, 0, 18),
            Name = "Ico"
        }), "Text")
    })

    local CloseBtn = SetChildren(SetProps(MakeElement("Button"), {
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        BackgroundTransparency = 1
    }), {
        AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://7072725342"), {
            Position = UDim2.new(0, 9, 0, 6),
            Size = UDim2.new(0, 18, 0, 18)
        }), "Text")
    })

    local DragPoint = SetProps(MakeElement("TFrame"), {Size = UDim2.new(1, 0, 0, 50)})

    local WindowStuff = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 10), {
        Size = UDim2.new(0, 150, 1, -50),
        Position = UDim2.new(0, 0, 0, 50),
        BackgroundTransparency = 0.15
    }), {
        AddThemeObject(SetProps(MakeElement("Frame"), {Size = UDim2.new(1,0,0,10), Position = UDim2.new(0,0,0,0), BackgroundTransparency = 0.15}), "Second"),
        AddThemeObject(SetProps(MakeElement("Frame"), {Size = UDim2.new(0,10,1,0), Position = UDim2.new(1,-10,0,0), BackgroundTransparency = 0.15}), "Second"),
        AddThemeObject(SetProps(MakeElement("Frame"), {Size = UDim2.new(0,1,1,0), Position = UDim2.new(1,-1,0,0)}), "Stroke"),
        TabHolder,
        SetChildren(SetProps(MakeElement("TFrame"), {Size = UDim2.new(1,0,0,50), Position = UDim2.new(0,0,1,-50)}), {
            AddThemeObject(SetProps(MakeElement("Frame"), {Size = UDim2.new(1,0,0,1)}), "Stroke"),
            AddThemeObject(SetChildren(SetProps(MakeElement("Frame"), {
                AnchorPoint = Vector2.new(0,0.5),
                Size = UDim2.new(0,32,0,32),
                Position = UDim2.new(0,10,0.5,0),
                BackgroundTransparency = 0.2
            }), {
                SetProps(MakeElement("Image", "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=420&height=420&format=png"), {Size = UDim2.new(1,0,1,0)}),
                AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://4031889928"), {Size = UDim2.new(1,0,1,0)}), "Second"),
                MakeElement("Corner", 1)
            }), "Divider"),
            SetChildren(SetProps(MakeElement("TFrame"), {
                AnchorPoint = Vector2.new(0,0.5),
                Size = UDim2.new(0,32,0,32),
                Position = UDim2.new(0,10,0.5,0)
            }), {
                AddThemeObject(MakeElement("Stroke"), "Stroke"),
                MakeElement("Corner", 1)
            }),
            AddThemeObject(SetProps(MakeElement("Label", "ORVEX", WindowConfig.HidePremium and 14 or 13), {
                Size = UDim2.new(1,-60,0,13),
                Position = WindowConfig.HidePremium and UDim2.new(0,50,0,19) or UDim2.new(0,50,0,12),
                Font = Enum.Font.FredokaOne,
                ClipsDescendants = true
            }), "Text"),
            SetProps(MakeElement("Label", ".gg/WzS5JfAx8C", 12), {
                Size = UDim2.new(1,-60,0,12),
                Position = UDim2.new(0,50,1,-25),
                Visible = not WindowConfig.HidePremium,
                TextColor3 = Color3.fromRGB(255, 216, 145)
            })
        }),
    }), "Second")

    local WindowName = AddThemeObject(SetProps(MakeElement("Label", WindowConfig.Name, 14), {
        Size = UDim2.new(1,-30,2,0),
        Position = UDim2.new(0,20,0,-24),
        Font = Enum.Font.GothamBlack,
        TextSize = 20
    }), "Text")

    local WindowTopBarLine = AddThemeObject(SetProps(MakeElement("Frame"), {
        Size = UDim2.new(1,0,0,1),
        Position = UDim2.new(0,0,1,-1)
    }), "Stroke")

    local MainWindow = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 10), {
        Parent = Container,
        Position = UDim2.new(0.5,-307,0.5,-172),
        Size = UDim2.new(0,615,0,344),
        ClipsDescendants = true,
        BackgroundTransparency = 0.1
    }), {
        SetChildren(SetProps(MakeElement("TFrame"), {Size = UDim2.new(1,0,0,50), Name = "TopBar"}), {
            WindowName,
            WindowTopBarLine,
            AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 7), {
                Size = UDim2.new(0,70,0,30),
                Position = UDim2.new(1,-100,0,10),
                BackgroundTransparency = 0.15
            }), {
                AddThemeObject(MakeElement("Stroke"), "Stroke"),
                AddThemeObject(SetProps(MakeElement("Frame"), {Size = UDim2.new(0,1,1,0), Position = UDim2.new(0.5,0,0,0)}), "Stroke"),
                MinimizeBtn,
                CloseBtn
            }), "Second"),
        }),
        DragPoint,
        WindowStuff
    }), "Main")

    local SetResizingCallback = MakeDraggable(DragPoint, MainWindow)

    local MobileReopenButton = SetChildren(SetProps(MakeElement("Button"), {
        Parent = Container,
        Size = UDim2.new(0,40,0,40),
        Position = UDim2.new(0.5,-20,0,20),
        BackgroundTransparency = 0.2,
        BackgroundColor3 = Library.Themes[Library.SelectedTheme].Main,
        Visible = false
    }), {
        AddThemeObject(SetProps(MakeElement("Image", WindowConfig.IntroToggleIcon or "http://www.roblox.com/asset/?id=8834748103"), {
            AnchorPoint = Vector2.new(0.5,0.5),
            Position = UDim2.new(0.5,0,0.5,0),
            Size = UDim2.new(0.7,0,0.7,0),
        }), "Text"),
        MakeElement("Corner", 1)
    })

    AddConnection(CloseBtn.MouseButton1Up, function()
        MainWindow.Visible = false
        if UserInputService.TouchEnabled then MobileReopenButton.Visible = true end
        UIHidden = true
        Library:MakeNotification({
            Name = "Interface Hidden",
            Content = UserInputService.TouchEnabled and "Tap the button or Right Shift to reopen the interface" or "Press Right Shift to reopen the interface",
            Time = 5
        })
        WindowConfig.CloseCallback()
    end)

    AddConnection(UserInputService.InputBegan, function(Input)
        if Input.KeyCode == Enum.KeyCode.RightShift and UIHidden == true then
            MainWindow.Visible = true
            MobileReopenButton.Visible = false
        end
    end)

    AddConnection(MobileReopenButton.Activated, function()
        MainWindow.Visible = true
        MobileReopenButton.Visible = false
    end)

    AddConnection(MinimizeBtn.MouseButton1Up, function()
        if Minimized then
            TweenService:Create(MainWindow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,615,0,344)}):Play()
            MinimizeBtn.Ico.Image = "rbxassetid://7072719338"
            wait(.02)
            MainWindow.ClipsDescendants = false
            WindowStuff.Visible = true
            WindowTopBarLine.Visible = true
        else
            MainWindow.ClipsDescendants = true
            WindowTopBarLine.Visible = false
            MinimizeBtn.Ico.Image = "rbxassetid://7072720870"
            TweenService:Create(MainWindow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, WindowName.TextBounds.X + 140, 0, 50)}):Play()
            wait(0.1)
            WindowStuff.Visible = false
        end
        Minimized = not Minimized
    end)

    local function LoadSequence()
        MainWindow.Visible = false
        local LoadSequenceLogo = SetProps(MakeElement("Image", WindowConfig.IntroIcon), {
            Parent = Container,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.4, 0),
            Size = UDim2.new(0, 28, 0, 28),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = 1
        })
        local LoadSequenceText = SetProps(MakeElement("Label", WindowConfig.IntroText, 14), {
            Parent = Container,
            Size = UDim2.new(1, 0, 1, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 19, 0.5, 0),
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.GothamBold,
            TextTransparency = 1
        })
        local ProgressBG = Create("Frame", {
            Parent = Container,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0.5, 30),
            Size = UDim2.new(0, 220, 0, 4),
            BackgroundColor3 = Color3.fromRGB(50, 50, 55),
            BorderSizePixel = 0,
            BackgroundTransparency = 0.3
        })
        Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ProgressBG})
        local ProgressFill = Create("Frame", {
            Parent = ProgressBG,
            Size = UDim2.new(0, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 202, 112),
            BorderSizePixel = 0
        })
        Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ProgressFill})
        local ProgressGlow = Create("Frame", {
            Parent = ProgressFill,
            Size = UDim2.new(0, 30, 1, 0),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            BackgroundColor3 = Color3.fromRGB(255, 226, 173),
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0
        })
        Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ProgressGlow})
        local ProgressLabel = Create("TextLabel", {
            Parent = Container,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0.5, 40),
            Size = UDim2.new(0, 220, 0, 16),
            BackgroundTransparency = 1,
            Text = "0%",
            TextColor3 = Color3.fromRGB(255, 216, 145),
            TextSize = 11,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Center
        })

        TweenService:Create(LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ImageTransparency = 0,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.8)
        TweenService:Create(LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -(LoadSequenceText.TextBounds.X / 2), 0.5, 0)
        }):Play()
        wait(0.3)
        TweenService:Create(LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0
        }):Play()

        local duration  = 1
        local steps     = 100
        local stepTime  = duration / steps
        for i = 1, steps do
            local pct = i / steps
            TweenService:Create(ProgressFill, TweenInfo.new(stepTime * 1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(pct, 0, 1, 0)
            }):Play()
            ProgressLabel.Text = tostring(math.floor(pct * 100)) .. "%"
            if i == steps then
                TweenService:Create(ProgressFill, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(9, 200, 130)
                }):Play()
                TweenService:Create(ProgressLabel, TweenInfo.new(0.3), {
                    TextColor3 = Color3.fromRGB(9, 200, 130)
                }):Play()
                ProgressLabel.Text = "100%"
            end
            wait(stepTime)
        end
        wait(0.3)
        TweenService:Create(LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        TweenService:Create(ProgressLabel,    TweenInfo.new(.3), {TextTransparency = 1}):Play()
        TweenService:Create(ProgressBG,       TweenInfo.new(.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(ProgressFill,     TweenInfo.new(.3), {BackgroundTransparency = 1}):Play()
        wait(0.35)
        MainWindow.Visible = true
        LoadSequenceLogo:Destroy()
        LoadSequenceText:Destroy()
        ProgressBG:Destroy()
        ProgressLabel:Destroy()
    end

    if WindowConfig.IntroEnabled then LoadSequence() end

    local tabFrameToContainer = {}

    local function BuildTab(TabConfig, ParentHolder)
        TabConfig = TabConfig or {}
        TabConfig.Name        = TabConfig.Name        or "Tab"
        TabConfig.Icon        = TabConfig.Icon        or ""
        TabConfig.PremiumOnly = TabConfig.PremiumOnly or false

        local TabFrame = SetChildren(SetProps(MakeElement("Button"), {
            Size = UDim2.new(1, 0, 0, 30),
            Parent = ParentHolder
        }), {
            AddThemeObject(SetProps(MakeElement("Image", TabConfig.Icon), {
                AnchorPoint = Vector2.new(0, 0.5),
                Size = UDim2.new(0,18,0,18),
                Position = UDim2.new(0,10,0.5,0),
                ImageTransparency = 0.4,
                Name = "Ico"
            }), "Text"),
            AddThemeObject(SetProps(MakeElement("Label", TabConfig.Name, 14), {
                Size = UDim2.new(1,-35,1,0),
                Position = UDim2.new(0,35,0,0),
                Font = Enum.Font.GothamBlack,
                TextTransparency = 0.4,
                Name = "Title"
            }), "Text")
        })

        if GetIcon(TabConfig.Icon) ~= nil then TabFrame.Ico.Image = GetIcon(TabConfig.Icon) end

        local TabItemContainer = AddThemeObject(SetChildren(SetProps(MakeElement("ScrollFrame", Color3.fromRGB(255,255,255), 5), {
            Size = UDim2.new(1,-150,1,-50),
            Position = UDim2.new(0,150,0,50),
            Parent = MainWindow,
            Visible = false,
            Name = "ItemContainer"
        }), {
            MakeElement("List", 0, 6),
            MakeElement("Padding", 15, 10, 10, 15)
        }), "Divider")

        tabFrameToContainer[TabFrame] = TabItemContainer

        AddConnection(TabItemContainer.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
            TabItemContainer.CanvasSize = UDim2.new(0, 0, 0, TabItemContainer.UIListLayout.AbsoluteContentSize.Y + 30)
        end)

        if FirstTab then
            FirstTab = false
            TabFrame.Ico.ImageTransparency = 0
            TabFrame.Title.TextTransparency = 0
            TabFrame.Title.Font = Enum.Font.GothamBlack
            TabFrame.Ico.ImageColor3 = Color3.fromRGB(255, 216, 145)
            TabFrame.Title.TextColor3 = Color3.fromRGB(255, 216, 145)
            TabItemContainer.Visible = true
        end

        AddConnection(TabFrame.MouseButton1Click, function()
            local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
            for _, Tab in next, TabHolder:GetChildren() do
                if Tab:IsA("TextButton") and Tab:FindFirstChild("Ico") and Tab:FindFirstChild("Title") then
                    Tab.Title.Font = Enum.Font.GothamBlack
                    TweenService:Create(Tab.Ico,   TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.4, ImageColor3 = Color3.fromRGB(240,240,240)}):Play()
                    TweenService:Create(Tab.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency  = 0.4, TextColor3  = Color3.fromRGB(240,240,240)}):Play()
                end
            end
            for _, ItemContainer in next, MainWindow:GetChildren() do
                if ItemContainer.Name == "ItemContainer" then ItemContainer.Visible = false end
            end
            TweenService:Create(TabFrame.Ico,   TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(255, 216, 145)}):Play()
            TweenService:Create(TabFrame.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency  = 0, TextColor3  = Color3.fromRGB(255, 216, 145)}):Play()
            TabFrame.Title.Font = Enum.Font.GothamBlack
            TabItemContainer.Visible = true
        end)

        local function GetElements(ItemParent)
            local ElementFunction = {}

            local function AutoRegister(name, elementType, frame)
                table.insert(Library.SearchRegistry, {
                    label       = tostring(name):lower(),
                    display     = tostring(name),
                    elementType = elementType,
                    tabName     = TabConfig.Name,
                    tabBtn      = TabFrame,
                    container   = TabItemContainer,
                    frame       = frame,
                })
            end

            function ElementFunction:AddLabel(Text)
                local LabelFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,30),
                    BackgroundTransparency = 0.2,
                    Parent = ItemParent
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", Text, 15), {
                        Size = UDim2.new(1,-12,1,0),
                        Position = UDim2.new(0,12,0,0),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content"
                    }), "Text"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke")
                }), "Second")
                local LabelFunction = {}
                function LabelFunction:Set(ToChange)
                    if LabelFrame:FindFirstChild("Content") then LabelFrame.Content.Text = ToChange end
                end
                return LabelFunction
            end

            function ElementFunction:AddParagraph(Text, Content)
                Text    = Text    or "Text"
                Content = Content or "Content"
                local ParagraphFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,30),
                    BackgroundTransparency = 0.2,
                    Parent = ItemParent
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", Text, 15), {
                        Size = UDim2.new(1,-12,0,14),
                        Position = UDim2.new(0,12,0,10),
                        Font = Enum.Font.FredokaOne,
                        Name = "Title"
                    }), "Text"),
                    AddThemeObject(SetProps(MakeElement("Label", "", 13), {
                        Size = UDim2.new(1,-24,0,0),
                        Position = UDim2.new(0,12,0,26),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content",
                        TextWrapped = true
                    }), "TextDark"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke")
                }), "Second")
                AddConnection(ParagraphFrame.Content:GetPropertyChangedSignal("Text"), function()
                    ParagraphFrame.Content.Size = UDim2.new(1,-24,0,ParagraphFrame.Content.TextBounds.Y)
                    ParagraphFrame.Size = UDim2.new(1,0,0,ParagraphFrame.Content.TextBounds.Y + 35)
                end)
                ParagraphFrame.Content.Text = Content
                local ParagraphFunction = {}
                function ParagraphFunction:Set(ToChange) ParagraphFrame.Content.Text = ToChange end
                return ParagraphFunction
            end

            function ElementFunction:AddButton(ButtonConfig)
                ButtonConfig = ButtonConfig or {}
                ButtonConfig.Name     = ButtonConfig.Name     or "Button"
                ButtonConfig.Callback = ButtonConfig.Callback or function() end
                ButtonConfig.Icon     = ButtonConfig.Icon     or "rbxassetid://3944703587"
                local Button = {}
                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1,0,1,0)})
                local ButtonFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,33),
                    Parent = ItemParent,
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", ButtonConfig.Name, 15), {
                        Size = UDim2.new(1,-12,1,0),
                        Position = UDim2.new(0,12,0,0),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content"
                    }), "Text"),
                    AddThemeObject(SetProps(MakeElement("Image", ButtonConfig.Icon), {
                        Size = UDim2.new(0,20,0,20),
                        Position = UDim2.new(1,-30,0,7),
                    }), "TextDark"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    Click
                }), "Second")
                AddConnection(Click.MouseEnter,      function() TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play() end)
                AddConnection(Click.MouseLeave,      function() TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Library.Themes[Library.SelectedTheme].Second}):Play() end)
                AddConnection(Click.MouseButton1Up,  function()
                    local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
                    TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play()
                    spawn(function() ButtonConfig.Callback() end)
                end)
                AddConnection(Click.MouseButton1Down, function() TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+6, Library.Themes[Library.SelectedTheme].Second.G*255+6, Library.Themes[Library.SelectedTheme].Second.B*255+6)}):Play() end)
                function Button:Set(ButtonText) ButtonFrame.Content.Text = ButtonText end
                AutoRegister(ButtonConfig.Name, "Button", ButtonFrame)
                return Button
            end

            function ElementFunction:AddToggle(ToggleConfig)
                ToggleConfig = ToggleConfig or {}
                ToggleConfig.Name     = ToggleConfig.Name     or "Toggle"
                ToggleConfig.Default  = ToggleConfig.Default  or false
                ToggleConfig.Callback = ToggleConfig.Callback or function() end
                ToggleConfig.Color    = ToggleConfig.Color    or Color3.fromRGB(255, 216, 145)
                ToggleConfig.Flag     = ToggleConfig.Flag     or nil

                local Toggle = {Value = ToggleConfig.Default}
                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1,0,1,0)})
                local ToggleBox = SetChildren(SetProps(MakeElement("RoundFrame", ToggleConfig.Color, 0, 4), {
                    Size = UDim2.new(0,24,0,24),
                    Position = UDim2.new(1,-24,0.5,0),
                    AnchorPoint = Vector2.new(0.5,0.5),
                    BackgroundTransparency = 0.2
                }), {
                    SetProps(MakeElement("Stroke"), {Color = ToggleConfig.Color, Name = "Stroke", Transparency = 0.7, Thickness = 1}),
                    SetProps(MakeElement("Image", "rbxassetid://3944680095"), {
                        Size = UDim2.new(0,20,0,20),
                        AnchorPoint = Vector2.new(0.5,0.5),
                        Position = UDim2.new(0.5,0,0.5,0),
                        ImageColor3 = Color3.fromRGB(255,255,255),
                        Name = "Ico"
                    }),
                })
                local ToggleFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,38),
                    Parent = ItemParent,
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", ToggleConfig.Name, 15), {
                        Size = UDim2.new(1,-12,1,0),
                        Position = UDim2.new(0,12,0,0),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content"
                    }), "Text"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    ToggleBox,
                    Click
                }), "Second")

                function Toggle:Set(Value)
                    Toggle.Value = Value
                    TweenService:Create(ToggleBox,        TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Toggle.Value and ToggleConfig.Color or Library.Themes.Default.Divider}):Play()
                    TweenService:Create(ToggleBox.Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color            = Toggle.Value and ToggleConfig.Color or Library.Themes.Default.Stroke}):Play()
                    TweenService:Create(ToggleBox.Ico,    TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = Toggle.Value and 0 or 1, Size = Toggle.Value and UDim2.new(0,20,0,20) or UDim2.new(0,8,0,8)}):Play()
                    ToggleConfig.Callback(Toggle.Value)
                end

                Toggle:Set(Toggle.Value)
                AddConnection(Click.MouseEnter,       function() TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play() end)
                AddConnection(Click.MouseLeave,       function() TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Library.Themes[Library.SelectedTheme].Second}):Play() end)
                AddConnection(Click.MouseButton1Up,   function()
                    local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
                    TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play()
                    Toggle:Set(not Toggle.Value)
                end)
                AddConnection(Click.MouseButton1Down, function() TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+6, Library.Themes[Library.SelectedTheme].Second.G*255+6, Library.Themes[Library.SelectedTheme].Second.B*255+6)}):Play() end)

                if ToggleConfig.Flag then Library.Flags[ToggleConfig.Flag] = Toggle end
                AutoRegister(ToggleConfig.Name, "Toggle", ToggleFrame)

                if ToggleConfig.Flag then
                    local oldSet = Toggle.Set
                    Toggle.Set = function(self, value)
                        oldSet(self, value)
                        SaveConfig()
                    end
                end

                return Toggle
            end

            function ElementFunction:AddSlider(SliderConfig)
                SliderConfig = SliderConfig or {}
                SliderConfig.Name      = SliderConfig.Name      or "Slider"
                SliderConfig.Min       = SliderConfig.Min       or 0
                SliderConfig.Max       = SliderConfig.Max       or 100
                SliderConfig.Increment = SliderConfig.Increment or 1
                SliderConfig.Default   = SliderConfig.Default   or 50
                SliderConfig.Callback  = SliderConfig.Callback  or function() end
                SliderConfig.ValueName = SliderConfig.ValueName or ""
                SliderConfig.Color     = SliderConfig.Color     or Color3.fromRGB(255, 216, 145)
                SliderConfig.Flag      = SliderConfig.Flag      or nil

                local Slider = {Value = SliderConfig.Default}
                local Dragging = false

                local SliderDrag = SetChildren(SetProps(MakeElement("RoundFrame", SliderConfig.Color, 0, 5), {
                    Size = UDim2.new(0,0,1,0),
                    BackgroundTransparency = 0.3,
                    ClipsDescendants = true
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", "value", 13), {
                        Size = UDim2.new(1,-12,0,14),
                        Position = UDim2.new(0,12,0,6),
                        Font = Enum.Font.FredokaOne,
                        Name = "Value",
                        TextTransparency = 0
                    }), "Text")
                })

                local SliderBar = SetChildren(SetProps(MakeElement("RoundFrame", SliderConfig.Color, 0, 5), {
                    Size = UDim2.new(1,-24,0,26),
                    Position = UDim2.new(0,12,0,30),
                    BackgroundTransparency = 0.9
                }), {
                    SetProps(MakeElement("Stroke"), {Color = SliderConfig.Color}),
                    AddThemeObject(SetProps(MakeElement("Label", "value", 13), {
                        Size = UDim2.new(1,-12,0,14),
                        Position = UDim2.new(0,12,0,6),
                        Font = Enum.Font.FredokaOne,
                        Name = "Value",
                        TextTransparency = 0.8
                    }), "Text"),
                    SliderDrag
                })

                local SliderFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 4), {
                    Size = UDim2.new(1,0,0,65),
                    Parent = ItemParent,
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", SliderConfig.Name, 15), {
                        Size = UDim2.new(1,-12,0,14),
                        Position = UDim2.new(0,12,0,10),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content"
                    }), "Text"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    SliderBar
                }), "Second")

                SliderBar.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = true
                        local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
                    end
                end)
                SliderBar.InputEnded:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = false
                    end
                end)
                UserInputService.InputChanged:Connect(function(Input)
                    if Dragging then
                        local SizeScale = math.clamp((Mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                        Slider:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale))
                    end
                end)

                function Slider:Set(Value)
                    self.Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
                    TweenService:Create(SliderDrag, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.fromScale((self.Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}):Play()
                    SliderBar.Value.Text  = tostring(self.Value).." "..SliderConfig.ValueName
                    SliderDrag.Value.Text = tostring(self.Value).." "..SliderConfig.ValueName
                    SliderConfig.Callback(self.Value)
                end

                Slider:Set(Slider.Value)
                if SliderConfig.Flag then Library.Flags[SliderConfig.Flag] = Slider end
                AutoRegister(SliderConfig.Name, "Slider", SliderFrame)

                if SliderConfig.Flag then
                    local oldSet = Slider.Set
                    Slider.Set = function(self, value)
                        oldSet(self, value)
                        SaveConfig()
                    end
                end

                return Slider
            end

            function ElementFunction:AddDropdown(DropdownConfig)
                DropdownConfig = DropdownConfig or {}
                DropdownConfig.Name     = DropdownConfig.Name     or "Dropdown"
                DropdownConfig.Options  = DropdownConfig.Options  or {}
                DropdownConfig.Default  = DropdownConfig.Default  or ""
                DropdownConfig.Callback = DropdownConfig.Callback or function() end
                DropdownConfig.Flag     = DropdownConfig.Flag     or nil

                local Dropdown = {Value = DropdownConfig.Default, Options = DropdownConfig.Options, Buttons = {}, Toggled = false, Type = "Dropdown"}
                local MaxElements = 5

                if not table.find(Dropdown.Options, Dropdown.Value) then Dropdown.Value = "..." end

                local DropdownList = MakeElement("List")
                local DropdownContainer = AddThemeObject(SetProps(SetChildren(MakeElement("ScrollFrame", Color3.fromRGB(40,40,40), 4), {DropdownList}), {
                    Parent = ItemParent,
                    Position = UDim2.new(0,0,0,38),
                    Size = UDim2.new(1,0,1,-38),
                    ClipsDescendants = true
                }), "Divider")

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1,0,1,0)})
                local DropdownFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,38),
                    Parent = ItemParent,
                    ClipsDescendants = true,
                    BackgroundTransparency = 0.2
                }), {
                    DropdownContainer,
                    SetProps(SetChildren(MakeElement("TFrame"), {
                        AddThemeObject(SetProps(MakeElement("Label", DropdownConfig.Name, 15), {Size = UDim2.new(1,-12,1,0), Position = UDim2.new(0,12,0,0), Font = Enum.Font.FredokaOne, Name = "Content"}), "Text"),
                        AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://7072706796"), {Size = UDim2.new(0,20,0,20), AnchorPoint = Vector2.new(0,0.5), Position = UDim2.new(1,-30,0.5,0), ImageColor3 = Color3.fromRGB(240,240,240), Name = "Ico"}), "TextDark"),
                        AddThemeObject(SetProps(MakeElement("Label", "Selected", 13), {Size = UDim2.new(1,-40,1,0), Font = Enum.Font.FredokaOne, Name = "Selected", TextXAlignment = Enum.TextXAlignment.Right}), "TextDark"),
                        AddThemeObject(SetProps(MakeElement("Frame"), {Size = UDim2.new(1,0,0,1), Position = UDim2.new(0,0,1,-1), Name = "Line", Visible = false}), "Stroke"),
                        Click
                    }), {Size = UDim2.new(1,0,0,38), ClipsDescendants = true, Name = "F"}),
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    MakeElement("Corner")
                }), "Second")

                AddConnection(DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                    DropdownContainer.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y)
                end)

                local function AddOptions(Options)
                    for _, Option in pairs(Options) do
                        local OptionBtn = AddThemeObject(SetProps(SetChildren(MakeElement("Button", Color3.fromRGB(40,40,40)), {
                            MakeElement("Corner", 0, 6),
                            AddThemeObject(SetProps(MakeElement("Label", Option, 13, 0.4), {Position = UDim2.new(0,8,0,0), Size = UDim2.new(1,-8,1,0), Name = "Title"}), "Text")
                        }), {
                            Parent = DropdownContainer,
                            Size = UDim2.new(1,0,0,28),
                            BackgroundTransparency = 0.2,
                            ClipsDescendants = true
                        }), "Divider")
                        AddConnection(OptionBtn.MouseButton1Click, function()
                            local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
                            Dropdown:Set(Option)
                        end)
                        Dropdown.Buttons[Option] = OptionBtn
                    end
                end

                function Dropdown:Refresh(Options, Delete)
                    if Delete then
                        for _,v in pairs(Dropdown.Buttons) do v:Destroy() end
                        table.clear(Dropdown.Options)
                        table.clear(Dropdown.Buttons)
                    end
                    Dropdown.Options = Options
                    AddOptions(Dropdown.Options)
                end

                function Dropdown:Set(Value)
                    if not table.find(Dropdown.Options, Value) then
                        Dropdown.Value = "..."
                        DropdownFrame.F.Selected.Text = Dropdown.Value
                        for _, v in pairs(Dropdown.Buttons) do
                            TweenService:Create(v,       TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()
                            TweenService:Create(v.Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency       = 0.4}):Play()
                        end
                        return
                    end
                    Dropdown.Value = Value
                    DropdownFrame.F.Selected.Text = Dropdown.Value
                    for _, v in pairs(Dropdown.Buttons) do
                        TweenService:Create(v,       TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()
                        TweenService:Create(v.Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency       = 0.4}):Play()
                    end
                    TweenService:Create(Dropdown.Buttons[Value],       TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Dropdown.Buttons[Value].Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency       = 0}):Play()
                    return DropdownConfig.Callback(Dropdown.Value)
                end

                AddConnection(Click.MouseButton1Click, function()
                    local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
                    Dropdown.Toggled = not Dropdown.Toggled
                    DropdownFrame.F.Line.Visible = Dropdown.Toggled
                    TweenService:Create(DropdownFrame.F.Ico, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = Dropdown.Toggled and 180 or 0}):Play()
                    if #Dropdown.Options > MaxElements then
                        TweenService:Create(DropdownFrame, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Dropdown.Toggled and UDim2.new(1,0,0,38+(MaxElements*28)) or UDim2.new(1,0,0,38)}):Play()
                    else
                        TweenService:Create(DropdownFrame, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Dropdown.Toggled and UDim2.new(1,0,0,DropdownList.AbsoluteContentSize.Y+38) or UDim2.new(1,0,0,38)}):Play()
                    end
                end)

                Dropdown:Refresh(Dropdown.Options, false)
                Dropdown:Set(Dropdown.Value)
                if DropdownConfig.Flag then Library.Flags[DropdownConfig.Flag] = Dropdown end
                AutoRegister(DropdownConfig.Name, "Dropdown", DropdownFrame)

                if DropdownConfig.Flag then
                    local oldSet = Dropdown.Set
                    Dropdown.Set = function(self, value)
                        oldSet(self, value)
                        SaveConfig()
                    end
                end

                return Dropdown
            end

            function ElementFunction:AddBind(BindConfig)
                BindConfig.Name     = BindConfig.Name     or "Bind"
                BindConfig.Default  = BindConfig.Default  or Enum.KeyCode.Unknown
                BindConfig.Hold     = BindConfig.Hold     or false
                BindConfig.Callback = BindConfig.Callback or function() end
                BindConfig.Flag     = BindConfig.Flag     or nil

                local Bind = {Value = nil, Binding = false, Type = "Bind"}
                local Holding = false
                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1,0,1,0)})

                local BindBox = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 4), {
                    Size = UDim2.new(0,24,0,24),
                    Position = UDim2.new(1,-12,0.5,0),
                    AnchorPoint = Vector2.new(1,0.5),
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    AddThemeObject(SetProps(MakeElement("Label", BindConfig.Name, 14), {
                        Size = UDim2.new(1,0,1,0),
                        Font = Enum.Font.FredokaOne,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        Name = "Value"
                    }), "Text")
                }), "Main")

                local BindFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,38),
                    Parent = ItemParent,
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", BindConfig.Name, 15), {
                        Size = UDim2.new(1,-12,1,0),
                        Position = UDim2.new(0,12,0,0),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content"
                    }), "Text"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    BindBox,
                    Click
                }), "Second")

                AddConnection(BindBox.Value:GetPropertyChangedSignal("Text"), function()
                    TweenService:Create(BindBox, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, BindBox.Value.TextBounds.X + 16, 0, 24)}):Play()
                end)
                AddConnection(Click.InputEnded, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        if Bind.Binding then return end
                        Bind.Binding = true
                        BindBox.Value.Text = ""
                    end
                end)
                AddConnection(UserInputService.InputBegan, function(Input)
                    if UserInputService:GetFocusedTextBox() then return end
                    if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and not Bind.Binding then
                        if BindConfig.Hold then
                            Holding = true
                            BindConfig.Callback(Holding)
                        else
                            BindConfig.Callback()
                        end
                    elseif Bind.Binding then
                        local Key
                        pcall(function() if not CheckKey(BlacklistedKeys, Input.KeyCode) then Key = Input.KeyCode end end)
                        pcall(function() if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then Key = Input.UserInputType end end)
                        Key = Key or Bind.Value
                        Bind:Set(Key)
                    end
                end)
                AddConnection(UserInputService.InputEnded, function(Input)
                    if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
                        if BindConfig.Hold and Holding then
                            Holding = false
                            BindConfig.Callback(Holding)
                        end
                    end
                end)
                AddConnection(Click.MouseEnter,       function() TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play() end)
                AddConnection(Click.MouseLeave,       function() TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Library.Themes[Library.SelectedTheme].Second}):Play() end)
                AddConnection(Click.MouseButton1Up,   function() TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play() end)
                AddConnection(Click.MouseButton1Down, function() TweenService:Create(BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+6, Library.Themes[Library.SelectedTheme].Second.G*255+6, Library.Themes[Library.SelectedTheme].Second.B*255+6)}):Play() end)

                function Bind:Set(Key)
                    Bind.Binding = false
                    Bind.Value = Key or Bind.Value
                    Bind.Value = (type(Bind.Value) == "userdata" and Bind.Value.Name) or Bind.Value
                    BindBox.Value.Text = tostring(Bind.Value)
                end

                Bind:Set(BindConfig.Default)
                if BindConfig.Flag then Library.Flags[BindConfig.Flag] = Bind end
                AutoRegister(BindConfig.Name, "Bind", BindFrame)

                if BindConfig.Flag then
                    local oldSet = Bind.Set
                    Bind.Set = function(self, value)
                        oldSet(self, value)
                        SaveConfig()
                    end
                end

                return Bind
            end

            function ElementFunction:AddTextbox(TextboxConfig)
                TextboxConfig = TextboxConfig or {}
                TextboxConfig.Name          = TextboxConfig.Name          or "Textbox"
                TextboxConfig.Default       = TextboxConfig.Default       or ""
                TextboxConfig.TextDisappear = TextboxConfig.TextDisappear or false
                TextboxConfig.Callback      = TextboxConfig.Callback      or function() end

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1,0,1,0)})
                local TextboxActual = AddThemeObject(Create("TextBox", {
                    Size = UDim2.new(1,0,1,0),
                    BackgroundTransparency = 1,
                    TextColor3 = Color3.fromRGB(255,255,255),
                    PlaceholderColor3 = Color3.fromRGB(210,210,210),
                    PlaceholderText = "Input",
                    Font = Enum.Font.GothamSemibold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextSize = 14,
                    ClearTextOnFocus = false
                }), "Text")

                local TextContainer = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 4), {
                    Size = UDim2.new(0,24,0,24),
                    Position = UDim2.new(1,-12,0.5,0),
                    AnchorPoint = Vector2.new(1,0.5),
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    TextboxActual
                }), "Main")

                local TextboxFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,38),
                    Parent = ItemParent,
                    BackgroundTransparency = 0.2
                }), {
                    AddThemeObject(SetProps(MakeElement("Label", TextboxConfig.Name, 15), {
                        Size = UDim2.new(1,-12,1,0),
                        Position = UDim2.new(0,12,0,0),
                        Font = Enum.Font.FredokaOne,
                        Name = "Content"
                    }), "Text"),
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    TextContainer,
                    Click
                }), "Second")

                AddConnection(TextboxActual:GetPropertyChangedSignal("Text"), function()
                    TweenService:Create(TextContainer, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, TextboxActual.TextBounds.X+16, 0, 24)}):Play()
                end)
                AddConnection(TextboxActual.FocusLost, function()
                    TextboxConfig.Callback(TextboxActual.Text)
                    if TextboxConfig.TextDisappear then TextboxActual.Text = "" end
                end)
                TextboxActual.Text = TextboxConfig.Default
                AddConnection(Click.MouseEnter,       function() TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play() end)
                AddConnection(Click.MouseLeave,       function() TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Library.Themes[Library.SelectedTheme].Second}):Play() end)
                AddConnection(Click.MouseButton1Up,   function()
                    TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+3, Library.Themes[Library.SelectedTheme].Second.G*255+3, Library.Themes[Library.SelectedTheme].Second.B*255+3)}):Play()
                    TextboxActual:CaptureFocus()
                end)
                AddConnection(Click.MouseButton1Down, function() TweenService:Create(TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(Library.Themes[Library.SelectedTheme].Second.R*255+6, Library.Themes[Library.SelectedTheme].Second.G*255+6, Library.Themes[Library.SelectedTheme].Second.B*255+6)}):Play() end)
                AutoRegister(TextboxConfig.Name, "Textbox", TextboxFrame)
            end

            function ElementFunction:AddColorpicker(ColorpickerConfig)
                ColorpickerConfig = ColorpickerConfig or {}
                ColorpickerConfig.Name     = ColorpickerConfig.Name     or "Colorpicker"
                ColorpickerConfig.Default  = ColorpickerConfig.Default  or Color3.fromRGB(255, 216, 145)
                ColorpickerConfig.Callback = ColorpickerConfig.Callback or function() end
                ColorpickerConfig.Flag     = ColorpickerConfig.Flag     or nil

                local ColorH, ColorS, ColorV = 1, 1, 1
                local ColorInput, HueInput
                local Colorpicker = {Value = ColorpickerConfig.Default, Toggled = false, Type = "Colorpicker"}

                local ColorSelection = Create("ImageLabel", {
                    Size = UDim2.new(0,18,0,18),
                    Position = UDim2.new(select(3, Color3.toHSV(Colorpicker.Value))),
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5,0.5),
                    BackgroundTransparency = 1,
                    Image = "http://www.roblox.com/asset/?id=4805639000"
                })
                local HueSelection = Create("ImageLabel", {
                    Size = UDim2.new(0,18,0,18),
                    Position = UDim2.new(0.5,0,1-select(1, Color3.toHSV(Colorpicker.Value))),
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5,0.5),
                    BackgroundTransparency = 1,
                    Image = "http://www.roblox.com/asset/?id=4805639000"
                })
                local Color = Create("ImageLabel", {Size = UDim2.new(1,-25,1,0), Visible = false, Image = "rbxassetid://4155801252"}, {
                    Create("UICorner", {CornerRadius = UDim.new(0,5)}),
                    ColorSelection
                })
                local Hue = Create("Frame", {Size = UDim2.new(0,20,1,0), Position = UDim2.new(1,-20,0,0), Visible = false, BackgroundTransparency = 0.2}, {
                    Create("UIGradient", {Rotation = 270, Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,0,4)),
                        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234,255,0)),
                        ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21,255,0)),
                        ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0,255,255)),
                        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0,17,255)),
                        ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255,0,251)),
                        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255,0,4))
                    }}),
                    Create("UICorner", {CornerRadius = UDim.new(0,5)}),
                    HueSelection
                })
                local ColorpickerContainer = Create("Frame", {
                    Position = UDim2.new(0,0,0,32),
                    Size = UDim2.new(1,0,1,-32),
                    BackgroundTransparency = 1,
                    ClipsDescendants = true
                }, {
                    Hue, Color,
                    Create("UIPadding", {PaddingLeft=UDim.new(0,35), PaddingRight=UDim.new(0,35), PaddingBottom=UDim.new(0,10), PaddingTop=UDim.new(0,17)})
                })

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1,0,1,0)})
                local ColorpickerBox = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 4), {
                    Size = UDim2.new(0,24,0,24),
                    Position = UDim2.new(1,-12,0.5,0),
                    AnchorPoint = Vector2.new(1,0.5),
                    BackgroundTransparency = 0.2
                }), {AddThemeObject(MakeElement("Stroke"), "Stroke")}), "Main")

                local ColorpickerFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                    Size = UDim2.new(1,0,0,38),
                    Parent = ItemParent,
                    BackgroundTransparency = 0.2
                }), {
                    SetProps(SetChildren(MakeElement("TFrame"), {
                        AddThemeObject(SetProps(MakeElement("Label", ColorpickerConfig.Name, 15), {Size=UDim2.new(1,-12,1,0), Position=UDim2.new(0,12,0,0), Font=Enum.Font.FredokaOne, Name="Content"}), "Text"),
                        ColorpickerBox,
                        Click,
                        AddThemeObject(SetProps(MakeElement("Frame"), {Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1), Name="Line", Visible=false}), "Stroke"),
                    }), {Size=UDim2.new(1,0,0,38), ClipsDescendants=true, Name="F"}),
                    ColorpickerContainer,
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                }), "Second")

                AddConnection(Click.MouseButton1Click, function()
                    local sound = Instance.new("Sound") sound.SoundId = "rbxassetid://6895079853" sound.Volume = 0.5 sound.Parent = game:GetService("SoundService") sound:Play() game:GetService("Debris"):AddItem(sound, 1)
                    Colorpicker.Toggled = not Colorpicker.Toggled
                    TweenService:Create(ColorpickerFrame, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Colorpicker.Toggled and UDim2.new(1,0,0,148) or UDim2.new(1,0,0,38)}):Play()
                    Color.Visible = Colorpicker.Toggled
                    Hue.Visible   = Colorpicker.Toggled
                    ColorpickerFrame.F.Line.Visible = Colorpicker.Toggled
                end)

                local function UpdateColorPicker()
                    ColorpickerBox.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                    Colorpicker:Set(ColorpickerBox.BackgroundColor3)
                    ColorpickerConfig.Callback(ColorpickerBox.BackgroundColor3)
                end

                ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / math.max(Hue.AbsoluteSize.Y, 1))
                ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / math.max(Color.AbsoluteSize.X, 1))
                ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / math.max(Color.AbsoluteSize.Y, 1))

                AddConnection(Color.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if ColorInput then ColorInput:Disconnect() end
                        ColorInput = AddConnection(RunService.RenderStepped, function()
                            local ColorX = math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / math.max(Color.AbsoluteSize.X, 1)
                            local ColorY = math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / math.max(Color.AbsoluteSize.Y, 1)
                            ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                            ColorS = ColorX; ColorV = 1 - ColorY
                            UpdateColorPicker()
                        end)
                    end
                end)
                AddConnection(Color.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if ColorInput then ColorInput:Disconnect() end
                    end
                end)
                AddConnection(Hue.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if HueInput then HueInput:Disconnect() end
                        HueInput = AddConnection(RunService.RenderStepped, function()
                            local HueY = math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / math.max(Hue.AbsoluteSize.Y, 1)
                            HueSelection.Position = UDim2.new(0.5, 0, HueY, 0)
                            ColorH = 1 - HueY
                            UpdateColorPicker()
                        end)
                    end
                end)
                AddConnection(Hue.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if HueInput then HueInput:Disconnect() end
                    end
                end)

                function Colorpicker:Set(Value)
                    Colorpicker.Value = Value
                    ColorpickerBox.BackgroundColor3 = Colorpicker.Value
                    ColorpickerConfig.Callback(Colorpicker.Value)
                end

                Colorpicker:Set(Colorpicker.Value)
                if ColorpickerConfig.Flag then Library.Flags[ColorpickerConfig.Flag] = Colorpicker end
                AutoRegister(ColorpickerConfig.Name, "Colorpicker", ColorpickerFrame)

                if ColorpickerConfig.Flag then
                    local oldSet = Colorpicker.Set
                    Colorpicker.Set = function(self, value)
                        oldSet(self, value)
                        SaveConfig()
                    end
                end

                return Colorpicker
            end

            function ElementFunction:AddThemeDropdown()
                local themeNames = {}
                for k in pairs(Library.Themes) do table.insert(themeNames, k) end
                table.sort(themeNames)
                self:AddDropdown({
                    Name     = "Color Theme",
                    Options  = themeNames,
                    Default  = Library.SelectedTheme,
                    Callback = function(Value) Library:ApplyTheme(Value) end,
                })
            end

            function ElementFunction:AddParticleDropdown(ParentFrame)
                local target = ParentFrame or MainWindow
                self:AddDropdown({
                    Name     = "Background Effect",
                    Options  = {"None","Snowflakes","Rain","Stars","Bubbles"},
                    Default  = "None",
                    Callback = function(Value) Library:StartParticles(Value, target) end,
                })
            end

            return ElementFunction
        end

        local ElementFunction = {}

        function ElementFunction:AddSection(SectionConfig)
            SectionConfig.Name = SectionConfig.Name or "Section"
            local SectionFrame = SetChildren(SetProps(MakeElement("TFrame"), {
                Size = UDim2.new(1,0,0,26),
                Parent = TabItemContainer
            }), {
                (function()
                    local line = Create("Frame", {
                        Size = UDim2.new(0,2,0,14), Position = UDim2.new(0,0,0,5),
                        BackgroundColor3 = Color3.fromRGB(255, 216, 145), BorderSizePixel = 0, Parent = SectionFrame,
                    })
                    Create("UICorner", {CornerRadius = UDim.new(0,2), Parent = line})
                    return line
                end)(),
                AddThemeObject(SetProps(MakeElement("Label", SectionConfig.Name, 14), {
                    Size = UDim2.new(1,-12,0,16),
                    Position = UDim2.new(0,10,0,3),
                    Font = Enum.Font.FredokaOne
                }), "TextDark"),
                SetChildren(SetProps(MakeElement("TFrame"), {
                    AnchorPoint = Vector2.new(0,0),
                    Size = UDim2.new(1,0,1,-24),
                    Position = UDim2.new(0,0,0,23),
                    Name = "Holder"
                }), {MakeElement("List", 0, 6)}),
            })
            AddConnection(SectionFrame.Holder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                SectionFrame.Size        = UDim2.new(1, 0, 0, SectionFrame.Holder.UIListLayout.AbsoluteContentSize.Y + 31)
                SectionFrame.Holder.Size = UDim2.new(1, 0, 0, SectionFrame.Holder.UIListLayout.AbsoluteContentSize.Y)
            end)
            local SectionFunction = {}
            for i, v in next, GetElements(SectionFrame.Holder) do SectionFunction[i] = v end
            return SectionFunction
        end

        for i, v in next, GetElements(TabItemContainer) do ElementFunction[i] = v end

        if TabConfig.PremiumOnly then
            for i, v in next, ElementFunction do ElementFunction[i] = function() end end
            TabItemContainer:FindFirstChild("UIListLayout"):Destroy()
            TabItemContainer:FindFirstChild("UIPadding"):Destroy()
            SetChildren(SetProps(MakeElement("TFrame"), {Size = UDim2.new(1,0,1,0), Parent = TabItemContainer}), {
                AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://3610239960"), {Size=UDim2.new(0,18,0,18), Position=UDim2.new(0,15,0,15), ImageTransparency=0.4}), "Text"),
                AddThemeObject(SetProps(MakeElement("Label", "Unauthorised Access", 14), {Size=UDim2.new(1,-38,0,14), Position=UDim2.new(0,38,0,18), TextTransparency=0.4}), "Text"),
            })
        end
        return ElementFunction, TabFrame
    end

    local TabFunction    = {}
    local tabLayoutOrder = 0
    local tabGroupRegistry = {}
    local allGroups = {}

    local function NextOrder()
        tabLayoutOrder = tabLayoutOrder + 1
        return tabLayoutOrder
    end

    local Drag = {active = false, src = nil, ghost = nil}

    local function GetOrderedTabs()
        local t = {}
        for _, c in ipairs(TabHolder:GetChildren()) do
            if c:IsA("TextButton") and c:FindFirstChild("Ico") and c:FindFirstChild("Title") then
                table.insert(t, c)
            end
        end
        table.sort(t, function(a,b) return a.LayoutOrder < b.LayoutOrder end)
        return t
    end

    local function TabUnderMouse(exclude)
        for _, c in ipairs(TabHolder:GetChildren()) do
            if c:IsA("TextButton") and c:FindFirstChild("Ico") and c:FindFirstChild("Title") and c ~= exclude then
                local p, s = c.AbsolutePosition, c.AbsoluteSize
                if Mouse.X >= p.X and Mouse.X <= p.X+s.X and Mouse.Y >= p.Y and Mouse.Y <= p.Y+s.Y then return c end
            end
        end
    end

    local function GroupHeaderUnderMouse()
        for _, g in ipairs(allGroups) do
            local h = g.header
            if h then
                local p, s = h.AbsolutePosition, h.AbsoluteSize
                if Mouse.X >= p.X and Mouse.X <= p.X+s.X and Mouse.Y >= p.Y and Mouse.Y <= p.Y+s.Y then return g end
            end
        end
    end

    local function RemoveFromGroup(tabBtn, forceVisible)
        local reg = tabGroupRegistry[tabBtn]
        if not reg then return end
        for i, v in ipairs(reg.frames) do
            if v == tabBtn then table.remove(reg.frames, i) break end
        end
        tabGroupRegistry[tabBtn] = nil
        if forceVisible then tabBtn.Visible = true end
    end

    local function AddToGroup(tabBtn, groupData)
        RemoveFromGroup(tabBtn, false)
        table.insert(groupData.frames, tabBtn)
        tabGroupRegistry[tabBtn] = groupData
        tabBtn.Visible = not groupData.collapsed
        local pad = tabBtn:FindFirstChildOfClass("UIPadding")
        if not pad then pad = Instance.new("UIPadding"); pad.Parent = tabBtn end
        pad.PaddingLeft = UDim.new(0, 18)
    end

    local function RemoveIndent(tabBtn)
        local pad = tabBtn:FindFirstChildOfClass("UIPadding")
        if pad then pad.PaddingLeft = UDim.new(0, 0) end
    end

    local function EndDrag()
        Drag.active = false
        if Drag.ghost then Drag.ghost:Destroy(); Drag.ghost = nil end
        if Drag.src then
            TweenService:Create(Drag.src, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
            Drag.src = nil
        end
        for _, c in ipairs(TabHolder:GetChildren()) do
            if c:IsA("TextButton") then
                TweenService:Create(c, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
            end
        end
    end

    local function StartDrag(tabFrame)
        Drag.active = true
        Drag.src    = tabFrame
        tabFrame.BackgroundColor3       = Color3.fromRGB(255, 216, 145)
        tabFrame.BackgroundTransparency = 0.6

        local ghost = Instance.new("Frame")
        ghost.Size                   = UDim2.new(0, tabFrame.AbsoluteSize.X-8, 0, tabFrame.AbsoluteSize.Y-4)
        ghost.BackgroundColor3       = Color3.fromRGB(255, 216, 145)
        ghost.BackgroundTransparency = 0.4
        ghost.BorderSizePixel        = 0
        ghost.ZIndex                 = 20
        Instance.new("UICorner",ghost).CornerRadius = UDim.new(0,5)
        local gl = Instance.new("TextLabel", ghost)
        gl.Size=UDim2.new(1,-8,1,0); gl.Position=UDim2.new(0,8,0,0)
        gl.BackgroundTransparency=1; gl.Text=tabFrame.Title.Text
        gl.TextColor3=Color3.fromRGB(255,255,255); gl.Font=Enum.Font.GothamBlack
        gl.TextSize=13; gl.TextXAlignment=Enum.TextXAlignment.Left; gl.ZIndex=21
        ghost.Parent = TabHolder
        Drag.ghost = ghost

        local dragRef = Drag
        RunService.RenderStepped:Connect(function()
            if not dragRef.active then return end
            local rx = Mouse.X - TabHolder.AbsolutePosition.X
            local ry = Mouse.Y - TabHolder.AbsolutePosition.Y - 15
            if dragRef.ghost and dragRef.ghost.Parent then
                dragRef.ghost.Position = UDim2.new(0,rx,0,ry)
            end
            local hovered = TabUnderMouse(tabFrame)
            local hgroup  = GroupHeaderUnderMouse()
            for _, c in ipairs(TabHolder:GetChildren()) do
                if c:IsA("TextButton") and c ~= tabFrame then
                    local isTarget = (c == hovered) or (hgroup and c == hgroup.header)
                    TweenService:Create(c, TweenInfo.new(0.08), {
                        BackgroundTransparency = isTarget and 0.6 or 1,
                        BackgroundColor3       = Color3.fromRGB(255, 216, 145)
                    }):Play()
                end
            end
        end)
    end

    local function AttachDrag(tabFrame)
        local timer, dragging = nil, false
        tabFrame.InputBegan:Connect(function(inp)
            if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
            dragging = false
            timer = task.delay(0.25, function()
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                    dragging = true; StartDrag(tabFrame)
                end
            end)
        end)
        tabFrame.InputEnded:Connect(function(inp)
            if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
            if timer then task.cancel(timer); timer = nil end
            if not dragging then return end
            dragging = false
            if not (Drag.active and Drag.src == tabFrame) then return end

            local targetTab   = TabUnderMouse(tabFrame)
            local targetGroup = GroupHeaderUnderMouse()

            if targetGroup then
                local lastOrder = targetGroup.header.LayoutOrder
                for _, f in ipairs(targetGroup.frames) do
                    if f.LayoutOrder > lastOrder then lastOrder = f.LayoutOrder end
                end
                tabLayoutOrder = tabLayoutOrder + 1
                tabFrame.LayoutOrder = lastOrder + 0.5
                local sorted = GetOrderedTabs()
                for i, btn in ipairs(sorted) do btn.LayoutOrder = i * 10 end
                tabLayoutOrder = #sorted * 10
                AddToGroup(tabFrame, targetGroup)
            elseif targetTab then
                local srcOrder = tabFrame.LayoutOrder
                tabFrame.LayoutOrder = targetTab.LayoutOrder
                targetTab.LayoutOrder = srcOrder
                local tg = tabGroupRegistry[targetTab]
                if tg then
                    AddToGroup(tabFrame, tg)
                else
                    if tabGroupRegistry[tabFrame] then
                        RemoveFromGroup(tabFrame, true)
                        RemoveIndent(tabFrame)
                    end
                end
            end
            EndDrag()
        end)
    end

    local function ActivateTab(tabBtn)
        for _, ic in next, MainWindow:GetChildren() do
            if ic.Name == "ItemContainer" then ic.Visible = false end
        end
        for _, tb in next, TabHolder:GetChildren() do
            if tb:IsA("TextButton") and tb:FindFirstChild("Ico") and tb:FindFirstChild("Title") then
                TweenService:Create(tb.Ico,   TweenInfo.new(0.2), {ImageTransparency = 0.4, ImageColor3 = Color3.fromRGB(240,240,240)}):Play()
                TweenService:Create(tb.Title, TweenInfo.new(0.2), {TextTransparency  = 0.4, TextColor3  = Color3.fromRGB(240,240,240)}):Play()
            end
        end
        local container = tabFrameToContainer[tabBtn]
        if container then container.Visible = true end
        TweenService:Create(tabBtn.Ico,   TweenInfo.new(0.2), {ImageTransparency=0, ImageColor3=Color3.fromRGB(255, 216, 145)}):Play()
        TweenService:Create(tabBtn.Title, TweenInfo.new(0.2), {TextTransparency=0,  TextColor3=Color3.fromRGB(255, 216, 145)}):Play()
    end

    local function ScrollToFrame(container, targetFrame)
        if not container or not targetFrame then return end
        task.wait()
        local containerPos = container.AbsolutePosition.Y
        local framePos = targetFrame.AbsolutePosition.Y
        local relativePos = framePos - containerPos + container.CanvasPosition.Y
        local targetY = math.max(0, relativePos - container.AbsoluteSize.Y / 2 + targetFrame.AbsoluteSize.Y / 2)
        TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            CanvasPosition = Vector2.new(0, targetY)
        }):Play()
        local flash = Instance.new("Frame")
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.BackgroundColor3 = Color3.fromRGB(255, 216, 145)
        flash.BackgroundTransparency = 0.7
        flash.BorderSizePixel = 0
        flash.ZIndex = 50
        flash.Parent = targetFrame
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 5)
        corner.Parent = flash
        TweenService:Create(flash, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play()
        task.delay(0.85, function()
            if flash and flash.Parent then flash:Destroy() end
        end)
    end

    local SearchOverlay = SetChildren(SetProps(MakeElement("TFrame"), {
        Size     = UDim2.new(1, -150, 1, 0),
        Position = UDim2.new(0, 150, 0, 0),
        Visible  = false,
        ZIndex   = 10,
        Parent   = MainWindow,
        ClipsDescendants = true,
    }), {})

    local SearchBG = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame",
        Color3.fromRGB(255,255,255), 0, 8), {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 0.04,
        ZIndex = 10,
    }), {
        AddThemeObject(MakeElement("Stroke"), "Stroke"),
    }), "Main")
    SearchBG.Parent = SearchOverlay

    local SearchBarFrame = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame",
        Color3.fromRGB(255,255,255), 0, 6), {
        Size     = UDim2.new(1, -20, 0, 32),
        Position = UDim2.new(0, 10, 0, 9),
        BackgroundTransparency = 0.2,
        ZIndex   = 11,
    }), {
        AddThemeObject(MakeElement("Stroke"), "Stroke"),
        AddThemeObject(SetProps(MakeElement("Image", "rbxassetid://93394790588130"), {
            Size     = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(0, 8, 0.5, -7),
            ZIndex   = 12,
        }), "TextDark"),
    }), "Second")
    SearchBarFrame.Parent = SearchOverlay

    local SearchBox = Create("TextBox", {
        Size               = UDim2.new(1, -36, 1, 0),
        Position           = UDim2.new(0, 28, 0, 0),
        BackgroundTransparency = 1,
        PlaceholderText    = "Search for a Feature like Aimbot.",
        PlaceholderColor3  = Color3.fromRGB(110, 110, 118),
        TextColor3         = Color3.fromRGB(240, 240, 245),
        Font               = Enum.Font.GothamSemibold,
        TextSize           = 13,
        ClearTextOnFocus   = false,
        ZIndex             = 13,
        TextXAlignment     = Enum.TextXAlignment.Left,
        Parent             = SearchBarFrame,
    })

    local SearchDivider = AddThemeObject(SetProps(MakeElement("Frame"), {
        Size     = UDim2.new(1, -20, 0, 1),
        Position = UDim2.new(0, 10, 0, 50),
        ZIndex   = 11,
    }), "Stroke")
    SearchDivider.Parent = SearchOverlay

    local ResultScroll = AddThemeObject(SetChildren(SetProps(
        MakeElement("ScrollFrame", Color3.fromRGB(200,200,200), 3), {
        Size       = UDim2.new(1, -20, 1, -60),
        Position   = UDim2.new(0, 10, 0, 58),
        ZIndex     = 11,
        CanvasSize = UDim2.new(0,0,0,0),
    }), {
        MakeElement("List", 0, 4),
        MakeElement("Padding", 6, 6, 6, 6),
    }), "Divider")
    ResultScroll.Parent = SearchOverlay

    AddConnection(ResultScroll.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        ResultScroll.CanvasSize = UDim2.new(0, 0, 0,
            ResultScroll.UIListLayout.AbsoluteContentSize.Y + 12)
    end)

    local function MakeResultRow(displayName, typeName, tabName, onClickFn)
        local badgeColor = TypeBadgeColors[typeName] or Color3.fromRGB(255, 216, 145)
        local badgeLabel = TypeBadgeLabels[typeName] or typeName:upper():sub(1,4)

        local Row = AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame",
            Color3.fromRGB(255,255,255), 0, 5), {
            Size   = UDim2.new(1, 0, 0, 34),
            Parent = ResultScroll,
            BackgroundTransparency = 0.2,
            ZIndex = 12,
        }), {
            Create("Frame", {
                Size = UDim2.new(0, 2, 0, 18),
                Position = UDim2.new(0, 5, 0.5, -9),
                BackgroundColor3 = badgeColor,
                BorderSizePixel = 0,
                ZIndex = 13,
            }, {Create("UICorner", {CornerRadius = UDim.new(1,0)})}),
            Create("TextLabel", {
                Size = UDim2.new(0, 36, 0, 14),
                Position = UDim2.new(0, 10, 0.5, -7),
                BackgroundColor3 = badgeColor,
                BackgroundTransparency = 0.6,
                Text = badgeLabel,
                TextColor3 = badgeColor,
                TextSize = 8,
                Font = Enum.Font.GothamBlack,
                TextXAlignment = Enum.TextXAlignment.Center,
                BorderSizePixel = 0,
                ZIndex = 14,
            }, {Create("UICorner", {CornerRadius = UDim.new(0,3)})}),
            AddThemeObject(SetProps(MakeElement("Label", displayName, 13), {
                Size     = UDim2.new(1, -100, 1, 0),
                Position = UDim2.new(0, 52, 0, 0),
                Font     = Enum.Font.GothamSemibold,
                ZIndex   = 13,
            }), "Text"),
            Create("TextLabel", {
                Size = UDim2.new(0, 40, 1, 0),
                Position = UDim2.new(1, -44, 0, 0),
                BackgroundTransparency = 1,
                Text = tabName,
                TextColor3 = Color3.fromRGB(100, 100, 108),
                TextSize = 10,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextTruncate = Enum.TextTruncate.AtEnd,
                ZIndex = 13,
            }),
            AddThemeObject(MakeElement("Stroke"), "Stroke"),
        }), "Second")

        local clickCapture = SetProps(MakeElement("Button"), {
            Size = UDim2.new(1,0,1,0),
            Parent = Row,
            ZIndex = 15,
        })
        AddConnection(clickCapture.MouseButton1Click, function() onClickFn() end)
        AddConnection(clickCapture.MouseEnter, function()
            TweenService:Create(Row, TweenInfo.new(0.12), {BackgroundTransparency = 0.08}):Play()
        end)
        AddConnection(clickCapture.MouseLeave, function()
            TweenService:Create(Row, TweenInfo.new(0.12), {BackgroundTransparency = 0.2}):Play()
        end)
        return Row
    end

    local function RunSearch(query)
        for _, child in ipairs(ResultScroll:GetChildren()) do
            if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
                child:Destroy()
            end
        end

        local q = query:lower():gsub("%s+", "")
        if q == "" then
            local hint = AddThemeObject(SetProps(MakeElement("Label", "Search for a Feature in the Script...", 13), {
                Size   = UDim2.new(1, 0, 0, 28),
                Parent = ResultScroll,
                Font   = Enum.Font.FredokaOne,
                TextTransparency = 0.4,
                ZIndex = 12,
            }), "TextDark")
            return
        end

        local found = 0

        for _, tabBtn in ipairs(TabHolder:GetChildren()) do
            if tabBtn:IsA("TextButton") and tabBtn:FindFirstChild("Title") then
                local name = tabBtn.Title.Text:lower():gsub("%s+","")
                if name:find(q, 1, true) then
                    found = found + 1
                    MakeResultRow(tabBtn.Title.Text, "Tab", "Tab", function()
                        ActivateTab(tabBtn)
                        SearchOverlay.Visible = false
                        SearchBox.Text = ""
                    end)
                end
            end
        end

        for _, entry in ipairs(Library.SearchRegistry) do
            local lbl = entry.label:gsub("%s+","")
            if lbl:find(q, 1, true) then
                found = found + 1
                local capturedEntry = entry
                MakeResultRow(entry.display, entry.elementType or "Toggle", entry.tabName or "?", function()
                    ActivateTab(capturedEntry.tabBtn)
                    ScrollToFrame(capturedEntry.container, capturedEntry.frame)
                    SearchOverlay.Visible = false
                    SearchBox.Text = ""
                end)
            end
        end

        if found == 0 then
            AddThemeObject(SetProps(MakeElement("Label",
                "No results for \"" .. query .. "\"", 13), {
                Size   = UDim2.new(1, 0, 0, 28),
                Parent = ResultScroll,
                Font   = Enum.Font.FredokaOne,
                TextTransparency = 0.35,
                ZIndex = 12,
            }), "TextDark")
        end
    end

    local SearchBtn = SetChildren(SetProps(MakeElement("Button"), {
        Size     = UDim2.new(0, 34, 0, 30),
        Position = UDim2.new(1.05, -175, 0, 10),
        BackgroundTransparency = 1,
        ZIndex   = 5,
    }), {
        AddThemeObject(SetChildren(SetProps(MakeElement("RoundFrame",
            Color3.fromRGB(255,255,255), 0, 6), {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 0.8,
            ZIndex = 5,
            Name = "BG",
        }), {
            AddThemeObject(MakeElement("Stroke"), "Stroke"),
            SetProps(MakeElement("Image", "rbxassetid://134995457386517"), {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position    = UDim2.new(0.5, 0, 0.5, 0),
                Size        = UDim2.new(0, 16, 0, 16),
                ZIndex      = 6,
                Name        = "Ico",
                ImageColor3 = Color3.fromRGB(200, 200, 210),
            }),
        }), "Second"),
    })
    SearchBtn.Parent = MainWindow.TopBar

    AddConnection(SearchBox:GetPropertyChangedSignal("Text"), function()
        RunSearch(SearchBox.Text)
    end)

    AddConnection(SearchBtn.MouseButton1Click, function()
        SearchBox.Text = ""
        SearchOverlay.Visible = not SearchOverlay.Visible
        if SearchOverlay.Visible then
            SearchBox:CaptureFocus()
            RunSearch(SearchBox.Text)
            SearchOverlay.Position = UDim2.new(1, 0, 0, 0)
            TweenService:Create(SearchOverlay, TweenInfo.new(0.25,
                Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {Position = UDim2.new(0, 150, 0, 0)}):Play()
        end
    end)

    AddConnection(SearchBtn.MouseEnter, function()
        local bg = SearchBtn:FindFirstChild("BG", true)
        if bg then TweenService:Create(bg, TweenInfo.new(0.15), {BackgroundTransparency = 0.5}):Play() end
    end)
    AddConnection(SearchBtn.MouseLeave, function()
        local bg = SearchBtn:FindFirstChild("BG", true)
        if bg then TweenService:Create(bg, TweenInfo.new(0.15), {BackgroundTransparency = 0.8}):Play() end
    end)

    AddConnection(UserInputService.InputBegan, function(inp)
        if inp.KeyCode == Enum.KeyCode.Escape and SearchOverlay.Visible then
            SearchOverlay.Visible = false
            SearchBox.Text = ""
        end
    end)

    AddConnection(UserInputService.InputBegan, function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 and SearchOverlay.Visible then
            local mx, my = Mouse.X, Mouse.Y
            local p = SearchOverlay.AbsolutePosition
            local s = SearchOverlay.AbsoluteSize
            if mx < p.X or mx > p.X+s.X or my < p.Y or my > p.Y+s.Y then
                SearchOverlay.Visible = false
                SearchBox.Text = ""
            end
        end
    end)

    function TabFunction:MakeTab(TabConfig)
        local ef, frame = BuildTab(TabConfig, TabHolder)
        if frame then
            frame.LayoutOrder = NextOrder()
            AttachDrag(frame)
        end
        return ef
    end

    function TabFunction:MakeTabGroup(GroupConfig)
        GroupConfig = GroupConfig or {}
        GroupConfig.Name      = GroupConfig.Name      or "Group"
        GroupConfig.Collapsed = GroupConfig.Collapsed or false

        local collapsed     = GroupConfig.Collapsed
        local groupFrames   = {}
        local headerCreated = false
        local AccentLine, GroupLabel
        local headerBtn

        local groupData = {frames = groupFrames, header = nil, collapsed = collapsed}
        table.insert(allGroups, groupData)

        local function SetCollapsed(state)
            collapsed = state
            groupData.collapsed = state
            for _, tf in ipairs(groupFrames) do
                tf.Visible = not collapsed
            end
            if AccentLine then
                TweenService:Create(AccentLine, TweenInfo.new(0.2), {BackgroundColor3 = collapsed and Color3.fromRGB(80,80,85) or Color3.fromRGB(255, 216, 145)}):Play()
            end
            if GroupLabel then
                TweenService:Create(GroupLabel, TweenInfo.new(0.2), {TextColor3 = collapsed and Color3.fromRGB(100,100,105) or Color3.fromRGB(255, 216, 145)}):Play()
            end
        end

        local function EnsureHeader()
            if headerCreated then return end
            headerCreated = true
            headerBtn = Create("TextButton", {
                Size=UDim2.new(1,0,0,22), BackgroundTransparency=1,
                BorderSizePixel=0, Text="", AutoButtonColor=false,
                LayoutOrder=NextOrder(), Parent=TabHolder,
            })
            groupData.header = headerBtn
            AccentLine = Create("Frame", {
                Size=UDim2.new(0,2,0,10), Position=UDim2.new(0,6,0.5,-5),
                BackgroundColor3 = collapsed and Color3.fromRGB(80,80,85) or Color3.fromRGB(255, 216, 145),
                BorderSizePixel=0, Parent=headerBtn,
            })
            Create("UICorner",{CornerRadius=UDim.new(0,2),Parent=AccentLine})
            GroupLabel = Create("TextLabel", {
                Size=UDim2.new(1,-16,1,0), Position=UDim2.new(0,14,0,0),
                BackgroundTransparency=1, Text=string.upper(GroupConfig.Name),
                TextColor3 = collapsed and Color3.fromRGB(100,100,105) or Color3.fromRGB(255, 216, 145),
                TextSize=10, Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Left, Parent=headerBtn,
            })
            headerBtn.MouseButton1Click:Connect(function() SetCollapsed(not collapsed) end)
            headerBtn.MouseEnter:Connect(function() TweenService:Create(GroupLabel,TweenInfo.new(0.15),{TextColor3=Color3.fromRGB(200,230,255)}):Play() end)
            headerBtn.MouseLeave:Connect(function() TweenService:Create(GroupLabel,TweenInfo.new(0.15),{TextColor3=collapsed and Color3.fromRGB(100,100,105) or Color3.fromRGB(255, 216, 145)}):Play() end)
        end

        local GroupFunction = {}
        function GroupFunction:MakeTab(TabConfig)
            EnsureHeader()
            local tabEF, tabBtn = BuildTab(TabConfig, TabHolder)
            if tabBtn then
                tabBtn.LayoutOrder = NextOrder()
                local pad = tabBtn:FindFirstChildOfClass("UIPadding")
                if not pad then pad = Instance.new("UIPadding"); pad.Parent = tabBtn end
                pad.PaddingLeft = UDim.new(0, 18)
                table.insert(groupFrames, tabBtn)
                tabGroupRegistry[tabBtn] = groupData
                tabBtn.Visible = not collapsed
                AttachDrag(tabBtn)
            end
            return tabEF
        end
        return GroupFunction
    end

    TabFunction._window = MainWindow
    return TabFunction
end


local Configs_HUB = {
    Cor_Hub      = Color3.fromRGB(15,15,15),
    Cor_Options  = Color3.fromRGB(15,15,15),
    Cor_Stroke   = Color3.fromRGB(60,60,60),
    Cor_Text     = Color3.fromRGB(240,240,240),
    Cor_DarkText = Color3.fromRGB(140,140,140),
    Corner_Radius = UDim.new(0, 4),
    Text_Font    = Library.Font
}

local function Create2(instance, parent, props)
    local new = Instance.new(instance, parent)
    if props then table.foreach(props, function(prop, value) new[prop] = value end) end
    return new
end

local function SetProps2(instance, props)
    if instance and props then table.foreach(props, function(prop, value) instance[prop] = value end) end
    return instance
end

local function Corner2(parent, props)
    local new = Create2("UICorner", parent)
    new.CornerRadius = Configs_HUB.Corner_Radius
    if props then SetProps2(new, props) end
    return new
end

local function CreateTween(instance, prop, value, time, tweenWait)
    local tween = TweenService:Create(instance, TweenInfo.new(time, Enum.EasingStyle.Linear), {[prop] = value})
    tween:Play()
    if tweenWait then tween.Completed:Wait() end
end

local ScreenGui = Create2("ScreenGui", Container)

local Menu_Notifi = Create2("Frame", ScreenGui, {
    Size = UDim2.new(0,300,1,0),
    Position = UDim2.new(1,0,0,0),
    AnchorPoint = Vector2.new(1,0),
    BackgroundTransparency = 1
})

Create2("UIPadding", Menu_Notifi, {
    PaddingLeft   = UDim.new(0,25),
    PaddingTop    = UDim.new(0,25),
    PaddingBottom = UDim.new(0,50)
})

Create2("UIListLayout", Menu_Notifi, {
    Padding = UDim.new(0,15),
    VerticalAlignment = Enum.VerticalAlignment.Bottom
})

function Library:MakeNotifi(Configs)
    local Title    = Configs.Title or "Title!"
    local text     = Configs.Text  or "Notification content..."
    local timewait = Configs.Time  or 5

    local Frame1 = Create2("Frame", Menu_Notifi, {Size=UDim2.new(2,0,0,0), BackgroundTransparency=1, AutomaticSize=Enum.AutomaticSize.Y, Name="Title"})
    local Frame2 = Create2("Frame", Frame1, {
        Size=UDim2.new(0, Menu_Notifi.Size.X.Offset-50, 0, 0),
        BackgroundColor3=Configs_HUB.Cor_Hub,
        Position=UDim2.new(0, Menu_Notifi.Size.X.Offset, 0, 0),
        AutomaticSize=Enum.AutomaticSize.Y,
        BackgroundTransparency=0.15
    }) Corner2(Frame2)

    Create2("TextLabel", Frame2, {
        Size=UDim2.new(1,0,0,25), Font=Configs_HUB.Text_Font,
        BackgroundTransparency=1, Text=Title, TextSize=20,
        Position=UDim2.new(0,20,0,5), TextXAlignment=Enum.TextXAlignment.Left, TextColor3=Configs_HUB.Cor_Text
    })
    local TextButton = Create2("TextButton", Frame2, {
        Text="X", Font=Configs_HUB.Text_Font, TextSize=20,
        BackgroundTransparency=1, TextColor3=Color3.fromRGB(200,200,200),
        Position=UDim2.new(1,-5,0,5), AnchorPoint=Vector2.new(1,0), Size=UDim2.new(0,25,0,25)
    })
    Create2("TextLabel", Frame2, {
        Size=UDim2.new(1,-30,0,0),
        Position=UDim2.new(0,20,0,TextButton.Size.Y.Offset+10),
        TextSize=15, TextColor3=Configs_HUB.Cor_DarkText,
        TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top,
        AutomaticSize=Enum.AutomaticSize.Y, Text=text,
        Font=Configs_HUB.Text_Font, BackgroundTransparency=1, TextWrapped=true
    })

    local FrameSize = Create2("Frame", Frame2, {
        Size=UDim2.new(1,0,0,2), BackgroundColor3=Configs_HUB.Cor_Stroke,
        Position=UDim2.new(0,2,0,30), BorderSizePixel=0
    }) Corner2(FrameSize)
    Create2("Frame", Frame2, {Size=UDim2.new(0,0,0,5), Position=UDim2.new(0,0,1,5), BackgroundTransparency=1})

    task.spawn(function() CreateTween(FrameSize, "Size", UDim2.new(0,0,0,2), timewait, true) end)

    TextButton.MouseButton1Click:Connect(function()
        CreateTween(Frame2, "Position", UDim2.new(0,-20,0,0), 0.1, true)
        CreateTween(Frame2, "Position", UDim2.new(0,Menu_Notifi.Size.X.Offset,0,0), 0.5, true)
        Frame1:Destroy()
    end)

    task.spawn(function()
        CreateTween(Frame2, "Position", UDim2.new(0,-20,0,0), 0.5, true)
        CreateTween(Frame2, "Position", UDim2.new(), 0.1, true)
        task.wait(timewait)
        if Frame2 and Frame2.Parent then
            CreateTween(Frame2, "Position", UDim2.new(0,-20,0,0), 0.1, true)
            CreateTween(Frame2, "Position", UDim2.new(0,Menu_Notifi.Size.X.Offset,0,0), 0.5, true)
            Frame1:Destroy()
        end
    end)
end

function Library:Init() end

function Library:Destroy()
    Container:Destroy()
end

Library.Themes["Midnight"] = {
    Main = Color3.fromRGB(10, 10, 30), Second = Color3.fromRGB(18, 18, 45),
    Stroke = Color3.fromRGB(50, 50, 120), Divider = Color3.fromRGB(25, 25, 60),
    Text = Color3.fromRGB(200, 200, 255), TextDark = Color3.fromRGB(120, 120, 180),
    MainTransparency = 0.1, SecondTransparency = 0.15, FrameTransparency = 0.2
}
Library.Themes["Ocean"] = {
    Main = Color3.fromRGB(5, 18, 35), Second = Color3.fromRGB(8, 28, 55),
    Stroke = Color3.fromRGB(20, 80, 140), Divider = Color3.fromRGB(10, 40, 80),
    Text = Color3.fromRGB(180, 220, 255), TextDark = Color3.fromRGB(100, 150, 200),
    MainTransparency = 0.1, SecondTransparency = 0.15, FrameTransparency = 0.2
}
Library.Themes["Rose"] = {
    Main = Color3.fromRGB(30, 10, 20), Second = Color3.fromRGB(48, 15, 30),
    Stroke = Color3.fromRGB(160, 50, 90), Divider = Color3.fromRGB(70, 20, 40),
    Text = Color3.fromRGB(255, 200, 220), TextDark = Color3.fromRGB(200, 130, 160),
    MainTransparency = 0.1, SecondTransparency = 0.15, FrameTransparency = 0.2
}

function Library:ApplyTheme(ThemeName)
    if not Library.Themes[ThemeName] then return end
    Library.SelectedTheme = ThemeName
    SetTheme()
end

local ParticleConnection = nil
local ParticleFrames = {}
local ParticleStyles = {"None","Snowflakes","Rain","Stars","Bubbles"}

local function StopParticles()
    if ParticleConnection then ParticleConnection:Disconnect(); ParticleConnection = nil end
    for _, f in pairs(ParticleFrames) do pcall(function() f:Destroy() end) end
    ParticleFrames = {}
end

local function StartParticles(Style, TargetFrame)
    StopParticles()
    if Style == "None" then return end
    local configs = {
        Snowflakes = {type="circle", colors={Color3.fromRGB(255,255,255),Color3.fromRGB(220,235,255),Color3.fromRGB(200,220,255)}, sizeMin=4, sizeMax=10, speedMin=40, speedMax=90, drift=true, fromBottom=false, spawnRate=0.10},
        Rain       = {type="rain",   colors={Color3.fromRGB(255, 216, 145),Color3.fromRGB(100,170,230),Color3.fromRGB(160,220,255),Color3.fromRGB(80,140,210)}, sizeMin=2, sizeMax=4, lengthMin=8, lengthMax=22, speedMin=180, speedMax=320, drift=false, fromBottom=false, spawnRate=0.03},
        Stars      = {type="diamond",colors={Color3.fromRGB(255,240,100),Color3.fromRGB(255,255,180),Color3.fromRGB(255,220,80),Color3.fromRGB(200,200,255),Color3.fromRGB(255,255,255)}, sizeMin=6, sizeMax=14, speedMin=4, speedMax=18, drift=true, fromBottom=false, spawnRate=0.28, random=true, twinkle=true},
        Bubbles    = {type="text",   chars={"○","◯","◌"}, colors={Color3.fromRGB(255, 216, 145),Color3.fromRGB(180,230,255)}, sizeMin=10, sizeMax=22, speedMin=20, speedMax=60, drift=true, fromBottom=true, spawnRate=0.25},
    }
    local cfg = configs[Style]
    if not cfg then return end

    local function Spawn()
        local frameW = TargetFrame.AbsoluteSize.X
        local frameH = TargetFrame.AbsoluteSize.Y
        if frameW <= 1 or frameH <= 1 then return end
        local color = cfg.colors[math.random(1,#cfg.colors)]
        local size  = math.random(cfg.sizeMin, cfg.sizeMax)
        local speed = math.random(cfg.speedMin, cfg.speedMax)
        local startX = math.random(0, math.max(1, frameW-20))
        local startY, endY
        if cfg.fromBottom then startY = frameH + 10; endY = -20
        elseif cfg.random  then startY = math.random(0, frameH); endY = startY - math.random(80,200)
        else startY = -20; endY = frameH + 20 end
        local length = cfg.lengthMin and math.random(cfg.lengthMin, cfg.lengthMax) or size
        local p
        if cfg.type == "circle" then
            p = Instance.new("Frame"); p.BackgroundColor3=color; p.BackgroundTransparency=math.random(0,2)*0.15; p.BorderSizePixel=0; p.Size=UDim2.new(0,size,0,size); p.Position=UDim2.new(0,startX,0,startY); p.ZIndex=2
            Instance.new("UICorner",p).CornerRadius=UDim.new(1,0)
        elseif cfg.type == "rain" then
            p = Instance.new("Frame"); p.BackgroundColor3=color; p.BackgroundTransparency=0.2+math.random()*0.3; p.BorderSizePixel=0; p.Size=UDim2.new(0,size,0,length); p.Position=UDim2.new(0,startX,0,startY); p.ZIndex=2
            local g=Instance.new("UIGradient",p); g.Rotation=90; g.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.8),NumberSequenceKeypoint.new(0.4,0.3),NumberSequenceKeypoint.new(1,0.05)})
            Instance.new("UICorner",p).CornerRadius=UDim.new(1,0)
        elseif cfg.type == "diamond" then
            p = Instance.new("Frame"); p.BackgroundColor3=color; p.BackgroundTransparency=math.random(0,2)*0.15; p.BorderSizePixel=0; p.Rotation=45; p.Size=UDim2.new(0,size,0,size); p.Position=UDim2.new(0,startX,0,startY); p.ZIndex=2
        else
            p = Instance.new("TextLabel"); p.BackgroundTransparency=1; p.Text=cfg.chars[math.random(1,#cfg.chars)]; p.TextColor3=color; p.TextSize=size; p.Font=Enum.Font.GothamBold; p.Size=UDim2.new(0,size+4,0,size+4); p.Position=UDim2.new(0,startX,0,startY); p.TextTransparency=math.random(0,2)*0.1; p.ZIndex=2
        end
        p.Parent = TargetFrame
        table.insert(ParticleFrames, p)
        local driftOffset, driftSpeed = 0, cfg.drift and (math.random()-0.5)*25 or 0
        local elapsed, totalTime = 0, math.abs(endY-startY)/speed
        local conn
        conn = RunService.RenderStepped:Connect(function(dt)
            if not p or not p.Parent then conn:Disconnect() return end
            elapsed = elapsed + dt
            if elapsed >= totalTime then
                conn:Disconnect()
                for i,v in ipairs(ParticleFrames) do if v==p then table.remove(ParticleFrames,i) break end end
                p:Destroy(); return
            end
            local progress = elapsed/totalTime
            driftOffset = driftOffset + driftSpeed*dt
            p.Position = UDim2.new(0, startX+driftOffset, 0, startY+(endY-startY)*progress)
            if cfg.twinkle then
                local tw = 0.05+0.65*math.abs(math.sin(elapsed*2.2+startX*0.05))
                if p:IsA("Frame") then p.BackgroundTransparency=tw elseif p:IsA("TextLabel") then p.TextTransparency=tw end
            end
        end)
    end

    local spawnTimer = 0
    ParticleConnection = RunService.RenderStepped:Connect(function(dt)
        spawnTimer = spawnTimer + dt
        if spawnTimer >= cfg.spawnRate then spawnTimer=0; pcall(Spawn) end
    end)
end

function Library:StartParticles(Style, ParentFrame)
    StartParticles(Style, ParentFrame or Container)
end

local function InjectThemeDropdown(ElementTable)
    local themeNames = {}
    for k in pairs(Library.Themes) do table.insert(themeNames, k) end
    table.sort(themeNames)
    ElementTable:AddDropdown({Name="Color Theme", Options=themeNames, Default=Library.SelectedTheme, Callback=function(Value) Library:ApplyTheme(Value) end})
end

local function InjectParticleDropdown(ElementTable, ParentFrame)
    ElementTable:AddDropdown({Name="Background Effect", Options=ParticleStyles, Default="None", Callback=function(Value) StartParticles(Value, ParentFrame or Container) end})
end

function Library:AddThemeDropdown(ElementTable) InjectThemeDropdown(ElementTable) end
function Library:AddParticleDropdown(ElementTable, ParentFrame) InjectParticleDropdown(ElementTable, ParentFrame) end

function Library:MakeThemeTab(TabFunction, ParentFrame)
    local AppTab = TabFunction:MakeTab({Name = "Appearance", Icon = "rbxassetid://4483345998"})
    InjectThemeDropdown(AppTab)
    InjectParticleDropdown(AppTab, ParentFrame)
    return AppTab
end

task.delay(0.5, function()
    if SaveEnabled then LoadConfig() end
end)

return Library