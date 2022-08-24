#define GOD_KHORNE "khorne"
#define GOD_NURGLE "nurgle"
#define GOD_SLAANESH "slaanesh"
#define GOD_TZEENTCH "tzeentch"

// Singleton.
/datum/heretic_deity
	var/name						// Gods name. Used for displaying to the player.
	var/list/possible_blessings 	// Contains both blessings and curses for simplicity sake.
	var/list/rune_recipes			// Runes that this cultist type can use
	var/list/members = list()
	var/join_message = "Debug Message."
	var/status_icon_state			// Displayed for fellow cultists.
	var/inherent_verbs				// List of verbs to be added when a cultist joins.
	var/faction						// Used for mobs
	var/rune_type

/mob/living/carbon/human/proc/draw_rune()
	set category = "IC"
	set name = "Draw Rune"
	if(do_after(src, 3 SECONDS))
		var/datum/heretic_deity/deity = GOD(mind.special_role)
		visible_message("[src] starts drawing a strange shape on the floor.")
		new deity.rune_type(get_turf(src))

/datum/heretic_deity/New()
	if(name)
		var/path = text2path("/datum/heretic_effect/[name]")
		possible_blessings = init_subtypes(path)
	return ..()

/*
Most blessings and curses should be permanent.
*/
/datum/heretic_deity/proc/add_effect(var/mob/living/Target, var/datum/heretic_effect/effect_type)
	SEND_SIGNAL(Target, COMSIG_CULT_ADD_EFFECT, effect_type)

/datum/heretic_deity/proc/remove_effect(var/mob/living/Target, var/datum/heretic_effect/effect_type)
	SEND_SIGNAL(Target, COMSIG_CULT_REMOVE_EFFECT, effect_type)

/datum/heretic_deity/proc/ascend(var/mob/living/Target) // Ascend someone to a daemon prince. Does nothing currently. Sprites.
	return FALSE

/datum/heretic_deity/proc/debug(var/mob/living/carbon/human/Target)
	for(var/datum/heretic_effect in possible_blessings)
		add_effect(Target, heretic_effect.type)

/datum/heretic_deity/proc/add_cultist(var/mob/living/carbon/human/NewMember)
	members |= NewMember
	NewMember.AddComponent(/datum/component/cultist, src.name)
	to_chat(NewMember, join_message)
	NewMember.verbs += inherent_verbs
	NewMember.AddInfectionImages()
	NewMember.faction = faction
	NewMember.mind.special_role = "[name]"
	SSgods.cultist_count += 1
	post_add(NewMember)

// Special stuff like statistics
/datum/heretic_deity/proc/post_add(var/mob/living/NewMember)
	return FALSE

/datum/heretic_deity/proc/remove_cultist(var/mob/living/carbon/human/RemovedMember)
	members -= RemovedMember
	var/datum/component/cultist/comp = RemovedMember.GetComponent(/datum/component/cultist)
	qdel(comp)
	RemovedMember.verbs -= inherent_verbs
	RemovedMember.mind.special_role = null
	RemovedMember.client.images.Cut()

/datum/heretic_deity/proc/progress(var/mob/living/CultMember, var/favor)
	var/datum/component/cultist/comp = CultMember.GetComponent(/datum/component/cultist)
	if(comp.deity_favor >= 25)
		if(comp.add_effect(src, pick(possible_blessings)))
			comp.deity_favor = 0

/datum/heretic_deity/proc/join_request(var/mob/living/user)
	var/choice = input(user, "Become [name] cultist?", "Choice") in list("Yes", "No")
	if(choice == "Yes" && !GODBYPLAYER(user))
		add_cultist(user)
