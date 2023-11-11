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
		var/obj/item/stack/logs/S = O
		if (S)
			S.amount -=1
			to_chat(user, "<span class='notice'>You turn some logs into planks.</span>")
			new /obj/item/stack/material/wood/ten(loc)
			S.update_icon()

/obj/machinery/gannets
	name = "Transmission Station"
	icon = 'icons/obj/machines/randomstuff.dmi'
	desc = "This machine receives and transmits coded data transmissions."
	icon_state = "gannetsoff"
	layer = BELOW_OBJ_LAYER
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 1
	active_power_usage = 2