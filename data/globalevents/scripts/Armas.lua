function onThink(interval, lastExecution)

pos = {x = 1015, y = 1022, z = 6} -- Coordenada de onde sairá o texto

doSendAnimatedText(pos, 'Armas', 140)

doSendMagicEffect(pos, 3)

return true

end