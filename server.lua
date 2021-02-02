
RegisterCommand("freeze", function(source, args, rawCommand)
    st = stringsplit(rawCommand, " ")
    if #args < 1 then 
        TriggerClientEvent('chatMessage', source, "^1Use /freeze <ID> or this player is no longer online.")
        return;
    end
    id = st[2]
    if GetPlayerIdentifiers(id)[1] == nil then
        TriggerClientEvent("chatMessage", source, "^1Use /freeze <ID> or this player is no longer online.")
        return;
    end
    local ped = GetPlayerPed(source)
    local ped2 = GetPlayerPed(id)
    local name = GetPlayerName(id)
    if IsPlayerAceAllowed(source, Config.acePerm) then
        TriggerClientEvent("freeze:freezePlayer", id)
        TriggerClientEvent("chatMessage", source, "^2You have frozen "..name)
        TriggerClientEvent("chatMessage", id, Config.frozenMsg.." "..GetPlayerName(source))
    else
    	TriggerClientEvent('chatMessage', source, Config.invalidPerms)
    end
end)


RegisterCommand("unfreeze", function(source, args, rawCommand)
    st = stringsplit(rawCommand, " ")
    if #args < 1 then 
        TriggerClientEvent('chatMessage', source, "^1Use /unfreeze <ID> or this player is no longer online.")
        return;
    end
    id = st[2]
    if GetPlayerIdentifiers(id)[1] == nil then
        TriggerClientEvent("chatMessage", source, "^1Use /unfreeze <ID> or this player is no longer online.")
        return;
    end
    local name = GetPlayerName(id)
    local ped = GetPlayerPed(-1)
    if IsPlayerAceAllowed(source, Config.acePerm) then
        TriggerClientEvent("freeze:unfreezePlayer", id)
        TriggerClientEvent("chatMessage", source, "^2You have unfrozen "..name)
        TriggerClientEvent("chatMessage", id, Config.unfrozenMsg.." "..name)
    else
    	TriggerClientEvent('chatMessage', source, Config.invalidPerms)
    end
end)



  function stringsplit(input, seperator)
    if seperator == nil then
        seperator = '%s'
    end
    
    local t={} ; i=1
    
    for str in string.gmatch(input, '([^'..seperator..']+)') do
        t[i] = str
        i = i + 1
    end
    
    return t
end

-- Discord: qavas#0746 || Github: https://github.com/qavas  || FiveM Forums: https://forum.cfx.re/u/qavas
-- Discord: Itachii#5291 || Github: https://github.com/apxtony || FiveM Forums: https://forum.cfx.re/u/apxtony