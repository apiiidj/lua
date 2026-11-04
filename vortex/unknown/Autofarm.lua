

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "N2U2XN"
getgenv().scriptidentifier = "Autofarm"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/N2U2XN/ws-loader"))()
local _x1ixkbtlc5fad1d21ixkbwk, _z1ixkbtmc5fad1d31ixkbwn = pcall(function()
  local _1ixkbs0c5fad1991ixkbrt = "https://secure.pandauth.com/pv4/lib"
  local __1ixkbs1c5fad19a1ixkbrw = "zenith"
  local _x1ixkbs2c5fad19b1ixkbrz = true
  local _z1ixkbs3c5fad19c1ixkbs2 = false
  local function _m1ixkbs4c5fad19d1ixkbs5(_1ixkbs5c5fad19e1ixkbs8)
    do
      local _x1ixkbs7c5fad1a01ixkbse = 1
      _x1ixkbs7c5fad1a01ixkbse = (_x1ixkbs7c5fad1a01ixkbse + 0)
      if _z1ixkbs3c5fad19c1ixkbs2 then
        do
          local __1ixkbs6c5fad19f1ixkbsb = 1
          __1ixkbs6c5fad19f1ixkbsb = (__1ixkbs6c5fad19f1ixkbsb + 0)
          warn(("[Zenith] gate: " .. _1ixkbs5c5fad19e1ixkbs8))
        end
      end
    end
  end
  do
    local _z1ixkbs8c5fad1a11ixkbsh = 1
    _z1ixkbs8c5fad1a11ixkbsh = (_z1ixkbs8c5fad1a11ixkbsh + 0)
    _m1ixkbs4c5fad19d1ixkbs5("start")
  end
  local _m1ixkbs9c5fad1a21ixkbsk = (getgenv and getgenv().ZenKey)
  do
    local _z1ixkbsic5fad1ab1ixkbtb = 1
    _z1ixkbsic5fad1ab1ixkbtb = (_z1ixkbsic5fad1ab1ixkbtb + 0)
    if ((type(_m1ixkbs9c5fad1a21ixkbsk) ~= "string") or (_m1ixkbs9c5fad1a21ixkbsk == "")) then
      local _1ixkbsac5fad1a31ixkbsn, __1ixkbsbc5fad1a41ixkbsq = pcall(readfile, "loader")
      do
        local __1ixkbsgc5fad1a91ixkbt5 = 1
        __1ixkbsgc5fad1a91ixkbt5 = (__1ixkbsgc5fad1a91ixkbt5 + 0)
        if ((_1ixkbsac5fad1a31ixkbsn and (type(__1ixkbsbc5fad1a41ixkbsq) == "string")) and (#__1ixkbsbc5fad1a41ixkbsq > 0)) then
          local _x1ixkbscc5fad1a51ixkbst = loadstring(__1ixkbsbc5fad1a41ixkbsq, "loader")
          do
            local _1ixkbsfc5fad1a81ixkbt2 = 1
            _1ixkbsfc5fad1a81ixkbt2 = (_1ixkbsfc5fad1a81ixkbt2 + 0)
            if _x1ixkbscc5fad1a51ixkbst then
              do
                local _z1ixkbsdc5fad1a61ixkbsw = 1
                _z1ixkbsdc5fad1a61ixkbsw = (_z1ixkbsdc5fad1a61ixkbsw + 0)
                warn("[Zenith] No key yet - opening the loader.")
              end
              do
                local _m1ixkbsec5fad1a71ixkbsz = 1
                _m1ixkbsec5fad1a71ixkbsz = (_m1ixkbsec5fad1a71ixkbsz + 0)
                _x1ixkbscc5fad1a51ixkbst()
              end
              return false
            end
          end
        end
      end
      do
        local _x1ixkbshc5fad1aa1ixkbt8 = 1
        _x1ixkbshc5fad1aa1ixkbt8 = (_x1ixkbshc5fad1aa1ixkbt8 + 0)
        warn("[Zenith] No key, and the loader is missing. Expected \"loader\" in your workspace.")
      end
      return false
    end
  end
  local _m1ixkbsjc5fad1ac1ixkbte = (getgenv and getgenv().ZenAuth)
  do
    local _z1ixkbthc5fad1ce1ixkbw8 = 1
    _z1ixkbthc5fad1ce1ixkbw8 = (_z1ixkbthc5fad1ce1ixkbw8 + 0)
    if ((type(_m1ixkbsjc5fad1ac1ixkbte) == "table") and _m1ixkbsjc5fad1ac1ixkbte.ok) then
      do
        local _1ixkbskc5fad1ad1ixkbth = 1
        _1ixkbskc5fad1ad1ixkbth = (_1ixkbskc5fad1ad1ixkbth + 0)
        _m1ixkbs4c5fad19d1ixkbs5(("using the loader's result, premium=" .. tostring(_m1ixkbsjc5fad1ac1ixkbte.premium)))
      end
    else
      do
        local __1ixkbslc5fad1ae1ixkbtk = 1
        __1ixkbslc5fad1ae1ixkbtk = (__1ixkbslc5fad1ae1ixkbtk + 0)
        _m1ixkbs4c5fad19d1ixkbs5("no stored result - validating")
      end
      local _x1ixkbsmc5fad1af1ixkbtn = (getgenv and getgenv().ZenPanda)
      do
        local _x1ixkbt1c5fad1be1ixkbuw = 1
        _x1ixkbt1c5fad1be1ixkbuw = (_x1ixkbt1c5fad1be1ixkbuw + 0)
        if ((type(_x1ixkbsmc5fad1af1ixkbtn) ~= "table") or (type(_x1ixkbsmc5fad1af1ixkbtn.validate) ~= "function")) then
          do
            local _z1ixkbsnc5fad1b01ixkbtq = 1
            _z1ixkbsnc5fad1b01ixkbtq = (_z1ixkbsnc5fad1b01ixkbtq + 0)
            _m1ixkbs4c5fad19d1ixkbs5("fetching the Panda library")
          end
          local _m1ixkbsoc5fad1b11ixkbtt, _1ixkbspc5fad1b21ixkbtw = pcall(function()
            return loadstring(game:HttpGet(_1ixkbs0c5fad1991ixkbrt))()
          end)
          do
            local _x1ixkbsrc5fad1b41ixkbu2 = 1
            _x1ixkbsrc5fad1b41ixkbu2 = (_x1ixkbsrc5fad1b41ixkbu2 + 0)
            if ((not _m1ixkbsoc5fad1b11ixkbtt or (type(_1ixkbspc5fad1b21ixkbtw) ~= "table")) or (type(_1ixkbspc5fad1b21ixkbtw.configure) ~= "function")) then
              do
                local __1ixkbsqc5fad1b31ixkbtz = 1
                __1ixkbsqc5fad1b31ixkbtz = (__1ixkbsqc5fad1b31ixkbtz + 0)
                warn(("[Zenith] Panda unreachable, continuing: " .. tostring(_1ixkbspc5fad1b21ixkbtw):sub(1, 120)))
              end
              return true
            end
          end
          local _m1ixkbstc5fad1b61ixkbu8, _1ixkbsuc5fad1b71ixkbub = pcall(function()
            do
              local _z1ixkbssc5fad1b51ixkbu5 = 1
              _z1ixkbssc5fad1b51ixkbu5 = (_z1ixkbssc5fad1b51ixkbu5 + 0)
              _1ixkbspc5fad1b21ixkbtw.configure({serviceId = __1ixkbs1c5fad19a1ixkbrw})
            end
          end)
          do
            local __1ixkbsvc5fad1b81ixkbue = 1
            __1ixkbsvc5fad1b81ixkbue = (__1ixkbsvc5fad1b81ixkbue + 0)
            _m1ixkbs4c5fad19d1ixkbs5(("configure(" .. (__1ixkbs1c5fad19a1ixkbrw .. (") ok=" .. (tostring(_m1ixkbstc5fad1b61ixkbu8) .. (((_m1ixkbstc5fad1b61ixkbu8 and "") or ((" err=" .. tostring(_1ixkbsuc5fad1b71ixkbub):sub(1, 100))))))))))
          end
          do
            local _x1ixkbswc5fad1b91ixkbuh = 1
            _x1ixkbswc5fad1b91ixkbuh = (_x1ixkbswc5fad1b91ixkbuh + 0)
            _x1ixkbsmc5fad1af1ixkbtn = _1ixkbspc5fad1b21ixkbtw
          end
          do
            local _1ixkbszc5fad1bc1ixkbuq = 1
            _1ixkbszc5fad1bc1ixkbuq = (_1ixkbszc5fad1bc1ixkbuq + 0)
            if getgenv then
              do
                local _m1ixkbsyc5fad1bb1ixkbun = 1
                _m1ixkbsyc5fad1bb1ixkbun = (_m1ixkbsyc5fad1bb1ixkbun + 0)
                pcall(function()
                  do
                    local _z1ixkbsxc5fad1ba1ixkbuk = 1
                    _z1ixkbsxc5fad1ba1ixkbuk = (_z1ixkbsxc5fad1ba1ixkbuk + 0)
                    getgenv().ZenPanda = _x1ixkbsmc5fad1af1ixkbtn
                  end
                end)
              end
            end
          end
        else
          do
            local __1ixkbt0c5fad1bd1ixkbut = 1
            __1ixkbt0c5fad1bd1ixkbut = (__1ixkbt0c5fad1bd1ixkbut + 0)
            _m1ixkbs4c5fad19d1ixkbs5("reusing the loader's library instance")
          end
        end
      end
      local _z1ixkbt2c5fad1bf1ixkbuz, _m1ixkbt3c5fad1c01ixkbv2 = pcall(_x1ixkbsmc5fad1af1ixkbtn.validate, _m1ixkbs9c5fad1a21ixkbsk)
      do
        local _1ixkbt4c5fad1c11ixkbv5 = 1
        _1ixkbt4c5fad1c11ixkbv5 = (_1ixkbt4c5fad1c11ixkbv5 + 0)
        _m1ixkbs4c5fad19d1ixkbs5(("validate returned ok=" .. (tostring(_z1ixkbt2c5fad1bf1ixkbuz) .. (" type=" .. typeof(_m1ixkbt3c5fad1c01ixkbv2)))))
      end
      do
        local _x1ixkbt6c5fad1c31ixkbvb = 1
        _x1ixkbt6c5fad1c31ixkbvb = (_x1ixkbt6c5fad1c31ixkbvb + 0)
        if not _z1ixkbt2c5fad1bf1ixkbuz then
          do
            local __1ixkbt5c5fad1c21ixkbv8 = 1
            __1ixkbt5c5fad1c21ixkbv8 = (__1ixkbt5c5fad1c21ixkbv8 + 0)
            warn(("[Zenith] validate errored, continuing: " .. tostring(_m1ixkbt3c5fad1c01ixkbv2):sub(1, 120)))
          end
          return true
        end
      end
      do
        local _x1ixkbtbc5fad1c81ixkbvq = 1
        _x1ixkbtbc5fad1c81ixkbvq = (_x1ixkbtbc5fad1c81ixkbvq + 0)
        if ((type(_m1ixkbt3c5fad1c01ixkbv2) ~= "table") or not _m1ixkbt3c5fad1c01ixkbv2.success) then
          local _z1ixkbt7c5fad1c41ixkbve = (((type(_m1ixkbt3c5fad1c01ixkbv2) == "table") and tostring(((_m1ixkbt3c5fad1c01ixkbv2.error or _m1ixkbt3c5fad1c01ixkbv2.reason) or "?"))) or tostring(_m1ixkbt3c5fad1c01ixkbv2):sub(1, 120))
          local _m1ixkbt8c5fad1c51ixkbvh, _1ixkbt9c5fad1c61ixkbvk = pcall(_x1ixkbsmc5fad1af1ixkbtn.getKeyUrl)
          do
            local __1ixkbtac5fad1c71ixkbvn = 1
            __1ixkbtac5fad1c71ixkbvn = (__1ixkbtac5fad1c71ixkbvn + 0)
            warn(("[Zenith] Key rejected (" .. (_z1ixkbt7c5fad1c41ixkbve .. ("). Get one: " .. (((_m1ixkbt8c5fad1c51ixkbvh and tostring(_1ixkbt9c5fad1c61ixkbvk)) or "?"))))))
          end
          return false
        end
      end
      do
        local _z1ixkbtcc5fad1c91ixkbvt = 1
        _z1ixkbtcc5fad1c91ixkbvt = (_z1ixkbtcc5fad1c91ixkbvt + 0)
        _m1ixkbsjc5fad1ac1ixkbte = {ok = true, premium = ((_m1ixkbt3c5fad1c01ixkbv2.isPremium and true) or false)}
      end
      do
        local __1ixkbtfc5fad1cc1ixkbw2 = 1
        __1ixkbtfc5fad1cc1ixkbw2 = (__1ixkbtfc5fad1cc1ixkbw2 + 0)
        if getgenv then
          do
            local _1ixkbtec5fad1cb1ixkbvz = 1
            _1ixkbtec5fad1cb1ixkbvz = (_1ixkbtec5fad1cb1ixkbvz + 0)
            pcall(function()
              do
                local _m1ixkbtdc5fad1ca1ixkbvw = 1
                _m1ixkbtdc5fad1ca1ixkbvw = (_m1ixkbtdc5fad1ca1ixkbvw + 0)
                getgenv().ZenAuth = _m1ixkbsjc5fad1ac1ixkbte
              end
            end)
          end
        end
      end
      do
        local _x1ixkbtgc5fad1cd1ixkbw5 = 1
        _x1ixkbtgc5fad1cd1ixkbw5 = (_x1ixkbtgc5fad1cd1ixkbw5 + 0)
        _m1ixkbs4c5fad19d1ixkbs5(("validated, premium=" .. tostring(_m1ixkbsjc5fad1ac1ixkbte.premium)))
      end
    end
  end
  do
    local _1ixkbtjc5fad1d01ixkbwe = 1
    _1ixkbtjc5fad1d01ixkbwe = (_1ixkbtjc5fad1d01ixkbwe + 0)
    if (_x1ixkbs2c5fad19b1ixkbrz and not _m1ixkbsjc5fad1ac1ixkbte.premium) then
      do
        local _m1ixkbtic5fad1cf1ixkbwb = 1
        _m1ixkbtic5fad1cf1ixkbwb = (_m1ixkbtic5fad1cf1ixkbwb + 0)
        warn("[Zenith] That key is not premium.")
      end
      return false
    end
  end
  do
    local __1ixkbtkc5fad1d11ixkbwh = 1
    __1ixkbtkc5fad1d11ixkbwh = (__1ixkbtkc5fad1d11ixkbwh + 0)
    _m1ixkbs4c5fad19d1ixkbs5("passed - loading the farm")
  end
  return true
end)
do
  local _1ixkbtoc5fad1d51ixkbwt = 1
  _1ixkbtoc5fad1d51ixkbwt = (_1ixkbtoc5fad1d51ixkbwt + 0)
  if not _x1ixkbtlc5fad1d21ixkbwk then
    do
      local _m1ixkbtnc5fad1d41ixkbwq = 1
      _m1ixkbtnc5fad1d41ixkbwq = (_m1ixkbtnc5fad1d41ixkbwq + 0)
      warn(("[Zenith] auth gate crashed, loading anyway: " .. tostring(_z1ixkbtmc5fad1d31ixkbwn):sub(1, 160)))
    end
  elseif (_z1ixkbtmc5fad1d31ixkbwn == false) then
    return
  end
end
local Players = game:GetService("Players")
local __1ixkbtpc5fad1d61ixkbww = game:GetService("RunService")
local _x1ixkbtqc5fad1d71ixkbwz = game:GetService("Workspace")
local _z1ixkbtrc5fad1d81ixkbx2 = game:GetService("ReplicatedStorage")
local _m1ixkbtsc5fad1d91ixkbx5 = game:GetService("CollectionService")
local _1ixkbttc5fad1da1ixkbx8 = game:GetService("PathfindingService")
local __1ixkbtuc5fad1db1ixkbxb = game:GetService("VirtualInputManager")
local _x1ixkbtvc5fad1dc1ixkbxe = Players.LocalPlayer
do
  local __1ixkbtzc5fad1e01ixkbxq = 1
  __1ixkbtzc5fad1e01ixkbxq = (__1ixkbtzc5fad1e01ixkbxq + 0)
  if getgenv then
    local _z1ixkbtwc5fad1dd1ixkbxh = getgenv().ZenP12FarmUnload
    do
      local _1ixkbtyc5fad1df1ixkbxn = 1
      _1ixkbtyc5fad1df1ixkbxn = (_1ixkbtyc5fad1df1ixkbxn + 0)
      if (type(_z1ixkbtwc5fad1dd1ixkbxh) == "function") then
        do
          local _m1ixkbtxc5fad1de1ixkbxk = 1
          _m1ixkbtxc5fad1de1ixkbxk = (_m1ixkbtxc5fad1de1ixkbxk + 0)
          pcall(_z1ixkbtwc5fad1dd1ixkbxh)
        end
      end
    end
  end
end
local _x1ixkbu0c5fad1e11ixkbxt = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.Items.InventoryClient)
local _z1ixkbu1c5fad1e21ixkbxw = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.Jobs.DeliveryRoll)
local _m1ixkbu2c5fad1e31ixkbxz = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.UI.InteractUI)
local _1ixkbu3c5fad1e41ixkby2 = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.VehicleSystem.VehicleParts.VehicleSeat)
local __1ixkbu4c5fad1e51ixkby5 = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.VehicleSystem.VehicleUnits)
local _x1ixkbu5c5fad1e61ixkby8 = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.VehicleSystem.VehicleClient)
local _z1ixkbu6c5fad1e71ixkbyb = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.Character.MoveSpeed)
local function _m1ixkbu7c5fad1e81ixkbye()
  return _x1ixkbtvc5fad1dc1ixkbxe.Character
end
local function _1ixkbu8c5fad1e91ixkbyh()
  local __1ixkbu9c5fad1ea1ixkbyk = _m1ixkbu7c5fad1e81ixkbye()
  return (__1ixkbu9c5fad1ea1ixkbyk and __1ixkbu9c5fad1ea1ixkbyk:FindFirstChild("HumanoidRootPart"))
end
local function _x1ixkbuac5fad1eb1ixkbyn()
  local _z1ixkbubc5fad1ec1ixkbyq = _m1ixkbu7c5fad1e81ixkbye()
  return (_z1ixkbubc5fad1ec1ixkbyq and _z1ixkbubc5fad1ec1ixkbyq:FindFirstChildOfClass("Humanoid"))
end
local function _m1ixkbucc5fad1ed1ixkbyt(_1ixkbudc5fad1ee1ixkbyw, __1ixkbuec5fad1ef1ixkbyz)
  return ((Vector3.new(_1ixkbudc5fad1ee1ixkbyw.X, 0, _1ixkbudc5fad1ee1ixkbyw.Z) - Vector3.new(__1ixkbuec5fad1ef1ixkbyz.X, 0, __1ixkbuec5fad1ef1ixkbyz.Z))).Magnitude
end
local _x1ixkbufc5fad1f01ixkbz2 = {on = false, note = "off", done = 0, running = false, busy = false, wps = {}, wpi = 1, goal = nil, lastPath = 0, stuckFor = 0, stage = ""}
local _z1ixkbugc5fad1f11ixkbz5 = {}
local function _m1ixkbuhc5fad1f21ixkbz8(_1ixkbuic5fad1f31ixkbzb, __1ixkbujc5fad1f41ixkbze)
  do
    local _x1ixkbukc5fad1f51ixkbzh = 1
    _x1ixkbukc5fad1f51ixkbzh = (_x1ixkbukc5fad1f51ixkbzh + 0)
    __1ixkbujc5fad1f41ixkbze = ((__1ixkbujc5fad1f41ixkbze and true) or false)
  end
  do
    local _z1ixkbulc5fad1f61ixkbzk = 1
    _z1ixkbulc5fad1f61ixkbzk = (_z1ixkbulc5fad1f61ixkbzk + 0)
    if (_z1ixkbugc5fad1f11ixkbz5[_1ixkbuic5fad1f31ixkbzb] == __1ixkbujc5fad1f41ixkbze) then
      return
    end
  end
  do
    local _m1ixkbumc5fad1f71ixkbzn = 1
    _m1ixkbumc5fad1f71ixkbzn = (_m1ixkbumc5fad1f71ixkbzn + 0)
    _z1ixkbugc5fad1f11ixkbz5[_1ixkbuic5fad1f31ixkbzb] = __1ixkbujc5fad1f41ixkbze
  end
  do
    local __1ixkbuoc5fad1f91ixkbzt = 1
    __1ixkbuoc5fad1f91ixkbzt = (__1ixkbuoc5fad1f91ixkbzt + 0)
    pcall(function()
      do
        local _1ixkbunc5fad1f81ixkbzq = 1
        _1ixkbunc5fad1f81ixkbzq = (_1ixkbunc5fad1f81ixkbzq + 0)
        __1ixkbtuc5fad1db1ixkbxb:SendKeyEvent(__1ixkbujc5fad1f41ixkbze, _1ixkbuic5fad1f31ixkbzb, false, game)
      end
    end)
  end
end
local function _x1ixkbupc5fad1fa1ixkbzw()
  do
    local _m1ixkbuwc5fad2011ixkc0h = 1
    _m1ixkbuwc5fad2011ixkc0h = (_m1ixkbuwc5fad2011ixkc0h + 0)
    for _z1ixkbuqc5fad1fb1ixkbzz, _m1ixkburc5fad1fc1ixkc02 in pairs(_z1ixkbugc5fad1f11ixkbz5) do
      do
        local _z1ixkbuvc5fad2001ixkc0e = 1
        _z1ixkbuvc5fad2001ixkc0e = (_z1ixkbuvc5fad2001ixkc0e + 0)
        if _m1ixkburc5fad1fc1ixkc02 then
          do
            local _1ixkbusc5fad1fd1ixkc05 = 1
            _1ixkbusc5fad1fd1ixkc05 = (_1ixkbusc5fad1fd1ixkc05 + 0)
            _z1ixkbugc5fad1f11ixkbz5[_z1ixkbuqc5fad1fb1ixkbzz] = false
          end
          do
            local _x1ixkbuuc5fad1ff1ixkc0b = 1
            _x1ixkbuuc5fad1ff1ixkc0b = (_x1ixkbuuc5fad1ff1ixkc0b + 0)
            pcall(function()
              do
                local __1ixkbutc5fad1fe1ixkc08 = 1
                __1ixkbutc5fad1fe1ixkc08 = (__1ixkbutc5fad1fe1ixkc08 + 0)
                __1ixkbtuc5fad1db1ixkbxb:SendKeyEvent(false, _z1ixkbuqc5fad1fb1ixkbzz, false, game)
              end
            end)
          end
        end
      end
    end
  end
end
local function _1ixkbuxc5fad2021ixkc0k(__1ixkbuyc5fad2031ixkc0n, _x1ixkbuzc5fad2041ixkc0q)
  do
    local _z1ixkbv0c5fad2051ixkc0t = 1
    _z1ixkbv0c5fad2051ixkc0t = (_z1ixkbv0c5fad2051ixkc0t + 0)
    if (_x1ixkbuzc5fad2041ixkc0q == nil) then
      return true
    end
  end
  local _m1ixkbv1c5fad2061ixkc0w = (((type(_x1ixkbuzc5fad2041ixkc0q) == "table") and _x1ixkbuzc5fad2041ixkc0q) or {_x1ixkbuzc5fad2041ixkc0q})
  do
    local _z1ixkbv5c5fad20a1ixkc18 = 1
    _z1ixkbv5c5fad20a1ixkc18 = (_z1ixkbv5c5fad20a1ixkc18 + 0)
    for _1ixkbv2c5fad2071ixkc0z, __1ixkbv3c5fad2081ixkc12 in ipairs(_m1ixkbv1c5fad2061ixkc0w) do
      do
        local _x1ixkbv4c5fad2091ixkc15 = 1
        _x1ixkbv4c5fad2091ixkc15 = (_x1ixkbv4c5fad2091ixkc15 + 0)
        if __1ixkbuyc5fad2031ixkc0n:find(__1ixkbv3c5fad2081ixkc12, 1, true) then
          return true
        end
      end
    end
  end
  return false
end
local function _m1ixkbv6c5fad20b1ixkc1b(_1ixkbv7c5fad20c1ixkc1e, __1ixkbv8c5fad20d1ixkc1h, _x1ixkbv9c5fad20e1ixkc1k)
  local _z1ixkbvac5fad20f1ixkc1n, _m1ixkbvbc5fad2101ixkc1q = pcall(_m1ixkbu2c5fad1e31ixkbxz.get_interactive_instances)
  do
    local _1ixkbvcc5fad2111ixkc1t = 1
    _1ixkbvcc5fad2111ixkc1t = (_1ixkbvcc5fad2111ixkc1t + 0)
    if (not _z1ixkbvac5fad20f1ixkc1n or (type(_m1ixkbvbc5fad2101ixkc1q) ~= "table")) then
      return false
    end
  end
  local __1ixkbvdc5fad2121ixkc1w, _x1ixkbvec5fad2131ixkc1z, _z1ixkbvfc5fad2141ixkc22
  do
    local _m1ixkbw0c5fad2291ixkc3t = 1
    _m1ixkbw0c5fad2291ixkc3t = (_m1ixkbw0c5fad2291ixkc3t + 0)
    for _m1ixkbvgc5fad2151ixkc25, _1ixkbvhc5fad2161ixkc28 in pairs(_m1ixkbvbc5fad2101ixkc1q) do
      do
        local _z1ixkbvzc5fad2281ixkc3q = 1
        _z1ixkbvzc5fad2281ixkc3q = (_z1ixkbvzc5fad2281ixkc3q + 0)
        if ((typeof(_m1ixkbvgc5fad2151ixkc25) == "Instance") and (type(_1ixkbvhc5fad2161ixkc28) == "table")) then
          local __1ixkbvic5fad2171ixkc2b
          do
            local _x1ixkbvoc5fad21d1ixkc2t = 1
            _x1ixkbvoc5fad21d1ixkc2t = (_x1ixkbvoc5fad21d1ixkc2t + 0)
            if _m1ixkbvgc5fad2151ixkc25:IsA("Attachment") then
              do
                local _x1ixkbvjc5fad2181ixkc2e = 1
                _x1ixkbvjc5fad2181ixkc2e = (_x1ixkbvjc5fad2181ixkc2e + 0)
                __1ixkbvic5fad2171ixkc2b = _m1ixkbvgc5fad2151ixkc25.WorldPosition
              end
            elseif _m1ixkbvgc5fad2151ixkc25:IsA("BasePart") then
              do
                local _z1ixkbvkc5fad2191ixkc2h = 1
                _z1ixkbvkc5fad2191ixkc2h = (_z1ixkbvkc5fad2191ixkc2h + 0)
                __1ixkbvic5fad2171ixkc2b = _m1ixkbvgc5fad2151ixkc25.Position
              end
            elseif _m1ixkbvgc5fad2151ixkc25:IsA("Model") then
              local _m1ixkbvlc5fad21a1ixkc2k, _1ixkbvmc5fad21b1ixkc2n = pcall(function()
                return _m1ixkbvgc5fad2151ixkc25:GetPivot().Position
              end)
              do
                local __1ixkbvnc5fad21c1ixkc2q = 1
                __1ixkbvnc5fad21c1ixkc2q = (__1ixkbvnc5fad21c1ixkc2q + 0)
                __1ixkbvic5fad2171ixkc2b = ((_m1ixkbvlc5fad21a1ixkc2k and _1ixkbvmc5fad21b1ixkc2n) or nil)
              end
            end
          end
          local _z1ixkbvpc5fad21e1ixkc2w = (__1ixkbvic5fad2171ixkc2b and ((__1ixkbvic5fad2171ixkc2b - __1ixkbv8c5fad20d1ixkc1h)).Magnitude)
          do
            local _x1ixkbvyc5fad2271ixkc3n = 1
            _x1ixkbvyc5fad2271ixkc3n = (_x1ixkbvyc5fad2271ixkc3n + 0)
            if ((_z1ixkbvpc5fad21e1ixkc2w and (_z1ixkbvpc5fad21e1ixkc2w <= ((_x1ixkbv9c5fad20e1ixkc1k or 25)))) and ((not _z1ixkbvfc5fad2141ixkc22 or (_z1ixkbvpc5fad21e1ixkc2w < _z1ixkbvfc5fad2141ixkc22)))) then
              local _m1ixkbvqc5fad21f1ixkc2z, _1ixkbvrc5fad2201ixkc32 = pcall(function()
                return _1ixkbvhc5fad2161ixkc28:get_interactions()
              end)
              do
                local __1ixkbvxc5fad2261ixkc3k = 1
                __1ixkbvxc5fad2261ixkc3k = (__1ixkbvxc5fad2261ixkc3k + 0)
                if (_m1ixkbvqc5fad21f1ixkc2z and (type(_1ixkbvrc5fad2201ixkc32) == "table")) then
                  do
                    local _1ixkbvwc5fad2251ixkc3h = 1
                    _1ixkbvwc5fad2251ixkc3h = (_1ixkbvwc5fad2251ixkc3h + 0)
                    for __1ixkbvsc5fad2211ixkc35, _x1ixkbvtc5fad2221ixkc38 in pairs(_1ixkbvrc5fad2201ixkc32) do
                      do
                        local _m1ixkbvvc5fad2241ixkc3e = 1
                        _m1ixkbvvc5fad2241ixkc3e = (_m1ixkbvvc5fad2241ixkc3e + 0)
                        if (((type(_x1ixkbvtc5fad2221ixkc38) == "table") and (type(_x1ixkbvtc5fad2221ixkc38.callback) == "function")) and _1ixkbuxc5fad2021ixkc0k(tostring((_x1ixkbvtc5fad2221ixkc38.name or "")):lower(), _1ixkbv7c5fad20c1ixkc1e)) then
                          do
                            local _z1ixkbvuc5fad2231ixkc3b = 1
                            _z1ixkbvuc5fad2231ixkc3b = (_z1ixkbvuc5fad2231ixkc3b + 0)
                            __1ixkbvdc5fad2121ixkc1w, _x1ixkbvec5fad2131ixkc1z, _z1ixkbvfc5fad2141ixkc22 = _x1ixkbvtc5fad2221ixkc38, _x1ixkbvtc5fad2221ixkc38.name, _z1ixkbvpc5fad21e1ixkc2w
                          end
                          break
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  do
    local _z1ixkbw4c5fad22d1ixkc45 = 1
    _z1ixkbw4c5fad22d1ixkc45 = (_z1ixkbw4c5fad22d1ixkc45 + 0)
    if __1ixkbvdc5fad2121ixkc1w then
      do
        local _1ixkbw1c5fad22a1ixkc3w = 1
        _1ixkbw1c5fad22a1ixkc3w = (_1ixkbw1c5fad22a1ixkc3w + 0)
        task.spawn(__1ixkbvdc5fad2121ixkc1w.callback)
      end
      do
        local _x1ixkbw3c5fad22c1ixkc42 = 1
        _x1ixkbw3c5fad22c1ixkc42 = (_x1ixkbw3c5fad22c1ixkc42 + 0)
        pcall(function()
          do
            local __1ixkbw2c5fad22b1ixkc3z = 1
            __1ixkbw2c5fad22b1ixkc3z = (__1ixkbw2c5fad22b1ixkc3z + 0)
            _m1ixkbu2c5fad1e31ixkbxz.end_interaction()
          end
        end)
      end
      return true, _x1ixkbvec5fad2131ixkc1z
    end
  end
  return false
