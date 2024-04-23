function onUse(cid, item, frompos, item2, topos)

 	queststatus = getPlayerStorageValue(cid,13100)
 	if queststatus == -1 then
 	doPlayerAddItem(cid,2160,10)
        setPlayerPromotionLevel(cid, 1)
 	setPlayerStorageValue(cid,13100,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Ja pegou rala daqui")
        return 0
 	end

	return 1
end 