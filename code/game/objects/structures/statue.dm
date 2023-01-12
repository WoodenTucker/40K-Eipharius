/obj/structure/statue
	name = "Stone Statue"
	desc = "A carved stone depecting a person, place or thing that held some importance to the maker. Also tell an admin you see this"
	anchored = 1
	density = 1
	layer = 4


/obj/structure/statue/proc/rotate()
	set name = "Rotate statue Counter-Clockwise"
	set category = "Object"
	set src in oview(1)

	if(usr.incapacitated())
		return 0

	if(anchored)
		usr << "It is fastened to the floor therefore you can't rotate it!"
		return 0

	set_dir(turn(dir, 90))
	update_icon()
	return

/obj/structure/statue/verb/revrotate()
	set name = "Rotate Statue Clockwise"
	set category = "Object"
	set src in oview(1)

	if(usr.incapacitated())
		return 0

	if(anchored)
		usr << "It is fastened to the floor therefore you can't rotate it!"
		return 0

	set_dir(turn(dir, -90))
	update_icon()
	return


/obj/structure/statue/verina
	name = "statue"
	desc = "A statue of some ominous looking, robed, figure. There's barely a scratch on it."
	icon = 'icons/obj/64x64.dmi'
	icon_state = "statue"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 32
	bound_width = 64

/obj/structure/statue/verina/broken
	name = "broken statue"
	desc = "A statue of some ominous looking, robed, figure. It's badly damaged."
	icon_state = "statue_broken"


/obj/structure/statue/aquilla
	name = "aquila altar"
	desc = "A glorious Nuln wood altar displaying a golden Aquila."
	icon = 'icons/obj/structures/aquilla.dmi'
	icon_state = "aquilla"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/bigstatue
	name = "big statue"
	desc = "A strange object of stone and malice."
	icon = 'icons/obj/structures/bigstatues.dmi'
	icon_state = "statue_b"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/bigstatue2
	name = "big statue"
	desc = "A strange object of stone and malice."
	icon = 'icons/obj/structures/bigstatues.dmi'
	icon_state = "statue_j"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/bigstatue3
	name = "big statue"
	desc = "A strange object of stone and malice."
	icon = 'icons/obj/structures/bigstatues.dmi'
	icon_state = "statue_rahl"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/prayer
	name = "prayer statue"
	desc = "A strange prayer statue."
	icon = 'icons/obj/structures/prayer.dmi'
	icon_state = "prophet_prayer"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/fountain
	name = "fountain"
	desc = "A glorious stone fountain."
	icon = 'icons/obj/structures/fountain.dmi'
	icon_state = "dark_fountain"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/fountainwater
	name = "fountain water"
	desc = "A glorious stone fountain."
	icon = 'icons/obj/structures/fountain.dmi'
	icon_state = "water"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64

/obj/structure/statue/column
	name = "column"
	desc = "A column carved from stone."
	icon = 'icons/obj/structures/mining.dmi'
	icon_state = "column2"
	anchored = 1
	density = 1
	layer = 4

/obj/structure/statue/column3
	name = "column"
	desc = "A column carved from stone."
	icon = 'icons/obj/structures/mining.dmi'
	icon_state = "column3"
	anchored = 1
	density = 1
	layer = 4

/obj/structure/statue/xenotube
	name = "xeno containment tube"
	desc = "An Inquisition containment tube housing some sort of horrific xenos for study."
	icon = 'icons/obj/structures/xenotube.dmi'
	icon_state = "THEYTUBER1"
	anchored = 1
	density = 1
	layer = 4

/obj/structure/statue/xenotube/l1
	icon = 'icons/obj/structures/xenotube.dmi'
	icon_state = "THEYTUBEL1"

/obj/structure/statue/xenotube/r2
	icon = 'icons/obj/structures/xenotube.dmi'
	icon_state = "THEYTUBER2"

/obj/structure/statue/xenotube/l2
	icon = 'icons/obj/structures/xenotube.dmi'
	icon_state = "THEYTUBEL2"


/obj/structure/statue/cage
	name = "hanging cage"
	desc = "A hanging cage used to torment heretics."
	icon = 'icons/obj/structures/cage.dmi'
	icon_state = "cage"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 32

/obj/structure/statue/gallows
	name = "gallows"
	desc = "Where filth is disposed of."
	icon = 'icons/obj/structures/gallows2.dmi'
	icon_state = "gallows"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 32

/obj/structure/statue/guardshrine
	name = "\improper shrine of the unknown guardsmen"
	desc = "A shrine commemorating the untold millions who lay down their lives everyday for the Imperium."
	icon = 'icons/obj/64x64.dmi'
	icon_state = "statue_guardsmen"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 64
	bound_width = 64



/obj/structure/statue/guardshrine/attackby(obj/item/W as obj, mob/user as mob)

	if(istype(W, /obj/item/wrench))
		user.visible_message(anchored ? "<span class='notice'>\The [user] loosens bolts on \the [src].</span" :
		"<span class='notice'>\the [user] tightens bolts on \the [src].<span>")
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 10, src))
			user << (anchored ? "<span class='notice'>You have unfastened \the [src] from the floor.</span" :
			"<span class='notice'>You have fastened \the [src] to the floor.<span>")
			anchored = !anchored
			update_icon()
			return
