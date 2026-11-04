-- script was made by GrifickMine, surely other scripts was taken.

local sizeMultiplier = 1.5 -- u can change size if you want.
-- although you can change size, supported only 1.5 - as default size

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local toggleKey = Enum.KeyCode.K
local guiBindBtn

local guiVisible = true
local waitingForKey = false

if not CoreGui:FindFirstChild("UnifiedControlGUI") then
    print("Made by GrifickMine")
    print("Youtube: @GrifickMine_playing")
    print("Thanks for using my script!")
end

if CoreGui:FindFirstChild("UnifiedControlGUI") then
    CoreGui.UnifiedControlGUI:Destroy()
    print('Arleady loaded')
end

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "UnifiedControlGUI"
MainGui.ResetOnSpawn = false
MainGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 150 * sizeMultiplier, 0, 288 * sizeMultiplier)
MainFrame.Position = UDim2.new(0.5, -75 * sizeMultiplier, 0.4, -130 * sizeMultiplier)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = MainGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local UIStrokeGradient = Instance.new("UIGradient")
UIStrokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 150)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(130, 0, 255)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 150))
})

UIStrokeGradient.Parent = UIStroke
RunService.RenderStepped:Connect(function()
    UIStrokeGradient.Rotation = (UIStrokeGradient.Rotation + 2.5) % 360
end)

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15 * sizeMultiplier, 0, 7 * sizeMultiplier)
Title.Size = UDim2.new(0, 110 * sizeMultiplier, 0, 14 * sizeMultiplier)
Title.Font = Enum.Font.GothamBold
Title.Text = "Multi-Hack Panel"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 8 * sizeMultiplier
Title.Parent = MainFrame

local Line = Instance.new("Frame")
Line.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 9 * sizeMultiplier, 0, 25 * sizeMultiplier)
Line.Size = UDim2.new(0, 132 * sizeMultiplier, 0, 1 * sizeMultiplier)
Line.Parent = MainFrame

local KeybindMenu = Instance.new("Frame")
KeybindMenu.Name = "KeybindMenu"
KeybindMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeybindMenu.Position = UDim2.new(0.5, 116, 0.5, -217)
KeybindMenu.Size = UDim2.new(0, 130, 0, 190)
KeybindMenu.Visible = false
KeybindMenu.Active = true
KeybindMenu.Draggable = true
KeybindMenu.Parent = MainFrame

local KeybindCorner = Instance.new("UICorner")
KeybindCorner.CornerRadius = UDim.new(0, 7)
KeybindCorner.Parent = KeybindMenu

local KeybindTitle = Instance.new("TextLabel")
KeybindTitle.BackgroundTransparency = 1
KeybindTitle.Position = UDim2.new(0, 0, 0, 5)
KeybindTitle.Size = UDim2.new(1, 0, 0, 20)
KeybindTitle.Font = Enum.Font.GothamBold
KeybindTitle.Text = "Change GUI Toggle Key"
KeybindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeybindTitle.TextSize = 10
KeybindTitle.Parent = KeybindMenu

local KeybindDesc = Instance.new("TextLabel")
KeybindDesc.BackgroundTransparency = 1
KeybindDesc.Position = UDim2.new(0, 10, 0, 30)
KeybindDesc.Size = UDim2.new(1, -20, 0, 40)
KeybindDesc.Font = Enum.Font.Gotham
KeybindDesc.Text = "Press 'Read Key' and\nthen press your key"
KeybindDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
KeybindDesc.TextSize = 8
KeybindDesc.TextWrapped = true
KeybindDesc.Parent = KeybindMenu

local KeybindDisplay = Instance.new("TextLabel")
KeybindDisplay.Name = "KeybindDisplay"
KeybindDisplay.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
KeybindDisplay.Position = UDim2.new(0.5, -50, 0.5, -10)
KeybindDisplay.Size = UDim2.new(0, 100, 0, 30)
KeybindDisplay.Font = Enum.Font.GothamBold
KeybindDisplay.Text = "Current: K"
KeybindDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
KeybindDisplay.TextSize = 10
KeybindDisplay.Parent = KeybindMenu

local ReadKeyBtn = Instance.new("TextButton")
ReadKeyBtn.Name = "ReadKeyBtn"
ReadKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ReadKeyBtn.Position = UDim2.new(0.5, -50, 0.5, 30)
ReadKeyBtn.Size = UDim2.new(0, 100, 0, 25)
ReadKeyBtn.Font = Enum.Font.Gotham
ReadKeyBtn.Text = "Read Key"
ReadKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ReadKeyBtn.TextSize = 9
ReadKeyBtn.Parent = KeybindMenu

local ReadKeyCorner = Instance.new("UICorner")
ReadKeyCorner.CornerRadius = UDim.new(0, 3)
ReadKeyCorner.Parent = ReadKeyBtn

local KeybindClose = Instance.new("TextButton")
KeybindClose.Name = "KeybindClose"
KeybindClose.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeybindClose.Position = UDim2.new(0.5, -30, 0.5, 60)
KeybindClose.Size = UDim2.new(0, 60, 0, 25)
KeybindClose.Font = Enum.Font.Gotham
KeybindClose.Text = "Close"
KeybindClose.TextColor3 = Color3.fromRGB(255, 255, 255)
KeybindClose.TextSize = 9
KeybindClose.Parent = KeybindMenu

local KeybindCornerClose = Instance.new("UICorner")
KeybindCornerClose.CornerRadius = UDim.new(0, 3)
KeybindCornerClose.Parent = KeybindClose

local KeybindMenuBtn = Instance.new("TextButton")
KeybindMenuBtn.Name = "KeybindMenuBtn"
KeybindMenuBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeybindMenuBtn.Position = UDim2.new(1, -35 * sizeMultiplier, 0, 7 * sizeMultiplier)
KeybindMenuBtn.Size = UDim2.new(0, 13 * sizeMultiplier, 0, 13 * sizeMultiplier)
KeybindMenuBtn.Font = Enum.Font.GothamBold
KeybindMenuBtn.Text = "K"
KeybindMenuBtn.TextColor3 = Color3.fromRGB(130, 170, 255)
KeybindMenuBtn.TextSize = 10 * sizeMultiplier
KeybindMenuBtn.Parent = MainFrame

local keybindCorner = Instance.new("UICorner")
keybindCorner.CornerRadius = UDim.new(0, 3)
keybindCorner.Parent = KeybindMenuBtn

local ImportButton = Instance.new("TextButton")
ImportButton.Name = "ImportButton"
ImportButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ImportButton.Position = UDim2.new(1, -140 * sizeMultiplier, 0, 7 * sizeMultiplier)
ImportButton.Size = UDim2.new(0, 13 * sizeMultiplier, 0, 13 * sizeMultiplier)
ImportButton.Font = Enum.Font.GothamBold
ImportButton.Text = "I"
ImportButton.TextColor3 = Color3.fromRGB(130, 170, 255)
ImportButton.TextSize = 10 * sizeMultiplier
ImportButton.Parent = MainFrame
local ImportButtonCorner = Instance.new("UICorner")
ImportButtonCorner.CornerRadius = UDim.new(0, 3)
ImportButtonCorner.Parent = ImportButton


local ImportMenu = Instance.new("Frame")
ImportMenu.Name = "ImportMenu"
ImportMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ImportMenu.Position = UDim2.new(0.5, 116, 0.5, -23)
ImportMenu.Size = UDim2.new(0, 130, 0, 240)
ImportMenu.Visible = false
ImportMenu.Active = true
ImportMenu.Draggable = true
ImportMenu.Parent = MainFrame

local ImportCorner = Instance.new("UICorner")
ImportCorner.CornerRadius = UDim.new(0, 7)
ImportCorner.Parent = ImportMenu

local ImportClose = Instance.new("TextButton")
ImportClose.Name = "ImportClose"
ImportClose.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ImportClose.Position = UDim2.new(0.5, 36, 0.5, -115)
ImportClose.Size = UDim2.new(0, 20, 0, 20)
ImportClose.Font = Enum.Font.Gotham
ImportClose.Text = "X"
ImportClose.TextColor3 = Color3.fromRGB(255, 0, 0)
ImportClose.TextSize = 9
ImportClose.Parent = ImportMenu

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 5 * sizeMultiplier, 0, 3 * sizeMultiplier)
Title.Size = UDim2.new(0, 60 * sizeMultiplier, 0, 14 * sizeMultiplier)
Title.Font = Enum.Font.GothamBold
Title.Text = "Imports"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 8 * sizeMultiplier
Title.Parent = ImportMenu

local Line = Instance.new("Frame")
Line.BackgroundColor3 = Color3.fromRGB(65, 65, 75)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 4 * sizeMultiplier, 0, 20 * sizeMultiplier)
Line.Size = UDim2.new(0, 78 * sizeMultiplier, 0, 1.5 * sizeMultiplier)
Line.Parent = ImportMenu


local function styleImportMenuButton(btn, text, posY)
    btn.Parent = ImportMenu
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    btn.Position = UDim2.new(0, 7.5 * sizeMultiplier, 0, posY * sizeMultiplier)
    btn.Size = UDim2.new(0, 72 * sizeMultiplier, 0, 14.2 * sizeMultiplier)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(170, 170, 180)
    btn.TextSize = 7 * sizeMultiplier
    btn.Visible = true
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Parent = btn
    btnStroke.Color = Color3.fromRGB(35, 35, 45)
    btnStroke.Thickness = 1
    return btn
