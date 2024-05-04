local expBonus = 100 -- %
local time = 120 -- minutos

function onLogin(cid)
	if os.time() - getPlayerStorageValue(cid, 792371) <= time * 60 then
		doPlayerSetExperienceRate(cid, 1 + (expBonus / 100))
		local time_remaining = (time * 60) - (os.time() - getPlayerStorageValue(cid, 792371))
		addEvent(function(cid)
			if isCreature(cid) then
				doPlayerSetExperienceRate(cid, 1)
			end
		end, time_remaining * 1000, cid)
	end
	return true
end