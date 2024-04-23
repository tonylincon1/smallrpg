STORAGE = 100011 -- Não Mecha

ITEM = 9447 -- Item a ser Removido , dado pelo primeiro NPC

QUANT = 1 -- Quantidade de item a ser removido dado pelo primeiro npc

PREMIO = 11200 -- Premio do NPC

PQUANT = 100 -- Quantidade de premio

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

if getPlayerStorageValue(cid,STORAGE) == 1 and getPlayerItemCount(cid,9447) >= 1 then

doPlayerRemoveItem(cid,ITEM,QUANT)

doPlayerAddItem(cid,PREMIO,PQUANT)

setPlayerStorageValue(cid, STORAGE, 2)

npcHandler:say('Obrigado', cid)

elseif getPlayerStorageValue(cid,STORAGE) >= 2 then

npcHandler:say('Voce ja completou essa missao.', cid)

elseif getPlayerStorageValue(cid,STORAGE) < 1 then

npcHandler:say('Voce nao pegou a taça.', cid)

elseif getPlayerItemCount(cid,9447) <= 0 then

npcHandler:say('Voce nao tem a taça.', cid)

end

end

npcHandler:resetNpc()

return true

end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|. Diga {mission} para prosseguir essa missao.")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})

local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pegou a taça com meu irmão Doltor? {yes}'})

node:addChildKeywordNode(yesNode)

node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())