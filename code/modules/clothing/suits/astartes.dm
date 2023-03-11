/obj/item/clothing/suit/armor/astartes
	name = "Astartes Mark VII Power Armour"
	icon = 'icons/mob/32x40/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/32x40/suits.dmi')
	icon_state = "umpowerarmor"
	item_state = "umpowerarmor"
	str_requirement = 24 // they can get gibbed and their armor stays. helmet has it, so why not armor too
	canremove = 1
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 90, bullet = 100, laser = 100, energy = 100, bomb = 80, bio = 100, rad = 100)
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
	name = "Indomitus Pattern Terminator Power Armor"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XIIIth Chapter, Ultramarines."
	icon_state = "ultrasuit"
	item_state = "ultrasuit"

/obj/item/clothing/suit/armor/astartes/ultramarine/terminator
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XIIIth Chapter, Ultramarines."
	icon_state = "ultraterm"
	item_state = "ultraterm"

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

/obj/item/clothing/suit/armor/astartes/terminator //FINALLY HERE!
	name = "Indomitus Pattern Tactical Dreadnought Armour"
	icon = 'icons/mob/32x40/suits.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/32x40/suits.dmi')
	icon_state = "umpowerarmor"
	item_state = "umpowerarmor"
	str_requirement = 25
	canremove = 0
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun)
	armor = list(melee = 95, bullet = 85, laser = 85, energy = 85, bomb = 90, bio = 90, rad = 90)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT|HIDEGLOVES
	species_restricted = list(SPECIES_ASTARTES)

/obj/item/clothing/suit/armor/astartes/terminator/shielded //Shielded version
	name = "Indomitus Pattern Tactical Dreadnought Armour"

var/shield_count = 0

/obj/item/clothing/suit/armor/astartes/terminator/shielded/Initialize()
	. = ..()


/obj/item/clothing/suit/armor/astartes/terminator/shielded/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile))
		if(shield_count >= 0)
			var/obj/item/projectile/P = damage_source
			//var/reflectchance = 100 //Defined here, for if you want to make it have X percent chance of blocking the shot,
			var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
			spark_system.set_up(5, 0, user.loc)
			spark_system.start()
			playsound(user.loc, "sparks", 50, 1)
			user.visible_message("<span class='danger'>[user]'s shields deflect [attack_text] in a shower of sparks!</span>")
			shield_count -= 1
			START_PROCESSING(SSobj, src)
			del(P)
		else
			user.visible_message("<span class='warning'>[user]'s shield overloads!</span>")
			user.update_inv_wear_suit()
		return 1
	return 0


/obj/item/clothing/suit/armor/astartes/terminator/shielded/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/armor/astartes/terminator/shielded/Process()
	if(shield_count < 3) //Set this to whatever you want the max number of charges to be.
		sleep(60) //Timer in between recharge.
		shield_count += 1
		playsound(loc, 'sound/effects/compbeep1.ogg', 50, TRUE)
	if(shield_count  == 3) //Whatever the max charge is, this plays the sound.
		playsound(loc, 'sound/machines/ding.ogg', 50, TRUE)
		STOP_PROCESSING(SSobj, src)
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			C.update_inv_wear_suit()

