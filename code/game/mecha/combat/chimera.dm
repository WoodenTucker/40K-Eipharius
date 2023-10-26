// Transport Vehicle, has one weapon installed but heavy defense against projectiles, can carry a lot of passengers

/obj/mecha/combat/chimera
	desc = "An armoured personnel carrier (APC) of the Astra Militarum."
	name = "Chimera"
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "chimeraAC"
	initial_icon = "chimeraAC"
	step_in = 3.5 // Quick entrace
	health = 400
	deflect_chance = 45
	internal_damage_threshold = 250
	damage_absorption = list("brute"=0.9,"fire"=0.9,"bullet"=1.1,"laser"=1.2,"energy"=0.4,"bomb"=0.8)
	max_temperature = 30000
	infra_luminosity = 8
	max_equip = 10 // To carry 8 passengers, 1 gun, and 1 tool
	force = 25
	var/defence = 45
	var/def_boost = 25
	wreckage = /obj/effect/decal/mecha_wreckage/chimera
	cell = new /obj/item/cell/hyper
	opacity = 0 // So you can see what's behind you & other players.
	dir_in = 1 //Facing North.
	internal_damage_threshold = 35

// Chimera Equipment

/obj/mecha/combat/chimera/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/multilas
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	return

// Wreckages of Chimeras

/obj/effect/decal/mecha_wreckage/chimera
	name = "chimera wreckage"
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "chimeradestroyed"

/obj/effect/decal/mecha_wreckage/chimera/inq
	name = "chimera wreckage"
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "chimera_wreckage"

/obj/mecha/combat/inq_chimera // Slight defense from fire rounds, i also do not recommend using this one in standard gameplay unless events due how strong the fire is.
	desc = "An armoured personnel carrier (APC) of the Astra Militarum. This one is for inquisitor squads and armed with an incendiary cannon."
	name = "Inquisitorial Chimera"
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "chimeraINQ"
	initial_icon = "chimeraINQ"
	step_in = 3.5 // Quick entrace
	health = 310
	deflect_chance = 35
	internal_damage_threshold = 250
	damage_absorption = list("brute"=0.9,"fire"=1.1,"bullet"=0.9,"laser"=1.2,"energy"=0.4,"bomb"=0.8) // Less defense due increased deadly weapons on it
	max_temperature = 30000
	infra_luminosity = 8
	max_equip = 10 // To carry 8 passengers, 1 gun, and 1 tool
	force = 25
	wreckage = /obj/effect/decal/mecha_wreckage/chimera/inq
	cell = new /obj/item/cell/hyper
	opacity = 0 // So you can see what's behind you & other players.

// Inq Chimera Equipment

/obj/mecha/combat/inq_chimera/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/flamer
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	return