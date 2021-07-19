/datum/species/necron
	name = SPECIES_NECRON
	name_plural = "metal boners"
	default_language = LANGUAGE_NECRON
	language = LANGUAGE_NECRON
	name_language = LANGUAGE_NECRON
	additional_langs = LANGUAGE_LOW_GOTHIC
	min_age = 250
	max_age = 5000
//	icon_template = 'icons/mob/human_races/r_tallcron.dmi'
	icobase = 'icons/mob/human_races/r_tallcron.dmi'
	deform = 'icons/mob/human_races/r_tallcron.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 500
	mob_size = MOB_LARGE
	strength = STR_VHIGH
	genders = MALE
	sexybits_location = BP_GROIN
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_EMBED|SPECIES_FLAG_NO_SCAN
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)

	blood_color = "#00FF00"


/datum/species/necron/tall
	name = SPECIES_NECRON_TALL
//	icon_template = 'icons/mob/human_races/r_tallercron.dmi'
	icobase = 'icons/mob/human_races/r_tallercron.dmi'
	deform = 'icons/mob/human_races/r_tallercron.dmi'

/datum/species/necron/wide
	name = SPECIES_NECRON_WIDE
//	icon_template = 'icons/mob/human_races/r_widecron.dmi'
	pixel_offset_x = -16
	icobase = 'icons/mob/human_races/r_widecron.dmi'
	deform = 'icons/mob/human_races/r_widecron.dmi'



/datum/species/necron/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//tau don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>You wake up after a long flight to find yourself in Imperial space. Go to your Tau tab and stretch your muscles.</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human
	var/new_necron = SPECIES_NECRON

/mob/living/carbon/human
	var/new_necron_tall = SPECIES_NECRON_TALL

/mob/living/carbon/human
	var/new_necron_wide = SPECIES_NECRON_WIDE

/mob/living/carbon/human/necron
	gender = MALE

/mob/living/carbon/human/necron/Initialize()
	. = ..()
	fully_replace_character_name(random_taufw_name(src.gender))
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/tau)
	outfit.equip(src)
	isburied = 1

	hand = 0//Make sure one of their hands is active.



/mob/living/carbon/human/necron/New(var/new_loc)
//	species.create_organs()
	..(new_loc, new_necron)

/mob/living/carbon/human/necron/tall/New(var/new_loc)
	..(new_loc, new_necron_tall)

/mob/living/carbon/human/necron/wide/New(var/new_loc)
	..(new_loc, new_necron_wide)