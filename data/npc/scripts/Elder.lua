local text = {

		magia  = 'Aqui e o grande centro de magia do mundo, eu sou o mago que guarda essa magia.', 					-- escreva o texto
		ilhas = 'As ilhas de gelo sao pedasos de gelo que se deslocaram do continente, quando eu cheguei no continente de gelo eu construi a Frost Small e sou considerado um lord para os moradores de la.', 				-- escreva o texto
		barbarians = 'Os barbaros sao humanos que nao aceitam a Frost Small, pois antes da cidade ser fundada eles moravam no espaco e hoje querem tomalo de volta.', 					-- escreva o texto
		bulbi = 'Eu ajudei a guerreira bulbi a destruir o "The Small Pumpkin" e salvar a Small Vile, alias isso faz mais de 30 anos, mas o mal ainda esta a solta.', 				-- escreva o texto
		
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
	
			if msgcontains(msg:lower(), 'magia') then
				npcHandler:say(text.magia, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'ilhas') then
				npcHandler:say(text.ilhas, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'barbarians') then
				npcHandler:say(text.barbarians, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'bulbi') then
				npcHandler:say(text.bulbi, cid)
				npcHandler.topic[cid] = 0
						
			elseif msgcontains(msg:lower(), 'bye') or msgcontains(msg:lower(), 'ok') then
				npcHandler:say('Bye!', cid)
				npcHandler.topic[cid] = 0
			
			end
				
	return true
end
					
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())