

/*

This file contains most of the code for the dungeons to work, structures, some items and mobs possibly - Graf

*/

/obj/structure/hivedecor/xenos
	name = "xenos debris"
	desc = "..."
	icon = 'icons/map_project/port/comm_tower3.dmi'
	icon_state = "resin_final"



/obj/structure/hivedecor/vehicle
	name = "Cargo-8"
	desc = "An ancient cargo hauler of imperial design."
	icon = 'icons/map_project/port/van.dmi'
	icon_state = "van_base"

/obj/structure/closet/crate/xenos/cargo8
	name = "Cargo-8"
	desc = "An ancient cargo hauler of imperial design."
	icon = 'icons/map_project/port/van.dmi'
	icon_state = "vancrate"
	icon_opened = "vancrateopen"
	icon_closed = "vancrate"

/obj/structure/hivedecor/vehicle/tau
	name = "Destroyed Tau APC"
	desc = "A destroyed armored personnel carrier of Tau origin."
	icon = 'icons/map_project/port/apc.dmi'
	icon_state = "apc"

/obj/structure/hivedecor/xenos/broadcaster
	name = "xenos broadcaster"
	desc = "A massive vox communication tower of xenos origin."
	icon = 'icons/map_project/port/comm_tower3.dmi'
	icon_state = "static1"

/obj/structure/hivedecor/xenos/broadcasterbroken
	name = "xenos broadcaster"
	desc = "A massive vox communication tower of xenos origin."
	icon = 'icons/map_project/port/comm_tower3.dmi'
	icon_state = "static1_broken"

/obj/structure/hivedecor/xenos/commtower
	name = "xenos comms relay"
	desc = "A massive vox communication tower of xenos origin."
	icon = 'icons/map_project/port/comm_tower2.dmi'
	icon_state = "comm_tower_off"

/obj/structure/hivedecor/xenos/commtower/powered
	icon_state = "comm_tower"

/obj/structure/hivedecor/xenos/commtower/damaged
	icon_state = "comm_tower_broken"

/obj/structure/hivedecor/xenos/commtower/old
	icon_state = "construct_9_1"

/obj/structure/hivedecor/xenos/coolanttank
	name = "coolant tank"
	desc = "A bubbling container of coolant fluid."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "coolanttank"

// add in crystal crate, crystals -- etc for the cave systems.

/obj/structure/hivedecor/xenos/siphon
	name = "siphon"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "psiphon:0"

/obj/structure/hivedecor/xenos/scrubber
	name = "scrubber"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "pscrubber:0"

/obj/structure/hivedecor/xenos/autolathe
	name = "xenos autolathe"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "autolathe_t"

/obj/structure/hivedecor/xenos/vat
	name = "xenos machine"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "vat"

/obj/structure/hivedecor/xenos/processor
	name = "xenos machine"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "processor_off"

/obj/structure/hivedecor/xenos/processor/substrate
	icon_state = "substrate_off"

/obj/structure/hivedecor/xenos/processor/cpu
	icon_state = "CPU"

/obj/structure/hivedecor/xenos/processor/int
	icon_state = "int_processor_off"

/obj/structure/hivedecor/xenos/processor/console
	icon_state = "console"

/obj/structure/hivedecor/xenos/processor/time
	icon_state = "time"

/obj/structure/hivedecor/xenos/processor/toggle
	icon_state = "toggle"

/obj/structure/hivedecor/xenos/processor/cracker
	icon_state = "cracker"

/obj/structure/hivedecor/floodlight
	name = "floodlight" // does not create light. use with an invisible light source
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "flood01"

/obj/structure/hivedecor/xenos/terminal
	name = "xenos terminal"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "frame_med"

/obj/structure/hivedecor/xenos/powergen
	name = "xenos generator"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "generator"

/obj/structure/hivedecor/xenos/powergen/on
	name = "xenos generator"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "generator_on"

/obj/structure/hivedecor/xenos/artifact
	name = "xenos artifact"
	desc = "Death is not the end."
	icon = 'icons/map_project/port/marker_giant.dmi'
	icon_state = "marker_giant_active_anim"

