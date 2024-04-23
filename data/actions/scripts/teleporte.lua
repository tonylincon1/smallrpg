local config = {
itemid = 7959, -- ID Do Item
many = 1, -- Quantidade
pos = {x=1639, y=157, z=10}, -- Posição do item
tepos = {x=1662, y=138, z=10} -- Para onde vai ao teleportar
}
function onUse(cid, item, frompos, item2, topos)
if getTileItemById(config.pos, config.itemid) and doRemoveItem(getTileItemById(config.pos, config.itemid).uid, config.many) then
doTeleportThing(cid, config.tepos)
doTransformItem(item.uid, item.itemid + 1)
else
doPlayerSendTextMessage(cid, 20, "Voce deve colocar o item no local correto")
end
return true
end