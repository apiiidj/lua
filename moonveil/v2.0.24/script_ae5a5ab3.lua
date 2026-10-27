-- This script was generated using MoonVeil 2.0.24 [https://moonveil.cc]
local Players=game:GetService"Players"
local TweenService=game:GetService"TweenService"
local RunService=game:GetService"RunService"
local HttpService=game:GetService"HttpService"
local CoreGui=game:GetService"CoreGui"
local RS=game:GetService"ReplicatedStorage"
local VIM=game:GetService"VirtualInputManager"
local LocalPlayer=Players.LocalPlayer or Players:GetPropertyChangedSignal"LocalPlayer":Wait()
local AUTH_CFG={
    CorrectKey="miNeApiNAkee",
    DiscordLink="https://discord.gg/t6rhaAZvhG",
    ExpireHours=24,
    LogoNumberId=94398897297532,
    LogoAssetId="rbxassetid://94398897297532",
    FileNamePrefix="Aeris_Auth_"
}
local SOLVER_CFG={
    TrustFlags=true,
    MaxBruteForce=1000,
    MaxSolutions=1/0,
    MaxNodes=500000000,
    MonteCarloSamples=100000,
    MaxSolveTime=2,
    MaxDPOps=10000000,
    MaxCascade=12,
    Debounce=0.02,
    MinesValueIsRemaining=false,
    Enabled=false,
    MaxVisibleHL=24,
    HighlightRange=60,
    BorderMoveThreshold=1.5,
    AutoReveal=false,
    AutoRevealDelay=0.05,
    RevealHoverHeight=2,
    StompVelocity=-150,
    AutoFlag=false,
    AutoFlagRange=35,
    AutoFlagCooldown=0.15
}
local COLOR={
    Safe=Color3 .fromRGB(0,255,0),
    Mine=Color3 .fromRGB(255,0,0),
    Best=Color3 .fromRGB(170,0,255),
    Prob50=Color3 .fromRGB(255,255,0),
    ProbLow=Color3 .fromRGB(64,224,255),
    Unknown=Color3 .fromRGB(255,255,0)
}
local function GetGuiParent()
    local success,parent=pcall(function()
        return(gethui and gethui())or CoreGui
    end)
    if success and parent then
        return parent
    end
    return LocalPlayer:WaitForChild"PlayerGui"
end
local function GetAuthStorageName()
    return AUTH_CFG.FileNamePrefix..tostring(LocalPlayer.UserId)..".json"
end
local function IsKeySavedAndValid()
    if isfile and readfile and isfile(GetAuthStorageName())then
        local ok,dataRaw=pcall(readfile,GetAuthStorageName())
        if ok and dataRaw then
            local success,data=pcall(function()
                return HttpService:JSONDecode(dataRaw)
            end)
            if success and data and data.Account==LocalPlayer.UserId and data.Key==AUTH_CFG.CorrectKey then
                local elapsed=os.time()-(data.Timestamp or 0)
                if elapsed>=0 and elapsed<(AUTH_CFG.ExpireHours*3600)then
                    return true
                end
            end
        end
    end
    return false
end
local function SaveKeySuccess()
    if writefile then
        local data={
            Account=LocalPlayer.UserId,
            Key=AUTH_CFG.CorrectKey,
            Timestamp=os.time()
        }
        pcall(writefile,GetAuthStorageName(),HttpService:JSONEncode(data))
    end
end
local function ShowSplashScreen(onFinish)
    local splashGui=Instance.new"ScreenGui"
    splashGui.Name="Aeris_Splash"
    splashGui.IgnoreGuiInset=true
    splashGui.ResetOnSpawn=false
    splashGui.DisplayOrder=999999
    splashGui.Parent=GetGuiParent()
    local bg=Instance.new"Frame"
    bg.Size=UDim2 .new(1,0,1,0)
    bg.BackgroundColor3=Color3 .fromRGB(245,245,250)
    bg.BackgroundTransparency=1
    bg.BorderSizePixel=0
    bg.Parent=splashGui
    local container=Instance.new"Frame"
    container.AnchorPoint=Vector2 .new(0.5,0.5)
    container.Position=UDim2 .new(0.5,0,0.48,0)
    container.Size=UDim2 .new(0,420,0,460)
    container.BackgroundTransparency=1
    container.Parent=bg
    local logo=Instance.new"ImageLabel"
    logo.Name="Logo"
    logo.AnchorPoint=Vector2 .new(0.5,0)
    logo.Position=UDim2 .new(0.5,0,0,0)
    logo.Size=UDim2 .new(0,270,0,270)
    logo.BackgroundTransparency=1
    logo.Image=AUTH_CFG.LogoAssetId
    logo.ImageTransparency=1
    logo.ScaleType=Enum.ScaleType.Fit
    logo.Parent=container
    local title=Instance.new"TextLabel"
    title.AnchorPoint=Vector2 .new(0.5,0)
    title.Position=UDim2 .new(0.5,0,0,285)
    title.Size=UDim2 .new(1,0,0,52)
    title.BackgroundTransparency=1
    title.Font=Enum.Font.GothamBold
    title.Text="Aeris."
    title.TextColor3=Color3 .fromRGB(35,25,55)
    title.TextSize=48
    title.TextTransparency=1
    title.Parent=container
    local subtitle=Instance.new"TextLabel"
    subtitle.AnchorPoint=Vector2 .new(0.5,0)
    subtitle.Position=UDim2 .new(0.5,0,0,342)
    subtitle.Size=UDim2 .new(1,0,0,30)
    subtitle.BackgroundTransparency=1
    subtitle.Font=Enum.Font.GothamMedium
    subtitle.Text="All for you"
    subtitle.TextColor3=Color3 .fromRGB(120,80,190)
    subtitle.TextSize=22
    subtitle.TextTransparency=1
    subtitle.Parent=container
    local tiFadeIn=TweenInfo.new(1.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
    TweenService:Create(bg,tiFadeIn,{
        BackgroundTransparency=0.05
    }):Play()
    TweenService:Create(logo,tiFadeIn,{
        ImageTransparency=0
    }):Play()
    TweenService:Create(title,tiFadeIn,{
        TextTransparency=0
    }):Play()
    TweenService:Create(subtitle,tiFadeIn,{
        TextTransparency=0
    }):Play()
    task.delay(1.5,function()
        task.delay(3,function()
            local tiFadeOut=TweenInfo.new(1.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
            TweenService:Create(bg,tiFadeOut,{
                BackgroundTransparency=1
            }):Play()
            TweenService:Create(logo,tiFadeOut,{
                ImageTransparency=1
            }):Play()
            TweenService:Create(title,tiFadeOut,{
                TextTransparency=1
            }):Play()
            local lastTween=TweenService:Create(subtitle,tiFadeOut,{
                TextTransparency=1
            })
            lastTween:Play()
            lastTween.Completed:Connect(function()
                splashGui:Destroy()
                if onFinish then
                    onFinish()
                end
            end)
        end)
    end)
end
local function CreateKeyPrompt(onSuccess)
    local keyGui=Instance.new"ScreenGui"
    keyGui.Name="Aeris_KeyAuth"
    keyGui.IgnoreGuiInset=true
    keyGui.ResetOnSpawn=false
    keyGui.DisplayOrder=999998
    keyGui.Parent=GetGuiParent()
    local bgDim=Instance.new"Frame"
    bgDim.Size=UDim2 .new(1,0,1,0)
    bgDim.BackgroundColor3=Color3 .fromRGB(15,10,25)
    bgDim.BackgroundTransparency=1
    bgDim.BorderSizePixel=0
    bgDim.Parent=keyGui
    local frame=Instance.new"Frame"
    frame.AnchorPoint=Vector2 .new(0.5,0.5)
    frame.Position=UDim2 .new(0.5,0,0.45,0)
    frame.Size=UDim2 .new(0,460,0,340)
    frame.BackgroundColor3=Color3 .fromRGB(24,16,38)
    frame.BackgroundTransparency=1
    frame.BorderSizePixel=0
    frame.Parent=bgDim
    local frameCorner=Instance.new"UICorner"
    frameCorner.CornerRadius=UDim.new(0,16)
    frameCorner.Parent=frame
    local frameStroke=Instance.new"UIStroke"
    frameStroke.Thickness=2
    frameStroke.Color=Color3 .fromRGB(255,255,255)
    frameStroke.Transparency=1
    frameStroke.Parent=frame
    local strokeGrad=Instance.new"UIGradient"
    strokeGrad.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,Color3 .fromRGB(180,100,255)),
        ColorSequenceKeypoint.new(0.5,Color3 .fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1,Color3 .fromRGB(180,100,255))
    }
    strokeGrad.Parent=frameStroke
    local rotConn
    rotConn=RunService.RenderStepped:Connect(function(dt)
        if not frame:IsDescendantOf(game)then
            rotConn:Disconnect()
            return
        end
        strokeGrad.Rotation=(strokeGrad.Rotation+90*dt)%360
    end)
    local title=Instance.new"TextLabel"
    title.Position=UDim2 .new(0,24,0,22)
    title.Size=UDim2 .new(1,-48,0,28)
    title.BackgroundTransparency=1
    title.Font=Enum.Font.GothamBold
    title.Text="Aeris \226\128\162 Key Verification"
    title.TextColor3=Color3 .fromRGB(255,255,255)
    title.TextSize=22
    title.TextXAlignment=Enum.TextXAlignment.Left
    title.Parent=frame
    local subtitle=Instance.new"TextLabel"
    subtitle.Position=UDim2 .new(0,24,0,52)
    subtitle.Size=UDim2 .new(1,-48,0,18)
    subtitle.BackgroundTransparency=1
    subtitle.Font=Enum.Font.GothamMedium
    subtitle.Text="Team Aeris | MineSweeper Engine"
    subtitle.TextColor3=Color3 .fromRGB(195,165,250)
    subtitle.TextSize=13
    subtitle.TextXAlignment=Enum.TextXAlignment.Left
    subtitle.Parent=frame
    local warning=Instance.new"TextLabel"
    warning.Position=UDim2 .new(0,24,0,78)
    warning.Size=UDim2 .new(1,-48,0,36)
    warning.BackgroundTransparency=1
    warning.Font=Enum.Font.Gotham
    warning.Text="\226\154\160\239\184\143 Keys expire every 24 hours and must be entered per account."
    warning.TextColor3=Color3 .fromRGB(255,195,90)
    warning.TextSize=12
    warning.TextWrapped=true
    warning.TextXAlignment=Enum.TextXAlignment.Left
    warning.Parent=frame
    local boxContainer=Instance.new"Frame"
    boxContainer.Position=UDim2 .new(0,24,0,126)
    boxContainer.Size=UDim2 .new(1,-48,0,48)
    boxContainer.BackgroundColor3=Color3 .fromRGB(12,8,20)
    boxContainer.BackgroundTransparency=0.55
    boxContainer.BorderSizePixel=0
    boxContainer.Parent=frame
    local boxCorner=Instance.new"UICorner"
    boxCorner.CornerRadius=UDim.new(0,10)
    boxCorner.Parent=boxContainer
    local boxStroke=Instance.new"UIStroke"
    boxStroke.Thickness=1.2
    boxStroke.Color=Color3 .fromRGB(150,95,240)
    boxStroke.Transparency=0.3
    boxStroke.Parent=boxContainer
    local textBox=Instance.new"TextBox"
    textBox.Position=UDim2 .new(0,14,0,0)
    textBox.Size=UDim2 .new(1,-28,1,0)
    textBox.BackgroundTransparency=1
    textBox.Font=Enum.Font.GothamMedium
    textBox.Text=""
    textBox.PlaceholderText="Enter key here..."
    textBox.PlaceholderColor3=Color3 .fromRGB(150,130,185)
    textBox.TextColor3=Color3 .fromRGB(255,255,255)
    textBox.TextSize=14
    textBox.ClearTextOnFocus=false
    textBox.TextXAlignment=Enum.TextXAlignment.Left
    textBox.Parent=boxContainer
    local status=Instance.new"TextLabel"
    status.Position=UDim2 .new(0,24,0,182)
    status.Size=UDim2 .new(1,-48,0,22)
    status.BackgroundTransparency=1
    status.Font=Enum.Font.GothamMedium
    status.Text=""
    status.TextColor3=Color3 .fromRGB(240,100,100)
    status.TextSize=13
    status.Parent=frame
    local function CreateButton(pos,size,text)
        local btn=Instance.new"TextButton"
        btn.Position=pos
        btn.Size=size
        btn.BackgroundColor3=Color3 .fromRGB(45,28,70)
        btn.BackgroundTransparency=0.55
        btn.Font=Enum.Font.GothamBold
        btn.Text=text
        btn.TextColor3=Color3 .fromRGB(255,255,255)
        btn.TextSize=14
        btn.AutoButtonColor=false
        btn.Parent=frame
        local c=Instance.new"UICorner"
        c.CornerRadius=UDim.new(0,10)
        c.Parent=btn
        local s=Instance.new"UIStroke"
        s.Thickness=1.5
        s.Color=Color3 .fromRGB(255,255,255)
        s.Parent=btn
        local g=Instance.new"UIGradient"
        g.Color=ColorSequence.new{
            ColorSequenceKeypoint.new(0,Color3 .fromRGB(160,90,255)),
            ColorSequenceKeypoint.new(0.5,Color3 .fromRGB(255,255,255)),
            ColorSequenceKeypoint.new(1,Color3 .fromRGB(160,90,255))
        }
        g.Parent=s
        local btnConn
        btnConn=RunService.RenderStepped:Connect(function(dt)
            if not btn:IsDescendantOf(game)then
                btnConn:Disconnect()
                return
            end
            g.Rotation=(g.Rotation+80*dt)%360
        end)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn,TweenInfo.new(0.2),{
                BackgroundTransparency=0.35
            }):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn,TweenInfo.new(0.2),{
                BackgroundTransparency=0.55
            }):Play()
        end)
        return btn
    end
    local verifyBtn=CreateButton(UDim2 .new(0,24,0,220),UDim2 .new(0.5,-30,0,44),"Verify Key")
    local getKeyBtn=CreateButton(UDim2 .new(0.5,6,0,220),UDim2 .new(0.5,-30,0,44),"Get Key")
    local tiOpen=TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
    TweenService:Create(bgDim,TweenInfo.new(0.35),{
        BackgroundTransparency=0.25
    }):Play()
    TweenService:Create(frame,tiOpen,{
        Position=UDim2 .new(0.5,0,0.5,0),
        BackgroundTransparency=0.25
    }):Play()
    TweenService:Create(frameStroke,tiOpen,{
        Transparency=0
    }):Play()
    local function SmoothClose(proceedCallback)
        local tiClose=TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
        TweenService:Create(bgDim,tiClose,{
            BackgroundTransparency=1
        }):Play()
        TweenService:Create(frameStroke,tiClose,{
            Transparency=1
        }):Play()
        local lastT=TweenService:Create(frame,tiClose,{
            Position=UDim2 .new(0.5,0,0.55,0),
            BackgroundTransparency=1
        })
        lastT:Play()
        lastT.Completed:Connect(function()
            keyGui:Destroy()
            if proceedCallback then
                proceedCallback()
            end
        end)
    end
    getKeyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(AUTH_CFG.DiscordLink)
            status.TextColor3=Color3 .fromRGB(120,230,150)
            status.Text="Key link copied to clipboard!"
        else
            status.TextColor3=Color3 .fromRGB(255,220,100)
            status.Text="Discord: "..AUTH_CFG.DiscordLink
        end
    end)
    verifyBtn.MouseButton1Click:Connect(function()
        local inputKey=textBox.Text
        if inputKey==AUTH_CFG.CorrectKey then
            status.TextColor3=Color3 .fromRGB(130,255,160)
            status.Text="Key Verified! Loading Aeris..."
            SaveKeySuccess()
            task.delay(0.5,function()
                SmoothClose(function()
                    ShowSplashScreen(onSuccess)
                end)
            end)
        else
            status.TextColor3=Color3 .fromRGB(255,90,100)
            status.Text="Invalid key. Case & spaces matter!"
        end
    end)
