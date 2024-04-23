function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 25500 then
	queststatus = getPlayerStorageValue(cid,22231)
		if queststatus ~= 1 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Agora voce pode passar pela primeira etapa da entrada do submund.")
			setPlayerStorageValue(cid,22231,1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja andou aqui.")
		end
end
return 1
end