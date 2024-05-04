local monstrolol = {"Barbarian King","King Dragon Lord","Death","Alfa Polar Bear","Mummy Bandit","Zathroth","King Hell Troll"}


function onKill(cid, target, lastHit)

	if isInArray(monstrolol,getCreatureName(target)) then

		doBroadcastMessage("O jogador "..getCreatureName(cid).." killed the powerful boss "..getCreatureName(target).."!")

	end

	return true


end