function onUse (cid, item, itemEx , fromPosition, toPosition)
	local blessings = 0
	for b = 1, 5 do
		if getPlayerBlessing(cid, b) then
			blessings = blessings + b
		end
	end
	if blessings == 5 then
		doPlayerSendCancel(cid, "Voce ja possui todas as blessings.")
		doSendMagicEffect(getPlayerPosition(cid), 17)
	else
		for i = 1, 5 do
			doPlayerAddBlessing(cid, i)
		end
		doSendMagicEffect(getPlayerPosition(cid), 37)
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, "Voce agora possui todas as blessings!")
	end
	return true
end