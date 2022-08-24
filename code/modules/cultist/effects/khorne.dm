/datum/heretic_effect/painless
	name = "Pain Immunity"
	add_message = "<span class='notice'>You feel your body mutate further. The pain that comes with battle feels as if it has faded. Replaced only with the desire to spill blood.</span>"
	unique = TRUE

/datum/heretic_effect/painless/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.species_flags |= SPECIES_FLAG_NO_PAIN

/datum/heretic_effect/painless/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.species_flags &= SPECIES_FLAG_NO_PAIN

/datum/heretic_effect/strength
	name = "Strength"
	add_message = "<span class='notice'>You feel your body mutate further. Your muscles feel imbued with strength.</span>"
	var/stat_increase = 5

/datum/heretic_effect/strength/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(str) += stat_increase

/datum/heretic_effect/strength/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(str) -= stat_increase

/datum/heretic_effect/strength/greater
	name = "Strength"
	add_message = "<span class='notice'>You feel your body mutate further. Your muscles feel imbued with strength.</span>"
	examine_message = "<span class='warning'><b>They look ABSURDLY strong!\n</b></span>"
	stat_increase = 10
	unique = TRUE

/datum/heretic_effect/strength/lesser
	name = "Strength"
	add_message = "<span class='notice'>You feel your body mutate further. Your muscles feel imbued with strength.</span>"
	stat_increase = 2

/datum/heretic_effect/slow
	name = "Slow"
	add_message = "<span class='notice'>You feel slower.</span>"

/datum/heretic_effect/slow/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.slowdown += 0.2

/datum/heretic_effect/slow/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.slowdown -= 0.2

/datum/heretic_effect/tough_skin
	name = "Leather Skin"
	add_message = "<span class='notice'>You feel your skin toughen.</span>"
	examine_message = "<span class='warning'><b>Their skin looks like leather.\n</b></span>"

/datum/heretic_effect/tough_skin/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.brute_mod = 0.8
	user.STAT_LEVEL(str) += 4

/datum/heretic_effect/tough_skin/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.brute_mod = 1
	user.STAT_LEVEL(str) -= 4

/datum/heretic_effect/healing
	name = "Healing Aura"
	add_message = "<span class='notice'>Small nicks and bruises on your body begin to fade.</span>"

/datum/heretic_effect/healing/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	if(user.species.base_auras)
		user.species.base_auras += /obj/aura/regenerating/human/astartes
	else
		user.species.base_auras = list(/obj/aura/regenerating/human/astartes)

/datum/heretic_effect/healing/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.base_auras -= /obj/aura/regenerating/human/astartes
