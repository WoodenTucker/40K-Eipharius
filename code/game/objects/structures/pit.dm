/obj/structure/pit
	name = "pit"
	desc = "Watch your step, partner."
	icon = 'icons/obj/pit.dmi'
	icon_state = "pit1"
	blend_mode = BLEND_MULTIPLY
	density = 0
	anchored = 1
	var/open = 1

/obj/structure/pit/attackby(obj/item/W, mob/user)
	if( istype(W,/obj/item/shovel) )
		visible_message("<span class='notice'>\The [user] starts [open ? "filling" : "digging open"] \the [src]</span>")
		if( do_after(user, 50) )
			visible_message("<span class='notice'>\The [user] [open ? "fills" : "digs open"] \the [src]!</span>")
			if(open)
				close(user)
			else
				open()
		else
			to_chat(user, "<span class='notice'>You stop shoveling.</span>")
		return
	if (!open && istype(W,/obj/item/stack/logs))
		if(locate(/obj/structure/gravemarker) in src.loc)
			to_chat(user, "<span class='notice'>There's already a grave marker here.</span>")
		else
			visible_message("<span class='notice'>\The [user] starts making a grave marker on top of \the [src]</span>")
			if( do_after(user, 50) )
				visible_message("<span class='notice'>\The [user] finishes the grave marker</span>")
				var/obj/item/stack/material/wood/plank = W
				plank.use(1)
				new/obj/structure/gravemarker(src.loc)
			else
				to_chat(user, "<span class='notice'>You stop making a grave marker.</span>")
		return
	..()

/obj/structure/pit/update_icon()
	icon_state = "pit[open]"
	if(istype(loc,/turf/simulated/floor/exoplanet))
		var/turf/simulated/floor/exoplanet/E = loc
		if(E.mudpit)
			icon_state="pit[open]mud"
			blend_mode = BLEND_OVERLAY

/obj/structure/pit/proc/open()
	name = "pit"
	desc = "Watch your step, partner."
	open = 1
	for(var/atom/movable/A in src)
		A.forceMove(src.loc)
	update_icon()

/obj/structure/pit/proc/close(var/user)
	name = "mound"
	desc = "Some things are better left buried."
	open = 0
	for(var/atom/movable/A in src.loc)
		if(!A.anchored && A != user)
			A.forceMove(src)
	update_icon()

/obj/structure/pit/return_air()
	return open

/obj/structure/pit/proc/digout(mob/escapee)
	var/breakout_time = 1 //2 minutes by default

	if(open)
		return

	if(escapee.stat || escapee.restrained())
		return

	escapee.setClickCooldown(100)
	to_chat(escapee, "<span class='warning'>You start digging your way out of \the [src] (this will take about [breakout_time] minute\s)</span>")
	visible_message("<span class='danger'>Something is scratching its way out of \the [src]!</span>")

	for(var/i in 1 to (6*breakout_time * 2)) //minutes * 6 * 5seconds * 2
		playsound(src.loc, 'sound/weapons/bite.ogg', 100, 1)

		if(!do_after(escapee, 50))
			to_chat(escapee, "<span class='warning'>You have stopped digging.</span>")
			return
		if(open)
			return

		if(i == 6*breakout_time)
			to_chat(escapee, "<span class='warning'>Halfway there...</span>")

	to_chat(escapee, "<span class='warning'>You successfuly dig yourself out!</span>")
	visible_message("<span class='danger'>\the [escapee] emerges from \the [src]!</span>")
	playsound(src.loc, 'sound/effects/squelch1.ogg', 100, 1)
	open()

/obj/structure/pit/closed
	name = "mound"
	desc = "Some things are better left buried."
	open = 0

/obj/structure/pit/closed/Initialize()
	. = ..()
	close()

//invisible until unearthed first
/obj/structure/pit/closed/hidden
	invisibility = INVISIBILITY_OBSERVER

/obj/structure/pit/closed/hidden/open()
	..()
	set_invisibility(INVISIBILITY_LEVEL_ONE)

//spoooky
/obj/structure/pit/closed/grave
	name = "grave"
	icon_state = "pit0"

/obj/structure/pit/closed/grave/Initialize()
	var/obj/structure/closet/coffin/C = new(src.loc)
	var/obj/item/remains/human/bones = new(C)
	bones.plane = LYING_MOB_PLANE
	bones.layer = LYING_MOB_LAYER
	var/obj/structure/gravemarker/random/R = new(src.loc)
	R.generate()
	. = ..()

