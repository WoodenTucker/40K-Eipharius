#define GOD(god_name) SSgods.get_god_by_name(god_name)
#define GODBYPLAYER(user) SSgods.get_player_god_by_name(user)

SUBSYSTEM_DEF(gods)
	name = "Gods"
	flags = SS_NO_FIRE

	var/list/gods = list()
	var/list/rune_recipes = list()
	var/cultist_count = 0

/datum/controller/subsystem/gods/Initialize(start_timeofday)
	gods = init_subtypes(/datum/heretic_deity)
	rune_recipes = init_subtypes(/datum/rune_recipe)
	return ..()

/datum/controller/subsystem/gods/proc/get_god_by_name(var/god_name)
	for(var/datum/heretic_deity/deity in gods)
		if(deity.name == god_name)
			return deity

/datum/controller/subsystem/gods/proc/get_player_god_by_name(var/mob/living/carbon/human/user)
	for(var/datum/heretic_deity/deity in gods)
		if(user in deity.members)
			return deity
	return FALSE
