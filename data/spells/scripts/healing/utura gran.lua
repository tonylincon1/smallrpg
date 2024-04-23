local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 20)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10 * 1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, 200)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 200)
setCombatCondition(combat, condition)
function onCastSpell(cid, var)
for i = 0, 9 do
addEvent(function()
 if isCreature(cid) then
doSendMagicEffect(getCreaturePosition(cid), 12)
end
end, 1 + (1000 * i))
end    return doCombat(cid, combat, var)
end