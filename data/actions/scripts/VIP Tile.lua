function onUse(cid, item, fromPosition, itemEx, toPosition)
local config={
removeOnUse = "yes" -- remover quando usar ("yes" or "no")
}
local days = 30 -- dias que ser�o adicionados
local daysvalue = days * 24 * 60 * 60
local storageplayer = getPlayerStorageValue(cid, 13545)
local timenow = os.time()
if getPlayerStorageValue(cid, 13545) - os.time() <= 0 then
time = timenow + daysvalue
else
time = storageplayer + daysvalue
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foram adicionados ".. days .." dias de VIP no seu character.")
setPlayerStorageValue(cid, 13545, time)
local quantity = math.floor((getPlayerStorageValue(cid, 13545) - timenow)/(24 * 60 * 60))
doSendMagicEffect(getPlayerPosition(cid), math.random(28,30))
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� tem ".. quantity .." dias de VIP restantes.")
if (config.removeOnUse == "yes") then
doRemoveItem(item.uid, 1)
end
return TRUE
end