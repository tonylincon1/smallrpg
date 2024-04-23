function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 25725 then
	queststatus = getPlayerStorageValue(cid,22341)
		if queststatus ~= 1 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Agora voce pode entrar na sala de recompensas.")
			setPlayerStorageValue(cid,22341,1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja clicou aqui.")
		end
end
return 1
end