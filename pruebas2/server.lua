local nameVeh

function crearVeh(player, cmd, veh)
    local x, y, z = getElementPosition(player)
    local rx, ry, rz = getElementRotation(player)
    local veh = createVehicle( veh, x + 3 ,y ,z ,rx ,ry ,rz)
    warpPedIntoVehicle( player, veh)
    if not veh then
        outputChatBox( "/crearveh [ID]", player, 231, 217, 0, false )
    end    
end

function setColorVeh(p, commandName, r, g, b)
    if isPedInVehicle( p ) then 
        local vehicle = getPedOccupiedVehicle( p )  
        local nameVeh = getVehicleName( vehicle  )
        outputChatBox(tostring(nameVeh),p,255,255,255)
        if vehicle then
            local r, g, b = tonumber(r), tonumber(g), tonumber(b)
            setVehicleColor( vehicle, r, g, b, 0, 0, 0 )   
            outputChatBox( '#50C1A7Cambiaste el color de tu #81FFE2'..nameVeh..' #50C1A7con exito.' , p, 255,0,0, true )
        else
            outputChatBox( 'No estas dentro de un vehiculo', p, 255,0,0 )
        end
    end
end

function fixAuto(p, commandName )
    if isPedInVehicle( p ) then
        local vehicle = getPedOccupiedVehicle( p )  
        local nameVeh = getVehicleName( vehicle  )
        fixVehicle( vehicle )
        outputChatBox( '#81FFABAcabas de reparar tu #0FFF5F'..nameVeh..' #81FFABcon exito.' , p, 255,0,0, true )
    end
end



addCommandHandler('setcolorVeh', setColorVeh )

addCommandHandler( 'crearveh', crearVeh )

addCommandHandler('fixauto', fixAuto)

