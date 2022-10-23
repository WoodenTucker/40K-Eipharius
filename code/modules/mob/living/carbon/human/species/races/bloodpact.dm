/datum/species/bloodpact
	name = SPECIES_BLOODPACT
	name_plural = "Bloodpact"
	secondary_langs = list(LANGUAGE_TAU)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_tau.dmi'
	deform = 'icons/mob/human_races/r_def_tau.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 150
	mob_size = MOB_MEDIUM
	strength = STR_MEDIUM
	sexybits_location = BP_GROIN
	inherent_verbs = list(
	/mob/living/carbon/human/tau/proc/tauclasses,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
