------- Script by: Adriano Swatt ----
local condition_infight = createConditionObject(CONDITION_INFIGHT)
setConditionParam(condition_infight, CONDITION_PARAM_TICKS, 8000)

local gstrg = 12129 -- N�o Mexa, Storage de Controle Global.
local gstrg_control = 12130 -- N�o Mexa, Storage de Controle Itens.
local istrg = {12131, 12132, 12133} -- N�o Mexa, Storage de Seguran�a.
local items = {
[0] = {0},  -- NEUTRO
[1] = {2182}, -- ID do ITEM 1
[2] = {2183}, -- ID do ITEM 2
[3] = {2184}, -- ID do ITEM 3
[4] = {2185}, -- ID do ITEM 4
[5] = {2186}, -- ID do ITEM 5
[6] = {2187}, -- ID do ITEM 6
[7] = {2188}, -- ID do ITEM 7
[8] = {2189}, -- ID do ITEM 8
[9] = {2190}, -- ID do ITEM 9
[10] = {2191}, --ID do ITEM 10
[11] = {0}  -- NEUTRO
}
local valor = {2160, 50} -- ID da Moeda pra Jogar, Quantidade (pre�o)
local comb3 = {2160, 100} -- ID , Quantidade, para quem acertar todos itens da combina��o + o pr�mio configurado acima
local premio = {12391, 100} -- ID do Pr�mio, Quantidade (que o player ganhar� ao acertar os 3 itens)
local iluck_pos = {x=1109, y=1116, z=7} -- Posi��o onde fica a amostra do item da sorte
local pos = {{x=1108, y=1116, z=7}, {x=1107, y=1116, z=7}, {x=1106, y=1116, z=7}} -- Posi��es onde os itens sorteados aparecer�o
local effect = 26 -- Efeito na hora de selecionar o item da sorte
local eff = 30 -- Efeito ao criar os itens na mesa (hora do sorteio)
local reff = 29 -- Efeito ao remover itens da mesa (ao finalizar)
-------- FIM DAS CONFIGURA��ES --------

