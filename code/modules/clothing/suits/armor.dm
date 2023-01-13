obj/item/clothing/suit/armor
	allowed = list(/obj/item/gun/energy,/obj/item/device/radio,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs)
	cold_protection = UPPER_TORSO|LOWER_TORSO
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
	sales_price = 15

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
	sales_price = 25

/obj/item/clothing/suit/storage/vest/tactical //crack at a more balanced mid-range armor, minor improvements over standard vests, with the idea "modern" combat armor would focus on energy weapon protection.
	name = "tactical armored vest"
	desc = "A heavy armored vest in a fetching tan. It is surprisingly flexible and light, even with the extra webbing and advanced ceramic plates."
	icon_state = "tacwebvest"
	item_state = "tacwebvest"
	armor = list(melee = 35, bullet = 45, laser = 46, energy = 40, bomb = 60, bio = 0, rad = 5)
	sales_price = 25

/obj/item/clothing/suit/storage/vest/merc
	name = "heavy combat armor"
	desc = "A high-quality armored vest made from a hard synthetic material. It is surprisingly flexible and light, despite formidable armor plating."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	armor = list(melee = 48, bullet = 50, laser = 40, energy = 10, bomb = 20, bio = 0, rad = 10)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS //now covers legs with new sprite
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	sales_price = 30

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
	sales_price = 40

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
	sales_price = 20

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
	sales_price = 25
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
	sales_price = 0
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
	sales_price = 25

/obj/item/clothing/suit/armor/flak/vest
	name = "light flak vest"
	desc = "An armored vest made from a light-weight layer of ablative and impact-absorbant materials. Cheap, lightweight, and reliable, but not as resistant as other armors."
	icon_state = "fvest"
	item_state = "fvest"
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 15, bomb = 15, bio = 0, rad = 5)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	sales_price = 15

// Tau

/obj/item/clothing/suit/armor/fwarmor
	name = "fire warrior armor"
	desc = "The impeccable yellow and brown armor of the Tau warrior caste"
	icon_state = "fw_armor"
	item_state = "fw_armor"
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 35, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 40


// Ork

/obj/item/clothing/suit/armor/orkarmor
	name = "'Eavy Metal Ork Armor"
	desc = "Scavenged 'eavy bitz to keep ya' krumpin' longa'!"
	icon_state = "ork_m_armor"
	item_state = "ork_m_armor"
	armor = list(melee = 40, bullet = 35, laser = 35, energy = 25, bomb = 25, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_HOLSTER)
	allowed = list(/obj/item/gun/projectile/ork, /obj/item/melee/sword/choppa)
	blood_overlay_type = "armor"
	canremove = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/orkarmor/snazzy
	name = "Snazzy Shoota Armor"
	desc = "Snazzy Armor of em ranged shoota boy types. Gud all rounda. Wat eva dat wurd means..."
	icon_state = "snazzya"
	item_state = "snazzya"
	armor = list(melee = 20, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/orkarmor/skullza
	name = "Orky Boy Skull Armor"
	desc = "Da armor of a real lova of humie skullz'. Dis Boy 'oves gettin' in klose kombat, it's defeenses help loads in da maylays!"
	icon_state = "ork_skullza"
	item_state = "ork_skullza"
	armor = list(melee = 35, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)


/obj/item/clothing/suit/armor/orkarmor/zog
	name = "Zogging Ork Boy Armor"
	desc = "Da buttom of de barrel, dis one. Won't protek ya much. Betta dun nuffin, me guesses..."
	icon_state = "zoga"
	item_state = "zoga"
	armor = list(melee = 15, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 0, rad = 0)


// NOBLES & SERVANTS
/obj/item/clothing/suit/armor/rtcloak
	name = "Rogue Trader's Cloak"
	desc = "The distinguished cloak of a Rogue Trader"
	icon_state = "lccoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 10, rad = 10) //Hidden armoured plates
	sales_price = 20
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS |ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/governor
	name = "Planetary Governor's Mantle"
	desc = "The extra, extra, extra large exotic mantle of the Governor of Eipharius. Custom tailor made for his superb frame. It is interwoven into his flesh and unremovable"
	icon_state = "taxstomach"
	item_state = "taxstomach"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 45, laser = 45, energy = 30, bomb = 10, bio = 10, rad = 10)
	canremove = 0
	sales_price = 60
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/rtdrip
	name = "Rogue Trader's Fancy Robes"
	desc = "The stylish robes of a Rogue Trader"
	icon_state = "rtdrip"
	item_state = "rtdrip"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 10, bio = 10, rad = 10) //Hidden armoured plates.
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/slanclothing/femaleslan
	name = "Noble Red Dress"
	desc = "Elegant, fashionable, lavish!"
	icon_state = "baroness"
	item_state = "baroness"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/melee/whip/lashoftorment,)
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 15, bomb = 10, bio = 10, rad = 10)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/preacher
	name = "Preacher's Gambeson"
	desc = "The gambeson chosen by the fanatical Frateris, Preachers and Fanatics of the ecclesiarchy"
	icon_state = "preacherarmor"
	item_state = "preacherarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 25, laser = 20, energy = 30, bomb = 10, bio = 10, rad = 10)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//// PILGRIMS

