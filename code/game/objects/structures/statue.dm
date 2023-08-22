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
	plane = ABOVE_HUMAN_PLANE
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
	plane = ABOVE_HUMAN_PLANE
	bound_width = 64

/obj/structure/statue/bigstatue
	name = "big statue"
	desc = "A strange object of stone and malice."
	icon = 'icons/obj/structures/bigstatues.dmi'
	icon_state = "statue_b"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE
	bound_width = 64

/obj/structure/statue/bigstatue2
	name = "big statue"
	desc = "A strange object of stone and malice."
	icon = 'icons/obj/structures/bigstatues.dmi'
	icon_state = "statue_j"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE
	bound_width = 64

/obj/structure/statue/bigstatue3
	name = "big statue"
	desc = "A strange object of stone and malice."
	icon = 'icons/obj/structures/bigstatues.dmi'
	icon_state = "statue_rahl"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE
	bound_width = 64

/obj/structure/statue/prayer
	name = "prayer statue"
	desc = "A strange prayer statue."
	icon = 'icons/obj/structures/prayer.dmi'
	icon_state = "prophet_prayer"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE

/obj/structure/statue/fountain
	name = "fountain"
	desc = "A glorious stone fountain."
	icon = 'icons/obj/structures/fountain.dmi'
	icon_state = "dark_fountain"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE
	bound_width = 96

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
	icon_state = "xenotube"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE
	bound_width = 64

/obj/structure/statue/xenotube/off
	icon_state = "xenotube-off"

/obj/structure/statue/cage
	name = "hanging cage"
	desc = "A hanging cage used to torment heretics."
	icon = 'icons/obj/structures/cage.dmi'
	icon_state = "cage"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE

/obj/structure/statue/gallows
	name = "gallows"
	desc = "Where filth is disposed of."
	icon = 'icons/obj/structures/gallows2.dmi'
	icon_state = "gallows"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE

/obj/structure/statue/guardshrine
	name = "\improper shrine of the unknown guardsmen"
	desc = "A shrine commemorating the untold millions who lay down their lives everyday for the Imperium."
	icon = 'icons/obj/64x64.dmi'
	icon_state = "statue_guardsmen"
	anchored = 1
	density = 1
	layer = 4
	plane = ABOVE_HUMAN_PLANE
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

/obj/structure/hivedecor
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "angel_cool"
	anchored = 1
	density = 1

/obj/structure/hivedecor/oldclock
	name = "Old Clock"
	desc = "An old yet pristine pendulum clock, it's still working."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "pclock"

/obj/structure/hivedecor/bookcase
	name = "Bookcase"
	desc = "An small antique bookcase full of books The sheer amount makes you not want to even bother taking one."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "bookcase_small"

/obj/structure/hivedecor/bookcase/huge
	name = "Bookcase"
	desc = "An antique bookcase full of books The sheer amount makes you not want to even bother taking one."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "bookcase_huge"

/obj/structure/hivedecor/statue1
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "openhelmet_guy"

/obj/structure/hivedecor/statue2
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "creepy"

/obj/structure/hivedecor/statue3
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "AngelRight"

/obj/structure/hivedecor/statue4
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "AngelLeft"

/obj/structure/hivedecor/statue5
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "pilar1"

/obj/structure/hivedecor/statue6
	name = "Statue"
	desc = "A towering statue that just makes you feel more scared the more you gaze at it..Who the hell built these ?"
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "pilar2"

/obj/structure/hivedecor/statue7
	name = "Man statue"
	desc = "An statue of some sort of man."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "statue6"

/obj/structure/hivedecor/statue8
	name = "Angel Statue"
	desc = "A statue of an angel holding a large sword."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "angel2"

/obj/structure/hivedecor/sarcofagus
	name = "Old sarcofagus"
	desc = "An old sarcofagus, who knows who's inside even."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "sarcofagus"

/obj/structure/hivedecor/sarcofagus2
	name = "Old sarcofagus"
	desc = "An old sarcofagus crafted to fit certain individuals, possibly rich nobles, who knows who's inside even."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "scustom"

