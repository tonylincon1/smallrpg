-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Voc� n�o tem acesso a terceira sala, clique no trono da segunda sala e pegue seu acesso!!",
msgWelcome = "Bem vindo a terceira sala."
}

if getPlayerStorageValue(cid, 22333) <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end
