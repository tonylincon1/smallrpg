function onStepIn(cid, item, position, fromPosition)
if(item.actionid > 30020 and item.actionid < 30100) then
local townId = (item.actionid - 30020)
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora se batizou em " .. getTownName(townId) .. ".")
end

return true
end