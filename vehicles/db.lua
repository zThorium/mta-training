local db = dbConnect("sqlite", "vehiculos.db")

function crearVehSQL(player, cmd, vehModel, r, g, b)
    local x, y, z = getElementPosition(player)
    local rx, ry, rz = getElementRotation(player)
    local veh = createVehicle(vehModel, x + 3, y, z, rx, ry, rz)
    setVehicleColor( veh, r,g,b )
    warpPedIntoVehicle(player, veh)
    local acc = getPlayerAccount(player)
    local name = getAccountName(acc)
    local id = getAccountID(acc)
    dbExec(db, "INSERT INTO vehicles (dueño,modelo,x,y,z,rx,ry,rz,r,g,b) VALUES(?,?,?,?,?,?,?,?,?,?,?)", id, vehModel, x, y, z, rx, ry, rz,r,g,b)
    if not veh then
        outputChatBox("/crearveh [ID]", player, 231, 217, 0, false)
    end
end

function actualizarPosicionesDB()
    local vehicles = getElementsByType("vehicle")

    for _, vehicle in ipairs(vehicles) do
        local id_temp = getElementData(vehicle, "id_temp")
        if id_temp then
            local x, y, z = getElementPosition(vehicle)
            local rx, ry, rz = getElementRotation(vehicle)
            dbExec(db, "UPDATE vehicles SET x=?, y=?, z=?, rx=?, ry=?, rz=? WHERE id=?", x, y, z, rx, ry, rz, id_temp)
        end
    end
end

function getInfoDB()
    local check = dbQuery(db, "SELECT * FROM vehicles")
    local results = dbPoll(check, -1)
    for i, _ in ipairs(results) do
        outputDebugString("Consulta Exitosa")
        local vehiculo = createVehicle(results[i].modelo, results[i].x, results[i].y, results[i].z, results[i].rx, results[i].ry, results[i].rz)
        setElementData( vehiculo, "vehiculeCreated", 1 )
        setVehicleColor( vehiculo, results[i].r, results[i].g, results[i].b )
        outputDebugString(results[i].id)
        setElementData(vehiculo, "id_temp", results[i].id)
    end
end

addEventHandler("onResourceStart", root, getInfoDB)
addEventHandler("onResourceStop", root, actualizarPosicionesDB)

addCommandHandler("crearautoSQL", crearVehSQL)
