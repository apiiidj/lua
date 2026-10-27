pcall(function()
    local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    local DiscordInvite = "UsSvP4EpDj"
    HttpService = game:GetService("HttpService")
    if requestFunc then
            requestFunc({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = HttpService:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = HttpService:GenerateGUID(false),
                    args = {code = DiscordInvite}
                })
            })
    end
    end)
    function checkexecutor()
        local executor = identifyexecutor()
        if executor == "Xeno" then
            game.Players.LocalPlayer:Kick("Unsupported executor | Your executor doesn't support luraph.")
        end
    end
    checkexecutor()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")

local Gui = Instance.new("ScreenGui")
Gui.ResetOnSpawn = false
Gui.Parent = game.CoreGui

local Backdrop = Instance.new("Frame")
Backdrop.Size = UDim2.new(1, 0, 1, 0)
Backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Backdrop.BackgroundTransparency = 0.5
Backdrop.Parent = Gui

local Card = Instance.new("Frame")
Card.Size = UDim2.new(0, 420, 0, 210)
Card.Position = UDim2.new(0.5, -210, 0.6, -105)
Card.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Card.BackgroundTransparency = 1
Card.BorderSizePixel = 0
Card.Parent = Gui

Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 14)

local Accent = Instance.new("Frame")
Accent.Size = UDim2.new(1, 0, 0, 4)
Accent.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Accent.BorderSizePixel = 0
Accent.Parent = Card

Instance.new("UICorner", Accent).CornerRadius = UDim.new(0, 14)

local Icon = Instance.new("TextLabel")
Icon.Size = UDim2.new(0, 48, 0, 48)
Icon.Position = UDim2.new(0, 20, 0, 24)
Icon.Text = "!"
Icon.TextColor3 = Color3.fromRGB(255, 60, 60)
Icon.TextSize = 34
Icon.Font = Enum.Font.GothamBold
Icon.BackgroundTransparency = 1
Icon.Parent = Card

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 0, 40)
Title.Position = UDim2.new(0, 76, 0, 22)
Title.Text = "Script is Patched!"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = Card

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, -40, 0, 50)
Sub.Position = UDim2.new(0, 20, 0, 80)
Sub.Text = "This script developer left, we have no plans of updating this."
Sub.TextColor3 = Color3.fromRGB(160, 160, 170)
Sub.TextSize = 14
Sub.Font = Enum.Font.Gotham
Sub.TextWrapped = true
Sub.TextXAlignment = Enum.TextXAlignment.Center
Sub.BackgroundTransparency = 1
Sub.Parent = Card

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(0, 160, 0, 38)
DiscordBtn.Position = UDim2.new(0.5, -80, 0, 148)
DiscordBtn.Text = "Copy Discord"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 14
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.BorderSizePixel = 0
DiscordBtn.Parent = Card

Instance.new("UICorner", DiscordBtn).CornerRadius = UDim.new(0, 8)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0, 10)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(160, 160, 170)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Card

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
	Position = UDim2.new(0.5, -210, 0.5, -105),
	BackgroundTransparency = 0
}):Play()

DiscordBtn.MouseButton1Click:Connect(function()
	task.spawn(function()
		setclipboard("https://discord.gg/zynix")
		DiscordBtn.Text = "Copied!"
		task.wait(2)
		DiscordBtn.Text = "Copy Discord"
	end)
end)

CloseBtn.MouseButton1Click:Connect(function()
	TweenService:Create(Card, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Position = UDim2.new(0.5, -210, 0.6, -105),
		BackgroundTransparency = 1
	}):Play()
	task.wait(0.3)
	Gui:Destroy()
end)