/obj/structure/hivedecor/xenos/artifact/teleporter
	name = "xenos teleporter"
	desc = "Death is not the end."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "pad"

/obj/structure/hivedecor/xenos/artifact/teleporter/active
	icon_state = "pad_active"

/obj/structure/hivedecor/xenos/artifact/node
	name = "xenos harvester"
	desc = "..."
	icon = 'icons/map_project/port/resources_64x64.dmi'
	icon_state = "node_combined_xeno"

/obj/structure/hivedecor/xenos/artifact/teslatower
	name = "tesla coil"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "teslatower"

/obj/structure/hivedecor/xenos/artifact/fuelpump
	name = "rhizomatic pump"
	desc = "..."
	icon = 'icons/map_project/port/objective.dmi'
	icon_state = "fuelpump"

/obj/structure/hivedecor/xenos/artifact/node2
	name = "xenos harvester"
	desc = "..."
	icon = 'icons/map_project/port/resources_64x64.dmi'
	icon_state = "node_combined_marine"

/obj/structure/hivedecor/xenos/artifact/node3
	name = "xenos harvester"
	desc = "..."
	icon = 'icons/map_project/port/resources_64x64.dmi'
	icon_state = "node_on"

/obj/structure/hivedecor/xenos/artifact/megaweapon
	name = "???"
	desc = "..."
	icon = 'icons/map_project/port/artillery.dmi'
	icon_state = "1"

/obj/structure/hivedecor/xenos/artifact/bluespacedrive
	name = "???"
	desc = "..."
	icon = 'icons/map_project/port/bluespacedrive.dmi'
	icon_state = "bsd_core"

/obj/structure/hivedecor/xenos/artifact/bluespacedrive/broken
	name = "???"
	desc = "..."
	icon_state = "bsd_core_broken"

/obj/structure/hivedecor/xenos/artifact/bluespacedrive/core
	name = "???"
	desc = "..."
	icon_state = "bsd_c_s"

/obj/structure/hivedecor/xenos/artifact/supermatter
	name = "???"
	desc = "..."
	icon = 'icons/map_project/port/supermatter.dmi'
	icon_state = "supermatter_glow"

/obj/structure/hivedecor/xenos/artifact/gateway // top part of gateway. starts off.
	name = "???"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "offcenter"

/obj/structure/hivedecor/xenos/artifact/gateway/on
	name = "???"
	desc = "..."
	icon_state = "oncenter"

/obj/structure/hivedecor/xenos/artifact/gateway/base
	name = "???"
	desc = "..."
	icon_state = "on"

/obj/structure/hivedecor/xenos/barrel
	name = "chemical barrel"
	desc = "..."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "barrel_blue"

/obj/structure/hivedecor/xenos/barrel/green
	icon_state = "barrel_green"

/obj/structure/hivedecor/xenos/barrel/red
	icon_state = "barrel_red"

/obj/structure/hivedecor/xenos/barrel/yellow
	icon_state = "barrel_yellow"

/obj/structure/hivedecor/xenos/barrel/white
	icon_state = "barrel_white"

/obj/structure/hivedecor/xenos/barrelmany
	name = "chemical barrel yard"
	desc = "..."
	icon = 'icons/map_project/port/barrel_yard.dmi'
	icon_state = "pile"
	density = 0

// Racks, crates and tables
/obj/structure/table/rack/xenos
	name = "strange rack"
	desc ="An organic xenos resin seemss to be growing from the metal."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "rack"

/obj/structure/closet/crate/xenos
	name = "secure crate"
	desc = "A xenos secure crate."
	icon = 'icons/map_project/port/objects.dmi'
	icon_state = "secure_crate"
	icon_opened = "secure_crate2"
	icon_closed = "secure_crate"

/obj/structure/closet/crate/xenos/chest
	name = "secure chest"
	desc = "A xenos secure chest."
	icon_state = "chest"
	icon_opened = "chest2"
	icon_closed = "chest"

