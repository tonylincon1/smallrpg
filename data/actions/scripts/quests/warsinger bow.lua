function onUse(cid, item, frompos, item2, topos)
if item.uid == 10016 then
queststatus = getPlayerStorageValue(cid,50001)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou Um Warsinger bow!.")
doPlayerAddItem(cid,8854,1 )
setPlayerStorageValue(cid,50001,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 