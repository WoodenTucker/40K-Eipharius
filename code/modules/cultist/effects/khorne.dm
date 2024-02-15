/datum/heretic_effect/strength
	name = "Strength"
	add_message = "<span class='notice'>You feel your body mutate further. Your muscles feel imbued with strength.</span>"
	var/stat_increase = 2

/datum/heretic_effect/strength/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(str) += stat_increase

/datum/heretic_effect/strength/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(str) -= stat_increase

/datum/heretic_effect/strength/greater
	name = "Strength"
	add_message = "<span class='notice'>You feel your body mutate further. Your muscles feel imbued with strength.</span>"
	stat_increase = 3
	unique = TRUE

/datum/heretic_effect/strength/lesser
	name = "Strength"
	add_message = "<span class='notice'>You feel your body mutate further. Your muscles feel imbued with strength.</span>"
	stat_increase = 1

/datum/heretic_effect/tough_skin
	name = "Leather Skin"
	add_message = "<span class='notice'>You feel your skin toughen.</span>"
	unique = TRUE

/datum/heretic_effect/tough_skin/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.brute_mod = 0.9
	user.STAT_LEVEL(end) += 3

/datum/heretic_effect/tough_skin/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.brute_mod = 1
	user.STAT_LEVEL(end) -= 3

/datum/heretic_effect/healing
	name = "Healing Aura"
	add_message = "<span class='notice'>Small nicks and bruises on your body begin to fade.</span>"
	unique = TRUE

/datum/heretic_effect/healing/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	if(user.species.base_auras)
		user.species.base_auras += /obj/aura/regenerating/human/khornate
	else
		user.species.base_auras = list(/obj/aura/regenerating/human/khornate)

/datum/heretic_effect/healing/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.base_auras -= /obj/aura/regenerating/human/khornate