end
local function _m1ixkbw5c5fad22e1ixkc48(_1ixkbw6c5fad22f1ixkc4b)
  do
    local __1ixkbw7c5fad2301ixkc4e = 1
    __1ixkbw7c5fad2301ixkc4e = (__1ixkbw7c5fad2301ixkc4e + 0)
    if (_m1ixkbu2c5fad1e31ixkbxz.active_interaction.get() == nil) then
      return false
    end
  end
  local _x1ixkbw8c5fad2311ixkc4h, _z1ixkbw9c5fad2321ixkc4k = pcall(function()
    return _m1ixkbu2c5fad1e31ixkbxz.options.raw()
  end)
  do
    local _m1ixkbwac5fad2331ixkc4n = 1
    _m1ixkbwac5fad2331ixkc4n = (_m1ixkbwac5fad2331ixkc4n + 0)
    if (not _x1ixkbw8c5fad2311ixkc4h or (type(_z1ixkbw9c5fad2321ixkc4k) ~= "table")) then
      return false
    end
  end
  local _1ixkbwbc5fad2341ixkc4q = (((type(_1ixkbw6c5fad22f1ixkc4b) == "table") and _1ixkbw6c5fad22f1ixkc4b) or (((_1ixkbw6c5fad22f1ixkc4b and {_1ixkbw6c5fad22f1ixkc4b}) or nil)))
  do
    local __1ixkbwrc5fad2441ixkc62 = 1
    __1ixkbwrc5fad2441ixkc62 = (__1ixkbwrc5fad2441ixkc62 + 0)
    for __1ixkbwcc5fad2351ixkc4t, _x1ixkbwdc5fad2361ixkc4w in pairs(_z1ixkbw9c5fad2321ixkc4k) do
      do
        local _1ixkbwqc5fad2431ixkc5z = 1
        _1ixkbwqc5fad2431ixkc5z = (_1ixkbwqc5fad2431ixkc5z + 0)
        if ((type(_x1ixkbwdc5fad2361ixkc4w) == "table") and (type(_x1ixkbwdc5fad2361ixkc4w.callback) == "function")) then
          local _z1ixkbwec5fad2371ixkc4z = tostring((_x1ixkbwdc5fad2361ixkc4w.name or "")):lower()
          local _m1ixkbwfc5fad2381ixkc52 = ((_1ixkbwbc5fad2341ixkc4q == nil))
          do
            local _1ixkbwlc5fad23e1ixkc5k = 1
            _1ixkbwlc5fad23e1ixkc5k = (_1ixkbwlc5fad23e1ixkc5k + 0)
            if not _m1ixkbwfc5fad2381ixkc52 then
              do
                local _m1ixkbwkc5fad23d1ixkc5h = 1
                _m1ixkbwkc5fad23d1ixkc5h = (_m1ixkbwkc5fad23d1ixkc5h + 0)
                for _1ixkbwgc5fad2391ixkc55, __1ixkbwhc5fad23a1ixkc58 in ipairs(_1ixkbwbc5fad2341ixkc4q) do
                  do
                    local _z1ixkbwjc5fad23c1ixkc5e = 1
                    _z1ixkbwjc5fad23c1ixkc5e = (_z1ixkbwjc5fad23c1ixkc5e + 0)
                    if _z1ixkbwec5fad2371ixkc4z:find(__1ixkbwhc5fad23a1ixkc58, 1, true) then
                      do
                        local _x1ixkbwic5fad23b1ixkc5b = 1
                        _x1ixkbwic5fad23b1ixkc5b = (_x1ixkbwic5fad23b1ixkc5b + 0)
                        _m1ixkbwfc5fad2381ixkc52 = true
                      end
                      break
                    end
                  end
                end
              end
            end
          end
          do
            local _m1ixkbwpc5fad2421ixkc5w = 1
            _m1ixkbwpc5fad2421ixkc5w = (_m1ixkbwpc5fad2421ixkc5w + 0)
            if _m1ixkbwfc5fad2381ixkc52 then
              do
                local __1ixkbwmc5fad23f1ixkc5n = 1
                __1ixkbwmc5fad23f1ixkc5n = (__1ixkbwmc5fad23f1ixkc5n + 0)
                task.spawn(_x1ixkbwdc5fad2361ixkc4w.callback)
              end
              do
                local _z1ixkbwoc5fad2411ixkc5t = 1
                _z1ixkbwoc5fad2411ixkc5t = (_z1ixkbwoc5fad2411ixkc5t + 0)
                pcall(function()
                  do
                    local _x1ixkbwnc5fad2401ixkc5q = 1
                    _x1ixkbwnc5fad2401ixkc5q = (_x1ixkbwnc5fad2401ixkc5q + 0)
                    _m1ixkbu2c5fad1e31ixkbxz.end_interaction()
                  end
                end)
              end
              return true, _x1ixkbwdc5fad2361ixkc4w.name
            end
          end
        end
      end
    end
  end
  return false
end
local function _x1ixkbwsc5fad2451ixkc65(_z1ixkbwtc5fad2461ixkc68, _m1ixkbwuc5fad2471ixkc6b, _1ixkbwvc5fad2481ixkc6e)
  do
    local __1ixkbwwc5fad2491ixkc6h = 1
    __1ixkbwwc5fad2491ixkc6h = (__1ixkbwwc5fad2491ixkc6h + 0)
    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.E, true)
  end
  local _x1ixkbwxc5fad24a1ixkc6k, _z1ixkbwyc5fad24b1ixkc6n = false, nil
  local _m1ixkbwzc5fad24c1ixkc6q = os.clock()
  do
    local _1ixkbx5c5fad2521ixkc78 = 1
    _1ixkbx5c5fad2521ixkc78 = (_1ixkbx5c5fad2521ixkc78 + 0)
    while ((os.clock() - _m1ixkbwzc5fad24c1ixkc6q) < ((_m1ixkbwuc5fad2471ixkc6b or 2.2))) do
      local _1ixkbx0c5fad24d1ixkc6t, __1ixkbx1c5fad24e1ixkc6w = _m1ixkbw5c5fad22e1ixkc48(_z1ixkbwtc5fad2461ixkc68)
      do
        local _z1ixkbx3c5fad2501ixkc72 = 1
        _z1ixkbx3c5fad2501ixkc72 = (_z1ixkbx3c5fad2501ixkc72 + 0)
        if _1ixkbx0c5fad24d1ixkc6t then
          do
            local _x1ixkbx2c5fad24f1ixkc6z = 1
            _x1ixkbx2c5fad24f1ixkc6z = (_x1ixkbx2c5fad24f1ixkc6z + 0)
            _x1ixkbwxc5fad24a1ixkc6k, _z1ixkbwyc5fad24b1ixkc6n = true, __1ixkbx1c5fad24e1ixkc6w
          end
          break
        end
      end
      do
        local _m1ixkbx4c5fad2511ixkc75 = 1
        _m1ixkbx4c5fad2511ixkc75 = (_m1ixkbx4c5fad2511ixkc75 + 0)
        task.wait(0.06)
      end
    end
  end
  do
    local __1ixkbx6c5fad2531ixkc7b = 1
    __1ixkbx6c5fad2531ixkc7b = (__1ixkbx6c5fad2531ixkc7b + 0)
    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.E, false)
  end
  do
    local __1ixkbxbc5fad2581ixkc7q = 1
    __1ixkbxbc5fad2581ixkc7q = (__1ixkbxbc5fad2581ixkc7q + 0)
    if (not _x1ixkbwxc5fad24a1ixkc6k and _1ixkbwvc5fad2481ixkc6e) then
      local _x1ixkbx7c5fad2541ixkc7e, _z1ixkbx8c5fad2551ixkc7h = _m1ixkbv6c5fad20b1ixkc1b(_z1ixkbwtc5fad2461ixkc68, _1ixkbwvc5fad2481ixkc6e, 25)
      do
        local _1ixkbxac5fad2571ixkc7n = 1
        _1ixkbxac5fad2571ixkc7n = (_1ixkbxac5fad2571ixkc7n + 0)
        if _x1ixkbx7c5fad2541ixkc7e then
          do
            local _m1ixkbx9c5fad2561ixkc7k = 1
            _m1ixkbx9c5fad2561ixkc7k = (_m1ixkbx9c5fad2561ixkc7k + 0)
            _x1ixkbwxc5fad24a1ixkc6k, _z1ixkbwyc5fad24b1ixkc6n = true, _z1ixkbx8c5fad2551ixkc7h
          end
        end
      end
    end
  end
  do
    local _x1ixkbxcc5fad2591ixkc7t = 1
    _x1ixkbxcc5fad2591ixkc7t = (_x1ixkbxcc5fad2591ixkc7t + 0)
    task.wait(0.3)
  end
  return _x1ixkbwxc5fad24a1ixkc6k, _z1ixkbwyc5fad24b1ixkc6n
end
local _z1ixkbxdc5fad25a1ixkc7w = require(_z1ixkbtrc5fad1d81ixkbx2.Modules.Game.Character.Mechanics.RagdollHandler)
local _m1ixkbxec5fad25b1ixkc7z = {installed = false}
local _1ixkbxfc5fad25c1ixkc82, __1ixkbxgc5fad25d1ixkc85, _x1ixkbxhc5fad25e1ixkc88
local function _z1ixkbxic5fad25f1ixkc8b()
  do
    local _m1ixkbxjc5fad2601ixkc8e = 1
    _m1ixkbxjc5fad2601ixkc8e = (_m1ixkbxjc5fad2601ixkc8e + 0)
    if _m1ixkbxec5fad25b1ixkc7z.installed then
      return
    end
  end
  local _1ixkbxkc5fad2611ixkc8h, __1ixkbxlc5fad2621ixkc8k = pcall(getfenv, _z1ixkbxdc5fad25a1ixkc7w.update_mode)
  do
    local _x1ixkbxmc5fad2631ixkc8n = 1
    _x1ixkbxmc5fad2631ixkc8n = (_x1ixkbxmc5fad2631ixkc8n + 0)
    if (not _1ixkbxkc5fad2611ixkc8h or (type(__1ixkbxlc5fad2621ixkc8k) ~= "table")) then
      return
    end
  end
  local _z1ixkbxnc5fad2641ixkc8q = rawget(__1ixkbxlc5fad2621ixkc8k, "has_ragdoll_ownership")
  do
    local _m1ixkbxoc5fad2651ixkc8t = 1
    _m1ixkbxoc5fad2651ixkc8t = (_m1ixkbxoc5fad2651ixkc8t + 0)
    if (type(_z1ixkbxnc5fad2641ixkc8q) ~= "function") then
      return
    end
  end
  do
    local _1ixkbxpc5fad2661ixkc8w = 1
    _1ixkbxpc5fad2661ixkc8w = (_1ixkbxpc5fad2661ixkc8w + 0)
    _x1ixkbxhc5fad25e1ixkc88, _1ixkbxfc5fad25c1ixkc82 = __1ixkbxlc5fad2621ixkc8k, _z1ixkbxnc5fad2641ixkc8q
  end
  do
    local _1ixkbxuc5fad26b1ixkc9b = 1
    _1ixkbxuc5fad26b1ixkc9b = (_1ixkbxuc5fad26b1ixkc9b + 0)
    __1ixkbxlc5fad2621ixkc8k.has_ragdoll_ownership = function(__1ixkbxqc5fad2671ixkc8z)
      do
        local _m1ixkbxtc5fad26a1ixkc98 = 1
        _m1ixkbxtc5fad26a1ixkc98 = (_m1ixkbxtc5fad26a1ixkc98 + 0)
        if ((Toggles and Toggles.FarmAntiRagdoll) and Toggles.FarmAntiRagdoll.Value) then
          local _x1ixkbxrc5fad2681ixkc92 = (__1ixkbxqc5fad2671ixkc8z and __1ixkbxqc5fad2671ixkc8z.Parent)
          do
            local _z1ixkbxsc5fad2691ixkc95 = 1
            _z1ixkbxsc5fad2691ixkc95 = (_z1ixkbxsc5fad2691ixkc95 + 0)
            if (_x1ixkbxrc5fad2681ixkc92 and (Players:GetPlayerFromCharacter(_x1ixkbxrc5fad2681ixkc92) == _x1ixkbtvc5fad1dc1ixkbxe)) then
              return false
            end
          end
        end
      end
      return _1ixkbxfc5fad25c1ixkc82(__1ixkbxqc5fad2671ixkc8z)
    end
  end
  do
    local __1ixkbxvc5fad26c1ixkc9e = 1
    __1ixkbxvc5fad26c1ixkc9e = (__1ixkbxvc5fad26c1ixkc9e + 0)
    __1ixkbxgc5fad25d1ixkc85 = _z1ixkbxdc5fad25a1ixkc7w.update_mode
  end
  do
    local _m1ixkbxyc5fad26f1ixkc9n = 1
    _m1ixkbxyc5fad26f1ixkc9n = (_m1ixkbxyc5fad26f1ixkc9n + 0)
    _z1ixkbxdc5fad25a1ixkc7w.update_mode = function(_x1ixkbxwc5fad26d1ixkc9h, ...)
      do
        local _z1ixkbxxc5fad26e1ixkc9k = 1
        _z1ixkbxxc5fad26e1ixkc9k = (_z1ixkbxxc5fad26e1ixkc9k + 0)
        if ((((_x1ixkbxwc5fad26d1ixkc9h and (_x1ixkbxwc5fad26d1ixkc9h ~= "none")) and Toggles) and Toggles.FarmAntiRagdoll) and Toggles.FarmAntiRagdoll.Value) then
          return
        end
      end
      return __1ixkbxgc5fad25d1ixkc85(_x1ixkbxwc5fad26d1ixkc9h, ...)
    end
  end
  do
    local _1ixkbxzc5fad2701ixkc9q = 1
    _1ixkbxzc5fad2701ixkc9q = (_1ixkbxzc5fad2701ixkc9q + 0)
    _m1ixkbxec5fad25b1ixkc7z.installed = true
  end
end
local function __1ixkby0c5fad2711ixkc9t()
  local _x1ixkby1c5fad2721ixkc9w = Toggles.FarmAntiRagdoll.Value
  local _z1ixkby2c5fad2731ixkc9z = Toggles.FarmAntiTaser.Value
  do
    local _m1ixkby3c5fad2741ixkca2 = 1
    _m1ixkby3c5fad2741ixkca2 = (_m1ixkby3c5fad2741ixkca2 + 0)
    if not ((_x1ixkby1c5fad2721ixkc9w or _z1ixkby2c5fad2731ixkc9z)) then
      return
    end
  end
  local _1ixkby4c5fad2751ixkca5, __1ixkby5c5fad2761ixkca8 = _m1ixkbu7c5fad1e81ixkbye(), _x1ixkbuac5fad1eb1ixkbyn()
  do
    local _x1ixkby6c5fad2771ixkcab = 1
    _x1ixkby6c5fad2771ixkcab = (_x1ixkby6c5fad2771ixkcab + 0)
    if not ((_1ixkby4c5fad2751ixkca5 and __1ixkby5c5fad2761ixkca8)) then
      return
    end
  end
  do
    local _1ixkby9c5fad27a1ixkcak = 1
    _1ixkby9c5fad27a1ixkcak = (_1ixkby9c5fad27a1ixkcak + 0)
    if (_z1ixkby2c5fad2731ixkc9z and _1ixkby4c5fad2751ixkca5:GetAttribute("Tased")) then
      do
        local _m1ixkby8c5fad2791ixkcah = 1
        _m1ixkby8c5fad2791ixkcah = (_m1ixkby8c5fad2791ixkcah + 0)
        pcall(function()
          do
            local _z1ixkby7c5fad2781ixkcae = 1
            _z1ixkby7c5fad2781ixkcae = (_z1ixkby7c5fad2781ixkcae + 0)
            _1ixkby4c5fad2751ixkca5:SetAttribute("Tased", false)
          end
        end)
      end
    end
  end
  do
    local __1ixkbyac5fad27b1ixkcan = 1
    __1ixkbyac5fad27b1ixkcan = (__1ixkbyac5fad27b1ixkcan + 0)
    if not _x1ixkby1c5fad2721ixkc9w then
      return
    end
  end
  do
    local _m1ixkbydc5fad27e1ixkcaw = 1
    _m1ixkbydc5fad27e1ixkcaw = (_m1ixkbydc5fad27e1ixkcaw + 0)
    if __1ixkby5c5fad2761ixkca8:GetAttribute("Ragdoll") then
      do
        local _z1ixkbycc5fad27d1ixkcat = 1
        _z1ixkbycc5fad27d1ixkcat = (_z1ixkbycc5fad27d1ixkcat + 0)
        pcall(function()
          do
            local _x1ixkbybc5fad27c1ixkcaq = 1
            _x1ixkbybc5fad27c1ixkcaq = (_x1ixkbybc5fad27c1ixkcaq + 0)
            __1ixkby5c5fad2761ixkca8:SetAttribute("Ragdoll", false)
          end
        end)
      end
    end
  end
  do
    local _x1ixkbygc5fad2811ixkcb5 = 1
    _x1ixkbygc5fad2811ixkcb5 = (_x1ixkbygc5fad2811ixkcb5 + 0)
    if _1ixkby4c5fad2751ixkca5:GetAttribute("Ragdoll") then
      do
        local __1ixkbyfc5fad2801ixkcb2 = 1
        __1ixkbyfc5fad2801ixkcb2 = (__1ixkbyfc5fad2801ixkcb2 + 0)
        pcall(function()
          do
            local _1ixkbyec5fad27f1ixkcaz = 1
            _1ixkbyec5fad27f1ixkcaz = (_1ixkbyec5fad27f1ixkcaz + 0)
            _1ixkby4c5fad2751ixkca5:SetAttribute("Ragdoll", false)
          end
        end)
      end
    end
  end
  do
    local _m1ixkbyic5fad2831ixkcbb = 1
    _m1ixkbyic5fad2831ixkcbb = (_m1ixkbyic5fad2831ixkcbb + 0)
    pcall(function()
      do
        local _z1ixkbyhc5fad2821ixkcb8 = 1
        _z1ixkbyhc5fad2821ixkcb8 = (_z1ixkbyhc5fad2821ixkcb8 + 0)
        _z1ixkbxdc5fad25a1ixkc7w.enabled.set(false)
      end
    end)
  end
  do
    local _x1ixkbylc5fad2861ixkcbk = 1
    _x1ixkbylc5fad2861ixkcbk = (_x1ixkbylc5fad2861ixkcbk + 0)
    if (__1ixkby5c5fad2761ixkca8:GetState() == Enum.HumanoidStateType.Physics) then
      do
        local __1ixkbykc5fad2851ixkcbh = 1
        __1ixkbykc5fad2851ixkcbh = (__1ixkbykc5fad2851ixkcbh + 0)
        pcall(function()
          do
            local _1ixkbyjc5fad2841ixkcbe = 1
            _1ixkbyjc5fad2841ixkcbe = (_1ixkbyjc5fad2841ixkcbe + 0)
            __1ixkby5c5fad2761ixkca8:ChangeState(Enum.HumanoidStateType.GettingUp)
          end
        end)
      end
    end
  end
end
local _z1ixkbymc5fad2871ixkcbn = "Delivery Driver"
local function _m1ixkbync5fad2881ixkcbq()
  return (_x1ixkbtvc5fad1dc1ixkbxe:GetAttribute("Job") == _z1ixkbymc5fad2871ixkcbn)
end
local _1ixkbyoc5fad2891ixkcbt = Vector3.new(15.82, 10.43, 265.33)
local function __1ixkbypc5fad28a1ixkcbw()
  local _x1ixkbyqc5fad28b1ixkcbz = _m1ixkbtsc5fad1d91ixkbx5:GetTagged("FoodDeliveryJob")[1]
  do
    local _z1ixkbyrc5fad28c1ixkcc2 = 1
    _z1ixkbyrc5fad28c1ixkcc2 = (_z1ixkbyrc5fad28c1ixkcc2 + 0)
    if not _x1ixkbyqc5fad28b1ixkcbz then
      return nil
    end
  end
  return _1ixkbyoc5fad2891ixkcbt
end
local _m1ixkbysc5fad28d1ixkcc5 = Vector3.new(17.27, 10.43, 232.5)
local _1ixkbytc5fad28e1ixkcc8 = Vector3.new(16.4, 10.43, 260)
local __1ixkbyuc5fad28f1ixkccb = {}
local function _x1ixkbyvc5fad2901ixkcce()
  do
    local _z1ixkbywc5fad2911ixkcch = 1
    _z1ixkbywc5fad2911ixkcch = (_z1ixkbywc5fad2911ixkcch + 0)
    if not Toggles.FarmSeeThrough.Value then
      return
    end
  end
  do
    local _m1ixkbyxc5fad2921ixkcck = 1
    _m1ixkbyxc5fad2921ixkcck = (_m1ixkbyxc5fad2921ixkcck + 0)
    if (os.clock() < ((_x1ixkbufc5fad1f01ixkbz2.nextRelax or 0))) then
      return
    end
  end
  do
    local _1ixkbyyc5fad2931ixkccn = 1
    _1ixkbyyc5fad2931ixkccn = (_1ixkbyyc5fad2931ixkccn + 0)
    _x1ixkbufc5fad1f01ixkbz2.nextRelax = (os.clock() + 4)
  end
  local __1ixkbyzc5fad2941ixkccq, _x1ixkbz0c5fad2951ixkcct = pcall(_m1ixkbu2c5fad1e31ixkbxz.get_interactive_instances)
  do
    local _z1ixkbz1c5fad2961ixkccw = 1
    _z1ixkbz1c5fad2961ixkccw = (_z1ixkbz1c5fad2961ixkccw + 0)
    if (not __1ixkbyzc5fad2941ixkccq or (type(_x1ixkbz0c5fad2951ixkcct) ~= "table")) then
      return
    end
  end
  do
    local __1ixkbz9c5fad29e1ixkcdk = 1
    __1ixkbz9c5fad29e1ixkcdk = (__1ixkbz9c5fad29e1ixkcdk + 0)
    for _m1ixkbz2c5fad2971ixkccz, _1ixkbz3c5fad2981ixkcd2 in pairs(_x1ixkbz0c5fad2951ixkcct) do
      do
        local _1ixkbz8c5fad29d1ixkcdh = 1
        _1ixkbz8c5fad29d1ixkcdh = (_1ixkbz8c5fad29d1ixkcdh + 0)
        if (type(_1ixkbz3c5fad2981ixkcd2) == "table") then
          local __1ixkbz4c5fad2991ixkcd5 = rawget(_1ixkbz3c5fad2981ixkcd2, "config")
          do
            local _m1ixkbz7c5fad29c1ixkcde = 1
            _m1ixkbz7c5fad29c1ixkcde = (_m1ixkbz7c5fad29c1ixkcde + 0)
            if ((type(__1ixkbz4c5fad2991ixkcd5) == "table") and (__1ixkbz4c5fad2991ixkcd5.ignore_occlusion ~= true)) then
              do
                local _x1ixkbz5c5fad29a1ixkcd8 = 1
                _x1ixkbz5c5fad29a1ixkcd8 = (_x1ixkbz5c5fad29a1ixkcd8 + 0)
                __1ixkbyuc5fad28f1ixkccb[_1ixkbz3c5fad2981ixkcd2] = __1ixkbz4c5fad2991ixkcd5.ignore_occlusion
              end
              do
                local _z1ixkbz6c5fad29b1ixkcdb = 1
                _z1ixkbz6c5fad29b1ixkcdb = (_z1ixkbz6c5fad29b1ixkcdb + 0)
                __1ixkbz4c5fad2991ixkcd5.ignore_occlusion = true
              end
            end
          end
        end
      end
    end
  end
end
local function _x1ixkbzac5fad29f1ixkcdn()
  do
    local _z1ixkbzgc5fad2a51ixkce5 = 1
    _z1ixkbzgc5fad2a51ixkce5 = (_z1ixkbzgc5fad2a51ixkce5 + 0)
    for _z1ixkbzbc5fad2a01ixkcdq, _m1ixkbzcc5fad2a11ixkcdt in pairs(__1ixkbyuc5fad28f1ixkccb) do
      local _1ixkbzdc5fad2a21ixkcdw = ((type(_z1ixkbzbc5fad2a01ixkcdq) == "table") and rawget(_z1ixkbzbc5fad2a01ixkcdq, "config"))
      do
        local _x1ixkbzfc5fad2a41ixkce2 = 1
        _x1ixkbzfc5fad2a41ixkce2 = (_x1ixkbzfc5fad2a41ixkce2 + 0)
        if (type(_1ixkbzdc5fad2a21ixkcdw) == "table") then
          do
            local __1ixkbzec5fad2a31ixkcdz = 1
            __1ixkbzec5fad2a31ixkcdz = (__1ixkbzec5fad2a31ixkcdz + 0)
            _1ixkbzdc5fad2a21ixkcdw.ignore_occlusion = _m1ixkbzcc5fad2a11ixkcdt
          end
        end
      end
    end
  end
  do
    local _m1ixkbzhc5fad2a61ixkce8 = 1
    _m1ixkbzhc5fad2a61ixkce8 = (_m1ixkbzhc5fad2a61ixkce8 + 0)
    __1ixkbyuc5fad28f1ixkccb = {}
  end
end
local function _1ixkbzic5fad2a71ixkceb()
  local __1ixkbzjc5fad2a81ixkcee, _x1ixkbzkc5fad2a91ixkceh = pcall(_x1ixkbu0c5fad1e11ixkbxt.get_item_amount_from_name, "Tool", "Delivery Bag")
  return (((__1ixkbzjc5fad2a81ixkcee and tonumber(_x1ixkbzkc5fad2a91ixkceh))) or 0)
end
local function _z1ixkbzlc5fad2aa1ixkcek()
  local _m1ixkbzmc5fad2ab1ixkcen = _m1ixkbtsc5fad1d91ixkbx5:GetTagged("FoodDeliveryCollect")[1]
  return ((_m1ixkbzmc5fad2ab1ixkcen and _m1ixkbzmc5fad2ab1ixkcen:GetPivot().Position) or nil)
