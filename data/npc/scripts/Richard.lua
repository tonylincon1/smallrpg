STORAGE = 100012 -- Não Mecha

ITEM = 2160 -- Item a ser Removido , dado pelo primeiro NPC

QUANT = 100 -- Quantidade de item a ser removido dado pelo primeiro npc

PREMIO = 11234 -- Premio do NPC

PQUANT = 1 -- Quantidade de premio

local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid)	end

function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)	end

function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end

function onThink()	npcHandler:onThink()	end

function santaNPC(cid, message, keywords, parameters, node)

if(not npcHandler:isFocused(cid)) then

return false

end

if (parameters.present == true) then

if getPlayerStorageValue(cid,STORAGE) == 1 and getPlayerItemCount(cid,2330) >= 1 then

doPlayerRemoveItem(cid,ITEM,QUANT)

doPlayerAddItem(cid,PREMIO,PQUANT)

setPlayerStorageValue(cid, STORAGE, 2)

npcHandler:say('Obrigado', cid)

elseif getPlayerStorageValue(cid,STORAGE) >= 2 then

npcHandler:say('Voce ja completou essa missao.', cid)

elseif getPlayerStorageValue(cid,STORAGE) < 1 then

npcHandler:say('Voce nao falou com frederic.', cid)

elseif getPlayerItemCount(cid,2330) <= 0 then

npcHandler:say('Voce nao tem o item que frederic te deu.', cid)

end

end

npcHandler:resetNpc()

return true

end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|. Diga {mission} para prosseguir essa missao.")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})

local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Frederic mandou voce me entregar as cartas? {yes}'})

node:addChildKeywordNode(yesNode)

node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())