function onThink(interval, lastExecution)

pos = {x = 1020, y = 1018, z = 7} -- Coordenada de onde sairá o texto

doSendAnimatedText(pos, 'Promot', 140)

doSendMagicEffect(pos, 3)

return true

end