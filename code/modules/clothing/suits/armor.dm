obj/item/clothing/suit/armor
	allowed = list(/obj/item/gun/energy,/obj/item/device/radio,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = ITEM_FLAG_THICKMATERIAL
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

// New Vests

/obj/item/clothing/suit/armor/vest
	name = "armored vest"
	desc = "An armor vest made of synthetic fibers, only a plate tho."
	icon_state = "kvest"
	item_state = "armor"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 10, bio = 0, rad = 5)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "armor"

/obj/item/clothing/suit/storage/vest
	name = "webbed armor vest"
	desc = "A synthetic armor vest. This one has extra webbing and flak plates."
	icon_state = "webvest"
	armor = list(melee = 30, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 0, rad = 5)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	allowed = list(/obj/item/gun/energy,/obj/item/device/radio,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = ITEM_FLAG_THICKMATERIAL
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

/obj/item/clothing/suit/storage/vest/tactical //crack at a more balanced mid-range armor, minor improvements over standard vests, with the idea "modern" combat armor would focus on energy weapon protection.
	name = "tactical armored vest"
	desc = "A heavy armored vest in a fetching tan. It is surprisingly flexible and light, even with the extra webbing and advanced ceramic plates."
	icon_state = "tacwebvest"
	item_state = "tacwebvest"
	armor = list(melee = 35, bullet = 45, laser = 46, energy = 40, bomb = 60, bio = 0, rad = 5)

/obj/item/clothing/suit/storage/vest/merc
	name = "heavy combat armor"
	desc = "A high-quality armored vest made from a hard synthetic material. It is surprisingly flexible and light, despite formidable armor plating."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	armor = list(melee = 48, bullet = 50, laser = 40, energy = 10, bomb = 20, bio = 0, rad = 10)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS //now covers legs with new sprite
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS

// Modular plate carriers

/obj/item/clothing/suit/armor/pcarrier
	name = "plate carrier"
	desc = "A lightweight black plate carrier vest. It can be equipped with armor plates, but provides no protection of its own."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/modular_armor.dmi')
	icon_state = "pcarrier"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_C, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L, ACCESSORY_SLOT_ARMOR_S, ACCESSORY_SLOT_ARMOR_M)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_C, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L, ACCESSORY_SLOT_ARMOR_S)
	blood_overlay_type = "armor"

/obj/item/clothing/suit/armor/pcarrier/light
	starting_accessories = list(/obj/item/clothing/accessory/armorplate)

/obj/item/clothing/suit/armor/pcarrier/light/nt
	starting_accessories = list(/obj/item/clothing/accessory/armorplate, /obj/item/clothing/accessory/armor/tag/nt)

/obj/item/clothing/suit/armor/pcarrier/light/press
	starting_accessories = list(/obj/item/clothing/accessory/armorplate, /obj/item/clothing/accessory/armor/tag/press)

/obj/item/clothing/suit/armor/pcarrier/medium
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/suit/armor/pcarrier/medium/nt
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/nt)

/obj/item/clothing/suit/armor/pcarrier/blue
	name = "blue plate carrier"
	desc = "A lightweight blue plate carrier vest. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_blue"

/obj/item/clothing/suit/armor/pcarrier/green
	name = "green plate carrier"
	desc = "A lightweight green plate carrier vest. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_green"

/obj/item/clothing/suit/armor/pcarrier/navy
	name = "navy plate carrier"
	desc = "A lightweight navy blue plate carrier vest. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_navy"

/obj/item/clothing/suit/armor/pcarrier/tan
	name = "tan plate carrier"
	desc = "A lightweight tan plate carrier vest. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_tan"

/obj/item/clothing/suit/armor/pcarrier/tan/tactical
	name = "tactical plate carrier"
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/tactical, /obj/item/clothing/accessory/storage/pouches/large/tan)
/obj/item/clothing/suit/armor/pcarrier/merc
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/merc, /obj/item/clothing/accessory/armguards/merc, /obj/item/clothing/accessory/legguards/merc, /obj/item/clothing/accessory/storage/pouches/large)

// Modular specialty armor

