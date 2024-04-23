function onSay(cid, words, param)

if ((getPlayerItemCount(cid, 2140) > 0) and (getPlayerItemCount(cid, 2141) > 0) and (getPlayerItemCount(cid, 2139) > 0)) then
	doPlayerRemoveItem(cid, 2140, 1)
	doPlayerRemoveItem(cid, 2141, 1)
	doPlayerRemoveItem(cid, 2139, 1)
	doPlayerAddItem(cid, 5785, 1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce conseguiu trocar os itens!")
	return 0
else
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem os itens!")
end
return 1
end