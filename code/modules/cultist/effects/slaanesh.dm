/datum/heretic_effect/enchantedarm
	name = "Enchanted Arm"
	unique = TRUE

/datum/heretic_effect/enchantedarm/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.verbs |= /mob/living/carbon/human/proc/slannyarm

/datum/heretic_effect/enchantedarm/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.verbs -= /mob/living/carbon/human/proc/slannyarm

/datum/heretic_effect/masochist
	name = "Masochist"
	unique = TRUE

/datum/heretic_effect/masochist/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	RegisterSignal(user, COMSIG_MOB_CARBON_DAMAGED, .proc/on_damaged)

/datum/heretic_effect/masochist/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	UnregisterSignal(user, COMSIG_MOB_CARBON_DAMAGED)

/datum/heretic_effect/masochist/proc/on_damaged(var/mob/living/carbon/human/source, var/damage, var/damage_type, var/def_zone)
	source.add_event("morale boost", /datum/happiness_event/masochism)
	source.apply_damage(-damage / 4, damage_type, def_zone)
	source.apply_damage(damage  / 4, PAIN, def_zone)

/datum/heretic_effect/escape_artist
	name = "Escape Artist"
	unique = TRUE

/datum/heretic_effect/escape_artist/add_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.verbs |= /mob/living/carbon/human/proc/escapecuffs

/datum/heretic_effect/escape_artist/remove_effect(var/mob/living/carbon/human/user)
	. = ..()
	user.verbs -= /mob/living/carbon/human/proc/escapecuffs

/mob/living/carbon/human/proc/escapecuffs()
	set category = "Ruinous Powers"
	set name = "Escape Bindings"

	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return

	else if(handcuffed)
		visible_message("[src] slips their bindings!")
		adjustStaminaLoss(75)
		handcuffed.forceMove(get_turf(src))
		handcuffed = null
		if(buckled && buckled.buckle_require_restraints)
			buckled.unbuckle_mob()
		update_inv_handcuffed()
		return