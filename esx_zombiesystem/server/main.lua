ESX = exports['es_extended']:getSharedObject() 

players = {}

RegisterServerEvent("esx_zombiesystem:newplayer")
AddEventHandler("esx_zombiesystem:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

function IsMilitaryVehicle(vehicle)
    local model = GetEntityModel(vehicle)
    for _, militaryVehicle in ipairs(Config.MilitaryVehicles) do
        if model == GetHashKey(militaryVehicle) then
            return true
        end
    end
    return false
end

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("esx_zombiesystem:clear", source)
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("onResourceStop", function()
    TriggerClientEvent("esx_zombiesystem:clear", -1)
end)

RegisterServerEvent('esx_zombiesystem:moneyloot')
AddEventHandler('esx_zombiesystem:moneyloot', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(900, 1100)
    xPlayer.addMoney(random)
    TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. random .. ' dollars'))
end)

RegisterServerEvent('esx_zombiesystem:itemloot')
AddEventHandler('esx_zombiesystem:itemloot', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(1, 3)
    if xPlayer.canCarryItem(item, random) then
        xPlayer.addInventoryItem(item, random)
        TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. random .. 'x ~b~' .. item))
    else
        xPlayer.showNotification('You cannot pickup that because your inventory is full!')
    end
end)

entitys = {}

RegisterServerEvent('esx_zombiesystem:militaryVehicleKill')
AddEventHandler('esx_zombiesystem:militaryVehicleKill', function(vehicle, weaponUsed)
    local xPlayer = ESX.GetPlayerFromId(source)
    if IsEntityAVehicle(vehicle) and IsVehicleWeapon(weaponUsed) and IsMilitaryVehicle(vehicle) then
        local randomChance = math.random(1, 100)
        local randomWeapon = Config.WeaponLoot[math.random(1, #Config.WeaponLoot)]
        local randomItem = Config.ItemLoot[math.random(1, #Config.ItemLoot)]

        if randomChance > 0 and randomChance < Config.ProbabilityWeaponLoot then
            local randomAmmo = math.random(1, 30)
            xPlayer.addWeapon(randomWeapon, randomAmmo)
            TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ' .. randomWeapon))
        elseif randomChance >= Config.ProbabilityWeaponLoot and randomChance < Config.ProbabilityMoneyLoot then
            local randomMoney = math.random(900, 1100)
            xPlayer.addMoney(randomMoney)
            TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. randomMoney .. ' dollars'))
        elseif randomChance >= Config.ProbabilityMoneyLoot and randomChance < Config.ProbabilityItemLoot then
            local randomItemCount = math.random(1, 3)
            if xPlayer.canCarryItem(randomItem, randomItemCount) then
                xPlayer.addInventoryItem(randomItem, randomItemCount)
                TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. randomItemCount .. 'x ~b~' .. randomItem))
            else
                xPlayer.showNotification('You cannot pickup that because your inventory is full!')
            end
        else
            TriggerClientEvent("esx:showNotification", xPlayer.source, 'You found nothing')
        end
    end
end)

RegisterServerEvent("RegisterNewZombie")
AddEventHandler("RegisterNewZombie", function(entity)
    TriggerClientEvent("ZombieSync", -1, entity)
    table.insert(entitys, entity)
end)