/obj/item/clothing/suit/armor/riot
	name = "riot vest"
	desc = "An armored vest with heavy padding to protect against melee attacks."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/modular_armor.dmi')
	icon_state = "riot"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, bullet = 40, laser = 40, energy = 10, bomb = 60, bio = 10, rad = 20)
	siemens_coefficient = 0.5
	starting_accessories = list(/obj/item/clothing/accessory/armguards/riot, /obj/item/clothing/accessory/legguards/riot)

/obj/item/clothing/suit/armor/bulletproof
	name = "ballistic vest"
	desc = "An armored vest with special high quality flak armor plates to protect against ballistic projectiles."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/modular_armor.dmi')
	icon_state = "ballistic"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 10, bullet = 48, laser = 40, energy = 10, bomb = 25, bio = 0, rad = 0)
	siemens_coefficient = 0.7
	starting_accessories = list(/obj/item/clothing/accessory/armguards/ballistic, /obj/item/clothing/accessory/legguards/ballistic)
/obj/item/clothing/suit/armor/bulletproof/vest //because apparently some map uses this somewhere and I'm too lazy to go looking for and replacing it.
	starting_accessories = null

/obj/item/clothing/suit/armor/laserproof
	name = "ablative vest"
	desc = "An armored vest with advanced shielding to protect against energy weapons."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/modular_armor.dmi')
	icon_state = "ablative"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 10, bullet = 20, laser = 75, energy = 50, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0
	starting_accessories = list(/obj/item/clothing/accessory/armguards/ablative, /obj/item/clothing/accessory/legguards/ablative)
/obj/item/clothing/suit/armor/laserproof/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile/energy) || istype(damage_source, /obj/item/projectile/beam))
		var/obj/item/projectile/P = damage_source
		var/reflectchance = 40 - round(damage/3)
		if(!(def_zone in list(BP_CHEST, BP_GROIN))) //not changing this so arm and leg shots reflect, gives some incentive to not aim center-mass
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message("<span class='danger'>\The [user]'s [src.name] reflects [attack_text]!</span>")
			// Find a turf near or on the original location to bounce to
			//var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			//var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			//var/turf/curloc = get_turf(user)
			// redirect the projectile
			//P.redirect(new_x, new_y, curloc, user)
			return PROJECTILE_CONTINUE // complete projectile permutation

//Reactive armor

/obj/item/clothing/suit/armor/reactive
	name = "reactive teleport armor"
	desc = "Someone separated our Research Director from their own head!"
	var/active = 0.0
	icon_state = "reactiveoff"
	item_state = "reactiveoff"
	blood_overlay_type = "armor"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
/obj/item/clothing/suit/armor/reactive/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1
/obj/item/clothing/suit/armor/reactive/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(50))
		user.visible_message("<span class='danger'>The reactive teleport system flings [user] clear of the attack!</span>")
		var/list/turfs = new/list()
		for(var/turf/T in orange(6, user))
			if(istype(T,/turf/space)) continue
			if(T.density) continue
			if(T.x>world.maxx-6 || T.x<6)	continue
			if(T.y>world.maxy-6 || T.y<6)	continue
			turfs += T
		if(!turfs.len) turfs += pick(/turf in orange(6))
		var/turf/picked = pick(turfs)
		if(!isturf(picked)) return
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, "sparks", 50, 1)
		user.loc = picked
		return PROJECTILE_FORCE_MISS
	return 0
/obj/item/clothing/suit/armor/reactive/attack_self(mob/user as mob)
	src.active = !( src.active )
	if (src.active)
		to_chat(user, "<span class='notice'>The reactive armor is now active.</span>")
		src.icon_state = "reactive"
		src.item_state = "reactive"
	else
		to_chat(user, "<span class='notice'>The reactive armor is now inactive.</span>")
		src.icon_state = "reactiveoff"
		src.item_state = "reactiveoff"
		src.add_fingerprint(user)
	return
/obj/item/clothing/suit/armor/reactive/emp_act(severity)
	active = 0
	src.icon_state = "reactiveoff"
	src.item_state = "reactiveoff"
	..()

/obj/item/clothing/suit/armor/sentry
	name = "Sentry Armor"
	desc = "Protects you very well from getting smacked, and decently well from getting shot."
	armor = list(melee = 45, bullet = 45, laser = 35, energy = 20, bomb = 20, bio = 10, rad = 10)//Beefy boys.
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	str_requirement = 18

