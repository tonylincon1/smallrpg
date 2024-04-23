unction onUse(cid, item, frompos, item2, topos)

 
local porta = 2090 -- id da porta
local uniqueidporta = 12000


if item2.uid == uniqueidporta and item2.itemid == porta then
setPlayerStorageValue(cid, storage, 1)
doRemoveItem(cid, item.uid, 1)
else
doPlayerSendTextMessage(cid, 22, "Porta errada!")
end

return TRUE
end