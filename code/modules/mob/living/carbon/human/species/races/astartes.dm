/*
Astartes
*/

//adminspawning these in still doesn't work, need to be rejuvenated

/datum/species/human/astartes
	name = SPECIES_ASTARTES
	name_plural = "Astartes"
	primitive_form = SPECIES_HUMAN
	brute_mod =      0.5                    // 50% brute damage
	burn_mod =       0.5                  //  50% burn damage
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "The Space Marines or Adeptus Astartes are foremost amongst the defenders of Humanity, the greatest of the Emperor of Mankind's Warriors. They are barely human at all, but superhuman; having been made superior in all respects to a normal man by a harsh regime of genetic modification, psycho-conditioning and rigorous training. Untouched by disease and can take a wound that could kill a normal human instantly. Using ancient power armor that can augment their abilities and wielding the best weapons known to man."
	min_age = 100
	max_age = 5000
	icon_template = 'icons/mob/human_races/r_template_tall.dmi'
	icobase = 'icons/mob/human_races/r_astartes.dmi'
	deform = 'icons/mob/human_races/r_astartes.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	eye_icon_location = 'icons/mob/astartes_face.dmi'
	blood_volume = 700 // how much blood a retardes has
	slowdown = -0.25 //Increased move speed
	eye_icon = "eyes_s"
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 400 // a normal human has 200 brain health, retardes have 250 //P.S this is brain health
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_A_SKIN_TONE
	mob_size = MOB_LARGE
	strength = STR_VHIGH
	genders = list(MALE)
	teeth_type = /obj/item/stack/teeth/human //Teeth
	//sexybits_location = BP_GROIN //dude, they have no balls - they actually do, it's old myth since they have libido being put down to the rock bottom
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_MINOR_CUT
	inherent_verbs = list()

	radiation_mod = 0.3
//gives assfartes the astartes aura
	base_auras = list(
		/obj/aura/regenerating/human/astartes
		)

/datum/species/human/astartes/handle_post_spawn(var/mob/living/carbon/human/astartes/H)
	. = ..()
	H.age = rand(min_age,max_age)//asstardes ages are all over.
	to_chat(H, "<big><span class='warning'>You are one of His angels! Act like it!</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
//	H.rejuvenate()
//	H.job = "Astartes Envoy"
//	return ..()

///mob/living/carbon/human
//	var/new_astartes = SPECIES_ASTARTES

/mob/living/carbon/human/astartes
	gender = MALE

/mob/living/carbon/human/astartes/New(var/new_loc,var/new_astartes = SPECIES_ASTARTES)
	. = ..()
	src.rejuvenate()
	src.job = "Astartes Envoy"


/mob/living/carbon/human/astartes/Initialize()
	. = ..()
	src.rejuvenate()
