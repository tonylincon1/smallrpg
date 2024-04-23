-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

if getPlayerStorageValue(cid, 14216) <= 0 then
setPlayerStorageValue(cid,14216,1)
 	doPlayerSendTextMessage(cid,22,"Agora voce pode usar o teleport!")
        return 0
end
end
