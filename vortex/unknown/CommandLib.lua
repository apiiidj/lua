

-- This file was protected using Vortex Obfuscator [ClydeProtection]

local HttpService = game:GetService("HttpService")

local CommandLib = {}
CommandLib.commands = {}

function CommandLib:RegisterCommand(name, callback)
    assert(typeof(name) == "string", "Command name must be a string")
    assert(typeof(callback) == "function", "Callback must be a function")
    self.commands[name:lower()] = callback
end

function CommandLib:HandleMessage(msg)
    local data
    local ok = pcall(function()
        data = HttpService:JSONDecode(msg)
    end)

    if ok and type(data) == "table" and data.type then
        local cmd = data.type:lower()
        local handler = self.commands[cmd]
        if handler then
            handler(data)
        else
            warn("Unhandled JSON command:", cmd)
        end
        return
    end

    if typeof(msg) == "string" then
        for cmd, handler in pairs(self.commands) do
            local prefix = cmd .. ": "
            if msg:sub(1, #prefix):lower() == prefix then
                local content = msg:sub(#prefix + 1)
                handler(content)
                return
            end
        end
    end

    
end

function CommandLib:ListCommands()
    local t = {}
    for k, _ in pairs(self.commands) do
        table.insert(t, k)
    end
    return t
end

return CommandLib
