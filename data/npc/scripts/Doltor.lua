STORAGE = 100011 -- Não Mecha

ITEM = 9447 -- Item a ser adicionado para completar a quest

QUANT = 1 -- Quantidade de items a ser adicionado

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

if (getPlayerStorageValue(cid, STORAGE) < 1) then

doPlayerAddItem(cid, ITEM, QUANT)

setPlayerStorageValue(cid, STORAGE, 1)

npcHandler:say('Leve essa taça para meu irmao Moltor', cid)

else

npcHandler:say('Eu ja te dei sua missao.', cid)

end

end

npcHandler:resetNpc()

return true

end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|. Eu Tenho uma {mission} para voce.")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})

local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Vai levar minha taça para meu irmão Moltor?'})

node:addChildKeywordNode(yesNode)

node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())