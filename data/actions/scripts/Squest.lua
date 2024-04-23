-- TonyPlySon Scripts --

function onUse(cid, item, frompos, item2, topos)

a = 13912 -- Storage

b = 2160 -- ID do Item (Exemplo ai é Crystal Coin)

c = 100 -- Quantidade do Item (No Caso ai é 100)

m1 = "Voce acabou de ganhar 1kk e o direito de entrar nos teleports" -- Menssagem se o player conseguir

m2 = "Voce ja fez essa quest" -- Menssage de error , Caso o player ja tenha feita ou nao tenha level

if getPlayerStorageValue(cid,a) == -1 then

doPlayerSendTextMessage(cid,25,m1)

doPlayerAddItem(cid, b, c)

setPlayerStorageValue(cid,a,1)

else

doPlayerSendTextMessage(cid,25,m2)

end

return TRUE

end