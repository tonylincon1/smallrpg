local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {11207, 7384}, -- item1 item que será pedido e que será dado na primeira troca
          item2 = {11207, 7959} -- item2 item que será pedido e que será dado na segunda troca
	  item3 = {11207, 8910, 8922} -- item2 item que será pedido e que será dado na segunda troca
	  item4 = {11207, 7368} -- item2 item que será pedido e que será dado na segunda troca
	  item5 = {11207, 7415} -- item2 item que será pedido e que será dado na segunda troca
}
local counts = {
          count1 = {1, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count2 = {1, 1} -- count2 quantidade que será pedido e que será dado na segunda troca
	  count3 = {1, 2} -- count2 quantidade que será pedido e que será dado na segunda troca
	  count4 = {1, 1} -- count2 quantidade que será pedido e que será dado na segunda troca
	  count5 = {1, 1} -- count2 quantidade que será pedido e que será dado na segunda troca
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'Espada') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('You just swap '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' for '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
                    end

	   if msgcontains(msg, 'Machado') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemNameById(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..'.', cid)
                    end

	    if msgcontains(msg, 'Wand e Rod') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('You just swap '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..' for '.. counts.count3[2] ..' '.. getItemNameById(items.item3[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..'.', cid)
                    end

	     if msgcontains(msg, 'Star') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('You just swap '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..' for '.. counts.count4[2] ..' '.. getItemNameById(items.item4[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..'.', cid)
                    end

          elseif msgcontains(msg, 'Marreta') then
                    if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('You just swap '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..' for '.. counts.count5[2] ..' '.. getItemNameById(items.item5[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..'.', cid)
                    end
          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())