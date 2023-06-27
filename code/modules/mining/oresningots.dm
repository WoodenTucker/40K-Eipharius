 /*  ____
  / __ \
 | |  | |_ __ ___
 | |  | | '__/ _ \
 | |__| | | |  __/
  \____/|_|  \___|
        */

/obj/item/newore
	icon = 'icons/obj/mining.dmi'
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
/obj/item/newore/smallrock
	name = "small rock"
	desc = "Just that, a piece of a cave wall."
	icon_state = "glass_ore"
	sales_price = 0

/obj/item/newore/ironore
	name = "iron ore"
	desc = "A chunk of iron ore. Sturdy and reliable as ever."
	icon_state = "iron"
	sales_price = 0

/obj/item/newore/ironore/New()
	icon_state = pick("iron","iron2","iron3",)
	..()

/obj/item/newore/copperore
	name = "copper ore"
	desc = "A chunk of copper ore. You could make a load of things from it's ingot"
	icon_state = "copper"
	sales_price = 0


/obj/item/newore/silverore
	name = "silver ore"
	desc = "A chunk of silver ore. Good for fancy items and energy ammo"
	icon_state = "ore_silver"
	sales_price = 0

/obj/item/newore/coalore
	name = "coal"
	desc = "A chunk of coal. Use it to fuel forges."
	icon_state = "coal"
	sales_price = 0

/obj/item/newore/goldore
	name = "gold ore"
	desc = "SOLID GOLLLLLLD!"
	icon_state = "gold"
	sales_price = 0

/obj/item/newore/adamantiumore
	name = "adamantium ore"
	desc = "A chunk of the rarest known mineral in the Imperium. Don't sell it cheap."
	icon_state = "adamantine"
	sales_price = 0

/obj/item/newore/uraniumore
	name = "uranium ore"
	desc = "A rock with smaller chunks of uranium inside."
	icon_state = "uranium"
	sales_price = 0

/obj/item/newore/phoronore
	name = "Promethium ore"
	desc = "A chunk of promethium ore, a highly flammable ore that should be refined at forge to get usefull promethium crystals. Those have a variety of uses. For flamers, mostly."
	icon_state = "phoron"
	sales_price = 0

/obj/item/newore/coboltore
	name = "cobolt ore"
	desc = "A chunk of gold containing the bright blue cobolt inside. Useful for advanced items."
	icon_state = "cobolt"
	sales_price = 0

/obj/item/newore/kultriniumore
	name = "kultrinium ore"
	desc = "A chunk of ore containing the strong yet lightweight kultrinium metal inside. Useful for advanced weapons."
	icon_state = "ore_titanium"
	sales_price = 0

/obj/item/newore/diamantineore
	name = "diamantine ore"
	desc = "A chunk of diamantine ore, strong in conductivity. Useful for advanced ammo"
	icon_state = "ore_platinum"
	sales_price = 0

 /* _____                   _
 |_   _|                 | |
   | |  _ __   __ _  ___ | |_ ___
   | | | '_ \ / _` |/ _ \| __/ __|
  _| |_| | | | (_| | (_) | |_\__ \
 |_____|_| |_|\__, |\___/ \__|___/
               __/ |
              |___/
			  */

/obj/item/ingots
	name = "ingot"
	desc = "if you see this tell wel ard plz"
	var/ismarked = 0 //check if they chose a item yet
	var/rubtheoils = 0 //ready for oils?
	var/whatwemaking = 0 //used for switch statements in ingotcrafting.dm

/obj/item/ingots/copperingot
	name = "copper ingot"
	desc = "A solid bar of copper. You can make a lot of things out of this. Quality is another thing, though..."
	icon = 'icons/obj/mining.dmi'
	icon_state = "copper_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 7

/obj/item/ingots/silveringot
	name = "silver ingot"
	desc = "A solid bar of silver. Good for fancy items and lasgun ammo"
	icon = 'icons/obj/mining.dmi'
	icon_state = "silver_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 9


/obj/item/ingots/steelingot
	name = "steel ingot"
	desc = "A solid bar of steel, strengthened by carbon!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "steel_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 8

