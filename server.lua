if Config.Settings.Framework == "QB" then 
    QBCore.Functions.CreateUseableItem('repairkit', function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemByName(item.name) then
            TriggerClientEvent('bbv-repair:start', src)
        end
    end)
end

if Config.Settings.Framework == "ESX" then 
    ESX.RegisterUsableItem('repairkit', function(source)
        local src = source
        TriggerClientEvent('bbv-repair:start', src)
    end)
end
