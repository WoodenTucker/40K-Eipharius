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
    inherent_verbs = list(/mob/living/carbon/human/eldar/proc/stealth)
    default_language = LANGUAGE_ELDAR
    language = LANGUAGE_ELDAR
    name_language = LANGUAGE_ELDAR
    additional_langs = LANGUAGE_GOTHIC
    grab_type = GRAB_TAKEDOWN
    total_health = 300
    slowdown = -1.5
    gluttonous = GLUT_TINY
    sexybits_location = null

/mob/living/carbon/human/eldar/proc/stealth()
    set category = "Eldar"
    set name = "Stealth"
    set desc = "Using high-tech projectors in your body you can become invisible to the naked eye."
    if(stealth)
        cancelstealth()
        to_chat(src, "<span class='notice'>You turn off the projectors.</span>")
        return

    if(scooldown)
        to_chat(src, "<span class='warning'>This ability is in cooldown!</span>")
        return

    to_chat(src, "<span class='notice'>You turn on the projectors, you become invisible.</span>")
    var/mob/living/carbon/human/eldar/C = src
    C.invisibility = INVISIBILITY_LEVEL_TWO
    C.stealth = TRUE
    C.scooldown = TRUE
    var/atom/movable/overlay/animation = new /atom/movable/overlay( C.loc )
    animation.icon_state = "blank"
    animation.icon = 'icons/mob/mob.dmi'
    animation.master = src
    flick("cloak", animation)
    spawn(200)
        cancelstealth()
        to_chat(src, "<span class='danger'>Your projectors have reached their limit! Projectors failing!</span>")

/mob/living/carbon/human/eldar/proc/cancelstealth()
    var/mob/living/carbon/human/C = src
    C.invisibility = 0
    C.stealth = FALSE
    var/atom/movable/overlay/animation = new /atom/movable/overlay( C.loc )
    animation.icon_state = "blank"
    animation.icon = 'icons/mob/mob.dmi'
    animation.master = src
    flick("uncloak", animation)
    spawn(100) 
        C.scooldown = FALSE