end
local function _1ixkbznc5fad2ac1ixkceq()
  local __1ixkbzoc5fad2ad1ixkcet, _x1ixkbzpc5fad2ae1ixkcew = pcall(_x1ixkbu0c5fad1e11ixkbxt.find_items, "Tool", "Delivery Bag")
  do
    local _x1ixkbzzc5fad2b81ixkcfq = 1
    _x1ixkbzzc5fad2b81ixkcfq = (_x1ixkbzzc5fad2b81ixkcfq + 0)
    if (__1ixkbzoc5fad2ad1ixkcet and (type(_x1ixkbzpc5fad2ae1ixkcew) == "table")) then
      do
        local __1ixkbzyc5fad2b71ixkcfn = 1
        __1ixkbzyc5fad2b71ixkcfn = (__1ixkbzyc5fad2b71ixkcfn + 0)
        for _z1ixkbzqc5fad2af1ixkcez, _m1ixkbzrc5fad2b01ixkcf2 in pairs(_x1ixkbzpc5fad2ae1ixkcew) do
          local _1ixkbzsc5fad2b11ixkcf5 = _x1ixkbu0c5fad1e11ixkbxt.get_item_data_from_guid(_m1ixkbzrc5fad2b01ixkcf2)
          do
            local _1ixkbzxc5fad2b61ixkcfk = 1
            _1ixkbzxc5fad2b61ixkcfk = (_1ixkbzxc5fad2b61ixkcfk + 0)
            if (_1ixkbzsc5fad2b11ixkcf5 and _1ixkbzsc5fad2b11ixkcf5.given_at) then
              local __1ixkbztc5fad2b21ixkcf8 = _z1ixkbu1c5fad1e21ixkbxw.roll(_1ixkbzsc5fad2b11ixkcf5.given_at)
              do
                local _m1ixkbzwc5fad2b51ixkcfh = 1
                _m1ixkbzwc5fad2b51ixkcfh = (_m1ixkbzwc5fad2b51ixkcfh + 0)
                if __1ixkbztc5fad2b21ixkcf8 then
                  local _x1ixkbzuc5fad2b31ixkcfb = _z1ixkbu1c5fad1e21ixkbxw.get_position(__1ixkbztc5fad2b21ixkcf8.street, __1ixkbztc5fad2b21ixkcf8.number)
                  do
                    local _z1ixkbzvc5fad2b41ixkcfe = 1
                    _z1ixkbzvc5fad2b41ixkcfe = (_z1ixkbzvc5fad2b41ixkcfe + 0)
                    if _x1ixkbzuc5fad2b31ixkcfb then
                      return _x1ixkbzuc5fad2b31ixkcfb, (__1ixkbztc5fad2b21ixkcf8.street .. (" " .. __1ixkbztc5fad2b21ixkcf8.number))
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  local _z1ixkc00c5fad2b91ixkcft = _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("DeliveryBeacon")
  do
    local _m1ixkc01c5fad2ba1ixkcfw = 1
    _m1ixkc01c5fad2ba1ixkcfw = (_m1ixkc01c5fad2ba1ixkcfw + 0)
    if _z1ixkc00c5fad2b91ixkcft then
      return _z1ixkc00c5fad2b91ixkcft.Position, "beacon"
    end
  end
  return nil, nil
end
local function _1ixkc02c5fad2bb1ixkcfz(__1ixkc03c5fad2bc1ixkcg2)
  local _x1ixkc04c5fad2bd1ixkcg5 = _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Vehicles")
  do
    local _z1ixkc05c5fad2be1ixkcg8 = 1
    _z1ixkc05c5fad2be1ixkcg8 = (_z1ixkc05c5fad2be1ixkcg8 + 0)
    if not _x1ixkc04c5fad2bd1ixkcg5 then
      return nil
    end
  end
  local _m1ixkc06c5fad2bf1ixkcgb, _1ixkc07c5fad2c01ixkcge
  do
    local _1ixkc0hc5fad2ca1ixkch8 = 1
    _1ixkc0hc5fad2ca1ixkch8 = (_1ixkc0hc5fad2ca1ixkch8 + 0)
    for __1ixkc08c5fad2c11ixkcgh, _x1ixkc09c5fad2c21ixkcgk in ipairs(_x1ixkc04c5fad2bd1ixkcg5:GetChildren()) do
      do
        local _m1ixkc0gc5fad2c91ixkch5 = 1
        _m1ixkc0gc5fad2c91ixkch5 = (_m1ixkc0gc5fad2c91ixkch5 + 0)
        if (_x1ixkc09c5fad2c21ixkcgk:IsA("Model") and (_x1ixkc09c5fad2c21ixkcgk:GetAttribute("OwnerUserId") == _x1ixkbtvc5fad1dc1ixkbxe.UserId)) then
          local _z1ixkc0ac5fad2c31ixkcgn, _m1ixkc0bc5fad2c41ixkcgq = pcall(function()
            return _x1ixkc09c5fad2c21ixkcgk:GetPivot().Position
          end)
          do
            local _z1ixkc0fc5fad2c81ixkch2 = 1
            _z1ixkc0fc5fad2c81ixkch2 = (_z1ixkc0fc5fad2c81ixkch2 + 0)
            if _z1ixkc0ac5fad2c31ixkcgn then
              local _1ixkc0cc5fad2c51ixkcgt = _m1ixkbucc5fad1ed1ixkbyt(__1ixkc03c5fad2bc1ixkcg2, _m1ixkc0bc5fad2c41ixkcgq)
              do
                local _x1ixkc0ec5fad2c71ixkcgz = 1
                _x1ixkc0ec5fad2c71ixkcgz = (_x1ixkc0ec5fad2c71ixkcgz + 0)
                if (not _1ixkc07c5fad2c01ixkcge or (_1ixkc0cc5fad2c51ixkcgt < _1ixkc07c5fad2c01ixkcge)) then
                  do
                    local __1ixkc0dc5fad2c61ixkcgw = 1
                    __1ixkc0dc5fad2c61ixkcgw = (__1ixkc0dc5fad2c61ixkcgw + 0)
                    _m1ixkc06c5fad2bf1ixkcgb, _1ixkc07c5fad2c01ixkcge = _x1ixkc09c5fad2c21ixkcgk, _1ixkc0cc5fad2c51ixkcgt
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return _m1ixkc06c5fad2bf1ixkcgb, _1ixkc07c5fad2c01ixkcge
end
local function __1ixkc0ic5fad2cb1ixkchb(_x1ixkc0jc5fad2cc1ixkche)
  do
    local _z1ixkc0kc5fad2cd1ixkchh = 1
    _z1ixkc0kc5fad2cd1ixkchh = (_z1ixkc0kc5fad2cd1ixkchh + 0)
    if not _x1ixkc0jc5fad2cc1ixkche then
      return nil
    end
  end
  do
    local _x1ixkc0oc5fad2d11ixkcht = 1
    _x1ixkc0oc5fad2d11ixkcht = (_x1ixkc0oc5fad2d11ixkcht + 0)
    for _m1ixkc0lc5fad2ce1ixkchk, _1ixkc0mc5fad2cf1ixkchn in ipairs(_x1ixkc0jc5fad2cc1ixkche:GetDescendants()) do
      do
        local __1ixkc0nc5fad2d01ixkchq = 1
        __1ixkc0nc5fad2d01ixkchq = (__1ixkc0nc5fad2d01ixkchq + 0)
        if (_1ixkc0mc5fad2cf1ixkchn:IsA("BasePart") and ((_1ixkc0mc5fad2cf1ixkchn:HasTag("DriverSeat") or (_1ixkc0mc5fad2cf1ixkchn.Name == "DriverSeat")))) then
          return _1ixkc0mc5fad2cf1ixkchn
        end
      end
    end
  end
  do
    local __1ixkc0sc5fad2d51ixkci5 = 1
    __1ixkc0sc5fad2d51ixkci5 = (__1ixkc0sc5fad2d51ixkci5 + 0)
    for _z1ixkc0pc5fad2d21ixkchw, _m1ixkc0qc5fad2d31ixkchz in ipairs(_x1ixkc0jc5fad2cc1ixkche:GetDescendants()) do
      do
        local _1ixkc0rc5fad2d41ixkci2 = 1
        _1ixkc0rc5fad2d41ixkci2 = (_1ixkc0rc5fad2d41ixkci2 + 0)
        if _m1ixkc0qc5fad2d31ixkchz:IsA("VehicleSeat") then
          return _m1ixkc0qc5fad2d31ixkchz
        end
      end
    end
  end
  return nil
end
local function _x1ixkc0tc5fad2d61ixkci8(_z1ixkc0uc5fad2d71ixkcib, _m1ixkc0vc5fad2d81ixkcie, _1ixkc0wc5fad2d91ixkcih)
  local __1ixkc0xc5fad2da1ixkcik = (((_m1ixkc0vc5fad2d81ixkcie and _m1ixkc0vc5fad2d81ixkcie.Position)) or _z1ixkc0uc5fad2d71ixkcib:GetPivot().Position)
  local _x1ixkc0yc5fad2db1ixkcin = (__1ixkc0xc5fad2da1ixkcik - _1ixkc0wc5fad2d91ixkcih)
  do
    local _z1ixkc0zc5fad2dc1ixkciq = 1
    _z1ixkc0zc5fad2dc1ixkciq = (_z1ixkc0zc5fad2dc1ixkciq + 0)
    _x1ixkc0yc5fad2db1ixkcin = Vector3.new(_x1ixkc0yc5fad2db1ixkcin.X, 0, _x1ixkc0yc5fad2db1ixkcin.Z)
  end
  local _m1ixkc10c5fad2dd1ixkcit = (((_x1ixkc0yc5fad2db1ixkcin.Magnitude > 0.5) and -_x1ixkc0yc5fad2db1ixkcin.Unit) or Vector3.new(1, 0, 0))
  local _1ixkc11c5fad2de1ixkciw = (__1ixkc0xc5fad2da1ixkcik + (_m1ixkc10c5fad2dd1ixkcit * 4))
  local __1ixkc12c5fad2df1ixkciz = RaycastParams.new()
  do
    local _x1ixkc13c5fad2e01ixkcj2 = 1
    _x1ixkc13c5fad2e01ixkcj2 = (_x1ixkc13c5fad2e01ixkcj2 + 0)
    __1ixkc12c5fad2df1ixkciz.FilterType = Enum.RaycastFilterType.Exclude
  end
  do
    local _z1ixkc14c5fad2e11ixkcj5 = 1
    _z1ixkc14c5fad2e11ixkcj5 = (_z1ixkc14c5fad2e11ixkcj5 + 0)
    __1ixkc12c5fad2df1ixkciz.FilterDescendantsInstances = {_z1ixkc0uc5fad2d71ixkcib, _m1ixkbu7c5fad1e81ixkbye(), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Characters"), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Vehicles")}
  end
  local _m1ixkc15c5fad2e21ixkcj8 = _x1ixkbtqc5fad1d71ixkbwz:Raycast((_1ixkc11c5fad2de1ixkciw + Vector3.new(0, 12, 0)), Vector3.new(0, -40, 0), __1ixkc12c5fad2df1ixkciz)
  return ((_m1ixkc15c5fad2e21ixkcj8 and ((_m1ixkc15c5fad2e21ixkcj8.Position + Vector3.new(0, 3, 0)))) or _1ixkc11c5fad2de1ixkciw)
end
local function _1ixkc16c5fad2e31ixkcjb()
  return true
end
local function __1ixkc17c5fad2e41ixkcje()
  do
    local _m1ixkc1fc5fad2ec1ixkck2 = 1
    _m1ixkc1fc5fad2ec1ixkck2 = (_m1ixkc1fc5fad2ec1ixkck2 + 0)
    for _x1ixkc18c5fad2e51ixkcjh, _z1ixkc19c5fad2e61ixkcjk in ipairs({"current_driving", "current_vehicle", "active_vehicle"}) do
      local _m1ixkc1ac5fad2e71ixkcjn = _x1ixkbu5c5fad1e61ixkby8[_z1ixkc19c5fad2e61ixkcjk]
      do
        local _z1ixkc1ec5fad2eb1ixkcjz = 1
        _z1ixkc1ec5fad2eb1ixkcjz = (_z1ixkc1ec5fad2eb1ixkcjz + 0)
        if ((type(_m1ixkc1ac5fad2e71ixkcjn) == "table") and (type(_m1ixkc1ac5fad2e71ixkcjn.get) == "function")) then
          local _1ixkc1bc5fad2e81ixkcjq, __1ixkc1cc5fad2e91ixkcjt = pcall(_m1ixkc1ac5fad2e71ixkcjn.get)
          do
            local _x1ixkc1dc5fad2ea1ixkcjw = 1
            _x1ixkc1dc5fad2ea1ixkcjw = (_x1ixkc1dc5fad2ea1ixkcjw + 0)
            if ((_1ixkc1bc5fad2e81ixkcjq and (typeof(__1ixkc1cc5fad2e91ixkcjt) == "Instance")) and __1ixkc1cc5fad2e91ixkcjt:FindFirstChild("Chassis")) then
              return __1ixkc1cc5fad2e91ixkcjt
            end
          end
        end
      end
    end
  end
  local _1ixkc1gc5fad2ed1ixkck5, __1ixkc1hc5fad2ee1ixkck8 = pcall(_x1ixkbu5c5fad1e61ixkby8.get_car_player_is_in)
  do
    local _x1ixkc1ic5fad2ef1ixkckb = 1
    _x1ixkc1ic5fad2ef1ixkckb = (_x1ixkc1ic5fad2ef1ixkckb + 0)
    if (_1ixkc1gc5fad2ed1ixkck5 and (typeof(__1ixkc1hc5fad2ee1ixkck8) == "Instance")) then
      return __1ixkc1hc5fad2ee1ixkck8
    end
  end
  local _z1ixkc1jc5fad2f01ixkcke = _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Vehicles")
  local _m1ixkc1kc5fad2f11ixkckh, _1ixkc1lc5fad2f21ixkckk = _m1ixkbu7c5fad1e81ixkbye(), _x1ixkbuac5fad1eb1ixkbyn()
  do
    local __1ixkc1rc5fad2f81ixkcl2 = 1
    __1ixkc1rc5fad2f81ixkcl2 = (__1ixkc1rc5fad2f81ixkcl2 + 0)
    if (_z1ixkc1jc5fad2f01ixkcke and _m1ixkc1kc5fad2f11ixkckh) then
      do
        local _1ixkc1qc5fad2f71ixkckz = 1
        _1ixkc1qc5fad2f71ixkckz = (_1ixkc1qc5fad2f71ixkckz + 0)
        for __1ixkc1mc5fad2f31ixkckn, _x1ixkc1nc5fad2f41ixkckq in ipairs(_z1ixkc1jc5fad2f01ixkcke:GetChildren()) do
          local _z1ixkc1oc5fad2f51ixkckt = _x1ixkc1nc5fad2f41ixkckq:FindFirstChild("driver")
          do
            local _m1ixkc1pc5fad2f61ixkckw = 1
            _m1ixkc1pc5fad2f61ixkckw = (_m1ixkc1pc5fad2f61ixkckw + 0)
            if (((_z1ixkc1oc5fad2f51ixkckt and _z1ixkc1oc5fad2f51ixkckt:IsA("ObjectValue")) and _z1ixkc1oc5fad2f51ixkckt.Value) and ((((_z1ixkc1oc5fad2f51ixkckt.Value == _m1ixkc1kc5fad2f11ixkckh) or (_z1ixkc1oc5fad2f51ixkckt.Value == _1ixkc1lc5fad2f21ixkckk)) or (_z1ixkc1oc5fad2f51ixkckt.Value == _x1ixkbtvc5fad1dc1ixkbxe)))) then
              return _x1ixkc1nc5fad2f41ixkckq
            end
          end
        end
      end
    end
  end
  return nil
end
local function _x1ixkc1sc5fad2f91ixkcl5(_z1ixkc1tc5fad2fa1ixkcl8, _m1ixkc1uc5fad2fb1ixkclb, _1ixkc1vc5fad2fc1ixkcle)
  local __1ixkc1wc5fad2fd1ixkclh = RaycastParams.new()
  do
    local _x1ixkc1xc5fad2fe1ixkclk = 1
    _x1ixkc1xc5fad2fe1ixkclk = (_x1ixkc1xc5fad2fe1ixkclk + 0)
    __1ixkc1wc5fad2fd1ixkclh.FilterType = Enum.RaycastFilterType.Exclude
  end
  do
    local _z1ixkc1yc5fad2ff1ixkcln = 1
    _z1ixkc1yc5fad2ff1ixkcln = (_z1ixkc1yc5fad2ff1ixkcln + 0)
    __1ixkc1wc5fad2fd1ixkclh.FilterDescendantsInstances = {_m1ixkbu7c5fad1e81ixkbye(), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Characters"), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Vehicles"), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Effects")}
  end
  local _m1ixkc1zc5fad3001ixkclq = Vector3.new(0, 2.5, 0)
  local _1ixkc20c5fad3011ixkclt, __1ixkc21c5fad3021ixkclw = (_z1ixkc1tc5fad2fa1ixkcl8 + _m1ixkc1zc5fad3001ixkclq), ((_m1ixkc1uc5fad2fb1ixkclb - _z1ixkc1tc5fad2fa1ixkcl8))
  do
    local _1ixkc25c5fad3061ixkcm8 = 1
    _1ixkc25c5fad3061ixkcm8 = (_1ixkc25c5fad3061ixkcm8 + 0)
    if (_1ixkc1vc5fad2fc1ixkcle and (_1ixkc1vc5fad2fc1ixkcle > 0)) then
      local _x1ixkc22c5fad3031ixkclz, _z1ixkc23c5fad3041ixkcm2 = pcall(function()
        return _x1ixkbtqc5fad1d71ixkbwz:Blockcast(CFrame.new(_1ixkc20c5fad3011ixkclt), Vector3.new(_1ixkc1vc5fad2fc1ixkcle, 3, 1), __1ixkc21c5fad3021ixkclw, __1ixkc1wc5fad2fd1ixkclh)
      end)
      do
        local _m1ixkc24c5fad3051ixkcm5 = 1
        _m1ixkc24c5fad3051ixkcm5 = (_m1ixkc24c5fad3051ixkcm5 + 0)
        if _x1ixkc22c5fad3031ixkclz then
          return (_z1ixkc23c5fad3041ixkcm2 == nil)
        end
      end
    end
  end
  return (_x1ixkbtqc5fad1d71ixkbwz:Raycast(_1ixkc20c5fad3011ixkclt, __1ixkc21c5fad3021ixkclw, __1ixkc1wc5fad2fd1ixkclh) == nil)
