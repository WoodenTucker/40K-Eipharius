/datum/species/kroot
	name = SPECIES_KROOT
	name_plural = "Kroot"
	secondary_langs = list(LANGUAGE_TAU)
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
	inherent_verbs = list(
	/mob/living/carbon/human/kroot/proc/givekrootstats
		)
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
	maxHealth = 200
	health = 200
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
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/kroot)
	outfit.equip(src)

	hand = 0//Make sure one of their hands is active.
	var/weapon = pick(/obj/item/crowbar, /obj/item/melee/classic_baton/trench_club, /obj/item/melee/classic_baton)
	put_in_hands(new weapon)//Give them a weapon.


/mob/living/carbon/human/kroot/proc/givekrootstats() //this is extremely hacky and clown world but I cannot for the life of me find another way to do this.
	set name = "Stretch your muscles"
	set category = "Kroot"
	set desc = "Gives kroot stats since I can't seem to do it any other way in this clown world."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] stretches their muscles after a long flight, feeling their strength and skill return to them.")
	src.add_stats(rand(14,16),rand(14,18),rand(12,15),10)
	src.add_skills(rand(6,10),rand(6,10),rand(0,3),0,0)
	src.warfare_language_shit(TAU)
	src.verbs -= /mob/living/carbon/human/kroot/proc/givekrootstats