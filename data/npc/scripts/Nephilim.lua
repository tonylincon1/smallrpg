local text = {

		submund  = 'Aqui e o submundo, e para ca que vem todas as almas condenadas, sao torturadas e mortas, assim segue o ciclo.', 					-- escreva o texto
		salas = 'As salas sao os lugares onde as criaturas sao separadas para torturar as almas.', 				-- escreva o texto
		pumpkin = 'O nosso grande rei fica na ultima sala por que foi aprisionado pela guerreira Bulbi, aquela desgrasada.', 					-- escreva o texto
		criaturas = 'Existem varias criaturas por aqui entao cuidado para nao perder sua alma aqui, mero mortal.' 				-- escreva o texto	

}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
npcHandler.topic = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid)	end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
 
function creatureSayCallback(cid, type, msg)
	
	if not npcHandler:isFocused(cid) then
		return false
	end
	
			if msgcontains(msg:lower(), 'submund') then
				npcHandler:say(text.submund, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'salas') then
				npcHandler:say(text.salas, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'pumpkin') then
				npcHandler:say(text.pumpkin, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'criaturas') then
				npcHandler:say(text.criaturas, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'bye') or msgcontains(msg:lower(), 'ok') then
				npcHandler:say('Cuidado para não perder sua alma aqui! Hahahahaa.', cid)
				npcHandler.topic[cid] = 0
			
			end
				
	return true
end
					
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())