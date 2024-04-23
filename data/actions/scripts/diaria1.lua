function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.uid == 32000 then
	queststatus = getPlayerStorageValue(cid,32006)
		if queststatus ~= 1 then
			local days = 1
			local daysvalue = days * 24 * 60 * 60
			local storageplayer = getPlayerStorageValue(cid, 32006)
			local timenow = os.time()

	if getPlayerStorageValue(cid, 13540) - os.time() <= 0 then
		time = timenow + daysvalue
	else
		time = storageplayer + daysvalue
	end
else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ja abriu esse bau.")
		end
end
return 1
end