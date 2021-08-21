/*
Eldar
this shit is just the barebones of the race im going to add the verbs later
*/

/datum/species/eldar
    name = SPECIES_ELDAR
    name_plural = "Eldar"
    blurb = "The Eldar are an ancient race of elf-like humanoids. Once they dominated the galaxy but are currently a dying race. After the fall of the eldar they lost their main homeworlds and are currently scattered among the stars and webway in different factions and allegiences."
    unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)
    min_age = 20
    max_age = 1500
    default_language = LANGUAGE_ELDAR
    language = LANGUAGE_ELDAR
    name_language = LANGUAGE_ELDAR
    additional_langs = LANGUAGE_LOW_GOTHIC
    grab_type = GRAB_TAKEDOWN
    total_health = 300
    slowdown = -1.5
    gluttonous = GLUT_TINY
    sexybits_location = null