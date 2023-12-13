addCommandHandler("sonidoSirenas",function(player,cmd)

    local vehiculo = getPedOccupiedVehicle(player)
    triggerClientEvent("sirenStart",vehiculo)

end)