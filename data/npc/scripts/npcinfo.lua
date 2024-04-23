local text = {

		mapa  = 'O mapa Small RPG e repleto de misterios, cabe a voce descobrir o mundo e conhecer novos lugares. Explorando o mapa voce pode encontrar quests, conhecer a historia do mapa e o melhor de tudo, destuir os monstros a solta por ai.', 					-- escreva o texto
		vip = 'Compre sua vip pelo site do nosso ot.', 				-- escreva o texto
		monstros = 'Os monstros invadiram nosso mundo para querer acabar com a raça humana, nossa maior lenda, a guerreira Bulbi conseguiu destruir inumeros monstros, hoje eles vivem escondidos por ai e atraves do nosso conhecimento de magia conseguimos nos teleporta a eles.', 					-- escreva o texto
		casas = 'Compre sua casa nos vilarejos e ha enfeiteas com todas as suas riquezas.', 				-- escreva o texto
		quests = 'Enfrente mostros poderosos para peguar suas reliquias sagradas.',				 -- escreva o texto
		task = 'Existe uma recompensa por aqueles que matam mais monstros. Voce pode ir ao sul da Small Vile falar com o npc Ludger para pedir sua task, mas antes consulte quais as tasks disponiveis em !task.' 						-- escreva o texto		
		
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
	
			if msgcontains(msg:lower(), 'mapa') then
				npcHandler:say(text.mapa, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'vip') then
				npcHandler:say(text.vip, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'monstros') then
				npcHandler:say(text.monstros, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'casas') then
				npcHandler:say(text.casas, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'quests') then
				npcHandler:say(text.quests, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'task') then
				npcHandler:say(text.task, cid)
				npcHandler.topic[cid] = 0
			
			elseif msgcontains(msg:lower(), 'bye') or msgcontains(msg:lower(), 'ok') then
				npcHandler:say('Bye!', cid)
				npcHandler.topic[cid] = 0
			
			end
				
	return true
end
					
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())