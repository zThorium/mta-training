-- Creamos una tabla con 8 tablas dentro y que en esas tablas contenga un texto. 
tabl = {  
    { "uno" }, 
    { "dos" }, 
    { "tres" }, 
    { "cuatro" }, 
    { "cinco" }, 
    { "seis", "hola" }, 
    { "siete" }, 
    { "ocho" } 
} 
 
-- Hacemos el mismo paso que el anterior ejemplo pero con un indice diferente: 
 -- Obtenemos el texto 'seis' dentro de la tabla. 
 
-- Y lo publicamos en el chat: 
outputChatBox(tabl[6][2], 255, 255, 255, false) 

check = tabl["seis"] -- Devolverá un valor booleano que es el que se encuentra en la tabla. 
if  (check == true ) then -- Si la variable Check es verdadera se cumple la sentencia 
    outputChatBox("Yep!", 255, 255, 255, false) 
end 