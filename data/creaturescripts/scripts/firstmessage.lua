function onLogin(cid)
local storage = 2522
if getPlayerStorageValue(cid, storage) == -1 then
doPlayerSendTextMessage(cid, 22, "Bem vindo ao Small Rpg.\nO mapa é próprio, com quests, hunts, pvp equilibrado e varias outras coisas para você se divertir \nPara mais informações fale com o npc Tutorial Iniciantes \nTenha um bom jogo.\nExplore nosso mapa e seja o top do ot!")
setPlayerStorageValue(cid, storage, 1)
else
end
return true
end