/obj/mecha/combat/gygax/leman
	desc = "A tank used by Astra Militarum"
	name = "Leman Russ"
	icon_state = "durand"
	initial_icon = "durand"
	step_in = 2.5
	health = 800
	deflect_chance = 45
	damage_absorption = list("brute"=0.5,"fire"=1,"bullet"=0.5,"laser"=0.7,"energy"=0.9,"bomb"=0.75)
	max_temperature = 30000
	infra_luminosity = 8
	force = 65
	overload_coeff = 0.75
	wreckage = /obj/effect/decal/mecha_wreckage
	max_equip = 5
	step_energy_drain = 2.5
	overload_enable_message = "Switching to ramming speed? May Omnissiah have mercy on you for this..."
	overload_disable_message = "Ramming speed disabled. Techpriests surely will be unhappy if they know what you've done..."


/obj/mecha/combat/leman/New()
        ..()
        var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/tank_cannon
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/autocannon
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/generator
        ME.attach(src)
        return

/obj/mecha/combat/leman/add_cell()
        cell = new /obj/item/cell/hyper(src)
