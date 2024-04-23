local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function greetCallback(cid)
npcHandler:say('Esses s�o os itens usados pela guerreira Bulbi em sua luta contra o temivel "The Small Pumpkin" quando ele invadio a Small Vile. Hoje o Pumpkin residi no submund, � l� tamb�m que se encontram os itens Small.',cid)
return false
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