/obj/item/clothing/suit/armor/flak/vest
	name = "light flak vest"
	desc = "An armored vest made from a light-weight layer of ablative and impact-absorbant materials. Cheap, lightweight, and reliable, but not as resistant as other armors."
	icon_state = "fvest"
	item_state = "fvest"
	armor = list(melee = 25, bullet = 30, laser = 25, energy = 15, bomb = 35, bio = 0, rad = 5)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

// Tau

/obj/item/clothing/suit/armor/fwarmor
	name = "fire warrior armor"
	desc = "The impeccable yellow and brown armor of the Tau warrior caste"
	icon_state = "fw_armor"
	item_state = "fw_armor"
	armor = list(melee = 55, bullet = 60, laser = 50, energy = 20, bomb = 25, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


// Ork

/obj/item/clothing/suit/armor/orkarmor
	name = "ork armor"
	desc = "Scavenged bitz to keep ya' krumpin' longa'!"
	icon_state = "ork_m_armor"
	item_state = "ork_m_armor"
	armor = list(melee = 15, bullet = 10, laser = 10, energy = 20, bomb = 25, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_HOLSTER)
	allowed = list(/obj/item/gun/projectile/ork/automatic/shoota, /obj/item/material/sword/choppa)
	blood_overlay_type = "armor"
	canremove = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/orkarmor/two
	icon_state = "bondagearmor"
	item_state = "bondagearmor"

/obj/item/clothing/suit/armor/orkarmor/three
	icon_state = "potarmor"
	item_state = "potarmor"

/obj/item/clothing/suit/armor/orkarmor/four
	icon_state = "snazzarmor"
	item_state = "snazzarmor"

/obj/item/clothing/suit/armor/orkarmor/five
	icon_state = "armLskull"
	item_state = "armLskull"

/obj/item/clothing/suit/armor/orkarmor/five
	icon_state = "armRskull"
	item_state = "armRskull"

// NOBLES & SERVANTS
/obj/item/clothing/suit/armor/rtcloak
	name = "Rogue Trader's Cloak"
	desc = "The distinguished cloak of a Rogue Trader"
	icon_state = "lccoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 40, laser = 30, energy = 30, bomb = 10, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/rtdrip
	name = "Rogue Trader's Fancy Robes"
	desc = "The stylish robes of a Rogue Trader"
	icon_state = "rtdrip"
	item_state = "rtdrip"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 48, laser = 40, energy = 30, bomb = 10, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/slanclothing/femaleslan
	name = "Noble Red Dress"
	desc = "Elegant, fashionable, lavish!"
	icon_state = "baroness"
	item_state = "baroness"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/melee/whip/lashoftorment,)
	armor = list(melee = 40, bullet = 48, laser = 40, energy = 30, bomb = 10, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//// PILGRIMS

/obj/item/clothing/suit/storage/hooded/miner
	name = "Mining Robes"
	desc = "Black mining robes commonly worn by the nascent workers of underhives."
	icon_state = "mortician"
	item_state = "mortician"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun, /obj/item/pickaxe)
	armor = list(melee = 25, bullet = 5, laser = 0, energy = 5, bomb = 0, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/mininghood

/obj/item/clothing/suit/armor/slanclothing/maleslan
	name = "Studded Coat"
	desc = "An ellegant studded coat worn by the illustrious servants of noble courts."
	icon_state = "castellan"
	item_state = "castellan"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/melee/whip/lashoftorment,)
	armor = list(melee = 40, bullet = 48, laser = 40, energy = 30, bomb = 10, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/militia
	name = "Heavy Overcoat"
	desc = "A durable and heavy overcoat designed to protect against indirect blast and small arms fire."
	icon_state = "bluecoat"
	item_state = "bluecoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/melee/whip/lashoftorment,)
	armor = list(melee = 40, bullet = 45, laser = 25, energy = 20, bomb = 25, bio = 20, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/cloak
	name = "Mysterious Cloak"
	desc = "A tough black cloak made from animal leather."
	icon_state = "bluecoat_sniper"
	item_state = "bluecoat_sniper"
	armor = list(melee = 40, bullet = 35, laser = 25, energy = 10, bomb = 10, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/salvage
	name = "Reinforced Mining Suit"
	desc = "An old mining suit reinforced with metal plating and dense fibers."
	icon_state = "rig-excavation"
	item_state = "rig-excavation"
	armor = list(melee = 48, bullet = 48, laser = 35, energy = 40, bomb = 35, bio = 10, rad = 50)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/salvage/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1.0

/obj/item/clothing/suit/armor/cuirass
	name = "Plate Cuirass"
	desc = "An old cuirass reinforced with scrap metal plating and dense fabric."
	icon_state = "combat"
	item_state = "combat"
	armor = list(melee = 40, bullet = 30, laser = 40, energy = 40, bomb = 35, bio = 10, rad = 50)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/salvage/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1.5

/obj/item/clothing/suit/armor/explorer
	name = "Explorer Armor"
	desc = "Heavy explorer armor designed for long expeditions into the frontier."
	icon_state = "stealth_rig" // mob/suit.dmi
	item_state = "stealth_rig"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 48, bullet = 38, laser = 28, energy = 20, bomb = 30, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/explorer/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.6

/obj/item/clothing/suit/armor/guardsman/mercenary
	name = "Mercenary Flak Armour - Medium"
	desc = "An altered fabrication of Imperial Pattern Flak Armor - this particular version is commonly used by mercenaries guilds in service to the renegade houses of the frontier."
	icon_state = "merc" // mob/suit.dmi
	item_state = "merc"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 38, bullet = 48, laser = 48, energy = 20, bomb = 30, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/guardsman/mercenary/carapace
	name = "Mercenary Carapace Armour - Medium"
	desc = "An altered fabrication of Imperial Pattern Flak Armor - this particular version is commonly used by mercenaries guilds in service to the renegade houses of the frontier."
	icon_state = "explorer" // mob/suit.dmi
	item_state = "explorer"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 48, bullet = 58, laser = 58, energy = 20, bomb = 50, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/guardsman/mercenary/carapace/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/aascout
	name = "Adeptus Astartes Scout's Carapace"
	desc = "The sturdy armour, issued to Adeptus Astartes Scouts for their service until they prove themselves worthy to become full-fledged Battlebrothers."
	icon_state = "fharmor"
	item_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 60, bullet = 65, laser = 70, energy = 40, bomb = 40, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_SCOUT)

//// ADMINISTRATUM
/obj/item/clothing/suit/armor/bountyhunter
	name = "bounty hunter's armor"
	icon_state = "cadianarmor"
	item_state = "cadianarmor"
	armor = list(melee = 35, bullet = 30, laser = 30, energy = 25, bomb = 20, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/bountyhunter2
	name = "bounty hunter's armor"
	icon_state = "valhalla"
	item_state = "valhalla"
	armor = list(melee = 35, bullet = 30, laser = 30, energy = 25, bomb = 20, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/enforcer
	name = "Enforcer Patrol Armor - Medium"
	desc = "The flak armour worn by a Magistratum Enforcer. Light and robust in the colour blue, designed to protect against blast and small arms fire."
	icon_state = "Judge"
	item_state = "Judge"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 40, laser = 30, energy = 25, bomb = 30, bio = 20, rad = 20) //almost as strong as carapace armor, bruhv
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/enforcer/arbitrator
	name = "Enforcer Patrol Armour - Arbitrator"
	desc = "The flak armour worn by a Magistratum Arbitrator. Light and robust in the colour blue, designed to protect against blast and small arms fire."
	armor = list(melee = 48, bullet = 55, laser = 60, energy = 35, bomb = 60, bio = 30, rad = 30)

//// ASTRA MILITARUM
/obj/item/clothing/suit/armor/guardsman
	name = "Cadian Pattern Flak Armour - Medium"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it standard configuration."
	icon_state = "farmor"
	item_state = "farmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 45, laser = 35, energy = 20, bomb = 30, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/guardsman/carapace
	name = "Cadian Pattern Flak Armour - Carapace"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. this one is padded with Carapace plates, giving it better protection than average Flak Armour."
	icon_state = "fharmor"
	item_state = "fharmor"
	armor = list(melee = 48, bullet = 58, laser = 48, energy = 30, bomb = 40, bio = 10, rad = 20)
/obj/item/clothing/suit/armor/guardsman/carapace/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.6

/obj/item/clothing/suit/armor/guardsman/bloodpact
	name = "Khornate Armor"
	desc = "War torn and suited to savage needs. This is the armor of a khornate warrior. It has certainly seen blood flown upon it."
	icon_state = "bloodpactarmor"
	item_state = "bloodpactarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 45, laser = 35, energy = 20, bomb = 30, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/flak/heavy
	name = "Cadian Pattern Flak Armour - Heavy"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it heavy configuration"
	icon_state = "fharmor"
	item_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 55, laser = 45, energy = 30, bomb = 40, bio = 10, rad = 20)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/flak/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.7

/obj/item/clothing/suit/armor/medicae
	name = "Cadian Pattern Medicae Flak Armour - Light"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it light configuration, bearing the Red Cross of a Combat Medicae."
	icon_state = "medicae"
	item_state = "medicae"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 45, laser = 35, energy = 20, bomb = 30, bio = 40, rad = 30)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/medicae/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1

/obj/item/clothing/suit/armor/whiteshield
	name = "Cadian Pattern Conscript Flak Armour - Light"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it light configuration, issued to the Whiteshields."
	icon_state = "wshield"
	item_state = "wshield"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 35, laser = 30, energy = 20, bomb = 30, bio = 40, rad = 30)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/medicae/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1

