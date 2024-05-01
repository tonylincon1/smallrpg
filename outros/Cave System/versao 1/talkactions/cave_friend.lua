function onSay(cid,words,param,channel)
	if (words == "/cavetime") then
		local cave = getCaveByPlayerID(cid)
		if cave == 0 then
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			doPlayerSendCancel(cid, "Desculpe, mas você não possui nenhuma cave no momento.") return true
		end
		return doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] Cave Left Time: ".. getTimeByCave(cave))
	elseif (words == "/cavefriendtime") then
		local cave = isCaveFriend(cid)
		if cave == 0 then
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			doPlayerSendCancel(cid, "Desculpe, mas você não esta invitado em nenhuma cave no momento.") return true
		end
		return doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] Cave Left Time: ".. getTimeByCave(cave))
	elseif (words == "/caveleave") then	
		local cave = isCaveFriend(cid)
		if cave == 0 then
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			doPlayerSendCancel(cid, "Desculpe, mas você não esta invitado em nenhuma cave no momento.") return true
		end
			if isInRange(getPlayerPosition(cid), exclusives_caves_areas[cave].from, exclusives_caves_areas[cave].to) then 
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			end
		doLeaveCave(cave)  
      		return doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] Você foi removido da lista de amigo da cave com sucesso.")  		
	end
	return true
end