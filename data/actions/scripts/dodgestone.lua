local config = {
    effectonuse = 14, -- efeito que sai
    levelsdodge = 100,  --- leveis que terão
    storagedodge = 48902 -- storage que será verificado
    }
    
 function onUse(cid, item, frompos, item2, topos)
     if getPlayerStorageValue(cid, config.storagedodge) < config.levelsdodge then
    doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,config.effectonuse)
 doPlayerSendTextMessage(cid,22,"Você aumentou o nível de sua habilidade de Dodge para ["..(getPlayerStorageValue(cid, config.storagedodge)+1).."/100].")
 setPlayerStorageValue(cid, config.storagedodge, getPlayerStorageValue(cid, config.storagedodge)+1)
 elseif getPlayerStorageValue(cid, config.storagedodge) >= config.levelsdodge then
 doPlayerSendTextMessage(cid,22,"Você já atingiu o nível MÁXIMO de habilidade de dodge.\nParabéns!!!!")
     return 0
     end
 return 1
 end