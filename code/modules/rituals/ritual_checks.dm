/mob/proc/defaultRitualCheck(var/mob/ritual_leader)
	to_chat(ritual_leader, "Someone forgot to change the default check!")
	return 0

/mob/proc/invoke_check(var/mob/ritual_leader)
	//makes sure that at least one mob has holy water in or on them

	for(var/mob/living/carbon/M in view(6, ritual_leader))
		if(/datum/reagent/water/holywater in M.chem_doses)
			return 1 //Someone has holy water on em
	return 0