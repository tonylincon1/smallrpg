local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

local condition = createConditionObject(CONDITION_CURSED)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
	addDamageCondition(condition, 1, 3000, -150)
	addDamageCondition(condition, 1, 3000, -150)
	addDamageCondition(condition, 1, 3000, -150)
	addDamageCondition(condition, 1, 3000, -100)
	addDamageCondition(condition, 1, 3000, -100)
	addDamageCondition(condition, 2, 3000, -100)
	addDamageCondition(condition, 2, 3000, -100)
	addDamageCondition(condition, 2, 3000, -100)
	addDamageCondition(condition, 2, 3000, -100)
	addDamageCondition(condition, 3, 3000, -90)
	addDamageCondition(condition, 3, 3000, -90)
	addDamageCondition(condition, 3, 3000, -90)
	addDamageCondition(condition, 4, 3000, -85)
	addDamageCondition(condition, 4, 3000, -80)
	addDamageCondition(condition, 5, 3000, -50)
	addDamageCondition(condition, 5, 3000, -30)
	addDamageCondition(condition, 6, 3000, -20)
	addDamageCondition(condition, 10, 3000, -20)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end