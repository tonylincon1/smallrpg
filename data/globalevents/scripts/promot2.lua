function onThink(interval, lastExecution)

pos = {x = 1099, y = 930, z = 6} -- Coordenada de onde sairá o texto

doSendAnimatedText(pos, 'Promot', 140)

doSendMagicEffect(pos, 3)

return true

end