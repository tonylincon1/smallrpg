local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function greetCallback(cid)
npcHandler:say('Eu sou o protetor do templo do grandissimo Elder. Ele e o mago mais poderoso de todos os reinos, ele ajudou a Bulbi a salvar a Small Vile do terrivel ataque da "The Small Pumpkin", nosso querido Elder foi o fundador da cidade Frost Small e como tem o poder da imortalidade ele ainda vive nas ilhas geladas controlando a magia do planeta.',cid)
return false
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
