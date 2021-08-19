/obj/item/clothing/suit/armor/astartes
	name = "Adeptus Astartes Power armor"
	icon = 'icons/mob/32x40/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/32x40/suits.dmi')
	icon_state = "umpowerarmor"
	item_state = "umpowerarmor"
	str_requirement = 25
	canremove = 0
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 90, rad = 100)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT|HIDEGLOVES


///////////////////////////
////** Space Marine **////
///////////////////////////

/obj/item/clothing/suit/armor/astartes/ultramarine
	name = "Ultramarine power armor"
	desc = "The holy armor of the Ultramarines."
	icon_state = "ultrasuit"
	item_state = "ultrasuit"

/obj/item/clothing/suit/armor/astartes/ravenguard
	name = "Raven Guard power armor"
	desc = "The holy black armor of the Raven Guard."
	icon_state = "ravsuit"
	item_state = "ravsuit"

/obj/item/clothing/suit/armor/astartes/salamander
	name = "Salamander power armor"
	desc = "The holy armor of the Salamanders"
	icon_state = "salsuit"
	item_state = "salsuit"

/obj/item/clothing/suit/armor/astartes/ultramarine/captain
	name = "Ultramarine captain power armor"
	desc = "The holy armor of the Ultramarines captain."
	icon_state = "ultracap"
	item_state = "ultracap"

////////////////////////////////////
////** Captain Space Marines **////
///////////////////////////////////
/obj/item/clothing/suit/armor/astartes/captain/ravenguard
	name = "Raven Guard captain power armor"
	desc = "The holy black armor of the Raven Guard captain."
	icon_state = "ravcap"
	item_state = "ravcap"

/obj/item/clothing/suit/armor/astartes/captain/salamander
	name = "Salamander captain power armor"
	desc = "The holy armor of the Salamander captain"
	icon_state = "salcap"
	item_state = "salcap"

////////////////////////////////////
////**Apothecary Marines**///
///////////////////////////////////

/obj/item/clothing/suit/armor/astartes/apothecary/ultramarine
	name = "Ultramarine apothecary power armor"
	desc = "The holy armor of the Ultramarines apothecary."
	icon_state = "ultrapoth"
	item_state = "ultrapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/ravenguard
	name = "Raven Guard apothecary power armor"
	desc = "The holy black armor of the Raven Guard apothecary."
	icon_state = "ravapoth"
	item_state = "ravapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/salamander
	name = "Salamander apothecary power armor"
	desc = "The holy armor of the Salamanders apothecary"
	icon_state = "salapoth"
	item_state = "salapoth"

////////////////////////////////////
////**TechMarines**///
///////////////////////////////////

/obj/item/clothing/suit/armor/astartes/techmarine/ultramarine
	name = "Ultramarine techmarine power armor"
	desc = "The holy armor of the Ultramarines techmarines."
	icon_state = "ultratech"
	item_state = "ultratech"

/obj/item/clothing/suit/armor/astartes/techmarine/ravenguard
	name = "Raven Guard techmarine power armor"
	desc = "The holy black armor of the Raven Guard techmarines."
	icon_state = "ravtech"
	item_state = "ravtech"

/obj/item/clothing/suit/armor/astartes/techmarine/salamander
	name = "Salamander techmarine power armor"
	desc = "The holy armor of the Salamanders techmarines"
	icon_state = "saltech"
	item_state = "saltech"



