/obj/effect/dummy/illusion
	name = ""
	desc = ""
	density = 0
	anchored = 1
	var/move_delay = 0
	var/mob/living/carbon/human/master

/obj/effect/dummy/illusion/proc/activate(var/mob/M, new_icon, new_iconstate, new_overlays)
	icon = new_icon
	icon_state = new_iconstate
	overlays = new_overlays
	M.forceMove(src)
	master = M

/obj/effect/dummy/illusion/relaymove(var/mob/user, direction)
	if(world.time >= move_delay)
		move_delay = world.time + 5
		step(src, direction)

/obj/effect/dummy/illusion/Destroy()
	master.forceMove(get_turf(src))
	return ..()