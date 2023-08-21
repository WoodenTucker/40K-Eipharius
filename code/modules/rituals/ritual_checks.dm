/mob/proc/defaultRitualCheck(var/mob/ritual_leader)
	to_chat(ritual_leader, "Someone forgot to change the default check!")
	return 0

/mob/proc/invoke_check(var/mob/ritual_leader)
	//makes sure that at least one mob is doused in holy water

	for(var/mob/living/carbon/M in view(6, ritual_leader))
		if(/datum/reagent/water/holywater in M.chem_doses)
			to_chat(ritual_leader, "Splashed guy found")
			return 1 //Someone has holy water on em
	to_chat(ritual_leader, "No splashed found!")
	return 0