end
local NumbStSIMB = 25
local NumbAddStSIMB = 16.5
local FlyBtn = styleImportMenuButton(Instance.new("TextButton"), "Fly", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local AnAfkBtn = styleImportMenuButton(Instance.new("TextButton"), "Anti Afk", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local CtrlTpBtn = styleImportMenuButton(Instance.new("TextButton"), "Ctrl+Click Tp", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local FreecamBtn = styleImportMenuButton(Instance.new("TextButton"), "FreeCam", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local InvisibilityBtn = styleImportMenuButton(Instance.new("TextButton"), "Invisibility", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local InfYieldBtn = styleImportMenuButton(Instance.new("TextButton"), "Infinite Yield", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local DexExplBtn = styleImportMenuButton(Instance.new("TextButton"), "DEX explorer", NumbStSIMB)
NumbStSIMB = NumbStSIMB + NumbAddStSIMB
local FreeGamepassBtn = styleImportMenuButton(Instance.new("TextButton"), "Free Gamepass", NumbStSIMB)


ImportClose.MouseButton1Click:Connect(function()
    ImportMenu.Visible = not ImportMenu.Visible
end)

ImportButton.MouseButton1Click:Connect(function()
    ImportMenu.Visible = not ImportMenu.Visible
end)

AnAfkBtn.MouseButton1Click:Connect(function()
    AnAfkBtn.Visible = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))();
end)

InfYieldBtn.MouseButton1Click:Connect(function()
    InfYieldBtn.Visible = false
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

DexExplBtn.MouseButton1Click:Connect(function()
    DexExplBtn.Visible = false
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)

CtrlTpBtn.MouseButton1Click:Connect(function()
    local UIS = game:GetService("UserInputService")
    local Player = game.Players.LocalPlayer
    local Mouse = Player:GetMouse()
    function GetCharacter()
        return game.Players.LocalPlayer.Character
    end
    function Teleport(pos)
    local Char = GetCharacter()
        if Char then
            Char:MoveTo(pos)
        end
    end
    UIS.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
            Teleport(Mouse.Hit.p)
        end
    end)
    CtrlTpBtn.Visible = false
end)


FreecamBtn.MouseButton1Click:Connect(function()
    FreecamBtn.Visible = false
    local pi    = math.pi
    local abs   = math.abs
    local clamp = math.clamp
    local exp   = math.exp
    local rad   = math.rad
    local sign  = math.sign
    local sqrt  = math.sqrt
    local tan   = math.tan

    game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "FreeCam Script";
        Text = "Shift+P to activate";})
    Duration = 5;

    local ContextActionService = game:GetService("ContextActionService")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local StarterGui = game:GetService("StarterGui")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local Settings = UserSettings()
    local GameSettings = Settings.GameSettings

    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end

    local Camera = Workspace.CurrentCamera
    Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local newCamera = Workspace.CurrentCamera
        if newCamera then
            Camera = newCamera
        end
    end)

    local FFlagUserExitFreecamBreaksWithShiftlock
    do
        local success, result = pcall(function()
            return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock")
        end)
        FFlagUserExitFreecamBreaksWithShiftlock = success and result
    end

    local FFlagUserShowGuiHideToggles
    do
        local success, result = pcall(function()
            return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
        end)
        FFlagUserShowGuiHideToggles = success and result
    end
    local FREECAM_ENABLED_ATTRIBUTE_NAME = "FreecamEnabled"
    local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
    local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
    local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}

    local NAV_GAIN = Vector3.new(1, 1, 1)*64
    local PAN_GAIN = Vector2.new(0.75, 1)*8
    local FOV_GAIN = 300

    local PITCH_LIMIT = rad(90)

    local VEL_STIFFNESS = 1.5
    local PAN_STIFFNESS = 1.0
    local FOV_STIFFNESS = 4.0
    local Spring = {} do
        Spring.__index = Spring
        function Spring.new(freq, pos)
            local self = setmetatable({}, Spring)
            self.f = freq
            self.p = pos
            self.v = pos*0
            return self
        end
        function Spring:Update(dt, goal)
            local f = self.f*2*pi
            local p0 = self.p
            local v0 = self.v

            local offset = goal - p0
            local decay = exp(-f*dt)

            local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
            local v1 = (f*dt*(offset*f - v0) + v0)*decay

            self.p = p1
            self.v = v1

            return p1
        end

        function Spring:Reset(pos)
            self.p = pos
            self.v = pos*0
        end
    end
    local cameraPos = Vector3.new()
    local cameraRot = Vector2.new()
    local cameraFov = 0

    local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
    local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
    local fovSpring = Spring.new(FOV_STIFFNESS, 0)
    local Input = {} do
        local thumbstickCurve do
            local K_CURVATURE = 2.0
            local K_DEADZONE = 0.15

            local function fCurve(x)
                return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
            end

            local function fDeadzone(x)
                return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
            end

            function thumbstickCurve(x)
                return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
            end
        end

        local gamepad = {
            ButtonX = 0,
            ButtonY = 0,
            DPadDown = 0,
            DPadUp = 0,
            ButtonL2 = 0,
            ButtonR2 = 0,
            Thumbstick1 = Vector2.new(),
            Thumbstick2 = Vector2.new(),
        }

        local keyboard = {
            W = 0,
            A = 0,
            S = 0,
            D = 0,
            E = 0,
            Q = 0,
            U = 0,
            H = 0,
            J = 0,
            K = 0,
            I = 0,
            Y = 0,
            Up = 0,
            Down = 0,
            LeftShift = 0,
            RightShift = 0,
        }

        local mouse = {
            Delta = Vector2.new(),
            MouseWheel = 0,
        }

        local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
        local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
        local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
        local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
        local FOV_WHEEL_SPEED    = 1.0
        local FOV_GAMEPAD_SPEED  = 0.25
        local NAV_ADJ_SPEED      = 0.75
        local NAV_SHIFT_MUL      = 0.25

        local navSpeed = 1

        function Input.Vel(dt)
            navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

            local kGamepad = Vector3.new(
                thumbstickCurve(gamepad.Thumbstick1.X),
                thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
                thumbstickCurve(-gamepad.Thumbstick1.Y)
            )*NAV_GAMEPAD_SPEED

            local kKeyboard = Vector3.new(
                keyboard.D - keyboard.A + keyboard.K - keyboard.H,
                keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
                keyboard.S - keyboard.W + keyboard.J - keyboard.U
            )*NAV_KEYBOARD_SPEED

            local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)

            return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
        end

        function Input.Pan(dt)
            local kGamepad = Vector2.new(
                thumbstickCurve(gamepad.Thumbstick2.Y),
                thumbstickCurve(-gamepad.Thumbstick2.X)
            )*PAN_GAMEPAD_SPEED
            local kMouse = mouse.Delta*PAN_MOUSE_SPEED
            mouse.Delta = Vector2.new()
            return kGamepad + kMouse
        end

        function Input.Fov(dt)
            local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
            local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
            mouse.MouseWheel = 0
            return kGamepad + kMouse
        end

        do
            local function Keypress(action, state, input)
                keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                return Enum.ContextActionResult.Sink
            end

            local function GpButton(action, state, input)
                gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                return Enum.ContextActionResult.Sink
            end

            local function MousePan(action, state, input)
                local delta = input.Delta
                mouse.Delta = Vector2.new(-delta.y, -delta.x)
                return Enum.ContextActionResult.Sink
            end

            local function Thumb(action, state, input)
                gamepad[input.KeyCode.Name] = input.Position
                return Enum.ContextActionResult.Sink
            end

            local function Trigger(action, state, input)
                gamepad[input.KeyCode.Name] = input.Position.z
                return Enum.ContextActionResult.Sink
            end

            local function MouseWheel(action, state, input)
                mouse[input.UserInputType.Name] = -input.Position.z
                return Enum.ContextActionResult.Sink
            end

            local function Zero(t)
                for k, v in pairs(t) do
                    t[k] = v*0
                end
            end

            function Input.StartCapture()
                ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
                    Enum.KeyCode.W, Enum.KeyCode.U,
                    Enum.KeyCode.A, Enum.KeyCode.H,
                    Enum.KeyCode.S, Enum.KeyCode.J,
                    Enum.KeyCode.D, Enum.KeyCode.K,
                    Enum.KeyCode.E, Enum.KeyCode.I,
                    Enum.KeyCode.Q, Enum.KeyCode.Y,
                    Enum.KeyCode.Up, Enum.KeyCode.Down
                )
                ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
                ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
                ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
                ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
                ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
            end

            function Input.StopCapture()
                navSpeed = 1
                Zero(gamepad)
                Zero(keyboard)
                Zero(mouse)
                ContextActionService:UnbindAction("FreecamKeyboard")
                ContextActionService:UnbindAction("FreecamMousePan")
                ContextActionService:UnbindAction("FreecamMouseWheel")
                ContextActionService:UnbindAction("FreecamGamepadButton")
                ContextActionService:UnbindAction("FreecamGamepadTrigger")
                ContextActionService:UnbindAction("FreecamGamepadThumbstick")
            end
        end
    end
    local function StepFreecam(dt)
        local vel = velSpring:Update(dt, Input.Vel(dt))
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))

        local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))

        cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
        cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
        cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))

        local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
        cameraPos = cameraCFrame.p

        Camera.CFrame = cameraCFrame
        Camera.Focus = cameraCFrame 
        Camera.FieldOfView = cameraFov
    end

    local function CheckMouseLockAvailability()
        local devAllowsMouseLock = Players.LocalPlayer.DevEnableMouseLock
        local devMovementModeIsScriptable = Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
        local userHasMouseLockModeEnabled = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
        local userHasClickToMoveEnabled =  GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
        local MouseLockAvailable = devAllowsMouseLock and userHasMouseLockModeEnabled and not userHasClickToMoveEnabled and not devMovementModeIsScriptable

        return MouseLockAvailable
    end

    local PlayerState = {} do
        local mouseBehavior
        local mouseIconEnabled
        local cameraType
        local cameraFocus
        local cameraCFrame
        local cameraFieldOfView
        local screenGuis = {}
        local coreGuis = {
            Backpack = true,
            Chat = true,
            Health = true,
            PlayerList = true,
        }
        local setCores = {
            BadgesNotificationsActive = true,
            PointsNotificationsActive = true,
        }

        function PlayerState.Push()
            for name in pairs(coreGuis) do
                coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
            end
            for name in pairs(setCores) do
                setCores[name] = StarterGui:GetCore(name)
                StarterGui:SetCore(name, false)
            end
            local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
            if playergui then
                for _, gui in pairs(playergui:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Enabled then
                        screenGuis[#screenGuis + 1] = gui
                        gui.Enabled = false
                    end
                end
            end

            cameraFieldOfView = Camera.FieldOfView
            Camera.FieldOfView = 70

            cameraType = Camera.CameraType
            Camera.CameraType = Enum.CameraType.Custom

            cameraCFrame = Camera.CFrame
            cameraFocus = Camera.Focus

            mouseIconEnabled = UserInputService.MouseIconEnabled
            UserInputService.MouseIconEnabled = false

            if FFlagUserExitFreecamBreaksWithShiftlock and CheckMouseLockAvailability() then
                mouseBehavior = Enum.MouseBehavior.Default
            else
                mouseBehavior = UserInputService.MouseBehavior
            end
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end

        -- Restore state
        function PlayerState.Pop()
            for name, isEnabled in pairs(coreGuis) do
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
            end
            for name, isEnabled in pairs(setCores) do
                StarterGui:SetCore(name, isEnabled)
            end
            for _, gui in pairs(screenGuis) do
                if gui.Parent then
                    gui.Enabled = true
                end
            end

            Camera.FieldOfView = cameraFieldOfView
            cameraFieldOfView = nil

            Camera.CameraType = cameraType
            cameraType = nil

            Camera.CFrame = cameraCFrame
            cameraCFrame = nil

            Camera.Focus = cameraFocus
            cameraFocus = nil

            UserInputService.MouseIconEnabled = mouseIconEnabled
            mouseIconEnabled = nil

            UserInputService.MouseBehavior = mouseBehavior
            mouseBehavior = nil
        end
    end

    local function StartFreecam()
        if FFlagUserShowGuiHideToggles then
            script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, true)
        end

        local cameraCFrame = Camera.CFrame
        cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
        cameraPos = cameraCFrame.p
        cameraFov = Camera.FieldOfView

        velSpring:Reset(Vector3.new())
        panSpring:Reset(Vector2.new())
        fovSpring:Reset(0)

        PlayerState.Push()
        RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
        Input.StartCapture()
    end

    local function StopFreecam()
        if FFlagUserShowGuiHideToggles then
            script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, false)
        end

        Input.StopCapture()
        RunService:UnbindFromRenderStep("Freecam")
        PlayerState.Pop()
    end
    do
        local enabled = false

        local function ToggleFreecam()
            if enabled then
                StopFreecam()
            else
                StartFreecam()
            end
            enabled = not enabled
        end

        local function CheckMacro(macro)
            for i = 1, #macro - 1 do
                if not UserInputService:IsKeyDown(macro[i]) then
                    return
                end
            end
            ToggleFreecam()
        end

        local function HandleActivationInput(action, state, input)
            if state == Enum.UserInputState.Begin then
                if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
                    CheckMacro(FREECAM_MACRO_KB)
                end
            end
            return Enum.ContextActionResult.Pass
        end

        ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])

        if FFlagUserShowGuiHideToggles then
            script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, enabled)
            script:GetAttributeChangedSignal(FREECAM_ENABLED_ATTRIBUTE_NAME):Connect(function()
                local attributeValue = script:GetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME)

                if typeof(attributeValue) ~= "boolean" then
                    script:SetAttribute(FREECAM_ENABLED_ATTRIBUTE_NAME, enabled)
                    return
                end
                if attributeValue ~= enabled then
                    if attributeValue then
                        StartFreecam()
                        enabled = true
                    else
                        StopFreecam()
                        enabled = false
                    end
                end
            end)
        end
    end
end)


InvisibilityBtn.MouseButton1Click:Connect(function()
    InvisibilityBtn.Visible = false
    loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
end)