/obj/structure/gravemarker
	name = "grave marker"
	desc = "You're not the first."
	icon = 'icons/obj/gravestone.dmi'
	icon_state = "wood"
	pixel_x = 15
	pixel_y = 8
	anchored = 1
	var/message = "Unknown."

/obj/structure/gravemarker/cross
	icon_state = "cross"

/obj/structure/gravemarker/examine()
	..()
	to_chat(usr,"It says: '[message]'")

/obj/structure/gravemarker/random/Initialize()
	generate()
	. = ..()

/obj/structure/gravemarker/random/proc/generate()
	icon_state = pick("wood","cross")

	var/datum/species/S = all_species["Human"]
	var/nam = S.get_random_name(pick(MALE,FEMALE))
	var/cur_year = text2num(time2text(world.timeofday, "YYYY"))+544
	var/born = cur_year - rand(5,150)
	var/died = max(cur_year - rand(0,70),born)

	message = "Here lies [nam], [born] - [died]."

/obj/structure/gravemarker/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/material/hatchet))
		visible_message("<span class = 'warning'>\The [user] starts hacking away at \the [src] with \the [W].</span>")
		if(!do_after(user, 30))
			visible_message("<span class = 'warning'>\The [user] hacks \the [src] apart.</span>")
			new /obj/item/stack/material/wood(src)
			qdel(src)
	if(istype(W,/obj/item/pen))
		var/msg = sanitize(input(user, "What should it say?", "Grave marker", message) as text|null)
		if(msg)
			message = msg


/obj/structure/closet/pit
	name = "grave"
	desc = "Watch your step, partner."
	blend_mode = BLEND_MULTIPLY
	density = 0
	anchored = 1
	var/open = 1
	icon = 'icons/obj/pit.dmi'
	icon_state = "pit1"
	icon_closed = "pit0"
	icon_opened = "pit1"
	open_sound = 'sound/effects/empty_shovel.ogg'
	close_sound = 'sound/effects/empty_shovel.ogg'
	var/item_path = /obj/item/bodybag
	density = 0
	storage_capacity = (MOB_MEDIUM * 2) - 1
	var/contains_body = 0

/obj/structure/closet/pit/attackby(W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/logs))
		var/t = input(user, "What would you like the headstone to say?", text("[]", src.name), null)  as text
		if (user.get_active_hand() != W)
			return
		if (!in_range(src, user) && src.loc != user)
			return
		t = sanitizeSafe(t, MAX_NAME_LEN)
		if (t)
			src.SetName("Grave of - ")
			src.name += t
			src.overlays += image(src.icon, "bodybag_label")
		else
			src.SetName("grave")
	//..() //Doesn't need to run the parent. Since when can fucking bodybags be welded shut? -Agouri
		return
	else if(isWirecutter(W))
		src.SetName("grave")
		src.overlays.Cut()
		to_chat(user, "You cut the tag off \the [src].")
		return
	else if(istype(W, /obj/item/device/healthanalyzer/) && !opened)
		if(contains_body)
			var/obj/item/device/healthanalyzer/HA = W
			for(var/mob/living/L in contents)
				HA.scan_mob(L, user)
		else
			to_chat(user, "\The [W] reports that \the [src] is empty.")
		return

/obj/structure/closet/pit/store_mobs(var/stored_units)
	contains_body = ..()
	if(contains_body)
		for(var/mob/living/L in contents)
			L.isburied = 1
		visible_message("You fill in the grave and make it seem like nothing was ever there...")
	return contains_body

/obj/structure/closet/pit/close()
	if(..())
		set_density(0)
		return 1
	return 0

/obj/structure/closet/pit/proc/fold(var/user)
	if(!ishuman(user))	return 0
	if(opened)	return 0
	if(contents.len)	return 0
	visible_message("[user] folds up the [name]")
	. = new item_path(get_turf(src))
	qdel(src)

/obj/structure/closet/pit/MouseDrop(over_object, src_location, over_location)
	..()
	if((over_object == usr && (in_range(src, usr) || usr.contents.Find(src))))
		fold(usr)

/obj/structure/closet/pit/update_icon()
	if(opened)
		icon_state = icon_opened
	else
		if(contains_body > 0)
			icon_state = "pit0"
		else
			icon_state = icon_closed