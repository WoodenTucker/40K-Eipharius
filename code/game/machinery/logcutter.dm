/obj/machinery/logcutter
	name = "Log-to-Plank Machine"
	icon = 'icons/obj/machines/logcutter.dmi'
	desc = "A machine that transforms logs into planks! Ensure you feed them one at a time!"
	icon_state = "lc_loaded"
	layer = BELOW_OBJ_LAYER
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 5
	active_power_usage = 10

/obj/machinery/logcutter/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/stack/logs))
		user.remove_from_mob(O)
		var/obj/item/stack/logs/S = O
		if (S.use(1))
			to_chat(user, "<span class='notice'>You turn some logs into planks.</span>")
			new /obj/item/stack/material/wood/ten(loc)
		qdel(O)

	return

//TODO make it give 10 per log