FreeGamepassBtn.MouseButton1Click:Connect(function()
    FreeGamepassBtn.Visible = false
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local MarketplaceService = game:GetService("MarketplaceService")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    if playerGui:FindFirstChild("SeluwiaUI") then
        playerGui.SeluwiaUI:Destroy()
    end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SeluwiaUI"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui
    local isMobile = UserInputService.TouchEnabled
    local autoSpeed = 100
    local function stroke(parent, color, thickness)
        local s = Instance.new("UIStroke", parent)
        s.Color = color or Color3.fromRGB(40, 40, 56)
        s.Thickness = thickness or 1
        return s
    end
    local function corner(parent, radius)
        local c = Instance.new("UICorner", parent)
        c.CornerRadius = UDim.new(0, radius or 10)
        return c
    end
    local function getTime()
        return os.date("%H:%M:%S")
    end
    local panelSize
    local fontSizeScale = isMobile and 0.8 or 1
    local buttonHeight = isMobile and 36 or 28
    local titleBarHeight = isMobile and 44 or 52
    local footerHeight = isMobile and 44 or 50
    if isMobile then
        panelSize = UDim2.new(0.9, 0, 0.7, 0)
    else
        panelSize = UDim2.new(0, 760, 0, 520)
    end
    local panel = Instance.new("Frame")
    panel.Name = "Panel"
    panel.Size = panelSize
    panel.Position = UDim2.new(0.5, -panelSize.X.Offset/2, 0.5, -panelSize.Y.Offset/2)
    if isMobile then
        panel.Position = UDim2.new(0.05, 0, 0.15, 0)
    end
    panel.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    panel.BorderSizePixel = 0
    panel.Parent = screenGui
    corner(panel, 16)
    stroke(panel, Color3.fromRGB(30, 30, 42), 1)

    -- Resize handle (PC only)
    if not isMobile then
        local resizeHandle = Instance.new("Frame")
        resizeHandle.Name = "ResizeHandle"
        resizeHandle.Size = UDim2.new(0, 20, 0, 20)
        resizeHandle.Position = UDim2.new(1, -20, 1, -20)
        resizeHandle.AnchorPoint = Vector2.new(1, 1)
        resizeHandle.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        resizeHandle.BorderSizePixel = 0
        resizeHandle.Parent = panel
        corner(resizeHandle, 4)
        stroke(resizeHandle, Color3.fromRGB(80, 80, 110), 1)

        local resizing = false
        local resizeStartPos, startSize
        resizeHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                resizing = true
                resizeStartPos = input.Position
                startSize = panel.AbsoluteSize
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - resizeStartPos
                local newWidth = math.clamp(startSize.X + delta.X, 400, 1200)
                local newHeight = math.clamp(startSize.Y + delta.Y, 300, 800)
                panel.Size = UDim2.new(0, newWidth, 0, newHeight)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                resizing = false
            end
        end)
    end

    -- Dragging
    local dragging = false
    local dragStart, startPos

    local function onInputBegan(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not resizing then
            dragging = true
            dragStart = input.Position
            startPos = panel.Position
        end
    end

    local function onInputChanged(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    local function onInputEnded(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end

    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, titleBarHeight)
    titleBar.BackgroundColor3 = Color3.fromRGB(13, 13, 17)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = panel
    corner(titleBar, 16)
    stroke(titleBar, Color3.fromRGB(22, 22, 31), 1)

    local titleFill = Instance.new("Frame")
    titleFill.Size = UDim2.new(1, 0, 0, 18)
    titleFill.Position = UDim2.new(0, 0, 1, -18)
    titleFill.BackgroundColor3 = Color3.fromRGB(13, 13, 17)
    titleFill.BorderSizePixel = 0
    titleFill.ZIndex = titleBar.ZIndex + 1
    titleFill.Parent = titleBar

    titleBar.InputBegan:Connect(onInputBegan)
    UserInputService.InputChanged:Connect(onInputChanged)
    UserInputService.InputEnded:Connect(onInputEnded)

    -- Live dot
    local liveDot = Instance.new("Frame")
    liveDot.Size = UDim2.new(0, 9, 0, 9)
    liveDot.Position = UDim2.new(0, 20, 0.5, -4)
    liveDot.BackgroundColor3 = Color3.fromRGB(61, 255, 160)
    liveDot.BorderSizePixel = 0
    liveDot.ZIndex = titleBar.ZIndex + 2
    liveDot.Parent = titleBar
    corner(liveDot, 999)

    local liveLabel = Instance.new("TextLabel")
    liveLabel.Size = UDim2.new(0, 50, 0, 20)
    liveLabel.Position = UDim2.new(0, 34, 0.5, -10)
    liveLabel.BackgroundTransparency = 1
    liveLabel.Text = "LIVE"
    liveLabel.TextColor3 = Color3.fromRGB(61, 255, 160)
    liveLabel.TextSize = 11 * fontSizeScale
    liveLabel.Font = Enum.Font.GothamBold
    liveLabel.TextXAlignment = Enum.TextXAlignment.Left
    liveLabel.ZIndex = titleBar.ZIndex + 2
    liveLabel.Parent = titleBar

    task.spawn(function()
        while screenGui.Parent do
            TweenService:Create(liveDot, TweenInfo.new(1), {Size = UDim2.new(0,11,0,11), Position = UDim2.new(0,19,0.5,-5)}):Play()
            task.wait(1)
            TweenService:Create(liveDot, TweenInfo.new(1), {Size = UDim2.new(0,9,0,9), Position = UDim2.new(0,20,0.5,-4)}):Play()
            task.wait(1)
        end
    end)

    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(0, 200, 1, 0)
    titleText.Position = UDim2.new(0.5, -100, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "SELUWIA"
    titleText.TextColor3 = Color3.fromRGB(210, 210, 228)
    titleText.TextSize = 14 * fontSizeScale
    titleText.Font = Enum.Font.GothamBold
    titleText.ZIndex = titleBar.ZIndex + 2
    titleText.Parent = titleBar

    local clearBtn = Instance.new("TextButton")
    clearBtn.Size = UDim2.new(0, 76, 0, 30)
    clearBtn.Position = UDim2.new(1, -92, 0.5, -15)
    clearBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    clearBtn.Text = "X Clear"
    clearBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    clearBtn.TextSize = 11 * fontSizeScale
    clearBtn.Font = Enum.Font.GothamBold
    clearBtn.BorderSizePixel = 0
    clearBtn.ZIndex = titleBar.ZIndex + 3
    clearBtn.Parent = titleBar
    corner(clearBtn, 8)
    stroke(clearBtn, Color3.fromRGB(80, 28, 28), 1)

    clearBtn.MouseEnter:Connect(function()
        clearBtn.BackgroundColor3 = Color3.fromRGB(28, 10, 10)
    end)
    clearBtn.MouseLeave:Connect(function()
        clearBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    end)

    -- Log area
    local logArea = Instance.new("ScrollingFrame")
    logArea.Name = "LogArea"
    logArea.Size = UDim2.new(1, -12, 1, -(titleBarHeight + footerHeight + 10))
    logArea.Position = UDim2.new(0, 6, 0, titleBarHeight + 6)
    logArea.BackgroundTransparency = 1
    logArea.BorderSizePixel = 0
    logArea.ScrollBarThickness = isMobile and 6 or 3
    logArea.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 90)
    logArea.CanvasSize = UDim2.new(0, 0, 0, 0)
    logArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
    logArea.Parent = panel

    local listLayout = Instance.new("UIListLayout", logArea)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, isMobile and 10 or 7)
    listLayout.VerticalAlignment = Enum.VerticalAlignment.Top

    local logPad = Instance.new("UIPadding", logArea)
    logPad.PaddingTop = UDim.new(0, 8)
    logPad.PaddingBottom = UDim.new(0, 6)
    logPad.PaddingLeft = UDim.new(0, 4)
    logPad.PaddingRight = UDim.new(0, 4)

    -- Footer
    local footer = Instance.new("Frame")
    footer.Size = UDim2.new(1, 0, 0, footerHeight)
    footer.Position = UDim2.new(0, 0, 1, -footerHeight)
    footer.BackgroundColor3 = Color3.fromRGB(13, 13, 17)
    footer.BorderSizePixel = 0
    footer.Parent = panel
    corner(footer, 16)

    local footerFill = Instance.new("Frame")
    footerFill.Size = UDim2.new(1, 0, 0, 18)
    footerFill.BackgroundColor3 = Color3.fromRGB(13, 13, 17)
    footerFill.BorderSizePixel = 0
    footerFill.Parent = footer

    local countLabel = Instance.new("TextLabel")
    countLabel.Size = UDim2.new(0, 160, 1, 0)
    countLabel.Position = UDim2.new(0, 20, 0, 0)
    countLabel.BackgroundTransparency = 1
    countLabel.Text = "0 events captured"
    countLabel.TextColor3 = Color3.fromRGB(160, 155, 200)
    countLabel.TextSize = 12 * fontSizeScale
    countLabel.Font = Enum.Font.Gotham
    countLabel.TextXAlignment = Enum.TextXAlignment.Left
    countLabel.ZIndex = footer.ZIndex + 1
    countLabel.Parent = footer

    local settingsBtn = Instance.new("TextButton")
    settingsBtn.Size = UDim2.new(0, 50, 0, buttonHeight)
    settingsBtn.Position = UDim2.new(1, -90, 0.5, -buttonHeight/2)
    settingsBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    settingsBtn.Text = "SET"
    settingsBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
    settingsBtn.TextSize = 11 * fontSizeScale
    settingsBtn.Font = Enum.Font.GothamBold
    settingsBtn.BorderSizePixel = 0
    settingsBtn.ZIndex = footer.ZIndex + 1
    settingsBtn.Parent = footer
    corner(settingsBtn, 7)
    stroke(settingsBtn, Color3.fromRGB(55, 50, 85), 1)

    local stopAllBtn = Instance.new("TextButton")
    stopAllBtn.Size = UDim2.new(0, 80, 0, buttonHeight)
    stopAllBtn.Position = UDim2.new(1, -170, 0.5, -buttonHeight/2)
    stopAllBtn.BackgroundColor3 = Color3.fromRGB(35, 15, 15)
    stopAllBtn.Text = "Stop All"
    stopAllBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
    stopAllBtn.TextSize = 11 * fontSizeScale
    stopAllBtn.Font = Enum.Font.GothamBold
    stopAllBtn.BorderSizePixel = 0
    stopAllBtn.ZIndex = footer.ZIndex + 1
    stopAllBtn.Parent = footer
    corner(stopAllBtn, 7)
    stroke(stopAllBtn, Color3.fromRGB(80, 30, 30), 1)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 26, 0, 26)
    closeBtn.Position = UDim2.new(1, -6, 0, -6)
    closeBtn.AnchorPoint = Vector2.new(1, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(35, 12, 12)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
    closeBtn.TextSize = 17 * fontSizeScale
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.ZIndex = 10
    closeBtn.Parent = panel
    corner(closeBtn, 999)

    -- Settings window (toggle)
    local settingsWindow = nil
    local function toggleSettings()
        if settingsWindow then
            settingsWindow:Destroy()
            settingsWindow = nil
        else
            settingsWindow = Instance.new("Frame")
            settingsWindow.Name = "SettingsWindow"
            settingsWindow.Size = UDim2.new(0, 300, 0, 200)
            settingsWindow.Position = UDim2.new(0.5, -150, 0.5, -100)
            settingsWindow.BackgroundColor3 = Color3.fromRGB(13, 13, 17)
            settingsWindow.BorderSizePixel = 0
            settingsWindow.ZIndex = 50
            settingsWindow.Parent = screenGui
            corner(settingsWindow, 12)
            stroke(settingsWindow, Color3.fromRGB(30, 30, 45), 1)

            local settingsTitleBar = Instance.new("Frame")
            settingsTitleBar.Size = UDim2.new(1, 0, 0, 40)
            settingsTitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
            settingsTitleBar.BorderSizePixel = 0
            settingsTitleBar.ZIndex = 51
            settingsTitleBar.Parent = settingsWindow
            corner(settingsTitleBar, 12)

            local settingsTitle = Instance.new("TextLabel")
            settingsTitle.Size = UDim2.new(1, -40, 1, 0)
            settingsTitle.Position = UDim2.new(0, 10, 0, 0)
            settingsTitle.BackgroundTransparency = 1
            settingsTitle.Text = "Settings"
            settingsTitle.TextColor3 = Color3.fromRGB(210, 210, 228)
            settingsTitle.TextSize = 14
            settingsTitle.Font = Enum.Font.GothamBold
            settingsTitle.TextXAlignment = Enum.TextXAlignment.Left
            settingsTitle.ZIndex = 52
            settingsTitle.Parent = settingsTitleBar

            local closeSettingsBtn = Instance.new("TextButton")
            closeSettingsBtn.Size = UDim2.new(0, 24, 0, 24)
            closeSettingsBtn.Position = UDim2.new(1, -30, 0, 8)
            closeSettingsBtn.BackgroundColor3 = Color3.fromRGB(35, 12, 12)
            closeSettingsBtn.Text = "X"
            closeSettingsBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
            closeSettingsBtn.TextSize = 14
            closeSettingsBtn.Font = Enum.Font.GothamBold
            closeSettingsBtn.BorderSizePixel = 0
            closeSettingsBtn.ZIndex = 52
            closeSettingsBtn.Parent = settingsTitleBar
            corner(closeSettingsBtn, 12)
            closeSettingsBtn.MouseButton1Click:Connect(function()
                if settingsWindow then
                    settingsWindow:Destroy()
                    settingsWindow = nil
                end
            end)

            -- Drag settings window
            local dragStartPos, dragStartMouse
            local draggingSettings = false
            settingsTitleBar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    draggingSettings = true
                    dragStartPos = settingsWindow.Position
                    dragStartMouse = input.Position
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if draggingSettings and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local delta = input.Position - dragStartMouse
                    settingsWindow.Position = UDim2.new(dragStartPos.X.Scale, dragStartPos.X.Offset + delta.X, dragStartPos.Y.Scale, dragStartPos.Y.Offset + delta.Y)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    draggingSettings = false
                end
            end)

            local speedLabel = Instance.new("TextLabel")
            speedLabel.Size = UDim2.new(0, 140, 0, 30)
            speedLabel.Position = UDim2.new(0, 20, 0, 60)
            speedLabel.BackgroundTransparency = 1
            speedLabel.Text = "Signals per second:"
            speedLabel.TextColor3 = Color3.fromRGB(170, 165, 220)
            speedLabel.TextSize = 12
            speedLabel.Font = Enum.Font.Gotham
            speedLabel.TextXAlignment = Enum.TextXAlignment.Left
            speedLabel.ZIndex = 51
            speedLabel.Parent = settingsWindow

            local speedBox = Instance.new("TextBox")
            speedBox.Size = UDim2.new(0, 100, 0, 30)
            speedBox.Position = UDim2.new(0, 170, 0, 60)
            speedBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            speedBox.Text = tostring(autoSpeed)
            speedBox.TextColor3 = Color3.fromRGB(210, 210, 228)
            speedBox.TextSize = 12
            speedBox.Font = Enum.Font.Gotham
            speedBox.BorderSizePixel = 0
            speedBox.ZIndex = 51
            speedBox.Parent = settingsWindow
            corner(speedBox, 6)
            stroke(speedBox, Color3.fromRGB(55, 50, 85), 1)

            local speedHint = Instance.new("TextLabel")
            speedHint.Size = UDim2.new(0, 260, 0, 20)
            speedHint.Position = UDim2.new(0, 20, 0, 95)
            speedHint.BackgroundTransparency = 1
            speedHint.Text = "1 = slowest  |  10000 = fastest  |  Default: 100"
            speedHint.TextColor3 = Color3.fromRGB(120, 120, 158)
            speedHint.TextSize = 10
            speedHint.Font = Enum.Font.Gotham
            speedHint.TextXAlignment = Enum.TextXAlignment.Left
            speedHint.ZIndex = 51
            speedHint.Parent = settingsWindow

            local saveBtn = Instance.new("TextButton")
            saveBtn.Size = UDim2.new(0, 100, 0, 32)
            saveBtn.Position = UDim2.new(0.5, -50, 1, -45)
            saveBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            saveBtn.Text = "Save"
            saveBtn.TextColor3 = Color3.fromRGB(61, 255, 160)
            saveBtn.TextSize = 12
            saveBtn.Font = Enum.Font.GothamBold
            saveBtn.BorderSizePixel = 0
            saveBtn.ZIndex = 51
            saveBtn.Parent = settingsWindow
            corner(saveBtn, 7)
            stroke(saveBtn, Color3.fromRGB(45, 80, 60), 1)

            local savedMsg = nil
            saveBtn.MouseButton1Click:Connect(function()
                local newSpeed = tonumber(speedBox.Text)
                if newSpeed then
                    newSpeed = math.floor(newSpeed)
                    if newSpeed >= 1 and newSpeed <= 10000 then
                        autoSpeed = newSpeed
                        speedBox.Text = tostring(autoSpeed)
                        speedBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
                        if savedMsg then savedMsg:Destroy() end
                        savedMsg = Instance.new("TextLabel")
                        savedMsg.Size = UDim2.new(0, 100, 0, 20)
                        savedMsg.Position = UDim2.new(0.5, -50, 1, -20)
                        savedMsg.BackgroundTransparency = 1
                        savedMsg.Text = "Saved!"
                        savedMsg.TextColor3 = Color3.fromRGB(61, 255, 160)
                        savedMsg.TextSize = 10
                        savedMsg.Font = Enum.Font.GothamBold
                        savedMsg.ZIndex = 52
                        savedMsg.Parent = settingsWindow
                        task.wait(1.5)
                        if savedMsg then savedMsg:Destroy() end
                    else
                        speedBox.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
                        task.wait(0.5)
                        speedBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
                    end
                else
                    speedBox.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
                    task.wait(0.5)
                    speedBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
                end
            end)
        end
    end

    settingsBtn.MouseButton1Click:Connect(toggleSettings)

    -- Visibility toggles
    local uiVisible = true
    local reopenButton = nil

    local function showGui()
        if not screenGui.Enabled then
            screenGui.Enabled = true
            uiVisible = true
            if reopenButton then reopenButton.Visible = false end
        end
    end

    local function hideGui()
        if screenGui.Enabled then
            screenGui.Enabled = false
            uiVisible = false
            if isMobile then
                if not reopenButton or not reopenButton.Parent then
                    reopenButton = Instance.new("TextButton")
                    reopenButton.Size = UDim2.new(0, 56, 0, 56)
                    reopenButton.Position = UDim2.new(1, -70, 1, -70)
                    reopenButton.AnchorPoint = Vector2.new(1, 1)
                    reopenButton.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
                    reopenButton.Text = "S"
                    reopenButton.TextColor3 = Color3.fromRGB(210, 210, 228)
                    reopenButton.TextSize = 24
                    reopenButton.Font = Enum.Font.GothamBold
                    reopenButton.BorderSizePixel = 0
                    reopenButton.ZIndex = 100
                    reopenButton.Parent = playerGui
                    corner(reopenButton, 28)
                    stroke(reopenButton, Color3.fromRGB(80, 70, 120), 1.5)

                    local dragStartPos, dragStartMouse
                    reopenButton.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragStartPos = reopenButton.Position
                            dragStartMouse = input.Position
                            local moveConn, endConn
                            moveConn = UserInputService.InputChanged:Connect(function(input2)
                                if input2.UserInputType == input.UserInputType then
                                    local delta = input2.Position - dragStartMouse
                                    reopenButton.Position = UDim2.new(dragStartPos.X.Scale, dragStartPos.X.Offset + delta.X, dragStartPos.Y.Scale, dragStartPos.Y.Offset + delta.Y)
                                end
                            end)
                            endConn = UserInputService.InputEnded:Connect(function(input2)
                                if input2.UserInputType == input.UserInputType then
                                    moveConn:Disconnect()
                                    endConn:Disconnect()
                                end
                            end)
                        end
                    end)

                    reopenButton.MouseButton1Click:Connect(showGui)
                else
                    reopenButton.Visible = true
                end
            end
        end
    end

    closeBtn.MouseButton1Click:Connect(hideGui)

    if not isMobile then
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.RightShift then
                if uiVisible then hideGui() else showGui() end
            end
        end)
    end

    -- Log management
    local eventCount = 0
    local entries = {}
    local suppressCounter = 0

    local function fireFakeSignal(signalType, id)
        suppressCounter = suppressCounter + 1
        pcall(function()
            if signalType == "Product" then
                MarketplaceService:SignalPromptProductPurchaseFinished(player.UserId, id, true)
            elseif signalType == "Gamepass" then
                MarketplaceService:SignalPromptGamePassPurchaseFinished(player, id, true)
            elseif signalType == "Bulk" then
                MarketplaceService:SignalPromptBulkPurchaseFinished(player.UserId, id, true)
            elseif signalType == "Purchase" then
                MarketplaceService:SignalPromptPurchaseFinished(player.UserId, id, true)
            end
        end)
        suppressCounter = suppressCounter - 1
    end

    local function makeEmptyLabel()
        local el = Instance.new("TextLabel")
        el.Name = "EmptyState"
        el.Size = UDim2.new(1, 0, 0, 260)
        el.BackgroundTransparency = 1
        el.Text = "Waiting for events…\nAll marketplace events will appear here."
        el.TextColor3 = Color3.fromRGB(120, 120, 158)
        el.TextSize = 13 * fontSizeScale
        el.Font = Enum.Font.Gotham
        el.TextWrapped = true
        el.LayoutOrder = 99999
        el.Parent = logArea
        return el
    end

    local function setEmpty(show)
        local e = logArea:FindFirstChild("EmptyState")
        if show and not e then
            makeEmptyLabel()
        elseif not show and e then
            e:Destroy()
        end
    end

    local activeAutoButtons = {}
    local activeSpamButtons = {}

    local function stopAllAutoAndSpam()
        for btn, data in pairs(activeAutoButtons) do
            data.active = false
            if data.loop then task.cancel(data.loop) end
            if btn and btn.Parent then
                btn.Text = "Auto"
                btn.TextColor3 = Color3.fromRGB(170, 165, 220)
                btn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            end
        end
        table.clear(activeAutoButtons)
        for btn, data in pairs(activeSpamButtons) do
            data.active = false
            if data.loop then task.cancel(data.loop) end
            if btn and btn.Parent then
                btn.Text = "Run"
                btn.TextColor3 = Color3.fromRGB(170, 165, 220)
                btn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            end
        end
        table.clear(activeSpamButtons)
    end

    stopAllBtn.MouseButton1Click:Connect(stopAllAutoAndSpam)

    local function addLog(label, id, signalType)
        if suppressCounter > 0 then return end
        setEmpty(false)
        local entryHeight = isMobile and 56 or 46
        local entry = Instance.new("Frame")
        entry.Size = UDim2.new(1, -2, 0, entryHeight)
        entry.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
        entry.BorderSizePixel = 0
        entry.LayoutOrder = -(eventCount)
        entry.Parent = logArea
        corner(entry, 10)
        stroke(entry, Color3.fromRGB(48, 46, 70), 1)
        entry.BackgroundTransparency = 1
        TweenService:Create(entry, TweenInfo.new(0.18), {BackgroundTransparency = 0}):Play()

        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = UDim2.new(0, 14, 0.5, -4)
        dot.BackgroundColor3 = Color3.fromRGB(61, 255, 160)
        dot.BorderSizePixel = 0
        dot.Parent = entry
        corner(dot, 999)

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(0, 76, 1, 0)
        lbl.Position = UDim2.new(0, 28, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = string.upper(label)
        lbl.TextColor3 = Color3.fromRGB(160, 150, 210)
        lbl.TextSize = 10 * fontSizeScale
        lbl.Font = Enum.Font.GothamBold
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = entry

        local idEl = Instance.new("TextLabel")
        idEl.Size = UDim2.new(0, 200, 1, 0)
        idEl.Position = UDim2.new(0, 108, 0, 0)
        idEl.BackgroundTransparency = 1
        idEl.Text = tostring(id)
        idEl.TextColor3 = Color3.fromRGB(220, 220, 240)
        idEl.TextSize = 14 * fontSizeScale
        idEl.Font = Enum.Font.GothamBold
        idEl.TextXAlignment = Enum.TextXAlignment.Left
        idEl.TextTruncate = Enum.TextTruncate.AtEnd
        idEl.Parent = entry

        local timeEl = Instance.new("TextLabel")
        timeEl.Size = UDim2.new(0, 70, 1, 0)
        timeEl.Position = UDim2.new(0, 320, 0, 0)
        timeEl.BackgroundTransparency = 1
        timeEl.Text = getTime()
        timeEl.TextColor3 = Color3.fromRGB(140, 135, 180)
        timeEl.TextSize = 11 * fontSizeScale
        timeEl.Font = Enum.Font.Gotham
        timeEl.Parent = entry

        local buttonFrame = Instance.new("Frame")
        buttonFrame.Size = UDim2.new(0, 200, 1, 0)
        buttonFrame.Position = UDim2.new(1, -200, 0, 0)
        buttonFrame.BackgroundTransparency = 1
        buttonFrame.Parent = entry

        local autoBtn = Instance.new("TextButton")
        autoBtn.Size = UDim2.new(0, 56, 0, buttonHeight)
        autoBtn.Position = UDim2.new(0, 0, 0.5, -buttonHeight/2)
        autoBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        autoBtn.Text = "Auto"
        autoBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
        autoBtn.TextSize = 11 * fontSizeScale
        autoBtn.Font = Enum.Font.GothamBold
        autoBtn.BorderSizePixel = 0
        autoBtn.Parent = buttonFrame
        corner(autoBtn, 7)
        stroke(autoBtn, Color3.fromRGB(55, 50, 85), 1)

        local copyBtn = Instance.new("TextButton")
        copyBtn.Size = UDim2.new(0, 56, 0, buttonHeight)
        copyBtn.Position = UDim2.new(0, 62, 0.5, -buttonHeight/2)
        copyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        copyBtn.Text = "Copy"
        copyBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
        copyBtn.TextSize = 11 * fontSizeScale
        copyBtn.Font = Enum.Font.GothamBold
        copyBtn.BorderSizePixel = 0
        copyBtn.Parent = buttonFrame
        corner(copyBtn, 7)
        stroke(copyBtn, Color3.fromRGB(55, 50, 85), 1)

        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(0, 52, 0, buttonHeight)
        runBtn.Position = UDim2.new(0, 124, 0.5, -buttonHeight/2)
        runBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        runBtn.Text = "Run"
        runBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
        runBtn.TextSize = 11 * fontSizeScale
        runBtn.Font = Enum.Font.GothamBold
        runBtn.BorderSizePixel = 0
        runBtn.Parent = buttonFrame
        corner(runBtn, 7)
        stroke(runBtn, Color3.fromRGB(55, 50, 85), 1)

        copyBtn.MouseEnter:Connect(function()
            copyBtn.TextColor3 = Color3.fromRGB(190, 180, 255)
            copyBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 40)
        end)
        copyBtn.MouseLeave:Connect(function()
            if copyBtn.Text ~= "Copied!" then
                copyBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
                copyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            end
        end)
        copyBtn.MouseButton1Click:Connect(function()
            pcall(setclipboard, tostring(id))
            copyBtn.Text = "Copied!"
            copyBtn.TextColor3 = Color3.fromRGB(200, 190, 255)
            task.wait(1.5)
            copyBtn.Text = "Copy"
            copyBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
            copyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        end)

        local autoActive = false
        local autoLoop = nil
        local function startAuto()
            if autoActive then return end
            autoActive = true
            autoBtn.Text = "Auto ON"
            autoBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
            autoBtn.BackgroundColor3 = Color3.fromRGB(40, 15, 15)
            autoLoop = task.spawn(function()
                local delay = autoSpeed > 0 and (1 / autoSpeed) or 0.01
                while autoActive and autoBtn.Parent do
                    fireFakeSignal(signalType, id)
                    task.wait(delay)
                end
            end)
            activeAutoButtons[autoBtn] = {active = true, loop = autoLoop}
        end
        local function stopAuto()
            autoActive = false
            if autoLoop then task.cancel(autoLoop) end
            activeAutoButtons[autoBtn] = nil
            if autoBtn.Parent then
                autoBtn.Text = "Auto"
                autoBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
                autoBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            end
        end
        autoBtn.MouseButton1Click:Connect(function()
            if autoActive then stopAuto() else startAuto() end
        end)

        local holdStart = nil
        local holdConnection = nil
        local spamLoop = nil
        local isSpamming = false
        local function startSpam()
            if isSpamming then return end
            isSpamming = true
            runBtn.Text = "Spamming..."
            runBtn.TextColor3 = Color3.fromRGB(255, 200, 0)
            spamLoop = task.spawn(function()
                while isSpamming and runBtn.Parent do
                    fireFakeSignal(signalType, id)
                    task.wait(0.1)
                end
            end)
            activeSpamButtons[runBtn] = {active = true, loop = spamLoop}
        end
        local function stopSpam()
            isSpamming = false
            if spamLoop then task.cancel(spamLoop) end
            activeSpamButtons[runBtn] = nil
            if runBtn.Parent then
                runBtn.Text = "Run"
                runBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
                runBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            end
        end

        -- Use InputBegan/InputEnded for both mouse and touch
        local function onRunPress()
            if isSpamming then return end
            holdStart = tick()
            holdConnection = task.spawn(function()
                while holdStart and (tick() - holdStart) < 3 do
                    task.wait(0.1)
                end
                if holdStart and not isSpamming then
                    startSpam()
                end
            end)
        end

        local function onRunRelease()
            local heldDuration = holdStart and (tick() - holdStart) or 0
            holdStart = nil
            if holdConnection then task.cancel(holdConnection) end
            if isSpamming then
                stopSpam()
            elseif heldDuration < 3 then
                fireFakeSignal(signalType, id)
                runBtn.Text = "Sent!"
                runBtn.TextColor3 = Color3.fromRGB(61, 255, 160)
                task.wait(1.5)
                if runBtn.Parent then
                    runBtn.Text = "Run"
                    runBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
                end
            end
        end

        runBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                onRunPress()
            end
        end)
        runBtn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                onRunRelease()
            end
        end)

        runBtn.MouseEnter:Connect(function()
            if not isSpamming then
                runBtn.TextColor3 = Color3.fromRGB(61, 255, 160)
                runBtn.BackgroundColor3 = Color3.fromRGB(10, 22, 18)
            end
        end)
        runBtn.MouseLeave:Connect(function()
            if not isSpamming and runBtn.Text == "Run" then
                runBtn.TextColor3 = Color3.fromRGB(170, 165, 220)
                runBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
            end
        end)

        entry.AncestryChanged:Connect(function()
            if not entry.Parent then
                if autoActive then stopAuto() end
                if isSpamming then stopSpam() end
                for i, e in ipairs(entries) do
                    if e == entry then
                        table.remove(entries, i)
                        break
                    end
                end
            end
        end)

        eventCount = eventCount + 1
        countLabel.Text = eventCount .. (eventCount == 1 and " event captured" or " events captured")
        table.insert(entries, entry)
    end

    clearBtn.MouseButton1Click:Connect(function()
        stopAllAutoAndSpam()
        for _, e in ipairs(entries) do
            e:Destroy()
        end
        entries = {}
        eventCount = 0
        countLabel.Text = "0 events captured"
        setEmpty(true)
    end)

    MarketplaceService.PromptProductPurchaseFinished:Connect(function(plr, id, bought)
        if suppressCounter == 0 then addLog("Product", id, "Product") end
    end)
    MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(plr, id, bought)
        if suppressCounter == 0 then addLog("Gamepass", id, "Gamepass") end
    end)
    MarketplaceService.PromptBulkPurchaseFinished:Connect(function(userId, id, bought)
        if suppressCounter == 0 then addLog("Bulk", id, "Bulk") end
    end)
    MarketplaceService.PromptPurchaseFinished:Connect(function(userId, id, bought)
        if suppressCounter == 0 then addLog("Purchase", id, "Purchase") end
    end)

    setEmpty(true)