/obj/item/clothing/suit/armor/catachan
	name = "Catachan Flak Vest"
	desc = "Unlike the common Cadian folks or famous Krieg guardsmen, the Catachans only wear their lightly protected Flak vest to protect their hairy masculine chests against bruises and sharpnels." // uh... yes, I know how it sounds
	icon_state = "Catachan_Vest"
	item_state = "Catachan_Vest"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 60, bullet = 30, laser = 20, energy = 30, bomb = 20, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/CatachanVest/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1

/obj/item/clothing/suit/armor/valhallanarmor
	name = "Valhallan Overcoat"
	desc = "A thick, Fur great coat designed for Valhallan Ice warriors, it is thermally-insulated to protect against extreme cold weather conditions."
	icon_state = "valarmor"
	item_state = "valarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 45, laser = 40, energy = 20, bomb = 30, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/krieger
	name = "Krieg Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks."
	icon_state = "kriegcoat"
	item_state = "kriegcoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 42, bullet = 42, laser = 35, energy = 20, bomb = 40, bio = 80, rad = 80)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/krieger/grenadier
	name = "Krieg Grenadier Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks. This one has been plated with Carapace platings, making it extremely protective at the cost of mobility."
	icon_state = "grencoat"
	item_state = "grencoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 50, laser = 40, energy = 20, bomb = 50, bio = 80, rad = 80)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/krieger/grenadier/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1.5

