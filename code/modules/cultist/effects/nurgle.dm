/datum/heretic_effect/deathtolerant
	name = "Death Tolerance"
	add_message = "<span class='notice'>Stenches and death are a sign of a functional cycle of rebirth. They no longer affect me.</span>"
	unique = TRUE

/datum/heretic_effect/deathtolerant/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.set_trait(new/datum/trait/death_tolerant)
	user.nogross = TRUE

/datum/heretic_effect/tough
	name = "Tough"
	unique = TRUE

/datum/heretic_effect/tough/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(dex) += 4

/datum/heretic_effect/tough/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(dex) -= 4