local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function GetExecutor()
    local exploit = (syn and "Synapse X") or 
                    (secure_load and "Sentinel") or 
                    (WrapGlobal and "WeAreDevs") or
                    (IsElectron and "Electron") or
                    (SONA_LOADED and "Sona") or
                    (PROTOSMASHER_LOADED and "ProtoSmasher") or
                    (SIRHURT_LOADED and "SirHurt") or
                    (IDENTIFYEXECUTOR and identifyexecutor()) or
                    (getexecutorname and getexecutorname()) or
                    "Unknown"
    
    return tostring(exploit)
end

local executorName = GetExecutor()
local totalWidth = 38

local function centeredText(text)
    local padding = math.floor((totalWidth - #text) / 2)
    return string.rep(" ", padding) .. text
end

warn("======================================")
warn("")
warn(centeredText("SCRIPTS BACKUP"))
warn("")
warn(centeredText("Credits : Scripts Owners"))
warn(centeredText("Executor : " .. executorName))
warn(centeredText("Thanks for using it " .. player.Name .. "!"))
warn(centeredText("Backup by : therealaxios on Discord"))
warn("")
warn("======================================")
