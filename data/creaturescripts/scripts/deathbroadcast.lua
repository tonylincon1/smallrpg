function onKill(cid, target, lastHit)
 
local str = "O player %s acaba de ser morto no n�vel %d por %s"
 
    if isPlayer(cid) and isPlayer(target) then
        doBroadcastMessage(str:format(getCreatureName(target), getPlayerLevel(target), getCreatureName(cid)), 27)
    end
 
    return true
end