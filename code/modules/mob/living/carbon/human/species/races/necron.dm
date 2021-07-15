/datum/species/human/necron
	name = "memecron"
	name_plural = "metal boners"
	primitive_form = SPECIES_HUMAN
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "The Space Marines or Adeptus Astartes are foremost amongst the defenders of Humanity, the greatest of the Emperor of Mankind's Warriors. They are barely human at all, but superhuman; having been made superior in all respects to a normal man by a harsh regime of genetic modification, psycho-conditioning and rigorous training. Untouched by disease and can take a wound that could kill a normal human instantly. Using ancient power armor that can augment their abilities and wielding the best weapons known to man."
	min_age = 250
	max_age = 5000
	icobase = 'icons/mob/human_races/Tallcron.dmi'
	deform = 'icons/mob/human_races/Tallcron.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 500
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_A_SKIN_TONE
	mob_size = MOB_LARGE
	strength = STR_VHIGH
	genders = MALE
	teeth_type = /obj/item/stack/teeth/human //Teeth
	sexybits_location = BP_GROIN
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_EMBED|SPECIES_FLAG_NO_SCAN
	inherent_verbs = list()

	burn_mod = 0.3
	brute_mod = 0.3
	radiation_mod = 0

	icon_template = 'icons/mob/human_races/Tallcron.dmi'

/datum/species/human/necron/taller
	name = "tall memecron"
	icon_template = 'icons/mob/human_races/Tallercron.dmi'
	icobase = 'icons/mob/human_races/Tallercron.dmi'
	deform = 'icons/mob/human_races/Tallercron.dmi'

/datum/species/human/necron/wide
	name = "Supreme memecron"
	icon_template = 'icons/mob/human_races/Widecron.dmi'
	pixel_offset_x = -32
	icobase = 'icons/mob/human_races/Widecron.dmi'
	deform = 'icons/mob/human_races/Widecron.dmi'