end)

FlyBtn.MouseButton1Click:Connect(function()
    local main = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local up = Instance.new("TextButton")
    local down = Instance.new("TextButton")
    local onof = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local plus = Instance.new("TextButton")
    local speed = Instance.new("TextLabel")
    local mine = Instance.new("TextButton")
    local closebutton = Instance.new("TextButton")
    local mini = Instance.new("TextButton")
    local mini2 = Instance.new("TextButton")

    main.Name = "main"
    main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    main.ResetOnSpawn = false

    Frame.Parent = main
    Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
    Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
    Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
    Frame.Size = UDim2.new(0, 190, 0, 57)

    up.Name = "up"
    up.Parent = Frame
    up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
    up.Size = UDim2.new(0, 44, 0, 28)
    up.Font = Enum.Font.SourceSans
    up.Text = "UP"
    up.TextColor3 = Color3.fromRGB(0, 0, 0)
    up.TextSize = 14.000

    down.Name = "down"
    down.Parent = Frame
    down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
    down.Position = UDim2.new(0, 0, 0.491228074, 0)
    down.Size = UDim2.new(0, 44, 0, 28)
    down.Font = Enum.Font.SourceSans
    down.Text = "DOWN"
    down.TextColor3 = Color3.fromRGB(0, 0, 0)
    down.TextSize = 14.000

    onof.Name = "onof"
    onof.Parent = Frame
    onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
    onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
    onof.Size = UDim2.new(0, 56, 0, 28)
    onof.Font = Enum.Font.SourceSans
    onof.Text = "fly"
    onof.TextColor3 = Color3.fromRGB(0, 0, 0)
    onof.TextSize = 14.000

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
    TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 100, 0, 28)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "FLY GUI V3"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    plus.Name = "plus"
    plus.Parent = Frame
    plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
    plus.Position = UDim2.new(0.231578946, 0, 0, 0)
    plus.Size = UDim2.new(0, 45, 0, 28)
    plus.Font = Enum.Font.SourceSans
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(0, 0, 0)
    plus.TextScaled = true
    plus.TextSize = 14.000
    plus.TextWrapped = true

    speed.Name = "speed"
    speed.Parent = Frame
    speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
    speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
    speed.Size = UDim2.new(0, 44, 0, 28)
    speed.Font = Enum.Font.SourceSans
    speed.Text = "1"
    speed.TextColor3 = Color3.fromRGB(0, 0, 0)
    speed.TextScaled = true
    speed.TextSize = 14.000
    speed.TextWrapped = true

    mine.Name = "mine"
    mine.Parent = Frame
    mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
    mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
    mine.Size = UDim2.new(0, 45, 0, 29)
    mine.Font = Enum.Font.SourceSans
    mine.Text = "-"
    mine.TextColor3 = Color3.fromRGB(0, 0, 0)
    mine.TextScaled = true
    mine.TextSize = 14.000
    mine.TextWrapped = true

    closebutton.Name = "Close"
    closebutton.Parent = main.Frame
    closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
    closebutton.Font = "SourceSans"
    closebutton.Size = UDim2.new(0, 45, 0, 28)
    closebutton.Text = "X"
    closebutton.TextSize = 30
    closebutton.Position =  UDim2.new(0, 0, -1, 27)

    mini.Name = "minimize"
    mini.Parent = main.Frame
    mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini.Font = "SourceSans"
    mini.Size = UDim2.new(0, 45, 0, 28)
    mini.Text = "-"
    mini.TextSize = 40
    mini.Position = UDim2.new(0, 44, -1, 27)

    mini2.Name = "minimize2"
    mini2.Parent = main.Frame
    mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
    mini2.Font = "SourceSans"
    mini2.Size = UDim2.new(0, 45, 0, 28)
    mini2.Text = "+"
    mini2.TextSize = 40
    mini2.Position = UDim2.new(0, 44, -1, 57)
    mini2.Visible = false

    speeds = 1

    local speaker = game:GetService("Players").LocalPlayer

    local chr = game.Players.LocalPlayer.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

    nowe = false

    Frame.Active = true -- main = gui
    Frame.Draggable = true

    onof.MouseButton1Down:connect(function()

        if nowe == true then
            nowe = false

            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        else 
            nowe = true
            for i = 1, speeds do
                spawn(function()

                    local hb = game:GetService("RunService").Heartbeat	
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end

                end)
            end
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            local Char = game.Players.LocalPlayer.Character
            local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

            for i,v in next, Hum:GetPlayingAnimationTracks() do
                v:AdjustSpeed(0)
            end
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
            local plr = game.Players.LocalPlayer
            local torso = plr.Character.Torso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0


            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                game:GetService("RunService").RenderStepped:Wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end
                --	game.Players.LocalPlayer.Character.Animate.Disabled = true
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false




        else
            local plr = game.Players.LocalPlayer
            local UpperTorso = plr.Character.UpperTorso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0


            local bg = Instance.new("BodyGyro", UpperTorso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = UpperTorso.CFrame
            local bv = Instance.new("BodyVelocity", UpperTorso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end

                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
        end
    end)
    local tis
    up.MouseButton1Down:connect(function()
        tis = up.MouseEnter:connect(function()
            while tis do
                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
            end
        end)
    end)
    up.MouseLeave:connect(function()
        if tis then
            tis:Disconnect()
            tis = nil
        end
    end)

    local dis

    down.MouseButton1Down:connect(function()
        dis = down.MouseEnter:connect(function()
            while dis do
                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
            end
        end)
    end)

    down.MouseLeave:connect(function()
        if dis then
            dis:Disconnect()
            dis = nil
        end
    end)


    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
        wait(0.7)
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false

    end)


    plus.MouseButton1Down:connect(function()
        speeds = speeds + 1
        speed.Text = speeds
        if nowe == true then


            tpwalking = false
            for i = 1, speeds do
                spawn(function()

                    local hb = game:GetService("RunService").Heartbeat	


                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end

                end)
            end
        end
    end)
    mine.MouseButton1Down:connect(function()
        if speeds == 1 then
            speed.Text = 'cannot be less than 1'
            wait(1)
            speed.Text = speeds
        else
            speeds = speeds - 1
            speed.Text = speeds
            if nowe == true then
                tpwalking = false
                for i = 1, speeds do
                    spawn(function()

                        local hb = game:GetService("RunService").Heartbeat	


                        tpwalking = true
                        local chr = game.Players.LocalPlayer.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end

                    end)
                end
            end
        end
    end)

    closebutton.MouseButton1Click:Connect(function()
        main:Destroy()
    end)

    mini.MouseButton1Click:Connect(function()
        up.Visible = false
        down.Visible = false
        onof.Visible = false
        plus.Visible = false
        speed.Visible = false
        mine.Visible = false
        mini.Visible = false
        mini2.Visible = true
        main.Frame.BackgroundTransparency = 1
        closebutton.Position =  UDim2.new(0, 0, -1, 57)
    end)

    mini2.MouseButton1Click:Connect(function()
        up.Visible = true
        down.Visible = true
        onof.Visible = true
        plus.Visible = true
        speed.Visible = true
        mine.Visible = true
        mini.Visible = true
        mini2.Visible = false
        main.Frame.BackgroundTransparency = 0 
        closebutton.Position =  UDim2.new(0, 0, -1, 27)
    end)
    FlyBtn.Visible = false
end)

