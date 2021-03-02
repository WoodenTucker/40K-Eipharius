/datum/species/kroot
	name = SPECIES_KROOT
	name_plural = "Kroot"
	secondary_langs = list(LANGUAGE_ORKY)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_kroot.dmi'
	deform = 'icons/mob/human_races/r_def_kroot.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ANYTHING
	total_health = 150
	mob_size = MOB_MEDIUM
	strength = STR_MEDIUM
	sexybits_location = BP_GROIN
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)

/mob/living/carbon/human
	//var/waaagh_regen = 0  //natural regeneration of waaagh it changes when the ork is in presence of a ork banner or if he was buffed by the warboss
	var/new_kroot = SPECIES_KROOT

/mob/living/carbon/human/kroot
	name = "kroot"
	real_name = "kroot"
	gender = MALE
	maxHealth = 150
	health = 150
	status_flags = 0
	var/isempty = 0

/mob/living/carbon/human/kroot/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_kroot)
	spawn(5)
		if(!src.ckey)
			isempty = 1
			request_player()

/mob/living/carbon/human/kroot/Initialize()
	. = ..()
	fully_replace_character_name(random_kroot_name(src.gender))
	zone_sel = new /obj/screen/zone_sel( null )
	zone_sel.selecting = pick("chest", "head")
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/kroot)
	outfit.equip(src)
	a_intent = I_HURT

	hand = 0//Make sure one of their hands is active.
	var/weapon = pick(/obj/item/crowbar, /obj/item/melee/classic_baton/trench_club, /obj/item/melee/classic_baton)
	put_in_hands(new weapon)//Give them a weapon.