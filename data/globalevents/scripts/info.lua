function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Bem Vindo ao Small RPG!! 
	Explore o mapa, fa�a e descubra quests, rushi no pvp.
     Para n�o perder itens compre !aol, !bless.
	Eventos todos os dias.
	Conquiste com sua guild o castelo!
     Novas Salas de Teleports!			
     
Bom Jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end