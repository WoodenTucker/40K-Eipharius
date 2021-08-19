/obj/machinery/computer
	name = "computer"
	icon = 'icons/obj/computer.dmi'
	icon_state = "computer"
	density = 1
	anchored = 1.0
	use_power = 1
	idle_power_usage = 300
	active_power_usage = 300
	var/circuit = null //The path to the circuit board type. If circuit==null, the computer can't be disassembled.
	var/processing = 0

	var/icon_keyboard = "generic_key"
	var/icon_screen = "generic"
	var/light_range_on = 2
	var/light_power_on = 1
	var/overlay_layer
	atom_flags = ATOM_FLAG_CLIMBABLE
	clicksound = "keyboard"

/obj/machinery/computer/New()
	overlay_layer = layer
	..()

/obj/machinery/computer/Initialize()
	. = ..()
	power_change()
	update_icon()

/obj/machinery/computer/Process()
	if(stat & (NOPOWER|BROKEN))
		return 0
	return 1

/obj/machinery/computer/emp_act(severity)
	if(prob(20/severity)) set_broken()
	..()


/obj/machinery/computer/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(25))
				qdel(src)
				return
			if (prob(50))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		if(3.0)
			if (prob(25))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		else
	return

/obj/machinery/computer/bullet_act(var/obj/item/projectile/Proj)
	if(prob(Proj.get_structure_damage()))
		set_broken()
	..()

/obj/machinery/computer/update_icon()
	overlays.Cut()
	if(stat & NOPOWER)
		set_light(0)
		if(icon_keyboard)
			overlays += image(icon,"[icon_keyboard]_off", overlay_layer)
		return
	else
		set_light(light_range_on, light_power_on)

	if(stat & BROKEN)
		overlays += image(icon,"[icon_state]_broken", overlay_layer)
	else
		overlays += image(icon,icon_screen, overlay_layer)

	if(icon_keyboard)
		overlays += image(icon, icon_keyboard, overlay_layer)

/obj/machinery/computer/proc/set_broken()
	stat |= BROKEN
	update_icon()

/obj/machinery/computer/proc/decode(text)
	// Adds line breaks
	text = replacetext(text, "\n", "<BR>")
	return text

/obj/machinery/computer/attackby(I as obj, user as mob)
	if(isScrewdriver(I) && circuit)
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
		if(do_after(user, 20, src))
			var/obj/structure/computerframe/A = new /obj/structure/computerframe( src.loc )
			var/obj/item/circuitboard/M = new circuit( A )
			A.circuit = M
			A.anchored = 1
			for (var/obj/C in src)
				C.dropInto(loc)
			if (src.stat & BROKEN)
				to_chat(user, "<span class='notice'>The broken glass falls out.</span>")
				new /obj/item/material/shard( src.loc )
				A.state = 3
				A.icon_state = "3"
			else
				to_chat(user, "<span class='notice'>You disconnect the monitor.</span>")
				A.state = 4
				A.icon_state = "4"
			M.deconstruct(src)
			qdel(src)
	else
		..()

/obj/machinery/computer/attack_ghost(var/mob/ghost)
	attack_hand(ghost)



/obj/machinery/computer/exterminatus   //this is a computer that can reset the round. That game physically ends when the antag clicks 'exterminatus'
	name = "Weapons"
	desc = "This terminal acts as the nerve center for the Simiel's weapon systems."
	icon_state = "ob1"
	icon = 'icons/obj/machines/Orbitalcomand.dmi'
	density = 1
	anchored = 1
	var/inrange = 0	//Are we even in range?
	var/firing = 0	//Are we already firing?
	var/moving = 0

/obj/machinery/computer/exterminatus/attack_hand(mob/living/carbon/human/user as mob)	//Starting menu
	var/extermdelay = 0 //in deciseconds (35 min rn or 21000 deciseconds)
	if(user.inquisitor == 0)
		visible_message("DNA authorization failed!")
		return
	if(world.time < extermdelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		visible_message("It is too early to give up on this world! This will open when round duration reaches 0:35!")
		return
	user.set_machine(src)
	var/dat = "<B>Marinaeque Testudinis Weapons Array:</B><BR>"
	if (inrange)
		dat += "Locked on to target, Sector 9<BR>"
	if (!inrange)
		dat += "Holding position in system<BR>"
	if (firing)
		dat += "Firing Cyclonic Torpedo<BR>"
	if (!firing)
		dat += "4 Cyclonic Torpedos armed<BR>"
	dat += "<B>Weapons Online</B><BR>"
	dat += "<A href='byond://?src=\ref[src];range=1'>Move into low orbit.</A><BR>"
	dat += "<A href='byond://?src=\ref[src];fire=1'>Exterminatus</A><BR>"
	dat += "The will of the Emperor comes before all else. <br>May he have mercy upon their souls.<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return

/obj/machinery/computer/exterminatus/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/computer/exterminatus/Topic(href, href_list)
	if(..())
		return
	if(get_dist(src, usr) > 2)
		to_chat(usr, "You need to be at the computer to fire!")
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["fire"])
		if (firing)
			to_chat(usr, "\red The Black Ship Marinaeque Testudinis is already firing." )
			return

		if (!inrange)
			to_chat(usr, "\red The Black Ship Marinaeque Testudinis is not yet in range.")
			return

		else
			exterminatus()
			return

	if (href_list["range"])
		if (firing)
			to_chat(usr, "\red The Black Ship Marinaeque Testudinis is already firing!")
			return
		if (inrange)
			to_chat(usr, "\red The Black Ship Marinaeque Testudinis is already in range!")
			return
		else
			if (!inrange)
				move()
				return

/obj/machinery/computer/exterminatus/proc/exterminatus()
	firing = 1	//Are we already firing?

	ticker.station_heretics_cinematic()
	return

/obj/machinery/computer/exterminatus/proc/move()
	to_chat(usr, "\red Stargazer moving into position.")
	if(!moving)
		spawn (0)
			moving = 1
			playsound(src.loc,'sound/effects/droppod.ogg',75,1)
			sleep(240)
			to_world("As you peer into the sky, a dreaded chill runs down your spine. For you thought that the utter monstrosity you are having the misfortune of gazing upon was legend, not reality.. A Black Ship of the Ordo Hereticus coldly stares back at you. Pray to your god, or gods, for there is no escaping the Emperor's Wrath...")
			inrange = 1	//Now in range
			moving = 0
			return

	else
		return








/*
Decoration
*/

/obj/structure/exterminatus
	name = "Systems"
	icon = 'icons/obj/machines/artillery.dmi'
	anchored = 1
	density = 1


/atom/proc/attack_paw(mob/user as mob)
	return