end
local QueueSolve,ClearAll,Draw,Undraw,UpdateBorders
local function InitializeRayfieldUI()
    local ok,Rayfield=pcall(function()
        return loadstring(game:HttpGet"https://sirius.menu/rayfield")()
    end)
    if not ok or not Rayfield then
        warn"[Aeris] Failed to fetch Rayfield library."
        return
    end
    local Window=Rayfield:CreateWindow{
        Name="Aeris | Minesweeper",
        Icon=AUTH_CFG.LogoNumberId,
        LoadingTitle="Aeris Engine",
        LoadingSubtitle="by Team Aeris",
        Theme="Light",
        DisableRayfieldPrompts=false,
        DisableBuildWarnings=false,
        ConfigurationSaving={
            Enabled=false
        },
        Discord={
            Enabled=true,
            Invite="t6rhaAZvhG",
            RememberJoins=true
        },
        KeySystem=false
    }
    local FAQTab=Window:CreateTab("Overview & FAQ",AUTH_CFG.LogoNumberId)
    FAQTab:CreateSection"Tile Indicator Guide"
    local function ColorToRGBString(c)
        return string.format("RGB(%d, %d, %d)",math.round(c.R*255),math.round(c.G*255),math.round(c.B*255))
    end
    local SafeItem=FAQTab:CreateParagraph{
        Title="\240\159\159\162 Safe Tiles",
        Content="Zero mine risk. Guaranteed safe to reveal.\nCurrent Color: "..ColorToRGBString(COLOR.Safe)
    }
    local MineItem=FAQTab:CreateParagraph{
        Title="\240\159\148\180 Bomb Tiles",
        Content="Definite mine presence. Flag it.\nCurrent Color: "..ColorToRGBString(COLOR.Mine)
    }
    local BestItem=FAQTab:CreateParagraph{
        Title="\240\159\159\163 Probability Best Move",
        Content="Optimal statistical move with lowest mine risk.\nCurrent Color: "..ColorToRGBString(COLOR.Best)
    }
    local Prob50Item=FAQTab:CreateParagraph{
        Title="\240\159\159\161 Probability 50%",
        Content="Balanced probability zone (equal 50/50 odds).\nCurrent Color: "..ColorToRGBString(COLOR.Prob50)
    }
    local ProbLowItem=FAQTab:CreateParagraph{
        Title="\240\159\148\181 Very Low Mine Probability",
        Content="High safety margin exploration tile.\nCurrent Color: "..ColorToRGBString(COLOR.ProbLow)
    }
    local ESPTab=Window:CreateTab("ESP Settings","palette")
    ESPTab:CreateSection"ESP Color Customizer"
    ESPTab:CreateColorPicker{
        Name="Safe Tile Color",
        Color=COLOR.Safe,
        Flag="AerisSafeColor",
        Callback=function(newCol)
            COLOR.Safe=newCol
            SafeItem:Set{
                Title="\240\159\159\162 Safe Tiles",
                Content="Zero mine risk. Guaranteed safe to reveal.\nCurrent Color: "..ColorToRGBString(newCol)
            }
            if ClearAll and QueueSolve and SOLVER_CFG.Enabled then
                ClearAll()
                QueueSolve()
            end
        end
    }
    ESPTab:CreateColorPicker{
        Name="Bomb Tile Color",
        Color=COLOR.Mine,
        Flag="AerisMineColor",
        Callback=function(newCol)
            COLOR.Mine=newCol
            MineItem:Set{
                Title="\240\159\148\180 Bomb Tiles",
                Content="Definite mine presence. Flag it.\nCurrent Color: "..ColorToRGBString(newCol)
            }
            if ClearAll and QueueSolve and SOLVER_CFG.Enabled then
                ClearAll()
                QueueSolve()
            end
        end
    }
    ESPTab:CreateColorPicker{
        Name="Best Move Color",
        Color=COLOR.Best,
        Flag="AerisBestColor",
        Callback=function(newCol)
            COLOR.Best=newCol
            BestItem:Set{
                Title="\240\159\159\163 Probability Best Move",
                Content="Optimal statistical move with lowest mine risk.\nCurrent Color: "..ColorToRGBString(newCol)
            }
            if ClearAll and QueueSolve and SOLVER_CFG.Enabled then
                ClearAll()
                QueueSolve()
            end
        end
    }
    ESPTab:CreateColorPicker{
        Name="50% Probability Color",
        Color=COLOR.Prob50,
        Flag="AerisProb50Color",
        Callback=function(newCol)
            COLOR.Prob50=newCol
            Prob50Item:Set{
                Title="\240\159\159\161 Probability 50%",
                Content="Balanced probability zone (equal 50/50 odds).\nCurrent Color: "..ColorToRGBString(newCol)
            }
            if ClearAll and QueueSolve and SOLVER_CFG.Enabled then
                ClearAll()
                QueueSolve()
            end
        end
    }
    ESPTab:CreateColorPicker{
        Name="Low Probability Color",
        Color=COLOR.ProbLow,
        Flag="AerisProbLowColor",
        Callback=function(newCol)
            COLOR.ProbLow=newCol
            ProbLowItem:Set{
                Title="\240\159\148\181 Very Low Mine Probability",
                Content="High safety margin exploration tile.\nCurrent Color: "..ColorToRGBString(newCol)
            }
            if ClearAll and QueueSolve and SOLVER_CFG.Enabled then
                ClearAll()
                QueueSolve()
            end
        end
    }
    ESPTab:CreateSection"Highlighting Optimization"
    ESPTab:CreateSlider{
        Name="Highlight Range (Studs)",
        Range={
            20,
            150
        },
        Increment=5,
        Suffix=" studs",
        CurrentValue=SOLVER_CFG.HighlightRange,
        Flag="AerisHighlightRangeSlider",
        Callback=function(val)
            local n=tonumber(val)
            if n then
                SOLVER_CFG.HighlightRange=n
                if UpdateBorders then
                    UpdateBorders()
                end
            end
        end
    }
    ESPTab:CreateSlider{
        Name="Max Visible Cubes (FPS Saver)",
        Range={
            8,
            80
        },
        Increment=2,
        Suffix=" cubes",
        CurrentValue=SOLVER_CFG.MaxVisibleHL,
        Flag="AerisMaxVisibleHLSlider",
        Callback=function(val)
            local n=tonumber(val)
            if n then
                SOLVER_CFG.MaxVisibleHL=n
                if UpdateBorders then
                    UpdateBorders()
                end
            end
        end
    }
    local CtrlTab=Window:CreateTab("Controls","sliders")
    CtrlTab:CreateSection"Engine State"
    CtrlTab:CreateToggle{
        Name="Solver Active (ESP)",
        CurrentValue=SOLVER_CFG.Enabled,
        Flag="AerisSolverToggle",
        Callback=function(val)
            SOLVER_CFG.Enabled=val
            if val then
                if QueueSolve then
                    QueueSolve()
                end
            else
                if ClearAll then
                    ClearAll()
                end
            end
        end
    }
    CtrlTab:CreateSection"Auto Reveal"
    CtrlTab:CreateToggle{
        Name="Auto Reveal",
        CurrentValue=SOLVER_CFG.AutoReveal,
        Flag="AerisAutoRevealToggle",
        Callback=function(val)
            SOLVER_CFG.AutoReveal=val
            if val and QueueSolve then
                QueueSolve()
            end
        end
    }
    CtrlTab:CreateSlider{
        Name="Reveal Delay",
        Range={
            0.01,
            0.2
        },
        Increment=0.01,
        Suffix="s",
        CurrentValue=SOLVER_CFG.AutoRevealDelay,
        Flag="AerisRevealDelaySlider",
        Callback=function(val)
            local n=tonumber(val)
            if n then
                SOLVER_CFG.AutoRevealDelay=n
            end
        end
    }
    CtrlTab:CreateSection"Auto Flag (PC & Mobile)"
    CtrlTab:CreateToggle{
        Name="Auto Flag (Mines)",
        CurrentValue=SOLVER_CFG.AutoFlag,
        Flag="AerisAutoFlagToggle",
        Callback=function(val)
            SOLVER_CFG.AutoFlag=val
            if val and QueueSolve then
                QueueSolve()
            end
        end
    }
    CtrlTab:CreateSlider{
        Name="Auto Flag Range",
        Range={
            5,
            120
        },
        Increment=5,
        Suffix=" studs",
        CurrentValue=SOLVER_CFG.AutoFlagRange,
        Flag="AerisAutoFlagRangeSlider",
        Callback=function(val)
            local n=tonumber(val)
            if n then
                SOLVER_CFG.AutoFlagRange=n
            end
        end
    }
    CtrlTab:CreateSlider{
        Name="Auto Flag Cooldown",
        Range={
            0.05,
            0.5
        },
        Increment=0.01,
        Suffix="s",
        CurrentValue=SOLVER_CFG.AutoFlagCooldown,
        Flag="AerisAutoFlagCooldownSlider",
        Callback=function(val)
            local n=tonumber(val)
            if n then
                SOLVER_CFG.AutoFlagCooldown=n
            end
        end
    }
    CtrlTab:CreateSection"Board Settings"
    CtrlTab:CreateToggle{
        Name="Trust Placed Flags",
        CurrentValue=SOLVER_CFG.TrustFlags,
        Flag="AerisTrustFlags",
        Callback=function(val)
            SOLVER_CFG.TrustFlags=val
            if QueueSolve then
                QueueSolve()
            end
        end
    }
    CtrlTab:CreateButton{
        Name="Force Recalculate Board",
        Callback=function()
            if QueueSolve then
                QueueSolve()
            end
        end
    }
    CtrlTab:CreateButton{
        Name="Emergency Clear All ESP",
        Callback=function()
            SOLVER_CFG.Enabled=false
            SOLVER_CFG.AutoReveal=false
            SOLVER_CFG.AutoFlag=false
            if ClearAll then
                ClearAll()
            end
        end
    }
