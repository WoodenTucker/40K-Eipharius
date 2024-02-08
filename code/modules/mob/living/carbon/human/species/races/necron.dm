/datum/species/necron //VERY WIP, DO NOT ADD INTO .DME YET.
	name = SPECIES_NECRON
	name_plural = "Necrons"
	secondary_langs = list(LANGUAGE_NECRON)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_necron.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 60000000
	max_age = 120000000
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 250
	mob_size = MOB_MEDIUM
	strength = STR_VHIGH
	inherent_verbs = list(
	/mob/living/carbon/human/necron/proc/necronsetup,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp/necron,
		/datum/unarmed_attack/kick/necron,
		/datum/unarmed_attack/punch/necron
		)

	blood_color = "#4c0377"

/datum/species/necron/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(20,35)//Random age for kiddos.
	if(H.f_style)//tau don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>For the Greater Good! Our warship has arrived in orbital range to convert this world to the greater good. We must first try diplomacy, see if a water caste awakes so that we can trade and convince the humans that we are not the true enemy. In time they may learn to convert to the Greater Good..</span></big>")
	H.update_eyes()
	return ..()
/mob/living/carbon/human
	var/new_tau = SPECIES_TAU

/mob/living/carbon/human/necron
	gender = MALE

/mob/living/carbon/human/necron/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_tau)

/mob/living/carbon/human/necron/Initialize()
	. = ..()
	warfare_faction = NECRON
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/tau)
	outfit.equip(src)
	isburied = 1

	hand = 0//Make sure one of their hands is active.

