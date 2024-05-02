function onLogin(cid)
-- Friday = Sexta
-- Saturday = Sabado
-- Sunday = Domingo
DoubleXP = {"Friday"}
if isInArray(DoubleXP, os.date("%A")) then
doPlayerSetRate(cid, SKILL__LEVEL, 2.5)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "--[Double XP]--\nToda sexta estaremos em evento Double XP!!")
end
return true
end