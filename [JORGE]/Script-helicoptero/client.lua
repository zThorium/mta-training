addEvent("sirenStart",true)
sirenas = {"sirenas/sirena1.mp3","sirenas/sirena2.mp3","sirenas/sirena3.mp3","sirenas/sirena4.mp3","sirenas/sirena5.mp3","sirenas/sirena6.mp3","sirenas/sirena7.mp3",
"sirenas/sirena8.mp3","sirenas/sirena9.mp3","sirenas/sirena10.mp3","sirenas/sirena11.mp3","sirenas/sirena12.mp3","sirenas/sirena13.mp3","sirenas/sirena14.mp3"}
addEventHandler("sirenStart",root,function()
   local random = math.random(1,14)
   local sonido = playSound3D(sirenas[random], 0,0,0, false)
   setSoundMaxDistance(sonido, 500)
   setSoundVolume(sonido,1)
   attachElements(sonido,source, 0, 0, 0)
end)

