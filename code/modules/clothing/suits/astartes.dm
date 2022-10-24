/obj/item/clothing/suit/armor/astartes
	name = "Astartes Mark VII Power Armour"
	icon = 'icons/mob/32x40/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/32x40/suits.dmi')
	icon_state = "umpowerarmor"
	item_state = "umpowerarmor"
	str_requirement = 24 // they can get gibbed and their armor stays. helmet has it, so why not armor too
	canremove = 0
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 140, bullet = 120, laser = 120, energy = 120, bomb = 80, bio = 100, rad = 100)
	sales_price = 120
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT|HIDEGLOVES
	species_restricted = list(SPECIES_ASTARTES)
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	germ_level = 0 //sterile...

// SPESS MUUHREEN TACTICOOL

/obj/item/clothing/suit/armor/astartes/bloodangel
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the sons of the Sanguinius, This one bears the symbol of his position, Tactical Marine of the IXth Chapter, Blood Angels."
	icon_state = "bangsuit"
	item_state = "bangsuit"

/obj/item/clothing/suit/armor/astartes/ravenguard
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XIXth Chapter, Raven Guards."
	icon_state = "ravsuit"
	item_state = "ravsuit"

/obj/item/clothing/suit/armor/astartes/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XVIIIth Chapter, Salamanders."
	icon_state = "salsuit"
	item_state = "salsuit"

/obj/item/clothing/suit/armor/astartes/ultramarine
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XIIIth Chapter, Ultramarines."
	icon_state = "ultrasuit"
	item_state = "ultrasuit"

// SPESS MUUHREEN SIRGENT

/obj/item/clothing/suit/armor/astartes/sergeant/ravenguard
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one is trimmed in golden lining and bears the symbol of his position, Sergeant of the XIXth Chapter, Raven Guards."
	icon_state = "ravcap"
	item_state = "ravcap"

/obj/item/clothing/suit/armor/astartes/sergeant/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one is trimmed in golden lining and bears the symbol of his position, Sergeant of the XVIIIth Chapter, Salamanders."
	icon_state = "salcap"
	item_state = "salcap"

/obj/item/clothing/suit/armor/astartes/ultramarine/sergeant
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one is trimmed in golden lining and bears the symbol of his position, Sergeant of the XIIIth Chapter, Ultramarines."
	icon_state = "ultracap"
	item_state = "ultracap"

// SPESS MUHREEN SPERM MAN

/obj/item/clothing/suit/armor/astartes/apothecary/bloodangel
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Sanguinary Priest of the IXth Chapter, Blood Angels."
	icon_state = "bangapoth"
	item_state = "bangapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/ravenguard
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Apothecary of the XIXth Chapter, Raven Guards."
	icon_state = "ravapoth"
	item_state = "ravapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Apothecary of the XVIIIth Chapter, Salamanders."
	icon_state = "salapoth"
	item_state = "salapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/ultramarine
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Apothecary of the XIIIth Chapter, Ultramarines."
	icon_state = "ultrapoth"
	item_state = "ultrapoth"

// SPESS MUHREEN TOASTER FUCKER

/obj/item/clothing/suit/armor/astartes/techmarine/bloodangel
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the IXth Chapter, Blood Angels."
	icon_state = "bangtech"
	item_state = "bangtech"

/obj/item/clothing/suit/armor/astartes/techmarine/ultramarine
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the XIIIth Chapter, Ultramarines."
	icon_state = "ultratech"
	item_state = "ultratech"

/obj/item/clothing/suit/armor/astartes/techmarine/ravenguard
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the XIXth Chapter, Raven Guards."
	icon_state = "ravtech"
	item_state = "ravtech"

/obj/item/clothing/suit/armor/astartes/techmarine/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the XVIIIth Chapter, Salamanders."
	icon_state = "saltech"
	item_state = "saltech"