/obj/item/clothing/suit/storage/hooded/miner
	name = "Mining Robes"
	desc = "Black mining robes commonly worn by the nascent workers of underhives."
	icon_state = "mortician"
	item_state = "mortician"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun, /obj/item/pickaxe)
	armor = list(melee = 5, bullet = 5, laser = 0, energy = 5, bomb = 0, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/mininghood

/obj/item/clothing/suit/armor/slanclothing/maleslan
	name = "Studded Coat"
	desc = "An ellegant studded coat worn by the illustrious servants of noble courts."
	icon_state = "castellan"
	item_state = "castellan"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/melee/whip/lashoftorment,)
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/militia
	name = "Heavy Overcoat"
	desc = "A durable and heavy overcoat designed to protect against indirect blast and small arms fire."
	icon_state = "bluecoat"
	item_state = "bluecoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/melee/whip/lashoftorment,)
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 20, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/cloak
	name = "Mysterious Cloak"
	desc = "A tough black cloak made from animal leather."
	icon_state = "bluecoat_sniper"
	item_state = "bluecoat_sniper"
	armor = list(melee = 40, bullet = 35, laser = 25, energy = 10, bomb = 10, bio = 10, rad = 20)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/salvage
	name = "Reinforced Mining Suit"
	desc = "An old mining suit reinforced with metal plating and dense fibers."
	icon_state = "rig-excavation"
	item_state = "rig-excavation"
	armor = list(melee = 48, bullet = 48, laser = 35, energy = 40, bomb = 35, bio = 10, rad = 50)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/salvage/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.6

/obj/item/clothing/suit/armor/cuirass
	name = "Plate Cuirass"
	desc = "An old cuirass reinforced with scrap metal plating and dense fabric."
	icon_state = "stealth_rig"
	item_state = "stealth_rig"
	armor = list(melee = 40, bullet = 30, laser = 40, energy = 40, bomb = 35, bio = 10, rad = 50)
	sales_price = 25
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/salvage/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.9

/obj/item/clothing/suit/armor/explorer
	name = "Explorer Armor"
	desc = "Heavy explorer armor designed for long expeditions into the frontier."
	icon_state = "stealth_rig" // mob/suit.dmi
	item_state = "stealth_rig"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 48, bullet = 38, laser = 28, energy = 20, bomb = 30, bio = 10, rad = 20)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/explorer/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/guardsman/mercenary
	name = "Mercenary Flak Armour - Medium"
	desc = "An altered fabrication of Imperial Pattern Flak Armor - this particular version is commonly used by mercenaries guilds in service to the renegade houses of the frontier."
	icon_state = "merc" // mob/suit.dmi
	item_state = "merc"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 32, bullet = 32, laser = 32, energy = 32, bomb = 32, bio = 10, rad = 20)
	sales_price = 20
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/guardsman/mercenary/carapace
	name = "Mercenary Carapace Armour - Medium"
	desc = "An altered fabrication of Imperial Pattern Flak Armor - this particular version is commonly used by mercenaries guilds in service to the renegade houses of the frontier."
	icon_state = "explorer" // mob/suit.dmi
	item_state = "explorer"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 32, bullet = 32, laser = 32, energy = 32, bomb = 32, bio = 10, rad = 20)
	sales_price = 40
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/guardsman/mercenary/carapace/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/aascout
	name = "Adeptus Astartes Scout's Carapace"
	desc = "The sturdy armour, issued to Adeptus Astartes Scouts for their service until they prove themselves worthy to become full-fledged Battlebrothers."
	icon_state = "fharmor"
	item_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 45, bomb = 45, bio = 10, rad = 10)
	sales_price = 50
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_SCOUT)

//// ADMINISTRATUM
/obj/item/clothing/suit/armor/bountyhunter
	name = "bounty hunter's armor"
	icon_state = "cadianarmor"
	item_state = "cadianarmor"
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/bountyhunter2
	name = "bounty hunter's armor"
	icon_state = "valhalla"
	item_state = "valhalla"
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 20, bio = 10, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/enforcer2// Old enforcer armor for reference.
	name = "Patrol Armor - Enforcer"
	desc = "The flak armor worn by a Messina Enforcer. Light and robust in the colour blue, designed to protect against blast and small arms fire."
	icon_state = "Judge"
	item_state = "Judge"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 20, bomb = 30, bio = 20, rad = 20)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/enforcer
	name = "Patrol Jacket"
	desc = "The flak jacket worn by a Messina Enforcer. Light and robust in the colour black, designed to protect against blast and small arms fire."
	icon_state = "towntrench_medium"
	item_state = "towntrench_medium"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 30, bio = 20, rad = 20)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/marshal
	name = "Carapace Patrol Jacket"
	desc = "The carapace patrol jacket worn by a Messina Marshal. Light and robust in the colour black, designed to protect against direct blasts and small arms fire."
	icon_state = "towntrench_heavy"
	item_state = "towntrench_heavy"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 20, bullet = 25, laser = 25, energy = 25, bomb = 55, bio = 30, rad = 20)
	sales_price = 35
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/enforcer2/arbitrator // Don't use unless for events.
	name = "Patrol Armour - Arbitrator"
	desc = "The flak armour worn by a Magistratum Arbitrator. Light and robust in the colour blue, designed to protect against blast and small arms fire."
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 30, bomb = 60, bio = 30, rad = 30)
	sales_price = 30

//// ASTRA MILITARUM
/obj/item/clothing/suit/armor/guardsman
	name = "Cadian Pattern Flak Armour - Medium"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it standard configuration."
	icon_state = "farmor"
	item_state = "farmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 42, bullet = 48, laser = 42, energy = 20, bomb = 30, bio = 10, rad = 20)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/guardsman/carapace
	name = "Cadian Pattern Flak Armour - Carapace"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. this one is padded with Carapace plates, giving it better protection than average Flak Armour."
	icon_state = "fharmor"
	item_state = "fharmor"
	armor = list(melee = 48, bullet = 58, laser = 48, energy = 30, bomb = 40, bio = 10, rad = 20)
	sales_price = 35
