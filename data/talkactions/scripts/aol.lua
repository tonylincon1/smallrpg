function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 0) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Peguei uma aol", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Nao consegui uma aol", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end