/obj/structure/closet/crate/xenos/chest2
	name = "secure chest"
	desc = "A xenos secure chest."
	icon_state = "chest_white"
	icon_opened = "chest_white2"
	icon_closed = "chest_white"

/obj/structure/closet/crate/xenos/chest3
	name = "secure chest"
	desc = "A xenos secure chest."
	icon_state = "crate_ds_blue1"
	icon_opened = "crate_ds_blue1_open"
	icon_closed = "crate_ds_blue1"

/obj/structure/closet/crate/xenos/droppod
	name = "xenos drop pod"
	desc = "An ancient xenos drop pod."
	icon = 'icons/map_project/port/droppod_32x64.dmi'
	icon_state = "techpod_closed"
	icon_opened = "techpod_open"
	icon_closed = "techpod_closed"

/obj/structure/closet/crate/secure/safe
	name = "secure safe"
	desc = "A secure safe."
	icon = 'icons/map_project/port/structures.dmi'
	icon_state = "safe"
	icon_opened = "safe-open"
	icon_closed = "safe"
	anchored = 1

/obj/structure/closet/crate/secure/floorsafe
	name = "secure safe"
	desc = "A secure safe."
	icon = 'icons/map_project/port/structures.dmi'
	icon_state = "floorsafe"
	icon_opened = "floorsafe-open"
	icon_closed = "floorsafe"
	anchored = 1
	density = 0

// NECRON TOMB - An old mechanicus outpost that was manned by penal units and mechanicus priest studying a tomb, they've been out of contact for several months

/turf/unsimulated/floor/necron_floor
	icon = 'icons/map_project/tombs.dmi'
	icon_state = "floor"

/mob/living/simple_animal/hostile/necron
	name = "Necron Warrior"
	desc = "A souless automaton who's only wish is to see you dead now."
	icon = 'icons/cadia-sprites/mob/necron.dmi'
	icon_state = "necron"
	icon_living = "necron"
	icon_dead = "necron_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 35
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 5 // Slower but deadilier
	stop_automated_movement_when_pulled = 0
	maxHealth = 550
	health = 550
	harm_intent_damage = 45
	melee_damage_lower = 55
	melee_damage_upper = 55
	wander = 1
	see_in_dark = 6
	attacktext = "stabbed"
	a_intent = I_HURT
	environment_smash = 1
	faction = "Necron"
	status_flags = CANPUSH

	ranged = 1
	rapid = 0
	projectilesound = 'sound/effects/meteorimpact.ogg'
	projectiletype = /obj/item/projectile/necrongauss


// I had to make a new projectile since the gauss one instantly kills players so here it is.

/obj/item/projectile/necrongauss
	name = "Gauss"
	icon_state = "emitter"
	fire_sound = 'sound/effects/meteorimpact.ogg' //Bass-y sound of firing
	damage = 40
	damage_type = BURN
	agony = 30
	check_armour = "energy"
	animate_movement = 1
	penetrating = 55
	armor_penetration = 21

/obj/machinery/door/unpowered/necron_door1
	icon = 'icons/obj/doors/necron_door.dmi'
	name = "necron door"
	desc = "An old ancient door, cold to the touch and highly resilient to any attack."
	icon_state = "door1"
	maxhealth = 8000 // Suffer
	opacity = 0
	req_access = list(access_necron1)

/obj/machinery/door/unpowered/necron_door2
	icon = 'icons/obj/doors/necron_door.dmi'
	name = "necron door"
	desc = "An old ancient door, cold to the touch and highly resilient to any attack."
	color = "blue"
	icon_state = "door1"
	maxhealth = 8000 // Suffer
	opacity = 0
	req_access = list(access_necron2)

/obj/machinery/door/unpowered/necron_door3
	icon = 'icons/obj/doors/necron_door.dmi'
	name = "necron door"
	color = "red"
	desc = "An old ancient door, cold to the touch and highly resilient to any attack."
	icon_state = "door1"
	maxhealth = 8000 // Suffer
	opacity = 0
	req_access = list(access_necron3)

/////

