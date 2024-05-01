function onSay(cid,words,param,channel)
	if (words == "/cavelist") then
		local str = " -- > [Exclusive Cave System] < --\n\n"
		for caveid, info in pairs(exclusives_caves_areas) do
			str = str .. "Cave ID: ["..caveid.."] - Cave name: " .. info.name.."\n\n"
		end
		return doShowTextDialog(cid, 8304, str)
	elseif (words == "/cavepurchase") then
		local str = " -- > [Exclusive Cave System] < --\n\n"
		for caveid, info in pairs(exclusives_caves_areas) do
            if getCanBuyCave(caveid) == true then 	
			   str = str .. "Cave ID: ["..caveid.."] - Cave name: " .. info.name.."\n\n"
             end
        end	
		return doShowTextDialog(cid, 8304, str)		
	elseif (words == "/cave") then
		local param = tonumber(param)
		if (param == "" or not param) then
			doPlayerSendCancel(cid, "digite o id da cave para mais informações.") return true
		elseif not exclusives_caves_areas[param] then
			doPlayerSendCancel(cid, "a CaveID ["..param.."] não existe.") return true
		end
		local cave = param
		local str = "[+]---------------> [Exclusive Cave System] <---------------[+]\n\nCave Name: ".. exclusives_caves_areas[cave].name .."\n\nCave Price: "..exclusives_caves_areas[cave].price.amount.."x "..getItemNameById(exclusives_caves_areas[cave].price.itemid).."\n\nCave Level:  Min. ["..exclusives_caves_areas[cave].level.min.."] - Max. ["..exclusives_caves_areas[cave].level.max.."]\n\nNeed Premium Account: "..(exclusives_caves_areas[cave].premium == true and "Yes" or "No").."\n\n"
		local qry = db.getResult("SELECT `player_name`, `friend_id` FROM `exclusive_cave` WHERE `cave_id` = " .. cave)
		if (qry:getID() ~= -1) then
			str = str .. "Status: [Purchased]\n\nCave Owner: " .. qry:getDataString("player_name") .."\n\nCave Friend: "..(qry:getDataInt("friend_id") > 0 and getPlayerNameByGUID(qry:getDataInt("friend_id")) or "NoBody").."\n\nCave Left Time: ".. getTimeByCave(cave)
		else
			str = str .. "Status: [For sale]\n\nMax Hour(s) in Cave: "..exclusives_caves_areas[cave].time
		end		
		return doPlayerPopupFYI(cid, str)
	end
	return true	
end

