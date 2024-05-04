function onUse(cid, item, frompos, item2, topos)

	local Item = 7489 -- ID do item que será retirado
	
	if getPlayerItemCount(cid,Item) >= 1 then
		doPlayerAddStamina(cid, 2520) 
		doSendMagicEffect(frompos, 14) 
		doPlayerRemoveItem(cid,Item,1)
	end

return true

end