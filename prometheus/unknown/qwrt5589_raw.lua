local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("南通中心[半成品]", "Default")

local tab1 = DrRayLibrary.newTab("通用", "ImageIdHere")

tab1.newLabel("通用脚本")

tab1.newButton("无敌少侠飞行", "", function()

    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()

end)

tab1.newButton("免费动画", "免费的动画", function()

    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()

end)

tab1.newButton("隐身道具", "真的隐身", function()

    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()

end)

tab1.newButton("无限连跳", "无限连跳", function()

    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()

end)

tab1.newButton("无敌甩飞", "甩飞脚本", function()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()

end)

tab1.newButton("指令", "我也不知道", function()

    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()

end)

tab1.newButton("透视脚本", "透视所有玩家", function()

    if _G.Reantheajfdfjdgse then

    return

end

_G.Reantheajfdfjdgse = "susan"

local coregui = game:GetService("CoreGui")

local players = game:GetService("Players")

local plr = players.LocalPlayer

local highlights = {}

function esp(target, color)

    pcall(function()

        if target.Character then

            if not highlights[target] then

                local highlight = Instance.new("Highlight", coregui)

                highlight.Name = target.Name

                highlight.Adornee = target.Character

                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                highlight.FillColor = color

                highlights[target] = highlight

            else

                highlights[target].FillColor = color

            end

        end

    end)

end

players.PlayerAdded:Connect(function(v)

    v.CharacterAdded:Connect(function()

        esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))

    end)

end)

players.PlayerRemoving:Connect(function(v)

    if highlights[v] then

        highlights[v]:Destroy()

        highlights[v] = nil

        end

end)

for i, v in pairs(players:GetPlayers()) do

    if v ~= plr then

        local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)

        v.CharacterAdded:Connect(function()

            local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)

            esp(v, color)

        end)

        

        esp(v, color)

    end

end

while task.wait() do

    for i, v in pairs(highlights) do

        local color = _G.UseTeamColor and i.TeamColor.Color or ((plr.TeamColor == i.TeamColor) and _G.FriendColor or _G.EnemyColor)

        v.FillColor = color

    end

end

end)

tab1.newButton("工具点击传送", " ", function()

    mouse = game.Players.LocalPlayer:GetMouse()

                tool = Instance.new("Tool")

                tool.RequiresHandle = false

                tool.Name = "点击传送"

                tool.Activated:connect(function()

                local pos = mouse.Hit+Vector3.new(0,2.5,0)

                pos = CFrame.new(pos.X,pos.Y,pos.Z)

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos

                end)

                tool.Parent = game.Players.LocalPlayer.Backpack

end)

tab1.newButton("工具包", function()

    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()

end)

tab1.newButton("键盘脚本", "这是电脑版的键盘", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()

end)

tab1.newToggle("夜视", " ", true, function(Value)

        if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end

end)

tab1.newToggle("自动跳跳", " ", true, function(s)

getgenv().InfJ = s

    game:GetService("UserInputService").JumpRequest:connect(function()

        if InfJ == true then

            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")

        end

    end)

end)

tab1.newInput("跳跃", "打您的输入。", function(Value)

    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

end)

tab1.newInput("速度", "打您的输入。", function(Value)

    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

end)

tab1.newInput("重力", "打您的输入。", function(Value)

    game.Workspace.Gravity = Value

end)

tab1.newInput("血量", "打您的输入。", function(Value)

    game.Players.LocalPlayer.Character.Humanoid.Health = Value

end)

local tab2 = DrRayLibrary.newTab("脚本汉化版游戏", "ImageIdLogoHere")

tab2.newButton("云脚本", " ", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/LOL/main/%E4%BA%91%E8%84%9A%E6%9C%ACCloud%20script.lua", true))()

end)

tab2.newButton("T脚本v1", " ", function()

    loadstring(game:HttpGet("https://gist.githubusercontent.com/qwrt5589/d370955bedc8d3822f8bd1203443f045/raw"))()

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

tab2.newButton("即将推出", "即将推出", function()

    print('Hello!')

end)

local tab3 = DrRayLibrary.newTab("关于", "ImageIdLogoHere")

tab3.newLabel("作者Tuki")

tab3.newLabel("QQ1693323219")

tab3.newLabel("南通中心群号1045354480")

tab3.newLabel("当前版本V0.9.1")

tab3.newLabel("南通中心使用永久免费")

--[[

tab2.newLabel("Hello, this is Tab 2.")

tab2.newButton("Button", "Prints Hello!", function()

    print('Hello!')

end)

tab2.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)

    if toggleState then

        print("On")

    else

        print("Off")

    end

end)

tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)

    print(selectedOption)

end)

]]