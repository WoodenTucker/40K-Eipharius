// There's an unfinished one in the mecha spot, hence why i made this one file - Graf

// Imperial Tank, i'd suggest only using it against orks or in events due the weaponary (It's STRONG).

/obj/mecha/combat/leman_russ
	desc = "A variant of the Leman Russ, this variation has been given a anti-tank cannon and a minor anti-infantry weapon."
	name = "Leman Russ Vanquisher"
	icon = 'icons/cadia-sprites/mecha/lemanruss.dmi'
	icon_state = "vanquisher"
	initial_icon = "vanquisher"
	step_in = 2.5 // Quick entrace
	health = 2800
	deflect_chance = 45
	internal_damage_threshold = 250
	damage_absorption = list("brute"=0.9,"fire"=0.9,"bullet"=1.1,"laser"=1.2,"energy"=0.4,"bomb"=0.8)
	max_temperature = 30000
	infra_luminosity = 8
	max_equip = 3
	force = 25
	var/defence = 45
	var/def_boost = 25
	wreckage = /obj/effect/decal/mecha_wreckage/leman
	cell = new /obj/item/cell/hyper
	opacity = 0 // So you can see what's behind you & other players.

// Chimera Equipment

/obj/mecha/combat/leman_russ/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/explosive/tank_cannon
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/heavybolter
	return

// Wreckage of Leman

/obj/effect/decal/mecha_wreckage/leman
	name = "vanquisher wreckage"
	icon = 'icons/cadia-sprites/mecha/lemanruss.dmi'
	icon_state = "vanquisher-wreckage"
