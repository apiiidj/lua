local Plr = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local maker = "marco.devs and nekith"

print("init notiUI")

local gui = Instance.new("ScreenGui")
gui.Name = "notiUI" gui.ResetOnSpawn = false gui.IgnoreGuiInset = true
gui.Parent = Plr:WaitForChild("PlayerGui")

local mainFrm = Instance.new("Frame")
mainFrm.AnchorPoint = Vector2.new(.5,0)
mainFrm.Size = UDim2.new(0,380,0,80)
mainFrm.Position = UDim2.new(.5,0,0,-120)
mainFrm.BorderSizePixel = 0
mainFrm.BackgroundColor3 = Color3.fromRGB(255,255,255)
mainFrm.BackgroundTransparency = 0.11
mainFrm.Parent = gui

local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0,14)
corner.Parent = mainFrm

local stroke=Instance.new("UIStroke")
stroke.Thickness=2 stroke.Color=Color3.fromRGB(225,225,225)
stroke.Parent=mainFrm

local bgImg = Instance.new("ImageLabel")
bgImg.Image = "rbxassetid://1316045217"
bgImg.BackgroundTransparency = 1
bgImg.ImageTransparency = 0.69
bgImg.ScaleType = Enum.ScaleType.Slice
bgImg.SliceCenter = Rect.new(10,10,118,118)
bgImg.Size = UDim2.new(1,12,1,12)
bgImg.Position = UDim2.new(0,-6,0,-6)
bgImg.Parent = mainFrm

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-40,0,34) title.Position = UDim2.new(0,20,0,14)
title.Parent = mainFrm
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "Rights given to wearedevs"
title.TextSize = 22 title.TextColor3 = Color3.fromRGB(34,34,34)
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel")
subtitle.Parent = mainFrm
subtitle.Position = UDim2.new(0,20,0,46)
subtitle.Size = UDim2.new(1,-40,0,22)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.Text = ("MADE BY %s"):format(maker:upper())
subtitle.TextSize = 14
subtitle.TextColor3 = Color3.fromRGB(120,120,120)
subtitle.TextXAlignment = Enum.TextXAlignment.Left

local showTween = TweenService:Create(mainFrm, TweenInfo.new(.43, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Position = UDim2.new(.5,0,0,30)
})

local hideTween = TweenService:Create(mainFrm, TweenInfo.new(.31, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
	Position = UDim2.new(.5,0,0,-140),
	BackgroundTransparency = 1
})

local _tmp = nil
local tmpNote = "v1.0"
local whatever = 1337

task.spawn(function()
	mainFrm.Position = UDim2.new(.5,0,0,-100)
	mainFrm.BackgroundTransparency = 0.2
	showTween:Play()
	showTween.Completed:Wait()
	wait(5)
	task.wait(0.02)
	hideTween:Play()
	hideTween.Completed:Wait()
	print("notif closed")
	gui:Destroy()
end)

local madeBy = "marco.devs and nekith"

local plr= game.Players.LocalPlayer
local rep = game:GetService("ReplicatedStorage")
local rs  = game:GetService("RunService")
local uis = game:GetService("UserInputService")

local gui=Instance.new("ScreenGui")
gui.Name="WRD_Toggle_UI"
gui.ResetOnSpawn=false ; gui.IgnoreGuiInset=true
gui.Parent = plr:WaitForChild("PlayerGui")

local frame=Instance.new("Frame")
frame.Active=true
frame.BorderSizePixel=0
frame.BackgroundColor3=Color3.fromRGB(10,10,10)
frame.Size=UDim2.new(0,260,0,169)
frame.Position=UDim2.new(.5,0,.5,0)
frame.AnchorPoint=Vector2.new(.5,.5)
frame.Parent=gui

local fCorner=Instance.new("UICorner")
fCorner.CornerRadius=UDim.new(0,18)
fCorner.Parent=frame

local fStroke=Instance.new("UIStroke")
fStroke.Thickness=3
fStroke.Color=Color3.fromRGB(180,20,30)
fStroke.Parent=frame

local title=Instance.new("TextLabel")
title.Parent=frame
title.Text="FLING"
title.TextScaled=true
title.BackgroundTransparency=1
title.TextColor3=Color3.fromRGB(180,20,30)
title.Position=UDim2.new(0,10,0,5)
title.Size=UDim2.new(1,-20,0,60)
title.Font=Enum.Font.GothamBold

