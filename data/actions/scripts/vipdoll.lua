function onUse(cid, item, frompos, item2, topos)

 	queststatus = getPlayerStorageValue(cid,13540)
 	if queststatus == -1 then
 	doPlayerAddItem(cid,6512,2)
 	setPlayerStorageValue(cid,13540,1)
	doPlayerRemoveItem(cid,10063,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você já é vip")
        return 0
 	end

	return 1
end 