/obj/item/clothing/suit/armor/guardsman/carapace/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/guardsman/bloodpact
	name = "Khornate Armor"
	desc = "War torn and suited to savage needs. This is the armor of a khornate warrior. It has certainly seen blood flown upon it."
	icon_state = "heretmil"
	item_state = "heretmil"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 25, laser = 25, energy = 20, bomb = 30, bio = 10, rad = 20)
	sales_price = 50
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/flak/heavy
	name = "Cadian Pattern Flak Armour - Heavy"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it heavy configuration"
	icon_state = "fharmor"
	item_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 35, bio = 10, rad = 20)
	sales_price = 30
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/flak/heavy/New()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/medicae
	name = "Cadian Pattern Medicae Flak Armour - Light"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it light configuration, bearing the Red Cross of a Combat Medicae."
	icon_state = "medicae"
	item_state = "medicae"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 30, bio = 40, rad = 30)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/medicae/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.5

/obj/item/clothing/suit/armor/whiteshield
	name = "Cadian Pattern Whiteshield Flak Armour - Light"
	desc = "The standard armour found throughout the Cadian-oriented PDF and Cadian Regiments, It is so common that it became symbol of the Astra Militarum as a whole. This one is in it light configuration, issued to the Whiteshields."
	icon_state = "wshield"
	item_state = "wshield"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 40, rad = 30)
	sales_price = 12
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/catachan
	name = "Catachan Flak Vest"
	desc = "Unlike the common Cadian folks or famous Krieg guardsmen, the Catachans only wear their lightly protected Flak vest to protect their hairy masculine chests against bruises and sharpnels." // uh... yes, I know how it sounds
	icon_state = "Catachan_Vest"
	item_state = "Catachan_Vest"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	sales_price = 25
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/CatachanVest/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1

/obj/item/clothing/suit/armor/catachan/medicae
	name = "Catachan Medicae Flak Vest"
	desc = "Unlike the common Cadian folks or famous Krieg guardsmen, the Catachans only wear their lightly protected Flak vest to protect their hairy masculine chests against bruises and sharpnels. This one is worn by Catachan Combat Medicae." // Why are you gei?
	icon_state = "mCatachan_Vest"

/obj/item/clothing/suit/armor/catachan/flamerspecialist
	name = "Catachan Flak Vest"
	desc = "Unlike the common Cadian folks or famous Krieg guardsmen, the Catachans only wear their lightly protected Flak vest to protect their hairy masculine chests against bruises and sharpnels." // uh... yes, I know how it sounds



/obj/item/clothing/suit/armor/valhallanarmor
	name = "Valhallan Overcoat"
	desc = "A thick, Fur great coat designed for Valhallan Ice warriors, it is thermally-insulated to protect against extreme cold weather conditions."
	icon_state = "valarmor"
	item_state = "valarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 15, bomb = 15, bio = 10, rad = 20)
	sales_price = 20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/armor/valhallanarmor/medicae
	name = "Valhallan Medicae Overcoat"
	desc = "A thick, Fur great coat designed for Valhallan Ice warriors, it is thermally-insulated to protect against extreme cold weather conditions. Bears the red markings of a Combat Medicae."
	icon_state = "mvalarmor"

/obj/item/clothing/suit/armor/krieger
	name = "Krieg Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks."
	icon_state = "kriegcoat"
	item_state = "kriegcoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 15, bomb = 15, bio = 50, rad = 50) //More coverage, less effective.
	sales_price = 20
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/armor/krieger/medicae
	name = "Krieg Medicae Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks. It has red markings, denoting the wearer as a Combat Medicae."
	icon_state = "mkriegcoat"

/obj/item/clothing/suit/armor/krieger/grenadier
	name = "Krieg Grenadier Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks. This one has been plated with Carapace platings, making it extremely protective at the cost of mobility."
	icon_state = "grencoat"
	item_state = "grencoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 80, rad = 80)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/krieger/grenadier/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.6

/obj/item/clothing/suit/armor/cadiansgt
	name = "Cadian Sergeant's Flak Armour"
	desc = "The well-worn armor of an Cadian Regiment Sergeant, this one is padded with Caraspace plates, giving it better protection than average Guardsmen. It has the three-chevrons marked on it upper chest."
	icon_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 10, rad = 30)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/cadiansgt/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/lieutenant
	name = "Cadian Lieutenant's Flak Armour"
	desc = "The well-worn armor of an Cadian Regiment Lieutenant, this one is padded with Caraspace plates, giving it better protection than average Guardsmen."
	icon_state = "fharmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 35, bio = 20, rad = 35)
	sales_price = 35
	cold_protection = UPPER_TORSO | LOWER_TORSO
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
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 20, rad = 35)
	sales_price = 50
	cold_protection = UPPER_TORSO | LOWER_TORSO | FEET | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/scion/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/catachansgt
	name = "Catachan Sergeant's Flak Vest"
	desc = "Unlike the common Cadian folks or famous Krieg guardsmen, the Catachans only wear their lightly protected Flak vest to protect their hairy masculine chests against bruises and sharpnels. The Imperial Aquila is engraved with the word 'Devil' on this one."
	icon_state = "Catachan_Vest"
	item_state = "Catachan_Vest"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 25, bomb = 30, bio = 0, rad = 0)
	sales_price = 40
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
	armor = list(melee = 30, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 20, rad = 30)
	sales_price = 45
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/valhallasgt/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/kriegsgt
	name = "Krieg Watchmaster's Overcoat"
	desc = "A ornated uniform with silver-trimming and red waffenfarbe by it collar. Worn by the senior-enlisted of the Krieg Regiment, The Watchmaster... It smells of saddeness and blood."
	icon_state = "kriegcoat"
	item_state = "kriegcoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 45, bio = 100, rad = 100)
	sales_price = 45
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/kriegsgt/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/commissar
	name = "Commissar's Trenchcoat"
	desc = "The Commissar's magnificent, charismatic that strikes dreads and fears into the mind of lowly Imperial Guardsmen and heretics alike. Plated in Caraspace, giving it much more protection than average Guardsman."
	icon_state = "Commissar4"
	item_state = "Commissar4"
	allowed = list(/obj/item/gun/projectile/bolter_pistol)
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 35, bomb = 45, bio = 10, rad = 30)
	sales_price = 60
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/commissar/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.1

