addEvent("sirenStart",true)
sirenas = {"sirenas/sirena1.mp3","sirenas/sirena2.mp3","sirenas/sirena3.mp3"}
addEventHandler("sirenStart",root,function()
   local random = math.random(1,3)
   local sonido = playSound3D(sirenas[random], 0,0,0, false)
   setSoundMaxDistance(sonido, 500)
   setSoundVolume(sonido,1)
   attachElements(sonido,source, 0, 0, 0)
end)

