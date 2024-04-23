function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 25723 then
	queststatus = getPlayerStorageValue(cid,22337)
		if queststatus ~= 1 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Agora voce pode passar pela quinta sala e entrar na entrada do submund.")
			setPlayerStorageValue(cid,22337,1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja clicou aqui.")
		end
end
return 1
end