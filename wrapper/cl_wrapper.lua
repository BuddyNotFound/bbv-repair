
Wrapper = {}

function Wrapper:Notify(txt,tp,time) -- QBCore notify
    if Config.Settings.Framework == "QB" then 
    QBCore.Functions.Notify(txt, tp, time)
    end
    if Config.Settings.Framework == "ESX" then 
        ESX.ShowNotification(txt)
    end
    if Config.Settings.Framework == "ST" then 
        SetNotificationTextEntry('STRING')
        AddTextComponentString(txt)
        DrawNotification(0,1)    
    end
end

function Wrapper:RemoveItem(item,amount)
    if Config.Settings.Framework ~= "ST" then 
        TriggerServerEvent("bbv-repair:RemoveItem", item, amount)
    end
end

function Wrapper:GetClosesVeh(_coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    local coords = _coords

    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end

    return closestVehicle,closestDistance
end