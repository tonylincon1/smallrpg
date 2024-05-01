function onLogin(cid)
         if getPlayerStorageValue(cid, exclusives_caves_config.storage) == -1 then
            setPlayerStorageValue(cid, exclusives_caves_config.storage, 0)
         end
         if getPlayerStorageValue(cid, exclusives_caves_config.check) == -1 then
            setPlayerStorageValue(cid, exclusives_caves_config.check, 0)
         end
         if getPlayerStorageValue(cid, exclusives_caves_config.storage) > 0 then
         local var = exclusives_caves_areas[getPlayerStorageValue(cid, exclusives_caves_config.check)]
         if isInRange(getPlayerPosition(cid), var.from, var.to) then
         doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid))) 
         doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE, string.format(exclusives_caves_config.mensagem,var.name))
         end
         setPlayerStorageValue(cid, exclusives_caves_config.storage, 0)
         setPlayerStorageValue(cid, exclusives_caves_config.check, 0)
         setPlayerStorageValue(cid, exclusives_caves_config.comand_add_exaust.storage, 0)
         end
    return true
end  