/obj/structure/hivedecor/anvil
	name = "Anvil"
	desc = "A nice, heavy and strong anvil to perform metalworking works on it, shame it's missing the tools."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "anvil"

/obj/structure/hivedecor/forge
	name = "Stone forge"
	desc = "An stone forge, sadly it requires tongs to work. It does make you want to make a dozen iron daggers to become an skilled weaponsmith."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "smelter1"

/obj/structure/hivedecor/grindingstone
	name = "Grinding Stone"
	desc = "A key structure to mantain your sharp blades to pierce and cut better."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "grinding"

/obj/structure/hivedecor/skulls
	name = "Skull Pillar"
	desc = "A pillar made out of skulls, spooky."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "skullpillar"

/obj/structure/hivedecor/defender_statue
	name = "Statue of the Defender"
	desc = "An statue of Baron Guimer on his armor, whom single handedly slain 34 hungry heretical pilgrims who tried to enter into the manor's food storage during the great drought on Elipharius with his trusty power sword, truly a tale of heroism."
	icon = 'icons/map_project/spookystatues.dmi'
	icon_state = "defender"

/obj/structure/hivedecor/artillery // It's gonna be decoration until someone decides to port the Lebensraum artillery system or something like it - Graf
	name = "Earthshaker Cannon"
	desc = "An older and more portable model of the Earthshaker Cannon, intended to work as heavy artillery equipment, although this one seems to be missing certain vital components."
	icon = 'icons/obj/cannon.dmi'
	icon_state = "modern_cannon"
	density = 1
	atom_flags = ATOM_FLAG_CLIMBABLE
	anchored = 0

/obj/structure/hivedecor/lasplacement // Decoration too, dont ask me to code it
	name = "Heavy Lasgun Turret"
	desc = "When you want something dead and to defend a position, the guard uses these, unfortunately, this one seems to be missing the ammo..And getting a handful of ammo from this older model is going to be a nightmare in logistic terms."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "lasgun_emplacement"

/obj/item/fluff_items/artyshell
	name = "Earthshaker round"
	desc = "A massive round for an Earthshaker Cannon, it could possibly turn an heretical space marine into red mist if just being near the explosion."
	icon = 'icons/obj/cannon_ball.dmi'
	icon_state = "shellHE"
	w_class = ITEM_SIZE_HUGE

/obj/structure/hivedecor/reactor
	name = "Dark Age Ship Reactor"
	desc = "A large reactor that was once used to power the ships that were once used to colonize distant planets for the Imperium, this one has been mantained by the Mechanicus and constantly produces enough power 24/7 to power most of the planet structures and buildings."
	icon = 'icons/map_project/reactor.dmi'
	icon_state = "reactor_on"

// Fluff & Misc Items

/obj/item/fluff_items // These do absolutely nothing, just some artifacts that could be sold and the like, aswell as to decorate, mainly references.
	name = "strange stone slab"
	desc = "An stone slab recovered during an exploration on the planet of Kronus, how it arrived here is unknown."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "necronstuff"
	w_class = ITEM_SIZE_SMALL
	sales_price = 125

/obj/item/fluff_items/paperwork
	name = "unholy pile of paperwork"
	desc = "A pile of papers, no wonder why the Imperium cannot send supplies that quick."
	icon_state = "paperwork"
	w_class = ITEM_SIZE_HUGE
	sales_price = 1

/obj/item/fluff_items/jojo
	name = "stone mask"
	desc = "An strange stone mask, the surface has been cracked and it still smells of iron, it does feel somewhat familiar."
	icon_state = "stone"
	w_class = ITEM_SIZE_SMALL
	sales_price = 100

/obj/item/fluff_items/bfg
	name = "A big fucking gun."
	desc = "An unknown weapon that does not seem from anywhere in this existance, rumours say that it was recovered from the Immaterium and was carried by a guardsmen all dressed in green which slaughtered demons with his bare hands."
	icon_state = "BFG"
	w_class = ITEM_SIZE_HUGE
	sales_price = 100 // RIP AND TEAAAAAR

