/obj/machinery/computer/ertcogitator
	name = "emergency response team cogitator"
	desc = "Sends a signal to activate the teleportarium"
	icon = 'icons/obj/modular_console.dmi'
	icon_state = "console"
	anchored = 1
	density = 1
	atom_flags = ATOM_FLAG_CLIMBABLE

	var/inrange = 0
	var/moving = 0
	var/leaving = 0

/obj/machinery/computer/evaccogitator/Topic(href, href_list)
	if(..())
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["evac"])
		if (inrange)
			to_chat(usr, "The Teleportarium is already activated, Sir!")
			return
		else
			if (!inrange)
				escape()
				return


/obj/machinery/computer/ertcogitator/proc/ertdrop()
	to_chat(usr, "teleportarium coordinates locked in, Sir!.")
	if(!moving)
		spawn (0)
			moving = 1
			playsound(src.loc,'sound/effects/droppod.ogg',75,1)
			sleep(240)
			to_chat(usr, "Teleportarium charged Sir. Give the order and the cogitator will open a slipstream for your insertion.")
			inrange = 1	//Now in range
			moving = 0
			return

	else
		return



/obj/machinery/computer/evaccogitator/proc/insert()
	leaving = 1	//Are we already firing?
	sleep(6000)
	ticker.ERT_slipstream_insertion()
	return