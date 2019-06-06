local jailed = false

local defaultTime = 60

RegisterNetEvent('jailPlayer')
AddEventHandler('jailPlayer', function(ptime)
    defaultTime = ptime
    if not jailed then
        local ped = GetPlayerPed(PlayerId())
        SetEntityCoordsNoOffset(ped, 1798.65, 2483.26, -122.702, false, false, false, true)
        jailed = true
    end
end)

function TeleportOutJail()
    SetEntityCoords(GetPlayerPed(PlayerId()), 1851.12, 2585.54, 45.672, 0.0, 0.0, 0.0, false)
    SetEntityInvincible(GetPlayerPed(PlayerId()), false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if jailed then
            SetEntityInvincible(GetPlayerPed(PlayerId()), true)
            for i = 1, defaultTime do
                Citizen.Wait(1000)
               --Citizen.Trace("TIME LEFT: " .. tostring(defaultTime - i))
                if defaultTime - i == 0 then
                    jailed = false
                    TeleportOutJail()
                end
            end
        end
    end
end)