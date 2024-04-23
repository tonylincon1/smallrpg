function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Bem Vindo ao Small RPG!! 
	Explore o mapa, faça e descubra quests, rushi no pvp.
     Para não perder itens compre !aol, !bless.
	Eventos todos os dias.
	Conquiste com sua guild o castelo!
     Novas Salas de Teleports!			
     
Bom Jogo]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end