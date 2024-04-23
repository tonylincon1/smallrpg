local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function greetCallback(cid)
npcHandler:say('Ol�, ou sou filha da lendaria Bulbi, a salvadora da cidade de Small Vile. Minha m�e morreu aos 76 anos e foi enterrada no antigo c�miterio da cidade, com sua espada, mas eu tenho algumas recorda��es enterredas com um memorial dela. Pretendo um dia ser igual a ela.',cid)
return false
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
