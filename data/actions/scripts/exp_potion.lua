local needPA = true
local needLvl = 20
local expBonus = 100 -- %
local time = 120 -- minutos

function onUse(cid, item)
	if not needPA or isPremium(cid) then
		if not needLvl or getPlayerLevel(cid) >= needLvl then
			if os.time() - getPlayerStorageValue(cid, 792371) > time * 60 then
				doPlayerSetExperienceRate(cid, 1 + (expBonus / 100))
				addEvent(function(cid)
					if isCreature(cid) then
						doPlayerSetExperienceRate(cid, 1)
					end
				end, time * 1000 * 60, cid)
				doPlayerSendTextMessage(cid, 27, "Você tem "..expBonus.."% experiência extra por "..time.." minutos.")
				setPlayerStorageValue(cid, 792371, os.time())
				doRemoveItem(item.uid, 1)
			else
				doPlayerSendTextMessage(cid, 27, "Você ainda está sob experiência extra.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "Você precisa ser level 1000+.")
		end
	else
		doPlayerSendTextMessage(cid, 27, "Você deve ter uma conta premium para usar essa poção.")
	end
	return true
end