/obj/item/card/id/key/super/necron_site1 // Opens the main gate leading to the necron tomb
	name = "Archeology Site Keycard"
	desc = "A keycard used to access the archeological site entrace, restricted to mechanicus and the guest only."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "id_ship"
	access = list(access_necron1)

/var/const/access_necron1 = 7675
/datum/access/necron1
	id = access_necron1
	desc = "Archeology Site Access" // Main Entrace

/////

/obj/item/card/id/key/super/necron_site2 // Opens areas in the tomb
	name = "Blue Glowing Slab"
	desc = "An slab with an odd blue color."
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	icon_state = "dev111"
	color = "blue"
	access = list(access_necron2)


/var/const/access_necron2 = 7676
/datum/access/necron2
	id = access_necron2
	desc = "Necron Tomb Access - Blue" // 2nd Area

/////

/obj/item/card/id/key/super/necron_site3 // Opens the main gate leading to the necron tomb
	name = "Red Glowing Slab"
	desc = "An slab with an odd red color."
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	icon_state = "dev111"
	color = "red"
	access = list(access_necron3)

/var/const/access_necron3 = 7677
/datum/access/necron3
	id = access_necron3
	desc = "Necron Tomb Access - Red" // Loot Area

/obj/item/fluff_items/necron
	name = "necron artifact"
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	desc = "A necron artifact, what it does is unknown to you and many, the rouge trader could be interested on this."
	icon_state = "dev121"
	w_class = ITEM_SIZE_HUGE
	sales_price = 40

/obj/item/fluff_items/necron1
	name = "necron artifact"
	desc = "A necron artifact, what it does is unknown to you and many, the rouge trader could be interested on this."
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	icon_state = "ndev51"
	w_class = ITEM_SIZE_HUGE
	sales_price = 40

/obj/item/fluff_items/necron2
	name = "necron artifact"
	desc = "A necron artifact, what it does is unknown to you and many, the rouge trader could be interested on this."
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	icon_state = "dev151"
	w_class = ITEM_SIZE_HUGE
	sales_price = 40

/obj/item/fluff_items/necron3
	name = "necron artifact"
	desc = "A necron artifact, what it does is unknown to you and many, the rouge trader could be interested on this."
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	icon_state = "dev131"
	w_class = ITEM_SIZE_HUGE
	sales_price = 40

/obj/item/fluff_items/necron4
	name = "necron artifact"
	desc = "A necron artifact, what it does is unknown to you and many, the rouge trader could be interested on this."
	icon = 'icons/cadia-sprites/migrated2/artifacts.dmi'
	icon_state = "dev181"
	w_class = ITEM_SIZE_HUGE
	sales_price = 85

// CONTESTED FORTRESS - A fortress in the east of the planet, under siege from Chaos and the guard trying to retake it.

/obj/structure/hivedecor/chimera_wreck
	name = "Chimera Wreck"
	desc = "The wreck of a chimera, between the fire having burned most electronics possibly and the hull being damaged beyond repair, this wont be fixed nor salvageable."
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "chimera_wreckage"

/obj/structure/hivedecor/gun_rack
	name = "Equipment Rack"
	desc = "A rack of weapons used by the Imperial guard, time, lack of care, and corrosion has set on this equipment and is now unusable."
	icon = 'icons/map_project/gunrack.dmi'
	icon_state = "gr_4"

/obj/structure/hivedecor/sentinel
	name = "Imperial Guard Sentinel"
	desc = "An imperial guard sentinel, often used for recon missions and supporting ground troops, without the proper key authorization its be impossible to enter."
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "sentinel2"

/obj/structure/hivedecor/hydra_gun
	name = "Hydra Platform"
	desc = "A large anti-air weapon able to take down most enemies on the sky if manned properly, this one seems to have been used for years and mantained properly."
	icon = 'icons/map_project/anti_air.dmi'
	icon_state = "type96"

/obj/item/fluff_items/ammo_crate
	name = "Ammo Crate"
	desc = "A large ammo crate that would require heavy duty equipment to be opened, mainly filled with ammunition for many imperial vehicles or guns."
	icon = 'icons/map_project/ammostuff.dmi'
	icon_state = "crate_closed"
	w_class = ITEM_SIZE_HUGE

