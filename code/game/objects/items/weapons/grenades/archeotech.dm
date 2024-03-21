/obj/item/grenade/vortex
	name = "Vortex Grenade"
	desc = "The Phobos Pattern Vortex Grenade is a highly dangerous Warp-based weapon. "
	icon_state = "emp"
	item_state = "emp"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	arm_sound = 'sound/effects/3.wav'
	var/implode_at
	var/start_at

/obj/item/grenade/vortex/Destroy()
	if(implode_at)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/grenade/vortex/detonate()
	..()
	START_PROCESSING(SSobj, src)
	start_at = world.time + 3 SECONDS
	implode_at = world.time + 10 SECONDS
	update_icon()
	playsound(src, 'sound/weapons/wave.ogg', 100)

/obj/item/grenade/vortex/update_icon()
	overlays.Cut()
	if(implode_at)
		overlays += image(icon = 'icons/obj/machines/power/fusion.dmi', icon_state = "emfield_s1")

/obj/item/grenade/vortex/Process()
	if(world.time > start_at)
		if(!isturf(loc))
			if(ismob(loc))
				var/mob/M = loc
				M.drop_from_inventory(src)
			forceMove(get_turf(src))
		supermatter_pull(src, world.view, STAGE_FIVE)
		playsound(src, 'sound/effects/supermatter.ogg', 100)
	if(world.time > implode_at)
		new /turf/unsimulated/wall/supermatter/warp(get_turf(src))
		qdel(src)

/obj/item/grenade/teleport
	name = "Teleportation Grenade"
	desc = "An ancient Archoetech device, capable of teleporting anyone in its radius. "
	icon_state = "lyemp"
	item_state = "lyemp"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	arm_sound = 'sound/effects/3.wav'

/obj/item/grenade/vortex/detonate()
	..()
	START_PROCESSING(SSobj, src)
		for(var/obj/structure/closet/L in hear(7, get_turf(src)))
			if(locate(/mob/living/carbon/, L))
				for(var/mob/living/carbon/M in L)
					teleport(get_turf(src), M)

		for(var/mob/living/carbon/M in hear(7, get_turf(src)))
			teleport(get_turf(src), M)
	update_icon()
	playsound(src, 'sound/weapons/wave.ogg', 100)

/obj/item/grenade/vortex/teleport()
	var/list/turfs = new/list()
	for(var/turf/T in orange(18, M))
		if(istype(T,/turf/space)) continue
		if(T.density) continue
		if(T.x>world.maxx-18 || T.x<18)	continue
		if(T.y>world.maxy-18 || T.y<18)	continue
		turfs += T
	if(!turfs.len) turfs += pick(/turf in orange(9))
	var/turf/picked = pick(turfs)
	if(!isturf(picked)) return
	var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
	spark_system.set_up(5, 0, M.loc)
	spark_system.start()
