
// Shove on anything that can be lockpicked. Overwrite attack_hand to check if the user is trying to lockpick. Send signal
/datum/component/lockpickable
	var/lock_complexity // 1 - 4 Basic, Normal, Hard, Complex
	var/busy = FALSE

/datum/component/lockpickable/Initialize(lock_complexity)
	src.lock_complexity = lock_complexity

/datum/component/lockpickable/RegisterWithParent()
	RegisterSignal(parent, COMSIG_LOCKPICK_START, .proc/try_lockpick)

/datum/component/lockpickable/proc/try_lockpick(atom/source, var/mob/living/carbon/human/user)
	if(busy)
		return
	var/worked = user.statscheck(user.STAT_LEVEL(dex), dicetype = "1d20", mod = lock_complexity)
	busy = TRUE
	if(do_after(user, 10 SECONDS) && worked == (SUCCESS || CRIT_SUCCESS))
		SEND_SIGNAL(parent, COMSIG_LOCKPICK_SUCCESS)
		to_chat(user, "<span class='notice'>You manage to lockpick the door.</span>")
		return
	to_chat(user, "<span class='warning>You fail to pick the lock.</span>")
	busy = FALSE

/obj/item/lockpick
	name = "lockpick"
	icon = 'icons/obj/items.dmi'
	icon_state = "lockpick"