/*
Eldar
this shit is just the barebones of the race im going to add the verbs later
*/

/datum/species/eldar
    name = SPECIES_ELDAR
    default_language = LANGUAGE_ELDAR
    language = LANGUAGE_ELDAR
    name_language = LANGUAGE_ELDAR
    icobase = 'icons/mob/human_races/r_def_eldar.dmi'
    deform = 'icons/mob/human_races/r_def_eldar.dmi'
    damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
    blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
    additional_langs = LANGUAGE_LOW_GOTHIC
    grab_type = GRAB_TAKEDOWN
    total_health = 250
    slowdown = -0.25
    gluttonous = GLUT_TINY
    sexybits_location = BP_GROIN
/datum/species/eldar/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//eldar don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>Your a mercenary hired by the Lord Trader. Obey whatever instructions they have.</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
/mob/living/carbon/human
	var/new_eldar = SPECIES_ELDAR

/mob/living/carbon/human/eldar/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_eldar)

/mob/living/carbon/human/eldar
	gender = MALE
	var/isempty = 0
	var/iseating = 0

/mob/living/carbon/human/eldar/Initialize()
	. = ..()
	fully_replace_character_name(random_eldar_name(src.gender))
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/corsair)
	outfit.equip(src)

	hand = 0//Make sure one of their hands is active.
	put_in_hands(new /obj/item/gun/projectile/eldar/scatapult)//Give them a weapon.
	isburied = 1
