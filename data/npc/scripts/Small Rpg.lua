local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function greetCallback(cid)
npcHandler:say('Bem vindo ao Small Rpg! Explore nosso mapa, quest escondidas em todo o territorio, caves de monstros pelo territorio tamb�m e sistema de task com recompensa e experiencia. Al�m disso, temos teleports tamb�m, para facilitar a vida do jogador, entretanto, tem caves que n�o est�o nos teleports. Eventos todos os dias e castelo 24 horas. Bom jogo!.',cid)
return false
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