/obj/item/clothing/suit/armor/cadiansgt
	name = "Cadian Sergeant's Flak Armour"
	desc = "The well-worn armor of an Cadian Regiment Sergeant, this one is padded with Caraspace plates, giving it better protection than average Guardsmen. It has the three-chevrons marked on it upper chest."
	icon_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 55, laser = 45, energy = 25, bomb = 45, bio = 10, rad = 30)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/cadiansgt/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/lieutenant
	name = "Cadian Lieutenant's Flak Armour"
	desc = "The well-worn armor of an Cadian Regiment Lieutenant, this one is padded with Caraspace plates, giving it better protection than average Guardsmen."
	icon_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 48, bullet = 58, laser = 48, energy = 28, bomb = 48, bio = 20, rad = 35)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/lieutenant/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/scion
	name = "Tempestus Scion's Carapace Armour"
	desc = "The black carapace body armor of the Tempestus Scion, this one has scorch marks and nicks covering it like a mural of carnage."
	icon_state = "storm"
	item_state = "storm"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 52, bullet = 62, laser = 54, energy = 28, bomb = 68, bio = 20, rad = 35)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/scion/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/catachansgt
	name = "Catachan Sergeant's Flak Vest"
	desc = "Unlike the common Cadian folks or famous Krieg guardsmen, the Catachans only wear their lightly protected Flak vest to protect their hairy masculine chests against bruises and sharpnels. The Imperial Aquila is engraved with the word 'Devil' on this one."
	icon_state = "Catachan_Vest"
	item_state = "Catachan_Vest"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 75, bullet = 35, laser = 25, energy = 25, bomb = 20, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/catachansgt/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1

