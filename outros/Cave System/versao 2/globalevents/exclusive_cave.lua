function onThink(cid, interval, lastExecution)
	local qry = db.getResult("SELECT * FROM `exclusive_cave` WHERE `time` < "..os.time())
	if (qry:getID() ~= -1) then
		repeat
			local name, player_id, friend, cave_id = qry:getDataString("player_name"), qry:getDataInt("player_id"), qry:getDataInt("friend_id"), qry:getDataInt("cave_id") 
			local pid = getPlayerByNameWildcard(name) 	-- owner
			if not pid or isPlayerGhost(pid) then
				db.executeQuery("UPDATE `player_storage` SET `value` = 1 WHERE `player_id` = ".. player_id .." AND `key` = "..exclusives_caves_config.storage)
				db.executeQuery("UPDATE `player_storage` SET `value` = "..cave_id.." WHERE `player_id` = ".. player_id .." AND `key` = "..exclusives_caves_config.check)
			else
				local cid = getPlayerByName(name)
				if isInRange(getPlayerPosition(cid), exclusives_caves_areas[cave_id].from, exclusives_caves_areas[cave_id].to) then 
					doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				end
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Exclusive ave System] O tempo da sua cave expirou, para compra-la novamente volte ao NPC.")
				setPlayerStorageValue(cid, exclusives_caves_config.comand_add_exaust.storage, 0)
			end
			if friend > 0 then -- friend
				local name = getPlayerNameByGUID(friend)
				local pid = getPlayerByNameWildcard(name)
				if not pid or isPlayerGhost(pid) then
					db.executeQuery("UPDATE `player_storage` SET `value` = 1 WHERE `player_id` = ".. friend .." AND `key` = "..exclusives_caves_config.storage)
					db.executeQuery("UPDATE `player_storage` SET `value` = "..cave_id.." WHERE `player_id` = ".. friend .." AND `key` = "..exclusives_caves_config.check)
				else
					local cid = getPlayerByName(name)
					if isInRange(getPlayerPosition(cid), exclusives_caves_areas[cave_id].from, exclusives_caves_areas[cave_id].to) then 
						doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Exclusive ave System] O tempo de cave do seu amigo "..name.." se expirou e você foi levado para fora da cave.")
					end
				end
			end
			doDeleteExclusiveCave(cave_id)
			broadcastMessage(string.format(exclusives_caves_config.serve_mensagem,exclusives_caves_areas[cave_id].name,exclusives_caves_areas[cave_id].price.amount, getItemNameById(exclusives_caves_areas[cave_id].price.itemid)), MESSAGE_STATUS_CONSOLE_ORANGE)
		until not qry:next()
		qry:free()
	end
	return true
end