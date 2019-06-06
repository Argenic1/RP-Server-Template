
leo = {
	"steam:127001abcdefg"
}

RegisterCommand('jail', function(source, args)
    local PlyID = tonumber(args[1])
	local PlyTime = tonumber(args[2])
		for i = 1, #leo do
			if GetPlayerIdentifiers(source)[1] == leo[i] then
				TriggerClientEvent('jailPlayer', PlyID, PlyTime)
			end
		end
end)