#define GOD_KHORNE "khorne"
#define GOD_NURGLE "nurgle"
#define GOD_SLAANESH "slaanesh"
#define GOD_TZEENTCH "tzeentch"
#define GOD_HIVEMIND "hivemind"

// Singleton.
/datum/heretic_deity
	var/name						// Gods name. Used for displaying to the player.
	var/list/possible_blessings 	// Contains both blessings and curses for simplicity sake.
	var/list/rune_recipes			// Runes that this cultist type can use
	var/list/members = list()
	var/join_message = "<span class = 'badmood'> * You have successfully started as a Chaos Cultist. Rebel with your fellow cultists in a civil war! * </span> "
	var/status_icon_state			// Displayed for fellow cultists.
	var/inherent_verbs				// List of verbs to be added when a cultist joins.
	var/faction						// Used for mobs
	var/rune_type

/mob/living/carbon/human/proc/draw_rune()
	set category = "Ruinous Powers"
	set name = "Draw Rune"
	if(isdrawing == 0)
		isdrawing = 1
		visible_message("[src] starts drawing a strange shape on the floor.")
		if(do_after(src, 3 SECONDS))
			var/datum/heretic_deity/deity = GOD(mind.special_role)
			new deity.rune_type(get_turf(src))
			isdrawing = 0
		else
			isdrawing = 0

/mob/living/carbon/human/proc/getmanualnurgle()
	set name = "Produce Chaos Tome"
	set category = "Ruinous Powers"
	set desc = "Gives Nurgle manual."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] takes out a foul smelling tome from inside their clothes.")
	src.verbs -= /mob/living/carbon/human/proc/getmanualnurgle
	src.put_in_hands(new /obj/item/book/manual/nurgle_recipes, slot_r_hand)

/mob/living/carbon/human/proc/getmanualkhorne()
	set name = "Produce Chaos Tome"
	set category = "Ruinous Powers"
	set desc = "Gives Khorne manual."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] takes out a bloody tome from inside their clothes.")
	src.verbs -= /mob/living/carbon/human/proc/getmanualkhorne
	src.put_in_hands(new /obj/item/book/manual/khorne_recipes, slot_r_hand)

/mob/living/carbon/human/proc/getmanualtzeentch()
	set name = "Produce Chaos Tome"
	set category = "Ruinous Powers"
	set desc = "Gives Tzeentch manual."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] takes out a shifting tome from inside their clothes.")
	src.verbs -= /mob/living/carbon/human/proc/getmanualtzeentch
	src.put_in_hands(new /obj/item/book/manual/tzeentch_recipes, slot_r_hand)

/mob/living/carbon/human/proc/getmanualslaanesh()
	set name = "Produce Chaos Tome"
	set category = "Ruinous Powers"
	set desc = "Gives Slaanesh manual."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] takes out a sensual tome from inside their clothes.")
	src.verbs -= /mob/living/carbon/human/proc/getmanualslaanesh
	src.put_in_hands(new /obj/item/book/manual/slaanesh_recipes, slot_r_hand)
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
	NewMember.faction = "Chaos"
	NewMember.mind.special_role = "[name]"
	SSgods.cultist_count += 1
	post_add(NewMember)

// Special stuff like statistics
/datum/heretic_deity/proc/post_add(var/mob/living/NewMember)
	return FALSE

/datum/heretic_deity/proc/remove_cultist(var/mob/living/carbon/human/RemovedMember)
	members -= RemovedMember
	qdel(RemovedMember.GetComponent(/datum/component/cultist))
	RemovedMember.verbs -= inherent_verbs
	RemovedMember.mind.special_role = null
	RemovedMember.client.images.Cut()
	RemovedMember.mind.special_role = ""
	SSgods.cultist_count -= 1

/datum/heretic_deity/proc/progress(var/mob/living/carbon/human/CultMember, var/favor)
	if(favor >= 40 && favor <= 59)
		RegisterSignal(CultMember, COMSIG_CULT_EFFECT_ADDED, .proc/on_progress)
		RegisterSignal(CultMember, COMSIG_CULT_EFFECT_ADD_FAILED, .proc/progress_failed)
		SEND_SIGNAL(CultMember, COMSIG_CULT_ADD_EFFECT, pick(possible_blessings))
	if(favor >= 60 && favor <= 99)
		message_admins("[usr.key] [usr.name] has reached Favor 60 || Strong Cultist")
	if(favor >= 100 && favor <= 139)
		message_admins("[usr.key] [usr.name] has reached Favor 100 || Master Cultist")
		//message_admins("[usr.key] [usr.name] has reached Favor 100 || Master Cultist") //Why are these listed multiple times?
		SEND_SIGNAL(CultMember, COMSIG_CULT_ADD_EFFECT, pick(possible_blessings))
	if(favor >= 140)
		message_admins("[usr.key] [usr.name] has reached Favor 140 || Legendary Cultist")
		//message_admins("[usr.key] [usr.name] has reached Favor 140 || Legendary Cultist")
		//message_admins("[usr.key] [usr.name] has reached Favor 140 || Legendary Cultist")
		SEND_SIGNAL(CultMember, COMSIG_CULT_ADD_EFFECT, pick(possible_blessings))


/datum/heretic_deity/proc/on_progress(atom/source, var/mob/living/CultMember, var/favor)
	UnregisterSignal(CultMember, COMSIG_CULT_EFFECT_ADD_FAILED)
	UnregisterSignal(CultMember, COMSIG_CULT_EFFECT_ADDED)

/datum/heretic_deity/proc/progress_failed(atom/source, var/mob/living/CultMember, var/favor)
	UnregisterSignal(CultMember, COMSIG_CULT_EFFECT_ADD_FAILED)
	UnregisterSignal(CultMember, COMSIG_CULT_EFFECT_ADDED)

/datum/heretic_deity/proc/join_request(var/mob/living/carbon/human/user)
	if(GODBYPLAYER(user))
		return
	var/choice = input(user, "Become [name] cultist?", "Choice") in list("Yes", "No")
	if(choice == "Yes")
		add_cultist(user)

/datum/heretic_deity/proc/join_forced(var/mob/living/carbon/human/user)
	if(GODBYPLAYER(user))
		return
	var/choice = input(user, "You now serve [name]!", "Choice") in list("Praise the God!")
	if(choice == "Praise the God!")
		add_cultist(user)
