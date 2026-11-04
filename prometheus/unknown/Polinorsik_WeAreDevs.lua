local IDev = {}
local http = http_request
function IDev:Obfuscate(script)
    local response = http({
        Url = "https://wearedevs.net/api/obfuscate",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
        },
        Body = game:GetService("HttpService"):JSONEncode({
            script = tostring(script),
        })
    })

    if response and response.Body and game:GetService("HttpService"):JSONDecode(response.Body) and game:GetService("HttpService"):JSONDecode(response.Body).success == true then
        return game:GetService("HttpService"):JSONDecode(response.Body).obfuscated or "Failed"
    end
end
return IDev