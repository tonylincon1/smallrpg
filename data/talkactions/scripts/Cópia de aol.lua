function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 20000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Voce comprou um AOL", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Voce nao tem dinheiro suficiente", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end