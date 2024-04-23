function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 25721 then
	queststatus = getPlayerStorageValue(cid,22333)
		if queststatus ~= 1 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Agora voce pode passar pela terceira sala.")
			setPlayerStorageValue(cid,22333,1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja clicou aqui.")
		end
end
return 1
end