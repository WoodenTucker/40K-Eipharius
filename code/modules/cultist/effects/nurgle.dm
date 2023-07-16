/datum/heretic_effect/painless
	name = "Pain Immunity"
	add_message = "<span class='notice'>You feel your body mutate further. The pain that comes with the Grandfather's blessings has faded. Replaced only with the desire to share this peace.</span>"
	unique = TRUE

/datum/heretic_effect/painless/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.species_flags += SPECIES_FLAG_NO_PAIN

/datum/heretic_effect/painless/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.species_flags -= SPECIES_FLAG_NO_PAIN

/datum/heretic_effect/deathtolerant
	name = "Death Tolerance"
	add_message = "<span class='notice'>Stenches and death are a sign of a functional cycle of rebirth. They no longer affect me.</span>"
	unique = TRUE

/datum/heretic_effect/deathtolerant/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.set_trait(new/datum/trait/death_tolerant)
	user.nogross = TRUE

/datum/heretic_effect/tough
	name = "Tough"
	unique = TRUE

/datum/heretic_effect/tough/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(end) += 4

/datum/heretic_effect/tough/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.STAT_LEVEL(end) -= 4


// Makes nurgle cultists more durable. Visible change so rather powerful. Maybe?
/datum/heretic_effect/zombie
	name = "Resurrection"
	unique = TRUE
	add_message = "<span class='notice'>You feel your body begin to rot before your eyes.</span>"

/datum/heretic_effect/zombie/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	for(var/obj/item/organ/org in user.internal_organs)
		org.vital = FALSE
		org.robotic = ORGAN_ROBOT
	var/obj/item/organ/internal/heart/hrt = locate() in user.internal_organs
	hrt.pulse = PULSE_NONE
	hrt.max_damage = -1
	user.decaylevel = 2

/datum/heretic_effect/heal
	name = "Heal"
	unique = TRUE

/datum/heretic_effect/heal/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.verbs |= /mob/living/carbon/human/proc/nurgle_heal

/datum/heretic_effect/heal/remove_effect(var/mob/living/carbon/human/user)
	user.verbs -= /mob/living/carbon/human/proc/nurgle_heal

/mob/living/carbon/human/proc/nurgle_heal()
	set category = "Ruinous Powers"
	set name = "Heal (20)"
	set desc = "Heal injuries in exchange for tiring yourself."
	
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	if(staminaloss >= staminaexhaust / 2)
		return FALSE
	if(src.quote_cd == 0)
		visible_message("[src]'s body covers their wounds with large pus-filled growths!")
		src.quote_cd = 1
		sleep(20)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot do that yet.")
		return
	adjustOxyLoss(-2)
	adjustBruteLoss(-2)
	adjustFireLoss(-2)
	eye_blurry = 0
	ear_deaf = 0
	ear_damage = 0
	inject_blood(src, 50)
	for(var/obj/item/organ/external/temp in organs)
		temp.wounds.Cut()

/datum/heretic_effect/slow
	name = "Slow"
	add_message = "<span class='notice'>You feel slower.</span>"
	unique = TRUE

/datum/heretic_effect/slow/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.slowdown += 0.2

/datum/heretic_effect/slow/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.species.slowdown -= 0.2

