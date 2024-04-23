local pos = {x=811, y=454, z=6} -- coordenada do templo
local cidade_id = 2 -- id da cidade

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

if getPlayerStorageValue(cid, 109824) == cidade_id then
doPlayerSendTextMessage(cid, "Você ja é morador desta cidade")
doTeleportThing(cid, lastPosition)
else
doTeleportThing(cid, pos)
doSendMagicEffect(getPlayerPosition(cid), 10)
doPlayerSetTown(cid, cidade_id)
doPlayerSendTextMessage(cid, "Você agora é um morador de " .. getTownName(cidade_id) .."!")
setPlayerStorageValue(cid, 109824, cidade_id)
end

return TRUE
end