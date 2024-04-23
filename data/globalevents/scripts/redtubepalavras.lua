	local config = {
    positions = {
["VipFree"] = { x = 155, y = 47, z = 7 },
["Up Baixo"] = { x = 244, y = 263, z = 10 },
["Up Médio"] = { x = 264, y = 255, z = 10 },
["Up Medio"] = { x = 254, y = 255, z = 10 },
["Up Mediu"] = { x = 244, y = 255, z = 10 },
["Max Level"] = { x = 253, y = 263, z = 10 },
["Max Loot"] = { x = 255, y = 263, z = 10 },
["Quests"] = { x = 1017, y = 1000, z = 7 },
["Eventos"] = { x = 1019, y = 1000, z = 7 },
["Arena 1"] = { x = 123, y = 34, z = 14 },
["Arena"] = { x = 1144, y = 891, z = 7 },
["Fire"] = { x = 1034, y = 880, z = 7 },
["Desert"] = { x = 1034, y = 873, z = 7 },
["Frost"] = { x = 1026, y = 880, z = 7 },
["Small"] = { x = 1026, y = 873, z = 7 },
["+Treiners"] = { x = 1019, y = 1005, z = 5 },
["Treineers"] = { x = 1020, y = 1007, z = 6 },
["Treiners"] = { x = 1018, y = 1007, z = 6 },
["Comercio"] = { x = 1016, y = 1009, z = 7 },
["Zombie"] = { x = 1137, y = 888, z = 7 },
["War"] = { x = 1137, y = 891, z = 7 },
["Corrida"] = { x = 1144, y = 887, z = 7 },
["Castelo"] = { x = 1021, y = 1000, z = 7 },
["Cidades"] = { x = 1015, y = 1000, z = 7 },
["Depot"] = { x = 1019, y = 1006, z = 7 },
["Teleports"] = { x = 1013, y = 1000, z = 7 },
   
  }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  