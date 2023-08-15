/obj/item/clothing/head/helmet/space/void/swat
	name = "Swat helmet"
	desc = "An armored helmet used to protect the heads of special forces opratives"
	icon_state = "deathsquad"

	body_parts_covered = HEAD
	armor = list(melee = 80, bullet = 65, laser = 70,energy = 35, bomb = 50, bio = 100, rad = 100)
	siemens_coefficient = 0.6
	sales_price = 30



/obj/item/clothing/suit/space/void/swat
	name = "\improper SWAT suit"
	desc = "A heavily armored suit that protects against moderate damage. Used in special operations."
	icon_state = "deathsquad"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	allowed = list(/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs,/obj/item/tank)
	armor = list(melee = 80, bullet = 65, laser = 70,energy = 35, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 0.6
	sales_price = 50

/obj/item/clothing/suit/space/void/swat/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0