// CRASHED VALKYRIE - A Valkyrie carrying special equipment and an object has been lost somewhere on a valley near the Hive.

/turf/unsimulated/floor/sand
	name = "sand"
	icon = 'icons/turf/desert.dmi'
	icon_state = "desert"

/turf/unsimulated/floor/valk_floor
	icon = 'icons/map_project/valkyrie.dmi'
	icon_state = "3"

/turf/unsimulated/wall/valk_wall
	icon = 'icons/map_project/valkyrie.dmi'
	icon_state = "1"

/mob/living/simple_animal/hostile/syndicate/mercenary
	name = "Mercenary"
	real_name = "Grey Lance Mercenary Soldier"
	desc = "A mercenary that appears to be wearing modified guard armor, judging by their looks, they're battle hardened."
	icon_state = "merc_standart"
	icon = 'icons/map_project/creatures.dmi'
	icon_living = "merc_standart"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 35
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 3 // Their speed is low to prevent them from charging into melee range immediately.
	stop_automated_movement_when_pulled = 0
	maxHealth = 250
	health = 250
	harm_intent_damage = 15
	melee_damage_lower = 15
	melee_damage_upper = 20
	wander = 1
	see_in_dark = 6
	attacktext = "stabbed"
	a_intent = I_HURT
	unsuitable_atoms_damage = 15
	environment_smash = 1
	faction = "Mercenary"
	status_flags = CANPUSH
	ranged = 1
	rapid = 1
	projectilesound = 'sound/weapons/gunshot/gunshot3.ogg'
	projectiletype = /obj/item/projectile/bullet/rifle

/mob/living/simple_animal/hostile/syndicate/mercenary/death()
	..(null, "body beeps before it explodes!")
	new /obj/effect/decal/cleanable/blood/gibs/core(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/syndicate/mercenary/scout
	name = "Mercenary Scout"
	real_name = "Grey Lance Mercenary Scout"
	desc = "A mercenary that appears to be wearing modified guard armor, judging by their looks, they're battle hardened. This one seems to be an scout"
	icon_state = "merc_scout"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	maxHealth = 175
	health = 175
	speed = 1

	projectilesound = 'sound/weapons/lasgun.ogg'
	projectiletype = /obj/item/projectile/beam

/mob/living/simple_animal/hostile/syndicate/mercenary/machinegunner
	name = "Mercenary Machinegunner"
	real_name = "Grey Lance Mercenary Machinegunner"
	desc = "A mercenary that appears to be wearing modified guard armor, judging by their looks, they're battle hardened. This one seems to be carrying a light machinegun."
	icon_state = "merc_machinegunner"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	maxHealth = 200
	health = 200
	speed = 1

	projectilesound = 'sound/weapons/gunshot/auto1.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol/medium

/mob/living/simple_animal/hostile/syndicate/mercenary/leader
	name = "Mercenary Sergeant"
	real_name = "Grey Lance Mercenary Squad Leader"
	desc = "A mercenary that appears to be wearing modified guard armor, judging by their looks, they're battle hardened. This one seems to be an officer."
	icon_state = "merc_leader"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	maxHealth = 325
	health = 325
	speed = 1

	projectilesound = 'sound/weapons/gunshot/auto5.ogg'
	projectiletype = /obj/item/projectile/bullet/pistol/strong/revolver/ap

/obj/item/clothing/suit/armor/aascout/br
	name = "Blood Raven Scout's Carapace"
	desc = "The sturdy armour, issued to Adeptus Astartes Scouts for their service until they prove themselves worthy to become full-fledged Battlebrothers."
	icon_state = "fharmor"
	item_state = "fharmor"
	color = "red"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 55, laser = 60, energy = 30, bomb = 40, bio = 10, rad = 10)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_SCOUT)

/decl/hierarchy/outfit/brscout
	name = OUTFIT_JOB_NAME("Blood Raven Scout")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/aascout/br
	head = null
	id_type = null
	pda_type = null
	pda_slot = null
	back = null
	shoes = /obj/item/clothing/shoes/combat
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = null
	r_ear = null

