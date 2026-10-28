local main = Instance.new("ScreenGui")
main.Name = "main"
main.ResetOnSpawn = false
main.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", main)
frame.Name = "frame"
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 3
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Active = true
frame.Draggable = true

local titler = Instance.new("TextLabel", frame)
titler.Name = "titler"
titler.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titler.BorderColor3 = Color3.fromRGB(255, 0, 0)
titler.BorderSizePixel = 3
titler.Size = UDim2.new(1, 0, 0, 40)
titler.Font = Enum.Font.SourceSans
titler.Text = "c00lkidd Gui By Lua land"
titler.TextColor3 = Color3.fromRGB(255, 255, 255)
titler.TextSize = 24

local contentFrame = Instance.new("Frame", frame)
contentFrame.Name = "contentFrame"
contentFrame.BackgroundTransparency = 1
contentFrame.Position = UDim2.new(0, 0, 0, 45)
contentFrame.Size = UDim2.new(1, 0, 0, 305)

local function createButton(name, yPos, callback)
	local btn = Instance.new("TextButton", contentFrame)
	btn.Name = name
	btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
	btn.BorderSizePixel = 3
	btn.Position = UDim2.new(0, 10, 0, yPos)
	btn.Size = UDim2.new(0, 280, 0, 40)
	btn.Font = Enum.Font.SourceSans
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 20
	btn.MouseButton1Click:Connect(callback)
end

local currentPage = 1
local maxPage = 5

local navFrame = Instance.new("Frame", frame)
navFrame.Name = "navFrame"
navFrame.BackgroundTransparency = 1
navFrame.Position = UDim2.new(0, 0, 1, -50)
navFrame.Size = UDim2.new(1, 0, 0, 50)

local prevBtn = Instance.new("TextButton", navFrame)
prevBtn.Name = "<"
prevBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
prevBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
prevBtn.BorderSizePixel = 3
prevBtn.Position = UDim2.new(0, 10, 0, 5)
prevBtn.Size = UDim2.new(0, 130, 0, 40)
prevBtn.Font = Enum.Font.SourceSans
prevBtn.Text = "<"
prevBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
prevBtn.TextSize = 20

local nextBtn = Instance.new("TextButton", navFrame)
nextBtn.Name = ">"
nextBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
nextBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
nextBtn.BorderSizePixel = 3
nextBtn.Position = UDim2.new(0, 160, 0, 5)
nextBtn.Size = UDim2.new(0, 130, 0, 40)
nextBtn.Font = Enum.Font.SourceSans
nextBtn.Text = ">"
nextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
nextBtn.TextSize = 20

