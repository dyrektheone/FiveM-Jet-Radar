local ActiveVehicle = nil
local friendlyVehicles = {}

Citizen.CreateThread(function()
    DoScreenFadeIn(0)
    while true do Wait(500)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped,false)

        TriggerEvent("jet_radar:suitableVehicleFound",IsVehicleReady(vehicle) and vehicle or nil)

        ::skip::
    end
end)

Citizen.CreateThread(function()
    while true do 
        if ActiveVehicle == nil then 
            Wait(500)
        elseif ActiveVehicle ~= nil then 
            Wait(250)

            local detectReadyVehicles = GatherAllSuitableTargets()
            local playerVehicle = GetVehiclePedIsIn(PlayerPedId(),false)

            local playerCoords = GetEntityCoords(playerVehicle)
            local playerHeading = GetEntityHeading(playerVehicle)

            local vehiclesWithDegrees = {}

            for _,readyVehicle in ipairs(detectReadyVehicles) do 
                local readyCoords = GetEntityCoords(readyVehicle)
                local isFriendly = false 
                
                if friendlyVehicles[readyVehicle] == "yes" then
                    isFriendly = true 
                end


                table.insert(vehiclesWithDegrees,
                    {
                        readyCoords.x-playerCoords.x,
                        readyCoords.y-playerCoords.y,
                        playerHeading,
                        isFriendly
                    }
                )
            end
            SendNUIMessage({
                load=vehiclesWithDegrees,
                radarDistance=Config.RadarDetectOptions.HorizontalLimit
            })
        end 
    end
end)

RegisterNetEvent("jet_radar:suitableVehicleFound",function(newVehicle)
    ActiveVehicle = newVehicle
    SendNUIMessage({
        show=not(newVehicle==nil)
    })
end)

RegisterNetEvent("jet_radar:registerVehicleAsFriendly",function(vehicle)
    friendlyVehicles[vehicle] = "yes"
end)

RegisterNetEvent("jet_radar:removeVehicleAsFriendly",function(vehicle)
    friendlyVehicles[vehicle] = nil
end)

RegisterNetEvent("jet_radar:clearFriendlyVehicles",function()
    friendlyVehicles = {}
end)

RegisterNetEvent("jet_radar:getFriendlyVehicles",function()
    return friendlyVehicles
end)



function IsVehicleReady(vehicle)
    for _,veh in pairs(Config.RadarOptions.SupportedVehicles) do 
        if GetHashKey(veh) == GetEntityModel(vehicle) then 

            local height = GetEntityHeightAboveGround(vehicle)
            if height >= Config.RadarOptions.EnableAbove then 
                return true
            end
        end
    end
    return false
end

function GatherAllSuitableTargets()
    local detectReadyVehicles = {}
    local cvehPool = GetGamePool("CVehicle")

    for _,cveh in ipairs(cvehPool) do 
        if ActiveVehicle ~= cveh then
            local cvehClass = GetVehicleClass(cveh)

            local cvehCoords = GetEntityCoords(cveh)
            local localCoords = GetEntityCoords(ActiveVehicle)

            local distance = #(localCoords.xy-cvehCoords.xy)
            local heightDistance = math.abs(cvehCoords.z - localCoords.z)

            if distance <= Config.RadarDetectOptions.HorizontalLimit and heightDistance<=Config.RadarDetectOptions.VerticalLimit and IsVehicleDriveable(cveh,0) and cvehCoords.z >= Config.RadarDetectOptions.TargetAltitude then
                for __,supClass in ipairs(Config.RadarOptions.DetectClasses) do 
                    if cvehClass == supClass then 
                        table.insert(detectReadyVehicles,cveh)
                        break
                    end
                end
            end
        end
    end
    return detectReadyVehicles
end