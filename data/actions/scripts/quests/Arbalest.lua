function onUse(cid, item, frompos, item2, topos)
if item.uid == 10002 then
queststatus = getPlayerStorageValue(cid,20000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou Uma Arbalest!.")
doPlayerAddItem(cid,5803,1 )
setPlayerStorageValue(cid,20000,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 