end
local __1ixkc26c5fad3071ixkcmb = nil
local function _x1ixkc27c5fad3081ixkcme()
  do
    local __1ixkc2bc5fad30c1ixkcmq = 1
    __1ixkc2bc5fad30c1ixkcmq = (__1ixkc2bc5fad30c1ixkcmq + 0)
    if __1ixkc26c5fad3071ixkcmb then
      do
        local _m1ixkc29c5fad30a1ixkcmk = 1
        _m1ixkc29c5fad30a1ixkcmk = (_m1ixkc29c5fad30a1ixkcmk + 0)
        pcall(function()
          do
            local _z1ixkc28c5fad3091ixkcmh = 1
            _z1ixkc28c5fad3091ixkcmh = (_z1ixkc28c5fad3091ixkcmh + 0)
            __1ixkc26c5fad3071ixkcmb:Destroy()
          end
        end)
      end
      do
        local _1ixkc2ac5fad30b1ixkcmn = 1
        _1ixkc2ac5fad30b1ixkcmn = (_1ixkc2ac5fad30b1ixkcmn + 0)
        __1ixkc26c5fad3071ixkcmb = nil
      end
    end
  end
  do
    local _x1ixkc2cc5fad30d1ixkcmt = 1
    _x1ixkc2cc5fad30d1ixkcmt = (_x1ixkc2cc5fad30d1ixkcmt + 0)
    if not (((Toggles and Toggles.FarmShowRoute) and Toggles.FarmShowRoute.Value)) then
      return
    end
  end
  local _z1ixkc2dc5fad30e1ixkcmw = _x1ixkbufc5fad1f01ixkbz2.wps
  do
    local _m1ixkc2ec5fad30f1ixkcmz = 1
    _m1ixkc2ec5fad30f1ixkcmz = (_m1ixkc2ec5fad30f1ixkcmz + 0)
    if (#_z1ixkc2dc5fad30e1ixkcmw < 2) then
      return
    end
  end
  local _1ixkc2fc5fad3101ixkcn2 = Instance.new("Folder")
  do
    local __1ixkc2gc5fad3111ixkcn5 = 1
    __1ixkc2gc5fad3111ixkcn5 = (__1ixkc2gc5fad3111ixkcn5 + 0)
    _1ixkc2fc5fad3101ixkcn2.Name = "ZenFarmRoute"
  end
  do
    local _x1ixkc2hc5fad3121ixkcn8 = 1
    _x1ixkc2hc5fad3121ixkcn8 = (_x1ixkc2hc5fad3121ixkcn8 + 0)
    _1ixkc2fc5fad3101ixkcn2.Parent = _x1ixkbtqc5fad1d71ixkbwz
  end
  local _z1ixkc2ic5fad3131ixkcnb = Options.FarmRouteColour.Value
  do
    local _z1ixkc2xc5fad3221ixkcok = 1
    _z1ixkc2xc5fad3221ixkcok = (_z1ixkc2xc5fad3221ixkcok + 0)
    for _m1ixkc2jc5fad3141ixkcne = 3, #_z1ixkc2dc5fad30e1ixkcmw, 2 do
      local _1ixkc2kc5fad3151ixkcnh, __1ixkc2lc5fad3161ixkcnk = _z1ixkc2dc5fad30e1ixkcmw[(_m1ixkc2jc5fad3141ixkcne - 2)].Position, _z1ixkc2dc5fad30e1ixkcmw[_m1ixkc2jc5fad3141ixkcne].Position
      local _x1ixkc2mc5fad3171ixkcnn = ((__1ixkc2lc5fad3161ixkcnk - _1ixkc2kc5fad3151ixkcnh)).Magnitude
      do
        local _x1ixkc2wc5fad3211ixkcoh = 1
        _x1ixkc2wc5fad3211ixkcoh = (_x1ixkc2wc5fad3211ixkcoh + 0)
        if (_x1ixkc2mc5fad3171ixkcnn > 0.05) then
          local _z1ixkc2nc5fad3181ixkcnq = Instance.new("Part")
          do
            local _m1ixkc2oc5fad3191ixkcnt = 1
            _m1ixkc2oc5fad3191ixkcnt = (_m1ixkc2oc5fad3191ixkcnt + 0)
            _z1ixkc2nc5fad3181ixkcnq.Anchored, _z1ixkc2nc5fad3181ixkcnq.CanCollide, _z1ixkc2nc5fad3181ixkcnq.CanQuery, _z1ixkc2nc5fad3181ixkcnq.CanTouch = true, false, false, false
          end
          do
            local _1ixkc2pc5fad31a1ixkcnw = 1
            _1ixkc2pc5fad31a1ixkcnw = (_1ixkc2pc5fad31a1ixkcnw + 0)
            _z1ixkc2nc5fad3181ixkcnq.CastShadow = false
          end
          do
            local __1ixkc2qc5fad31b1ixkcnz = 1
            __1ixkc2qc5fad31b1ixkcnz = (__1ixkc2qc5fad31b1ixkcnz + 0)
            _z1ixkc2nc5fad3181ixkcnq.Material = Enum.Material.Neon
          end
          do
            local _x1ixkc2rc5fad31c1ixkco2 = 1
            _x1ixkc2rc5fad31c1ixkco2 = (_x1ixkc2rc5fad31c1ixkco2 + 0)
            _z1ixkc2nc5fad3181ixkcnq.Color = _z1ixkc2ic5fad3131ixkcnb
          end
          do
            local _z1ixkc2sc5fad31d1ixkco5 = 1
            _z1ixkc2sc5fad31d1ixkco5 = (_z1ixkc2sc5fad31d1ixkco5 + 0)
            _z1ixkc2nc5fad3181ixkcnq.Transparency = 0.35
          end
          do
            local _m1ixkc2tc5fad31e1ixkco8 = 1
            _m1ixkc2tc5fad31e1ixkco8 = (_m1ixkc2tc5fad31e1ixkco8 + 0)
            _z1ixkc2nc5fad3181ixkcnq.Size = Vector3.new(0.25, 0.25, _x1ixkc2mc5fad3171ixkcnn)
          end
          do
            local _1ixkc2uc5fad31f1ixkcob = 1
            _1ixkc2uc5fad31f1ixkcob = (_1ixkc2uc5fad31f1ixkcob + 0)
            _z1ixkc2nc5fad3181ixkcnq.CFrame = CFrame.lookAt((_1ixkc2kc5fad3151ixkcnh:Lerp(__1ixkc2lc5fad3161ixkcnk, 0.5) + Vector3.new(0, 0.5, 0)), (__1ixkc2lc5fad3161ixkcnk + Vector3.new(0, 0.5, 0)))
          end
          do
            local __1ixkc2vc5fad3201ixkcoe = 1
            __1ixkc2vc5fad3201ixkcoe = (__1ixkc2vc5fad3201ixkcoe + 0)
            _z1ixkc2nc5fad3181ixkcnq.Parent = _1ixkc2fc5fad3101ixkcn2
          end
        end
      end
    end
  end
  do
    local _1ixkc39c5fad32e1ixkcpk = 1
    _1ixkc39c5fad32e1ixkcpk = (_1ixkc39c5fad32e1ixkcpk + 0)
    for _m1ixkc2yc5fad3231ixkcon = 1, #_z1ixkc2dc5fad30e1ixkcmw, 12 do
      local _1ixkc2zc5fad3241ixkcoq = Instance.new("Part")
      do
        local __1ixkc30c5fad3251ixkcot = 1
        __1ixkc30c5fad3251ixkcot = (__1ixkc30c5fad3251ixkcot + 0)
        _1ixkc2zc5fad3241ixkcoq.Shape = Enum.PartType.Ball
      end
      do
        local _x1ixkc31c5fad3261ixkcow = 1
        _x1ixkc31c5fad3261ixkcow = (_x1ixkc31c5fad3261ixkcow + 0)
        _1ixkc2zc5fad3241ixkcoq.Anchored, _1ixkc2zc5fad3241ixkcoq.CanCollide, _1ixkc2zc5fad3241ixkcoq.CanQuery, _1ixkc2zc5fad3241ixkcoq.CanTouch = true, false, false, false
      end
      do
        local _z1ixkc32c5fad3271ixkcoz = 1
        _z1ixkc32c5fad3271ixkcoz = (_z1ixkc32c5fad3271ixkcoz + 0)
        _1ixkc2zc5fad3241ixkcoq.CastShadow = false
      end
      do
        local _m1ixkc33c5fad3281ixkcp2 = 1
        _m1ixkc33c5fad3281ixkcp2 = (_m1ixkc33c5fad3281ixkcp2 + 0)
        _1ixkc2zc5fad3241ixkcoq.Material = Enum.Material.Neon
      end
      do
        local _1ixkc34c5fad3291ixkcp5 = 1
        _1ixkc34c5fad3291ixkcp5 = (_1ixkc34c5fad3291ixkcp5 + 0)
        _1ixkc2zc5fad3241ixkcoq.Color = _z1ixkc2ic5fad3131ixkcnb
      end
      do
        local __1ixkc35c5fad32a1ixkcp8 = 1
        __1ixkc35c5fad32a1ixkcp8 = (__1ixkc35c5fad32a1ixkcp8 + 0)
        _1ixkc2zc5fad3241ixkcoq.Transparency = 0.2
      end
      do
        local _x1ixkc36c5fad32b1ixkcpb = 1
        _x1ixkc36c5fad32b1ixkcpb = (_x1ixkc36c5fad32b1ixkcpb + 0)
        _1ixkc2zc5fad3241ixkcoq.Size = Vector3.new(1.1, 1.1, 1.1)
      end
      do
        local _z1ixkc37c5fad32c1ixkcpe = 1
        _z1ixkc37c5fad32c1ixkcpe = (_z1ixkc37c5fad32c1ixkcpe + 0)
        _1ixkc2zc5fad3241ixkcoq.Position = (_z1ixkc2dc5fad30e1ixkcmw[_m1ixkc2yc5fad3231ixkcon].Position + Vector3.new(0, 0.6, 0))
      end
      do
        local _m1ixkc38c5fad32d1ixkcph = 1
        _m1ixkc38c5fad32d1ixkcph = (_m1ixkc38c5fad32d1ixkcph + 0)
        _1ixkc2zc5fad3241ixkcoq.Parent = _1ixkc2fc5fad3101ixkcn2
      end
    end
  end
  local __1ixkc3ac5fad32f1ixkcpn = Instance.new("Part")
  do
    local _x1ixkc3bc5fad3301ixkcpq = 1
    _x1ixkc3bc5fad3301ixkcpq = (_x1ixkc3bc5fad3301ixkcpq + 0)
    __1ixkc3ac5fad32f1ixkcpn.Shape = Enum.PartType.Ball
  end
  do
    local _z1ixkc3cc5fad3311ixkcpt = 1
    _z1ixkc3cc5fad3311ixkcpt = (_z1ixkc3cc5fad3311ixkcpt + 0)
    __1ixkc3ac5fad32f1ixkcpn.Anchored, __1ixkc3ac5fad32f1ixkcpn.CanCollide, __1ixkc3ac5fad32f1ixkcpn.CanQuery, __1ixkc3ac5fad32f1ixkcpn.CanTouch = true, false, false, false
  end
  do
    local _m1ixkc3dc5fad3321ixkcpw = 1
    _m1ixkc3dc5fad3321ixkcpw = (_m1ixkc3dc5fad3321ixkcpw + 0)
    __1ixkc3ac5fad32f1ixkcpn.CastShadow = false
  end
  do
    local _1ixkc3ec5fad3331ixkcpz = 1
    _1ixkc3ec5fad3331ixkcpz = (_1ixkc3ec5fad3331ixkcpz + 0)
    __1ixkc3ac5fad32f1ixkcpn.Material = Enum.Material.Neon
  end
  do
    local __1ixkc3fc5fad3341ixkcq2 = 1
    __1ixkc3fc5fad3341ixkcq2 = (__1ixkc3fc5fad3341ixkcq2 + 0)
    __1ixkc3ac5fad32f1ixkcpn.Color = Color3.fromRGB(255, 210, 90)
  end
  do
    local _x1ixkc3gc5fad3351ixkcq5 = 1
    _x1ixkc3gc5fad3351ixkcq5 = (_x1ixkc3gc5fad3351ixkcq5 + 0)
    __1ixkc3ac5fad32f1ixkcpn.Size = Vector3.new(2.5, 2.5, 2.5)
  end
  do
    local _z1ixkc3hc5fad3361ixkcq8 = 1
    _z1ixkc3hc5fad3361ixkcq8 = (_z1ixkc3hc5fad3361ixkcq8 + 0)
    __1ixkc3ac5fad32f1ixkcpn.Transparency = 0.15
  end
  do
    local _m1ixkc3ic5fad3371ixkcqb = 1
    _m1ixkc3ic5fad3371ixkcqb = (_m1ixkc3ic5fad3371ixkcqb + 0)
    __1ixkc3ac5fad32f1ixkcpn.Position = (_z1ixkc2dc5fad30e1ixkcmw[#_z1ixkc2dc5fad30e1ixkcmw].Position + Vector3.new(0, 1.5, 0))
  end
  do
    local _1ixkc3jc5fad3381ixkcqe = 1
    _1ixkc3jc5fad3381ixkcqe = (_1ixkc3jc5fad3381ixkcqe + 0)
    __1ixkc3ac5fad32f1ixkcpn.Parent = _1ixkc2fc5fad3101ixkcn2
  end
  do
    local __1ixkc3kc5fad3391ixkcqh = 1
    __1ixkc3kc5fad3391ixkcqh = (__1ixkc3kc5fad3391ixkcqh + 0)
    __1ixkc26c5fad3071ixkcmb = _1ixkc2fc5fad3101ixkcn2
  end
end
local function _x1ixkc3lc5fad33a1ixkcqk(_z1ixkc3mc5fad33b1ixkcqn, _m1ixkc3nc5fad33c1ixkcqq)
  local _1ixkc3oc5fad33d1ixkcqt = _1ixkbttc5fad1da1ixkbx8:CreatePath({AgentRadius = 2, AgentHeight = 5, AgentCanJump = false})
  local _x1ixkc3qc5fad33f1ixkcqz = pcall(function()
    do
      local __1ixkc3pc5fad33e1ixkcqw = 1
      __1ixkc3pc5fad33e1ixkcqw = (__1ixkc3pc5fad33e1ixkcqw + 0)
      _1ixkc3oc5fad33d1ixkcqt:ComputeAsync(_z1ixkc3mc5fad33b1ixkcqn, _m1ixkc3nc5fad33c1ixkcqq)
    end
  end)
  do
    local __1ixkc3uc5fad3431ixkcrb = 1
    __1ixkc3uc5fad3431ixkcrb = (__1ixkc3uc5fad3431ixkcrb + 0)
    if (_x1ixkc3qc5fad33f1ixkcqz and (_1ixkc3oc5fad33d1ixkcqt.Status == Enum.PathStatus.Success)) then
      local _z1ixkc3rc5fad3401ixkcr2 = _1ixkc3oc5fad33d1ixkcqt:GetWaypoints()
      do
        local _1ixkc3tc5fad3421ixkcr8 = 1
        _1ixkc3tc5fad3421ixkcr8 = (_1ixkc3tc5fad3421ixkcr8 + 0)
        if (#_z1ixkc3rc5fad3401ixkcr2 > 1) then
          do
            local _m1ixkc3sc5fad3411ixkcr5 = 1
            _m1ixkc3sc5fad3411ixkcr5 = (_m1ixkc3sc5fad3411ixkcr5 + 0)
            _x1ixkbufc5fad1f01ixkbz2.lastGood = _z1ixkc3mc5fad33b1ixkcqn
          end
          return _z1ixkc3rc5fad3401ixkcr2
        end
      end
    end
  end
  return nil
end
local function _x1ixkc3vc5fad3441ixkcre(_z1ixkc3wc5fad3451ixkcrh, _m1ixkc3xc5fad3461ixkcrk, _1ixkc3yc5fad3471ixkcrn)
  do
    local __1ixkc3zc5fad3481ixkcrq = 1
    __1ixkc3zc5fad3481ixkcrq = (__1ixkc3zc5fad3481ixkcrq + 0)
    if (not _1ixkc3yc5fad3471ixkcrn and (((os.clock() - _x1ixkbufc5fad1f01ixkbz2.lastPath)) < 1)) then
      return false
    end
  end
  do
    local _x1ixkc40c5fad3491ixkcrt = 1
    _x1ixkc40c5fad3491ixkcrt = (_x1ixkc40c5fad3491ixkcrt + 0)
    _x1ixkbufc5fad1f01ixkbz2.wps, _x1ixkbufc5fad1f01ixkbz2.wpi = {}, 1
  end
  do
    local _z1ixkc41c5fad34a1ixkcrw = 1
    _z1ixkc41c5fad34a1ixkcrw = (_z1ixkc41c5fad34a1ixkcrw + 0)
    _x1ixkbufc5fad1f01ixkbz2.lastPath = os.clock()
  end
  local _m1ixkc42c5fad34b1ixkcrz = _x1ixkc3lc5fad33a1ixkcqk(_z1ixkc3wc5fad3451ixkcrh, (_x1ixkbufc5fad1f01ixkbz2.approach or _m1ixkc3xc5fad3461ixkcrk))
  do
    local _x1ixkc45c5fad34e1ixkcs8 = 1
    _x1ixkc45c5fad34e1ixkcs8 = (_x1ixkc45c5fad34e1ixkcs8 + 0)
    if (not _m1ixkc42c5fad34b1ixkcrz and _x1ixkbufc5fad1f01ixkbz2.approach) then
      do
        local _1ixkc43c5fad34c1ixkcs2 = 1
        _1ixkc43c5fad34c1ixkcs2 = (_1ixkc43c5fad34c1ixkcs2 + 0)
        _x1ixkbufc5fad1f01ixkbz2.approach = nil
      end
      do
        local __1ixkc44c5fad34d1ixkcs5 = 1
        __1ixkc44c5fad34d1ixkcs5 = (__1ixkc44c5fad34d1ixkcs5 + 0)
        _m1ixkc42c5fad34b1ixkcrz = _x1ixkc3lc5fad33a1ixkcqk(_z1ixkc3wc5fad3451ixkcrh, _m1ixkc3xc5fad3461ixkcrk)
      end
    end
  end
  do
    local __1ixkc49c5fad3521ixkcsk = 1
    __1ixkc49c5fad3521ixkcsk = (__1ixkc49c5fad3521ixkcsk + 0)
    if (not _m1ixkc42c5fad34b1ixkcrz and _x1ixkbufc5fad1f01ixkbz2.doorHint) then
      do
        local _z1ixkc46c5fad34f1ixkcsb = 1
        _z1ixkc46c5fad34f1ixkcsb = (_z1ixkc46c5fad34f1ixkcsb + 0)
        _m1ixkc42c5fad34b1ixkcrz = _x1ixkc3lc5fad33a1ixkcqk(_z1ixkc3wc5fad3451ixkcrh, _x1ixkbufc5fad1f01ixkbz2.doorHint)
      end
      do
        local _1ixkc48c5fad3511ixkcsh = 1
        _1ixkc48c5fad3511ixkcsh = (_1ixkc48c5fad3511ixkcsh + 0)
        if _m1ixkc42c5fad34b1ixkcrz then
          do
            local _m1ixkc47c5fad3501ixkcse = 1
            _m1ixkc47c5fad3501ixkcse = (_m1ixkc47c5fad3501ixkcse + 0)
            _x1ixkbufc5fad1f01ixkbz2.approach = _x1ixkbufc5fad1f01ixkbz2.doorHint
          end
        end
      end
    end
  end
  do
    local _z1ixkc4qc5fad3631ixkctz = 1
    _z1ixkc4qc5fad3631ixkctz = (_z1ixkc4qc5fad3631ixkctz + 0)
    if not _m1ixkc42c5fad34b1ixkcrz then
      local _x1ixkc4ac5fad3531ixkcsn = {12, 15, 20, 25, 32, 40, 7}
      do
        local _z1ixkc4bc5fad3541ixkcsq = 1
        _z1ixkc4bc5fad3541ixkcsq = (_z1ixkc4bc5fad3541ixkcsq + 0)
        _x1ixkbufc5fad1f01ixkbz2.ringIdx = ((((_x1ixkbufc5fad1f01ixkbz2.ringIdx or 0)) % #_x1ixkc4ac5fad3531ixkcsn) + 1)
      end
      local _m1ixkc4cc5fad3551ixkcst = _x1ixkc4ac5fad3531ixkcsn[_x1ixkbufc5fad1f01ixkbz2.ringIdx]
      local _1ixkc4dc5fad3561ixkcsw, __1ixkc4ec5fad3571ixkcsz
      do
        local _1ixkc4nc5fad3601ixkctq = 1
        _1ixkc4nc5fad3601ixkctq = (_1ixkc4nc5fad3601ixkctq + 0)
        for _x1ixkc4fc5fad3581ixkct2 = 0, 11 do
          local _z1ixkc4gc5fad3591ixkct5 = ((_x1ixkc4fc5fad3581ixkct2 * math.pi) / 6)
          local _m1ixkc4hc5fad35a1ixkct8 = (_m1ixkc3xc5fad3461ixkcrk + Vector3.new((math.cos(_z1ixkc4gc5fad3591ixkct5) * _m1ixkc4cc5fad3551ixkcst), 0, (math.sin(_z1ixkc4gc5fad3591ixkct5) * _m1ixkc4cc5fad3551ixkcst)))
          local _1ixkc4ic5fad35b1ixkctb = _x1ixkc3lc5fad33a1ixkcqk(_z1ixkc3wc5fad3451ixkcrh, _m1ixkc4hc5fad35a1ixkct8)
          do
            local _m1ixkc4mc5fad35f1ixkctn = 1
            _m1ixkc4mc5fad35f1ixkctn = (_m1ixkc4mc5fad35f1ixkctn + 0)
            if _1ixkc4ic5fad35b1ixkctb then
              do
                local _z1ixkc4lc5fad35e1ixkctk = 1
                _z1ixkc4lc5fad35e1ixkctk = (_z1ixkc4lc5fad35e1ixkctk + 0)
                if _x1ixkc1sc5fad2f91ixkcl5(_m1ixkc4hc5fad35a1ixkct8, _m1ixkc3xc5fad3461ixkcrk, 4) then
                  do
                    local __1ixkc4jc5fad35c1ixkcte = 1
                    __1ixkc4jc5fad35c1ixkcte = (__1ixkc4jc5fad35c1ixkcte + 0)
                    _m1ixkc42c5fad34b1ixkcrz, _x1ixkbufc5fad1f01ixkbz2.approach = _1ixkc4ic5fad35b1ixkctb, _m1ixkc4hc5fad35a1ixkct8
                  end
                  break
                elseif not _1ixkc4dc5fad3561ixkcsw then
                  do
                    local _x1ixkc4kc5fad35d1ixkcth = 1
                    _x1ixkc4kc5fad35d1ixkcth = (_x1ixkc4kc5fad35d1ixkcth + 0)
                    _1ixkc4dc5fad3561ixkcsw, __1ixkc4ec5fad3571ixkcsz = _1ixkc4ic5fad35b1ixkctb, _m1ixkc4hc5fad35a1ixkct8
                  end
                end
              end
            end
          end
        end
      end
      do
        local _x1ixkc4pc5fad3621ixkctw = 1
        _x1ixkc4pc5fad3621ixkctw = (_x1ixkc4pc5fad3621ixkctw + 0)
        if (not _m1ixkc42c5fad34b1ixkcrz and _1ixkc4dc5fad3561ixkcsw) then
          do
            local __1ixkc4oc5fad3611ixkctt = 1
            __1ixkc4oc5fad3611ixkctt = (__1ixkc4oc5fad3611ixkctt + 0)
            _m1ixkc42c5fad34b1ixkcrz, _x1ixkbufc5fad1f01ixkbz2.approach = _1ixkc4dc5fad3561ixkcsw, __1ixkc4ec5fad3571ixkcsz
          end
        end
      end
    end
  end
  do
    local _1ixkc4sc5fad3651ixkcu5 = 1
    _1ixkc4sc5fad3651ixkcu5 = (_1ixkc4sc5fad3651ixkcu5 + 0)
    if _m1ixkc42c5fad34b1ixkcrz then
      do
        local _m1ixkc4rc5fad3641ixkcu2 = 1
        _m1ixkc4rc5fad3641ixkcu2 = (_m1ixkc4rc5fad3641ixkcu2 + 0)
        _x1ixkbufc5fad1f01ixkbz2.wps, _x1ixkbufc5fad1f01ixkbz2.wpi = _m1ixkc42c5fad34b1ixkcrz, 2
      end
    end
  end
  do
    local __1ixkc4tc5fad3661ixkcu8 = 1
    __1ixkc4tc5fad3661ixkcu8 = (__1ixkc4tc5fad3661ixkcu8 + 0)
    pcall(_x1ixkc27c5fad3081ixkcme)
  end
  return (_m1ixkc42c5fad34b1ixkcrz ~= nil)
end
local function _x1ixkc4uc5fad3671ixkcub(_z1ixkc4vc5fad3681ixkcue, _m1ixkc4wc5fad3691ixkcuh)
  local _1ixkc4xc5fad36a1ixkcuk = _x1ixkbufc5fad1f01ixkbz2.wps
  local __1ixkc4yc5fad36b1ixkcun = math.clamp((Options.FarmWalk.Value * 0.12), 3, 6)
  do
    local _z1ixkc50c5fad36d1ixkcut = 1
    _z1ixkc50c5fad36d1ixkcut = (_z1ixkc50c5fad36d1ixkcut + 0)
    while ((_x1ixkbufc5fad1f01ixkbz2.wpi <= #_1ixkc4xc5fad36a1ixkcuk) and (_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc4vc5fad3681ixkcue, _1ixkc4xc5fad36a1ixkcuk[_x1ixkbufc5fad1f01ixkbz2.wpi].Position) < __1ixkc4yc5fad36b1ixkcun)) do
      do
        local _x1ixkc4zc5fad36c1ixkcuq = 1
        _x1ixkc4zc5fad36c1ixkcuq = (_x1ixkc4zc5fad36c1ixkcuq + 0)
        _x1ixkbufc5fad1f01ixkbz2.wpi += 1
      end
    end
  end
  do
    local _m1ixkc51c5fad36e1ixkcuw = 1
    _m1ixkc51c5fad36e1ixkcuw = (_m1ixkc51c5fad36e1ixkcuw + 0)
    if (_x1ixkbufc5fad1f01ixkbz2.wpi > #_1ixkc4xc5fad36a1ixkcuk) then
      return nil
    end
  end
  local _1ixkc52c5fad36f1ixkcuz = _1ixkc4xc5fad36a1ixkcuk[_x1ixkbufc5fad1f01ixkbz2.wpi].Position
  do
    local __1ixkc58c5fad3751ixkcvh = 1
    __1ixkc58c5fad3751ixkcvh = (__1ixkc58c5fad3751ixkcvh + 0)
    if (_m1ixkc4wc5fad3691ixkcuh and (_m1ixkc4wc5fad3691ixkcuh > 0)) then
      do
        local _1ixkc57c5fad3741ixkcve = 1
        _1ixkc57c5fad3741ixkcve = (_1ixkc57c5fad3741ixkcve + 0)
        for __1ixkc53c5fad3701ixkcv2 = math.min((_x1ixkbufc5fad1f01ixkbz2.wpi + _m1ixkc4wc5fad3691ixkcuh), #_1ixkc4xc5fad36a1ixkcuk), (_x1ixkbufc5fad1f01ixkbz2.wpi + 1), -1 do
          do
            local _m1ixkc56c5fad3731ixkcvb = 1
            _m1ixkc56c5fad3731ixkcvb = (_m1ixkc56c5fad3731ixkcvb + 0)
            if _x1ixkc1sc5fad2f91ixkcl5(_z1ixkc4vc5fad3681ixkcue, _1ixkc4xc5fad36a1ixkcuk[__1ixkc53c5fad3701ixkcv2].Position, 6) then
              do
                local _x1ixkc54c5fad3711ixkcv5 = 1
                _x1ixkc54c5fad3711ixkcv5 = (_x1ixkc54c5fad3711ixkcv5 + 0)
                _x1ixkbufc5fad1f01ixkbz2.wpi = __1ixkc53c5fad3701ixkcv2
              end
              do
                local _z1ixkc55c5fad3721ixkcv8 = 1
                _z1ixkc55c5fad3721ixkcv8 = (_z1ixkc55c5fad3721ixkcv8 + 0)
                _1ixkc52c5fad36f1ixkcuz = _1ixkc4xc5fad36a1ixkcuk[__1ixkc53c5fad3701ixkcv2].Position
              end
              break
            end
          end
        end
      end
    end
  end
  return _1ixkc52c5fad36f1ixkcuz
end
local _x1ixkc59c5fad3761ixkcvk = ((((type(_z1ixkbu6c5fad1e71ixkbyb.WALK_SPEED) == "number") and _z1ixkbu6c5fad1e71ixkbyb.WALK_SPEED)) or 10)
local function _z1ixkc5ac5fad3771ixkcvn()
  local _m1ixkc5bc5fad3781ixkcvq = _x1ixkbuac5fad1eb1ixkbyn()
  do
    local _x1ixkc5ec5fad37b1ixkcvz = 1
    _x1ixkc5ec5fad37b1ixkcvz = (_x1ixkc5ec5fad37b1ixkcvz + 0)
    if (_m1ixkc5bc5fad3781ixkcvq and (math.abs((_m1ixkc5bc5fad3781ixkcvq.WalkSpeed - _x1ixkc59c5fad3761ixkcvk)) > 0.5)) then
      do
        local __1ixkc5dc5fad37a1ixkcvw = 1
        __1ixkc5dc5fad37a1ixkcvw = (__1ixkc5dc5fad37a1ixkcvw + 0)
        pcall(function()
          do
            local _1ixkc5cc5fad3791ixkcvt = 1
            _1ixkc5cc5fad3791ixkcvt = (_1ixkc5cc5fad3791ixkcvt + 0)
            _m1ixkc5bc5fad3781ixkcvq.WalkSpeed = _x1ixkc59c5fad3761ixkcvk
          end
        end)
      end
    end
  end
end
local function _z1ixkc5fc5fad37c1ixkcw2(_m1ixkc5gc5fad37d1ixkcw5, _1ixkc5hc5fad37e1ixkcw8)
  local __1ixkc5ic5fad37f1ixkcwb, _x1ixkc5jc5fad3801ixkcwe = _x1ixkbuac5fad1eb1ixkbyn(), _1ixkbu8c5fad1e91ixkbyh()
  do
    local _z1ixkc5kc5fad3811ixkcwh = 1
    _z1ixkc5kc5fad3811ixkcwh = (_z1ixkc5kc5fad3811ixkcwh + 0)
    if not ((__1ixkc5ic5fad37f1ixkcwb and _x1ixkc5jc5fad3801ixkcwe)) then
      return
    end
  end
  local _m1ixkc5lc5fad3821ixkcwk = ((_x1ixkbufc5fad1f01ixkbz2.lastStuckPos and ((_x1ixkc5jc5fad3801ixkcwe.Position - _x1ixkbufc5fad1f01ixkbz2.lastStuckPos)).Magnitude) or 99)
  do
    local _1ixkc5mc5fad3831ixkcwn = 1
    _1ixkc5mc5fad3831ixkcwn = (_1ixkc5mc5fad3831ixkcwn + 0)
    _x1ixkbufc5fad1f01ixkbz2.lastStuckPos = _x1ixkc5jc5fad3801ixkcwe.Position
  end
  do
    local _m1ixkc5qc5fad3871ixkcwz = 1
    _m1ixkc5qc5fad3871ixkcwz = (_m1ixkc5qc5fad3871ixkcwz + 0)
    if (_m1ixkc5lc5fad3821ixkcwk < 0.12) then
      do
        local __1ixkc5nc5fad3841ixkcwq = 1
        __1ixkc5nc5fad3841ixkcwq = (__1ixkc5nc5fad3841ixkcwq + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckTime = (((_x1ixkbufc5fad1f01ixkbz2.stuckTime or 0)) + _1ixkc5hc5fad37e1ixkcw8)
      end
    else
      do
        local _x1ixkc5oc5fad3851ixkcwt = 1
        _x1ixkc5oc5fad3851ixkcwt = (_x1ixkc5oc5fad3851ixkcwt + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckTime = 0
      end
      do
        local _z1ixkc5pc5fad3861ixkcww = 1
        _z1ixkc5pc5fad3861ixkcww = (_z1ixkc5pc5fad3861ixkcww + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckStage = nil
      end
      return
    end
  end
  local _1ixkc5rc5fad3881ixkcx2 = _x1ixkbufc5fad1f01ixkbz2.stuckTime
  do
    local _z1ixkc6ec5fad39f1ixkcyz = 1
    _z1ixkc6ec5fad39f1ixkcyz = (_z1ixkc6ec5fad39f1ixkcyz + 0)
    if ((_1ixkc5rc5fad3881ixkcx2 > 2) and (_1ixkc5rc5fad3881ixkcx2 <= 5)) then
      do
        local __1ixkc5sc5fad3891ixkcx5 = 1
        __1ixkc5sc5fad3891ixkcx5 = (__1ixkc5sc5fad3891ixkcx5 + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckStage = "jumping"
      end
      do
        local _z1ixkc5uc5fad38b1ixkcxb = 1
        _z1ixkc5uc5fad38b1ixkcxb = (_z1ixkc5uc5fad38b1ixkcxb + 0)
        pcall(function()
          do
            local _x1ixkc5tc5fad38a1ixkcx8 = 1
            _x1ixkc5tc5fad38a1ixkcx8 = (_x1ixkc5tc5fad38a1ixkcx8 + 0)
            __1ixkc5ic5fad37f1ixkcwb.Jump = true
          end
        end)
      end
    elseif ((_1ixkc5rc5fad3881ixkcx2 > 5) and (_1ixkc5rc5fad3881ixkcx2 <= 9)) then
      do
        local _m1ixkc5vc5fad38c1ixkcxe = 1
        _m1ixkc5vc5fad38c1ixkcxe = (_m1ixkc5vc5fad38c1ixkcxe + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckStage = "hopping over"
      end
      do
        local _m1ixkc60c5fad3911ixkcxt = 1
        _m1ixkc60c5fad3911ixkcxt = (_m1ixkc60c5fad3911ixkcxt + 0)
        if (os.clock() > ((_x1ixkbufc5fad1f01ixkbz2.nextHop or 0))) then
          do
            local _1ixkc5wc5fad38d1ixkcxh = 1
            _1ixkc5wc5fad38d1ixkcxh = (_1ixkc5wc5fad38d1ixkcxh + 0)
            _x1ixkbufc5fad1f01ixkbz2.nextHop = (os.clock() + 1)
          end
          do
            local _z1ixkc5zc5fad3901ixkcxq = 1
            _z1ixkc5zc5fad3901ixkcxq = (_z1ixkc5zc5fad3901ixkcxq + 0)
            pcall(function()
              do
                local __1ixkc5xc5fad38e1ixkcxk = 1
                __1ixkc5xc5fad38e1ixkcxk = (__1ixkc5xc5fad38e1ixkcxk + 0)
                __1ixkc5ic5fad37f1ixkcwb.Jump = true
              end
              do
                local _x1ixkc5yc5fad38f1ixkcxn = 1
                _x1ixkc5yc5fad38f1ixkcxn = (_x1ixkc5yc5fad38f1ixkcxn + 0)
                _x1ixkc5jc5fad3801ixkcwe.AssemblyLinearVelocity = Vector3.new((_m1ixkc5gc5fad37d1ixkcw5.X * 28), 55, (_m1ixkc5gc5fad37d1ixkcw5.Z * 28))
              end
            end)
          end
        end
      end
    elseif ((_1ixkc5rc5fad3881ixkcx2 > 9) and (_1ixkc5rc5fad3881ixkcx2 <= 15)) then
      do
        local _1ixkc61c5fad3921ixkcxw = 1
        _1ixkc61c5fad3921ixkcxw = (_1ixkc61c5fad3921ixkcxw + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckStage = "going around"
      end
      do
        local _x1ixkc63c5fad3941ixkcy2 = 1
        _x1ixkc63c5fad3941ixkcy2 = (_x1ixkc63c5fad3941ixkcy2 + 0)
        pcall(function()
          do
            local __1ixkc62c5fad3931ixkcxz = 1
            __1ixkc62c5fad3931ixkcxz = (__1ixkc62c5fad3931ixkcxz + 0)
            __1ixkc5ic5fad37f1ixkcwb.Jump = true
          end
        end)
      end
      local _z1ixkc64c5fad3951ixkcy5 = Vector3.new(-_m1ixkc5gc5fad37d1ixkcw5.Z, 0, _m1ixkc5gc5fad37d1ixkcw5.X)
      do
        local _1ixkc66c5fad3971ixkcyb = 1
        _1ixkc66c5fad3971ixkcyb = (_1ixkc66c5fad3971ixkcyb + 0)
        if ((math.floor(_1ixkc5rc5fad3881ixkcx2) % 4) < 2) then
          do
            local _m1ixkc65c5fad3961ixkcy8 = 1
            _m1ixkc65c5fad3961ixkcy8 = (_m1ixkc65c5fad3961ixkcy8 + 0)
            _z1ixkc64c5fad3951ixkcy5 = -_z1ixkc64c5fad3951ixkcy5
          end
        end
      end
      do
        local _x1ixkc68c5fad3991ixkcyh = 1
        _x1ixkc68c5fad3991ixkcyh = (_x1ixkc68c5fad3991ixkcyh + 0)
        pcall(function()
          do
            local __1ixkc67c5fad3981ixkcye = 1
            __1ixkc67c5fad3981ixkcye = (__1ixkc67c5fad3981ixkcye + 0)
            __1ixkc5ic5fad37f1ixkcwb:MoveTo(((_x1ixkc5jc5fad3801ixkcwe.Position + (_z1ixkc64c5fad3951ixkcy5 * 8)) - (_m1ixkc5gc5fad37d1ixkcw5 * 2)))
          end
        end)
      end
      return true
    elseif (_1ixkc5rc5fad3881ixkcx2 > 15) then
      do
        local _z1ixkc69c5fad39a1ixkcyk = 1
        _z1ixkc69c5fad39a1ixkcyk = (_z1ixkc69c5fad39a1ixkcyk + 0)
        _x1ixkbufc5fad1f01ixkbz2.stuckStage = "reset"
      end
      do
        local _x1ixkc6dc5fad39e1ixkcyw = 1
        _x1ixkc6dc5fad39e1ixkcyw = (_x1ixkc6dc5fad39e1ixkcyw + 0)
        if Toggles.FarmAutoReset.Value then
          do
            local _m1ixkc6ac5fad39b1ixkcyn = 1
            _m1ixkc6ac5fad39b1ixkcyn = (_m1ixkc6ac5fad39b1ixkcyn + 0)
            _x1ixkbufc5fad1f01ixkbz2.stuckTime = 0
          end
          do
            local __1ixkc6cc5fad39d1ixkcyt = 1
            __1ixkc6cc5fad39d1ixkcyt = (__1ixkc6cc5fad39d1ixkcyt + 0)
            pcall(function()
              do
                local _1ixkc6bc5fad39c1ixkcyq = 1
                _1ixkc6bc5fad39c1ixkcyq = (_1ixkc6bc5fad39c1ixkcyq + 0)
                __1ixkc5ic5fad37f1ixkcwb.Health = 0
              end
            end)
          end
        end
      end
    end
  end
  return false
end
local function _m1ixkc6fc5fad3a01ixkcz2(_1ixkc6gc5fad3a11ixkcz5)
  local __1ixkc6hc5fad3a21ixkcz8 = _x1ixkbuac5fad1eb1ixkbyn()
  do
    local _x1ixkc6ic5fad3a31ixkczb = 1
    _x1ixkc6ic5fad3a31ixkczb = (_x1ixkc6ic5fad3a31ixkczb + 0)
    if not __1ixkc6hc5fad3a21ixkcz8 then
      return
    end
  end
  local _z1ixkc6jc5fad3a41ixkcze = Options.FarmWalk.Value
  do
    local __1ixkc6mc5fad3a71ixkczn = 1
    __1ixkc6mc5fad3a71ixkczn = (__1ixkc6mc5fad3a71ixkczn + 0)
    if (math.abs((__1ixkc6hc5fad3a21ixkcz8.WalkSpeed - _z1ixkc6jc5fad3a41ixkcze)) > 0.5) then
      do
        local _1ixkc6lc5fad3a61ixkczk = 1
        _1ixkc6lc5fad3a61ixkczk = (_1ixkc6lc5fad3a61ixkczk + 0)
        pcall(function()
          do
            local _m1ixkc6kc5fad3a51ixkczh = 1
            _m1ixkc6kc5fad3a51ixkczh = (_m1ixkc6kc5fad3a51ixkczh + 0)
            __1ixkc6hc5fad3a21ixkcz8.WalkSpeed = _z1ixkc6jc5fad3a41ixkcze
          end
        end)
      end
    end
  end
  do
    local _z1ixkc6oc5fad3a91ixkczt = 1
    _z1ixkc6oc5fad3a91ixkczt = (_z1ixkc6oc5fad3a91ixkczt + 0)
    pcall(function()
      do
        local _x1ixkc6nc5fad3a81ixkczq = 1
        _x1ixkc6nc5fad3a81ixkczq = (_x1ixkc6nc5fad3a81ixkczq + 0)
        __1ixkc6hc5fad3a21ixkcz8:MoveTo(_1ixkc6gc5fad3a11ixkcz5)
      end
    end)
  end
end
local function _m1ixkc6pc5fad3aa1ixkczw(_1ixkc6qc5fad3ab1ixkczz)
  local __1ixkc6rc5fad3ac1ixkd02 = __1ixkc17c5fad2e41ixkcje()
  local _x1ixkc6sc5fad3ad1ixkd05 = (__1ixkc6rc5fad3ac1ixkd02 and __1ixkc6rc5fad3ac1ixkd02:FindFirstChild("Chassis"))
  do
    local _z1ixkc6tc5fad3ae1ixkd08 = 1
    _z1ixkc6tc5fad3ae1ixkd08 = (_z1ixkc6tc5fad3ae1ixkd08 + 0)
    if not _x1ixkc6sc5fad3ad1ixkd05 then
      return
    end
  end
  local _m1ixkc6uc5fad3af1ixkd0b = _x1ixkc6sc5fad3ad1ixkd05.CFrame
  local _1ixkc6vc5fad3b01ixkd0e = (_1ixkc6qc5fad3ab1ixkczz - _m1ixkc6uc5fad3af1ixkd0b.Position)
  local __1ixkc6wc5fad3b11ixkd0h = Vector3.new(_1ixkc6vc5fad3b01ixkd0e.X, 0, _1ixkc6vc5fad3b01ixkd0e.Z)
  do
    local _z1ixkc6yc5fad3b31ixkd0n = 1
    _z1ixkc6yc5fad3b31ixkd0n = (_z1ixkc6yc5fad3b31ixkd0n + 0)
    if (__1ixkc6wc5fad3b11ixkd0h.Magnitude < 0.5) then
      do
        local _x1ixkc6xc5fad3b21ixkd0k = 1
        _x1ixkc6xc5fad3b21ixkd0k = (_x1ixkc6xc5fad3b21ixkd0k + 0)
        _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.W, false)
      end
      return
    end
  end
  local _m1ixkc6zc5fad3b41ixkd0q = __1ixkc6wc5fad3b11ixkd0h.Unit
  local _1ixkc70c5fad3b51ixkd0t = Vector3.new(_m1ixkc6uc5fad3af1ixkd0b.LookVector.X, 0, _m1ixkc6uc5fad3af1ixkd0b.LookVector.Z)
  do
    local __1ixkc71c5fad3b61ixkd0w = 1
    __1ixkc71c5fad3b61ixkd0w = (__1ixkc71c5fad3b61ixkd0w + 0)
    if (_1ixkc70c5fad3b51ixkd0t.Magnitude < 0.01) then
      return
    end
  end
  do
    local _x1ixkc72c5fad3b71ixkd0z = 1
    _x1ixkc72c5fad3b71ixkd0z = (_x1ixkc72c5fad3b71ixkd0z + 0)
    _1ixkc70c5fad3b51ixkd0t = _1ixkc70c5fad3b51ixkd0t.Unit
  end
  local _z1ixkc73c5fad3b81ixkd12 = math.deg(math.acos(math.clamp(_1ixkc70c5fad3b51ixkd0t:Dot(_m1ixkc6zc5fad3b41ixkd0q), -1, 1)))
  local _m1ixkc74c5fad3b91ixkd15 = _1ixkc70c5fad3b51ixkd0t:Cross(_m1ixkc6zc5fad3b41ixkd0q).Y
  do
    local _1ixkc75c5fad3ba1ixkd18 = 1
    _1ixkc75c5fad3ba1ixkd18 = (_1ixkc75c5fad3ba1ixkd18 + 0)
    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.A, ((_z1ixkc73c5fad3b81ixkd12 > 5) and (_m1ixkc74c5fad3b91ixkd15 > 0)))
  end
  do
    local __1ixkc76c5fad3bb1ixkd1b = 1
    __1ixkc76c5fad3bb1ixkd1b = (__1ixkc76c5fad3bb1ixkd1b + 0)
    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.D, ((_z1ixkc73c5fad3b81ixkd12 > 5) and (_m1ixkc74c5fad3b91ixkd15 < 0)))
  end
  local _x1ixkc77c5fad3bc1ixkd1e = __1ixkbu4c5fad1e51ixkby5.studs_per_second_to_miles_per_hour(_x1ixkc6sc5fad3ad1ixkd05.AssemblyLinearVelocity.Magnitude)
  local _z1ixkc78c5fad3bd1ixkd1h = Options.FarmMph.Value
  do
    local __1ixkc7bc5fad3c01ixkd1q = 1
    __1ixkc7bc5fad3c01ixkd1q = (__1ixkc7bc5fad3c01ixkd1q + 0)
    if (_z1ixkc73c5fad3b81ixkd12 > 100) then
      do
        local _m1ixkc79c5fad3be1ixkd1k = 1
        _m1ixkc79c5fad3be1ixkd1k = (_m1ixkc79c5fad3be1ixkd1k + 0)
        _z1ixkc78c5fad3bd1ixkd1h = math.min(_z1ixkc78c5fad3bd1ixkd1h, 7)
      end
    elseif (_z1ixkc73c5fad3b81ixkd12 > 45) then
      do
        local _1ixkc7ac5fad3bf1ixkd1n = 1
        _1ixkc7ac5fad3bf1ixkd1n = (_1ixkc7ac5fad3bf1ixkd1n + 0)
        _z1ixkc78c5fad3bd1ixkd1h = math.min(_z1ixkc78c5fad3bd1ixkd1h, 14)
      end
    end
  end
  do
    local __1ixkc7gc5fad3c51ixkd25 = 1
    __1ixkc7gc5fad3c51ixkd25 = (__1ixkc7gc5fad3c51ixkd25 + 0)
    if (_x1ixkbufc5fad1f01ixkbz2.stuckFor > 2.5) then
      do
        local _x1ixkc7cc5fad3c11ixkd1t = 1
        _x1ixkc7cc5fad3c11ixkd1t = (_x1ixkc7cc5fad3c11ixkd1t + 0)
        _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.W, false)
      end
      do
        local _z1ixkc7dc5fad3c21ixkd1w = 1
        _z1ixkc7dc5fad3c21ixkd1w = (_z1ixkc7dc5fad3c21ixkd1w + 0)
        _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.S, true)
      end
      do
        local _1ixkc7fc5fad3c41ixkd22 = 1
        _1ixkc7fc5fad3c41ixkd22 = (_1ixkc7fc5fad3c41ixkd22 + 0)
        if (_x1ixkbufc5fad1f01ixkbz2.stuckFor > 4) then
          do
            local _m1ixkc7ec5fad3c31ixkd1z = 1
            _m1ixkc7ec5fad3c31ixkd1z = (_m1ixkc7ec5fad3c31ixkd1z + 0)
            _x1ixkbufc5fad1f01ixkbz2.stuckFor = 0
          end
        end
      end
      return
    end
  end
  do
    local _x1ixkc7hc5fad3c61ixkd28 = 1
    _x1ixkc7hc5fad3c61ixkd28 = (_x1ixkc7hc5fad3c61ixkd28 + 0)
    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.S, false)
  end
  do
    local _z1ixkc7ic5fad3c71ixkd2b = 1
    _z1ixkc7ic5fad3c71ixkd2b = (_z1ixkc7ic5fad3c71ixkd2b + 0)
    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.W, (_x1ixkc77c5fad3bc1ixkd1e < _z1ixkc78c5fad3bd1ixkd1h))
  end
end
local function _m1ixkc7jc5fad3c81ixkd2e(_1ixkc7kc5fad3c91ixkd2h, __1ixkc7lc5fad3ca1ixkd2k)
  local _x1ixkc7mc5fad3cb1ixkd2n = __1ixkc17c5fad2e41ixkcje()
  do
    local _z1ixkc7nc5fad3cc1ixkd2q = 1
    _z1ixkc7nc5fad3cc1ixkd2q = (_z1ixkc7nc5fad3cc1ixkd2q + 0)
    if not _x1ixkc7mc5fad3cb1ixkd2n then
      return
    end
  end
  local _m1ixkc7oc5fad3cd1ixkd2t = _x1ixkc7mc5fad3cb1ixkd2n:FindFirstChild("Chassis")
  local _1ixkc7pc5fad3ce1ixkd2w = _x1ixkc7mc5fad3cb1ixkd2n:GetPivot()
  local __1ixkc7qc5fad3cf1ixkd2z = (_1ixkc7kc5fad3c91ixkd2h - _1ixkc7pc5fad3ce1ixkd2w.Position)
  local _x1ixkc7rc5fad3d01ixkd32 = Vector3.new(__1ixkc7qc5fad3cf1ixkd2z.X, 0, __1ixkc7qc5fad3cf1ixkd2z.Z)
  do
    local _z1ixkc7sc5fad3d11ixkd35 = 1
    _z1ixkc7sc5fad3d11ixkd35 = (_z1ixkc7sc5fad3d11ixkd35 + 0)
    if (_x1ixkc7rc5fad3d01ixkd32.Magnitude < 0.3) then
      return
    end
  end
  local _m1ixkc7tc5fad3d21ixkd38 = _x1ixkc7rc5fad3d01ixkd32.Unit
  local _1ixkc7uc5fad3d31ixkd3b = __1ixkbu4c5fad1e51ixkby5.miles_per_hour_to_studs_per_second(Options.FarmMph.Value)
  local __1ixkc7vc5fad3d41ixkd3e = (_1ixkc7pc5fad3ce1ixkd2w.Position + (_m1ixkc7tc5fad3d21ixkd38 * math.min((_1ixkc7uc5fad3d31ixkd3b * __1ixkc7lc5fad3ca1ixkd2k), _x1ixkc7rc5fad3d01ixkd32.Magnitude)))
  local _x1ixkc7wc5fad3d51ixkd3h = RaycastParams.new()
  do
    local _z1ixkc7xc5fad3d61ixkd3k = 1
    _z1ixkc7xc5fad3d61ixkd3k = (_z1ixkc7xc5fad3d61ixkd3k + 0)
    _x1ixkc7wc5fad3d51ixkd3h.FilterType = Enum.RaycastFilterType.Exclude
  end
  do
    local _m1ixkc7yc5fad3d71ixkd3n = 1
    _m1ixkc7yc5fad3d71ixkd3n = (_m1ixkc7yc5fad3d71ixkd3n + 0)
    _x1ixkc7wc5fad3d51ixkd3h.FilterDescendantsInstances = {_x1ixkc7mc5fad3cb1ixkd2n, _m1ixkbu7c5fad1e81ixkbye(), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Characters"), _x1ixkbtqc5fad1d71ixkbwz:FindFirstChild("Effects")}
  end
  local _1ixkc7zc5fad3d81ixkd3q = Options.FarmHover.Value
  local __1ixkc80c5fad3d91ixkd3t = _x1ixkbtqc5fad1d71ixkbwz:Raycast((__1ixkc7vc5fad3d41ixkd3e + Vector3.new(0, 25, 0)), Vector3.new(0, -120, 0), _x1ixkc7wc5fad3d51ixkd3h)
  local _x1ixkc81c5fad3da1ixkd3w = ((__1ixkc80c5fad3d91ixkd3t and ((__1ixkc80c5fad3d91ixkd3t.Position.Y + _1ixkc7zc5fad3d81ixkd3q))) or _1ixkc7pc5fad3ce1ixkd2w.Position.Y)
  local _z1ixkc82c5fad3db1ixkd3z, _m1ixkc83c5fad3dc1ixkd42 = 0, false
  local _1ixkc84c5fad3dd1ixkd45 = (Vector3.new(_m1ixkc7tc5fad3d21ixkd38.X, 0, _m1ixkc7tc5fad3d21ixkd38.Z) * 14)
  do
    local _z1ixkc8cc5fad3e51ixkd4t = 1
    _z1ixkc8cc5fad3e51ixkd4t = (_z1ixkc8cc5fad3e51ixkd4t + 0)
    for __1ixkc85c5fad3de1ixkd48, _x1ixkc86c5fad3df1ixkd4b in ipairs({0, 5, 10, 16, 24, 34}) do
      local _z1ixkc87c5fad3e01ixkd4e, _m1ixkc88c5fad3e11ixkd4h = pcall(function()
        return _x1ixkbtqc5fad1d71ixkbwz:Blockcast(CFrame.new(Vector3.new(__1ixkc7vc5fad3d41ixkd3e.X, (_x1ixkc81c5fad3da1ixkd3w + _x1ixkc86c5fad3df1ixkd4b), __1ixkc7vc5fad3d41ixkd3e.Z)), Vector3.new(7, 5, 2), _1ixkc84c5fad3dd1ixkd45, _x1ixkc7wc5fad3d51ixkd3h)
      end)
      do
        local _1ixkc89c5fad3e21ixkd4k = 1
        _1ixkc89c5fad3e21ixkd4k = (_1ixkc89c5fad3e21ixkd4k + 0)
        if not _z1ixkc87c5fad3e01ixkd4e then
          break
        end
      end
      do
        local _x1ixkc8bc5fad3e41ixkd4q = 1
        _x1ixkc8bc5fad3e41ixkd4q = (_x1ixkc8bc5fad3e41ixkd4q + 0)
        if (_m1ixkc88c5fad3e11ixkd4h == nil) then
          do
            local __1ixkc8ac5fad3e31ixkd4n = 1
            __1ixkc8ac5fad3e31ixkd4n = (__1ixkc8ac5fad3e31ixkd4n + 0)
            _z1ixkc82c5fad3db1ixkd3z, _m1ixkc83c5fad3dc1ixkd42 = _x1ixkc86c5fad3df1ixkd4b, true
          end
          break
        end
      end
    end
  end
  do
    local _1ixkc8ec5fad3e71ixkd4z = 1
    _1ixkc8ec5fad3e71ixkd4z = (_1ixkc8ec5fad3e71ixkd4z + 0)
    if not _m1ixkc83c5fad3dc1ixkd42 then
      do
        local _m1ixkc8dc5fad3e61ixkd4w = 1
        _m1ixkc8dc5fad3e61ixkd4w = (_m1ixkc8dc5fad3e61ixkd4w + 0)
        _z1ixkc82c5fad3db1ixkd3z = 0
      end
    end
  end
  local __1ixkc8fc5fad3e81ixkd52 = (_x1ixkbufc5fad1f01ixkbz2.slideLift or 0)
  do
    local _x1ixkc8gc5fad3e91ixkd55 = 1
    _x1ixkc8gc5fad3e91ixkd55 = (_x1ixkc8gc5fad3e91ixkd55 + 0)
    _x1ixkbufc5fad1f01ixkbz2.slideLift = ((((_z1ixkc82c5fad3db1ixkd3z > __1ixkc8fc5fad3e81ixkd52)) and _z1ixkc82c5fad3db1ixkd3z) or ((__1ixkc8fc5fad3e81ixkd52 + (((_z1ixkc82c5fad3db1ixkd3z - __1ixkc8fc5fad3e81ixkd52)) * math.min((__1ixkc7lc5fad3ca1ixkd2k * 1.5), 1)))))
  end
  do
    local _z1ixkc8hc5fad3ea1ixkd58 = 1
    _z1ixkc8hc5fad3ea1ixkd58 = (_z1ixkc8hc5fad3ea1ixkd58 + 0)
    _x1ixkc81c5fad3da1ixkd3w = (_x1ixkc81c5fad3da1ixkd3w + _x1ixkbufc5fad1f01ixkbz2.slideLift)
  end
  local _m1ixkc8ic5fad3eb1ixkd5b = (_1ixkc7pc5fad3ce1ixkd2w.Position.Y + (((_x1ixkc81c5fad3da1ixkd3w - _1ixkc7pc5fad3ce1ixkd2w.Position.Y)) * math.min((__1ixkc7lc5fad3ca1ixkd2k * 8), 1)))
  do
    local _1ixkc8jc5fad3ec1ixkd5e = 1
    _1ixkc8jc5fad3ec1ixkd5e = (_1ixkc8jc5fad3ec1ixkd5e + 0)
    __1ixkc7vc5fad3d41ixkd3e = Vector3.new(__1ixkc7vc5fad3d41ixkd3e.X, _m1ixkc8ic5fad3eb1ixkd5b, __1ixkc7vc5fad3d41ixkd3e.Z)
  end
  local __1ixkc8kc5fad3ed1ixkd5h = CFrame.lookAt(Vector3.zero, _m1ixkc7tc5fad3d21ixkd38).Rotation
  local _x1ixkc8lc5fad3ee1ixkd5k = _1ixkc7pc5fad3ce1ixkd2w.Rotation:Lerp(__1ixkc8kc5fad3ed1ixkd5h, math.min((__1ixkc7lc5fad3ca1ixkd2k * 8), 1))
  do
    local _x1ixkc8qc5fad3f31ixkd5z = 1
    _x1ixkc8qc5fad3f31ixkd5z = (_x1ixkc8qc5fad3f31ixkd5z + 0)
    pcall(function()
      do
        local _z1ixkc8mc5fad3ef1ixkd5n = 1
        _z1ixkc8mc5fad3ef1ixkd5n = (_z1ixkc8mc5fad3ef1ixkd5n + 0)
        _x1ixkc7mc5fad3cb1ixkd2n:PivotTo((CFrame.new(__1ixkc7vc5fad3d41ixkd3e) * _x1ixkc8lc5fad3ee1ixkd5k))
      end
      do
        local __1ixkc8pc5fad3f21ixkd5w = 1
        __1ixkc8pc5fad3f21ixkd5w = (__1ixkc8pc5fad3f21ixkd5w + 0)
        if _m1ixkc7oc5fad3cd1ixkd2t then
          do
            local _m1ixkc8nc5fad3f01ixkd5q = 1
            _m1ixkc8nc5fad3f01ixkd5q = (_m1ixkc8nc5fad3f01ixkd5q + 0)
            _m1ixkc7oc5fad3cd1ixkd2t.AssemblyLinearVelocity = Vector3.zero
          end
          do
            local _1ixkc8oc5fad3f11ixkd5t = 1
            _1ixkc8oc5fad3f11ixkd5t = (_1ixkc8oc5fad3f11ixkd5t + 0)
            _m1ixkc7oc5fad3cd1ixkd2t.AssemblyAngularVelocity = Vector3.zero
          end
        end
      end
    end)
  end
end
local function _z1ixkc8rc5fad3f41ixkd62(_m1ixkc8sc5fad3f51ixkd65)
  local _1ixkc8tc5fad3f61ixkd68 = _1ixkbu8c5fad1e91ixkbyh()
  do
    local _x1ixkc8vc5fad3f81ixkd6e = 1
    _x1ixkc8vc5fad3f81ixkd6e = (_x1ixkc8vc5fad3f81ixkd6e + 0)
    if not _1ixkc8tc5fad3f61ixkd68 then
      do
        local __1ixkc8uc5fad3f71ixkd6b = 1
        __1ixkc8uc5fad3f71ixkd6b = (__1ixkc8uc5fad3f71ixkd6b + 0)
        _x1ixkbufc5fad1f01ixkbz2.note = "no character"
      end
      return
    end
  end
  local _z1ixkc8wc5fad3f91ixkd6h = _1ixkc8tc5fad3f61ixkd68.Position
  do
    local _m1ixkc8xc5fad3fa1ixkd6k = 1
    _m1ixkc8xc5fad3fa1ixkd6k = (_m1ixkc8xc5fad3fa1ixkd6k + 0)
    _x1ixkbufc5fad1f01ixkbz2.noBike = false
  end
  local _1ixkc8yc5fad3fb1ixkd6n = (_1ixkbzic5fad2a71ixkceb() < 1)
  local __1ixkc8zc5fad3fc1ixkd6q, _x1ixkc90c5fad3fd1ixkd6t, _z1ixkc91c5fad3fe1ixkd6w
  do
    local __1ixkc99c5fad4061ixkd7k = 1
    __1ixkc99c5fad4061ixkd7k = (__1ixkc99c5fad4061ixkd7k + 0)
    if not _m1ixkbync5fad2881ixkcbq() then
      do
        local _m1ixkc92c5fad3ff1ixkd6z = 1
        _m1ixkc92c5fad3ff1ixkd6z = (_m1ixkc92c5fad3ff1ixkd6z + 0)
        __1ixkc8zc5fad3fc1ixkd6q, _x1ixkc90c5fad3fd1ixkd6t, _z1ixkc91c5fad3fe1ixkd6w = __1ixkbypc5fad28a1ixkcbw(), "the job board", "apply"
      end
      do
        local _1ixkc93c5fad4001ixkd72 = 1
        _1ixkc93c5fad4001ixkd72 = (_1ixkc93c5fad4001ixkd72 + 0)
        _x1ixkbufc5fad1f01ixkbz2.stage = "get the job"
      end
    elseif _1ixkc8yc5fad3fb1ixkd6n then
      do
        local __1ixkc94c5fad4011ixkd75 = 1
        __1ixkc94c5fad4011ixkd75 = (__1ixkc94c5fad4011ixkd75 + 0)
        __1ixkc8zc5fad3fc1ixkd6q, _x1ixkc90c5fad3fd1ixkd6t, _z1ixkc91c5fad3fe1ixkd6w = _z1ixkbzlc5fad2aa1ixkcek(), "the shop", "collect"
      end
      do
        local _x1ixkc95c5fad4021ixkd78 = 1
        _x1ixkc95c5fad4021ixkd78 = (_x1ixkc95c5fad4021ixkd78 + 0)
        _x1ixkbufc5fad1f01ixkbz2.stage = "collect"
      end
    else
      do
        local _z1ixkc96c5fad4031ixkd7b = 1
        _z1ixkc96c5fad4031ixkd7b = (_z1ixkc96c5fad4031ixkd7b + 0)
        __1ixkc8zc5fad3fc1ixkd6q, _x1ixkc90c5fad3fd1ixkd6t = _1ixkbznc5fad2ac1ixkceq()
      end
      do
        local _m1ixkc97c5fad4041ixkd7e = 1
        _m1ixkc97c5fad4041ixkd7e = (_m1ixkc97c5fad4041ixkd7e + 0)
        _z1ixkc91c5fad3fe1ixkd6w = "deliver"
      end
      do
        local _1ixkc98c5fad4051ixkd7h = 1
        _1ixkc98c5fad4051ixkd7h = (_1ixkc98c5fad4051ixkd7h + 0)
        _x1ixkbufc5fad1f01ixkbz2.stage = "deliver"
      end
    end
  end
  do
    local _z1ixkc9bc5fad4081ixkd7q = 1
    _z1ixkc9bc5fad4081ixkd7q = (_z1ixkc9bc5fad4081ixkd7q + 0)
    if not __1ixkc8zc5fad3fc1ixkd6q then
      do
        local _x1ixkc9ac5fad4071ixkd7n = 1
        _x1ixkc9ac5fad4071ixkd7n = (_x1ixkc9ac5fad4071ixkd7n + 0)
        _x1ixkbufc5fad1f01ixkbz2.note = "waiting for an order"
      end
      return
    end
  end
  local _m1ixkc9cc5fad4091ixkd7t = (((_x1ixkbufc5fad1f01ixkbz2.stage == "collect") or (_x1ixkbufc5fad1f01ixkbz2.stage == "get the job")))
  local _1ixkc9dc5fad40a1ixkd7w = (_x1ixkbufc5fad1f01ixkbz2.forceDoor and (os.clock() < _x1ixkbufc5fad1f01ixkbz2.forceDoor))
  do
    local _x1ixkc9fc5fad40c1ixkd82 = 1
    _x1ixkc9fc5fad40c1ixkd82 = (_x1ixkc9fc5fad40c1ixkd82 + 0)
    if (_1ixkc9dc5fad40a1ixkd7w and (_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, _m1ixkbysc5fad28d1ixkcc5) < 8)) then
      do
        local __1ixkc9ec5fad40b1ixkd7z = 1
        __1ixkc9ec5fad40b1ixkd7z = (__1ixkc9ec5fad40b1ixkd7z + 0)
        _x1ixkbufc5fad1f01ixkbz2.forceDoor, _1ixkc9dc5fad40a1ixkd7w = nil, false
      end
    end
  end
  do
    local _x1ixkc9kc5fad4111ixkd8h = 1
    _x1ixkc9kc5fad4111ixkd8h = (_x1ixkc9kc5fad4111ixkd8h + 0)
    if (_m1ixkc9cc5fad4091ixkd7t and ((_1ixkc9dc5fad40a1ixkd7w or (_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, __1ixkc8zc5fad3fc1ixkd6q) > 40)))) then
      do
        local _z1ixkc9gc5fad40d1ixkd85 = 1
        _z1ixkc9gc5fad40d1ixkd85 = (_z1ixkc9gc5fad40d1ixkd85 + 0)
        _x1ixkbufc5fad1f01ixkbz2.doorHint = _m1ixkbysc5fad28d1ixkcc5
      end
    else
      do
        local _m1ixkc9hc5fad40e1ixkd88 = 1
        _m1ixkc9hc5fad40e1ixkd88 = (_m1ixkc9hc5fad40e1ixkd88 + 0)
        _x1ixkbufc5fad1f01ixkbz2.doorHint = nil
      end
      do
        local __1ixkc9jc5fad4101ixkd8e = 1
        __1ixkc9jc5fad4101ixkd8e = (__1ixkc9jc5fad4101ixkd8e + 0)
        if (_x1ixkbufc5fad1f01ixkbz2.approach == _m1ixkbysc5fad28d1ixkcc5) then
          do
            local _1ixkc9ic5fad40f1ixkd8b = 1
            _1ixkc9ic5fad40f1ixkd8b = (_1ixkc9ic5fad40f1ixkd8b + 0)
            _x1ixkbufc5fad1f01ixkbz2.approach = nil
          end
        end
      end
    end
  end
  local _z1ixkc9lc5fad4121ixkd8k = Options.FarmMode.Value
  local _m1ixkc9mc5fad4131ixkd8n = (_z1ixkc9lc5fad4121ixkd8k == "Walk")
  local _1ixkc9nc5fad4141ixkd8q = __1ixkc17c5fad2e41ixkcje()
  local __1ixkc9oc5fad4151ixkd8t = (((_1ixkc9nc5fad4141ixkd8q ~= nil)) or ((_1ixkbu3c5fad1e41ixkby2.player_is_sitting.get() == true)))
  local _x1ixkc9pc5fad4161ixkd8w, _z1ixkc9qc5fad4171ixkd8z = __1ixkc8zc5fad3fc1ixkd6q, Options.FarmArrive.Value
  do
    local _m1ixkca1c5fad4221ixkd9w = 1
    _m1ixkca1c5fad4221ixkd9w = (_m1ixkca1c5fad4221ixkd9w + 0)
    if ((not _m1ixkc9mc5fad4131ixkd8n and not __1ixkc9oc5fad4151ixkd8t) and (_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, __1ixkc8zc5fad3fc1ixkd6q) > 60)) then
      local _m1ixkc9rc5fad4181ixkd92 = _1ixkc02c5fad2bb1ixkcfz(_z1ixkc8wc5fad3f91ixkd6h)
      do
        local _z1ixkca0c5fad4211ixkd9t = 1
        _z1ixkca0c5fad4211ixkd9t = (_z1ixkca0c5fad4211ixkd9t + 0)
        if _m1ixkc9rc5fad4181ixkd92 then
          local _1ixkc9sc5fad4191ixkd95 = __1ixkc0ic5fad2cb1ixkchb(_m1ixkc9rc5fad4181ixkd92)
          do
            local __1ixkc9tc5fad41a1ixkd98 = 1
            __1ixkc9tc5fad41a1ixkd98 = (__1ixkc9tc5fad41a1ixkd98 + 0)
            _x1ixkc9pc5fad4161ixkd8w = _x1ixkc0tc5fad2d61ixkci8(_m1ixkc9rc5fad4181ixkd92, _1ixkc9sc5fad4191ixkd95, _z1ixkc8wc5fad3f91ixkd6h)
          end
          do
            local _x1ixkc9uc5fad41b1ixkd9b = 1
            _x1ixkc9uc5fad41b1ixkd9b = (_x1ixkc9uc5fad41b1ixkd9b + 0)
            _z1ixkc9qc5fad4171ixkd8z = 8
          end
          do
            local _z1ixkc9vc5fad41c1ixkd9e = 1
            _z1ixkc9vc5fad41c1ixkd9e = (_z1ixkc9vc5fad41c1ixkd9e + 0)
            _x1ixkc90c5fad3fd1ixkd6t = ("your " .. _m1ixkc9rc5fad4181ixkd92.Name)
          end
          do
            local _m1ixkc9wc5fad41d1ixkd9h = 1
            _m1ixkc9wc5fad41d1ixkd9h = (_m1ixkc9wc5fad41d1ixkd9h + 0)
            _z1ixkc91c5fad3fe1ixkd6w = {"driv", "sit", "ride", "enter", "mount"}
          end
          do
            local _1ixkc9xc5fad41e1ixkd9k = 1
            _1ixkc9xc5fad41e1ixkd9k = (_1ixkc9xc5fad41e1ixkd9k + 0)
            _x1ixkbufc5fad1f01ixkbz2.stage = "board"
          end
        else
          do
            local __1ixkc9yc5fad41f1ixkd9n = 1
            __1ixkc9yc5fad41f1ixkd9n = (__1ixkc9yc5fad41f1ixkd9n + 0)
            _x1ixkbufc5fad1f01ixkbz2.noBike = true
          end
          do
            local _x1ixkc9zc5fad4201ixkd9q = 1
            _x1ixkc9zc5fad4201ixkd9q = (_x1ixkc9zc5fad4201ixkd9q + 0)
            _m1ixkc9mc5fad4131ixkd8n = true
          end
        end
      end
    end
  end
  local _1ixkca2c5fad4231ixkd9z = ((not _x1ixkbufc5fad1f01ixkbz2.goal) or (((_x1ixkbufc5fad1f01ixkbz2.goal - _x1ixkc9pc5fad4161ixkd8w)).Magnitude > 6))
  do
    local _1ixkca7c5fad4281ixkdae = 1
    _1ixkca7c5fad4281ixkdae = (_1ixkca7c5fad4281ixkdae + 0)
    if ((_1ixkca2c5fad4231ixkd9z or (_x1ixkbufc5fad1f01ixkbz2.wpi > #_x1ixkbufc5fad1f01ixkbz2.wps)) or (((os.clock() - _x1ixkbufc5fad1f01ixkbz2.lastPath)) > 12)) then
      do
        local _x1ixkca4c5fad4251ixkda5 = 1
        _x1ixkca4c5fad4251ixkda5 = (_x1ixkca4c5fad4251ixkda5 + 0)
        if _1ixkca2c5fad4231ixkd9z then
          do
            local __1ixkca3c5fad4241ixkda2 = 1
            __1ixkca3c5fad4241ixkda2 = (__1ixkca3c5fad4241ixkda2 + 0)
            _x1ixkbufc5fad1f01ixkbz2.approach = nil
          end
        end
      end
      do
        local _z1ixkca5c5fad4261ixkda8 = 1
        _z1ixkca5c5fad4261ixkda8 = (_z1ixkca5c5fad4261ixkda8 + 0)
        _x1ixkbufc5fad1f01ixkbz2.goal = _x1ixkc9pc5fad4161ixkd8w
      end
      do
        local _m1ixkca6c5fad4271ixkdab = 1
        _m1ixkca6c5fad4271ixkdab = (_m1ixkca6c5fad4271ixkdab + 0)
        _x1ixkc3vc5fad3441ixkcre(_z1ixkc8wc5fad3f91ixkd6h, _x1ixkc9pc5fad4161ixkd8w, _1ixkca2c5fad4231ixkd9z)
      end
    end
  end
  local __1ixkca8c5fad4291ixkdah = _x1ixkbufc5fad1f01ixkbz2.wps[_x1ixkbufc5fad1f01ixkbz2.wpi]
  do
    local _z1ixkcaac5fad42b1ixkdan = 1
    _z1ixkcaac5fad42b1ixkdan = (_z1ixkcaac5fad42b1ixkdan + 0)
    if (__1ixkca8c5fad4291ixkdah and (_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, __1ixkca8c5fad4291ixkdah.Position) > 30)) then
      do
        local _x1ixkca9c5fad42a1ixkdak = 1
        _x1ixkca9c5fad42a1ixkdak = (_x1ixkca9c5fad42a1ixkdak + 0)
        _x1ixkc3vc5fad3441ixkcre(_z1ixkc8wc5fad3f91ixkd6h, _x1ixkc9pc5fad4161ixkd8w)
      end
    end
  end
  local _m1ixkcabc5fad42c1ixkdaq = _m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, _x1ixkc9pc5fad4161ixkd8w)
  local _1ixkcacc5fad42d1ixkdat = (_m1ixkbu2c5fad1e31ixkbxz.nearest_interactive.get() ~= nil)
  do
    local _z1ixkcboc5fad45d1ixkdet = 1
    _z1ixkcboc5fad45d1ixkdet = (_z1ixkcboc5fad45d1ixkdet + 0)
    if (_m1ixkcabc5fad42c1ixkdaq <= _z1ixkc9qc5fad4171ixkd8z) then
      do
        local __1ixkcadc5fad42e1ixkdaw = 1
        __1ixkcadc5fad42e1ixkdaw = (__1ixkcadc5fad42e1ixkdaw + 0)
        _x1ixkbupc5fad1fa1ixkbzw()
      end
      do
        local __1ixkcanc5fad4381ixkdbq = 1
        __1ixkcanc5fad4381ixkdbq = (__1ixkcanc5fad4381ixkdbq + 0)
        if (__1ixkc9oc5fad4151ixkd8t and (_x1ixkbufc5fad1f01ixkbz2.stage ~= "board")) then
          do
            local _x1ixkcaec5fad42f1ixkdaz = 1
            _x1ixkcaec5fad42f1ixkdaz = (_x1ixkcaec5fad42f1ixkdaz + 0)
            _x1ixkbufc5fad1f01ixkbz2.busy, _x1ixkbufc5fad1f01ixkbz2.busySince = true, os.clock()
          end
          do
            local _1ixkcamc5fad4371ixkdbn = 1
            _1ixkcamc5fad4371ixkdbn = (_1ixkcamc5fad4371ixkdbn + 0)
            task.spawn(function()
              do
                local _z1ixkcakc5fad4351ixkdbh = 1
                _z1ixkcakc5fad4351ixkdbh = (_z1ixkcakc5fad4351ixkdbh + 0)
                pcall(function()
                  do
                    local _z1ixkcafc5fad4301ixkdb2 = 1
                    _z1ixkcafc5fad4301ixkdb2 = (_z1ixkcafc5fad4301ixkdb2 + 0)
                    _x1ixkbufc5fad1f01ixkbz2.note = "getting off"
                  end
                  do
                    local _m1ixkcagc5fad4311ixkdb5 = 1
                    _m1ixkcagc5fad4311ixkdb5 = (_m1ixkcagc5fad4311ixkdb5 + 0)
                    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.E, true)
                  end
                  do
                    local _1ixkcahc5fad4321ixkdb8 = 1
                    _1ixkcahc5fad4321ixkdb8 = (_1ixkcahc5fad4321ixkdb8 + 0)
                    task.wait(0.15)
                  end
                  do
                    local __1ixkcaic5fad4331ixkdbb = 1
                    __1ixkcaic5fad4331ixkdbb = (__1ixkcaic5fad4331ixkdbb + 0)
                    _m1ixkbuhc5fad1f21ixkbz8(Enum.KeyCode.E, false)
                  end
                  do
                    local _x1ixkcajc5fad4341ixkdbe = 1
                    _x1ixkcajc5fad4341ixkdbe = (_x1ixkcajc5fad4341ixkdbe + 0)
                    task.wait(1.2)
                  end
                end)
              end
              do
                local _m1ixkcalc5fad4361ixkdbk = 1
                _m1ixkcalc5fad4361ixkdbk = (_m1ixkcalc5fad4361ixkdbk + 0)
                _x1ixkbufc5fad1f01ixkbz2.busy = false
              end
            end)
          end
          return
        end
      end
      do
        local _1ixkcawc5fad4411ixkdch = 1
        _1ixkcawc5fad4411ixkdch = (_1ixkcawc5fad4411ixkdch + 0)
        if not _1ixkcacc5fad42d1ixkdat then
          do
            local _x1ixkcaoc5fad4391ixkdbt = 1
            _x1ixkcaoc5fad4391ixkdbt = (_x1ixkcaoc5fad4391ixkdbt + 0)
            _x1ixkbufc5fad1f01ixkbz2.noPrompt = (((_x1ixkbufc5fad1f01ixkbz2.noPrompt or 0)) + _m1ixkc8sc5fad3f51ixkd65)
          end
          do
            local _m1ixkcavc5fad4401ixkdce = 1
            _m1ixkcavc5fad4401ixkdce = (_m1ixkcavc5fad4401ixkdce + 0)
            if (_x1ixkbufc5fad1f01ixkbz2.noPrompt <= 4) then
              local _z1ixkcapc5fad43a1ixkdbw = _x1ixkc9pc5fad4161ixkd8w
              do
                local __1ixkcasc5fad43d1ixkdc5 = 1
                __1ixkcasc5fad43d1ixkdc5 = (__1ixkcasc5fad43d1ixkdc5 + 0)
                if (_x1ixkbufc5fad1f01ixkbz2.noPrompt > 2) then
                  local _m1ixkcaqc5fad43b1ixkdbz = (os.clock() * 1.2)
                  do
                    local _1ixkcarc5fad43c1ixkdc2 = 1
                    _1ixkcarc5fad43c1ixkdc2 = (_1ixkcarc5fad43c1ixkdc2 + 0)
                    _z1ixkcapc5fad43a1ixkdbw = (_x1ixkc9pc5fad4161ixkd8w + (Vector3.new(math.cos(_m1ixkcaqc5fad43b1ixkdbz), 0, math.sin(_m1ixkcaqc5fad43b1ixkdbz)) * 6))
                  end
                end
              end
              do
                local _x1ixkcatc5fad43e1ixkdc8 = 1
                _x1ixkcatc5fad43e1ixkdc8 = (_x1ixkcatc5fad43e1ixkdc8 + 0)
                _x1ixkbufc5fad1f01ixkbz2.note = ("at %s - waiting for the prompt"):format(tostring(_x1ixkc90c5fad3fd1ixkd6t))
              end
              do
                local _z1ixkcauc5fad43f1ixkdcb = 1
                _z1ixkcauc5fad43f1ixkdcb = (_z1ixkcauc5fad43f1ixkdcb + 0)
                _m1ixkc6fc5fad3a01ixkcz2(_z1ixkcapc5fad43a1ixkdbw)
              end
              return
            end
          end
        end
      end
      do
        local __1ixkcaxc5fad4421ixkdck = 1
        __1ixkcaxc5fad4421ixkdck = (__1ixkcaxc5fad4421ixkdck + 0)
        _x1ixkbufc5fad1f01ixkbz2.noPrompt = 0
      end
      do
        local _z1ixkcazc5fad4441ixkdcq = 1
        _z1ixkcazc5fad4441ixkdcq = (_z1ixkcazc5fad4441ixkdcq + 0)
        if (os.clock() < ((_x1ixkbufc5fad1f01ixkbz2.coolUntil or 0))) then
          do
            local _x1ixkcayc5fad4431ixkdcn = 1
            _x1ixkcayc5fad4431ixkdcn = (_x1ixkcayc5fad4431ixkdcn + 0)
            _x1ixkbufc5fad1f01ixkbz2.note = "that interaction is not taking - waiting before another try"
          end
          return
        end
      end
      do
        local _m1ixkcb0c5fad4451ixkdct = 1
        _m1ixkcb0c5fad4451ixkdct = (_m1ixkcb0c5fad4451ixkdct + 0)
        _x1ixkbufc5fad1f01ixkbz2.busy, _x1ixkbufc5fad1f01ixkbz2.busySince = true, os.clock()
      end
      do
        local _x1ixkcbnc5fad45c1ixkdeq = 1
        _x1ixkcbnc5fad45c1ixkdeq = (_x1ixkcbnc5fad45c1ixkdeq + 0)
        task.spawn(function()
          do
            local _m1ixkcbkc5fad4591ixkdeh = 1
            _m1ixkcbkc5fad4591ixkdeh = (_m1ixkcbkc5fad4591ixkdeh + 0)
            pcall(function()
              local _1ixkcb1c5fad4461ixkdcw = _x1ixkbufc5fad1f01ixkbz2.stage
              local __1ixkcb2c5fad4471ixkdcz, _x1ixkcb3c5fad4481ixkdd2 = _m1ixkbync5fad2881ixkcbq(), _1ixkbzic5fad2a71ixkceb()
              do
                local _z1ixkcb4c5fad4491ixkdd5 = 1
                _z1ixkcb4c5fad4491ixkdd5 = (_z1ixkcb4c5fad4491ixkdd5 + 0)
                _x1ixkbufc5fad1f01ixkbz2.note = (_1ixkcb1c5fad4461ixkdcw .. (" at " .. tostring(_x1ixkc90c5fad3fd1ixkd6t)))
              end
              do
                local _m1ixkcb5c5fad44a1ixkdd8 = 1
                _m1ixkcb5c5fad44a1ixkdd8 = (_m1ixkcb5c5fad44a1ixkdd8 + 0)
                _x1ixkbwsc5fad2451ixkc65(_z1ixkc91c5fad3fe1ixkd6w, 2.2, _x1ixkc9pc5fad4161ixkd8w)
              end
              do
                local _1ixkcb6c5fad44b1ixkddb = 1
                _1ixkcb6c5fad44b1ixkddb = (_1ixkcb6c5fad44b1ixkddb + 0)
                task.wait(0.6)
              end
              local __1ixkcb7c5fad44c1ixkdde
              do
                local _1ixkcbbc5fad4501ixkddq = 1
                _1ixkcbbc5fad4501ixkddq = (_1ixkcbbc5fad4501ixkddq + 0)
                if (_1ixkcb1c5fad4461ixkdcw == "get the job") then
                  do
                    local _x1ixkcb8c5fad44d1ixkddh = 1
                    _x1ixkcb8c5fad44d1ixkddh = (_x1ixkcb8c5fad44d1ixkddh + 0)
                    __1ixkcb7c5fad44c1ixkdde = (_m1ixkbync5fad2881ixkcbq() ~= __1ixkcb2c5fad4471ixkdcz)
                  end
                elseif (_1ixkcb1c5fad4461ixkdcw == "board") then
                  do
                    local _z1ixkcb9c5fad44e1ixkddk = 1
                    _z1ixkcb9c5fad44e1ixkddk = (_z1ixkcb9c5fad44e1ixkddk + 0)
                    __1ixkcb7c5fad44c1ixkdde = (_1ixkbu3c5fad1e41ixkby2.player_is_sitting.get() == true)
                  end
                else
                  do
                    local _m1ixkcbac5fad44f1ixkddn = 1
                    _m1ixkcbac5fad44f1ixkddn = (_m1ixkcbac5fad44f1ixkddn + 0)
                    __1ixkcb7c5fad44c1ixkdde = (_1ixkbzic5fad2a71ixkceb() ~= _x1ixkcb3c5fad4481ixkdd2)
                  end
                end
              end
              do
                local _z1ixkcbjc5fad4581ixkdee = 1
                _z1ixkcbjc5fad4581ixkdee = (_z1ixkcbjc5fad4581ixkdee + 0)
                if __1ixkcb7c5fad44c1ixkdde then
                  do
                    local _x1ixkcbdc5fad4521ixkddw = 1
                    _x1ixkcbdc5fad4521ixkddw = (_x1ixkcbdc5fad4521ixkddw + 0)
                    if (_1ixkcb1c5fad4461ixkdcw == "deliver") then
                      do
                        local __1ixkcbcc5fad4511ixkddt = 1
                        __1ixkcbcc5fad4511ixkddt = (__1ixkcbcc5fad4511ixkddt + 0)
                        _x1ixkbufc5fad1f01ixkbz2.done += 1
                      end
                    end
                  end
                  do
                    local _z1ixkcbec5fad4531ixkddz = 1
                    _z1ixkcbec5fad4531ixkddz = (_z1ixkcbec5fad4531ixkddz + 0)
                    _x1ixkbufc5fad1f01ixkbz2.tries = 0
                  end
                else
                  do
                    local _m1ixkcbfc5fad4541ixkde2 = 1
                    _m1ixkcbfc5fad4541ixkde2 = (_m1ixkcbfc5fad4541ixkde2 + 0)
                    _x1ixkbufc5fad1f01ixkbz2.tries = (((_x1ixkbufc5fad1f01ixkbz2.tries or 0)) + 1)
                  end
                  do
                    local _x1ixkcbic5fad4571ixkdeb = 1
                    _x1ixkcbic5fad4571ixkdeb = (_x1ixkcbic5fad4571ixkdeb + 0)
                    if (_x1ixkbufc5fad1f01ixkbz2.tries >= 3) then
                      do
                        local _1ixkcbgc5fad4551ixkde5 = 1
                        _1ixkcbgc5fad4551ixkde5 = (_1ixkcbgc5fad4551ixkde5 + 0)
                        _x1ixkbufc5fad1f01ixkbz2.tries = 0
                      end
                      do
                        local __1ixkcbhc5fad4561ixkde8 = 1
                        __1ixkcbhc5fad4561ixkde8 = (__1ixkcbhc5fad4561ixkde8 + 0)
                        _x1ixkbufc5fad1f01ixkbz2.coolUntil = (os.clock() + 6)
                      end
                    end
                  end
                end
              end
            end)
          end
          do
            local _1ixkcblc5fad45a1ixkdek = 1
            _1ixkcblc5fad45a1ixkdek = (_1ixkcblc5fad45a1ixkdek + 0)
            _x1ixkbufc5fad1f01ixkbz2.goal, _x1ixkbufc5fad1f01ixkbz2.wps, _x1ixkbufc5fad1f01ixkbz2.wpi = nil, {}, 1
          end
          do
            local __1ixkcbmc5fad45b1ixkden = 1
            __1ixkcbmc5fad45b1ixkden = (__1ixkcbmc5fad45b1ixkden + 0)
            _x1ixkbufc5fad1f01ixkbz2.busy = false
          end
        end)
      end
      return
    end
  end
  local _m1ixkcbpc5fad45e1ixkdew = false
  local _1ixkcbqc5fad45f1ixkdez = _x1ixkc4uc5fad3671ixkcub(_z1ixkc8wc5fad3f91ixkd6h, ((((_m1ixkc9mc5fad4131ixkd8n or not __1ixkc9oc5fad4151ixkd8t)) and 0) or 4))
  do
    local _m1ixkcc4c5fad46d1ixkdg5 = 1
    _m1ixkcc4c5fad46d1ixkdg5 = (_m1ixkcc4c5fad46d1ixkdg5 + 0)
    if not _1ixkcbqc5fad45f1ixkdez then
      do
        local __1ixkcbrc5fad4601ixkdf2 = 1
        __1ixkcbrc5fad4601ixkdf2 = (__1ixkcbrc5fad4601ixkdf2 + 0)
        _x1ixkc3vc5fad3441ixkcre(_z1ixkc8wc5fad3f91ixkd6h, _x1ixkc9pc5fad4161ixkd8w)
      end
      do
        local _x1ixkcbsc5fad4611ixkdf5 = 1
        _x1ixkcbsc5fad4611ixkdf5 = (_x1ixkcbsc5fad4611ixkdf5 + 0)
        _m1ixkcbpc5fad45e1ixkdew = true
      end
      local _z1ixkcbtc5fad4621ixkdf8 = (_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, _1ixkbytc5fad28e1ixkcc8) < 32)
      do
        local _z1ixkcc3c5fad46c1ixkdg2 = 1
        _z1ixkcc3c5fad46c1ixkdg2 = (_z1ixkcc3c5fad46c1ixkdg2 + 0)
        if _x1ixkbufc5fad1f01ixkbz2.doorHint then
          do
            local _m1ixkcbuc5fad4631ixkdfb = 1
            _m1ixkcbuc5fad4631ixkdfb = (_m1ixkcbuc5fad4631ixkdfb + 0)
            _1ixkcbqc5fad45f1ixkdez = _x1ixkbufc5fad1f01ixkbz2.doorHint
          end
        elseif ((_m1ixkc9cc5fad4091ixkd7t and _z1ixkcbtc5fad4621ixkdf8) and (_z1ixkc8wc5fad3f91ixkd6h.Z < (_1ixkbytc5fad28e1ixkcc8.Z - 2))) then
          do
            local _1ixkcbvc5fad4641ixkdfe = 1
            _1ixkcbvc5fad4641ixkdfe = (_1ixkcbvc5fad4641ixkdfe + 0)
            _1ixkcbqc5fad45f1ixkdez = _1ixkbytc5fad28e1ixkcc8
          end
        elseif (((not _m1ixkc9cc5fad4091ixkd7t) and _z1ixkcbtc5fad4621ixkdf8) and (_z1ixkc8wc5fad3f91ixkd6h.Z > (_m1ixkbysc5fad28d1ixkcc5.Z + 2))) then
          do
            local _z1ixkcbyc5fad4671ixkdfn = 1
            _z1ixkcbyc5fad4671ixkdfn = (_z1ixkcbyc5fad4671ixkdfn + 0)
            if ((_m1ixkbucc5fad1ed1ixkbyt(_z1ixkc8wc5fad3f91ixkd6h, _1ixkbytc5fad28e1ixkcc8) > 4) and (_z1ixkc8wc5fad3f91ixkd6h.Z > (_1ixkbytc5fad28e1ixkcc8.Z - 2))) then
              do
                local __1ixkcbwc5fad4651ixkdfh = 1
                __1ixkcbwc5fad4651ixkdfh = (__1ixkcbwc5fad4651ixkdfh + 0)
                _1ixkcbqc5fad45f1ixkdez = _1ixkbytc5fad28e1ixkcc8
              end
            else
              do
                local _x1ixkcbxc5fad4661ixkdfk = 1
                _x1ixkcbxc5fad4661ixkdfk = (_x1ixkcbxc5fad4661ixkdfk + 0)
                _1ixkcbqc5fad45f1ixkdez = _m1ixkbysc5fad28d1ixkcc5
              end
            end
          end
        elseif (_x1ixkbufc5fad1f01ixkbz2.stage == "board") then
          do
            local _m1ixkcbzc5fad4681ixkdfq = 1
            _m1ixkcbzc5fad4681ixkdfq = (_m1ixkcbzc5fad4681ixkdfq + 0)
            _1ixkcbqc5fad45f1ixkdez = _x1ixkc9pc5fad4161ixkd8w
          end
        elseif (_m1ixkcabc5fad42c1ixkdaq <= 45) then
          do
            local _1ixkcc0c5fad4691ixkdft = 1
            _1ixkcc0c5fad4691ixkdft = (_1ixkcc0c5fad4691ixkdft + 0)
            _1ixkcbqc5fad45f1ixkdez = _x1ixkc9pc5fad4161ixkd8w
          end
        elseif (_x1ixkbufc5fad1f01ixkbz2.lastGood and (((_z1ixkc8wc5fad3f91ixkd6h - _x1ixkbufc5fad1f01ixkbz2.lastGood)).Magnitude > 8)) then
          do
            local __1ixkcc1c5fad46a1ixkdfw = 1
            __1ixkcc1c5fad46a1ixkdfw = (__1ixkcc1c5fad46a1ixkdfw + 0)
            _1ixkcbqc5fad45f1ixkdez = _x1ixkbufc5fad1f01ixkbz2.lastGood
          end
        else
          do
            local _x1ixkcc2c5fad46b1ixkdfz = 1
            _x1ixkcc2c5fad46b1ixkdfz = (_x1ixkcc2c5fad46b1ixkdfz + 0)
            _1ixkcbqc5fad45f1ixkdez = _x1ixkc9pc5fad4161ixkd8w
          end
        end
      end
    end
  end
  do
    local _x1ixkccmc5fad47f1ixkdhn = 1
    _x1ixkccmc5fad47f1ixkdhn = (_x1ixkccmc5fad47f1ixkdhn + 0)
    if (__1ixkc9oc5fad4151ixkd8t and not _m1ixkc9mc5fad4131ixkd8n) then
      do
        local _1ixkcc5c5fad46e1ixkdg8 = 1
        _1ixkcc5c5fad46e1ixkdg8 = (_1ixkcc5c5fad46e1ixkdg8 + 0)
        _x1ixkbufc5fad1f01ixkbz2.note = ("%s to %s  %d studs%s"):format((((_z1ixkc9lc5fad4121ixkd8k == "Slide") and "sliding") or "driving"), tostring(_x1ixkc90c5fad3fd1ixkd6t), _m1ixkcabc5fad42c1ixkdaq, ((_m1ixkcbpc5fad45e1ixkdew and "  (no route - straight)") or ""))
      end
      do
        local _z1ixkccdc5fad4761ixkdgw = 1
        _z1ixkccdc5fad4761ixkdgw = (_z1ixkccdc5fad4761ixkdgw + 0)
        if (_z1ixkc9lc5fad4121ixkd8k == "Slide") then
          do
            local __1ixkcc6c5fad46f1ixkdgb = 1
            __1ixkcc6c5fad46f1ixkdgb = (__1ixkcc6c5fad46f1ixkdgb + 0)
            _x1ixkbupc5fad1fa1ixkbzw()
          end
          do
            local _x1ixkcc7c5fad4701ixkdge = 1
            _x1ixkcc7c5fad4701ixkdge = (_x1ixkcc7c5fad4701ixkdge + 0)
            _m1ixkc7jc5fad3c81ixkd2e(_1ixkcbqc5fad45f1ixkdez, _m1ixkc8sc5fad3f51ixkd65)
          end
        else
          do
            local _z1ixkcc8c5fad4711ixkdgh = 1
            _z1ixkcc8c5fad4711ixkdgh = (_z1ixkcc8c5fad4711ixkdgh + 0)
            _m1ixkc6pc5fad3aa1ixkczw(_1ixkcbqc5fad45f1ixkdez)
          end
          local _m1ixkcc9c5fad4721ixkdgk = __1ixkc17c5fad2e41ixkcje()
          local _1ixkccac5fad4731ixkdgn = (_m1ixkcc9c5fad4721ixkdgk and _m1ixkcc9c5fad4721ixkdgk:FindFirstChild("Chassis"))
          local __1ixkccbc5fad4741ixkdgq = ((_1ixkccac5fad4731ixkdgn and _1ixkccac5fad4731ixkdgn.AssemblyLinearVelocity.Magnitude) or 0)
          do
            local _x1ixkcccc5fad4751ixkdgt = 1
            _x1ixkcccc5fad4751ixkdgt = (_x1ixkcccc5fad4751ixkdgt + 0)
            _x1ixkbufc5fad1f01ixkbz2.stuckFor = (((__1ixkccbc5fad4741ixkdgq < 2) and ((_x1ixkbufc5fad1f01ixkbz2.stuckFor + _m1ixkc8sc5fad3f51ixkd65))) or 0)
          end
        end
      end
    else
      do
        local _m1ixkccec5fad4771ixkdgz = 1
        _m1ixkccec5fad4771ixkdgz = (_m1ixkccec5fad4771ixkdgz + 0)
        _x1ixkbupc5fad1fa1ixkbzw()
      end
      local _1ixkccfc5fad4781ixkdh2 = (_1ixkcbqc5fad45f1ixkdez - _z1ixkc8wc5fad3f91ixkd6h)
      do
        local __1ixkccgc5fad4791ixkdh5 = 1
        __1ixkccgc5fad4791ixkdh5 = (__1ixkccgc5fad4791ixkdh5 + 0)
        _1ixkccfc5fad4781ixkdh2 = Vector3.new(_1ixkccfc5fad4781ixkdh2.X, 0, _1ixkccfc5fad4781ixkdh2.Z)
      end
      local _x1ixkcchc5fad47a1ixkdh8 = (((_1ixkccfc5fad4781ixkdh2.Magnitude > 0.01) and _1ixkccfc5fad4781ixkdh2.Unit) or Vector3.zAxis)
      local _z1ixkccic5fad47b1ixkdhb = _z1ixkc5fc5fad37c1ixkcw2(_x1ixkcchc5fad47a1ixkdh8, _m1ixkc8sc5fad3f51ixkd65)
      do
        local _m1ixkccjc5fad47c1ixkdhe = 1
        _m1ixkccjc5fad47c1ixkdhe = (_m1ixkccjc5fad47c1ixkdhe + 0)
        _x1ixkbufc5fad1f01ixkbz2.note = ("walking to %s  %d studs%s%s"):format(tostring(_x1ixkc90c5fad3fd1ixkd6t), _m1ixkcabc5fad42c1ixkdaq, ((_m1ixkcbpc5fad45e1ixkdew and "  (no route)") or ""), ((_x1ixkbufc5fad1f01ixkbz2.stuckStage and (("  [" .. (_x1ixkbufc5fad1f01ixkbz2.stuckStage .. "]")))) or ""))
      end
      do
        local __1ixkcclc5fad47e1ixkdhk = 1
        __1ixkcclc5fad47e1ixkdhk = (__1ixkcclc5fad47e1ixkdhk + 0)
        if not _z1ixkccic5fad47b1ixkdhb then
          do
            local _1ixkcckc5fad47d1ixkdhh = 1
            _1ixkcckc5fad47d1ixkdhh = (_1ixkcckc5fad47d1ixkdhh + 0)
            _m1ixkc6fc5fad3a01ixkcz2(_1ixkcbqc5fad45f1ixkdez)
          end
        end
      end
    end
  end
end
local _z1ixkccnc5fad4801ixkdhq = {stage = "", stageSince = 0, level = 0}
local function _m1ixkccoc5fad4811ixkdht(_1ixkccpc5fad4821ixkdhw, __1ixkccqc5fad4831ixkdhz)
  do
    local _x1ixkccrc5fad4841ixkdi2 = 1
    _x1ixkccrc5fad4841ixkdi2 = (_x1ixkccrc5fad4841ixkdi2 + 0)
    _x1ixkbufc5fad1f01ixkbz2.note = ("failsafe %d - %s"):format(_1ixkccpc5fad4821ixkdhw, __1ixkccqc5fad4831ixkdhz)
  end
  do
    local _z1ixkccsc5fad4851ixkdi5 = 1
    _z1ixkccsc5fad4851ixkdi5 = (_z1ixkccsc5fad4851ixkdi5 + 0)
    _x1ixkbufc5fad1f01ixkbz2.goal, _x1ixkbufc5fad1f01ixkbz2.wps, _x1ixkbufc5fad1f01ixkbz2.wpi = nil, {}, 1
  end
  do
    local _m1ixkcctc5fad4861ixkdi8 = 1
    _m1ixkcctc5fad4861ixkdi8 = (_m1ixkcctc5fad4861ixkdi8 + 0)
    _x1ixkbufc5fad1f01ixkbz2.approach, _x1ixkbufc5fad1f01ixkbz2.doorHint = nil, nil
  end
  do
    local _1ixkccuc5fad4871ixkdib = 1
    _1ixkccuc5fad4871ixkdib = (_1ixkccuc5fad4871ixkdib + 0)
    _x1ixkbufc5fad1f01ixkbz2.busy, _x1ixkbufc5fad1f01ixkbz2.busySince = false, nil
  end
  do
    local __1ixkccvc5fad4881ixkdie = 1
    __1ixkccvc5fad4881ixkdie = (__1ixkccvc5fad4881ixkdie + 0)
    _x1ixkbufc5fad1f01ixkbz2.tries, _x1ixkbufc5fad1f01ixkbz2.coolUntil = 0, 0
  end
  do
    local _x1ixkccwc5fad4891ixkdih = 1
    _x1ixkccwc5fad4891ixkdih = (_x1ixkccwc5fad4891ixkdih + 0)
    _x1ixkbufc5fad1f01ixkbz2.noPrompt, _x1ixkbufc5fad1f01ixkbz2.stuckTime = 0, 0
  end
  do
    local _1ixkcczc5fad48c1ixkdiq = 1
    _1ixkcczc5fad48c1ixkdiq = (_1ixkcczc5fad48c1ixkdiq + 0)
    if (_1ixkccpc5fad4821ixkdhw >= 2) then
      do
        local _z1ixkccxc5fad48a1ixkdik = 1
        _z1ixkccxc5fad48a1ixkdik = (_z1ixkccxc5fad48a1ixkdik + 0)
        _x1ixkbufc5fad1f01ixkbz2.lastGood = nil
      end
      do
        local _m1ixkccyc5fad48b1ixkdin = 1
        _m1ixkccyc5fad48b1ixkdin = (_m1ixkccyc5fad48b1ixkdin + 0)
        _x1ixkbufc5fad1f01ixkbz2.forceDoor = (os.clock() + 25)
      end
    end
  end
  do
    local _1ixkcd4c5fad4911ixkdj5 = 1
    _1ixkcd4c5fad4911ixkdj5 = (_1ixkcd4c5fad4911ixkdj5 + 0)
    if ((_1ixkccpc5fad4821ixkdhw >= 3) and Toggles.FarmAutoReset.Value) then
      local __1ixkcd0c5fad48d1ixkdit = _x1ixkbuac5fad1eb1ixkbyn()
      do
        local _m1ixkcd3c5fad4901ixkdj2 = 1
        _m1ixkcd3c5fad4901ixkdj2 = (_m1ixkcd3c5fad4901ixkdj2 + 0)
        if __1ixkcd0c5fad48d1ixkdit then
          do
            local _z1ixkcd2c5fad48f1ixkdiz = 1
            _z1ixkcd2c5fad48f1ixkdiz = (_z1ixkcd2c5fad48f1ixkdiz + 0)
            pcall(function()
              do
                local _x1ixkcd1c5fad48e1ixkdiw = 1
                _x1ixkcd1c5fad48e1ixkdiw = (_x1ixkcd1c5fad48e1ixkdiw + 0)
                __1ixkcd0c5fad48d1ixkdit.Health = 0
              end
            end)
          end
        end
      end
    end
  end
end
local __1ixkcd5c5fad4921ixkdj8 = game:GetService("VirtualUser")
local __1ixkcdac5fad4971ixkdjn = _x1ixkbtvc5fad1dc1ixkbxe.Idled:Connect(function()
  do
    local _x1ixkcd6c5fad4931ixkdjb = 1
    _x1ixkcd6c5fad4931ixkdjb = (_x1ixkcd6c5fad4931ixkdjb + 0)
    if not Toggles.FarmAntiAfk.Value then
      return
    end
  end
  do
    local _1ixkcd9c5fad4961ixkdjk = 1
    _1ixkcd9c5fad4961ixkdjk = (_1ixkcd9c5fad4961ixkdjk + 0)
    pcall(function()
      do
        local _z1ixkcd7c5fad4941ixkdje = 1
        _z1ixkcd7c5fad4941ixkdje = (_z1ixkcd7c5fad4941ixkdje + 0)
        __1ixkcd5c5fad4921ixkdj8:CaptureController()
      end
      do
        local _m1ixkcd8c5fad4951ixkdjh = 1
        _m1ixkcd8c5fad4951ixkdjh = (_m1ixkcd8c5fad4951ixkdjh + 0)
        __1ixkcd5c5fad4921ixkdj8:ClickButton2(Vector2.new())
      end
    end)
  end
end)
local function _x1ixkcdbc5fad4981ixkdjq()
  local _z1ixkcdcc5fad4991ixkdjt = os.clock()
  do
    local _1ixkcdec5fad49b1ixkdjz = 1
    _1ixkcdec5fad49b1ixkdjz = (_1ixkcdec5fad49b1ixkdjz + 0)
    if not _x1ixkbufc5fad1f01ixkbz2.on then
      do
        local _m1ixkcddc5fad49a1ixkdjw = 1
        _m1ixkcddc5fad49a1ixkdjw = (_m1ixkcddc5fad49a1ixkdjw + 0)
        _z1ixkccnc5fad4801ixkdhq.stageSince, _z1ixkccnc5fad4801ixkdhq.level = _z1ixkcdcc5fad4991ixkdjt, 0
      end
      return
    end
  end
  do
    local _x1ixkcdgc5fad49d1ixkdk5 = 1
    _x1ixkcdgc5fad49d1ixkdk5 = (_x1ixkcdgc5fad49d1ixkdk5 + 0)
    if (_x1ixkbufc5fad1f01ixkbz2.stage ~= _z1ixkccnc5fad4801ixkdhq.stage) then
      do
        local __1ixkcdfc5fad49c1ixkdk2 = 1
        __1ixkcdfc5fad49c1ixkdk2 = (__1ixkcdfc5fad49c1ixkdk2 + 0)
        _z1ixkccnc5fad4801ixkdhq.stage, _z1ixkccnc5fad4801ixkdhq.stageSince, _z1ixkccnc5fad4801ixkdhq.level = _x1ixkbufc5fad1f01ixkbz2.stage, _z1ixkcdcc5fad4991ixkdjt, 0
      end
      return
    end
  end
  local _z1ixkcdhc5fad49e1ixkdk8 = _1ixkbu8c5fad1e91ixkbyh()
  do
    local __1ixkcdkc5fad4a11ixkdkh = 1
    __1ixkcdkc5fad4a11ixkdkh = (__1ixkcdkc5fad4a11ixkdkh + 0)
    if (_z1ixkcdhc5fad49e1ixkdk8 and (_z1ixkcdhc5fad49e1ixkdk8.Position.Y < -60)) then
      do
        local _m1ixkcdic5fad49f1ixkdkb = 1
        _m1ixkcdic5fad49f1ixkdkb = (_m1ixkcdic5fad49f1ixkdkb + 0)
        _z1ixkccnc5fad4801ixkdhq.stageSince = _z1ixkcdcc5fad4991ixkdjt
      end
      do
        local _1ixkcdjc5fad4a01ixkdke = 1
        _1ixkcdjc5fad4a01ixkdke = (_1ixkcdjc5fad4a01ixkdke + 0)
        _m1ixkccoc5fad4811ixkdht(3, "fell out of the map")
      end
      return
    end
  end
  local _x1ixkcdlc5fad4a21ixkdkk = Options.FarmStageLimit.Value
  local _z1ixkcdmc5fad4a31ixkdkn = (_z1ixkcdcc5fad4991ixkdjt - _z1ixkccnc5fad4801ixkdhq.stageSince)
  do
    local _1ixkcdtc5fad4aa1ixkdl8 = 1
    _1ixkcdtc5fad4aa1ixkdl8 = (_1ixkcdtc5fad4aa1ixkdl8 + 0)
    if ((_z1ixkcdmc5fad4a31ixkdkn > (_x1ixkcdlc5fad4a21ixkdkk * 3)) and (_z1ixkccnc5fad4801ixkdhq.level < 3)) then
      do
        local _m1ixkcdnc5fad4a41ixkdkq = 1
        _m1ixkcdnc5fad4a41ixkdkq = (_m1ixkcdnc5fad4a41ixkdkq + 0)
        _z1ixkccnc5fad4801ixkdhq.level, _z1ixkccnc5fad4801ixkdhq.stageSince = 3, _z1ixkcdcc5fad4991ixkdjt
      end
      do
        local _1ixkcdoc5fad4a51ixkdkt = 1
        _1ixkcdoc5fad4a51ixkdkt = (_1ixkcdoc5fad4a51ixkdkt + 0)
        _m1ixkccoc5fad4811ixkdht(3, ("'%s' will not finish"):format(tostring(_x1ixkbufc5fad1f01ixkbz2.stage)))
      end
    elseif ((_z1ixkcdmc5fad4a31ixkdkn > (_x1ixkcdlc5fad4a21ixkdkk * 2)) and (_z1ixkccnc5fad4801ixkdhq.level < 2)) then
      do
        local __1ixkcdpc5fad4a61ixkdkw = 1
        __1ixkcdpc5fad4a61ixkdkw = (__1ixkcdpc5fad4a61ixkdkw + 0)
        _z1ixkccnc5fad4801ixkdhq.level = 2
      end
      do
        local _x1ixkcdqc5fad4a71ixkdkz = 1
        _x1ixkcdqc5fad4a71ixkdkz = (_x1ixkcdqc5fad4a71ixkdkz + 0)
        _m1ixkccoc5fad4811ixkdht(2, "re-approaching through the front door")
      end
    elseif ((_z1ixkcdmc5fad4a31ixkdkn > _x1ixkcdlc5fad4a21ixkdkk) and (_z1ixkccnc5fad4801ixkdhq.level < 1)) then
      do
        local _z1ixkcdrc5fad4a81ixkdl2 = 1
        _z1ixkcdrc5fad4a81ixkdl2 = (_z1ixkcdrc5fad4a81ixkdl2 + 0)
        _z1ixkccnc5fad4801ixkdhq.level = 1
      end
      do
        local _m1ixkcdsc5fad4a91ixkdl5 = 1
        _m1ixkcdsc5fad4a91ixkdl5 = (_m1ixkcdsc5fad4a91ixkdl5 + 0)
        _m1ixkccoc5fad4811ixkdht(1, "re-routing")
      end
    end
  end
end
local __1ixkcduc5fad4ab1ixkdlb = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/"
local _x1ixkcdvc5fad4ac1ixkdle = loadstring(game:HttpGet((__1ixkcduc5fad4ab1ixkdlb .. "Library.lua")))()
local _z1ixkcdwc5fad4ad1ixkdlh = loadstring(game:HttpGet((__1ixkcduc5fad4ab1ixkdlb .. "addons/ThemeManager.lua")))()
local _m1ixkcdxc5fad4ae1ixkdlk = loadstring(game:HttpGet((__1ixkcduc5fad4ab1ixkdlb .. "addons/SaveManager.lua")))()
do
  local _1ixkcdyc5fad4af1ixkdln = 1
  _1ixkcdyc5fad4af1ixkdln = (_1ixkcdyc5fad4af1ixkdln + 0)
  Toggles = getgenv().Toggles
end
do
  local __1ixkcdzc5fad4b01ixkdlq = 1
  __1ixkcdzc5fad4b01ixkdlq = (__1ixkcdzc5fad4b01ixkdlq + 0)
  Options = getgenv().Options
end
local _x1ixkce0c5fad4b11ixkdlt = 560
local _z1ixkce1c5fad4b21ixkdlw = _x1ixkcdvc5fad4ac1ixkdle:CreateWindow({Title = "Zenith Autofarm", Center = true, AutoShow = true, Size = UDim2.fromOffset(_x1ixkce0c5fad4b11ixkdlt, 460), TabPadding = 8, MenuFadeTime = 0.2})
local _m1ixkce2c5fad4b31ixkdlz = {Farm = _z1ixkce1c5fad4b21ixkdlw:AddTab("Farm"), Settings = _z1ixkce1c5fad4b21ixkdlw:AddTab("Settings")}
local _1ixkce3c5fad4b41ixkdm2 = _m1ixkce2c5fad4b31ixkdlz.Farm:AddLeftGroupbox("Delivery driver")
do
  local __1ixkce4c5fad4b51ixkdm5 = 1
  __1ixkce4c5fad4b51ixkdm5 = (__1ixkce4c5fad4b51ixkdm5 + 0)
  _1ixkce3c5fad4b41ixkdm2:AddToggle("FarmOn", {Text = "Run the job", Default = false}):AddKeyPicker("FarmKey", {Default = "H", Mode = "Toggle", Text = "Autofarm", NoUI = false})
end
do
  local _x1ixkce5c5fad4b61ixkdm8 = 1
  _x1ixkce5c5fad4b61ixkdm8 = (_x1ixkce5c5fad4b61ixkdm8 + 0)
  _1ixkce3c5fad4b41ixkdm2:AddDropdown("FarmMode", {Text = "Travel by", Values = {"Slide", "Walk", "Drive"}, Default = 1, Tooltip = ("Slide rides the bike above the ground along the route, and " .. ("puts a new one out if yours has despawned. Walk needs no bike at " .. "all and is the fallback if slide misbehaves."))})
end
do
  local _z1ixkce6c5fad4b71ixkdmb = 1
  _z1ixkce6c5fad4b71ixkdmb = (_z1ixkce6c5fad4b71ixkdmb + 0)
  _1ixkce3c5fad4b41ixkdm2:AddSlider("FarmHover", {Text = "Ride height", Default = 3, Min = 1, Max = 12, Rounding = 1, Suffix = " studs", Tooltip = "How far above the ground the bike sits while sliding."})
end
do
  local _m1ixkce7c5fad4b81ixkdme = 1
  _m1ixkce7c5fad4b81ixkdme = (_m1ixkce7c5fad4b81ixkdme + 0)
  _1ixkce3c5fad4b41ixkdm2:AddSlider("FarmMph", {Text = "Top speed", Default = 30, Min = 8, Max = 60, Rounding = 0, Suffix = " mph", Tooltip = "The game's own speedometer maths, so this matches the dash."})
end
do
  local _1ixkce8c5fad4b91ixkdmh = 1
  _1ixkce8c5fad4b91ixkdmh = (_1ixkce8c5fad4b91ixkdmh + 0)
  _1ixkce3c5fad4b41ixkdm2:AddSlider("FarmWalk", {Text = "Walk speed", Default = 30, Min = 16, Max = 120, Rounding = 0, Tooltip = ("Tops your real walk speed up, and only where " .. "nothing solid is in the way.")})
end
do
  local __1ixkce9c5fad4ba1ixkdmk = 1
  __1ixkce9c5fad4ba1ixkdmk = (__1ixkce9c5fad4ba1ixkdmk + 0)
  _1ixkce3c5fad4b41ixkdm2:AddSlider("FarmArrive", {Text = "Interact within", Default = 12, Min = 6, Max = 25, Rounding = 0, Suffix = " studs"})
end
do
  local _x1ixkceac5fad4bb1ixkdmn = 1
  _x1ixkceac5fad4bb1ixkdmn = (_x1ixkceac5fad4bb1ixkdmn + 0)
  _1ixkce3c5fad4b41ixkdm2:AddToggle("FarmAutoReset", {Text = "Reset if badly stuck", Default = true, Tooltip = ("Last resort only, after jumping, hopping and going around have " .. "all failed. It respawns you, so you lose your spot.")})
end
local _z1ixkcebc5fad4bc1ixkdmq = _m1ixkce2c5fad4b31ixkdlz.Farm:AddLeftGroupbox("Failsafes")
do
  local _m1ixkcecc5fad4bd1ixkdmt = 1
  _m1ixkcecc5fad4bd1ixkdmt = (_m1ixkcecc5fad4bd1ixkdmt + 0)
  _z1ixkcebc5fad4bc1ixkdmq:AddToggle("FarmSeeThrough", {Text = "Interact without line of sight", Default = true, Tooltip = ("Turns on the game's own ignore_occlusion flag, so a prompt is " .. ("offered even when the counter, a wall or your own head is in the " .. "way. Put back on unload."))})
end
do
  local _1ixkcedc5fad4be1ixkdmw = 1
  _1ixkcedc5fad4be1ixkdmw = (_1ixkcedc5fad4be1ixkdmw + 0)
  _z1ixkcebc5fad4bc1ixkdmq:AddToggle("FarmAntiAfk", {Text = "Anti-AFK", Default = true, Tooltip = ("Roblox disconnects an idle client after about 20 minutes. " .. "Leave this on for any unattended run.")})
end
do
  local __1ixkceec5fad4bf1ixkdmz = 1
  __1ixkceec5fad4bf1ixkdmz = (__1ixkceec5fad4bf1ixkdmz + 0)
  _z1ixkcebc5fad4bc1ixkdmq:AddSlider("FarmStageLimit", {Text = "Stage timeout", Default = 90, Min = 30, Max = 300, Rounding = 0, Suffix = " s", Tooltip = ("How long one stage may take before recovering: re-route, then " .. "re-approach through the door, then respawn at three times this.")})
end
local _x1ixkcefc5fad4c01ixkdn2 = _m1ixkce2c5fad4b31ixkdlz.Farm:AddLeftGroupbox("Protection")
do
  local _z1ixkcegc5fad4c11ixkdn5 = 1
  _z1ixkcegc5fad4c11ixkdn5 = (_z1ixkcegc5fad4c11ixkdn5 + 0)
  _x1ixkcefc5fad4c01ixkdn2:AddToggle("FarmAntiRagdoll", {Text = "Anti-ragdoll", Default = true, Tooltip = ("Your own client is what ragdolls you, so it declines. Stops a " .. "knockdown leaving the farm lying in the road.")})
end
do
  local _m1ixkcehc5fad4c21ixkdn8 = 1
  _m1ixkcehc5fad4c21ixkdn8 = (_m1ixkcehc5fad4c21ixkdn8 + 0)
  _x1ixkcefc5fad4c01ixkdn2:AddToggle("FarmAntiTaser", {Text = "Anti-taser", Default = true, Tooltip = "Clears the Tased attribute. Tasing has no other client effect."})
end
local _1ixkceic5fad4c31ixkdnb = _m1ixkce2c5fad4b31ixkdlz.Farm:AddRightGroupbox("Route")
do
  local __1ixkcejc5fad4c41ixkdne = 1
  __1ixkcejc5fad4c41ixkdne = (__1ixkcejc5fad4c41ixkdne + 0)
  _1ixkceic5fad4c31ixkdnb:AddToggle("FarmShowRoute", {Text = "Draw the route", Default = true, Tooltip = "Rebuilt only when the route changes, not every frame."}):AddColorPicker("FarmRouteColour", {Default = Color3.fromRGB(85, 220, 225), Title = "Route colour"})
end
local _x1ixkcekc5fad4c51ixkdnh = _m1ixkce2c5fad4b31ixkdlz.Farm:AddRightGroupbox("Status"):AddLabel("...", true)
local _z1ixkcelc5fad4c61ixkdnk = _m1ixkce2c5fad4b31ixkdlz.Settings:AddLeftGroupbox("Menu")
local _m1ixkcemc5fad4c71ixkdnn = _x1ixkcdvc5fad4ac1ixkdle.ScreenGui
local _1ixkcenc5fad4c81ixkdnq
do
  local _x1ixkceuc5fad4cf1ixkdob = 1
  _x1ixkceuc5fad4cf1ixkdob = (_x1ixkceuc5fad4cf1ixkdob + 0)
  _z1ixkcelc5fad4c61ixkdnk:AddButton("Unload", function()
    do
      local _x1ixkcepc5fad4ca1ixkdnw = 1
      _x1ixkcepc5fad4ca1ixkdnw = (_x1ixkcepc5fad4ca1ixkdnw + 0)
      pcall(function()
        do
          local __1ixkceoc5fad4c91ixkdnt = 1
          __1ixkceoc5fad4c91ixkdnt = (__1ixkceoc5fad4c91ixkdnt + 0)
          _x1ixkcdvc5fad4ac1ixkdle:Unload()
        end
      end)
    end
    do
      local _z1ixkceqc5fad4cb1ixkdnz = 1
      _z1ixkceqc5fad4cb1ixkdnz = (_z1ixkceqc5fad4cb1ixkdnz + 0)
      pcall(_1ixkcenc5fad4c81ixkdnq)
    end
    do
      local __1ixkcetc5fad4ce1ixkdo8 = 1
      __1ixkcetc5fad4ce1ixkdo8 = (__1ixkcetc5fad4ce1ixkdo8 + 0)
      pcall(function()
        do
          local _1ixkcesc5fad4cd1ixkdo5 = 1
          _1ixkcesc5fad4cd1ixkdo5 = (_1ixkcesc5fad4cd1ixkdo5 + 0)
          if (_m1ixkcemc5fad4c71ixkdnn and _m1ixkcemc5fad4c71ixkdnn.Parent) then
            do
              local _m1ixkcerc5fad4cc1ixkdo2 = 1
              _m1ixkcerc5fad4cc1ixkdo2 = (_m1ixkcerc5fad4cc1ixkdo2 + 0)
              _m1ixkcemc5fad4c71ixkdnn:Destroy()
            end
          end
        end
      end)
    end
  end)
end
do
  local _z1ixkcevc5fad4d01ixkdoe = 1
  _z1ixkcevc5fad4d01ixkdoe = (_z1ixkcevc5fad4d01ixkdoe + 0)
  _z1ixkcelc5fad4c61ixkdnk:AddLabel("Menu key"):AddKeyPicker("FarmMenu", {Default = "RightShift", NoUI = true, Text = "Menu"})
end
do
  local _m1ixkcewc5fad4d11ixkdoh = 1
  _m1ixkcewc5fad4d11ixkdoh = (_m1ixkcewc5fad4d11ixkdoh + 0)
  _x1ixkcdvc5fad4ac1ixkdle.ToggleKeybind = Options.FarmMenu
end
do
  local _1ixkcexc5fad4d21ixkdok = 1
  _1ixkcexc5fad4d21ixkdok = (_1ixkcexc5fad4d21ixkdok + 0)
  _z1ixkcdwc5fad4ad1ixkdlh:SetLibrary(_x1ixkcdvc5fad4ac1ixkdle)
end
do
  local __1ixkceyc5fad4d31ixkdon = 1
  __1ixkceyc5fad4d31ixkdon = (__1ixkceyc5fad4d31ixkdon + 0)
  _m1ixkcdxc5fad4ae1ixkdlk:SetLibrary(_x1ixkcdvc5fad4ac1ixkdle)
end
do
  local _x1ixkcezc5fad4d41ixkdoq = 1
  _x1ixkcezc5fad4d41ixkdoq = (_x1ixkcezc5fad4d41ixkdoq + 0)
  _m1ixkcdxc5fad4ae1ixkdlk:IgnoreThemeSettings()
end
do
  local _z1ixkcf0c5fad4d51ixkdot = 1
  _z1ixkcf0c5fad4d51ixkdot = (_z1ixkcf0c5fad4d51ixkdot + 0)
  _m1ixkcdxc5fad4ae1ixkdlk:SetIgnoreIndexes({"FarmMenu"})
end
do
  local _m1ixkcf1c5fad4d61ixkdow = 1
  _m1ixkcf1c5fad4d61ixkdow = (_m1ixkcf1c5fad4d61ixkdow + 0)
  _z1ixkcdwc5fad4ad1ixkdlh:SetFolder("Zenith Project12")
end
do
  local _1ixkcf2c5fad4d71ixkdoz = 1
  _1ixkcf2c5fad4d71ixkdoz = (_1ixkcf2c5fad4d71ixkdoz + 0)
  _m1ixkcdxc5fad4ae1ixkdlk:SetFolder("Zenith Project12/farm")
end
do
  local __1ixkcf3c5fad4d81ixkdp2 = 1
  __1ixkcf3c5fad4d81ixkdp2 = (__1ixkcf3c5fad4d81ixkdp2 + 0)
  _m1ixkcdxc5fad4ae1ixkdlk:BuildConfigSection(_m1ixkce2c5fad4b31ixkdlz.Settings)
end
do
  local _x1ixkcf4c5fad4d91ixkdp5 = 1
  _x1ixkcf4c5fad4d91ixkdp5 = (_x1ixkcf4c5fad4d91ixkdp5 + 0)
  _z1ixkcdwc5fad4ad1ixkdlh:ApplyToTab(_m1ixkce2c5fad4b31ixkdlz.Settings)
end
do
  local _z1ixkcf5c5fad4da1ixkdp8 = 1
  _z1ixkcf5c5fad4da1ixkdp8 = (_z1ixkcf5c5fad4da1ixkdp8 + 0)
  _m1ixkcdxc5fad4ae1ixkdlk:LoadAutoloadConfig()
end
do
  local _x1ixkcfec5fad4e31ixkdpz = 1
  _x1ixkcfec5fad4e31ixkdpz = (_x1ixkcfec5fad4e31ixkdpz + 0)
  do
    local _m1ixkcf6c5fad4db1ixkdpb = math.floor(((_x1ixkce0c5fad4b11ixkdlt / 2) - 43))
    do
      local __1ixkcfdc5fad4e21ixkdpw = 1
      __1ixkcfdc5fad4e21ixkdpw = (__1ixkcfdc5fad4e21ixkdpw + 0)
      for _1ixkcf7c5fad4dc1ixkdpe, __1ixkcf8c5fad4dd1ixkdph in pairs(Options) do
        do
          local _1ixkcfcc5fad4e11ixkdpt = 1
          _1ixkcfcc5fad4e11ixkdpt = (_1ixkcfcc5fad4e11ixkdpt + 0)
          if ((type(__1ixkcf8c5fad4dd1ixkdph) == "table") and (__1ixkcf8c5fad4dd1ixkdph.Type == "Slider")) then
            do
              local _x1ixkcf9c5fad4de1ixkdpk = 1
              _x1ixkcf9c5fad4de1ixkdpk = (_x1ixkcf9c5fad4de1ixkdpk + 0)
              __1ixkcf8c5fad4dd1ixkdph.MaxSize = _m1ixkcf6c5fad4db1ixkdpb
            end
            do
              local _m1ixkcfbc5fad4e01ixkdpq = 1
              _m1ixkcfbc5fad4e01ixkdpq = (_m1ixkcfbc5fad4e01ixkdpq + 0)
              pcall(function()
                do
                  local _z1ixkcfac5fad4df1ixkdpn = 1
                  _z1ixkcfac5fad4df1ixkdpn = (_z1ixkcfac5fad4df1ixkdpn + 0)
                  __1ixkcf8c5fad4dd1ixkdph:Display()
                end
              end)
            end
          end
        end
      end
    end
  end
end
do
  local _1ixkcg1c5fad4fa1ixkdrw = 1
  _1ixkcg1c5fad4fa1ixkdrw = (_1ixkcg1c5fad4fa1ixkdrw + 0)
  do
    local _z1ixkcffc5fad4e41ixkdq2 = Color3.fromRGB(85, 220, 225)
    do
      local _m1ixkcfgc5fad4e51ixkdq5 = 1
      _m1ixkcfgc5fad4e51ixkdq5 = (_m1ixkcfgc5fad4e51ixkdq5 + 0)
      _x1ixkcdvc5fad4ac1ixkdle.AccentColor = _z1ixkcffc5fad4e41ixkdq2
    end
    do
      local __1ixkcfic5fad4e71ixkdqb = 1
      __1ixkcfic5fad4e71ixkdqb = (__1ixkcfic5fad4e71ixkdqb + 0)
      pcall(function()
        do
          local _1ixkcfhc5fad4e61ixkdq8 = 1
          _1ixkcfhc5fad4e61ixkdq8 = (_1ixkcfhc5fad4e61ixkdq8 + 0)
          _x1ixkcdvc5fad4ac1ixkdle:UpdateColorsUsingRegistry()
        end
      end)
    end
    do
      local _m1ixkcg0c5fad4f91ixkdrt = 1
      _m1ixkcg0c5fad4f91ixkdrt = (_m1ixkcg0c5fad4f91ixkdrt + 0)
      task.defer(function()
        local _x1ixkcfjc5fad4e81ixkdqe = _x1ixkcdvc5fad4ac1ixkdle.ScreenGui
        do
          local _z1ixkcfkc5fad4e91ixkdqh = 1
          _z1ixkcfkc5fad4e91ixkdqh = (_z1ixkcfkc5fad4e91ixkdqh + 0)
          if not _x1ixkcfjc5fad4e81ixkdqe then
            return
          end
        end
        do
          local _z1ixkcfzc5fad4f81ixkdrq = 1
          _z1ixkcfzc5fad4f81ixkdrq = (_z1ixkcfzc5fad4f81ixkdrq + 0)
          for _m1ixkcflc5fad4ea1ixkdqk, _1ixkcfmc5fad4eb1ixkdqn in ipairs(_x1ixkcfjc5fad4e81ixkdqe:GetDescendants()) do
            do
              local _x1ixkcfyc5fad4f71ixkdrn = 1
              _x1ixkcfyc5fad4f71ixkdrn = (_x1ixkcfyc5fad4f71ixkdrn + 0)
              if (_1ixkcfmc5fad4eb1ixkdqn:IsA("TextLabel") and (_1ixkcfmc5fad4eb1ixkdqn.Text == "Zenith Autofarm")) then
                local _1ixkcfwc5fad4f51ixkdrh = pcall(function()
                  local __1ixkcfnc5fad4ec1ixkdqq = _1ixkcfmc5fad4eb1ixkdqn:Clone()
                  do
                    local _x1ixkcfoc5fad4ed1ixkdqt = 1
                    _x1ixkcfoc5fad4ed1ixkdqt = (_x1ixkcfoc5fad4ed1ixkdqt + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.Name = "Brand"
                  end
                  do
                    local _z1ixkcfpc5fad4ee1ixkdqw = 1
                    _z1ixkcfpc5fad4ee1ixkdqw = (_z1ixkcfpc5fad4ee1ixkdqw + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.Text = "Zenith Solutions  /  .gg Zenith"
                  end
                  do
                    local _m1ixkcfqc5fad4ef1ixkdqz = 1
                    _m1ixkcfqc5fad4ef1ixkdqz = (_m1ixkcfqc5fad4ef1ixkdqz + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.Position = UDim2.new(0, 0, 0, 0)
                  end
                  do
                    local _1ixkcfrc5fad4f01ixkdr2 = 1
                    _1ixkcfrc5fad4f01ixkdr2 = (_1ixkcfrc5fad4f01ixkdr2 + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.Size = UDim2.new(1, 0, 0, 25)
                  end
                  do
                    local __1ixkcfsc5fad4f11ixkdr5 = 1
                    __1ixkcfsc5fad4f11ixkdr5 = (__1ixkcfsc5fad4f11ixkdr5 + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.TextXAlignment = Enum.TextXAlignment.Center
                  end
                  do
                    local _x1ixkcftc5fad4f21ixkdr8 = 1
                    _x1ixkcftc5fad4f21ixkdr8 = (_x1ixkcftc5fad4f21ixkdr8 + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.TextColor3 = _z1ixkcffc5fad4e41ixkdq2
                  end
                  do
                    local _z1ixkcfuc5fad4f31ixkdrb = 1
                    _z1ixkcfuc5fad4f31ixkdrb = (_z1ixkcfuc5fad4f31ixkdrb + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.ZIndex = (_1ixkcfmc5fad4eb1ixkdqn.ZIndex + 1)
                  end
                  do
                    local _m1ixkcfvc5fad4f41ixkdre = 1
                    _m1ixkcfvc5fad4f41ixkdre = (_m1ixkcfvc5fad4f41ixkdre + 0)
                    __1ixkcfnc5fad4ec1ixkdqq.Parent = _1ixkcfmc5fad4eb1ixkdqn.Parent
                  end
                end)
                do
                  local __1ixkcfxc5fad4f61ixkdrk = 1
                  __1ixkcfxc5fad4f61ixkdrk = (__1ixkcfxc5fad4f61ixkdrk + 0)
                  if _1ixkcfwc5fad4f51ixkdrh then
                    return
                  end
                end
              end
            end
          end
        end
      end)
    end
  end
end
do
  local _x1ixkcg3c5fad4fc1ixkds2 = 1
  _x1ixkcg3c5fad4fc1ixkds2 = (_x1ixkcg3c5fad4fc1ixkds2 + 0)
  Toggles.FarmShowRoute:OnChanged(function()
    do
      local __1ixkcg2c5fad4fb1ixkdrz = 1
      __1ixkcg2c5fad4fb1ixkdrz = (__1ixkcg2c5fad4fb1ixkdrz + 0)
      pcall(_x1ixkc27c5fad3081ixkcme)
    end
  end)
end
local function _z1ixkcg4c5fad4fd1ixkds5(_m1ixkcg5c5fad4fe1ixkds8)
  do
    local _1ixkcg6c5fad4ff1ixkdsb = 1
    _1ixkcg6c5fad4ff1ixkdsb = (_1ixkcg6c5fad4ff1ixkdsb + 0)
    if not _m1ixkcg5c5fad4fe1ixkds8 then
      return false
    end
  end
  local __1ixkcg7c5fad5001ixkdse, _x1ixkcg8c5fad5011ixkdsh = pcall(_m1ixkcg5c5fad4fe1ixkds8.GetState, _m1ixkcg5c5fad4fe1ixkds8)
  return (__1ixkcg7c5fad5001ixkdse and (_x1ixkcg8c5fad5011ixkdsh == true))
end
do
  local _z1ixkcg9c5fad5021ixkdsk = 1
  _z1ixkcg9c5fad5021ixkdsk = (_z1ixkcg9c5fad5021ixkdsk + 0)
  pcall(_z1ixkbxic5fad25f1ixkc8b)
end
local function _m1ixkcgac5fad5031ixkdsn(_1ixkcgbc5fad5041ixkdsq)
  do
    local __1ixkcgcc5fad5051ixkdst = 1
    __1ixkcgcc5fad5051ixkdst = (__1ixkcgcc5fad5051ixkdst + 0)
    _x1ixkbufc5fad1f01ixkbz2.busy, _x1ixkbufc5fad1f01ixkbz2.busySince = false, nil
  end
  do
    local _x1ixkcgdc5fad5061ixkdsw = 1
    _x1ixkcgdc5fad5061ixkdsw = (_x1ixkcgdc5fad5061ixkdsw + 0)
    _x1ixkbufc5fad1f01ixkbz2.goal, _x1ixkbufc5fad1f01ixkbz2.wps, _x1ixkbufc5fad1f01ixkbz2.wpi = nil, {}, 1
  end
  do
    local _z1ixkcgec5fad5071ixkdsz = 1
    _z1ixkcgec5fad5071ixkdsz = (_z1ixkcgec5fad5071ixkdsz + 0)
    _x1ixkbufc5fad1f01ixkbz2.approach, _x1ixkbufc5fad1f01ixkbz2.doorHint, _x1ixkbufc5fad1f01ixkbz2.lastGood = nil, nil, nil
  end
  do
    local _m1ixkcgfc5fad5081ixkdt2 = 1
    _m1ixkcgfc5fad5081ixkdt2 = (_m1ixkcgfc5fad5081ixkdt2 + 0)
    _x1ixkbufc5fad1f01ixkbz2.stuckTime, _x1ixkbufc5fad1f01ixkbz2.stuckStage, _x1ixkbufc5fad1f01ixkbz2.lastStuckPos = 0, nil, nil
  end
  do
    local _1ixkcggc5fad5091ixkdt5 = 1
    _1ixkcggc5fad5091ixkdt5 = (_1ixkcggc5fad5091ixkdt5 + 0)
    _x1ixkbufc5fad1f01ixkbz2.coolUntil, _x1ixkbufc5fad1f01ixkbz2.tries = 0, 0
  end
  do
    local __1ixkcghc5fad50a1ixkdt8 = 1
    __1ixkcghc5fad50a1ixkdt8 = (__1ixkcghc5fad50a1ixkdt8 + 0)
    _x1ixkbufc5fad1f01ixkbz2.nextSpawnTry = 0
  end
  do
    local _x1ixkcgic5fad50b1ixkdtb = 1
    _x1ixkcgic5fad50b1ixkdtb = (_x1ixkcgic5fad50b1ixkdtb + 0)
    _x1ixkbufc5fad1f01ixkbz2.note = _1ixkcgbc5fad5041ixkdsq
  end
end
local _m1ixkcgpc5fad5121ixkdtw = _x1ixkbtvc5fad1dc1ixkbxe.CharacterAdded:Connect(function(_z1ixkcgjc5fad50c1ixkdte)
  do
    local _m1ixkcgkc5fad50d1ixkdth = 1
    _m1ixkcgkc5fad50d1ixkdth = (_m1ixkcgkc5fad50d1ixkdth + 0)
    _m1ixkcgac5fad5031ixkdsn("respawned - starting over")
  end
  local _1ixkcglc5fad50e1ixkdtk = _z1ixkcgjc5fad50c1ixkdte:WaitForChild("Humanoid", 5)
  do
    local _z1ixkcgoc5fad5111ixkdtt = 1
    _z1ixkcgoc5fad5111ixkdtt = (_z1ixkcgoc5fad5111ixkdtt + 0)
    if _1ixkcglc5fad50e1ixkdtk then
      do
        local _x1ixkcgnc5fad5101ixkdtq = 1
        _x1ixkcgnc5fad5101ixkdtq = (_x1ixkcgnc5fad5101ixkdtq + 0)
        _1ixkcglc5fad50e1ixkdtk.Died:Connect(function()
          do
            local __1ixkcgmc5fad50f1ixkdtn = 1
            __1ixkcgmc5fad50f1ixkdtn = (__1ixkcgmc5fad50f1ixkdtn + 0)
            _m1ixkcgac5fad5031ixkdsn("died - will re-apply for the job if it was lost")
          end
        end)
      end
    end
  end
end)
do
  local _1ixkcgvc5fad5181ixkdue = 1
  _1ixkcgvc5fad5181ixkdue = (_1ixkcgvc5fad5181ixkdue + 0)
  do
    local _1ixkcgqc5fad5131ixkdtz = _x1ixkbtvc5fad1dc1ixkbxe.Character
    local __1ixkcgrc5fad5141ixkdu2 = (_1ixkcgqc5fad5131ixkdtz and _1ixkcgqc5fad5131ixkdtz:FindFirstChildOfClass("Humanoid"))
    do
      local _m1ixkcguc5fad5171ixkdub = 1
      _m1ixkcguc5fad5171ixkdub = (_m1ixkcguc5fad5171ixkdub + 0)
      if __1ixkcgrc5fad5141ixkdu2 then
        do
          local _z1ixkcgtc5fad5161ixkdu8 = 1
          _z1ixkcgtc5fad5161ixkdu8 = (_z1ixkcgtc5fad5161ixkdu8 + 0)
          __1ixkcgrc5fad5141ixkdu2.Died:Connect(function()
            do
              local _x1ixkcgsc5fad5151ixkdu5 = 1
              _x1ixkcgsc5fad5151ixkdu5 = (_x1ixkcgsc5fad5151ixkdu5 + 0)
              _m1ixkcgac5fad5031ixkdsn("died - will re-apply for the job if it was lost")
            end
          end)
        end
      end
    end
  end
end
local __1ixkcgwc5fad5191ixkduh = true
do
  local __1ixkchqc5fad5371ixkdwz = 1
  __1ixkchqc5fad5371ixkdwz = (__1ixkchqc5fad5371ixkdwz + 0)
  task.spawn(function()
    local _x1ixkcgxc5fad51a1ixkduk = os.clock()
    do
      local _m1ixkchoc5fad5351ixkdwt = 1
      _m1ixkchoc5fad5351ixkdwt = (_m1ixkchoc5fad5351ixkdwt + 0)
      while __1ixkcgwc5fad5191ixkduh do
        local _z1ixkcgyc5fad51b1ixkdun = os.clock()
        local _m1ixkcgzc5fad51c1ixkduq = math.min((_z1ixkcgyc5fad51b1ixkdun - _x1ixkcgxc5fad51a1ixkduk), 0.2)
        do
          local _1ixkch0c5fad51d1ixkdut = 1
          _1ixkch0c5fad51d1ixkdut = (_1ixkch0c5fad51d1ixkdut + 0)
          _x1ixkcgxc5fad51a1ixkduk = _z1ixkcgyc5fad51b1ixkdun
        end
        do
          local __1ixkch1c5fad51e1ixkduw = 1
          __1ixkch1c5fad51e1ixkduw = (__1ixkch1c5fad51e1ixkduw + 0)
          pcall(__1ixkby0c5fad2711ixkc9t)
        end
        do
          local _1ixkch5c5fad5221ixkdv8 = 1
          _1ixkch5c5fad5221ixkdv8 = (_1ixkch5c5fad5221ixkdv8 + 0)
          if ((_x1ixkbufc5fad1f01ixkbz2.busy and _x1ixkbufc5fad1f01ixkbz2.busySince) and (((os.clock() - _x1ixkbufc5fad1f01ixkbz2.busySince)) > 15)) then
            do
              local _x1ixkch2c5fad51f1ixkduz = 1
              _x1ixkch2c5fad51f1ixkduz = (_x1ixkch2c5fad51f1ixkduz + 0)
              _x1ixkbufc5fad1f01ixkbz2.busy = false
            end
            do
              local _z1ixkch3c5fad5201ixkdv2 = 1
              _z1ixkch3c5fad5201ixkdv2 = (_z1ixkch3c5fad5201ixkdv2 + 0)
              _x1ixkbufc5fad1f01ixkbz2.goal, _x1ixkbufc5fad1f01ixkbz2.wps, _x1ixkbufc5fad1f01ixkbz2.wpi = nil, {}, 1
            end
            do
              local _m1ixkch4c5fad5211ixkdv5 = 1
              _m1ixkch4c5fad5211ixkdv5 = (_m1ixkch4c5fad5211ixkdv5 + 0)
              _x1ixkbufc5fad1f01ixkbz2.note = "recovered from a stalled interaction"
            end
          end
        end
        do
          local __1ixkch6c5fad5231ixkdvb = 1
          __1ixkch6c5fad5231ixkdvb = (__1ixkch6c5fad5231ixkdvb + 0)
          _x1ixkbufc5fad1f01ixkbz2.on = (Toggles.FarmOn.Value or _z1ixkcg4c5fad4fd1ixkds5(Options.FarmKey))
        end
        do
          local _x1ixkch7c5fad5241ixkdve = 1
          _x1ixkch7c5fad5241ixkdve = (_x1ixkch7c5fad5241ixkdve + 0)
          pcall(_x1ixkcdbc5fad4981ixkdjq)
        end
        do
          local _z1ixkch8c5fad5251ixkdvh = 1
          _z1ixkch8c5fad5251ixkdvh = (_z1ixkch8c5fad5251ixkdvh + 0)
          pcall(_x1ixkbyvc5fad2901ixkcce)
        end
        do
          local _x1ixkchhc5fad52e1ixkdw8 = 1
          _x1ixkchhc5fad52e1ixkdw8 = (_x1ixkchhc5fad52e1ixkdw8 + 0)
          if (_x1ixkbufc5fad1f01ixkbz2.on and not _x1ixkbufc5fad1f01ixkbz2.busy) then
            local _m1ixkch9c5fad5261ixkdvk, _1ixkchac5fad5271ixkdvn = pcall(_z1ixkc8rc5fad3f41ixkd62, _m1ixkcgzc5fad51c1ixkduq)
            do
              local _x1ixkchcc5fad5291ixkdvt = 1
              _x1ixkchcc5fad5291ixkdvt = (_x1ixkchcc5fad5291ixkdvt + 0)
              if not _m1ixkch9c5fad5261ixkdvk then
                do
                  local __1ixkchbc5fad5281ixkdvq = 1
                  __1ixkchbc5fad5281ixkdvq = (__1ixkchbc5fad5281ixkdvq + 0)
                  _x1ixkbufc5fad1f01ixkbz2.note = ("error: " .. tostring(_1ixkchac5fad5271ixkdvn))
                end
              end
            end
          elseif not _x1ixkbufc5fad1f01ixkbz2.on then
            do
              local _m1ixkchec5fad52b1ixkdvz = 1
              _m1ixkchec5fad52b1ixkdvz = (_m1ixkchec5fad52b1ixkdvz + 0)
              if next(_z1ixkbugc5fad1f11ixkbz5) then
                do
                  local _z1ixkchdc5fad52a1ixkdvw = 1
                  _z1ixkchdc5fad52a1ixkdvw = (_z1ixkchdc5fad52a1ixkdvw + 0)
                  _x1ixkbupc5fad1fa1ixkbzw()
                end
              end
            end
            do
              local _1ixkchfc5fad52c1ixkdw2 = 1
              _1ixkchfc5fad52c1ixkdw2 = (_1ixkchfc5fad52c1ixkdw2 + 0)
              pcall(_z1ixkc5ac5fad3771ixkcvn)
            end
            do
              local __1ixkchgc5fad52d1ixkdw5 = 1
              __1ixkchgc5fad52d1ixkdw5 = (__1ixkchgc5fad52d1ixkdw5 + 0)
              _x1ixkbufc5fad1f01ixkbz2.note = "off"
            end
          end
        end
        do
          local _x1ixkchmc5fad5331ixkdwn = 1
          _x1ixkchmc5fad5331ixkdwn = (_x1ixkchmc5fad5331ixkdwn + 0)
          pcall(function()
            local _z1ixkchic5fad52f1ixkdwb = __1ixkc17c5fad2e41ixkcje()
            local _m1ixkchjc5fad5301ixkdwe = (_z1ixkchic5fad52f1ixkdwb and _z1ixkchic5fad52f1ixkdwb:FindFirstChild("Chassis"))
            local _1ixkchkc5fad5311ixkdwh = ((_m1ixkchjc5fad5301ixkdwe and __1ixkbu4c5fad1e51ixkby5.studs_per_second_to_miles_per_hour(_m1ixkchjc5fad5301ixkdwe.AssemblyLinearVelocity.Magnitude)) or 0)
            do
              local __1ixkchlc5fad5321ixkdwk = 1
              __1ixkchlc5fad5321ixkdwk = (__1ixkchlc5fad5321ixkdwk + 0)
              _x1ixkcekc5fad4c51ixkdnh:SetText(("%s\nstage: %s   bags: %d\nspeed: %d mph   delivered: %d%s"):format(_x1ixkbufc5fad1f01ixkbz2.note, (((_x1ixkbufc5fad1f01ixkbz2.stage ~= "") and _x1ixkbufc5fad1f01ixkbz2.stage) or "-"), _1ixkbzic5fad2a71ixkceb(), math.floor(_1ixkchkc5fad5311ixkdwh), _x1ixkbufc5fad1f01ixkbz2.done, ((_x1ixkbufc5fad1f01ixkbz2.noBike and "\nno bike of yours is spawned - walking") or "")))
            end
          end)
        end
        do
          local _z1ixkchnc5fad5341ixkdwq = 1
          _z1ixkchnc5fad5341ixkdwq = (_z1ixkchnc5fad5341ixkdwq + 0)
          task.wait((1 / 30))
        end
      end
    end
    do
      local _1ixkchpc5fad5361ixkdww = 1
      _1ixkchpc5fad5361ixkdww = (_1ixkchpc5fad5361ixkdww + 0)
      _x1ixkbupc5fad1fa1ixkbzw()
    end
  end)
end
do
  local _z1ixkcicc5fad54d1ixkdyt = 1
  _z1ixkcicc5fad54d1ixkdyt = (_z1ixkcicc5fad54d1ixkdyt + 0)
  _1ixkcenc5fad4c81ixkdnq = function()
    do
      local _x1ixkchrc5fad5381ixkdx2 = 1
      _x1ixkchrc5fad5381ixkdx2 = (_x1ixkchrc5fad5381ixkdx2 + 0)
      __1ixkcgwc5fad5191ixkduh, _x1ixkbufc5fad1f01ixkbz2.on, _x1ixkbufc5fad1f01ixkbz2.running = false, false, false
    end
    do
      local _m1ixkchtc5fad53a1ixkdx8 = 1
      _m1ixkchtc5fad53a1ixkdx8 = (_m1ixkchtc5fad53a1ixkdx8 + 0)
      pcall(function()
        do
          local _z1ixkchsc5fad5391ixkdx5 = 1
          _z1ixkchsc5fad5391ixkdx5 = (_z1ixkchsc5fad5391ixkdx5 + 0)
          _m1ixkcgpc5fad5121ixkdtw:Disconnect()
        end
      end)
    end
    do
      local __1ixkchvc5fad53c1ixkdxe = 1
      __1ixkchvc5fad53c1ixkdxe = (__1ixkchvc5fad53c1ixkdxe + 0)
      pcall(function()
        do
          local _1ixkchuc5fad53b1ixkdxb = 1
          _1ixkchuc5fad53b1ixkdxb = (_1ixkchuc5fad53b1ixkdxb + 0)
          __1ixkcdac5fad4971ixkdjn:Disconnect()
        end
      end)
    end
    do
      local _x1ixkchwc5fad53d1ixkdxh = 1
      _x1ixkchwc5fad53d1ixkdxh = (_x1ixkchwc5fad53d1ixkdxh + 0)
      pcall(_x1ixkbupc5fad1fa1ixkbzw)
    end
    do
      local _z1ixkchxc5fad53e1ixkdxk = 1
      _z1ixkchxc5fad53e1ixkdxk = (_z1ixkchxc5fad53e1ixkdxk + 0)
      pcall(_z1ixkc5ac5fad3771ixkcvn)
    end
    do
      local _m1ixkchyc5fad53f1ixkdxn = 1
      _m1ixkchyc5fad53f1ixkdxn = (_m1ixkchyc5fad53f1ixkdxn + 0)
      pcall(_x1ixkbzac5fad29f1ixkcdn)
    end
    do
      local _x1ixkci1c5fad5421ixkdxw = 1
      _x1ixkci1c5fad5421ixkdxw = (_x1ixkci1c5fad5421ixkdxw + 0)
      if (_x1ixkbxhc5fad25e1ixkc88 and _1ixkbxfc5fad25c1ixkc82) then
        do
          local __1ixkci0c5fad5411ixkdxt = 1
          __1ixkci0c5fad5411ixkdxt = (__1ixkci0c5fad5411ixkdxt + 0)
          pcall(function()
            do
              local _1ixkchzc5fad5401ixkdxq = 1
              _1ixkchzc5fad5401ixkdxq = (_1ixkchzc5fad5401ixkdxq + 0)
              _x1ixkbxhc5fad25e1ixkc88.has_ragdoll_ownership = _1ixkbxfc5fad25c1ixkc82
            end
          end)
        end
      end
    end
    do
      local _1ixkci4c5fad5451ixkdy5 = 1
      _1ixkci4c5fad5451ixkdy5 = (_1ixkci4c5fad5451ixkdy5 + 0)
      if __1ixkbxgc5fad25d1ixkc85 then
        do
          local _m1ixkci3c5fad5441ixkdy2 = 1
          _m1ixkci3c5fad5441ixkdy2 = (_m1ixkci3c5fad5441ixkdy2 + 0)
          pcall(function()
            do
              local _z1ixkci2c5fad5431ixkdxz = 1
              _z1ixkci2c5fad5431ixkdxz = (_z1ixkci2c5fad5431ixkdxz + 0)
              _z1ixkbxdc5fad25a1ixkc7w.update_mode = __1ixkbxgc5fad25d1ixkc85
            end
          end)
        end
      end
    end
    do
      local _m1ixkci8c5fad5491ixkdyh = 1
      _m1ixkci8c5fad5491ixkdyh = (_m1ixkci8c5fad5491ixkdyh + 0)
      if __1ixkc26c5fad3071ixkcmb then
        do
          local _x1ixkci6c5fad5471ixkdyb = 1
          _x1ixkci6c5fad5471ixkdyb = (_x1ixkci6c5fad5471ixkdyb + 0)
          pcall(function()
            do
              local __1ixkci5c5fad5461ixkdy8 = 1
              __1ixkci5c5fad5461ixkdy8 = (__1ixkci5c5fad5461ixkdy8 + 0)
              __1ixkc26c5fad3071ixkcmb:Destroy()
            end
          end)
        end
        do
          local _z1ixkci7c5fad5481ixkdye = 1
          _z1ixkci7c5fad5481ixkdye = (_z1ixkci7c5fad5481ixkdye + 0)
          __1ixkc26c5fad3071ixkcmb = nil
        end
      end
    end
    do
      local _x1ixkcibc5fad54c1ixkdyq = 1
      _x1ixkcibc5fad54c1ixkdyq = (_x1ixkcibc5fad54c1ixkdyq + 0)
      if getgenv then
        do
          local __1ixkciac5fad54b1ixkdyn = 1
          __1ixkciac5fad54b1ixkdyn = (__1ixkciac5fad54b1ixkdyn + 0)
          pcall(function()
            do
              local _1ixkci9c5fad54a1ixkdyk = 1
              _1ixkci9c5fad54a1ixkdyk = (_1ixkci9c5fad54a1ixkdyk + 0)
              getgenv().ZenP12FarmUnload = nil
            end
          end)
        end
      end
    end
  end
end
do
  local _m1ixkcidc5fad54e1ixkdyw = 1
  _m1ixkcidc5fad54e1ixkdyw = (_m1ixkcidc5fad54e1ixkdyw + 0)
  _x1ixkcdvc5fad4ac1ixkdle:OnUnload(_1ixkcenc5fad4c81ixkdnq)
end
do
  local _x1ixkcilc5fad5561ixkdzk = 1
  _x1ixkcilc5fad5561ixkdzk = (_x1ixkcilc5fad5561ixkdzk + 0)
  if getgenv then
    do
      local __1ixkcikc5fad5551ixkdzh = 1
      __1ixkcikc5fad5551ixkdzh = (__1ixkcikc5fad5551ixkdzh + 0)
      getgenv().ZenP12FarmUnload = function()
        do
          local __1ixkcifc5fad5501ixkdz2 = 1
          __1ixkcifc5fad5501ixkdz2 = (__1ixkcifc5fad5501ixkdz2 + 0)
          pcall(function()
            do
              local _1ixkciec5fad54f1ixkdyz = 1
              _1ixkciec5fad54f1ixkdyz = (_1ixkciec5fad54f1ixkdyz + 0)
              _x1ixkcdvc5fad4ac1ixkdle:Unload()
            end
          end)
        end
        do
          local _x1ixkcigc5fad5511ixkdz5 = 1
          _x1ixkcigc5fad5511ixkdz5 = (_x1ixkcigc5fad5511ixkdz5 + 0)
          pcall(_1ixkcenc5fad4c81ixkdnq)
        end
        do
          local _1ixkcijc5fad5541ixkdze = 1
          _1ixkcijc5fad5541ixkdze = (_1ixkcijc5fad5541ixkdze + 0)
          pcall(function()
            do
              local _m1ixkciic5fad5531ixkdzb = 1
              _m1ixkciic5fad5531ixkdzb = (_m1ixkciic5fad5531ixkdzb + 0)
              if (_m1ixkcemc5fad4c71ixkdnn and _m1ixkcemc5fad4c71ixkdnn.Parent) then
                do
                  local _z1ixkcihc5fad5521ixkdz8 = 1
                  _z1ixkcihc5fad5521ixkdz8 = (_z1ixkcihc5fad5521ixkdz8 + 0)
                  _m1ixkcemc5fad4c71ixkdnn:Destroy()
                end
              end
            end
          end)
        end
      end
    end
  end
end
do
  local _z1ixkcimc5fad5571ixkdzn = 1
  _z1ixkcimc5fad5571ixkdzn = (_z1ixkcimc5fad5571ixkdzn + 0)
  _x1ixkcdvc5fad4ac1ixkdle:Notify("Zenith Autofarm loaded", 4)
end