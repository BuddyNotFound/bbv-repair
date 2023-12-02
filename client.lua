Main = {
    ped = PlayerPedId
}

RegisterNetEvent('bbv-repair:start', function()
    if Config.minigame.minigames == "ps" then
        Psui()
    elseif Config.minigame.minigames == "none" then
        nominigame()
    end
end)


RegisterNetEvent('bbv-repair:usekit',function()
	if not IsPedInAnyVehicle(PlayerPedId()) then return end
    local ped = Main.ped()
    local ped_pos = GetEntityCoords(ped)
    Main.veh,Main.dist = Wrapper:GetClosesVeh(ped_pos)
    if Main.dist < Config.Settings.Distance then
        Main:RepairCam()
    else
        Wrapper:Notify(Config.Button.NoVeh,'error',6000)
    end
end)

nominigame = function ()
    Wrapper:RemoveItem('repairkit',1)
    SetVehicleEngineHealth(Main.veh, 1000)
    SetVehicleEngineOn( Main.veh, true, true )
    SetVehicleFixed(Main.veh)
    RenderScriptCams(false, 1, 1500,  false,  false)
    Main.veh = nil
end

Psui = function()
    exports['ps-ui']:Circle(function(success)
        if success then
            print("success")
            Wrapper:RemoveItem('repairkit', 1)
            SetVehicleEngineHealth(Main.veh, 1000)
            SetVehicleEngineOn(Main.veh, true, true)
            SetVehicleFixed(Main.veh)
            RenderScriptCams(false, 1, 1500, false, false)
            Main.veh = nil
        else
            Wrapper:Notify("You Failed")
        end
    end, 5, 12)
end

function Main:RepairCam()
    Main.Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    RenderScriptCams(true, 1, 1500,  true,  true)
    self:processCamera(Main.Cam)
    Wait(1500)
    exports['bbv-interactbutton']:button(Config.Button.FirstText,Config.Button.EndText,Config.Button.Event,Config.Button.Time)
end

function Main:processCamera(cam)
	SetVehicleDoorOpen(Main.veh, 4, false, false)

	local vehpos = GetEntityCoords(Main.veh)
	local vehfront = GetEntityForwardVector(Main.veh)
	local vehfrontpos = vector3(vehpos.x + (vehfront.x * 3),vehpos.y + (vehfront.y * 3) ,vehpos.z + (vehfront.z * 2) )

	local rotx, roty, rotz = table.unpack(GetEntityRotation(PlayerPedId()))
	local camX, camY, camZ = table.unpack(GetGameplayCamCoord())
	local camRX, camRY, camRZ = GetGameplayCamRelativePitch(), 0.0, GetGameplayCamRelativeHeading()
	local camF = GetGameplayCamFov()
	local camRZ = (rotz+camRZ)

	SetCamCoord(cam, vehfrontpos.x, vehfrontpos.y, vehfrontpos.z + 1.5)
	PointCamAtCoord(cam, vehpos.x,vehpos.y,vehpos.z - 1)
	SetCamFov(cam, camF)
end

RegisterCommand(Config.Settings.Command, function()
    if Config.Settings.Framework == 'ST' then 
        TriggerEvent('bbv-repair:usekit')
    end
end)
