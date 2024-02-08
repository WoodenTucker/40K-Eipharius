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
	blood_volume = 0
	inherent_verbs = list(
	/mob/living/carbon/human/necron/proc/necronsetup,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp/necron,
		/datum/unarmed_attack/kick/necron,
		/datum/unarmed_attack/punch/necron
		)

	blood_color = "#4c0377"


	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/robotic/chest/necron),
		BP_GROIN =  list("path" = /obj/item/organ/external/robotic/groin/necron),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/necron),
		BP_L_ARM =  list("path" = /obj/item/organ/external/robotic/arm/necron),
		BP_R_ARM =  list("path" = /obj/item/organ/external/robotic/arm/right/necron),
		BP_L_LEG =  list("path" = /obj/item/organ/external/robotic/leg/necron),
		BP_R_LEG =  list("path" = /obj/item/organ/external/robotic/leg/right/necron),
		BP_L_HAND = list("path" = /obj/item/organ/external/robotic/hand/necron),
		BP_R_HAND = list("path" = /obj/item/organ/external/robotic/hand/right/necron),
		BP_L_FOOT = list("path" = /obj/item/organ/external/robotic/foot/necron),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/robotic/right/necron)
		)

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/necron,
		BP_HEART =    /obj/item/organ/internal/heart/necron,
		BP_BRAIN =    /obj/item/organ/internal/brain/necron
		)

/datum/species/necron/handle_post_spawn(var/mob/living/carbon/human/H)
	if(H.f_style)
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>SYSTEMS BOOTING... YOU HAVE AWAKENED. SERVE YOUR LORD. PURGE THE PRIMITIVES INFESTING YOUR PLANET.</span></big>")
	H.update_eyes()
	return ..()

/mob/living/carbon/human/necron
	gender = MALE

/mob/living/carbon/human/necron/New(var/new_loc)
	h_style = "Bald"
	return ..()

/mob/living/carbon/human/necron/Initialize()
	. = ..()
	warfare_faction = NECRON
	src.rejuvenate()

