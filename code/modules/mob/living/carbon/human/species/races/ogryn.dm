/datum/species/ogryn
	name = "Ogryn"
	name_plural = "Ogryn"
	secondary_langs = list(LANGUAGE_LOW_GOTHIC)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_ogryn.dmi'
	deform = 'icons/mob/human_races/r_def_ogryn.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ANYTHING
	total_health = 350
	mob_size = MOB_LARGE
	strength = STR_HIGH
	sexybits_location = BP_GROIN
	var/bonehead = 0 //Boneheads are enhanced, more intelligent ogryn. Will make them a bit smarter
	base_auras = list(
		/obj/aura/regenerating/human/ogryn
		)

	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
/datum/species/ogryn/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)
	if(H.f_style)
		H.f_style = "Shaved"
		H.h_style = "Bald"
		H.gender = MALE
	to_chat(H, "<big><span class='warning'>LUV' ME EMPRA, LUV ME CLUB, LUV ME GROG</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
/mob/living/carbon/human
	var/new_ogryn = "Ogryn"

/mob/living/carbon/human/ogryn/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_ogryn)

/mob/living/carbon/human/ogryn
	gender = MALE
	var/isempty = 0
	var/iseating = 0

/mob/living/carbon/human/ogryn/Initialize()
	. = ..()
	fully_replace_character_name(random_ogryn_name())
	warfare_faction = IMPERIUM
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/ogryn)
	outfit.equip(src)

	hand = 0//Make sure one of their hands is active.
	isburied = 1
