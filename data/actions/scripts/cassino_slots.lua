
function onUse(cid, item, frompos, item2, topos)
--== Configurações
local config = {
items = {10141, 2193, 8891, 2110, 11257, 12596, 2277, 2173}, -- Itens que ele pode ganhar
vp = 2160, -- ID do Vip Coin
}
--== Fim das Configurações

local rand = math.random(1, #config.items)
if (item.actionid == 1140) and item.itemid == 1945 then
if getPlayerItemCount(cid, config.vp) >= 6 then
doPlayerRemoveItem(cid, config.vp, X)
doPlayerAddItem(cid, config.items[rand], 1)
doBroadcastMessage("O Jogador "..getCreatureName(cid).." Ganhou um "..getItemNameById(config.items[rand])..".")

else
return false
doPlayerSendCancel(cid,"Você precisa de dinheiro")
doSendMagicEffect(getPlayerPosition(cid), 2)
end
elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
end

return TRUE
end