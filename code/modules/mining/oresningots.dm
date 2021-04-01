 /*  ____
  / __ \
 | |  | |_ __ ___
 | |  | | '__/ _ \
 | |__| | | |  __/
  \____/|_|  \___|
        */

/obj/item/newore/smallrock
	name = "small rock"
	desc = "Just that, a piece of a cave wall."
	icon = 'icons/obj/mining.dmi'
	icon_state = "glass_ore"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/ironore
	name = "iron ore"
	desc = "A chunk of iron ore."
	icon = 'icons/obj/mining.dmi'
	icon_state = "iron"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/ironore/New()
	icon_state = pick("iron","iron2","iron3",)
	..()

/obj/item/newore/copperore
	name = "copper ore"
	desc = "A chunk of copper ore"
	icon = 'icons/obj/mining.dmi'
	icon_state = "copper"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/silverore
	name = "silver ore"
	desc = "A chunk of silver ore"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore_silver"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/coalore
	name = "coal"
	desc = "A chunk of coal"
	icon = 'icons/obj/mining.dmi'
	icon_state = "coal"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/goldore
	name = "gold ore"
	desc = "SOLID GOLLLLLLD!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "gold"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/adamantiumore
	name = "adamantium ore"
	desc = "A chunk of the rarest known mineral in the Imperium."
	icon = 'icons/obj/mining.dmi'
	icon_state = "adamantine"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'


 /* _____                   _
 |_   _|                 | |
   | |  _ __   __ _  ___ | |_ ___
   | | | '_ \ / _` |/ _ \| __/ __|
  _| |_| | | | (_| | (_) | |_\__ \
 |_____|_| |_|\__, |\___/ \__|___/
               __/ |
              |___/
			  */

/obj/item/ingots/copperingot
	name = "copper ingot"
	desc = "A solid bar of copper."
	icon = 'icons/obj/mining.dmi'
	icon_state = "copper_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	var/ismarked = 0 //check if they chose a item yet
	var/rubtheoils = 0 //ready for oils?
	var/whatwemaking = 0 //used for switch statements in ingotcrafting.dm

/obj/item/ingots/silveringot
	name = "silver ingot"
	desc = "A solid bar of silver."
	icon = 'icons/obj/mining.dmi'
	icon_state = "silver_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'

/obj/item/ingots/steelingot
	name = "steel ingot"
	desc = "A solid bar of steel, strengthened by carbon!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "steel_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'

/obj/item/ingots/ironingot
	name = "iron ingot"
	desc = "A solid bar of iron."
	icon = 'icons/obj/mining.dmi'
	icon_state = "iron_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'

/obj/item/ingots/adamantiumingot
	name = "adamantium ingot"
	desc = "One of the rarest and strongest metals known to the Imperium."
	icon = 'icons/obj/mining.dmi'
	icon_state = "adamantine_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'

/obj/item/ingots/goldingot
	name = "gold ingot"
	desc = "SOLID GOOOOOOOOOOOOOOLD!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "gold_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'


/*
   _____
  / ____|
 | |  __  ___ _ __ ___  ___
 | | |_ |/ _ \ '_ ` _ \/ __|
 | |__| |  __/ | | | | \__ \
  \_____|\___|_| |_| |_|___/
*/

/obj/item/newore/quartz
	name = "chunk of quartz"
	desc = "A chunk of quartz"
	icon = 'icons/obj/mining.dmi'
	icon_state = "quartz"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/sapphire
	name = "chunk of sapphire"
	desc = "A chunk of sapphire"
	icon = 'icons/obj/mining.dmi'
	icon_state = "sapphire"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'


/obj/item/newore/ruby
	name = "chunk of ruby"
	desc = "A chunk of ruby"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ruby"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/emerald
	name = "chunk of emerald"
	desc = "A chunk of emerald"
	icon = 'icons/obj/mining.dmi'
	icon_state = "emerald"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/topaz
	name = "chunk of topaz"
	desc = "A chunk of topaz"
	icon = 'icons/obj/mining.dmi'
	icon_state = "topaz"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'

/obj/item/newore/diamond
	name = "chunk of diamond"
	desc = "A chunk of diamond"
	icon = 'icons/obj/mining.dmi'
	icon_state = "diamond"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'