local function clearContent()
	for _, child in ipairs(contentFrame:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
end

local function loadPage(page)
	clearContent()
	currentPage = page

	prevBtn.Visible = currentPage > 1
	nextBtn.Visible = currentPage < maxPage

	if page == 1 then
		createButton("Skybox", 0, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/Skybox/refs/heads/main/Skybox"))()
		end)
		createButton("Particles", 50, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/Particles/refs/heads/main/Particles"))()
		end)
		createButton("Decal", 100, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/Decal-Spam/refs/heads/main/Decal"))()
		end)
		createButton("Disco", 150, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/disco/refs/heads/main/discodis"))()
		end)
		createButton("Clear Workspace", 200, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/3e992636c7204ed6c60b62c9bf7f32c9/raw/bad4858a21e276a2b5a5a4762a758720b452caf8/Workspace%2520GotEmLol"))()
		end)
		createButton("Flood", 250, function()
			loadstring(game:HttpGet("https://pastebin.com/raw/b6XtEYrs"))()
		end)
	elseif page == 2 then
		createButton("666", 0, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/4362c4da927a85ab8fbe57fe69ab51c4/raw/3b2846e253115fcfc86b5f398e7bb02019ab92a8/666Servergotfiredlol"))()
		end)
		createButton("Draw", 50, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/41392308e475849d10ddaed89de6cf82/raw/26307cee931f95d3477501399915aec2dc3dc6e7/Drawing%2520LandsUHJQ"))()
		end)
		createButton("iOrb", 100, function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-IOrb-thingy-42143"))()
		end)
		createButton("Trail", 150, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/Universal-Trail-Lua-Land/refs/heads/main/Universal%20Trail%20Lua%20land"))()
		end)
		createButton("Hint", 200, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/29fccef769a221b98fd05ebf0bfb4b64/raw/a0b962467444f9e4802c5b573947dae3d78a53d6/HintThec00lOne"))()
		end)
		createButton("Forcefield", 250, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Ahma174/Tool/refs/heads/main/Forcefield"))()
		end)
	elseif page == 3 then
		createButton("Console", 0, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/DevConsoleScript/refs/heads/main/DevConsole.xyz"))()
		end)
		createButton("Billboard", 50, function()
			loadstring(game:HttpGet("https://pastebin.com/raw/7FeCFurr"))()
		end)
		createButton("Fling", 100, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/feFlingGuiByLuaLandNoCrash/refs/heads/main/Fling%20Gui%20No%20Crash"))()
		end)
		createButton("007n7", 150, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/70290c7ba52cca1927fbd2c2429d97e8/raw/c72f74e6cfcaa1c16a9c2d4fbc03d209505858ef/007n7ExecutorPrivate"))()
		end)
		createButton("Call Dad", 200, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/582470c15879625a5ff47a38599203ce/raw/e24bf3b8919eed75012e08c149fbb71010952ce2/Call%2520007n7c00lDadFunnyMoment"))()
		end)
		createButton("Backdoor Executor", 250, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/LuaLandBackdoorExecutor/refs/heads/main/Lua%20Land%20Executor%20Backdoor"))()
		end)
    elseif page == 4 then
		createButton("Server Admin", 0, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Server%20Admin"))()
		end)
		createButton("Team Message", 50, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/c00lkiddTeamMessage/refs/heads/main/c00lkiddk1ngg"))()
		end)
		createButton("Btools", 100, function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
		end)
		createButton("DarkDex", 150, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
		end)
		createButton("Silent Executor", 200, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/02f8dba838cee87c4c377c647d31602f/raw/550c8377cb95360ed296ac92a2758c5ede7454d4/ImSilentExecutor"))()
		end)
		createButton("Fe AntiFling", 250, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/894182905a3962a42d9eacd2df673f15/raw/e18b63ec4cd3e86899e800f7cb9fab7638f9aeac/AntiFlingFeByLuaLand"))()
		end)
	elseif page == 5 then
		createButton("Executor", 0, function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Angelo-Gitland/23f5d42e680644f651ff011d604ad1a4/raw/000e0a02cc25c5d23c597beb68944657aca14727/c00lkidd%2520executor"))()
		end)
		createButton("Grab Knife V4", 50, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"))()
		end)
		createButton("Clown Kidnapper", 100, function()
			loadstring(game:HttpGet('https://pastebin.com/raw/vP2D2vnC'))()
		end)
		createButton("c00lkidd Gui V2", 150, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/c00lkidd-Gui-V2/refs/heads/main/c00lkidd%20Gui%20v2%20Script"))()
		end)
		createButton("Zombie", 200, function()
			loadstring(game:HttpGet(('https://pastefy.app/w7KnPY70/raw'),true))()
		end)
		createButton("MLG Wings", 250, function()
			loadstring(game:HttpGet("https://pastebin.com/raw/YyFbEMkE"))()
		end)
	end
end

prevBtn.MouseButton1Click:Connect(function()
	if currentPage > 1 then
		loadPage(currentPage - 1)
	end
end)

nextBtn.MouseButton1Click:Connect(function()
	if currentPage < maxPage then
		loadPage(currentPage + 1)
	end
end)

-- Load Page 1 on Start
loadPage(1)