/obj/effect/landmark/corpse/brscout
	name = "Dead Blood Raven Scout"
	species = list(SPECIES_SCOUT)
	corpse_outfits = list(/decl/hierarchy/outfit/brscout)

// Evil Sentinel

/mob/living/simple_animal/hostile/syndicate/ranged/sentinel
	name = "Heretical Sentinel"
	desc = "A sentinel that was once used in the Imperial guard's arsenal, this one has been painted in red and the pilot hates the Emperor."
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "sentinel2"
	icon_living = "sentinel2"
	icon_dead = "sentdestroyed"
	color = "red"
	maxHealth = 1500
	health = 1500
	speed = 4

	ranged = 1
	rapid = 1
	projectilesound = 'sound/weapons/lasgun.ogg'
	projectiletype = /obj/item/projectile/beam

/*

Civilians, Wounded, and other non combat personnel will be placed here, MOBs's with very little HP that if brought to a landmark (which i gotta ask
rav to help me code) will reward the player with thrones, aka escort mission with reward - Graf

*/

/mob/living/simple_animal/civilians
	name = "Civilian"
	desc = "A civilian that is unarmed and with no way to defend itself, <font color='red'>Very weak and cannot defend itself, bring them to the extraction point ALIVE for rewards.</font>"
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "guard_wounded1"
	icon_living = "guard_wounded1"
	icon_dead = "traitorguard1_dead"
	speak_chance = 0
	maxHealth = 55
	health = 55
	turns_per_move = 55
	speak_emote = list("groans in pain")
	emote_hear = list("grunts in pain")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "punches"
	attacktext = "punches"
	wander = 0 // Not gonna go anywhere unless pulled
	see_in_dark = 6
	speed = 1

/mob/living/simple_animal/civilians/civ2
	icon_state = "guard_wounded2"
	icon_living = "guard_wounded2"
	icon_dead = "guard_wounded2d"

/mob/living/simple_animal/civilians/civ3
	icon_state = "guard_wounded3"
	icon_living = "guard_wounded3"
	icon_dead = "guard_wounded3d"

/mob/living/simple_animal/civilians/civ4
	icon_state = "guard_wounded4"
	icon_living = "guard_wounded4"
	icon_dead = "guard_wounded4d"

/mob/living/simple_animal/civilians/civ5
	icon_state = "guard_wounded5"
	icon_living = "guard_wounded5"
	icon_dead = "guard_wounded5d"

/mob/living/simple_animal/civilians/civ6
	icon_state = "guard_wounded6"
	icon_living = "guard_wounded6"
	icon_dead = "guard_wounded6"

/mob/living/simple_animal/civilians/priority
	name = "Important Civilian"
	desc = "A civilian that is unarmed and with no way to defend itself, <i>this one seems to be important due their noble status</i><font color='red'>Very weak and cannot defend itself, bring them to the extraction point ALIVE for rewards.</font>"
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "civilian_rich"
	icon_living = "civilian_rich"
	icon_dead = "civilian_richd"
	speak_chance = 0
	maxHealth = 75
	health = 75
	turns_per_move = 55
	speak_emote = list("throws a tantrum")
	emote_hear = list("complains about tax money going to useless guardsmen", "complains about the lack of attention")

/mob/living/simple_animal/civilians/priority/priority1
	icon_state = "civilian_rich_f"
	icon_living = "civilian_rich_f"
	icon_dead = "civilian_rich_fd"

/mob/living/simple_animal/civilians/priority/pilot
	name = "Stranded Imperial Guard Pilot"
	desc = "An Imperial Guard pilot that is unarmed and with no way to defend himself,<i>they should be recovered and brought back to the extraction point</i><font color='red'>Very weak and cannot defend itself, bring them to the extraction point ALIVE for rewards.</font>"
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "crashed_pilot"
	icon_living = "crashed_pilot"
	icon_dead = "crashed_pilotd"
	speak_chance = 0
	maxHealth = 75
	health = 75
	turns_per_move = 55
	speak_emote = list("groans in pain")
	emote_hear = list("grunts in pain")

