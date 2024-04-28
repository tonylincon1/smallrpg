-- Killua Automatic Raids System
-- Created by Killua, antigo amoeba13

local raids = {
	-- Raids normais
    {
        name = "Perigos da Estrada para Desert City",
        monsters = {"Bandit", "Smuggler", "Nomad Desert"},
        boss = nil,
        hasBoss = false,
        fromPoss = {x=810, y=678, z=7},
        toPoss = {x=832, y=697, z=7},
        dates = {"Tuesday-15:30", "Friday-20:45", "Sunday-00:31"},
        maxMonsters = 20,
        timeBoss = 0,
        messages = {
            "A estrada para Desert City sempre foi um lugar muito perigoso.",
            "Pedimos aos iniciantes que evitem a rota Norte, pois os bandidos fazem constantes saques naquela região.",
            "Cuidado! Os bandidos e contrabandistas estão à espreita em toda a estrada."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },
	{
        name = "A Ameaça dos Gigantes em Small Vile",
        monsters = {"Cyclops", "Cyclops Drone", "Cyclops Smith", "Behemoth"},
        boss = "Behemoth",
        hasBoss = true,
        fromPoss = {x=985, y=988, z=7},
        toPoss = {x=1018, y=1017, z=7},
        dates = {"Wednesday-18:20", "Saturday-21:55"},
        maxMonsters = 20,
        timeBoss = 150,  -- tempo em segundos após o início para o boss aparecer
        messages = {
            "Os gigantes são uma grande ameaça para a vila. Desde o início eles tentam destruir os humanos.",
            "Pedimos a todos os moradores de Small Vile para protegerem a cidade dos ataques dos gigantes.",
            "Os gigantes estão atacando com toda a força! Defenda Small Vile com coragem."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },
	{
        name = "Invasão dos Trolls de Gelo em Frost Small",
        monsters = {"Ice Skin"},
        boss = nil,
        hasBoss = false,
        fromPoss = {x=569, y=736, z=7},
        toPoss = {x=578, y=746, z=7},
        dates = {"Sunday-16:00", "Wednesday-03:15"},
        maxMonsters = 20,
        timeBoss = 0,
        messages = {
            "A estrada para Frost Small é muito perigosa, principalmente quando os trolls de gelo aparecem.",
            "O NPC Foldor avistou uma tropa de trolls de gelo atacando a cidade, corra para defendê-la.",
            "Os Ice Skins estão cada vez mais próximos! Prepare-se para o combate na neve."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },
	{
        name = "Ataque dos Escaravelhos em Desert City",
        monsters = {"Larva", "Scarab", "Ancient Scarab"},
        boss = "Ancient Scarab",
        hasBoss = true,
        fromPoss = {x=853, y=511, z=7},
        toPoss = {x=864, y=519, z=7},
        dates = {"Saturday-14:00", "Tuesday-22:00"},
        maxMonsters = 8,
        timeBoss = 150,  -- tempo em segundos após o início para o boss aparecer
        messages = {
            "O NPC Teodor relata estranhas aparições de escaravelhos às portas da Desert City.",
            "Ancient Scarabs estão liderando um ataque nas muralhas de Desert City.",
            "Defenda a cidade! Os Ancient Scarabs avançam com força total."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    }

	-- Raids boses
	{
		name = "A Lenda do Dragão Demodras",
		monsters = {"Demodras"},
		boss = "Demodras",
		hasBoss = true,
		fromPoss = {x=817, y=941, z=9},
		toPoss = {x=817, y=941, z=9},
		dates = {"Monday-23:00"},
		maxMonsters = 1,
		timeBoss = 200,  -- tempo em segundos após o início para o boss aparecer
		messages = {
			"De todas as lendas do continente, a que mais impressiona é a lenda do dragão Demodras.",
			"Dizem que esse dragão sempre existiu! Não teve um início, e provavelmente não terá um fim...",
			"Segundo a lenda, esse dragão retorna de tempos em tempos às profundezas do covil de dragões abaixo das slimes de Small Vile..."
		},
		messageSent = {false, false, false},
		lastExecuted = nil  -- Registra a última vez que a raid foi executada
	},
	{
        name = "O Retorno de Carvmor à Frost City",
        monsters = {"Carvmor"},
        boss = "Carvmor",
        hasBoss = true,
        fromPoss = {x=556, y=757, z=7},
        toPoss = {x=556, y=757, z=7},
        dates = {"Friday-22:00", "Sunday-11:00"},
        maxMonsters = 1,
        timeBoss = 15,  -- tempo em segundos após o início para o boss aparecer
        messages = {
            "Muito cuidado, aventureiros. Cuidado ao procurar desafios onde a recompensa é valiosa demais.",
            "Carvmor, o Lorde da Destruição, retornou ao mundo mortal (na Frost City) para dele tomar posse!",
            "Prepare-se para enfrentar Carvmor, o temível Lorde da Destruição, que agora assombra as terras de Frost City."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },
	{
        name = "O Despertar de Necropharus",
        monsters = {"Necropharus"},
        boss = "Necropharus",
        hasBoss = true,
        fromPoss = {x=744, y=864, z=7},
        toPoss = {x=744, y=864, z=7},
        dates = {"Tuesday-20:30"},
        maxMonsters = 1,
        timeBoss = 200,  -- tempo em segundos após o início para o boss aparecer
        messages = {
            "O céu está escurecendo e no cemitério da cidade parece estar sendo invocado um mago sombrio.",
            "Segundo a lenda, esse mago retorna de tempos em tempos às profundezas...",
            "Necropharus, o mago sombrio, foi invocado! Prepare-se para enfrentá-lo nas sombras do cemitério."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },
	{
        name = "Defesa da Loja de Firewalker e Ring Seller",
        monsters = {"Minotaur", "The Horned Fox", "Minotaur Guard", "Minotaur Archer"},
        boss = "The Horned Fox",
        hasBoss = true,
        fromPoss = {x=1000, y=1012, z=7},
        toPoss = {x=1003, y=1015, z=7},
        dates = {"Wednesday-09:30"},
        maxMonsters = 6,
        timeBoss = 3,  -- tempo em segundos após o início para o boss aparecer
        messages = {
            "Firewalker e Ring Seller estão sofrendo um assalto por minotauros em sua loja! Ajude-os a se livrar deles!",
            "Os minotauros estão invadindo! Defenda a loja e proteja os comerciantes.",
            "The Horned Fox, o líder dos minotauros, entrou na loja! É hora do confronto final."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },
	{
        name = "O Retorno da Rainha das Aranhas",
        monsters = {"The Old Widow"},
        boss = "The Old Widow",
        hasBoss = true,
        fromPoss = {x=726, y=744, z=7},
        toPoss = {x=726, y=744, z=7},
        dates = {"Sunday-19:00", "Wednesday-12:00"},
        maxMonsters = 1,
        timeBoss = 200,  -- tempo em segundos após o início para o boss aparecer
        messages = {
            "Há uma lenda em que diz que a mãe das aranhas está voltando.",
            "Há uma grande concentração de aranhas no templo do norte, o monge está assustado.",
            "Segundo a lenda, esse é o indício de que a Rainha das Aranhas vai aparecer..."
        },
        messageSent = {false, false, false},
        lastExecuted = nil  -- Registra a última vez que a raid foi executada
    },

	-- Boses diarios
}

local function getRandomCoordinate(fromPos, toPos)
    if fromPos > toPos then
        fromPos, toPos = toPos, fromPos  -- Troca os valores se estiverem na ordem errada
    end
    return math.random(fromPos, toPos)
end

function isWalkable(pos)-- by Nord / editado por Omega
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then 
        return false
    elseif getTopCreature(pos).uid > 0 then
        return false
    elseif isCreature(getTopCreature(pos).uid) then
        return false
    elseif getTileInfo(pos).protection then
        return false
    elseif hasProperty(getThingFromPos(pos).uid, 3) or hasProperty(getThingFromPos(pos).uid, 7) then
        return false
    end
    return true
end
 
function onThink(interval, lastExecution, thinkInterval)
    local currentTime = os.date("%A-%H:%M")
    for _, raid in pairs(raids) do
        if table.find(raid.dates, currentTime) and raid.lastExecuted ~= currentTime then
            raid.lastExecuted = currentTime  -- Atualiza o tempo de execução para o tempo atual
            local a = 0
            local b = 60000

            -- Envia as mensagens programadas
            for i = 1, #raid.messages do
                if not raid.messageSent[i] then
                    addEvent(doBroadcastMessage, 60000 * i, raid.messages[i])
                    raid.messageSent[i] = true
                end
            end

            -- Cria os monstros conforme especificado em maxMonsters
            while a < raid.maxMonsters do
                local monsterIndex = math.random(1, #raid.monsters)
                local pos = {
                    x = getRandomCoordinate(raid.fromPoss.x, raid.toPoss.x), 
                    y = getRandomCoordinate(raid.fromPoss.y, raid.toPoss.y), 
                    z = getRandomCoordinate(raid.fromPoss.z, raid.toPoss.z)
                }
                addEvent(function()
                    if isWalkable(pos) then
                        doCreateMonster(raid.monsters[monsterIndex], pos)
                    end
                end, b)
                a = a + 1
                b = b + 500
            end
            
            -- Cria o boss se a raid tem um boss e ainda não foi enviado
            if raid.hasBoss then
                local bossPos = {
                    x = getRandomCoordinate(raid.fromPoss.x, raid.toPoss.x), 
                    y = getRandomCoordinate(raid.fromPoss.y, raid.toPoss.y), 
                    z = getRandomCoordinate(raid.fromPoss.z, raid.toPoss.z)
                }
                addEvent(function()
                    if isWalkable(bossPos) then
                        doCreateMonster(raid.boss, bossPos)
                    end
                end, raid.maxMonsters * 500 + raid.timeBoss * 1000)
            end
        end
    end
    return true
end