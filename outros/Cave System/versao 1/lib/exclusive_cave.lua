exclusives_caves_areas = { -- adicionar as caves
                       [1] = {name = "Demon Hunter", price = 1000, level = {min = 8, max =30}, time = 4, premium = false, enter = {x = 284, y = 223, z = 7}, from = {x = 275, y = 219, z = 5}, to = {x = 302, y = 240, z = 7}},
                       [2] = {name = "Hydras Thow", price = 2000, level = {min = 10, max = 1000}, time = 3, premium = true, enter = {x = 148, y = 218, z = 7}, from = {x = 137, y = 217, z = 7}, to = {x = 161, y = 234, z = 7}}
                       }
                       
                                             
exclusives_caves_config = {
                        storage = 547575,
                        check =  547576,
                        comand_add_exaust = {hours = 1, storage = 547577}, -- tempo para nao ficar toda hora tirando e colocando amigo
                        mensagem = "[Exclusive Cave System] Você foi removido ou o tempo da %s cave expirou!",
                        serve_mensagem = "[Exclusive Cave System] A cave %s acabou de ficar liberada para venda por %d Gold's, aproveitem para compra-la no NPC!"
                        }




 -- [[ Functions To Owner System ]]--
function getCaveByPlayerID(cid)
	local qry = db.getResult("SELECT `cave_id` FROM `exclusive_cave` WHERE `account_id` = " .. getPlayerAccountId(cid) .. " LIMIT 1")
	if (qry:getID() ~= -1) then
			return qry:getDataInt("cave_id")
	end
	return 0
end
function getCanBuyCave(id)
	local qry = db.getResult("SELECT `id` FROM `exclusive_cave` WHERE `cave_id` = " .. id)
	if (qry:getID() ~= -1) then
			return false
	end
	return true
end
function doPlayerAddCave(cid, cave_id, hours)
	return db.executeQuery("INSERT INTO `exclusive_cave` (`account_id`, `player_id`, `player_name`, `cave_id`, `friend_id`, `time`) VALUES ('".. getPlayerAccountId(cid) .."', '".. getPlayerGUID(cid).."', '".. getCreatureName(cid) .."', '".. cave_id .."', '0', '".. os.time()+hours*3600 .."');")
end
function doDeleteExclusiveCave(cave_id)
         return db.executeQuery("DELETE FROM `exclusive_cave` WHERE `cave_id` = "..cave_id)
end
function doAddAcessFriendCave(cid, id)
         return db.executeQuery("UPDATE `exclusive_cave` SET `friend_id` = "..id.." WHERE `account_id` = "..getPlayerAccountId(cid))
end
function doRemoveAcessFriendCave(cid)
         return db.executeQuery("UPDATE `exclusive_cave` SET `friend_id` = 0  WHERE `account_id` = "..getPlayerAccountId(cid))
end
function getTimeByCave(id)
	local qry = db.getResult("SELECT `time` FROM `exclusive_cave` WHERE `cave_id` = "..id)
	if qry:getDataInt("time") - os.time() <= 0 then
		return 0
	end
	return timeString((-(os.time() - qry:getDataInt("time"))))
end
 -- [[ Functions To Friend System ]]--
function getFriendCaveOwner(cid)
	local qry = db.getResult("SELECT `friend_id` FROM `exclusive_cave` WHERE `account_id` = "..getPlayerAccountId(cid))
	return qry:getDataInt("friend_id")
end
function isCaveFriend(cid)
	local qry = db.getResult("SELECT `cave_id` FROM `exclusive_cave` WHERE `friend_id` = "..getPlayerGUID(cid))
	if (qry:getID() ~= -1) then
			return qry:getDataInt("cave_id")
	end
	return 0
end
function doLeaveCave(id)
         local qry = db.getResult("SELECT `account_id` FROM `exclusive_cave` WHERE `cave_id` = "..id)
         return db.executeQuery("UPDATE `exclusive_cave` SET `friend_id` = 0  WHERE `account_id` = "..qry:getDataInt("account_id"))	
end



function timeString(timeDiff)
	local dateFormat = {
		{"day", timeDiff / 60 / 60 / 24},
		{"hour", timeDiff / 60 / 60 % 24},
		{"minute", timeDiff / 60 % 60},
		{"second", timeDiff % 60}
	}
	local out = {}
	for k, t in ipairs(dateFormat) do
		local v = math.floor(t[2])
		if(v > 0) then
			table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
		end
	end
	local ret = table.concat(out)
	if ret:len() < 16 and ret:find("second") then
		local a, b = ret:find(" and ")
		ret = ret:sub(b+1)
	end
	
	return ret
end