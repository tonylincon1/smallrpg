function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Você ja fez essa quest hoje",
msgWelcome = "boa sorte!"
}

if getPlayerStorageValue(cid, 32006) > 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end
