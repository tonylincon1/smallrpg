--[[
- hora deve ser exata SERVER
- para fazer o raid tera que ser ex: 00 hour(horas) e 00 minu (minutos)
- para fazer a raid na data e hora no tempo exato, uso "exact"
- para fazer a raid ocorrer todas as semanas (pelo menos 1x na semana) uso "weekly"
- o nome dos dias sao ultilizados apenas para o tipo semanal que devera ser
- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"
- tambem devem estar dentro de uma matriz-> {}
]]

local raids =
{
	[1] = {name = 'Ghazbaran', days = {'saturday'}, hour = 08, minu = 05},
	[2] = {name = 'Ferumbras', days = {'tuesday'}, hour = 18, minu = 00}
}
	
local last_execsutes = {}

function onThink(interval, lastExecution, thinkInterval)
	
	local static_time = os.time()
	
	for k, raid in ipairs(raids) do
			local day = os.date("%A", static_time):lower()
			if isInArray(raid.days, day) then
				local hour = tonumber(os.date("%H", static_time))
				if (raid.hour == hour) then
					local minute = tonumber(os.date("%M", static_time))
					if (raid.minu == minute) then
						local day_number = tonumber(os.date("%d", static_time))
						if (last_execsutes[k] ~= day_number) then
							last_execsutes[k] = day_number
							Game.startRaid(raid.name)
						end
					end
				end
			end
	end
	
	return true
end