/mob/living/simple_animal/hostile/pony
	name = "magical pony"
	desc = "Friendship is MAGIC, also deadly."
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "friendship_is_magical"
	icon_living = "friendship_is_magical"
	pass_flags = PASS_FLAG_TABLE
	health = 255
	maxHealth = 255
	melee_damage_lower = 45
	melee_damage_upper = 45
	attacktext = "cut"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = "chaos"
	min_gas = null
	max_gas = null
	minbodytemp = 0


/mob/living/simple_animal/hostile/pony/death()
	var/obj/O

	//shards
	O = new /obj/effect/decal/cleanable/poo(src.loc)
	step_to(O, get_turf(pick(view(7, src))))
	if(prob(75))
		O = new /obj/effect/decal/cleanable/flour(src.loc)
		step_to(O, get_turf(pick(view(7, src))))
	if(prob(50))
		O = new /obj/effect/decal/cleanable/flour(src.loc)
		step_to(O, get_turf(pick(view(7, src))))
	if(prob(25))
		O = new /obj/effect/decal/cleanable/poo(src.loc)
		step_to(O, get_turf(pick(view(7, src))))



/*

All of the content below has been scrapped or going to be unused for a few reasons (not being 'fitting', outright unecessary and tests aswell on
some stuff - Graf

/mob/living/simple_animal/hostile/syndicate/guard
	name = "Kriegsman" // Like the Traitor guard basically.
	desc = "Loves the Imperium of man, will gun down anything heretical."
	icon_state = "krieger"
	icon = 'icons/map_project/creatures.dmi'
	icon_living = "krieger"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 35
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 3 // Their speed is low to prevent them from charging into melee range immediately.
	stop_automated_movement_when_pulled = 0
	maxHealth = 250
	health = 250
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 20
	wander = 1
	see_in_dark = 6
	attacktext = "stabbed"
	a_intent = I_HURT
	unsuitable_atoms_damage = 15
	environment_smash = 1
	// faction = "Chaos" - Disabled till i can find the right faction.
	status_flags = CANPUSH

	ranged = 1
	rapid = 1
	projectilesound = 'sound/weapons/lasgun.ogg'
	projectiletype = /obj/item/projectile/beam

/mob/living/simple_animal/hostile/syndicate/word_bearer
	name = "Word Bearer"
	desc = "A terrifying, tall, and dangerous chaos space marine, this one is armed with a bolter."
	icon = 'icons/map_project/marine_pack/chaos_chapters.dmi'
	icon_state = "word_bearer"
	icon_living = "word_bearer"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	turns_per_move = 25
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 3 // Their speed is low to prevent them from charging into melee range immediately.
	stop_automated_movement_when_pulled = 0
	maxHealth = 950
	health = 950
	harm_intent_damage = 45
	melee_damage_lower = 65
	melee_damage_upper = 65
	wander = 1
	see_in_dark = 6
	attacktext = "stabbed"
	a_intent = I_HURT
	unsuitable_atoms_damage = 15
	environment_smash = 1
	faction = "Chaos"
	status_flags = CANPUSH
	ranged = 1
	rapid = 0
	projectilesound = 'sound/weapons/gunshot/loudbolt.ogg'
	projectiletype = /obj/item/projectile/bullet/bolterrifle

	speak_chance = 0

/mob/living/simple_animal/hostile/syndicate/word_bearer/specialist
	name = "Word Bearer Specialist"
	desc = "A terrifying, tall, and dangerous chaos space marine, this one has a heavy bolter..you're fucked"
	icon = 'icons/map_project/marine_pack/chaos_chapters.dmi'
	icon_state = "word_bearer_spec"
	icon_living = "word_bearer_spec"
	icon_dead = "traitorguard1_dead"

	ranged = 1
	rapid = 1
	projectilesound = 'sound/weapons/gunshot/loudbolt.ogg'
	projectiletype = /obj/item/projectile/bullet/bolterrifle

*/
