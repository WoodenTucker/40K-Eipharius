
//ORKS ORKS ORKS
//by the way i made the orks in /datum/species because its a lot easier to modify the stats with all the species variables, but everything else is in /mob/living/carbon/human

/datum/species/ork
	name = SPECIES_ORK_GRETCHIN
	name_plural = "Gretchins"
	secondary_langs = list(LANGUAGE_ORKY)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_gretchin.dmi'
	deform = 'icons/mob/human_races/r_def_gretchin.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_TINY
	mob_size = MOB_SMALL
	strength = STR_LOW
	brute_mod = 1.2
	burn_mod = 1.1
	toxins_mod = 0.9
	sexybits_location = BP_GROIN
	inherent_verbs = list(
		//mob/living/carbon/human/ork/proc/evolve,
		/mob/living/carbon/human/ork/proc/scavenge,
		/mob/living/carbon/human/ork/proc/giveorkzstats,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
/datum/species/ork/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age
	if(H.h_style)
		H.h_style = "Bald" //never seen an ork wif hair
	if(H.f_style)//orks dont have beards
		H.f_style = "Shaved"
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care (this fixs the weird grey vision shit when placing people in a new mob)
	return ..()
/datum/species/ork/nob
	name = SPECIES_ORK_NOB
	name_plural = "Ork Nobz"
	icobase = 'icons/mob/human_races/r_ork.dmi'
	deform = 'icons/mob/human_races/r_def_ork.dmi'
	strength = STR_VHIGH
	mob_size = MOB_LARGE
	brute_mod = 0.9
	burn_mod = 0.9
	toxins_mod = 0.9
	inherent_verbs = list(
		/mob/living/carbon/human/ork/proc/warscream    //,
		//mob/living/carbon/human/ork/proc/evolve
		)

/datum/species/ork/mek
	name = SPECIES_ORK_MEK
	name_plural = "Mekboyz"
	icobase = 'icons/mob/human_races/r_ork.dmi'
	deform = 'icons/mob/human_races/r_def_ork.dmi'
	strength = STR_HIGH
	total_health = 400
	mob_size = MOB_MEDIUM
	inherent_verbs = list(
		/mob/living/carbon/human/ork/proc/warscream,
		//mob/living/carbon/human/ork/proc/evolve,
		/mob/living/carbon/human/ork/proc/scavenge,
		/mob/living/carbon/human/ork/proc/giveorkzstats
		)

/datum/species/ork/boss
	name = SPECIES_ORK_BOSS
	icobase = 'icons/mob/human_races/r_ork.dmi'
	deform = 'icons/mob/human_races/r_def_ork.dmi'
	strength = 30
	mob_size = MOB_LARGE
	brute_mod = 0.7
	burn_mod = 0.8
	toxins_mod = 0.7
	inherent_verbs = list(
		/mob/living/carbon/human/ork/proc/warscream,
		/mob/living/carbon/human/ork/proc/bozzscream
		)

