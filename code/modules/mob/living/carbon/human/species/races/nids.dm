/datum/species/xenos/tyranids
	name = SPECIES_TYRANID
	name_plural = "Tyranids"
	secondary_langs = list(LANGUAGE_HIVE)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/tyranids/r_tyranid.dmi'
	deform = 'icons/mob/human_races/tyranids/r_def_tyranid.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 450
	mob_size = MOB_MEDIUM
	strength = STR_VHIGH
	teeth_type = /obj/item/stack/teeth/human //til I get cool nid teeth
	sexybits_location = BP_GROIN
	inherent_verbs = list()
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)

	pixel_offset_x = -16
	has_fine_manipulation = 0
	siemens_coefficient = 0
	gluttonous = GLUT_ANYTHING
	stomach_capacity = MOB_MEDIUM

	brute_mod = 0.25 // Hardened carapace.
	burn_mod = 1.1    // Weak to fire.


	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED
	appearance_flags = HAS_EYE_COLOR | HAS_SKIN_COLOR

	blood_color = "#05ee05"
	flesh_color = "#282846"
	base_color =  "#00060c"

	gibbed_anim = "gibbed-a"
	dusted_anim = "dust-a"
	death_message = "lets out a waning guttural screech, green blood bubbling from its maw."
	death_sound = 'sound/voice/hiss6.ogg'

	speech_sounds = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
	speech_chance = 100

	breath_type = null
	poison_type = null

	vision_flags = SEE_SELF|SEE_MOBS

/datum/species/xenos/tyranids/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for nidders
	if(H.f_style)//nids dont get beards
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>I must feed...</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human
	var/new_nid = SPECIES_TYRANID

/mob/living/carbon/human/genestealer
	gender = MALE

/mob/living/carbon/human/genestealer/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_nid)