/obj/item/ingots/ironingot
	name = "iron ingot"
	desc = "A solid bar of iron. Strong and reliable, useful for a variety of items."
	icon = 'icons/obj/mining.dmi'
	icon_state = "iron_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 6


/obj/item/ingots/adamantiumingot
	name = "adamantium ingot"
	desc = "One of the rarest and strongest metals known to the Imperium. Don't sell it cheap."
	icon = 'icons/obj/mining.dmi'
	icon_state = "adamantine_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 25

/obj/item/ingots/goldingot
	name = "gold ingot"
	desc = "SOLID GOOOOOOOOOOOOOOLD!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "gold_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 20

/obj/item/ingots/coboltingot
	name = "cobolt ingot"
	desc = "A solid bar of cobolt. Useful for advanced items"
	icon = 'icons/obj/mining.dmi'
	icon_state = "cobolt_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 18

/obj/item/ingots/kultriniumingot
	name = "kultrinium ingot"
	desc = "A solid bar of kultrinium. It's strong yet lightweight. Useful for advanced weapons."
	icon = 'icons/obj/mining.dmi'
	icon_state = "titanium_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 22

/obj/item/ingots/diamantineingot
	name = "diamantine ingot"
	desc = "A solid bar of diamantine. Strong in conductivity. Useful for advanced ammo"
	icon = 'icons/obj/mining.dmi'
	icon_state = "platnium_ingot"
	w_class = ITEM_SIZE_NORMAL
	drop_sound = 'sound/items/metaldrop.ogg'
	sales_price = 21

/*
   _____
  / ____|
 | |  __  ___ _ __ ___  ___
 | | |_ |/ _ \ '_ ` _ \/ __|
 | |__| |  __/ | | | | \__ \
  \_____|\___|_| |_| |_|___/
*/

/obj/item/newore/gems
	name = "gem"
	desc = "If you see this somethings wrong..."
	var/gemtype = 0
/obj/item/newore/gems/quartz
	name = "chunk of quartz"
	desc = "A chunk of quartz"
	icon = 'icons/obj/mining.dmi'
	icon_state = "quartz"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	gemtype = 1
	sales_price = 12

/obj/item/newore/gems/quartz/cut
	name = "cut quartz"
	desc = "A finely cut quartz"
	icon = 'icons/obj/mining.dmi'
	icon_state = "quartz_cut"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 20

/obj/item/newore/gems/quartz/fail
	name = "damaged quartz"
	desc = "The carver of this quartz messed up!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "quartz_fail"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 8

/obj/item/newore/gems/sapphire
	name = "chunk of sapphire"
	desc = "A chunk of sapphire"
	icon = 'icons/obj/mining.dmi'
	icon_state = "sapphire"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	gemtype = 2
	sales_price = 16

/obj/item/newore/gems/sapphire/cut
	name = "cut sapphire"
	desc = "A finely cut sapphire"
	icon = 'icons/obj/mining.dmi'
	icon_state = "sapphire_cut"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 22

/obj/item/newore/gems/sapphire/fail
	name = "damaged sapphire"
	desc = "The carver of this sapphire messed up!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "sapphire_fail"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 10

/obj/item/newore/gems/ruby
	name = "chunk of ruby"
	desc = "A chunk of ruby"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ruby"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	gemtype = 3
	sales_price = 16

/obj/item/newore/gems/ruby/cut
	name = "cut ruby"
	desc = "A finely cut ruby"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ruby_cut"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 22

/obj/item/newore/gems/ruby/fail
	name = "damaged ruby"
	desc = "The carver of this ruby messed up!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ruby_fail"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 10


/obj/item/newore/gems/emerald
	name = "chunk of emerald"
	desc = "A chunk of emerald"
	icon = 'icons/obj/mining.dmi'
	icon_state = "emerald"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	gemtype = 4
	sales_price = 16

/obj/item/newore/gems/emerald/cut
	name = "cut emerald"
	desc = "A finely cut emerald"
	icon = 'icons/obj/mining.dmi'
	icon_state = "emerald_cut"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 22

/obj/item/newore/gems/emerald/fail
	name = "damaged emerald"
	desc = "The carver of this emerald messed up!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "emerald_fail"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 10

