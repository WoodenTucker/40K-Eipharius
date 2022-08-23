/obj/structure/nganga
	name = "festering nganga"
	desc = "This bubbling cauldron smells of rot and seems to hiss as you approach. It seems alive in its own way."
	icon = 'icons/obj/nganga.dmi'
	item_state = "nganga"
	icon_state = "nganga"
	density = 1
	anchored = 0
	add_fingerprint(usr)
	add_fibers(usr)
	var/progress = 0
	var/list/steps = list(/obj/item/organ/external/arm/right,
						  /obj/item/organ/external/arm,
						  /obj/item/organ/external/leg,
						  /obj/item/organ/external/leg/right,
						  /obj/item/organ/external/head)

/obj/structure/nganga/attackby(var/obj/item/O, var/mob/living/carbon/human/user) //These manage feedings the nganga
	if (!istype(O))
		to_chat(user, "<span class='warning'>[O] is not what I asked for!</span>")
		return TRUE
	if(user.mind.special_role != GOD_NURGLE)
		return
	var/obj/item/i = user.get_active_hand()
	var/obj/item/organ/external/current_step = steps[progress]
	var/message = pick(list("<span class='warning'>Good! Now a [current_step.name]!</span>", "<span class='warning'>Now feed me a [current_step.name].</span>"))
	if(istype(i, current_step))
		progress += 1
		to_chat(user, message)
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
	else
		to_chat(user, "<span class='warning'>This is not what I asked for! Feed me a [current_step.name]!</span>")
	if(!length(steps))
		visible_message("<span class='warning'>The head of the beast sinks into the ichor causing a sudden froth. A mist rises from the nganga with a piercing howl!</span>")
		new /mob/living/simple_animal/hostile/abomination(get_turf(src))
		playsound(src, 'sound/effects/fornurgle.ogg', 80, 0, 4)
		user.STAT_LEVEL(str) += 3
		progress = 0