local sig=Instance.new("TextLabel")
sig.Parent=frame
sig.BackgroundTransparency=1
sig.AnchorPoint=Vector2.new(1,1)
sig.Position=UDim2.new(1,-8,1,-4)
sig.Size=UDim2.new(0,160,0,20)
sig.Font=Enum.Font.GothamBold
sig.TextScaled=true
sig.TextXAlignment=Enum.TextXAlignment.Right
sig.TextColor3=Color3.fromRGB(150,150,150)
sig.Text="made by "..madeBy

local btn=Instance.new("TextButton")
btn.Parent=frame
btn.BackgroundTransparency=1
btn.AutoButtonColor=false
btn.Size=UDim2.new(1,-60,0,70)
btn.Position=UDim2.new(0,31,0,80)
btn.Font=Enum.Font.GothamBold
btn.TextScaled=true
btn.Text="OFF"
btn.TextColor3=Color3.fromRGB(180,20,30)

local bCorner=Instance.new("UICorner"); bCorner.CornerRadius=UDim.new(0,14); bCorner.Parent=btn
local bStroke=Instance.new("UIStroke"); bStroke.Thickness=3; bStroke.Color=Color3.fromRGB(180,20,30); bStroke.Parent=btn

local lineColorOff=Color3.fromRGB(180,20,30)
local topL=Instance.new("Frame");    topL.Parent=btn;    topL.BorderSizePixel=0;    topL.Position=UDim2.new(0,0,0,0);     topL.Size=UDim2.new(1,0,0,2); topL.BackgroundColor3=lineColorOff
local bottomL=Instance.new("Frame"); bottomL.Parent=btn; bottomL.BorderSizePixel=0; bottomL.Size=UDim2.new(1,0,0,2);      bottomL.Position=UDim2.new(0,0,1,-2); bottomL.BackgroundColor3=lineColorOff
local leftL=Instance.new("Frame");   leftL.Parent=btn;   leftL.BorderSizePixel=0;   leftL.Size=UDim2.new(0,2,1,0);        leftL.Position=UDim2.new(0,0,0,0); leftL.BackgroundColor3=lineColorOff
local rightL=Instance.new("Frame");  rightL.Parent=btn;  rightL.BorderSizePixel=0;  rightL.Size=UDim2.new(0,2,1,0);       rightL.Position=UDim2.new(1,-2,0,0); rightL.BackgroundColor3=lineColorOff

if not rep:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
	local junk=Instance.new("Decal"); junk.Name="juisdfj0i32i0eidsuf0iok"; junk.Parent=rep
end

local GREEN=Color3.fromRGB(0,200,100)
local IS_ON=false
local _unused=nil

local function setOn(on)
	IS_ON = on and true or false
	if IS_ON then
		btn.Text="ON"
		btn.TextColor3=GREEN
		bStroke.Color=GREEN
		topL.BackgroundColor3=GREEN; bottomL.BackgroundColor3=GREEN; leftL.BackgroundColor3=GREEN; rightL.BackgroundColor3=GREEN
	else
		btn.Text="OFF"
		local c=lineColorOff
		btn.TextColor3=c
		bStroke.Color=c
		topL.BackgroundColor3=c; bottomL.BackgroundColor3=c; leftL.BackgroundColor3=c; rightL.BackgroundColor3=c
	end
end

btn.MouseButton1Click:Connect(function()
	setOn(not IS_ON)
end)

local dragging,startPos,startUDim
frame.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		dragging=true
		startPos=i.Position
		startUDim=frame.Position
	end
end)

frame.InputEnded:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		dragging=false
	end
end)

uis.InputChanged:Connect(function(i)
	if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
		local d=i.Position-startPos
		frame.Position=UDim2.new(startUDim.X.Scale, startUDim.X.Offset+d.X, startUDim.Y.Scale, startUDim.Y.Offset+d.Y)
	end
end)

task.spawn(function()
	local char, root, vv
	local fl=0.1
	while true do
		if not IS_ON then task.wait(0.05) end
		rs.Heartbeat:Wait()
		if IS_ON then
			while IS_ON and not (char and char.Parent and root and root.Parent) do
				rs.Heartbeat:Wait()
				char=plr.Character
				root=char and char:FindFirstChild("HumanoidRootPart")
			end
			if IS_ON and root then
				vv=root.Velocity
				root.Velocity=vv*1000000 + Vector3.new(0,1000000,0)
				rs.RenderStepped:Wait()
				if root.Parent then root.Velocity=vv end
				rs.Stepped:Wait()
				if root.Parent then
					root.Velocity=vv + Vector3.new(0,fl,0)
					fl=-fl
				end
			end
		end
	end
end)