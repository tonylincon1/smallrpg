function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 25724 then
	queststatus = getPlayerStorageValue(cid,22339)
		if queststatus ~= 1 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Agora voce pode passar pela sexta sala.")
			setPlayerStorageValue(cid,22339,1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja clicou aqui.")
		end
end
return 1
end