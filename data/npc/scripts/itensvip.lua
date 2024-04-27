local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

-- STRIKE START --

function itemExchange(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end

    if getPlayerItemCount(cid,2157) >= 30 then
        if doPlayerRemoveItem(cid,2157,30) then
            npcHandler:say('Aqui está seu item!', cid)
            doPlayerAddItem(cid, parameters.itemID, 1)
        end
    else
        npcHandler:say('Você não tem Event coins necessários!', cid)
    end
end

-- STRIKE END --

keywordHandler:addKeyword({'Small Itens'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Eu troco {Small Shield}, {Small Boots}, {Small Legs}, {Small Armor}, ou {Small Helmet} por Event coins."})

local items = {
    {name = 'Small Shield', itemID = 12605},
    {name = 'Small Boots', itemID = 12607},
    {name = 'Small Legs', itemID = 12604},
    {name = 'Small Armor', itemID = 12603},
    {name = 'Small Helmet', itemID = 12606}
}

for _, item in ipairs(items) do
    local node = keywordHandler:addKeyword({item.name:lower()}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer trocar 30 Event coins por 1 ' .. item.name .. '?? Yes or no??'})
    node:addChildKeyword({'yes'}, itemExchange, {npcHandler = npcHandler, onlyFocus = true, reset = true, itemID = item.itemID})
    node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, volte quando quiser negociar!', reset = true})
end

npcHandler:addModule(FocusModule:new())