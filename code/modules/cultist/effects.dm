/*
 Use signals if you want effects to do something after an interaction.
*/

/datum/heretic_effect
	var/name									// Might not be needed
	var/add_message   							// Do we notify the user?
	var/examine_message 						// Is this effect visible?
	var/duration								// Should this effect be temporary?
	var/unique = FALSE							// Should this effect be added only once?

/datum/heretic_effect/proc/add_effect(var/mob/living/user)
	if(add_message)
		to_chat(user, add_message)
	if(duration)
		addtimer(CALLBACK(user, .proc/remove_effect, user), duration SECONDS)
	return TRUE

/datum/heretic_effect/proc/remove_effect(var/mob/living/user)
	return FALSE

/datum/heretic_effect/demigod
	name = "Ascension (DEBUG)"
	add_message = "I have ascended past mere skin, flesh, and bone."
	examine_message = "<span class='warning'><b>Their skin looks as tough as leather, and their muscles are bulging.\n</b></span>"

/datum/heretic_effect/demigod/add_effect(mob/living/carbon/human/Target)
	. = ..()
	if(istype(Target))
		Target.STAT_LEVEL(str) += 100
		Target.SKILL_LEVEL(melee) += 100

/datum/heretic_effect/demigod/remove_effect(mob/living/carbon/human/Target)
	. = ..()
	if(istype(Target))
		Target.STAT_LEVEL(str) += 100
		Target.SKILL_LEVEL(melee) += 100