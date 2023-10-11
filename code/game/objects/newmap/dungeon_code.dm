

/*

This file contains most of the code for the dungeons to work, structures, some items and mobs possibly - Graf

*/


// NECRON TOMB - An old mechanicus outpost that was manned by penal units and mechanicus priest studying a tomb, they've been out of contact for several months

/turf/unsimulated/floor/necron_floor
	icon = 'icons/map_project/tombs.dmi'
	icon_state = "floor"

/turf/unsimulated/wall/necron
	icon = 'icons/map_project/tombs.dmi'
	icon_state = "wall"

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
	maxHealth = 350
	health = 350
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
	armor_penetration = 55

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
	armor = list(melee = 60, bullet = 65, laser = 70, energy = 40, bomb = 40, bio = 10, rad = 10)
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
	icon_dead = "traitorguard1_dead"

/mob/living/simple_animal/civilians/civ3
	icon_state = "guard_wounded3"
	icon_living = "guard_wounded3"
	icon_dead = "traitorguard1_dead"

/mob/living/simple_animal/civilians/civ4
	icon_state = "guard_wounded4"
	icon_living = "guard_wounded4"
	icon_dead = "traitorguard1_dead"

/mob/living/simple_animal/civilians/civ5
	icon_state = "guard_wounded5"
	icon_living = "guard_wounded5"
	icon_dead = "traitorguard1_dead"

/mob/living/simple_animal/civilians/civ6
	icon_state = "guard_wounded6"
	icon_living = "guard_wounded6"
	icon_dead = "traitorguard1_dead"

/mob/living/simple_animal/civilians/priority
	name = "Important Civilian"
	desc = "A civilian that is unarmed and with no way to defend itself, <i>this one seems to be important due their noble status</i><font color='red'>Very weak and cannot defend itself, bring them to the extraction point ALIVE for rewards.</font>"
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "civilian_rich"
	icon_living = "civilian_rich"
	icon_dead = "traitorguard1_dead"
	speak_chance = 0
	maxHealth = 75
	health = 75
	turns_per_move = 55
	speak_emote = list("throws a tantrum")
	emote_hear = list("complains about tax money going to useless guardsmen", "complains about the lack of attention")

/mob/living/simple_animal/civilians/priority/priority1
	icon_state = "civilian_rich_f"
	icon_living = "civilian_rich_f"
	icon_dead = "traitorguard1_dead"

/mob/living/simple_animal/civilians/priority/pilot
	name = "Stranded Imperial Guard Pilot"
	desc = "An Imperial Guard pilot that is unarmed and with no way to defend himself,<i>they should be recovered and brought back to the extraction point</i><font color='red'>Very weak and cannot defend itself, bring them to the extraction point ALIVE for rewards.</font>"
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "crashed_pilot"
	icon_living = "crashed_pilot"
	icon_dead = "traitorguard1_dead"
	speak_chance = 0
	maxHealth = 75
	health = 75
	turns_per_move = 55
	speak_emote = list("groans in pain")
	emote_hear = list("grunts in pain")

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
