// TODO: "Cursed" items, with special abilities and attributes. Currently used for items that increase favor with certain gods.
/datum/component/heretic_item
	var/name
	var/deity

/datum/component/heretic_item/favor
	var/favor_amt

/datum/component/heretic_item/favor/eaten

/datum/component/heretic_item/favor/eaten/Initialize(deity, favor_amt)
	src.favor_amt = favor_amt
	src.deity = deity
	return ..()

/datum/component/heretic_item/favor/proc/pre_check(var/mob/living/carbon/human/user)
	var/datum/heretic_deity/diety = GODBYPLAYER(user)
	if(diety && diety.name != src.deity)
		return FALSE
	return TRUE

/datum/component/heretic_item/favor/eaten/RegisterWithParent()
	RegisterSignal(parent, COMSIG_FOOD_EATEN, .proc/on_eaten)

/datum/component/heretic_item/favor/eaten/proc/on_eaten(atom/source, var/mob/living/carbon/human/user)
	if(pre_check(user))
		SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, favor_amt)

/datum/component/heretic_item/favor/used/RegisterWithParent()
	RegisterSignal(parent, COMSIG_FOOD_EATEN, .proc/on_used)

/datum/component/heretic_item/favor/used/proc/on_used(atom/source, var/mob/living/carbon/human/user)
	if(pre_check(user))
		SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, favor_amt)