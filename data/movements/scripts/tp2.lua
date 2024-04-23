local destino = {x = 1023, y = 1257, z = 7}  -- Aqui vc põe as coordenadas do local pra onde o player vai

function onStepIn(cid, item, pos)
doTeleportThing(cid,destino)
end