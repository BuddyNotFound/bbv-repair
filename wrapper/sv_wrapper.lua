Wrapper = {
    resname = GetCurrentResourceName(),
    ServerCallbacks = {}
}

RegisterNetEvent("bbv-repair:RemoveItem",function(item,amount)
    Wrapper:RemoveItemServer(item,amount)
end)

function Wrapper:RemoveItemServer(item,amount)
    if Config.Settings.Framework == "QB" then 
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.RemoveItem(item, amount) 
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
    end
    if Config.Settings.Framework == "QBX" then 
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.RemoveItem(item, amount) 
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
    end
    if Config.Settings.Framework == "ESX" then 
        local src = source 
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeInventoryItem(item, amount)
    end
end
