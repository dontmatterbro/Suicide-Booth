SBTH = {} -- Suicide Booth
SBTH.Name="Suicide Booth"
SBTH.Version = "A1.0.0"
SBTH.VersionNum = 010100000
SBTH.MinNTVersion = "A1.9.4h1"
SBTH.MinNTVersionNum = 01090401
SBTH.Path = table.pack(...)[1]
Timer.Wait(function() if NTC ~= nil then NTC.RegisterExpansion(SBTH) end end,1)


Timer.Wait(function() 
	--only enable lua part if NT exists
	if (SERVER or (CLIENT and not Game.IsMultiplayer)) and NTC==nil then
		return
	end
	
		--server side scripts
	if (SERVER or (CLIENT and not Game.IsMultiplayer)) then
		dofile(SBTH.Path.."/Lua/Scripts/Server/scoop.lua")
	end

end,1)