/obj/item/newore/gems/topaz
	name = "chunk of topaz"
	desc = "A chunk of topaz"
	icon = 'icons/obj/mining.dmi'
	icon_state = "topaz"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	gemtype = 5
	sales_price = 16

/obj/item/newore/gems/topaz/cut
	name = "cut topaz"
	desc = "A finely cut topaz"
	icon = 'icons/obj/mining.dmi'
	icon_state = "topaz_cut"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 22

/obj/item/newore/gems/topaz/fail
	name = "damaged topaz"
	desc = "The carver of this topaz messed up!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "topaz_fail"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 10

/obj/item/newore/gems/diamond
	name = "chunk of strange gem"
	desc = "A chunk of diamond"
	icon = 'icons/obj/mining.dmi'
	icon_state = "diamond"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	gemtype = 6
	sales_price = 18

/obj/item/newore/gems/diamond/cut
	name = "cut strange gem"
	desc = "A finely cut diamond"
	icon = 'icons/obj/mining.dmi'
	icon_state = "diamond_cut"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 24

/obj/item/newore/gems/diamond/fail
	name = "damaged strange gem"
	desc = "The carver of this diamond messed up!"
	icon = 'icons/obj/mining.dmi'
	icon_state = "diamond_fail"
	randpixel = 8
	w_class = ITEM_SIZE_SMALL
	drop_sound = 'sound/items/bone_drop.ogg'
	sales_price = 12

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
		src.coalfed += 1 //lets not heat everyones forge
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
	else if (istype(O,	/obj/item/newore/uraniumore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/stack/material/uranium/one(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/phoronore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/stack/material/phoron/one(src.loc)
		src.coalfed -= 0.5
	else if (istype(O,	/obj/item/newore/coboltore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/coboltingot(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/kultriniumore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/kultriniumingot(src.loc)
		src.coalfed -= 0.5
		return
	else if (istype(O,	/obj/item/newore/diamantineore))
		visible_message("[user] feeds [O] into the fire!")
		playsound(src, 'sound/effects/furnace_fire.ogg', 100, 1, 1)
		qdel(O)
		src.smelting = 1
		sleep(60) //10 seconds
		src.smelting = 0
		new /obj/item/ingots/diamantineingot(src.loc)
		src.coalfed -= 0.5
		return


//Gem washer
/obj/structure/gemwasher
	icon = 'icons/obj/old_computers.dmi'
	icon_state = "cargo_machine"
	name = "rock cleaner"
	desc = "A machine used to clean rocks and search for gems."
	density = 1
	anchored = 1
	var/last_update = 0
	var/list/stored_ore = list()

/obj/structure/gemwasher/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/newore/smallrock))
		user.remove_from_mob(W)
		src.contents += W
	if (istype(W, /obj/item/storage))
		var/obj/item/storage/S = W
		S.hide_from(usr)
		for(var/obj/item/newore/smallrock/O in S.contents)
			if(S.contents.len <= 1)
				S.remove_from_storage(O, src, 0) //This will move the item to this item's contents
			else
				S.remove_from_storage(O, src, 1)
		to_chat(user, "<span class='notice'>You empty the satchel into the box.</span>")

	update_ore_count()

	return

/obj/structure/gemwasher/proc/update_ore_count()

	stored_ore = list()

	for(var/obj/item/newore/smallrock/O in contents)

		if(stored_ore[O.name])
			stored_ore[O.name]++
		else
			stored_ore[O.name] = 1

/obj/structure/gemwasher/examine(mob/user)
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


/obj/structure/gemwasher/verb/empty_box()
	set name = "Empty Rock Cleaner"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human)) //Only living, intelligent creatures with hands can empty ore boxes.
		to_chat(usr, "<span class='warning'>You are physically incapable of emptying the gem washer.</span>")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the gem washer.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "<span class='warning'>The gem washer is empty</span>")
		return

	for (var/obj/item/newore/smallrock/O in contents)
		contents -= O
		O.loc = src.loc
	to_chat(usr, "<span class='notice'>You empty the gem washer</span>")

	return

/obj/structure/gemwasher/verb/clean_rocks()
	set name = "Run Rock Cleaner"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human)) //Only living, intelligent creatures with hands can empty ore boxes.
		to_chat(usr, "<span class='warning'>You are physically incapable of activating the gem washer.</span>")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the gem washer.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "<span class='warning'>The gem washer is empty</span>")
		return

	for (var/obj/item/newore/smallrock/O in contents)
		if(prob(5))
			contents.len -= 1
			new /obj/item/newore/gems/topaz(src.loc)
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return

		else if(prob(2))
			contents.len -= 1
			new /obj/item/newore/gems/sapphire(src.loc)
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return

		else if(prob(5))
			contents.len -= 1
			new /obj/item/newore/gems/quartz(src.loc)
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return
		else if(prob(2))
			contents.len -= 1
			new /obj/item/newore/gems/ruby(src.loc)
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return
		else if(prob(2))
			contents.len -= 1
			new /obj/item/newore/gems/emerald(src.loc)
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return
		else if(prob(1))
			contents.len -= 1
			new /obj/item/newore/gems/diamond(src.loc)
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return
		else
			contents.len -= 1
			to_chat(usr, "<span class='notice'>You run the gem washer</span>")
			clean_rocks()
			return


	return

