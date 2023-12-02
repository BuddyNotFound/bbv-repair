if Config.Settings.Framework == "QB" then 
    QBCore.Functions.CreateUseableItem(Config.Settings.ItemName, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemByName(item.name) then
            TriggerClientEvent('bbv-repair:usekit', src)
        end
    end)
end

if Config.Settings.Framework == "ESX" then 
    ESX.RegisterUsableItem(Config.Settings.ItemName, function(source)
        local src = source
        TriggerClientEvent('bbv-repair:usekit', src)
    end)
end