/obj/item/clothing/suit/armor/commissar/krieg
	name = "Commissar's Trenchcoat"
	desc = "The Commissar's iconic coat, this out tailored to match more of the uniform theme of the Officers of Krieg. Though the Krieg Guardsmen don't fear you, the others certainly will."
	icon_state = "Kriegissar"
	item_state = "Kriegissar"
	armor = list(melee = 30, bullet = 35, laser = 25, energy = 35, bomb = 45, bio = 100, rad = 100)

/obj/item/clothing/suit/armor/commissar/catachan
	name = "Commissar's Trenchjacket"
	desc = "What used to be a decorated and custom tailored coat of the Officio Prefectus is now crudely stripped of decoration and cut down to be lighter and more breathable for the jungles of Catachan, although, also padded to be more resistant to melee attacks. Though, wearing something like this out here is more of a power move."
	icon_state = "catacommissar"
	item_state = "catacommissar"
	armor = list(melee = 40, bullet = 25, laser = 25, energy = 25, bomb = 20, bio = 0, rad = 10)

// INQUISITION

/obj/item/clothing/suit/armor/agent/caraspace
	name = "Carapace Armour"
	desc = "The formidable, brillantly made Carapace Armour for the Inquistorial Agent, On it, bears the holy symbol of the Inquisition, The Rosette."
	icon_state = "inqcoat"
	item_state = "inqcoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 45, bomb = 45, bio = 100, rad = 90)
	sales_price = 50
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/agent/caraspace/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.2


/obj/item/clothing/suit/armor/agent/coat
	name = "Carapace Coat"
	desc = "The formidable, brillantly made Caraspace Armour for the Inquistorial Agent, This one bears many holy seals along with it Rosette, to ward off the corruption of Chaos."
	icon_state = "acolytecoat"
	item_state = "acolytecoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 45, bomb = 45, bio = 100, rad = 90)
	sales_price = 50
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/agent/coat/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.2

/obj/item/clothing/suit/storage/hooded/inquisitor
	name = "Mechanicus Power Armour"
	desc = "The Inquisitor's holy armour, forged by the Tech-priest of Mars for his use in his path of destruction toward enemies of our Emperor, Engraved the Inquisitorial Rosette, It shines brightly as if it is the Emperor himself is present, For he'll cleanse the darkness."
	icon_state = "inqarmor"
	item_state = "inqarmor"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 65, bomb = 60, bio = 100, rad = 100)
	sales_price = 90
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/inqhood
/obj/item/clothing/suit/storage/hooded/inquisitor/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.2

/obj/item/clothing/suit/armor/ordohereticus
	name = "Armored Coat"
	desc = "The Inquisitor's holy coat, forged from a Tech-priest of Mars for his use in his path of holy fire toward enemies of our Emperor, Hanging from the coat a Inquisitorial Rosette, It shines brightly as if it is the Emperor himself is present, For he'll cleanse the darkness."
	icon_state = "hereticuscoat"
	item_state = "hereticuscoat"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	sales_price = 70
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 45, bomb = 45, bio = 10, rad = 10) //walker here, i feel like i should give them more armor, but i wont touch this
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS


// MECHANICUS
/obj/item/clothing/suit/storage/hooded/genetor
	name = "Magos Biologis robes"
	desc = "Green robes riddled with augments, scanners and syringes. The robes look incredibly old and worn, you can tell this magos has lived a long and scholarly life."
	icon_state = "genetor"
	item_state = "genetor"
	unacidable = 1
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun) //TODO make this more applicable to genetor
	armor = list(melee = 25, bullet = 25, laser = 20, energy = 30, bomb = 30, bio = 100, rad = 100) //while it is magos armor, it should be a bit weaker than the dominus armor
	sales_price = 40
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
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 40, bio = 100, rad = 100)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/skithood

/obj/item/clothing/suit/storage/hooded/ruststalker
	name = "Ruststalker Armored Robes"
	desc = "Tailored and reinforced by the Adeptus Mechanicus, this strange armour is issued to Skitarii Ruststalkers. It shimmers oddly in the light, and seems to have storage pouches for skulls."
	icon_state = "skitsuit"
	item_state = "skitsuit"
	canremove = 0
	unacidable = 1
	allowed = list(/obj/item/organ/external/head)
	armor = list(melee = 50, bullet = 30, laser = 30, energy = 30, bomb = 60, bio = 100, rad = 100)
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/rusthood

/obj/item/clothing/suit/storage/vanguard
	name = "Vanguard Armour Plating"
	desc = "Tailored and reinforced by the Adeptus Mechanicus, these heavy ceramite plates offer near-complete protection from attack."
	icon_state = "heavy"
	item_state = "heavy"
	canremove = 0
	unacidable = 1
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 60, bio = 100, rad = 180) //It's ceramite plates bolted directly to their body. They're essentially a walking siege engine, at the cost of being as slow as one.
	sales_price = 30
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/storage/hooded/skitarii/vanguard/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 3

/obj/item/clothing/suit/storage/hooded/genestealer
	name = "tyranid chitin"
	desc = "The hide of a Tyranid Genestealer"
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 100, rad = 100)
	icon_state = "gsfeet"
	item_state = "gsfeet"
	canremove = 0
	unacidable = 1
	species_restricted = list(SPECIES_TYRANID)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