/obj/structure/gemwasher/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/newore/smallrock/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return

/*
  ___  ____  _  _     ___  _  _  ____  ____  __  __ _   ___
 / __)(  __)( \/ )   / __)/ )( \(_  _)(_  _)(  )(  ( \ / __)
( (_ \ ) _) / \/ \  ( (__ ) \/ (  )(    )(   )( /    /( (_ \
 \___/(____)\_)(_/   \___)\____/ (__)  (__) (__)\_)__) \___/
*/

/obj/item/newore/gems/attackby(obj/item/device/W as obj, mob/user as mob)
	if(!isAutochisel(W) && !isChisel(W) && !isLasercutter(W))
		to_chat(user, "Use a chisel to try and carve out the gem!")
		return
	if(isAutochisel(W) || isChisel(W)) // Made it so normal chisel can cut gems to allow heritics to mine for them and not have to only get them from the mechnboys.
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		switch(gemtype)

			if(1)
				if(prob(50))
					new /obj/item/newore/gems/quartz/cut(src.loc)
					to_chat(user, "[user] successfully cuts the gem!")
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/quartz/fail(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					to_chat(user, "[user] slips and damages the gem!")
					qdel(src)
					return
			if(2)
				if(prob(50))
					to_chat(user, "[user] successfully cuts the gem!")
					new /obj/item/newore/gems/sapphire/cut(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/sapphire/fail(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					to_chat(user, "[user] slips and damages the gem!")
					qdel(src)
					return
			if(3)
				if(prob(50))
					to_chat(user, "[user] successfully cuts the gem!")
					new /obj/item/newore/gems/ruby/cut(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/ruby/fail(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					to_chat(user, "[user] slips and damages the gem!")
					qdel(src)
					return
			if(4)
				if(prob(50))
					to_chat(user, "[user] successfully cuts the gem!")
					new /obj/item/newore/gems/emerald/cut(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/emerald/fail(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					to_chat(user, "[user] slips and damages the gem!")
					qdel(src)
					return
			if(5)
				if(prob(50))
					to_chat(user, "[user] successfully cuts the gem!")
					new /obj/item/newore/gems/topaz/cut(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/topaz/fail(src.loc)
					to_chat(user, "[user] slips and damages the gem!")
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
			if(6)
				if(prob(50))
					to_chat(user, "[user] successfully cuts the gem!")
					new /obj/item/newore/gems/diamond/cut(src.loc)
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/diamond/fail(src.loc)
					to_chat(user, "[user] slips and damages the gem!")
					playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
					qdel(src)
					return

	if(isLasercutter(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		switch(gemtype)

			if(6)
				if(prob(50))
					to_chat(user, "[user] successfully refines the gem!")
					new /obj/item/stack/material/diamond(src.loc,1)
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
					qdel(src)
					return
				if(prob(50))
					new /obj/item/newore/gems/diamond/fail(src.loc)
					to_chat(user, "[user] slips and damages the gem!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
					qdel(src)
					return
			else
				to_chat(user, "You can not refine this type of gem into useable material!")
				return
