function onUse(cid, item, pos
doPlayerSendTextMessage(cid, 27, "Para fazer a quest voc� deve pegar primeiramente o bau. /nLogo ap�s confira se voc� tem o item que vai ser utilizado para trocar com a sua arma, o nome do item � Troque Por Uma Arma. /nEm seguida suba em dire��o a casa e voc� ira escolhe a escada que representa a sua profiss�o. /nAgora fale com o NPC que ir� trocar o item por uma arma. /nVolta para o incio e siga para baixo para come�ar o jogo.")
doRemoveItem(item.uid, 0)
return true
end