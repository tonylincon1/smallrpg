local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser,msg = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid, msg:lower()
	if isInArray({"buy","comprar","buys","compra"}, msg) then
		local cave = getCaveByPlayerID(cid)
		if cave > 0 then
			npcHandler:say("Desculpe, voc� s� pode comprar uma cave por conta!", cid) return true
		end
		npcHandler:say("Voc� deseja comprar uma cave? Qual o ID da cave que voc� gostaria de comprar? caso n�o saiba qual o ID da cave poder� usar o comando {/cavelist} ou o comando {/cavepurchase} para filtrar quais caves ainda est�o a venda!.", cid)
		talkState[talkUser] = 1 
	elseif talkState[talkUser] == 1 then 
		if not tonumber(msg) then
			npcHandler:say("Desculpe, voc� deve digitar o ID da cave que quer comprar!", cid) return true
		end
		local cave = tonumber(msg)
		if not exclusives_caves_areas[cave] then
			npcHandler:say("a CaveID ["..cave.."] n�o existe.", cid) return true
		elseif getCanBuyCave(cave) == false then 
			npcHandler:say("A CaveID ["..cave.."] n�o pode ser comprada no momento pois j� est� em uso.", cid) return true
		elseif getPlayerLevel(cid) < exclusives_caves_areas[cave].level.min or getPlayerLevel(cid) > exclusives_caves_areas[cave].level.max then
			talkState[talkUser] = 0 
			npcHandler:say("Desculpe mas voc� deve ter entre o level ".. exclusives_caves_areas[cave].level.min .." - ".. exclusives_caves_areas[cave].level.max .." max para comprar esta cave.", cid) return true
		elseif exclusives_caves_areas[cave].premium == true and not isPremium(cid) then 
			npcHandler:say("A CaveID ["..cave.."] s� pode ser comprada por Premium Account.", cid) return true
		elseif not doPlayerRemoveMoney(cid, exclusives_caves_areas[cave].price) then
			talkState[talkUser] = 0 
			npcHandler:say("Desculpe mas voc� n�o tem "..exclusives_caves_areas[cave].price.." Gold's para comprar esta cave.", cid) return true
		end
		doPlayerAddCave(cid, cave, exclusives_caves_areas[cave].time)
		talkState[talkUser] = 0 
		npcHandler:say("Parab�ns, voc� comprou a cave por "..exclusives_caves_areas[cave].name.." por "..exclusives_caves_areas[cave].time.." Horas, agora pode {entrar} a qualquer momento ", cid) return true			
	elseif isInArray({"enter","entrar"}, msg) then
    	local cave = getCaveByPlayerID(cid)
		if cave == 0 then
			npcHandler:say("Desculpe, voc� n�o possui nenhuma cave para entrar!", cid) return true
		end
        npcHandler:say("Boa sorte na hunt de sua cave.", cid)
        talkState[talkUser] = 0 
		npcHandler:releaseFocus(cid) 
        doTeleportThing(cid, exclusives_caves_areas[cave].enter) 	
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
	elseif isInArray({"invite","invited","invitado","friend"}, msg) then	
   		local cave = isCaveFriend(cid)
		if cave == 0 then
			npcHandler:say("Desculpe, mas voc� n�o esta invitado em nenhuma cave no momento.", cid) return true
		end
        npcHandler:say("Boa sorte na hunt de sua cave.", cid)
        talkState[talkUser] = 0 
		npcHandler:releaseFocus(cid) 
        doTeleportThing(cid, exclusives_caves_areas[cave].enter) 	
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)	
	elseif msg == "no" then 
		selfSay("Tudo bem ent�o", cid) 
		talkState[talkUser] = 0 
		npcHandler:releaseFocus(cid) 
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())