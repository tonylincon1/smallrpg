function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 25467 then
	queststatus = getPlayerStorageValue(cid,22021)
		if queststatus ~= 1 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Parabens, você agora pode entrar nos tps da vip.")
			setPlayerStorageValue(cid,22021,1)
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja abriu esse bau.")
		end
end
return 1
end