function onUse(cid, item, frompos, item2, topos)
local dir = getPlayerLookDir(cid)
local gget = getGlobalStorageValue(gstrg)
local gnumb = items[gget]
local gnumba = items[gget + 1]
local gnumbs = items[gget - 1]
    
    if gnumb then
        if dir == WEST or dir == EAST then -- Caso n�o esteja em posi��o de jogar.
            doPlayerSendTextMessage(cid, 18, "Para jogar, siga as dicas abaixo: \n Para escolher o item da sorte, vire-se para baixo e clique na alavanca at� selecion�-lo. \n Para jogar, ap�s ter selecionado o item da sorte, vire-se para cima e puxe novamente a alavanca.")
            
        elseif dir == NORTH then -- Posi��o de Jogar
            if gget ~= 0 then
                if getGlobalStorageValue(gstrg_control) < 1 then
                    if getPlayerItemCount(cid, valor[1]) >= valor[2] then
                    math1 = math.random(1,10)
                    math2 = math.random(1,10)
                    math3 = math.random(1,10)
                        doPlayerRemoveItem(cid, valor[1], valor[2])
                        mayNotMove(cid, true)
                        doAddCondition(cid, condition_infight)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "M�quina em funcionamento, aguarde.")
                        setGlobalStorageValue(gstrg_control, 1)
                    --- Criando itens
                        doSendMagicEffect(pos[1], eff)
                        doCreateItem(items[math1][1], pos[1])
                        setGlobalStorageValue(istrg[1], items[math1][1])
                        addEvent(doSendMagicEffect, 1000, pos[2], eff)
                        addEvent(doCreateItem, 1000, items[math2][1], pos[2])
                        setGlobalStorageValue(istrg[2], items[math2][1])
                        addEvent(doSendMagicEffect, 2000, pos[3], eff)
                        addEvent(doCreateItem, 2000, items[math3][1], pos[3])
                        setGlobalStorageValue(istrg[3], items[math3][1])
                    --- Checando Itens
                        if gnumbs[1] == getGlobalStorageValue(istrg[1]) then
                            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parab�ns, voc� j� acertou o primeiro item da combina��o.")
                            setPlayerStorageValue(cid, gstrg, (getPlayerStorageValue(cid, gstrg) + 1))
                        else
                            doPlayerSendTextMessage(cid, 18, "Que pena, j� perdeu na primeira chance.")
                        end
                        if gnumbs[1] == getGlobalStorageValue(istrg[2]) then
                            addEvent(doPlayerSendTextMessage, 1000, cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parab�ns, voc� acertou o segundo item da combina��o.")
                            setPlayerStorageValue(cid, gstrg, (getPlayerStorageValue(cid, gstrg) + 1))
                        else
                            addEvent(doPlayerSendTextMessage, 1000, cid, 18, "Que pena, perdeu na segunda chance.")
                        end
                        if gnumbs[1] == getGlobalStorageValue(istrg[3]) then
                            addEvent(doPlayerSendTextMessage, 2000, cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parab�ns, voc� acertou o terceiro item da combina��o.")
                            setPlayerStorageValue(cid, gstrg, (getPlayerStorageValue(cid, gstrg) + 1))
                        else
                            addEvent(doPlayerSendTextMessage, 2000, cid, 18, "Que pena, perdeu na terceira chance.")
                        end
                        addEvent(function()
                        for z = 1, 3 do
                            doRemoveItem(getTileItemById(pos[z], getGlobalStorageValue(istrg[z])).uid, 1)
                            doSendMagicEffect(pos[z], reff)
                        end
                            mayNotMove(cid, false)
                            setGlobalStorageValue(gstrg_control, 0)
                            addEvent(CassPremio, 500, cid)
                        end, 5000)
                    --- Fim Checagem
                    else
                        doPlayerSendCancel(cid, "Voc� precisa de "..valor[2].." "..getItemNameById(valor[1]).." para jogar.")
                    end
                else
                    doPlayerSendCancel(cid, "Precisa esperar o jogo finalizar para jogar novamente.")
                end
            else
                doPlayerSendCancel(cid, "Primeiro selecione o item de sorte para poder jogar.")
            end
            
        elseif dir == SOUTH then -- Posi��o de Selecionar Item da Sorte
            if getGlobalStorageValue(gstrg_control) < 1 then
                if gget <= 0 then
                    doCreateItem(gnumba[1], 1, iluck_pos)
                    doSendMagicEffect(iluck_pos, effect)
                    doPlayerSendCancel(cid, "Voc� selecionou o "..getItemNameById(gnumba[1]).." como seu item da sorte.")
                    setGlobalStorageValue(gstrg, 2)
                elseif gget >= 2 and gget < 11 then    
                    doRemoveItem(getTileItemById(iluck_pos, gnumbs[1]).uid, 1)
                    doCreateItem(gnumb[1], 1, iluck_pos)
                    doSendMagicEffect(iluck_pos, effect)
                    doPlayerSendCancel(cid, "Voc� selecionou o "..getItemNameById(gnumb[1]).." como seu item da sorte.")
                    setGlobalStorageValue(gstrg, (gget + 1))
                elseif gget >= 11 then
                    doSendMagicEffect(iluck_pos, effect)
                    doRemoveItem(getTileItemById(iluck_pos, gnumbs[1]).uid, 1)
                    doPlayerSendCancel(cid, "Voc� resetou os itens.")
                    setGlobalStorageValue(gstrg, 0)
                end
            else
                doPlayerSendCancel(cid, "Precisa esperar o jogo finalizar para selecionar outro item da sorte.")
            end
        end
    end
return true
end

function CassPremio(cid)
    if getPlayerStorageValue(cid, gstrg) == 1 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parab�ns, voc� acertou um item da combina��o, continue tentando.")
        setPlayerStorageValue(cid, gstrg, 0)
    elseif getPlayerStorageValue(cid, gstrg) == 2 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parab�ns, voc� acertou dois item da combina��o, continue tentando.")
        setPlayerStorageValue(cid, gstrg, 0)
    elseif getPlayerStorageValue(cid, gstrg) == 3 then
        doBroadcastMessage("Parab�ns, o jogador "..getPlayerName(cid).." acertou as 3 combina��es da Cassino Slots.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parab�ns, voc� acertou TODOS itens da combina��o e foi recompensado em "..comb3[2].." "..getItemNameById(comb3[1]).." e "..premio[2].." "..getItemNameById(premio[1])..".")
        doPlayerAddItem(cid, premio[1], premio[2])
        doPlayerAddItem(cid, comb3[1], comb3[2])
        setPlayerStorageValue(cid, gstrg, 0)
    end
return true
end