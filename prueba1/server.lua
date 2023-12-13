local interiores = {
    ammu = {289.7870, -35.7190, 1003.5160, 1, 0},
    exit = {0.7870, 0.7190, 0.5160, 0, 0},
    -- Agrega más interiores según sea necesario
}
local interiorsEnter = {}
local interiorsExit = {}

function createInterior(source, cmd, int)
    local interiorData = interiores[int]

    if interiorData then
        local x, y, z = getElementPosition( source )
        local dim = getElementDimension(source)

        -- Guardar información del punto de entrada en la tabla
        interiorsEnter[source] = {x, y, z, dim}

        -- Crear el marcador en la posición del interior
        local marker = createMarker(x, y, z, 'cylinder', 1)

        -- Guardar información del marcador en la tabla
        interiorsExit[marker] = {x, y, z, dim, interior = int}

        -- Asociar un manejador de evento al marcador
        addEventHandler("onMarkerHit", marker, function(hitElement)
            -- Verificar si el elemento que ha tocado el marcador es un jugador
            if getElementType(hitElement) == "player" then
                -- Obtener las coordenadas y dimensión del punto de entrada
                local entryData = interiores[int]

                -- Verificar si se encontró información de entrada para el jugador
                if entryData then
                    local xEntry, yEntry, zEntry, dimEntry, dime = unpack(entryData)

                    -- Teletransportar al jugador a las coordenadas del punto de entrada
                    setElementPosition(hitElement, xEntry, yEntry, zEntry)
                    setElementInterior(hitElement, dimEntry)
                    setElementDimension(hitElement, dime )

                    outputChatBox("¡Te has teletransportado al interior '" .. int .. "'.")
                    for source, entryData in pairs(interiorsEnter) do
    					outputChatBox('Data:' .. table.concat(entryData, ", "))
					end
                end
            end
        end)

        outputChatBox("¡Interior creado para '" .. int .. "'! Utiliza el marcador para entrar.")
    else
        outputChatBox("El interior '" .. int .. "' no existe en la tabla de interiores.")
    end
end
addCommandHandler("createint", createInterior)
