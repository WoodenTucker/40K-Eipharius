/obj/item/grenade/smokebomb
	desc = "Use this to stop both you, and the enemy from seeing anything."
	name = "smoke bomb"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "csmoke"
	arm_sound = 'sound/weapons/grenade_arm.ogg'
	det_time = 30
	item_state = "flashbang"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/smoke

/obj/item/grenade/smokebomb/New()
	..()
	src.smoke = new /datum/effect/effect/system/smoke_spread()
	src.smoke.attach(src)

/obj/item/grenade/smokebomb/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/grenade/smokebomb/detonate()
	playsound(src.loc, 'sound/effects/smoke.ogg', 50)
	src.smoke.set_up(10, 0, usr.loc)
	spawn(0)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
	sleep(80)
	qdel(src)


//These are debug items and are not used in game.
/obj/item/grenade/smokebomb/mortar
	name = "HE mortar marker"
	desc = "Throw it at the spot you want mortar fire at. MAKE SURE YOU'RE NOT THERE!"
	det_time = 50
	var/mortar_type = "frag"

/obj/item/grenade/smokebomb/mortar/detonate()
	drop_mortar(get_turf(src), mortar_type)
	qdel(src)

/obj/item/grenade/smokebomb/mortar/fire
	name = "incendiary mortar marker"
	mortar_type = "fire"

/obj/item/grenade/smokebomb/mortar/gas
	name = "chemical mortar marker"
	mortar_type = "gas"

/obj/item/grenade/smokebomb/mortar/arty
	name = "artillery marker"
	mortar_type = "arty"
	det_time = 75
//GAS GRENADES

/obj/item/weapon/grenade/chemical
	desc = "It is set to detonate in 5 seconds."
	name = "chemical grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "csmoke"
	det_time = 50
	item_state = "csmoke"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/chem/payload/chlorine_gas
	var/stype = /datum/effect/effect/system/smoke_spread/chem/payload

/obj/item/weapon/grenade/chemical/New()
	..()
	smoke = PoolOrNew(stype)
	smoke.attach(src)

/obj/item/weapon/grenade/chemical/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/weapon/grenade/chemical/prime()
	if (active)
		playsound(loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		smoke.set_up(10, FALSE, usr ? usr.loc : loc)
		spawn(0)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()

		sleep(80)
		qdel(src)
		return

/obj/item/weapon/grenade/smokebomb/chlorine
	name = "chlorine gas grenade"
	stype = /datum/effect/effect/system/smoke_spread/chem/payload/chlorine_gas

/obj/item/weapon/grenade/smokebomb/mustard
	name = "mustard gas grenade"
	stype = /datum/effect/effect/system/smoke_spread/chem/payload/mustard_gas

/obj/item/weapon/grenade/smokebomb/phosgene
	name = "phosgene gas grenade"
	stype = /datum/effect/effect/system/smoke_spread/chem/payload/phosgene

/obj/item/weapon/grenade/smokebomb/white_phosphorus
	name = "white phosphorus gas grenade"
	stype = /datum/effect/effect/system/smoke_spread/chem/payload/white_phosphorus_gas

/obj/item/weapon/grenade/smokebomb/xylyl_bromide
	name = "xylyl bromide gas grenade"
	stype = /datum/effect/effect/system/smoke_spread/chem/payload/xylyl_bromide
