frozen = false
RegisterNetEvent('freeze:freezePlayer')
AddEventHandler('freeze:freezePlayer', function()
    FreezeEntityPosition(GetPlayerPed(-1), true)
    frozen = true
    if frozen == true then
        SetEntityHealth(GetPlayerPed(-1), 100)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end)

RegisterNetEvent('freeze:unfreezePlayer')
AddEventHandler('freeze:unfreezePlayer', function()
    FreezeEntityPosition(GetPlayerPed(-1), false)
    local ped = GetPlayerPed(-1)
    frozen = false
    if frozen == false then
        local playerCoords = GetEntityCoords(ped)
        SetEntityCoords(ped, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, false)
        ClearPedTasksImmediately(GetPlayerPed(-1))
        SetEntityHealth(GetPlayerPed(-1), 100)
        end
end)



-- Discord: qavas#0746 || Github: https://github.com/qavas  || FiveM Forums: https://forum.cfx.re/u/qavas
-- Discord: Itachii#5291 || Github: https://github.com/apxtony || FiveM Forums: https://forum.cfx.re/u/apxtony