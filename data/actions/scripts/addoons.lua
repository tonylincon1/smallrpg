function onUse(cid, item, frompos, item2, topos)
prize = item.uid

if prize > 0 and prize < 5000 then
queststatus = getPlayerStorageValue(cid,4581)

if queststatus == -1 then
doCreatureSay(cid, "Você encontrou o outfit Warmaster.", TALKTYPE_ORANGE_1)
doPlayerAddOutfit(cid, 336, 3)
doPlayerAddOutfit(cid, 335, 3)
setPlayerStorageValue(cid,4581,1)

else
doPlayerSendTextMessage(cid,22,"Esta vazio.")
end

return 1
else
return 0
end
end