/*          .-') _   ('-.  _   .-')      .-')
         (  OO) )  _(  OO)( '.( OO )_   ( OO ).
  ,-.-') /     '._(,------.,--.   ,--.)(_)---\_)
  |  |OO)|'--...__)|  .---'|   `.'   | /    _ |
  |  |  \'--.  .--'|  |    |         | \  :` `.
  |  |(_/   |  |  (|  '--. |  |'.'|  |  '..`''.)
 ,|  |_.'   |  |   |  .--' |  |   |  | .-._)   \
(_|  |      |  |   |  `---.|  |   |  | \       /
  `--'      `--'   `------'`--'   `--'  `-----'
*/

/obj/structure/new_ore_box
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox1"
	name = "ore box"
	desc = "A heavy box used for storing ore."
	density = 1
	var/last_update = 0
	var/list/stored_ore = list()

/obj/structure/new_ore_box/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/newore/))
		user.remove_from_mob(W)
		src.contents += W
	if (istype(W, /obj/item/storage))
		var/obj/item/storage/S = W
		S.hide_from(usr)
		for(var/obj/item/newore/O in S.contents)
			if(S.contents.len <= 1)
				S.remove_from_storage(O, src, 0) //This will move the item to this item's contents
			else
				S.remove_from_storage(O, src, 1)
		to_chat(user, "<span class='notice'>You empty the satchel into the box.</span>")

	update_ore_count()

	return

/obj/structure/new_ore_box/proc/update_ore_count()

	stored_ore = list()

	for(var/obj/item/newore/O in contents)

		if(stored_ore[O.name])
			stored_ore[O.name]++
		else
			stored_ore[O.name] = 1

/obj/structure/new_ore_box/examine(mob/user)
	. = ..(user)

	// Borgs can now check contents too.
	if((!istype(user, /mob/living/carbon/human)) && (!istype(user, /mob/living/silicon/robot)))
		return

	if(!Adjacent(user)) //Can only check the contents of ore boxes if you can physically reach them.
		return

	add_fingerprint(user)

	if(!contents.len)
		to_chat(user, "It is empty.")
		return

	if(world.time > last_update + 10)
		update_ore_count()
		last_update = world.time

	to_chat(user, "It holds:")
	for(var/ore in stored_ore)
		to_chat(user, "- [stored_ore[ore]] [ore]")
	return


/obj/structure/new_ore_box/verb/empty_box()
	set name = "Empty Ore Box"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human)) //Only living, intelligent creatures with hands can empty ore boxes.
		to_chat(usr, "<span class='warning'>You are physically incapable of emptying the ore box.</span>")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the ore box.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "<span class='warning'>The ore box is empty</span>")
		return

	for (var/obj/item/newore/O in contents)
		contents -= O
		O.loc = src.loc
	to_chat(usr, "<span class='notice'>You empty the ore box</span>")

	return

/obj/structure/new_ore_box/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/newore/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return

/obj/item/storage/newore
	name = "mining satchel"
	desc = "This sturdy bag can be used to store and transport ores."
	icon = 'icons/obj/mining.dmi'
	icon_state = "satchel"
	slot_flags = SLOT_BELT
	max_storage_space = 200
	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_LARGE
	can_hold = list(/obj/item/newore)
	allow_quick_gather = 1
	allow_quick_empty = 1
	use_to_pickup = 1

/obj/structure/forge
	name = "forge"
	desc = "An imported forge from a far-off feudal world. Used to smelt ore into ingots!"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "forge"
	density = 1
	anchored = 1
	var/coalfed = 0
	var/ironingot = 0
	var/smelting = 0 //to stop duperinos

/obj/structure/forge/attackby(var/obj/item/newore/O, var/mob/living/carbon/human/user)
	if (!(istype(O,	/obj/item/newore)))
		visible_message("That isn't a valid ore!")
		return
	if (istype(O,	/obj/item/newore/coalore))
		visible_message("[user] feeds coal into the fire!")
		src.coalfed = 1 //lets not heat everyones forge
		playsound(src, 'sound/effects/adding_coal.ogg', 100, 1, 1)
		qdel(O)
		return
	if(coalfed == 0)
		visible_message("The forge requires coal to burn hot enough to smelt ore!")
		return
	if(smelting == 1)
		visible_message("There is already an ore being smelted!")
		return
	else if (istype(O,	/obj/item/newore/copperore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/copperingot(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/silverore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/silveringot(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/goldore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/goldingot(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/ironore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/ironingot(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/adamantiumore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/adamantiumingot(src.loc)
		src.coalfed -= 0.5
		return