local function toggleGuiVisibility()
    guiVisible = not guiVisible
    MainGui.Enabled = guiVisible
end
local function updateKeybindDisplay()
    KeybindDisplay.Text = "Current: " .. tostring(toggleKey):match("Enum%.KeyCode%.(%a+)")
end
KeybindMenuBtn.MouseButton1Click:Connect(function()
    KeybindMenu.Visible = not KeybindMenu.Visible
    updateKeybindDisplay()
end)
KeybindClose.MouseButton1Click:Connect(function()
    KeybindMenu.Visible = false
end)
ReadKeyBtn.MouseButton1Click:Connect(function()
    waitingForKey = true
    KeybindDesc.Text = "Press your key..."
    KeybindDesc.TextColor3 = Color3.fromRGB(255, 200, 0)
    local inputConnection
    inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            toggleKey = input.KeyCode
            updateKeybindDisplay()
            KeybindDesc.Text = "Key set!"
            KeybindDesc.TextColor3 = Color3.fromRGB(100, 255, 100)
            inputConnection:Disconnect()
            task.wait(1)
            KeybindDesc.Text = "Press 'Read Key' and\nthen press your key"
            KeybindDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
            waitingForKey = false
        end
    end)
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if not waitingForKey and input.KeyCode == toggleKey then
        toggleGuiVisibility()
    end
