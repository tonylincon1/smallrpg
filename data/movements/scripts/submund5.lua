-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Você não tem acesso ao submund pela fire of submund nem a quinta sala, clique no trono da quarta sala e pegue seu acesso!!",
msgWelcome = "Bem vindo a quinta sala ou a entrada do submund."
}

if getPlayerStorageValue(cid, 22337) <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end
