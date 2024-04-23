--- Script By RookWar ---
function onThink(interval, lastExecution)
pos = {x = 1018, y = 1021, z = 6} -- Coordenadas do teleport
pos1 = {x = 522, y = 742, z = 3} -- /\
pos2 = {x = 810, y = 456, z = 6} -- /\
pos3 = {x = 1019, y = 1007, z = 6} -- /\
doSendAnimatedText(pos, 'Cidadão', 140) -- Ira mandar Texto animado na pos
doSendAnimatedText(pos1, 'Cidadão', 140) -- /\, porém na pos1
doSendAnimatedText(pos2, 'Cidadão', 140) -- /\, porem na pos2
doSendAnimatedText(pos3, 'Treiners', 130) -- /\, porem na pos3