/obj/item/clothing/suit/armor/valhallasgt
	name = "Valhallan Sergeant's Overcoat"
	desc = "Though indentical to the other standard Valhallan Guardsman, this one have it sleeves trimmed with red line and a white undershirt, representing their position as Sergeant."
	icon_state = "valarmor"
	item_state = "valarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 55, laser = 50, energy = 35, bomb = 35, bio = 20, rad = 30)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/kriegsgt
	name = "Krieg Watchmaster's Overcoat"
	desc = "A ornated uniform with silver-trimming and red waffenfarbe by it collar. Worn by the senior-enlisted of the Krieg Regiment, The Watchmaster... It smells of saddeness and blood."
	icon_state = "kriegcoat"
	item_state = "kriegcoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 55, laser = 45, energy = 25, bomb = 45, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/commissar
	name = "Commissar's Trenchcoat"
	desc = "The Commissar's magnificent, charismatic that strikes dreads and fears into the mind of lowly Imperial Guardsmen and heretics alike. Plated in Caraspace, giving it much more protection than average Guardsman."
	icon_state = "Commissar4"
	item_state = "Commissar4"
	allowed = list(/obj/item/gun/projectile/bolter_pistol)
	armor = list(melee = 50, bullet = 56, laser = 40, energy = 25, bomb = 45, bio = 10, rad = 30)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/commissar/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/commissar/krieg
	name = "Commissar's Trenchcoat"
	desc = "The Commissar's iconic coat, this out tailored to match more of the uniform theme of the Officers of Krieg. Though the Krieg Guardsmen don't fear you, the others certainly will."
	icon_state = "Kriegissar"
	item_state = "Kriegissar"
	armor = list(melee = 50, bullet = 56, laser = 40, energy = 25, bomb = 45, bio = 100, rad = 100)

/obj/item/clothing/suit/armor/commissar/catachan
	name = "Commissar's Trenchjacket"
	desc = "What used to be a decorated and custom tailored coat of the Officio Prefectus is now crudely stripped of decoration and cut down to be lighter and more breathable for the jungles of Catachan, although, also padded to be more resistant to melee attacks. Though, wearing something like this out here is more of a power move."
	icon_state = "catacommissar"
	item_state = "catacommissar"
	armor = list(melee = 70, bullet = 35, laser = 25, energy = 25, bomb = 20, bio = 0, rad = 10)

// INQUISITION

/obj/item/clothing/suit/armor/agent/caraspace
	name = "Carapace Armour"
	desc = "The formidable, brillantly made Carapace Armour for the Inquistorial Agent, On it, bears the holy symbol of the Inquisition, The Rosette."
	icon_state = "inqcoat"
	item_state = "inqcoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 54, bullet = 58, laser = 54, energy = 30, bomb = 40, bio = 100, rad = 90)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/suit/armor/agent/coat
	name = "Carapace Coat"
	desc = "The formidable, brillantly made Caraspace Armour for the Inquistorial Agent, This one bears many holy seals along with it Rosette, to ward off the corruption of Chaos."
	icon_state = "acolytecoat"
	item_state = "acolytecoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 54, bullet = 58, laser = 54, energy = 30, bomb = 40, bio = 100, rad = 90)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/hooded/inquisitor
	name = "Mechanicus Power Armour"
	desc = "The Inquisitor's holy armour, forged by the Tech-priest of Mars for his use in his path of destruction toward enemies of our Emperor, Engraved the Inquisitorial Rosette, It shines brightly as if it is the Emperor himself is present, For he'll cleanse the darkness."
	icon_state = "inqarmor"
	item_state = "inqarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 72, bullet = 72, laser = 72, energy = 35, bomb = 60, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/inqhood
/obj/item/clothing/suit/storage/hooded/inquisitor/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1

/obj/item/clothing/suit/armor/ordohereticus
	name = "Armored Coat"
	desc = "The Inquisitor's holy coat, forged from a Tech-priest of Mars for his use in his path of holy fire toward enemies of our Emperor, Hanging from the coat a Inquisitorial Rosette, It shines brightly as if it is the Emperor himself is present, For he'll cleanse the darkness."
	icon_state = "hereticuscoat"
	item_state = "hereticuscoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 64, bullet = 64, laser = 60, energy = 20, bomb = 50, bio = 10, rad = 10) //walker here, i feel like i should give them more armor, but i wont touch this
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