end)
updateKeybindDisplay()

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseButton"
CloseBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
CloseBtn.Position = UDim2.new(1, -19 * sizeMultiplier, 0, 7 * sizeMultiplier)
CloseBtn.Size = UDim2.new(0, 13 * sizeMultiplier, 0, 13 * sizeMultiplier)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 10 * sizeMultiplier
CloseBtn.Parent = MainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 3)
closeCorner.Parent = CloseBtn
CloseBtn.MouseButton1Click:Connect(toggleGuiVisibility)


local function styleMenuButton(btn, text, posY)
    btn.Parent = MainFrame
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    btn.Position = UDim2.new(0, 9 * sizeMultiplier, 0, posY * sizeMultiplier)
    btn.Size = UDim2.new(0, 132 * sizeMultiplier, 0, 21 * sizeMultiplier)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(170, 170, 180)
    btn.TextSize = 7 * sizeMultiplier
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Parent = btn
    btnStroke.Color = Color3.fromRGB(35, 35, 45)
    btnStroke.Thickness = 1
    return btn
end

local NoclipBtn = Instance.new("TextButton")
local FullbrightBtn = Instance.new("TextButton")
local NoFogBtn = Instance.new("TextButton")
local CreateEspBtn = Instance.new("TextButton")
local RemoveEspBtn = Instance.new("TextButton")
local InstantPromptBtn = Instance.new("TextButton")
local InfJumpBtn = Instance.new("TextButton")
local FlingBtn = Instance.new("TextButton")
local FlingGuiBtn = Instance.new("TextButton")
local TeleportBtn = Instance.new("TextButton")

styleMenuButton(NoclipBtn, "Noclip: OFF", 33.5)
styleMenuButton(FullbrightBtn, "Fullbright: OFF", 56)
styleMenuButton(NoFogBtn, "No Fog: OFF", 79)
styleMenuButton(CreateEspBtn, "Create ESP", 101.5)
styleMenuButton(RemoveEspBtn, "Remove ESP", 124)
styleMenuButton(InstantPromptBtn, "Instant Interact: OFF", 147)
styleMenuButton(InfJumpBtn, "Inf Jump: OFF", 169.5)
styleMenuButton(FlingBtn, "Fling: OFF", 192)
styleMenuButton(FlingGuiBtn, "Fling GUI: OFF", 215)
styleMenuButton(TeleportBtn, "Teleport to Players", 237.5)

local FGui = false
local FlingGuiScreenGui = nil
FlingGuiBtn.MouseButton1Click:Connect(function()
    FGui = not FGui
    if FGui then
        FlingGuiScreenGui = Instance.new("ScreenGui")
        FlingGuiScreenGui.Name = "FlingGUI"
        FlingGuiScreenGui.ResetOnSpawn = false
        FlingGuiScreenGui.Parent = CoreGui
        local Players = game:GetService("Players")
        local mainX = MainFrame.Position.X.Offset
        local mainY = MainFrame.Position.Y.Offset
        local newFlX = mainX + 710 

        local MainFrame = Instance.new("Frame")
        MainFrame.Size = UDim2.new(0, 300, 0, 350)
        MainFrame.Position = UDim2.new(0, newFlX, 0, mainY+410)
        MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        MainFrame.BorderSizePixel = 0
        MainFrame.Active = true
        MainFrame.Draggable = true
        MainFrame.Parent = FlingGuiScreenGui

        local TitleBar = Instance.new("Frame")
        TitleBar.Size = UDim2.new(1, 0, 0, 30)
        TitleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        TitleBar.BorderSizePixel = 0
        TitleBar.Parent = MainFrame

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -30, 1, 0)
        Title.BackgroundTransparency = 1
        Title.Text = "FLING GUI"
        Title.TextColor3 = Color3.fromRGB(255, 0, 0)
        Title.Font = Enum.Font.SourceSansBold
        Title.TextSize = 18
        Title.Parent = TitleBar

        local CloseButton = Instance.new("TextButton")
        CloseButton.Position = UDim2.new(1, -30, 0, 0)
        CloseButton.Size = UDim2.new(0, 30, 0, 30)
        CloseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        CloseButton.BorderSizePixel = 0
        CloseButton.Text = "X"
        CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.Font = Enum.Font.SourceSansBold
        CloseButton.TextSize = 18
        CloseButton.Parent = TitleBar

        local StatusLabel = Instance.new("TextLabel")
        StatusLabel.Position = UDim2.new(0, 10, 0, 40)
        StatusLabel.Size = UDim2.new(1, -20, 0, 25)
        StatusLabel.BackgroundTransparency = 1
        StatusLabel.Text = "Select targets to fling"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        StatusLabel.Font = Enum.Font.SourceSans
        StatusLabel.TextSize = 16
        StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
        StatusLabel.Parent = MainFrame

        local SelectionFrame = Instance.new("Frame")
        SelectionFrame.Position = UDim2.new(0, 10, 0, 70)
        SelectionFrame.Size = UDim2.new(1, -20, 0, 200)
        SelectionFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        SelectionFrame.BorderSizePixel = 0
        SelectionFrame.Parent = MainFrame

        local PlayerScrollFrame = Instance.new("ScrollingFrame")
        PlayerScrollFrame.Position = UDim2.new(0, 5, 0, 5)
        PlayerScrollFrame.Size = UDim2.new(1, -10, 1, -10)
        PlayerScrollFrame.BackgroundTransparency = 1
        PlayerScrollFrame.BorderSizePixel = 0
        PlayerScrollFrame.ScrollBarThickness = 6
        PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        PlayerScrollFrame.Parent = SelectionFrame

        local StartButton = Instance.new("TextButton")
        StartButton.Position = UDim2.new(0, 20, 0, 280)
        StartButton.Size = UDim2.new(0.5, -25, 0, 30)
        StartButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        StartButton.BorderSizePixel = 0
        StartButton.Text = "START FLING"
        StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        StartButton.Font = Enum.Font.SourceSansBold
        StartButton.TextSize = 16
        StartButton.Parent = MainFrame

        local StopButton = Instance.new("TextButton")
        StopButton.Position = UDim2.new(0.5, 5, 0, 280)
        StopButton.Size = UDim2.new(0.5, -25, 0, 30)
        StopButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        StopButton.BorderSizePixel = 0
        StopButton.Text = "STOP FLING"
        StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        StopButton.Font = Enum.Font.SourceSansBold
        StopButton.TextSize = 16
        StopButton.Parent = MainFrame

        local SelectAllButton = Instance.new("TextButton")
        SelectAllButton.Position = UDim2.new(0, 10, 0, 315)
        SelectAllButton.Size = UDim2.new(0.5, -15, 0, 30)
        SelectAllButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        SelectAllButton.BorderSizePixel = 0
        SelectAllButton.Text = "SELECT ALL"
        SelectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        SelectAllButton.Font = Enum.Font.SourceSans
        SelectAllButton.TextSize = 14
        SelectAllButton.Parent = MainFrame

        local DeselectAllButton = Instance.new("TextButton")
        DeselectAllButton.Position = UDim2.new(0.5, 5, 0, 315)
        DeselectAllButton.Size = UDim2.new(0.5, -15, 0, 30)
        DeselectAllButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        DeselectAllButton.BorderSizePixel = 0
        DeselectAllButton.Text = "DESELECT ALL"
        DeselectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        DeselectAllButton.Font = Enum.Font.SourceSans
        DeselectAllButton.TextSize = 14
        DeselectAllButton.Parent = MainFrame

        local SelectedTargets = {}
        local PlayerCheckboxes = {}
        local FlingActive = false
        local FlingConnection = nil
        getgenv().OldPos = nil
        getgenv().FPDH = workspace.FallenPartsDestroyHeight
        local function RefreshPlayerList()
            for _, child in pairs(PlayerScrollFrame:GetChildren()) do
                child:Destroy()
            end
            PlayerCheckboxes = {}
            local PlayerList = Players:GetPlayers()
            table.sort(PlayerList, function(a, b) return a.Name:lower() < b.Name:lower() end)
            local yPosition = 5
            for _, player in ipairs(PlayerList) do
                if player ~= Player then
                    local PlayerEntry = Instance.new("Frame")
                    PlayerEntry.Size = UDim2.new(1, -10, 0, 30)
                    PlayerEntry.Position = UDim2.new(0, 5, 0, yPosition)
                    PlayerEntry.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    PlayerEntry.BorderSizePixel = 0
                    PlayerEntry.Parent = PlayerScrollFrame
                    local Checkbox = Instance.new("TextButton")
                    Checkbox.Size = UDim2.new(0, 24, 0, 24)
                    Checkbox.Position = UDim2.new(0, 3, 0.5, -12)
                    Checkbox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    Checkbox.BorderSizePixel = 0
                    Checkbox.Text = ""
                    Checkbox.Parent = PlayerEntry
                    local Checkmark = Instance.new("TextLabel")
                    Checkmark.Size = UDim2.new(1, 0, 1, 0)
                    Checkmark.BackgroundTransparency = 1
                    Checkmark.Text = "✓"
                    Checkmark.TextColor3 = Color3.fromRGB(0, 255, 0)
                    Checkmark.TextSize = 18
                    Checkmark.Font = Enum.Font.SourceSansBold
                    Checkmark.Visible = SelectedTargets[player.Name] ~= nil
                    Checkmark.Parent = Checkbox
                    local NameLabel = Instance.new("TextLabel")
                    NameLabel.Size = UDim2.new(1, -35, 1, 0)
                    NameLabel.Position = UDim2.new(0, 30, 0, 0)
                    NameLabel.BackgroundTransparency = 1
                    NameLabel.Text = player.Name
                    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    NameLabel.TextSize = 16
                    NameLabel.Font = Enum.Font.SourceSans
                    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
                    NameLabel.Parent = PlayerEntry
                    local ClickArea = Instance.new("TextButton")
                    ClickArea.Size = UDim2.new(1, 0, 1, 0)
                    ClickArea.BackgroundTransparency = 1
                    ClickArea.Text = ""
                    ClickArea.ZIndex = 2
                    ClickArea.Parent = PlayerEntry
                    ClickArea.MouseButton1Click:Connect(function()
                        if SelectedTargets[player.Name] then
                            SelectedTargets[player.Name] = nil
                            Checkmark.Visible = false
                        else
                            SelectedTargets[player.Name] = player
                            Checkmark.Visible = true
                        end
                        
                        UpdateStatus()
                    end)
                    PlayerCheckboxes[player.Name] = {
                        Entry = PlayerEntry,
                        Checkmark = Checkmark
                    }
                    yPosition = yPosition + 35
                end
            end
            PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPosition + 5)
        end
        local function CountSelectedTargets()
            local count = 0
            for _ in pairs(SelectedTargets) do
                count = count + 1
            end
            return count
        end
        local function UpdateStatus()
            local count = CountSelectedTargets()
            if FlingActive then
                StatusLabel.Text = "Flinging " .. count .. " target(s)"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            else
                StatusLabel.Text = count .. " target(s) selected" 
                StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
        end
        local function ToggleAllPlayers(select)
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Player then
                    local checkboxData = PlayerCheckboxes[player.Name]
                    if checkboxData then
                        if select then
                            SelectedTargets[player.Name] = player
                            checkboxData.Checkmark.Visible = true
                        else
                            SelectedTargets[player.Name] = nil
                            checkboxData.Checkmark.Visible = false
                        end
                    end
                end
            end
            UpdateStatus()
        end
        local function Message(Title, Text, Time)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = Title,
                Text = Text,
                Duration = Time or 5
            })
        end
        local function SkidFling(TargetPlayer)
            local Character = Player.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            local RootPart = Humanoid and Humanoid.RootPart
            local TCharacter = TargetPlayer.Character
            if not TCharacter then return end
            local THumanoid
            local TRootPart
            local THead
            local Accessory
            local Handle
            if TCharacter:FindFirstChildOfClass("Humanoid") then
                THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
            end
            if THumanoid and THumanoid.RootPart then
                TRootPart = THumanoid.RootPart
            end
            if TCharacter:FindFirstChild("Head") then
                THead = TCharacter.Head
            end
            if TCharacter:FindFirstChildOfClass("Accessory") then
                Accessory = TCharacter:FindFirstChildOfClass("Accessory")
            end
            if Accessory and Accessory:FindFirstChild("Handle") then
                Handle = Accessory.Handle
            end
            if Character and Humanoid and RootPart then
                if RootPart.Velocity.Magnitude < 50 then
                    getgenv().OldPos = RootPart.CFrame
                end
                if THumanoid and THumanoid.Sit then
                    return Message("Error", TargetPlayer.Name .. " is sitting", 2)
                end
                if THead then
                    workspace.CurrentCamera.CameraSubject = THead
                elseif Handle then
                    workspace.CurrentCamera.CameraSubject = Handle
                elseif THumanoid and TRootPart then
                    workspace.CurrentCamera.CameraSubject = THumanoid
                end
                if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                    return
                end
                local FPos = function(BasePart, Pos, Ang)
                    RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                    Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                    RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                    RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                end
                local SFBasePart = function(BasePart)
                    local TimeToWait = 2
                    local Time = tick()
                    local Angle = 0
                    repeat
                        if RootPart and THumanoid then
                            if BasePart.Velocity.Magnitude < 50 then
                                Angle = Angle + 100
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle),0 ,0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                task.wait()
                            else
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                            end
                        end
                    until Time + TimeToWait < tick() or not FlingActive
                end
                workspace.FallenPartsDestroyHeight = 0/0
                local BV = Instance.new("BodyVelocity")
                BV.Parent = RootPart
                BV.Velocity = Vector3.new(0, 0, 0)
                BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                if TRootPart then
                    SFBasePart(TRootPart)
                elseif THead then
                    SFBasePart(THead)
                elseif Handle then
                    SFBasePart(Handle)
                else
                    return Message("Error", TargetPlayer.Name .. " has no valid parts", 2)
                end
                BV:Destroy()
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                workspace.CurrentCamera.CameraSubject = Humanoid
                if getgenv().OldPos then
                    repeat
                        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                        Humanoid:ChangeState("GettingUp")
                        for _, part in pairs(Character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Velocity, part.RotVelocity = Vector3.new(), Vector3.new()
                            end
                        end
                        task.wait()
                    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            else
                return Message("Error", "Your character is not ready", 2)
            end
        end
        local function StartFling()
            if FlingActive then return end
            local count = CountSelectedTargets()
            if count == 0 then
                StatusLabel.Text = "No targets selected!"
                wait(1)
                StatusLabel.Text = "Select targets to fling"
                return
            end
            FlingActive = true
            UpdateStatus()
            Message("Started", "Flinging " .. count .. " targets", 2)
            spawn(function()
                while FlingActive do
                    local validTargets = {}
                    for name, player in pairs(SelectedTargets) do
                        if player and player.Parent then
                            validTargets[name] = player
                        else
                            SelectedTargets[name] = nil
                            local checkbox = PlayerCheckboxes[name]
                            if checkbox then
                                checkbox.Checkmark.Visible = false
                            end
                        end
                    end
                    for _, player in pairs(validTargets) do
                        if FlingActive then
                            SkidFling(player)
                            wait(0.1)
                        else
                            break
                        end
                    end
                    UpdateStatus()
                    wait(0.5)
                end
            end)
        end
        local function StopFling()
            if not FlingActive then return end
            FlingActive = false
            UpdateStatus()
            Message("Stopped", "Fling has been stopped", 2)
        end
        StartButton.MouseButton1Click:Connect(StartFling)
        StopButton.MouseButton1Click:Connect(StopFling)
        SelectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(true) end)
        DeselectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(false) end)
        CloseButton.MouseButton1Click:Connect(function()
            FGui = false
            if FlingGuiScreenGui then
                FlingGuiScreenGui:Destroy()
                FlingGuiScreenGui = nil
            end
            FlingGuiBtn.Text = "Fling GUI: OFF"
            FlingGuiBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
            FlingActiveInternal = false
        end)
        Players.PlayerAdded:Connect(RefreshPlayerList)
        Players.PlayerRemoving:Connect(function(player)
            if SelectedTargets[player.Name] then
                SelectedTargets[player.Name] = nil
            end
            RefreshPlayerList()
            UpdateStatus()
        end)
        RefreshPlayerList()
        UpdateStatus()
        FlingGuiBtn.Text = "Fling GUI: ON"
        FlingGuiBtn.TextColor3 = Color3.fromRGB(0, 255, 130)
    else
        if FlingGuiScreenGui then
            FlingGuiScreenGui:Destroy()
            FlingGuiScreenGui = nil
        end
        FlingGuiBtn.Text = "Fling GUI: OFF"
        FlingGuiBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
        FlingActiveInternal = false
    end