/obj/item/fluff_items/atlantis
	name = "strange rock"
	desc = "A rock which has been made by some unknown alloy, there's tales of an old myth of a civilization in Terra that was called 'Atlantis' that had structures like that, but what are the odds it's true ?"
	icon_state = "wtf2"
	w_class = ITEM_SIZE_HUGE
	sales_price = 100

/obj/item/fluff_items/alien_blaster
	name = "strange pistol"
	desc = "It seems to be some sort of lasgun but with an smaller size, sadly it's got no ammo and whatever powered the weapon is long gone."
	icon_state = "egun6"
	w_class = ITEM_SIZE_SMALL
	sales_price = 100

/obj/item/fluff_items/redalert
	name = "old flask"
	desc = "An old flask created back on Terra, the number '1927', alongside the name of 'Anatoly Cherdenko' written on there."
	icon_state = "anatoly_cherdenko"
	w_class = ITEM_SIZE_SMALL
	sales_price = 100

/obj/item/fluff_items/gramophone
	name = "old gramophone"
	desc = "A very old gramophone, it seems to be still working but without a vinyl it's useless."
	icon_state = "gramophone"
	w_class = ITEM_SIZE_SMALL
	sales_price = 60

/obj/item/fluff_items/goldsword
	name = "golden sword"
	desc = "A gold sword that was used by a previous governor to slay an important cultist leader on Elipharius 150 years ago."
	icon_state = "gold_sword"
	w_class = ITEM_SIZE_SMALL
	sales_price = 150

/obj/item/fluff_items/ultrabanner
	name = "ultramarine banner"
	desc = "An actual real banner from an Ultramarine company, legends say the wearer will never fall and neither the banner will and that it has powers."
	icon_state = "umbanner"
	w_class = ITEM_SIZE_SMALL
	sales_price = 200

/obj/item/fluff_items/power_bat
	name = "deactivated power bat"
	desc = "Rumors say that there's a group of a chapter called the 'Angry marines', they supposedly use stools, tables, folding chairs and the like to bash to death the enemies of the emperor, how this arrived here is uncertain."
	icon_state = "powerbat"
	w_class = ITEM_SIZE_SMALL
	sales_price = 225

/obj/item/fluff_items/vietnam
	name = "ancient helmet"
	desc = "This helmet shows an extensive amount of wear, let alone the amount of marks of bullets that hit the wearer several times, suprisingly with no holes, there's even some old cig pack attached to it, you can see written on the side of the helmet 'WAR IS A FUCK'."
	icon_state = "vietnamordinator"
	w_class = ITEM_SIZE_SMALL
	sales_price = 75

/obj/item/fluff_items/spessmanhelm
	name = "space helmet"
	desc = "Something that is as old as the start of Terra, apparently these helmets were used back when mankind reached for the stars."
	icon_state = "space"
	w_class = ITEM_SIZE_SMALL
	sales_price = 85

/obj/item/fluff_items/bonehelm
	name = "animal skull helmet"
	desc = "This helmet was made with the head of an old creature from Terra."
	icon_state = "chariot"
	w_class = ITEM_SIZE_SMALL
	sales_price = 95

/obj/item/fluff_items/goldmask
	name = "golden mask"
	desc = "A mask made out of pure gold, whoever created this was either a legendary craftsman or knew their trade very well."
	icon_state = "goldmask2_icon"
	w_class = ITEM_SIZE_SMALL
	sales_price = 150

/obj/item/fluff_items/silvermask
	name = "silver mask"
	desc = "A mask made out of silver, its still as shining as it was back when it was crafted."
	icon_state = "nsilvermask_icon"
	w_class = ITEM_SIZE_SMALL
	sales_price = 100

/obj/item/fluff_items/skull
	name = "skull"
	desc = "A very old skull, who knows how long it's been there."
	icon_state = "skull"
	w_class = ITEM_SIZE_SMALL
	sales_price = 1