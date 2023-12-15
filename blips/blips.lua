local db = exports.sql:getDBConnection()

function createIcons()
	local check = dbQuery(db, "SELECT * FROM blips")
    local results = dbPoll(check, -1)
	for i, _ in ipairs(results) do
		createBlip( results[i].pos_x, results[i].pos_y, results[i].pos_z , results[i].icon , 1, 0, 0, 0, 255, 0, 300 )
	end

end

addCommandHandler( 'crearblip', function(p,cmd,x,y,z,icon,nombre)
	if x and y and z and icon and nombre then
		dbExec( db, 'INSERT INTO blips (pos_x ,pos_y ,pos_z ,icon ,name) VALUES(? ,? ,? ,? ,?)', x,y,z,icon,nombre )
		local blip = createBlip( x, y, z, icon, 1, 0, 0, 0, 255, 0, 300 )
		local query = dbQuery( db, 'SELECT id FROM blips WHERE pos_x=? AND pos_y=? AND pos_z=? AND name=?',x,y,z,nombre)
		local result = dbPoll(query, -1)
		if result then
			--Si llego a subir este script, no se que mierda hice con el #result, pero funciona de maravilla asi que asi se queda ;)
			outputChatBox( '#8DFF69Acabas de crear un blip con el #5AFF39id '..result[#result].id,p,0,200,0,true )
		end
	else
		outputChatBox( '#FFFD69Necesitas completar todos los parametros',p,255,0,255,true )
		outputChatBox( '#FFFD69Sintaxis: /crearblip [x] [y] [z] [id_icono] [nombre]',p,255,0,255,true )
	end


end )

addEventHandler( 'onResourceStart', root, createIcons )