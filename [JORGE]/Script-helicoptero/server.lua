addCommandHandler("sirena",function(player,cmd)

    local vehiculo = getPedOccupiedVehicle(player)
    if(vehiculo = 497)
        triggerClientEvent("sirenStart",vehiculo)
    end 

end)