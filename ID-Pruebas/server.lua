local marker = createMarker( -1411.56189, 2642.08594, 55 , 'cylinder', 1.0, 0 ,150 ,100, 100 )

addEventHandler( 'onMarkerHit', marker, function(hitElement)
    local acc = getPlayerAccount( hitElement )
    local name = getAccountName( acc )
    local id = getAccountID(acc)
    outputChatBox( 'Hola '..name.. ' tu id es: '..id )

end )