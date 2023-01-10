//////////////////////////////////evac portal////////////////
//Witness the most hacky thing in ss13 history and see the 0 fucks I give//
//////////////////////////////////////////////////////////////////////////
/obj/machinery/computer/evaccogitator
	name = "evacuation cogitator"
	desc = "Sends a signal to your main ship in orbit that it is TIME TO GO!"
	icon = 'icons/obj/modular_console.dmi'
	icon_state = "console"
	anchored = 1
	density = 1
	atom_flags = ATOM_FLAG_CLIMBABLE

	var/locked = 1
	var/inrange = 0
	var/moving = 0
	var/leaving = 0

//lets make it locked...
/obj/machinery/computer/evaccogitator/RightClick(mob/living/user)
	if(!CanPhysicallyInteract(user))
		return
	var/obj/item/card/id/gold/S = user.get_active_hand()
	if(!istype(S))
		return
	var/escapedelay = 21000 //in deciseconds (35 min rn or 21000 deciseconds)

	if(world.time < escapedelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		visible_message("It is too early to give up on this world! This will open when round duration reaches 0:35!")
		return
	if(locked == 1)
		locked = 0
		visible_message("[usr] unlocks the console!")
	else
		locked = 1
		visible_message("[usr] locks the console!")

/obj/machinery/computer/evaccogitator/attack_hand(mob/user as mob)	//Starting menu
	if(locked == 1)
		visible_message("The console is locked, present your Governor ID!")
		return
	user.set_machine(src)
	var/dat = "<B>Slipstream Escape:</B><BR>"
	dat += "<B>Orders:</B></BR>"
	dat += "<A href='byond://?src=\ref[src];evac=1'>Signal for evacuation</A><BR>"
	dat += "<A href='byond://?src=\ref[src];leave=1'>Open the slipstream and escape! (Requires you to send a signal first!)</A><BR>"
	dat += "Your orders, Lord-Trader?<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return

/obj/machinery/computer/evaccogitator/Topic(href, href_list)
	if(..())
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["evac"])
		if (inrange)
			to_chat(usr, "The Spaceport is already above the outpost, Lord!")
			return
		else
			if (!inrange)
				escape()
				return
	if (href_list["leave"])
		if (!inrange)
			to_chat(usr, "The Spaceport is not in position yet, my Lord!")
			return
		if(leaving)
			to_chat(usr, "We are already leaving, Lord!")
			return
		else
			to_world("<span class='warning'><font size='4'>The foul taste of psyker magicks fills your mouth. Over a loud speaker you hear the call for evacuation. In ten minutes the ships will depart for the Messina Spaceport!</span></font>")
			leaving()
			sleep(3000)
			to_world("<span class='warning'><font size='4'>Only five minutes remain, the first hints of a crackling portal are beginning to form at the escape platform!</span></font>")
			return


/obj/machinery/computer/evaccogitator/proc/escape()
	to_chat(usr, "Navigator and Psykers are being stirred, my Lord.")
	if(!moving)
		spawn (0)
			moving = 1
			playsound(src.loc,'sound/effects/droppod.ogg',75,1)
			sleep(240)
			to_world("<span class='warning'><font size='4'>The massive hulk of the Space Port appears above the outpost. Warning sirens blare as vessels prepare to disembark from the planet, unlikely to return again for many terran decades.</span></font>")
			to_chat(usr, "We are in position lord. Give the order and our psykers will begin to open a slipstream for your evacuation.")
			inrange = 1	//Now in range
			moving = 0
			return

	else
		return

/obj/machinery/computer/evaccogitator/proc/leaving()
	leaving = 1	//Are we already firing?
	sleep(6000)
	to_world("<span class='warning'><font size='4'>They've done it! The slipstream is open! Escape through quickly, it won't remain open for long!</span></font>")
	ticker.station_slipstream_escape()
	return