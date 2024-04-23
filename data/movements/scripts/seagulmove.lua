local config = {
position = -1, -- coloque 1 se a sala estiver pra direita > e -1 se estiver pra esquerda <
storage = 17367, -- storage que salva os pontos
recorde = 17368 -- storage que vai salvar sua maior pontuacao
}

function onStepIn(cid, item, topos, frompos)
if not isPlayer(cid) then return true end
	if math.abs(frompos.x - getCreaturePos(cid).x) > 0 then
		createBesta(getCreaturePos(cid), config.position) -- cria besta ao entrar
		return true
	end
	local movePos = {x = frompos.x, y = frompos.y, z = frompos.z}
	local dir = movePos.y - topos.y
	local posBesta = getBestaPos(frompos, config.position)
	moveBesta(movePos, config.position, dir) -- move ao se mexer
return true
end

function onStepOut(cid, item, frompos, topos, lastpos)
    if math.abs(frompos.x - getCreaturePos(cid).x) <= 0 then
        return true
    end
    local movePos = {x = frompos.x, y = frompos.y, z = frompos.z}
    local posBesta = getBestaPos(frompos, config.position)
    removeBesta(movePos, config.position) -- remove a besta ao sair
    if not isPlayer(cid) then return true end
    if getPlayerStorageValue(cid, config.recorde) <= getPlayerStorageValue(cid, config.storage) then
        setPlayerStorageValue(cid, config.recorde, getPlayerStorageValue(cid, config.storage))
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "[Bird Hunt]\nYou made ".. getPlayerStorageValue(cid, config.recorde) .." points, that\'\s your new record!")
 setPlayerStorageValue(cid, config.storage, -1)
else
setPlayerStorageValue(cid, config.storage, -1)
end
 
return true
end