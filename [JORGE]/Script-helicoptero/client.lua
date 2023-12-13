function planeEnter ( theVehicle, seat) 
    local id = getElementModel ( theVehicle ) -- obtiene el id del vehiculo
    if id == 497 then --detecta si es el maverick
        addEventHandler('onPlayerVehicleEnter', root, function(vehicle, seat)
            if (seat == 0) then
               addVehicleSirens(vehicle, 2, 2)
               setVehicleSirens(vehicle, 1, -0.3, 0, 0.8, 0, 0, 255, 255, 255)
               setVehicleSirens(vehicle, 2, 0.3, 0, 0.8, 255, 0, 0, 255, 255)
               -- You can also make the sirens flash immediately with 'setVehicleSirensOn(vehicle, true)'
            end
         end)
         
         addEventHandler('onPlayerVehicleExit', root, function(vehicle, seat)
            removeVehicleSirens(vehicle)
         end)
    end
end
-- add the event handler to the event
addEventHandler ( "onPlayerVehicleEnter", root, planeEnter )


