addEvent("sirenStart",true)
addEventHandler("sirenStart",root,function()
   local sonido = playSound3D("sirenas/sirena1.mp3", 0,0,0, false)
   setSoundMaxDistance(sonido, 500)
   setSoundVolume(sonido,1)
   attachElements(sonido,source, 0, 0, 0)
end)

