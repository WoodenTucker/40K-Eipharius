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
	set desc = "Heal injuries in exchange for taking toxin damage, and tiring yourself."
	if(staminaloss >= staminaexhaust / 2)
		return FALSE
	visible_message("[src]'s body covers its wounds with large puss-filled growths.")
	adjustOxyLoss(-10)
	adjustBruteLoss(-10)
	adjustToxLoss(30)
	adjustBrainLoss(-10)
	eye_blurry = 0
	ear_deaf = 0
	ear_damage = 0
	inject_blood(src, 50)
	adjustStaminaLoss(staminaexhaust / 2)
	for(var/obj/item/organ/external/temp in organs)
		temp.wounds.Cut()



