/*
Astartes
*/

/datum/species/human/astartes
	name = SPECIES_ASTARTES
	name_plural = "Space Marines"
	primitive_form = SPECIES_HUMAN
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "The Space Marines or Adeptus Astartes are foremost amongst the defenders of Humanity, the greatest of the Emperor of Mankind's Warriors. They are barely human at all, but superhuman; having been made superior in all respects to a normal man by a harsh regime of genetic modification, psycho-conditioning and rigorous training. Untouched by disease and can take a wound that could kill a normal human instantly. Using ancient power armor that can augment their abilities and wielding the best weapons known to man."
	num_alternate_languages = 2
	secondary_langs = list(LANGUAGE_SOL_COMMON)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 25
	max_age = 500
	gluttonous = GLUT_TINY
	total_health = 500
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR
	mob_size = MOB_LARGE
	strength = STR_VHIGH
	genders = MALE
	cold_level_1 = 150                           // Cold damage level 1 below this point. -30 Celsium degrees
	cold_level_2 = 120                            // Cold damage level 2 below this point.
	cold_level_3 = 100                            // Cold damage level 3 below this point.
	heat_level_1 = 450                            // Heat damage level 1 above this point.
	heat_level_2 = 600                            // Heat damage level 2 above this point.
	heat_level_3 = 1000
	teeth_type = /obj/item/stack/teeth/human //Teeth
	sexybits_location = BP_GROIN
	pass_flags = PASS_FLAG_TABLE
	holder_type = /obj/item/holder
	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/no_eyes),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

/datum/species/human/astartes/get_bodytype(var/mob/living/carbon/human/astartes/H)
	return SPECIES_ASTARTES


/datum/species/human/astartes/get_random_name()
	return "[lowertext(name)] [("Brother")]"