function onThink(interval, lastExecution)

pos = {x = 1030, y = 1002, z = 7} -- Coordenada de onde sairá o texto

doSendAnimatedText(pos, '(VIP)', 140)

doSendMagicEffect(pos, 15)

return true

end