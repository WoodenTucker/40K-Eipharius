/datum/species/bloodpact
	name = SPECIES_BLOODPACT
	name_plural = "Bloodpact"
	secondary_langs = list(LANGUAGE_DARKTONGUE)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_human.dmi'
	deform = 'icons/mob/human_races/r_def_human.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 16
	max_age = 200
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 200
	mob_size = MOB_MEDIUM
	strength = STR_MEDIUM
	sexybits_location = BP_GROIN

	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)

/datum/species/bloodpact/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(20,180)//Random age for kiddos.
	if(H.f_style)// shaved
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>Death to the Corpse Emperor. Ensure the Commander and Berzerker Chosen armor are donned. Follow their wearers in glorious battle upon the nearby planet of Eipharius. Work alongside your fellow Blood Pact warriors using the Dark Tongue. You may be Khornate, but you are extremely well disciplined. Harvest souls and sacrifice for the Blood God! </span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
/mob/living/carbon/human
	var/new_bloodpact = SPECIES_BLOODPACT

/mob/living/carbon/human/Bloodpact
	gender = MALE


/mob/living/carbon/human/Bloodpact/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_tau)
/mob/living/carbon/human/Bloodpact/Initialize()
	. = ..()
	fully_replace_character_name(random_eldar_name(src.gender))
	faction = "Bloodpact"
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/corsair)
	outfit.equip(src)

