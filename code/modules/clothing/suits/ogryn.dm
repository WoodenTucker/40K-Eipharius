/obj/item/clothing/suit/armor/ogryn
	name = "Ogryn Battle Armor"
	icon = 'icons/mob/32x40/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/32x40/suits.dmi')
	icon_state = "ogryn_5"
	item_state = "ogryn_5"
	str_requirement = 15 // they can get gibbed and their armor stays. helmet has it, so why not armor too
	canremove = 0
	desc = "Worn to shreds and covered in spikes."
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 80, bullet = 70, laser = 90, energy = 90, bomb = 60, bio = 100, rad = 100)
	sales_price = 60
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEGLOVES
	species_restricted = list("Ogryn")
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	germ_level = 0 //sterile...

/obj/item/clothing/suit/armor/ogryn/one
	icon_state = "ogryn_1"
	item_state = "ogryn_1"

/obj/item/clothing/suit/armor/ogryn/two
	icon_state = "ogryn_2"
	item_state = "ogryn_2"

/obj/item/clothing/suit/armor/ogryn/three
	icon_state = "ogryn_3"
	item_state = "ogryn_3"

/obj/item/clothing/suit/armor/ogryn/four
	icon_state = "ogryn_4"
	item_state = "ogryn_4"

/obj/item/clothing/suit/armor/ogryn/bouncer
	name = "Ogryn Bouncer Armor"
	armor = list(melee = 60, bullet = 50, laser = 70, energy = 70, bomb = 50, bio = 100, rad = 100) //I just took 20% off of the main armor types and 10% off bomb. It ended up being pretty similar to skitarii vanguard armor, so it should still be pretty durable.