local teleportPos = {x = 1137, y = 888, z = 7, stackpos = 1} -- Posição em que se abre o teleport
local teleportId = 1387




function onTimer()
    for i = 1, 255 do
        teleportPos.stackpos = i


        if getThingFromPos(teleportPos).itemid == teleportId then


            doRemoveItem(getThingFromPos(teleportPos).uid, 1)
        end
    end
    return true
end