// MECHANICUS
/obj/item/clothing/suit/storage/hooded/genetor
	name = "Magos Biologis robes"
	desc = "Green robes riddled with augments, scanners and syringes. The robes look incredibly old and worn, you can tell this magos has lived a long and scholarly life."
	icon_state = "genetor"
	item_state = "genetor"
	unacidable = 1
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun) //TODO make this more applicable to genetor
	armor = list(melee = 45, bullet = 45, laser = 70, energy = 40, bomb = 60, bio = 100, rad = 100) //while it is magos armor, it should be a bit weaker than the dominus armor
	canremove = 0
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/genehood
	canremove = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	unacidable = 1

/obj/item/clothing/suit/armor/slanclothing
	var/slan = 1

/obj/item/clothing/suit/storage/hooded/skitarii
	name = "Skitarii Armored Robes"
	desc = "Tailored and reinforced by the Adeptus Mechanicus, these sturdy and protective robes are being issued to Skitarii warriors."
	icon_state = "skitsuit"
	item_state = "skitsuit"
	canremove = 0
	unacidable = 1
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 60, bullet = 60, laser = 80, energy = 30, bomb = 60, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/skithood

/obj/item/clothing/suit/storage/hooded/genestealer
	name = "tyranid chitin"
	desc = "The hide of a Tyranid Genestealer"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
	icon_state = "gsfeet"
	item_state = "gsfeet"
	canremove = 0
	unacidable = 1
	species_restricted = list(SPECIES_TYRANID)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS

// ADEPTA SORORITAS
/obj/item/clothing/suit/sisterofbattle
	name = "Order of the Sacred Rose Power Armor"
	desc = "The Sacred and holy Power Armour adorned by Battle Sister of the Order Of The Sacred Rose, It's illuminate the field with it glorious light, Being near it make you feels safer and secured."
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 85, bullet = 85, laser = 80, energy = 90, bomb = 60, bio = 100, rad = 100) //its essentially light powerarmor, a bit weaker than assfartez.
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	canremove = 1
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/suit/sisterofbattle/training
	name = "Scholam Power Armor"
	desc = "The Ancient and Deconsecrated Power Armour adorned by Scholam Progena during their training in Eipharius' Monastarium. Stripped of almost all iconography and with damaged plating, this suit mainly serves to acclimatize the Progena for Heavy Armour but is still formidable and has legible scriptures across it's surface speaking of The Beatie and her crusade across the Sabbat worlds."
	icon_state = "ooml"
	item_state = "ooml"
	armor = list(melee = 55, bullet = 60, laser = 55, energy = 50, bomb = 60, bio = 100, rad = 50)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	canremove = 1
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/suit/sisterofbattle/sobrelic
	name = "Order of Our Martyred Lady's Primeval Chespiece"
	desc = "A primeval chestpiece of Adeptus Sororitas power armor, draped in the marks of the Order of Our Martyred Lady. It looks worn down, battle-hardened, and retired for good reason, yet it still radiates with holy energy."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "ooml"
	item_state = "ooml"
	armor = list(melee = 80, bullet = 80, laser = 90, energy = 90, bomb = 70, bio = 100, rad = 100) //it may be old, but its still a holy artifact
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	canremove = 1
	flags_inv = HIDEJUMPSUIT|HIDEGLOVES // bricked temporarily. people were abusing the shit out of it, can be used as an object in an imperial cult/heretic path thing. we can raise the armor values then later
	species_restricted = list(SPECIES_HUMAN)

// Eldar
/obj/item/clothing/suit/armor/eldar
  name = "Guardian Mesh Armor"
  desc = "A ancient armor. It looks like it's made from Thermoplas in a scale like pattern."
  icon_state = "eldarmor"
  item_state = "eldarmor"
  armor = list(melee = 50, bullet = 58, laser = 48, energy = 30, bomb = 40, bio = 100, rad = 20)
  cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET| ARMS | HANDS
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

// Dark Eldar
/obj/item/clothing/suit/armor/deldar
  name = "Ghost Plate Armor"
  desc = "A ancient armor. It looks as if made from hardened resin in a thin-scale like pattern. It cackles with electrical power."
  icon_state = "deldarmor"
  item_state = "deldarmor"
  armor = list(melee = 60, bullet = 60, laser = 60, energy = 70, bomb = 40, bio = 100, rad = 20)
  cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET| ARMS | HANDS
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
