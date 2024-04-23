local monstrolol = {"Barbarian King","Mage Of Darkness"}


function onKill(cid, target, lastHit)

	if isInArray(monstrolol,getCreatureName(target)) then

		doBroadcastMessage("O jogador "..getCreatureName(cid).." killed the powerful boss "..getCreatureName(target).."!")

	end

	return true


end