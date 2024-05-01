function onSay(cid,words,param,channel)
	local cave = getCaveByPlayerID(cid)
	if cave == 0 then
		doPlayerSendCancel(cid, "Desculpe, mas você não tem nenhuma cave comprada no momento.") return true
	end
	if (words == "/mycave") then
		return doPlayerPopupFYI(cid, "[+]---------------> [Exclusive Cave System] <---------------[+]\n\nYour Cave Information:\n\nCave Name: ".. exclusives_caves_areas[cave].name .."\n\nCave Friend: "..(getFriendCaveOwner(cid) > 0 and getPlayerNameByGUID(getFriendCaveOwner(cid)) or "NoBody").."\n\nCave Left Time: ".. getTimeByCave(cave))
	elseif (words == "/cavetime") then 
		return doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] Cave Left Time: ".. getTimeByCave(cave))
	elseif (words == "/addcavefriend") then
		local param = param:lower()
		if (not param or param == "") then
			doPlayerSendCancel(cid, "Command requires param.") return true
		elseif getPlayerStorageValue(cid, exclusives_caves_config.comand_add_exaust.storage) >= os.time() then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"Espere " .. timeString(getPlayerStorageValue(cid, exclusives_caves_config.comand_add_exaust.storage) - os.time()) .. " para adicionar um novo amigo na sua cave!") return true	
		end
		local player = getPlayerByName(param)
		local pid = getPlayerByNameWildcard(param)
		if not pid then
			doPlayerSendCancel(cid, "Player with this name doesn\'t exist or is offline.") return true
		elseif isCaveFriend(player) > 0 then
			doPlayerSendCancel(cid, "O jogador ["..param.."] já esta invitado em uma cave.") return true 	
		elseif getPlayerLevel(player) < exclusives_caves_areas[cave].level.min or getPlayerLevel(player) > exclusives_caves_areas[cave].level.max then
			doPlayerSendCancel(cid, "O jogador ["..param.."] deve ter entre o level ".. exclusives_caves_areas[cave].level.min .." - ".. exclusives_caves_areas[cave].level.max .." max para participar da cave.") return true
		elseif exclusives_caves_areas[cave].premium == true and not isPremium(player) then
			doPlayerSendCancel(cid, "O jogador ["..param.."] precisa ser premium account para entrar nesta cave.") return true
		end 
		doAddAcessFriendCave(cid, getPlayerGUIDByName(param))
		setPlayerStorageValue(cid, exclusives_caves_config.comand_add_exaust.storage, os.time()+exclusives_caves_config.comand_add_exaust.hours*3600)
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] O jogador "..param.." Foi adicionado com sucesso!")
		doPlayerSendTextMessage(player,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] O jogador "..getCreatureName(cid).." adicionou você a lista da cave "..exclusives_caves_areas[cave].name.." e o total de tempo de cave é de ".. getTimeByCave(cave)) return true
	elseif (words == "/removecavefriend") then
		local friend = getFriendCaveOwner(cid)
		if friend == 0 then
			doPlayerSendCancel(cid, "voce nao tem nenhum amigo adicionado na cave.") return true
		end
		local name = getPlayerNameByGUID(friend)
		local pid = getPlayerByNameWildcard(name)
		if not pid or isPlayerGhost(pid) then
			db.executeQuery("UPDATE `player_storage` SET `value` = 1 WHERE `player_id` = ".. friend .." AND `key` = "..exclusives_caves_config.storage)
			db.executeQuery("UPDATE `player_storage` SET `value` = "..cave.." WHERE `player_id` = ".. friend .." AND `key` = "..exclusives_caves_config.check)
		else
			local cid = getPlayerByName(name)
			if isInRange(getPlayerPosition(cid), exclusives_caves_areas[cave].from, exclusives_caves_areas[cave].to) then 
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Exclusive ave System] Você foi kikado da cave.")
			end
		end
		doRemoveAcessFriendCave(cid)
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Exclusive Cave System] Seu amigo foi removido da cave com sucesso!") return true
	end
	return true
end