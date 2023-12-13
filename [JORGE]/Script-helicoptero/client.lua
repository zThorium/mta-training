function planeEnter ( theVehicle, seat) 
    local id = getElementModel ( theVehicle ) -- obtiene el id del vehiculo
    if id == 497 then --detecta si es el maverick
        local vehicleName = getVehicleName ( theVehicle ) -- obteer el nombre del vehiculo
        outputChatBox ( "Someone has stolen a " .. vehicleName .. "!",source ) -- colocar en el chat el nombre del maverick
    end
end
-- add the event handler to the event
addEventHandler ( "onPlayerVehicleEnter", root, planeEnter )


addEventHandler("onVehicleEnter", getRootElement(), function(player,seat)

    local vehiculo = getPedOccupiedVehicle( player )
    local vehiculoModel = getElementModel( vehiculo )

    if vehiculoModel == 497 then 
        outputChatBox( "estas en el maverick" )
    end

    outputChatBox(getVehicleName(vehiculo).." "..vehiculoModel)



end)