// ADEPTA SORORITAS
/obj/item/clothing/suit/sisterofbattle
	name = "Order of the Sacred Rose Power Armor"
	desc = "The Sacred and holy Power Armour adorned by Battle Sister of the Order Of The Sacred Rose, It illuminates the field with it glorious light, Being near it make you feels safer and secured."
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 65, bullet = 65, laser = 60, energy = 60, bomb = 60, bio = 100, rad = 100) //its essentially light powerarmor, a bit weaker than assfartez.
	sales_price = 120
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	canremove = 1
	species_restricted = list(SPECIES_HUMAN)
/obj/item/clothing/suit/sisterofbattle/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.5

/obj/item/clothing/suit/sisterofbattle/repentia
	name = "Garb of the Repentia"
	desc = "The tattered garb of a penitent sister of battle. The lack of armor is a symbol of their faith on the Repentia's deathmarch towards a glorious end."
	icon_state = "repentia_chest"
	item_state = "repentia_chest"
	armor = list(melee = 55, bullet = 55, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100) //its essentially light powerarmor, a bit weaker than assfartez.
	sales_price = 120
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/suit/sisterofbattle/mlsister
	name = "Order of Our Martyred Lady Power Armor"
	desc = "The Sacred and holy Power Armour adorned by Battle Sister of the Order Of Our Martyred Lady. Being near it make you feels safer and secured."
	icon_state = "mlsister"
	item_state = "mlsister"
	armor = list(melee = 65, bullet = 65, laser = 60, energy = 60, bomb = 60, bio = 100, rad = 100) //its essentially light powerarmor, a bit weaker than assfartez.
	sales_price = 120
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	species_restricted = list(SPECIES_HUMAN)
/obj/item/clothing/suit/sisterofbattle/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.5

/obj/item/clothing/suit/sisterofbattle/brsister
	name = "Order of the Bloody Rose Power Armor"
	desc = "The blood red power armor of The Order of the Bloody Rose."
	icon_state = "brsister"
	item_state = "brsister"
	armor = list(melee = 65, bullet = 65, laser = 60, energy = 60, bomb = 60, bio = 100, rad = 100) //its essentially light powerarmor, a bit weaker than assfartez.
	sales_price = 120
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	species_restricted = list(SPECIES_HUMAN)
/obj/item/clothing/suit/sisterofbattle/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.5

/obj/item/clothing/suit/sisterofbattle/training
	name = "Novice Power Armor"
	desc = "The Ancient and Deconsecrated Power Armour adorned by Novice Militants during their training in Eipharius' Monastarium. Stripped of almost all iconography and with damaged plating, and has scriptures across it's surface speaking of The Beatie and her crusade across the Sabbat worlds."
	icon_state = "ooml"
	item_state = "ooml"
	armor = list(melee = 44, bullet = 40, laser = 40, energy = 30, bomb = 30, bio = 50, rad = 50)
	sales_price = 40
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	species_restricted = list(SPECIES_HUMAN)
/obj/item/clothing/suit/sisterofbattle/training/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.8

/obj/item/clothing/suit/sisterofbattle/sobrelic
	name = "Order of Our Martyred Lady's Primeval Chespiece"
	desc = "A primeval chestpiece of Adeptus Sororitas power armor, draped in the marks of the Order of Our Martyred Lady. It looks worn down, battle-hardened, and retired for good reason, yet it still radiates with holy energy."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "ooml"
	item_state = "ooml"
	armor = list(melee = 100, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 100, rad = 100) //people were getting it and just being a second SOB. so shit stats
	sales_price = 140
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
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
  body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/suit/armor/corsair
  name = "Eldar Corsair Armor"
  desc = "The dark and shadowy armor of a voidscarred Corsair.."
  icon_state = "aeldar_armor"
  item_state = "aeldar_armor"
  armor = list(melee = 50, bullet = 58, laser = 48, energy = 30, bomb = 40, bio = 100, rad = 20)
  cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET| ARMS | HANDS
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
  body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
// Dark Eldar
/obj/item/clothing/suit/armor/deldar
  name = "Ghost Plate Armor"
  desc = "A ancient armor. It looks as if made from hardened resin in a thin-scale like pattern. It cackles with electrical power."
  icon_state = "deldarmor"
  item_state = "deldarmor"
  armor = list(melee = 60, bullet = 60, laser = 60, energy = 70, bomb = 40, bio = 100, rad = 20)
  cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET| ARMS | HANDS
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
  body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/armor/heretcoat
	name = "Scrap Overcoat"
	desc = "Overcoat made with leather and some cheap forged steel parts"
	icon_state = "heretmil"
	item_state = "heretmil"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun,/obj/item/gun/projectile)
	armor = list(melee = 40, bullet = 35, laser = 35, energy = 15, bomb = 35, bio = 50, rad = 50)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

// NEW ARMORS

/obj/item/clothing/suit/armor/heavyflaksuit
	name = "Heavy Flak Suit"
	desc = "A custom made flak suit used for close quarters fighting, it's restrictive nature is made up by it's excessive protection from small arms and explosive damage."
	icon_state = "meister"
	item_state = "meister"
	armor = list(melee = 48, bullet = 52, laser = 52, energy = 25, bomb = 60, bio = 70, rad = 60)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 30
