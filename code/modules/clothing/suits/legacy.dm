//IS12 Junk

/obj/item/clothing/suit/child_coat/red
	icon_state = "child_redcoat"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 35, bullet = 80, laser = 80, energy = 70, bomb = 70, bio = 20, rad = 20)
	species_restricted = list("Child")
	canremove = 0

/obj/item/clothing/suit/child_coat/blue
	icon_state = "child_bluecoat"
	warfare_team = BLUE_TEAM

/obj/item/clothing/suit/fire/red
	name = "Redcoats Firesuit"
	icon_state = "redfiresuit"
	warfare_team = RED_TEAM
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	str_requirement = 18
	flags_inv = null //HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/suit/fire/blue
	name = "Bluecoats Firesuit"
	icon_state = "bluefiresuit"
	warfare_team = BLUE_TEAM
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	str_requirement = 18
	flags_inv = null //HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/suit/legacy/redcoat
	name = "Red Team's jacket"
	desc = "The proud jacket of the Red Baron!"
	icon_state = "redcoat"
	warfare_team = RED_TEAM
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing)
	starting_accessories = list(/obj/item/clothing/accessory/red_outline)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/redcoat/New()
	..()
	name = "The [RED_TEAM]'s jacket"
	desc = "The proud jacket of the [RED_TEAM]."

/obj/item/clothing/suit/armor/sentry/red
	name = "Red Sentry Armor"
	icon_state = "redsentryarmor"
	warfare_team = RED_TEAM

/obj/item/clothing/suit/armor/redcoat/leader
	icon_state = "redcoat_leader"

/obj/item/clothing/suit/armor/redcoat/medic
	icon_state = "redcoat_medic"
	item_state = "redcoat_medic"

/obj/item/clothing/suit/armor/redcoat/sniper
	icon_state = "redcoat_sniper"
	item_state = "redcoat_sniper"

/obj/item/clothing/suit/armor/redcoat/nam
	icon_state = "redsuit"

/obj/item/clothing/suit/armor/redcoat/leader/nam
	icon_state = "redsuit_leader"

/obj/item/clothing/suit/armor/redcoat/medic/nam
	icon_state = "redsuit_medic"

/obj/item/clothing/suit/armor/bluecoat
	name = "Blue Team's jacket"
	desc = "The proud jacket of the Bluecoats!"
	icon_state = "bluecoat"
	warfare_team = BLUE_TEAM
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing)
	starting_accessories = list(/obj/item/clothing/accessory/blue_outline)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/bluecoat/New()
	..()
	name = "The [BLUE_TEAM]'s jacket"
	desc = "The proud jacket of the [BLUE_TEAM]."

/obj/item/clothing/suit/armor/sentry/blue
	warfare_team = BLUE_TEAM
	name = "Blue Sentry Armor"
	icon_state = "bluesentryarmor"

/obj/item/clothing/suit/armor/bluecoat/leader
	icon_state = "bluecoat_leader"

/obj/item/clothing/suit/armor/bluecoat/medic
	icon_state = "bluecoat_medic"
	item_state = "bluecoat_medic"

/obj/item/clothing/suit/armor/bluecoat/sniper
	icon_state = "bluecoat_sniper"
	item_state = "bluecoat_sniper"























































