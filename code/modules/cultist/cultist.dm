/datum/component/cultist
	var/datum/heretic_deity/deity
	var/deity_favor
	var/last_goal
	var/list/active_effects = list()

/datum/component/cultist/Destroy()
	deity = null
	QDEL_NULL_LIST(active_effects)
	return ..()

/datum/component/cultist/Initialize(var/deity_name)
	deity = GOD(deity_name)
	return ..()


// Signals are cleaned up by parent destroy proc.
/datum/component/cultist/RegisterWithParent()
	RegisterSignal(parent, COMSIG_CULT_ADD_EFFECT, .proc/add_effect)
	RegisterSignal(parent, COMSIG_CULT_REMOVE_EFFECT, .proc/remove_effect)
	RegisterSignal(parent, COMSIG_CULT_ADD_FAVOR, .proc/increase_favor)
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, .proc/on_examine)

/datum/component/cultist/proc/add_effect(datum/source, var/datum/heretic_effect/effect_type)
	for(var/datum/heretic_effect/effect in active_effects)
		if(istype(effect, effect_type) && effect.unique)
			SEND_SIGNAL(parent, COMSIG_CULT_EFFECT_ADD_FAILED)
			return FALSE
	var/datum/heretic_effect/effect = new effect_type
	active_effects |= effect
	effect.add_effect(parent)
	SEND_SIGNAL(parent, COMSIG_CULT_EFFECT_ADDED)
	return TRUE

/datum/component/cultist/proc/remove_effect(datum/source, var/datum/heretic_effect/effect_type)
	for(var/datum/heretic_effect/effect in active_effects)
		if(effect.type == effect_type)
			qdel(effect)
	return TRUE

/datum/component/cultist/proc/get_effect(var/datum/heretic_effect/effect_type)
	for(var/datum/heretic_effect/effect in active_effects)
		if(effect.type == effect_type)
			return effect
	return FALSE

/datum/component/cultist/proc/increase_favor(datum/source, var/amt)
	deity_favor += amt
	var/mob/living/carbon/human/H = parent
	H.add_event("morale boost", /datum/happiness_event/pleased_god)
	deity.progress(H, deity_favor)
	to_chat(parent, "<span class='notice'>I feel as if my bond with [deity.name] has strengthened: [deity_favor].</span>")

/datum/component/cultist/proc/on_examine(datum/source, var/mob/user, var/list/examine_list)
	for(var/datum/heretic_effect/effect in active_effects)
		if(effect.examine_message)
			examine_list += effect.examine_message