end)
local tpGui = Instance.new("Frame")
tpGui.Name = "TPMenu"
tpGui.Parent = MainFrame
tpGui.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
tpGui.BorderSizePixel = 0
tpGui.Position = UDim2.new(0, -135 * sizeMultiplier, 0, 0)
tpGui.Size = UDim2.new(0, 132 * sizeMultiplier, 0, 288 * sizeMultiplier)
tpGui.Visible = false
local tpCorner = Instance.new("UICorner")
tpCorner.CornerRadius = UDim.new(0, 4)
tpCorner.Parent = tpGui
local tpStroke = Instance.new("UIStroke")
tpStroke.Parent = tpGui
tpStroke.Color = Color3.fromRGB(35, 35, 45)
tpStroke.Thickness = 1
local tpTitle = Instance.new("TextLabel")
tpTitle.BackgroundTransparency = 1
tpTitle.Position = UDim2.new(0, 0, 0, 5 * sizeMultiplier)
tpTitle.Size = UDim2.new(1, 0, 0, 15 * sizeMultiplier)
tpTitle.Font = Enum.Font.GothamSemibold
tpTitle.Text = "Teleport to Players"
tpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
tpTitle.TextSize = 8 * sizeMultiplier
tpTitle.Parent = tpGui
local tpScroll = Instance.new("ScrollingFrame")
tpScroll.Parent = tpGui
tpScroll.Size = UDim2.new(1, -10 * sizeMultiplier, 1, -45 * sizeMultiplier)
tpScroll.Position = UDim2.new(0, 5 * sizeMultiplier, 0, 20 * sizeMultiplier)
tpScroll.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
tpScroll.BorderSizePixel = 0
tpScroll.ScrollBarThickness = 5 * sizeMultiplier

local settingsGui = Instance.new("Frame")
settingsGui.Name = "TPSettings"
settingsGui.Parent = MainFrame
settingsGui.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
settingsGui.BorderSizePixel = 0
settingsGui.Position = UDim2.new(0, -229 * sizeMultiplier, 0, 0 * sizeMultiplier)
settingsGui.Size = UDim2.new(0, 92 * sizeMultiplier, 0, 140 * sizeMultiplier)
settingsGui.Visible = false

local settingsCorner = Instance.new("UICorner")
settingsCorner.CornerRadius = UDim.new(0, 4)
settingsCorner.Parent = settingsGui

local settingsStroke = Instance.new("UIStroke")
settingsStroke.Parent = settingsGui
settingsStroke.Color = Color3.fromRGB(35, 35, 45)
settingsStroke.Thickness = 1
local settingsTitle = Instance.new("TextLabel")
settingsTitle.BackgroundTransparency = 1
settingsTitle.Position = UDim2.new(0, 0, 0, 5 * sizeMultiplier)
settingsTitle.Size = UDim2.new(1, 0, 0, 15 * sizeMultiplier)
settingsTitle.Font = Enum.Font.GothamSemibold
settingsTitle.Text = "Teleport Settings"
settingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTitle.TextSize = 8 * sizeMultiplier
settingsTitle.Parent = settingsGui

local xLabel = Instance.new("TextLabel")
xLabel.BackgroundTransparency = 1
xLabel.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 20 * sizeMultiplier)
xLabel.Size = UDim2.new(1, -20 * sizeMultiplier, 0, 12 * sizeMultiplier)
xLabel.Font = Enum.Font.Gotham
xLabel.Text = "Forward/Back:"
xLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
xLabel.TextSize = 7 * sizeMultiplier
xLabel.Parent = settingsGui

local xTextBox = Instance.new("TextBox")
xTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
xTextBox.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 30 * sizeMultiplier)
xTextBox.Size = UDim2.new(0, 72 * sizeMultiplier, 0, 14 * sizeMultiplier)
xTextBox.Font = Enum.Font.Gotham
xTextBox.Text = "2"
xTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
xTextBox.TextSize = 7 * sizeMultiplier
xTextBox.Parent = settingsGui

local xCorner = Instance.new("UICorner")
xCorner.CornerRadius = UDim.new(0, 3)
xCorner.Parent = xTextBox

local yLabel = Instance.new("TextLabel")
yLabel.BackgroundTransparency = 1
yLabel.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 50 * sizeMultiplier)
yLabel.Size = UDim2.new(1, -20 * sizeMultiplier, 0, 12 * sizeMultiplier)
yLabel.Font = Enum.Font.Gotham
yLabel.Text = "Up/Down:"
yLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
yLabel.TextSize = 7 * sizeMultiplier
yLabel.Parent = settingsGui

local yTextBox = Instance.new("TextBox")
yTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
yTextBox.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 60 * sizeMultiplier)
yTextBox.Size = UDim2.new(0, 72 * sizeMultiplier, 0, 14 * sizeMultiplier)
yTextBox.Font = Enum.Font.Gotham
yTextBox.Text = "0.5"
yTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
yTextBox.TextSize = 7 * sizeMultiplier
yTextBox.Parent = settingsGui

local yCorner = Instance.new("UICorner")
yCorner.CornerRadius = UDim.new(0, 3)
yCorner.Parent = yTextBox

local zLabel = Instance.new("TextLabel")
zLabel.BackgroundTransparency = 1
zLabel.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 80 * sizeMultiplier)
zLabel.Size = UDim2.new(1, -20 * sizeMultiplier, 0, 12 * sizeMultiplier)
zLabel.Font = Enum.Font.Gotham
zLabel.Text = "Left/Right:"
zLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
zLabel.TextSize = 7 * sizeMultiplier
zLabel.Parent = settingsGui

local zTextBox = Instance.new("TextButton")
zTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
zTextBox.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 90 * sizeMultiplier)
zTextBox.Size = UDim2.new(0, 72 * sizeMultiplier, 0, 14 * sizeMultiplier)
zTextBox.Font = Enum.Font.Gotham
zTextBox.Text = "0"
zTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
zTextBox.TextSize = 7 * sizeMultiplier
zTextBox.Parent = settingsGui

local zCorner = Instance.new("UICorner")
zCorner.CornerRadius = UDim.new(0, 3)
zCorner.Parent = zTextBox

local applyBtn = Instance.new("TextButton")
applyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
applyBtn.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 115 * sizeMultiplier)
applyBtn.Size = UDim2.new(0, 72 * sizeMultiplier, 0, 15 * sizeMultiplier)
applyBtn.Font = Enum.Font.GothamSemibold
applyBtn.Text = "Apply"
applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applyBtn.TextSize = 7 * sizeMultiplier
applyBtn.Parent = settingsGui

local applyCorner = Instance.new("UICorner")
applyCorner.CornerRadius = UDim.new(0, 4)
applyCorner.Parent = applyBtn

local settingsBtn = Instance.new("TextButton")
settingsBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
settingsBtn.Position = UDim2.new(0, 10 * sizeMultiplier, 0, 269 * sizeMultiplier)
settingsBtn.Size = UDim2.new(1, -20 * sizeMultiplier, 0, 15 * sizeMultiplier)
settingsBtn.Font = Enum.Font.Gotham
settingsBtn.Text = "Settings"
settingsBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
settingsBtn.TextSize = 8 * sizeMultiplier
settingsBtn.Parent = tpGui
local settingsCornerBtn = Instance.new("UICorner")
settingsCornerBtn.CornerRadius = UDim.new(0, 3)
settingsCornerBtn.Parent = settingsBtn
local activeConnections = {}
local function updatePlayerList()
    tpScroll:ClearAllChildren()
    local playerListY = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Player then
            local playerBtn = Instance.new("TextButton")
            playerBtn.Name = player.Name
            playerBtn.Parent = tpScroll
            playerBtn.Size = UDim2.new(1, -15 * sizeMultiplier, 0, 20 * sizeMultiplier)
            playerBtn.Position = UDim2.new(0, 5, 0, playerListY)
            playerBtn.Text = player.Name
            playerBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            playerBtn.TextSize = 8 * sizeMultiplier
            playerBtn.Font = Enum.Font.Gotham
            playerBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            playerBtn.BorderSizePixel = 0
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 3)
            btnCorner.Parent = playerBtn
            local btnStroke = Instance.new("UIStroke")
            btnStroke.Parent = playerBtn
            btnStroke.Color = Color3.fromRGB(50, 50, 60)
            btnStroke.Thickness = 1
            local conn = playerBtn.MouseButton1Click:Connect(function()
                if playerBtn.Text ~= Player.Name then
                    local target = Players:FindFirstChild(playerBtn.Text)
                    if target and target.Character and Player.Character then
                        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
                        local localRoot = Player.Character:FindFirstChild("HumanoidRootPart")
                        if targetRoot and localRoot then
                            local xValue = tonumber(xTextBox.Text) or 0
                            local yValue = tonumber(yTextBox.Text) or 0.5
                            local zValue = tonumber(zTextBox.Text) or 0
                            local forwardBack = targetRoot.CFrame.LookVector * -xValue
                            local offset = forwardBack + Vector3.new(zValue, yValue, 0)
                            Player.Character:SetPrimaryPartCFrame(targetRoot.CFrame + offset)
                        end
                    end
                end
            end)
            table.insert(activeConnections, conn)
            playerListY = playerListY + 22 * sizeMultiplier
        end
    end
