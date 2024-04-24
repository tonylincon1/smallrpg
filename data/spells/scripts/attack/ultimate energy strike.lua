local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10, -100, -10, -200, 100, 100, 3.6, 3.6)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end