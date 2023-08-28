/datum/species/skaven
    name = SPECIES_RAT
    name_plural = "Skaven"
    secondary_langs = list(LANGUAGE_TAU)
    name_language = null // Use the first-name last-name generator rather than a language scrambler
    icobase = 'icons/mob/human_races/r_def_smeltrat.dmi'
    deform = 'icons/mob/human_races/r_def_smeltrat.dmi'
    damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
    blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
    min_age = 18
    max_age = 50
    gluttonous = GLUT_ANYTHING
    total_health = 135
    mob_size = MOB_MEDIUM
    strength = STR_MEDIUM
    sexybits_location = BP_GROIN
    base_auras = list(
		/obj/aura/regenerating/human/rat
		)
    inherent_verbs = list(

        )
    unarmed_types = list(
        /datum/unarmed_attack/kick,
        /datum/unarmed_attack/punch,
        /datum/unarmed_attack/bite,
        )
    darksight = 100
