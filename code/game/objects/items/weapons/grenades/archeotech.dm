/obj/item/grenade/vortex
	name = "Vortex Grenade"
	icon_state = "emp"
	item_state = "emp"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	arm_sound = 'sound/effects/3.wav'
	var/implode_at

/obj/item/grenade/vortex/Destroy()
	if(implode_at)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/grenade/vortex/detonate()
	..()
	START_PROCESSING(SSobj, src)
	implode_at = world.time + 12 SECONDS
	update_icon()
	playsound(src, 'sound/weapons/wave.ogg', 100)

/obj/item/grenade/vortex/update_icon()
	overlays.Cut()
	if(implode_at)
		overlays += image(icon = 'icons/obj/machines/power/fusion.dmi', icon_state = "emfield_s1")

/obj/item/grenade/vortex/Process()
	if(world.time > implode_at + 2)
		if(!isturf(loc))
			if(ismob(loc))
	 			var/mob/M = loc
	 			M.drop_from_inventory(src)
	 		forceMove(get_turf(src))
		/turf/unsimulated/wall/supermatter/warp/W = get_turf(src)
		supermatter_pull(src, world.view, STAGE_FIVE)
		playsound(src, 'sound/effects/supermatter.ogg', 100)
	if(world.time > implode_at)
		explosion(loc, 1, 2, 4, 5)
		qdel(src)
		qdel(W)
