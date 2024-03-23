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

/*/obj/item/grenade/teleport
	name = "Teleportation Grenade"
	desc = "An ancient Archoetech device, capable of teleporting anyone in its radius. "
	icon_state = "lyemp"
	item_state = "lyemp"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	arm_sound = 'sound/effects/3.wav'*/ //Remind me to make this work at some point.

/obj/item/grenade/cryo
	name = "Cryogenic Grenade"
	desc = "An ancient looking grenade."
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/grenade.dmi'
	icon_state = "delivery"
	item_state = "delivery"
	throw_speed = 4
	throw_range = 20
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT

/obj/item/grenade/cryo/detonate()
	for(var/mob/M in range(5)) //Five tile range
		M.bodytemperature = 0 //Instantly freezes you. 0 is absolute zero, don't set this to a negative, it breaks physics.
		M.Weaken(2)
