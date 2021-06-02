
/obj/item/clothing/suit/armor
	allowed = list(/obj/item/gun/energy,/obj/item/device/radio,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = ITEM_FLAG_THICKMATERIAL

	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

//New Vests
/obj/item/clothing/suit/armor/vest
	name = "armored vest"
	desc = "An armor vest made of synthetic fibers."
	icon_state = "kvest"
	item_state = "armor"
	armor = list(melee = 25, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "armor"

/obj/item/clothing/suit/storage/vest
	name = "webbed armor vest"
	desc = "A synthetic armor vest. This one has added webbing and ballistic plates."
	icon_state = "webvest"
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0)
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
	armor = list(melee = 40, bullet = 40, laser = 60, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/merc
	name = "heavy combat armor"
	desc = "A high-quality armored vest made from a hard synthetic material. It is surprisingly flexible and light, despite formidable armor plating."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 40, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS //now covers legs with new sprite
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS

//Modular plate carriers
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

//Modular specialty armor
/obj/item/clothing/suit/armor/riot
	name = "riot vest"
	desc = "An armored vest with heavy padding to protect against melee attacks."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/modular_armor.dmi')
	icon_state = "riot"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 75, bullet = 33, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)
	siemens_coefficient = 0.5
	starting_accessories = list(/obj/item/clothing/accessory/armguards/riot, /obj/item/clothing/accessory/legguards/riot)

/obj/item/clothing/suit/armor/bulletproof
	name = "ballistic vest"
	desc = "An armored vest with heavy plates to protect against ballistic projectiles."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/modular_armor.dmi')
	icon_state = "ballistic"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	restricted_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 42, bullet = 75, laser = 42, energy = 10, bomb = 25, bio = 0, rad = 0)
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
	armor = list(melee = 35, bullet = 35, laser = 75, energy = 50, bomb = 0, bio = 0, rad = 0)
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
//When the wearer gets hit, this armor will teleport the user a short distance away (to safety or to more danger, no one knows. That's the fun of it!)
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

//Flak Armors

/obj/item/clothing/suit/armor/flak/vest
	name = "light flak vest"
	desc = "An armored vest made from a light-weight layer of ablative and impact-absorbant materials. Cheap, lightweight, and reliable, but not as resistant as other armors."
	icon_state = "fvest"
	item_state = "fvest"
	armor = list(melee = 25, bullet = 30, laser = 30, energy = 15, bomb = 35, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/suit/armor/flak/armor
	name = "flak armor"
	desc = "A suit of resistant armor made from several layers of ablative and imapct-absorbant materials. One of the most commonly used armors in the Imperium, standard issue to the Imperial Guard."
	icon_state = "farmor"
	item_state = "farmor"
	armor = list(melee = 45, bullet = 40, laser = 40, energy = 35, bomb = 45, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO||ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO||ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO||ARMS

/obj/item/clothing/suit/armor/flak/heavy
	name = "heavy flak armor"
	desc = "A suit of heavy-duty armor made from a thick layer of ablative and impact-absorbant materials. Heavy and cumbersome, but quite durable."
	icon_state = "fharmor"
	item_state = "fharmor"
	armor = list(melee = 60, bullet = 55, laser = 55, energy = 45, bomb = 55, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/armor/flak/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1.0

//Inquisitor Armors

/obj/item/clothing/suit/armor/acolyte
	name = "acolyte's coat"
	desc = "A thick brown coat lined with a tough layer of flak-weave, dotted with the occassional Inquisitorial seal or holy sigil."
	icon_state = "acolyte"
	item_state = "acolyte"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	heat_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 50, bullet = 50, laser = 45, energy = 45, bomb = 25, bio = 0, rad = 0)



//Begin Tau//
/obj/item/clothing/suit/armor/fwarmor
	name = "fire warrior armor"
	desc = "The impeccable white and red armor of the Tau warrior caste"
	icon_state = "tbrea"
	item_state = "tbrea"
	armor = list(melee = 15, bullet = 60, laser = 60, energy = 60, bomb = 25, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


//FINALLY begin ork//
/obj/item/clothing/suit/armor/orkarmor
	name = "ork armor"
	desc = "Scavenged bitz to keep ya' krumpin' longa'!"
	icon_state = "ork_m_armor"
	item_state = "ork_m_armor"
	armor = list(melee = 85, bullet = 40, laser = 40, energy = 40, bomb = 25, bio = 0, rad = 0)
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_HOLSTER)
	blood_overlay_type = "armor"
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

