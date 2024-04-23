function onUse(cid, item, pos
doPlayerSendTextMessage(cid, 27, "Para fazer a quest você deve pegar primeiramente o bau. /nLogo após confira se você tem o item que vai ser utilizado para trocar com a sua arma, o nome do item é Troque Por Uma Arma. /nEm seguida suba em direção a casa e você ira escolhe a escada que representa a sua profissão. /nAgora fale com o NPC que irá trocar o item por uma arma. /nVolta para o incio e siga para baixo para começar o jogo.")
doRemoveItem(item.uid, 0)
return true
end