/obj/item/clothing/suit/armor/heavyflaksuit/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/fraterisarmor
	name = "Frateris Robes"
	desc = "Robes of the faithful concealing aged flak plates stitched into the front and back."
	icon_state = "syndievest"
	item_state = "syndievest"
	armor = list(melee = 35, bullet = 38, laser = 38, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/trinet
	name = "Iron Cuirass"
	desc = "An iron-alloy breastplate forged by local hands, it's craftsmanship is questionable but the exotic alloy is remarkbly unique to Eipharius."
	icon_state = "trinet"
	item_state = "trinet"
	armor = list(melee = 56, bullet = 34, laser = 38, energy = 25, bomb = 30, bio = 30, rad = 30)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/trinet/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/breastplate
	name = "Iron Breastplate"
	desc = "An iron-alloy breastplate forged by local hands, it's craftsmanship is questionable but the exotic alloy is remarkbly unique to Eipharius."
	icon_state = "bmerc2"
	item_state = "bmerc2"
	armor = list(melee = 47, bullet = 32, laser = 36, energy = 25, bomb = 10, bio = 10, rad = 10)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/breastplate/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.2

/obj/item/clothing/suit/armor/heavyduster
	name = "Mysterious Duster"
	desc = "This strange duster fits snugly against your back, heavily padded and made of fire-retardent materials."
	icon_state = "chemsis"
	item_state = "chemsis"
	armor = list(melee = 32, bullet = 32, laser = 44, energy = 25, bomb = 20, bio = 70, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/iplate
	name = "Heavy Plate Cuirass"
	desc = "An iron-alloy heavy plate cuirass forged by local hands, it's craftsmanship is remarkable and benefits from the exotic alloy unique to Eipharius."
	icon_state = "iplate"
	item_state = "iplate"
	armor = list(melee = 68, bullet = 42, laser = 44, energy = 25, bomb = 40, bio = 40, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/iplate/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/templar
	name = "Full Plate Armor"
	desc = "An iron-alloy heavy plate cuirass forged by local hands, it's craftsmanship is remarkable and benefits from the exotic alloy unique to Eipharius."
	icon_state = "templar"
	item_state = "templar"
	armor = list(melee = 68, bullet = 42, laser = 44, energy = 25, bomb = 40, bio = 40, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/templar/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/knighthosp
	name = "Frateris Plate"
	desc = "An iron-alloy heavy plate cuirass forged by local hands, it's craftsmanship is remarkable and benefits from the exotic alloy unique to Eipharius."
	icon_state = "knight_hospitaller"
	item_state = "knight_hospitaller"
	armor = list(melee = 68, bullet = 42, laser = 44, energy = 25, bomb = 40, bio = 40, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/knighthosp/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/hauberk
	name = "Hauberk"
	desc = "A light chain hauberk worn over padded cloth, it's comfortable and protects against slashes."
	icon_state = "hauberk"
	item_state = "hauberk"
	armor = list(melee = 45, bullet = 30, laser = 34, energy = 25, bomb = 10, bio = 20, rad = 30)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/hauberk/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.2

/obj/item/clothing/suit/armor/slaverobe
	name = "Serf Robes"
	desc = "Disgusting filthy robes worn by gutter trash like you."
	icon_state = "slaverobe"
	item_state = "slaverobe"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 25, bomb = 10, bio = 20, rad = 30)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/slaverobe/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.5

/obj/item/clothing/suit/armor/armoredtrench
	name = "Armored Trenchcoat"
	desc = "A heavy armored trenchcoat with carapace plates inserted into the front and back. Attached also are iron-alloy chausses and pauldrons, a true masterwork of Eipharius."
	icon_state = "towntrench_heavy"
	item_state = "towntrench_heavy"
	armor = list(melee = 56, bullet = 58, laser = 56, energy = 25, bomb = 40, bio = 50, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/armoredtrench/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/vanpa
	name = "Van Saar Power Armor"
	desc = "A heavy set of Necromundan Power Armor manufactured by the House of Van Saar, the quality despite it's status as technical power armor is quite poor."
	icon_state = "lightpa2"
	item_state = "lightpa2"
	armor = list(melee = 64, bullet = 72, laser = 72, energy = 25, bomb = 60, bio = 80, rad = 80)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 80
/obj/item/clothing/suit/armor/vanpa/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.6

/obj/item/clothing/suit/armor/berserker
	name = "Berserker Power Armor"
	desc = "A heavy set of Berserker Power Armor manufactured by unknown smiths of ruinous origin, it radiates with incredible energy and a wrath that infests your very soul."
	icon_state = "berserker"
	item_state = "berserker"
	armor = list(melee = 60, bullet = 64, laser = 64, energy = 55, bomb = 60, bio = 80, rad = 80)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 45
/obj/item/clothing/suit/armor/berserker/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/goliathplate
	name = "Barbarian Plate"
	desc = "A heavy set of Goliath Plate manufactured by the Goliath House of Necromunda, the quality is terrible but is forged of rare metals from the Necromunda smelteries."
	icon_state = "paladin"
	item_state = "paladin"
	armor = list(melee = 58, bullet = 40, laser = 50, energy = 25, bomb = 30, bio = 30, rad = 50)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 20
/obj/item/clothing/suit/armor/goliathplate/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/goliatharmor
	name = "Raider Cuirass"
	desc = "A light set of Goliath armor manufactured by the Goliath House of Necromunda, the quality is terrible but is forged of rare metals from the Necromunda smelteries."
	icon_state = "venator"
	item_state = "venator"
	armor = list(melee = 50, bullet = 30, laser = 44, energy = 25, bomb = 30, bio = 30, rad = 50)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/goliatharmor/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/sniper
	name = "Ghillie Suit"
	desc = "A strange ghillie suit uniquely lacking in any camoflauge that would hide you on an ice-world."
	icon_state = "fox"
	item_state = "fox"
	armor = list(melee = 40, bullet = 44, laser = 44, energy = 25, bomb = 30, bio = 30, rad = 50)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/seolarmor
	name = "Seolite Robes"
	desc = "Armored Robes of the xenos species of Seol. It seems the protective layers are designed to prevent lasburns or... even worse."
	icon_state = "scribe"
	item_state = "scribe"
	armor = list(melee = 30, bullet = 30, laser = 50, energy = 25, bomb = 30, bio = 50, rad = 50)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 10

/obj/item/clothing/suit/armor/seolsuit
	name = "Seolite Anomaly Suit"
	desc = "Forged by the strange xenos of this barren ice-world, it seeems to have an advanced protective field wrapping around it."
	icon_state = "spacer"
	item_state = "spacer"
	armor = list(melee = 50, bullet = 60, laser = 80, energy = 25, bomb = 40, bio = 100, rad = 100)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET|HEAD
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	sales_price = 60
/obj/item/clothing/suit/armor/seolsuit/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.8

/obj/item/clothing/suit/armor/flak1
	name = "Necromundan Flak Armor"
	desc = "Unmarked flak armor manufactured by the underhives of Necromunda."
	icon_state = "flak1"
	item_state = "flak1"
	armor = list(melee = 35, bullet = 44, laser = 44, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 9
/obj/item/clothing/suit/armor/flak1/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.1

/obj/item/clothing/suit/armor/flak2
	name = "Necromundan Flak Vest" // Protects chest only.
	desc = "Unmarked flak vest manufactured by the underhives of Necromunda."
	icon_state = "flak2"
	item_state = "flak2"
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 15, bomb = 10, bio = 30, rad = 20) //Knockoff Flak armour.
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 7

/obj/item/clothing/suit/armor/carapace2
	name = "Necromundan Carapace Armor"
	desc = "Unmarked carapace armor manufactured by the underhives of Necromunda."
	icon_state = "carapace2"
	item_state = "carapace2"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 30, rad = 20) //Knockoff Carapace armour.
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 25
/obj/item/clothing/suit/armor/carapace2/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.2

/obj/item/clothing/suit/armor/carapace3
	name = "Necromundan Carapace Armor"
	desc = "Unmarked carapace armor manufactured by the underhives of Necromunda."
	icon_state = "carapace3"
	item_state = "carapace3"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 30, rad = 20) //Knockoff Carapace armour.
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 25
/obj/item/clothing/suit/armor/carapace3/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.2

/obj/item/clothing/suit/armor/carapace4
	name = "Heavy Carapace Armor"
	desc = "Unmarked carapace armor manufactured by the underhives of Necromunda."
	icon_state = "carapace4"
	item_state = "carapace4"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 30, rad = 40)  //Knockoff Carapace armour.
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 35
/obj/item/clothing/suit/armor/carapace4/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/goliath2
	name = "Goliath Flak Armor"
	desc = "Shoddy flak armor worn by members of House Goliath, it seems unlikely to protect you from much more then a blade."
	icon_state = "raider_combat"
	item_state = "raider_combat"
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 15, bomb = 10, bio = 30, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 15
/obj/item/clothing/suit/armor/goliath2/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/greypa
	name = "Mechanicus Power Armour"
	desc = "Mechanicus holy power armour, forged by the Tech-priest of Mars and blessed with runes of blankness, a potent tool against the great enemy."
	icon_state = "knight_grey"
	item_state = "knight_grey"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 100, rad = 100)
	sales_price = 90
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
/obj/item/clothing/suit/armor/greypa/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/rpowerarmor
	name = "Renegade Power Armour"
	desc = "Masterwork power armor forged and used by the renegade navigator houses."
	icon_state = "t51bgs"
	item_state = "t51bgs"
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 65, bullet = 72, laser = 72, energy = 35, bomb = 50, bio = 100, rad = 100)
	sales_price = 85
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
/obj/item/clothing/suit/armor/rpowerarmor/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.5

