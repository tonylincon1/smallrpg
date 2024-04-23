function onThink(interval, lastExecution)

pos = {x = 1093, y = 932, z = 6} -- Coordenada de onde sairá o texto

doSendAnimatedText(pos, 'Promot', 140)

doSendMagicEffect(pos, 3)

return true

end