end
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
updatePlayerList()
TeleportBtn.MouseButton1Click:Connect(function()
    tpGui.Visible = not tpGui.Visible
    if not tpGui.Visible then
        settingsGui.Visible = false
    end
end)
settingsBtn.MouseButton1Click:Connect(function()
    settingsGui.Visible = not settingsGui.Visible
end)
applyBtn.MouseButton1Click:Connect(function()
    local xValue = tonumber(xTextBox.Text) or 0
    local yValue = tonumber(yTextBox.Text) or 0.5
    local zValue = tonumber(zTextBox.Text) or 0
    for _, conn in ipairs(activeConnections) do
        conn:Disconnect()
    end
    table.clear(activeConnections)
    updatePlayerList()
end)
local defaultLighting = {
    Ambient = Lighting.Ambient,
    ColorShift_Top = Lighting.ColorShift_Top,
    ColorShift_Bottom = Lighting.ColorShift_Bottom,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogColor = Lighting.FogColor,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart
}
local noclipEnabled = false
local fullbrightEnabled = false
local noFogEnabled = false
local instantPromptEnabled = false
local infJumpEnabled = false
local flingEnabled = false
local noclipConnection
local promptDescendantConn
local flingThread
NoclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NoclipBtn.Text = "Noclip: ON"
        NoclipBtn.TextColor3 = Color3.fromRGB(0, 255, 130)
        noclipConnection = RunService.Stepped:Connect(function()
            if Player.Character then
                for _, part in pairs(Player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        NoclipBtn.Text = "Noclip: OFF"
        NoclipBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end
end)
FullbrightBtn.MouseButton1Click:Connect(function()
    fullbrightEnabled = not fullbrightEnabled
    if fullbrightEnabled then
        FullbrightBtn.Text = "Fullbright: ON"
        FullbrightBtn.TextColor3 = Color3.fromRGB(0, 255, 130)
    else
        FullbrightBtn.Text = "Fullbright: OFF"
        FullbrightBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
        Lighting.Ambient = defaultLighting.Ambient
        Lighting.ColorShift_Top = defaultLighting.ColorShift_Top
        Lighting.ColorShift_Bottom = defaultLighting.ColorShift_Bottom
        Lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient
    end
end)
NoFogBtn.MouseButton1Click:Connect(function()
    noFogEnabled = not noFogEnabled
    if noFogEnabled then
        NoFogBtn.Text = "No Fog: ON"
        NoFogBtn.TextColor3 = Color3.fromRGB(0, 255, 130)
    else
        NoFogBtn.Text = "No Fog: OFF"
        NoFogBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
        Lighting.FogColor = defaultLighting.FogColor
        Lighting.FogEnd = defaultLighting.FogEnd
        Lighting.FogStart = defaultLighting.FogStart
    end
end)
local function clearPlayerESP(player)
    if player.Character then
        for _, obj in pairs(player.Character:GetDescendants()) do
            if obj:IsA("BoxHandleAdornment") or obj:IsA("BillboardGui") then
                obj:Destroy()
            end
        end
    end
end
CreateEspBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player then clearPlayerESP(v) end
    end
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            for _, part in pairs(v.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "ESP_Box"
                    box.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
                    box.AlwaysOnTop = true
                    box.ZIndex = 10
                    box.Adornee = part
                    box.Color3 = Color3.fromRGB(255, 0, 100)
                    box.Transparency = 0.4
                    box.Parent = part
                end
            end
            if v.Character:FindFirstChild("Head") then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESP_Name"
                billboard.Size = UDim2.new(0, 200, 0, 50)
                billboard.AlwaysOnTop = true
                billboard.ExtentsOffset = Vector3.new(0, 3, 0)
                billboard.Adornee = v.Character.Head
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = v.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextStrokeTransparency = 0
                label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                label.Font = Enum.Font.GothamBold
                label.TextSize = 14
                label.Parent = billboard
                billboard.Parent = v.Character.Head
            end
        end
    end
end)
RemoveEspBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(Players:GetPlayers()) do
        clearPlayerESP(v)
    end
end)
InstantPromptBtn.MouseButton1Click:Connect(function()
    instantPromptEnabled = not instantPromptEnabled
    if instantPromptEnabled then
        InstantPromptBtn.Text = "Instant Interact: ON"
        InstantPromptBtn.TextColor3 = Color3.fromRGB(0, 255, 130)
        for _, prompt in ipairs(Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 0
            end
        end
        if not promptDescendantConn then
            promptDescendantConn = Workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                end
            end)
        end
    else
        InstantPromptBtn.Text = "Instant Interact: OFF"
        InstantPromptBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
        if promptDescendantConn then
            promptDescendantConn:Disconnect()
            promptDescendantConn = nil
        end
    end
end)
InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    if infJumpEnabled then
        InfJumpBtn.Text = "Inf Jump: ON"
        InfJumpBtn.TextColor3 = Color3.fromRGB(0, 255, 130)
    else
        InfJumpBtn.Text = "Inf Jump: OFF"
        InfJumpBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
    end
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if not infJumpEnabled then return end
    if input.KeyCode == Enum.KeyCode.Space then
        local character = Player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
RunService.RenderStepped:Connect(function()
    if fullbrightEnabled then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
        Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    end
    if noFogEnabled then
        Lighting.FogStart = 0
        Lighting.FogEnd = 999999
        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if atmosphere then atmosphere.Density = 0 end
    end
end)
local function startFling()
    local lp = Players.LocalPlayer
    local c, hrp, vel, movel = nil, nil, nil, 0.1
    while flingEnabled and flingEnabled == true do
        RunService.Heartbeat:Wait()
        c = lp.Character
        hrp = c and c:FindFirstChild("HumanoidRootPart")
        if hrp then
            vel = hrp.Velocity
            hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
            RunService.RenderStepped:Wait()
            hrp.Velocity = vel
            RunService.Stepped:Wait()
            hrp.Velocity = vel + Vector3.new(0, movel, 0)
            movel = -movel
        end
    end
end
FlingBtn.MouseButton1Click:Connect(function()
    flingEnabled = not flingEnabled
    FlingBtn.Text = flingEnabled and "Fling: ON" or "Fling: OFF"
    FlingBtn.TextColor3 = flingEnabled and Color3.fromRGB(0, 255, 130) or Color3.fromRGB(170, 170, 180)
    if flingEnabled then
        if flingThread and coroutine.status(flingThread) == "running" then
            coroutine.close(flingThread)
        end
        flingThread = coroutine.create(startFling)
        coroutine.resume(flingThread)
    else
        if flingThread and coroutine.status(flingThread) == "running" then
            coroutine.close(flingThread)
            flingThread = nil
        end
    end
end)

local SpeedJumpFrame = Instance.new("Frame")
SpeedJumpFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
SpeedJumpFrame.BorderSizePixel = 0
SpeedJumpFrame.Position = UDim2.new(0, -1, 0, 291 * sizeMultiplier)
SpeedJumpFrame.Size = UDim2.new(1.001, 1, 0, 60 * sizeMultiplier)
SpeedJumpFrame.Visible = false
SpeedJumpFrame.Parent = MainFrame

local SpeedJumpCorner = Instance.new("UICorner")
SpeedJumpCorner.CornerRadius = UDim.new(0, 7)
SpeedJumpCorner.Parent = SpeedJumpFrame

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MinimizeBtn.Position = UDim2.new(1, -27, 0, 5 * sizeMultiplier)
MinimizeBtn.Size = UDim2.new(0, 13 * sizeMultiplier, 0, 11 * sizeMultiplier)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "x"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
MinimizeBtn.TextSize = 7 * sizeMultiplier
MinimizeBtn.Parent = SpeedJumpFrame

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 3)
MinimizeCorner.Parent = MinimizeBtn

local SpeedJumpBtn = Instance.new("TextButton")
SpeedJumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SpeedJumpBtn.Position = UDim2.new(0, 9 * sizeMultiplier, 0, 261 * sizeMultiplier)
SpeedJumpBtn.Size = UDim2.new(0, 132 * sizeMultiplier, 0, 20 * sizeMultiplier)
SpeedJumpBtn.Font = Enum.Font.GothamSemibold
SpeedJumpBtn.Text = "speed & jump"
SpeedJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedJumpBtn.TextSize = 8 * sizeMultiplier
SpeedJumpBtn.Parent = MainFrame

local SpeedJumpBtnCorner = Instance.new("UICorner")
SpeedJumpBtnCorner.CornerRadius = UDim.new(0, 4)
SpeedJumpBtnCorner.Parent = SpeedJumpBtn

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, 10, 0, 10)
SpeedLabel.Size = UDim2.new(0, 50, 0, 12)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.TextSize = 7 * sizeMultiplier
SpeedLabel.Parent = SpeedJumpFrame

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
SpeedBtn.Position = UDim2.new(0, 10, 0, 25)
SpeedBtn.Size = UDim2.new(0, 50, 0, 14)
SpeedBtn.Font = Enum.Font.Gotham
SpeedBtn.Text = "SET"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.TextSize = 6 * sizeMultiplier
SpeedBtn.Parent = SpeedJumpFrame

local SpeedTextBox = Instance.new("TextBox")
SpeedTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SpeedTextBox.Position = UDim2.new(0, 65, 0, 25)
SpeedTextBox.Size = UDim2.new(0, 80, 0, 14)
SpeedTextBox.Font = Enum.Font.Gotham
SpeedTextBox.Text = "16"
SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedTextBox.TextSize = 7 * sizeMultiplier
SpeedTextBox.Parent = SpeedJumpFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 3)
SpeedCorner.Parent = SpeedTextBox

local AutoBtn = Instance.new("TextButton")
AutoBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
AutoBtn.Position = UDim2.new(0, 160, 0, 38)
AutoBtn.Size = UDim2.new(0, 50, 0, 24)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "AUTO"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.TextSize = 7 * sizeMultiplier
AutoBtn.Parent = SpeedJumpFrame

local AutoCorner = Instance.new("UICorner")
AutoCorner.CornerRadius = UDim.new(0, 3)
AutoCorner.Parent = AutoBtn

local JumpLabel = Instance.new("TextLabel")
JumpLabel.BackgroundTransparency = 1
JumpLabel.Position = UDim2.new(0, 10, 0, 45)
JumpLabel.Size = UDim2.new(0, 50, 0, 12)
JumpLabel.Font = Enum.Font.Gotham
JumpLabel.Text = "Jump:"
JumpLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
JumpLabel.TextSize = 7 * sizeMultiplier
JumpLabel.Parent = SpeedJumpFrame

local JumpBtn = Instance.new("TextButton")
JumpBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
JumpBtn.Position = UDim2.new(0, 10, 0, 60)
JumpBtn.Size = UDim2.new(0, 50, 0, 14)
JumpBtn.Font = Enum.Font.Gotham
JumpBtn.Text = "SET"
JumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpBtn.TextSize = 6 * sizeMultiplier
JumpBtn.Parent = SpeedJumpFrame

local JumpTextBox = Instance.new("TextBox")
JumpTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
JumpTextBox.Position = UDim2.new(0, 65, 0, 60)
JumpTextBox.Size = UDim2.new(0, 80, 0, 14)
JumpTextBox.Font = Enum.Font.Gotham
JumpTextBox.Text = "50"
JumpTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpTextBox.TextSize = 7 * sizeMultiplier
JumpTextBox.Parent = SpeedJumpFrame

local JumpCorner = Instance.new("UICorner")
JumpCorner.CornerRadius = UDim.new(0, 3)
JumpCorner.Parent = JumpTextBox
local function toggleSpeedJumpFrame()
    SpeedJumpFrame.Visible = not SpeedJumpFrame.Visible
end

SpeedJumpBtn.MouseButton1Click:Connect(toggleSpeedJumpFrame)
MinimizeBtn.MouseButton1Click:Connect(toggleSpeedJumpFrame)
AutoBtn.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled
    AutoBtn.TextColor3 = autoEnabled and Color3.fromRGB(150, 255, 150) or Color3.fromRGB(255, 255, 255)
    if autoEnabled then
        coroutine.wrap(function()
            while autoEnabled do
                local character = Player.Character or Player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                while autoEnabled and humanoid and humanoid:IsDescendantOf(Workspace) do
                    local speed = tonumber(SpeedTextBox.Text) or 16
                    local jump = tonumber(JumpTextBox.Text) or 50
                    humanoid.WalkSpeed = speed
                    humanoid.JumpPower = jump
                    task.wait(0.3)
                end
            end
        end)()
    end
end)
SpeedBtn.MouseButton1Click:Connect(function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        local speed = tonumber(SpeedTextBox.Text) or 16
        Player.Character.Humanoid.WalkSpeed = speed
    end
end)
JumpBtn.MouseButton1Click:Connect(function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        local jump = tonumber(JumpTextBox.Text) or 50
        Player.Character.Humanoid.JumpPower = jump
    end
end)