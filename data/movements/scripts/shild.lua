--SCRIPT FEITO POR Danihcv, para TibiaKing.com

local position1 = {x=1012, y=1152, z=7}  --Position 1 em que o monstro 1 aparecerá
local position2 = {x=1023, y=1153, z=7}  --Position 1 em que o monstro 1 aparecerá
local position3 = {x=1006, y=1168, z=7}  --Position 1 em que o monstro 1 aparecerá
local position4 = {x=1030, y=1168, z=7}  --Position 1 em que o monstro 1 aparecerá
local position5 = {x=1009, y=1178, z=7}  --Position 1 em que o monstro 1 aparecerá
local position6 = {x=1029, y=1178, z=7}  --Position 1 em que o monstro 1 aparecerá
local position7 = {x=1012, y=1180, z=7}  --Position 1 em que o monstro 1 aparecerá
local position8 = {x=1022, y=1182, z=7}  --Position 1 em que o monstro 1 aparecerá

local summon1 = 'Nightmaree.xml' --Nome editado no movements.xml do novo monstro imovel 1
local summon2 = 'Brotherhood' --Nome editado no movements.xml do novo monstro imovel 2
local summon3 = 'Nightmaree' --Nome editado no movements.xml do novo monstro imovel 3
local summon4 = 'Brotherhood' --Nome editado no movements.xml do novo monstro imovel 4
local summon5 = 'Nightmaree' --Nome editado no movements.xml do novo monstro imovel 5
local summon6 = 'Brotherhood' --Nome editado no movements.xml do novo monstro imovel 6
local summon7 = 'Nightmaree' --Nome editado no movements.xml do novo monstro imovel 7
local summon8 = 'Brotherhood' --Nome editado no movements.xml do novo monstro imovel 8

function onStepIn(monster, pos)

doCreateMonster(summon1, position1, false, false)
doCreateMonster(summon2, position2, false, false)
doCreateMonster(summon3, position3, false, false)
doCreateMonster(summon4, position4, false, false)
doCreateMonster(summon5, position5, false, false)
doCreateMonster(summon6, position6, false, false)
doCreateMonster(summon7, position7, false, false)
doCreateMonster(summon8, position8, false, false)
return
end