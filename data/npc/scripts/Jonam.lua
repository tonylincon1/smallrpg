local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	
	local coins = {[2148] = 1, [2152] = 100, [2160] = 10000}

function countMoneyOnPos(pos)
 local money = 0
 for stack = 1, 50  do
  pos.stackpos = stack
  local item = getThingFromPos(pos)
  if item and item.uid > 0 then
   if coins[item.itemid] then
    money = money + coins[item.itemid] * item.type
   end
  end
 end
 return money
end
	

	
local posCoal = {x = 1094, y = 1119, z = 7} -- POSIÇÃO DO COAL, ONDE O GOLD DEVE ESTAR
local posNpc = {x = 1093, y = 1119, z = 7} -- POSIÇÃO DO NPC
local pos = getPosByDir(getThingPos(cid), getCreatureLookDirection(cid), 1) -- NÃO ALTERAR

	if msgcontains(msg, 'l') or msgcontains(msg, 'L') or msgcontains(msg, 'low') or msgcontains(msg, 'Low') then
		if countMoneyOnPos(pos) > 0 then
			if math.random(1, 6) <= 3 then
				doPlayerAddMoney(cid, countMoneyOnPos(pos)*2)
				doRemoveItem(getTileItemById(pos, 2148).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2148).uid)
				doRemoveItem(getTileItemById(pos, 2152).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2152).uid)
				doRemoveItem(getTileItemById(pos, 2160).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2160).uid)
				doSendMagicEffect(posNpc, 26)
				doSendMagicEffect(posNpc, 28)
				doCreatureSay(getNpcId(), getCreatureName(cid)..' tirou o numero '..math.random(1, 3)..', parabéns!', TALKTYPE_ORANGE_1)
			else
				doRemoveItem(getTileItemById(pos, 2148).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2148).uid)
				doRemoveItem(getTileItemById(pos, 2152).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2152).uid)
				doRemoveItem(getTileItemById(pos, 2160).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2160).uid)
				doSendMagicEffect(posNpc, 2)
				doSendMagicEffect(posNpc, 26)
				doCreatureSay(getNpcId(), getCreatureName(cid)..' tirou o numero '..math.random(4, 6)..', tente novamente!', TALKTYPE_ORANGE_1)
			end
		else
			doCreatureSay(getNpcId(), getCreatureName(cid)..', coloque uma quantia de gold no recipiente para começar a apostar!', TALKTYPE_ORANGE_1)
		end
		
	elseif msgcontains(msg, 'h') or msgcontains(msg, 'H') or msgcontains(msg, 'high') or msgcontains(msg, 'High') then
		if countMoneyOnPos(pos) > 0 then
			if math.random(1, 6) <= 3 then
				doPlayerAddMoney(cid, countMoneyOnPos(pos)*2)
				doRemoveItem(getTileItemById(pos, 2148).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2148).uid)
				doRemoveItem(getTileItemById(pos, 2152).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2152).uid)
				doRemoveItem(getTileItemById(pos, 2160).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2160).uid)
				doSendMagicEffect(posNpc, 26)
				doSendMagicEffect(posNpc, 28)
				doCreatureSay(getNpcId(), getCreatureName(cid)..' tirou o numero '..math.random(4, 6)..', parabéns!', TALKTYPE_ORANGE_1)
			else
				doRemoveItem(getTileItemById(pos, 2148).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2148).uid)
				doRemoveItem(getTileItemById(pos, 2152).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2152).uid)
				doRemoveItem(getTileItemById(pos, 2160).uid)
				repeat
				until not doRemoveItem(getTileItemById(pos, 2160).uid)
				doSendMagicEffect(posNpc, 2)
				doSendMagicEffect(posNpc, 26)
				doCreatureSay(getNpcId(), getCreatureName(cid)..' tirou o numero '..math.random(1, 3)..', tente novamente!', TALKTYPE_ORANGE_1)
			end
		else
			doCreatureSay(getNpcId(), getCreatureName(cid)..', coloque uma quantia de gold no recipiente para começar a apostar!', TALKTYPE_ORANGE_1)
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())