/obj/item/clothing/suit/armor/scum2
	name = "Mysterious Garb"
	desc = "These clothes belong the most mystical of folk."
	icon_state = "gothcoat"
	item_state = "gothcoat"
	armor = list(melee = 38, bullet = 35, laser = 35, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/leather
	name = "Leather Armor"
	desc = "Shoddy armor sewn from shafra leather, it protects you more from the cold then anything else."
	icon_state = "leatherarmor"
	item_state = "leatherarmor"
	armor = list(melee = 40, bullet = 35, laser = 35, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/hjacket
	name = "Heavy Jacket"
	desc = "A heavy leather jacket."
	icon_state = "wornmfp"
	item_state = "wornmfp"
	armor = list(melee = 40, bullet = 35, laser = 35, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/hjacket2
	name = "Cool Jacket"
	desc = "A a light jacket worn by gangers."
	icon_state = "biker_jacket"
	item_state = "biker_jacket"
	armor = list(melee = 40, bullet = 35, laser = 35, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/slumcoat
	name = "Slum Coat"
	desc = "A heavy leather coat made of a strange leather, it's incredibly durable."
	icon_state = "ghostechoe"
	item_state = "ghostechoe"
	armor = list(melee = 44, bullet = 39, laser = 39, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/towntrench
	name = "Trench Coat"
	desc = "A trench coat underpiece to wear with your trench coat!"
	icon_state = "towntrench_special"
	item_state = "towntrench_special"
	armor = list(melee = 44, bullet = 39, laser = 39, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/kasrkin
	name = "Kasrkin Carapace"
	desc = "The Carapace Armor of an Elite Kasrkin, a reliable stormtrooper armor."
	icon_state = "kasrkinarmorb"
	item_state = "kasrkinarmorb"
	armor = list(melee = 58, bullet = 54, laser = 54, energy = 25, bomb = 40, bio = 40, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 40

/obj/item/clothing/suit/armor/vessor
	name = "Vessorine Carapace"
	desc = "A light bodysuit with carapace plates overlayn like an exterior scale-mail, the suit appears to be powered."
	icon_state = "uegarmor"
	item_state = "uegarmor"
	armor = list(melee = 58, bullet = 54, laser = 54, energy = 25, bomb = 40, bio = 40, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 40
/obj/item/clothing/suit/armor/vessor/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -0.4

/obj/item/clothing/suit/armor/exile
	name = "Vessorine Armor"
	desc = "Ritual combat armor worn by the natives of Vessor."
	icon_state = "exile"
	item_state = "exile"
	armor = list(melee = 48, bullet = 39, laser = 39, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/tribalarmor
	name = "Tribal Armor"
	desc = "Ritual combat armor worn by the nomadic clansmen predating the colony."
	icon_state = "tribal_armor"
	item_state = "tribal_armor"
	armor = list(melee = 44, bullet = 37, laser = 37, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/bonearmor
	name = "Boneplate Armor"
	desc = "Shoddy bone armor constructed from the gigantic bones of a local beast, the materials are surprisingly durable."
	icon_state = "bonearmor"
	item_state = "bonearmor"
	armor = list(melee = 44, bullet = 32, laser = 32, energy = 25, bomb = 40, bio = 30, rad = 40)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/suit/armor/goliath2/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/tduster
	name = "Armored Duster"
	desc = "A duster with a flak plate insert, sewn together with shafra leather."
	icon_state = "talon_duster"
	item_state = "talon_duster"
	armor = list(melee = 44, bullet = 39, laser = 39, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/carapaceduster
	name = "Armored Duster"
	desc = "A duster with carapace plate inserts, sewn together with shafra leather."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list(melee = 49, bullet = 44, laser = 44, energy = 25, bomb = 38, bio = 30, rad = 30)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

// ARMORS PHASE TWO

/obj/item/clothing/suit/armor/necromundaflak1
	name = "Heavy Flak Armor"
	desc = "Unmarked heavy flak armor manufactured by the underhives of Necromunda."
	icon_state = "necromundaflak"
	item_state = "necromundaflak"
	armor = list(melee = 40, bullet = 48, laser = 48, energy = 25, bomb = 40, bio = 30, rad = 30)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 15
/obj/item/clothing/suit/armor/necromundaflak1/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.3

/obj/item/clothing/suit/armor/necromundacarapace1
	name = "Heavy Carapace Armor"
	desc = "Unmarked heavy flak armor manufactured by the underhives of Necromunda."
	icon_state = "necromundacarapace"
	item_state = "necromundacarapace"
	armor = list(melee = 48, bullet = 58, laser = 58, energy = 25, bomb = 48, bio = 30, rad = 30)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 31
/obj/item/clothing/suit/armor/necromundacarapace1/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.4

/obj/item/clothing/suit/armor/ranger2
	name = "Colonial Duster"
	desc = "A duster with a flak plate insert, sewn together with grox leather."
	icon_state = "ranger2"
	item_state = "ranger2"
	armor = list(melee = 41, bullet = 46, laser = 43, energy = 25, bomb = 25, bio = 30, rad = 31)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/ranger3
	name = "Ganger Duster"
	desc = "A duster with a flak plate insert, sewn together with grox leather."
	icon_state = "ranger3"
	item_state = "ranger3"
	armor = list(melee = 51, bullet = 41, laser = 35, energy = 25, bomb = 25, bio = 40, rad = 39)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

// admeme only

/obj/item/clothing/suit/armor/ogryn1 // only give this to ogryns. it cannot be removed and has head protection.
	name = "Ogryn Armor"
	desc = "Protects ya stomach from dem flashie stingy things."
	icon_state = "ogryn1"
	item_state = "ogryn1"
	armor = list(melee = 90, bullet = 70, laser = 70, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|HANDS|FEET|HEAD
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 0
	canremove = 0

/obj/item/clothing/suit/armor/ogryn2
	name = "Ogryn Armor"
	desc = "Protects ya stomach from dem flashie stingy things."
	icon_state = "ogryn2"
	item_state = "ogryn2"
	armor = list(melee = 90, bullet = 70, laser = 70, energy = 25, bomb = 30, bio = 30, rad = 20)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|HANDS|FEET|HEAD
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 0
	canremove = 0

/obj/item/clothing/suit/armor/shadowbeast // ADMIN ONLY DONT FUKKIN GIVE ANYONE THIS.
	name = "DO YOU SEE."
	desc = "DO YOU SEE ME."
	icon_state = "shadow"
	item_state = "shadow"
	armor = list(melee = 150, bullet = 150, laser = 150, energy = 25, bomb = 50, bio = 100, rad = 100)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 0
/obj/item/clothing/suit/armor/shadowbeast/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1

/obj/item/clothing/suit/armor/vindicare
	name = "Vindicare armour"
	desc = "The armoured bodysuit of a Vindicare assassin."
	armor = list(melee = 20, bullet = 95, laser = 95, energy = 95, bomb = 20, bio = 100, rad = 100)
	icon_state = "s-ninja"
	item_state = "s-ninja"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	str_requirement = 18
	canremove = 0
	siemens_coefficient = 0
	sales_price = 250
/obj/item/clothing/suit/armor/vindicare/New()
	..()
	slowdown_per_slot[slot_wear_suit] = -1.5


/obj/item/clothing/suit/armor/flak1/renegadearmor
	name = "renegade militia armor"
	desc = "Makeshift steel armor, while not refined, it will protect you vital organs. It has strange marks carved into it"
	icon_state = "renegade_militia_armor"
	item_state = "renegade_militia_armor"

/obj/item/clothing/suit/armor/thallax
	name = "Thallax Armour"
	desc = "Heavy armour which makes up the main body of a Thallax Warrior"
	icon_state = "lightpa2"
	item_state = "lightpa2"
	armor = list(melee = 120, bullet = 120, laser = 120, energy = 120, bomb = 120, bio = 120, rad = 120)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	canremove = 0