end
local function StartMinesweeperCore()
    local FlagFolder=workspace:WaitForChild"Flag"
    local Parts=FlagFolder:WaitForChild"Parts"
    local Info=RS:WaitForChild"Info"
    local GameRunning=Info:WaitForChild"GameRunning"
    local MinesVal=Info:FindFirstChild"Mines"
    local FlagsRoot=RS:WaitForChild"Flags"
    local function ReadSettings()
        local s=Info:FindFirstChild"Settings"
        local gx=s and(s:GetAttribute"GridSizeX"or s:GetAttribute"GridSize")
        local gz=s and s:GetAttribute"GridSizeZ"or gx
        local ts=(s and s:GetAttribute"TileSize")or 4
        if typeof(gx)=="Vector2"then
            gx,gz=gx.X,gx.Y
        elseif typeof(gx)=="Vector3"then
            gx,gz=gx.X,gx.Z
        end
        return gx,gz,ts,s
    end
    local GridW,GridH,TileStep,SettingsObj=ReadSettings()
    local TotalTiles=GridW and GridH and GridW*GridH or nil
    local TotalMines=MinesVal and MinesVal.Value or 0
    local VizFolder=Instance.new"Folder"
    VizFolder.Name="Aeris_Solverstone"
    VizFolder.Parent=workspace
    local function ProbColor(p)
        return p<0.5 and COLOR.ProbLow:Lerp(COLOR.Prob50,p*2)or COLOR.Prob50:Lerp(Color3 .fromRGB(255,110,0),(p-0.5)*2)
    end
    local function RGBKey(c)
        return math.round(c.R*255)*65536+math.round(c.G*255)*256+math.round(c.B*255)
    end
    local function MakeKey(r,g,b)
        return r*65536+g*256+b
    end
    local GREEN_KEYS={
        [MakeKey(117,205,100)]=true,
        [MakeKey(103,180,88)]=true
    }
    local BEIGE_KEYS={
        [MakeKey(255,255,125)]=true,
        [MakeKey(230,230,113)]=true
    }
    local Pool={}
    local Overlays={}
    local DrawKey={}
    local function PoolAcquire(tile)
        local vp=table.remove(Pool)or(function()
            local p=Instance.new"Part"
            p.Name="AerisViz"
            p.CastShadow=false
            p.Material=Enum.Material.Neon
            p.CanCollide=false
            p.CanQuery=false
            p.CanTouch=false
            p.Anchored=true
            local sg=Instance.new"SurfaceGui"
            sg.Name="SurfaceGui"
            sg.Face=Enum.NormalId.Top
            sg.SizingMode=Enum.SurfaceGuiSizingMode.PixelsPerStud
            sg.PixelsPerStud=25
            sg.Active=false
            sg.Parent=p
            local lb=Instance.new"TextLabel"
            lb.Name="Label"
            lb.BackgroundTransparency=1
            lb.BorderSizePixel=0
            lb.Size=UDim2 .new(1,0,1,0)
            lb.AnchorPoint=Vector2 .new(0.5,0.5)
            lb.Position=UDim2 .new(0.5,0,0.5,0)
            lb.Font=Enum.Font.SourceSansBold
            lb.TextColor3=Color3 .new(0,0,0)
            lb.TextSize=70
            lb.TextStrokeTransparency=0.6
            lb.Active=false
            lb.Parent=sg
            return p
        end)()
        vp.Size=tile.Size*0.8
        vp.Position=tile.Position+Vector3 .new(0,1.5,0)
        vp.Parent=VizFolder
        return vp
    end
    local function PoolRelease(vp)
        vp.Parent=nil
        table.insert(Pool,vp)
    end
    Draw=function(tile,col,text,hidden)
        if not SOLVER_CFG.Enabled or not GameRunning.Value then
            return
        end
        local key=RGBKey(col)*4+(hidden and 2 or 0)+(text~=""and 1 or 0)
        if DrawKey[tile]==key then
            return
        end
        DrawKey[tile]=key
        local vp=Overlays[tile]or PoolAcquire(tile)
        Overlays[tile]=vp
        vp.Color=col
        vp.Transparency=hidden and 1 or 0.3
        local lb=vp.SurfaceGui.Label
        lb.Text=text
        lb.TextTransparency=hidden and 1 or 0
    end
    Undraw=function(tile)
        local vp=Overlays[tile]
        if not vp then
            return
        end
        PoolRelease(vp)
        Overlays[tile]=nil
        DrawKey[tile]=nil
    end
    local toFlagCells={}
    local clickCooldown={}
    local targetHighlights={}
    local lastBorderPos=nil
    ClearAll=function()
        table.clear(toFlagCells)
        table.clear(clickCooldown)
        table.clear(targetHighlights)
        lastBorderPos=nil
        for tile in next,Overlays do
            Undraw(tile)
        end
        if VizFolder then
            for _,v in ipairs(VizFolder:GetChildren())do
                if v:IsA"BasePart"then
                    PoolRelease(v)
                end
            end
        end
    end
    local _candCells={}
    local _candData={}
    local _candDist={}
    local _candIdx={}
    local function _byCandDist(a,b)
        return _candDist[a]<_candDist[b]
    end
    UpdateBorders=function(hrpPos)
        if not SOLVER_CFG.Enabled or not GameRunning.Value then
            for t in next,Overlays do
                Undraw(t)
            end
            return
        end
        if not hrpPos then
            local char=LocalPlayer.Character
            local hrp=char and char:FindFirstChild"HumanoidRootPart"
            if hrp then
                hrpPos=hrp.Position
            end
        end
        local maxHL=SOLVER_CFG.MaxVisibleHL
        local rangeSq=SOLVER_CFG.HighlightRange*SOLVER_CFG.HighlightRange
        local cN=0
        for tile,info in pairs(targetHighlights)do
            if tile and tile.Parent and GREEN_KEYS[RGBKey(tile.Color)]then
                local distSq=0
                if hrpPos then
                    local dx=tile.Position.X-hrpPos.X
                    local dz=tile.Position.Z-hrpPos.Z
                    distSq=dx*dx+dz*dz
                end
                if distSq<=rangeSq then
                    cN+=1
                    _candCells[cN]=tile
                    _candData[cN]=info
                    _candDist[cN]=distSq
                else
                    if Overlays[tile]then
                        Undraw(tile)
                    end
                end
            else
                targetHighlights[tile]=nil
                if Overlays[tile]then
                    Undraw(tile)
                end
            end
        end
        for k=cN+1,#_candCells do
            _candCells[k]=nil
            _candData[k]=nil
            _candDist[k]=nil
        end
        local activeRendered={}
        if cN<=maxHL then
            for k=1,cN do
                local t=_candCells[k]
                local d=_candData[k]
                Draw(t,d.color,d.text,d.hidden)
                activeRendered[t]=true
            end
        else
            table.clear(_candIdx)
            for k=1,cN do
                _candIdx[k]=k
            end
            table.sort(_candIdx,_byCandDist)
            for rank=1,cN do
                local entry=_candIdx[rank]
                local t=_candCells[entry]
                local d=_candData[entry]
                if rank<=maxHL then
                    Draw(t,d.color,d.text,d.hidden)
                    activeRendered[t]=true
                else
                    if Overlays[t]then
                        Undraw(t)
                    end
                end
            end
        end
        for t in next,Overlays do
            if not activeRendered[t]then
                Undraw(t)
            end
        end
    end
    local function GridKey(gx,gz)
        return(gx+4096)*8192+(gz+4096)
    end
    local GridStep=nil
    local Grid={}
    local Adjacency={}
    local TileIndex={}
    local TileCount=0
    local BoundsDirty=true
    local BoardBounds=nil
    local LastSig=nil
    local OFFSETS={
        {
            -1,
            -1
        },
        {
            0,
            -1
        },
        {
            1,
            -1
        },
        {
            -1,
            0
        },
        {
            1,
            0
        },
        {
            -1,
            1
        },
        {
            0,
            1
        },
        {
            1,
            1
        }
    }
    local function TileGridPos(t)
        local step=TileStep or(GridStep and GridStep.X)
        if not step then
            return nil,nil
        end
        return math.round(t.Position.X/step),math.round(t.Position.Z/(TileStep or GridStep.Z))
    end
    local function RefreshBounds()
        BoundsDirty=false
        if GridW and GridH then
            BoardBounds={
                MinX=1,
                MinZ=1,
                W=GridW,
                H=GridH
            }
            return
        end
        local minX,minZ,maxX,maxZ=1/0,1/0,1/-0,1/-0
        for t in next,Adjacency do
            local gx,gz=TileGridPos(t)
            if gx then
                if gx<minX then
                    minX=gx
                end
                if gx>maxX then
                    maxX=gx
                end
                if gz<minZ then
                    minZ=gz
                end
                if gz>maxZ then
                    maxZ=gz
                end
            end
        end
        BoardBounds=(minX<1/0)and{
            MinX=minX,
            MinZ=minZ,
            W=maxX-minX+1,
            H=maxZ-minZ+1
        }or nil
    end
    local function HasFlag(tile)
        if not tile then
            return false
        end
        for _,c in ipairs(tile:GetChildren())do
            if c:IsA"Model"then
                return true
            end
        end
        return false
    end
    local function GetNumber(tile)
        local g=tile:FindFirstChild"NumberGui"
        local l=g and g:FindFirstChild"TextLabel"
        return(l and tonumber(l.Text))or 0
    end
    local _lastAutoFlagTime=0
    local function SendUniversalFlag(tile,hrpPos)
        if not tile or not tile.Parent or HasFlag(tile)then
            return false
        end
        local now=os.clock()
        if clickCooldown[tile]and(now-clickCooldown[tile])<1.5 then
            return false
        end
        local allowedRange=tonumber(SOLVER_CFG.AutoFlagRange)or 35
        local dist=(tile.Position-hrpPos).Magnitude
        if dist>allowedRange then
            return false
        end
        local flagged=false
        local cd=tile:FindFirstChildOfClass"ClickDetector"or tile:FindFirstChildWhichIsA("ClickDetector",true)
        if cd then
            cd.MaxActivationDistance=1/0
            local fcd=fireclickdetector or(getgenv and getgenv().fireclickdetector)
            if fcd then
                pcall(function()
                    fcd(cd,0,"RightMouseClick")
                end)
                pcall(function()
                    fcd(cd,0)
                end)
                pcall(function()
                    fcd(cd)
                end)
                flagged=true
            end
            local fs=firesignal or(getgenv and getgenv().firesignal)
            if fs then
                pcall(function()
                    fs(cd.MouseClick)
                end)
                pcall(function()
                    fs(cd.RightMouseClick)
                end)
                flagged=true
            end
            if getconnections then
                pcall(function()
                    for _,conn in ipairs(getconnections(cd.RightMouseClick))do
                        conn:Fire()
                        flagged=true
                    end
                    for _,conn in ipairs(getconnections(cd.MouseClick))do
                        conn:Fire()
                        flagged=true
                    end
                end)
            end
        end
        local cam=workspace.CurrentCamera
        if cam and VIM then
            local sp,onScreen=cam:WorldToViewportPoint(tile.Position)
            if onScreen and sp.Z>0 then
                local rayParams=RaycastParams.new()
                rayParams.FilterType=Enum.RaycastFilterType.Exclude
                rayParams.FilterDescendantsInstances={
                    LocalPlayer.Character,
                    VizFolder
                }
                local ray=workspace:Raycast(cam.CFrame.Position,tile.Position-cam.CFrame.Position,rayParams)
                if ray and(ray.Instance==tile or ray.Instance:IsDescendantOf(tile))then
                    pcall(function()
                        VIM:SendMouseButtonEvent(sp.X,sp.Y,1,true,game,1)
                        task.wait(0.01)
                        VIM:SendMouseButtonEvent(sp.X,sp.Y,1,false,game,1)
                        VIM:SendTouchEvent(1,0,sp.X,sp.Y)
                        task.wait(0.01)
                        VIM:SendTouchEvent(1,2,sp.X,sp.Y)
                    end)
                    flagged=true
                end
            end
        end
        if flagged then
            clickCooldown[tile]=now
            _lastAutoFlagTime=now
            return true
        end
        return false
    end
    local _autoRevealActive=false
    local function StompCell(hrp,tile)
        local surfaceY=tile.Position.Y+(tile.Size.Y/2)+SOLVER_CFG.RevealHoverHeight
        hrp.CFrame=CFrame.new(tile.Position.X,surfaceY,tile.Position.Z)
        hrp.AssemblyLinearVelocity=Vector3 .new(0,SOLVER_CFG.StompVelocity,0)
        task.wait(SOLVER_CFG.AutoRevealDelay)
        hrp.AssemblyLinearVelocity=Vector3 .zero
    end
    local function AutoRevealNext(safeList)
        if not SOLVER_CFG.AutoReveal or _autoRevealActive or not GameRunning.Value then
            return
        end
        local char=LocalPlayer.Character
        if not char then
            return
        end
        local hrp=char:FindFirstChild"HumanoidRootPart"
        local hum=char:FindFirstChildOfClass"Humanoid"
        if not hrp or not hum then
            return
        end
        local ordered={}
        local count=0
        local hrpPos=hrp.Position
        for _,tile in ipairs(safeList)do
            if tile and tile.Parent and GREEN_KEYS[RGBKey(tile.Color)]and not HasFlag(tile)then
                count+=1
                local dx=tile.Position.X-hrpPos.X
                local dz=tile.Position.Z-hrpPos.Z
                ordered[count]={
                    tile=tile,
                    distSq=dx*dx+dz*dz
                }
            end
        end
        if count==0 then
            return
        end
        table.sort(ordered,function(a,b)
            return a.distSq<b.distSq
        end)
        _autoRevealActive=true
        task.spawn(function()
            local ok,err=pcall(function()
                for _,entry in ipairs(ordered)do
                    if not SOLVER_CFG.AutoReveal or not GameRunning.Value then
                        break
                    end
                    if hrp.Parent==nil then
                        break
                    end
                    local t=entry.tile
                    if t and t.Parent and GREEN_KEYS[RGBKey(t.Color)]and not HasFlag(t)then
                        StompCell(hrp,t)
                    end
                end
                if hum.Parent then
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end)
            _autoRevealActive=false
            if not ok then
                warn("[Aeris] AutoReveal error: "..tostring(err))
            end
        end)
    end
    task.spawn(function()
        while true do
            task.wait(0.04)
            if GameRunning.Value then
                local char=LocalPlayer.Character
                local hrp=char and char:FindFirstChild"HumanoidRootPart"
                local hrpPos=hrp and hrp.Position
                if SOLVER_CFG.AutoFlag and hrpPos and#toFlagCells>0 then
                    local now=os.clock()
                    if now-_lastAutoFlagTime>=SOLVER_CFG.AutoFlagCooldown then
                        local curRange=tonumber(SOLVER_CFG.AutoFlagRange)or 35
                        local maxRangeSq=curRange*curRange
                        for i=#toFlagCells,1,-1 do
                            local t=toFlagCells[i]
                            if not t or not t.Parent or not GREEN_KEYS[RGBKey(t.Color)]or HasFlag(t)then
                                table.remove(toFlagCells,i)
                            else
                                local dx=t.Position.X-hrpPos.X
                                local dz=t.Position.Z-hrpPos.Z
                                local dSq=dx*dx+dz*dz
                                if dSq<=maxRangeSq then
                                    if not clickCooldown[t]or(now-clickCooldown[t])>=1.5 then
                                        local ok=SendUniversalFlag(t,hrpPos)
                                        if ok then
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if SOLVER_CFG.Enabled and hrpPos then
                    if not lastBorderPos then
                        UpdateBorders(hrpPos)
                        lastBorderPos=hrpPos
                    else
                        local dx=hrpPos.X-lastBorderPos.X
                        local dz=hrpPos.Z-lastBorderPos.Z
                        local th=SOLVER_CFG.BorderMoveThreshold
                        if(dx*dx+dz*dz)>(th*th)then
                            UpdateBorders(hrpPos)
                            lastBorderPos=hrpPos
                        end
                    end
                end
            end
        end
    end)
    local ConnColor,ConnDesc,ConnText,ConnFlag,ConnTop={},{},{},{},{}
    local Solving,Pending=false,false
    local function Solve()
        if not GameRunning.Value or not(SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal)then
            ClearAll()
            return
        end
        local hasMines=MinesVal~=nil
        local mineTotal=hasMines and MinesVal.Value or 0
        TotalMines=mineTotal
        local greenTiles={}
        local beigeSet={}
        local flagged={}
        local sig=(TileCount*2246822519+mineTotal*3266489917)%4294967291
        for t in next,Adjacency do
            local k=RGBKey(t.Color)
            if BEIGE_KEYS[k]then
                beigeSet[t]=true
                sig=(sig+(k+GetNumber(t)*97+11)*31+7)%4294967291
            elseif GREEN_KEYS[k]then
                greenTiles[#greenTiles+1]=t
                local fl=HasFlag(t)
                flagged[t]=fl
                sig=(sig+(k+(fl and 6151 or 0))*31+7)%4294967291
            else
                sig=(sig+k*31+7)%4294967291
            end
        end
        if sig==LastSig then
            return
        end
        if BoundsDirty then
            RefreshBounds()
        end
        local state={}
        for _,t in ipairs(greenTiles)do
            state[t]=0
        end
        if SOLVER_CFG.TrustFlags then
            for _,t in ipairs(greenTiles)do
                if flagged[t]then
                    state[t]=2
                end
            end
        end
        local cons,consOf,contra={},{},false
        local function BuildConstraints()
            cons,consOf,contra={},{},false
            for b in next,beigeSet do
                local n=GetNumber(b)
                if n>0 then
                    local c={
                        Set={},
                        List={},
                        Rem=n
                    }
                    for _,nb in ipairs(Adjacency[b])do
                        local s=state[nb]
                        if s==0 then
                            c.Set[nb]=true
                            c.List[#c.List+1]=nb
                            local lst=consOf[nb]
                            if not lst then
                                lst={}
                                consOf[nb]=lst
                            end
                            lst[#lst+1]=c
                        elseif s==2 then
                            c.Rem-=1
                        end
                    end
                    if#c.List>0 then
                        cons[#cons+1]=c
                    elseif c.Rem~=0 then
                        contra=true
                    end
                end
            end
        end
        local function Propagate()
            local changed=false
            for _,c in ipairs(cons)do
                local target=(c.Rem==0)and 1 or(c.Rem>=#c.List and 2 or 0)
                if target~=0 then
                    for _,t in ipairs(c.List)do
                        if state[t]==0 then
                            state[t]=target
                            changed=true
                        end
                    end
                end
            end
            return changed
        end
        local function SubsetClosure()
            local resolved=false
            for _=1,32 do
                local n,seen,newOnes,added=#cons,{},{},false
                for i=1,n do
                    local ids={}
                    for _,t in ipairs(cons[i].List)do
                        ids[#ids+1]=TileIndex[t]
                    end
                    table.sort(ids)
                    local h=0
                    for _,id in ipairs(ids)do
                        h=(h*131+id)%4294967291
                    end
                    seen[h]=true
                end
                for i=1,n do
                    local a=cons[i]
                    local cand={}
                    for _,t in ipairs(a.List)do
                        for _,b in ipairs(consOf[t]or{})do
                            if b~=a and#b.List>#a.List then
                                cand[b]=true
                            end
                        end
                    end
                    for b in next,cand do
                        local sub=true
                        for _,t in ipairs(a.List)do
                            if not b.Set[t]then
                                sub=false
                                break
                            end
                        end
                        if sub then
                            local rem=b.Rem-a.Rem
                            local diff={}
                            for _,t in ipairs(b.List)do
                                if not a.Set[t]then
                                    diff[#diff+1]=t
                                end
                            end
                            if#diff>0 then
                                if rem==0 or rem==#diff then
                                    local s=(rem==0)and 1 or 2
                                    for _,t in ipairs(diff)do
                                        if state[t]==0 then
                                            state[t]=s
                                            resolved=true
                                        end
                                    end
                                else
                                    local ids={}
                                    for _,t in ipairs(diff)do
                                        ids[#ids+1]=TileIndex[t]
                                    end
                                    table.sort(ids)
                                    local h=0
                                    for _,id in ipairs(ids)do
                                        h=(h*131+id)%4294967291
                                    end
                                    if not seen[h]then
                                        seen[h]=true
                                        local nc={
                                            Set={},
                                            List=diff,
                                            Rem=rem
                                        }
                                        for _,t in ipairs(diff)do
                                            nc.Set[t]=true
                                            local lst=consOf[t]
                                            if not lst then
                                                lst={}
                                                consOf[t]=lst
                                            end
                                            lst[#lst+1]=nc
                                        end
                                        newOnes[#newOnes+1]=nc
                                        added=true
                                    end
                                end
                            end
                        end
                    end
                end
                for _,nc in ipairs(newOnes)do
                    cons[#cons+1]=nc
                end
                if resolved or not added then
                    break
                end
            end
            return resolved
        end
        local function Deduct()
            for _=1,64 do
                BuildConstraints()
                if contra then
                    return false
                end
                for _,c in ipairs(cons)do
                    if c.Rem<0 or c.Rem>#c.List then
                        return false
                    end
                end
                local ch=Propagate()
                if SubsetClosure()then
                    ch=true
                end
                if not ch then
                    break
                end
            end
            return true
        end
        local okDeduct=Deduct()
        if not okDeduct and SOLVER_CFG.TrustFlags then
            for _,t in ipairs(greenTiles)do
                state[t]=0
            end
            Deduct()
        end
        local prob={}
        local safeTilesList={}
        table.clear(toFlagCells)
        table.clear(targetHighlights)
        for _,t in ipairs(greenTiles)do
            local s=state[t]
            local onBoundary=false
            for _,nb in ipairs(Adjacency[t])do
                if beigeSet[nb]then
                    onBoundary=true
                    break
                end
            end
            if s==2 then
                if not HasFlag(t)then
                    toFlagCells[#toFlagCells+1]=t
                end
                if onBoundary then
                    targetHighlights[t]={
                        color=COLOR.Mine,
                        text="X",
                        hidden=HasFlag(t)
                    }
                end
            elseif s==1 then
                safeTilesList[#safeTilesList+1]=t
                if onBoundary then
                    targetHighlights[t]={
                        color=COLOR.Safe,
                        text="",
                        hidden=false
                    }
                end
            elseif s==0 and onBoundary then
                local pv=prob[t]
                local col=pv and ProbColor(pv)or COLOR.Unknown
                targetHighlights[t]={
                    color=col,
                    text="?",
                    hidden=false
                }
            end
        end
        LastSig=sig
        UpdateBorders()
        if SOLVER_CFG.AutoReveal and#safeTilesList>0 then
            AutoRevealNext(safeTilesList)
        end
    end
    QueueSolve=function()
        if not GameRunning.Value or not(SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal)then
            LastSig=nil
            ClearAll()
            return
        end
        if Solving then
            Pending=true
            return
        end
        Solving=true
        task.delay(SOLVER_CFG.Debounce,function()
            Solving=false
            local ok,err=pcall(Solve)
            if not ok then
                warn("[Aeris] Solver error: "..tostring(err))
            end
            if Pending then
                Pending=false
                QueueSolve()
            end
        end)
    end
    local function HookDescendant(d)
        if d:IsA"TextLabel"and not ConnText[d]then
            ConnText[d]=d:GetPropertyChangedSignal"Text":Connect(function()
                if SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal then
                    QueueSolve()
                end
            end)
        end
        if d:IsA"ClickDetector"then
            d.MaxActivationDistance=1/0
        end
    end
    local function OnFlagEvent(child)
        if child:IsA"Model"then
            if SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal then
                QueueSolve()
            end
        end
    end
    local function RegisterTile(tile,skipQueue)
        if not tile:IsA"BasePart"or Adjacency[tile]then
            return
        end
        Adjacency[tile]={}
        TileCount+=1
        TileIndex[tile]=TileCount
        local gx,gz
        if TileStep then
            gx=math.round(tile.Position.X/TileStep)
            gz=math.round(tile.Position.Z/TileStep)
        else
            if not GridStep then
                GridStep={
                    X=tile.Size.X,
                    Z=tile.Size.Z
                }
            end
            gx=math.round(tile.Position.X/GridStep.X)
            gz=math.round(tile.Position.Z/GridStep.Z)
        end
        for _,off in ipairs(OFFSETS)do
            local neighbor=Grid[GridKey(gx+off[1],gz+off[2])]
            if neighbor then
                local an=Adjacency[neighbor]
                Adjacency[tile][#Adjacency[tile]+1]=neighbor
                an[#an+1]=tile
            end
        end
        Grid[GridKey(gx,gz)]=tile
        BoundsDirty=true
        local cd=tile:FindFirstChildWhichIsA("ClickDetector",true)
        if cd then
            cd.MaxActivationDistance=1/0
        end
        ConnColor[tile]=tile:GetPropertyChangedSignal"Color":Connect(function()
            if SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal then
                QueueSolve()
            end
        end)
        for _,d in ipairs(tile:GetDescendants())do
            HookDescendant(d)
        end
        ConnDesc[tile]=tile.DescendantAdded:Connect(HookDescendant)
        ConnFlag[tile]={
            tile.ChildAdded:Connect(OnFlagEvent),
            tile.ChildRemoved:Connect(OnFlagEvent)
        }
        if not skipQueue and(SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal)then
            QueueSolve()
        end
    end
    local function SwapRemove(tbl,target)
        for i,v in ipairs(tbl)do
            if v==target then
                tbl[i]=tbl[#tbl]
                tbl[#tbl]=nil
                return
            end
        end
    end
    local function UnregisterTile(tile)
        Undraw(tile)
        targetHighlights[tile]=nil
        if ConnColor[tile]then
            ConnColor[tile]:Disconnect()
            ConnColor[tile]=nil
        end
        if ConnDesc[tile]then
            ConnDesc[tile]:Disconnect()
            ConnDesc[tile]=nil
        end
        if ConnFlag[tile]then
            for _,c in ipairs(ConnFlag[tile])do
                c:Disconnect()
            end
            ConnFlag[tile]=nil
        end
        if Adjacency[tile]then
            for _,nb in ipairs(Adjacency[tile])do
                if Adjacency[nb]then
                    SwapRemove(Adjacency[nb],tile)
                end
            end
            Adjacency[tile]=nil
        end
        TileIndex[tile]=nil
        TileCount-=1
        BoundsDirty=true
    end
    local function Setup()
        Adjacency,TileIndex,Grid={},{},{}
        TileCount,LastSig,BoardBounds,BoundsDirty=0,nil,nil,true
        GridW,GridH,TileStep,SettingsObj=ReadSettings()
        TotalTiles=GridW and GridH and GridW*GridH or nil
        if MinesVal then
            TotalMines=MinesVal.Value
        end
        ClearAll()
        for _,t in ipairs(Parts:GetChildren())do
            RegisterTile(t,true)
        end
        if SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal then
            QueueSolve()
        end
    end
    ConnTop[#ConnTop+1]=Parts.ChildAdded:Connect(function(c)
        RegisterTile(c,false)
    end)
    ConnTop[#ConnTop+1]=Parts.ChildRemoved:Connect(UnregisterTile)
    ConnTop[#ConnTop+1]=GameRunning:GetPropertyChangedSignal"Value":Connect(function()
        if GameRunning.Value then
            Setup()
        else
            LastSig=nil
            ClearAll()
        end
    end)
    if MinesVal then
        ConnTop[#ConnTop+1]=MinesVal:GetPropertyChangedSignal"Value":Connect(function()
            if SOLVER_CFG.Enabled or SOLVER_CFG.AutoFlag or SOLVER_CFG.AutoReveal then
                QueueSolve()
            end
        end)
    end
    if GameRunning.Value then
        Setup()
    end
end
local function BootEngine()
    InitializeRayfieldUI()
    StartMinesweeperCore()
end
if IsKeySavedAndValid()then
    ShowSplashScreen(BootEngine)
else
    CreateKeyPrompt(BootEngine)
end