/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Reinforced headgear. Protects the head from impacts."
	icon_state = "helmet"
	drop_sound = 'sound/items/helm_drop.ogg'
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	//restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD
	armor = list(melee = 50, bullet = 50, laser = 50,energy = 25, bomb = 30, bio = 0, rad = 0)
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	var/engraved = FALSE


/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user)
	..()
	if(istype(I, /obj/item/material/sword/combat_knife))
		if(engraved)
			return
		to_chat(user, "You begin to engrave something on your helmet.")
		var/to_engrave = sanitize(input(user, "What would you like to engrave?", "Engraving") as null|text)
		if(to_engrave)
			to_chat(user, "You engrave your helmet with: \"[to_engrave]\"")
			desc += " Engraved on the helmet is: <b>\"[to_engrave]\"</b>"
			log_and_message_admins("[user] has engraved [to_engrave] on his helmet", user, user.loc)
			engraved = TRUE
			return
		return




/obj/item/clothing/head/helmet/nt
	name = "\improper corporate security helmet"
	desc = "A helmet with 'CORPORATE SECURITY' printed on the back in red lettering."
	icon_state = "helmet_nt"

/obj/item/clothing/head/helmet/pcrc
	name = "\improper PCRC helmet"
	desc = "A helmet with 'PRIVATE SECURITY' printed on the back in cyan lettering."
	icon_state = "helmet_pcrc"

/obj/item/clothing/head/helmet/nt/guard
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/nt)

/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "A tan helmet made from advanced ceramic. Comfortable and robust."
	icon_state = "helmet_tac"
	armor = list(melee = 50, bullet = 60, laser = 60, energy = 45, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/merc
	name = "combat helmet"
	desc = "A heavily reinforced helmet painted with red markings. Feels like it could take a lot of punishment."
	icon_state = "helmet_merc"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 35, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/barney_helmet
	name = "security helmet"
	icon_state = "helmet_barney"
	armor = list(melee = 40, bullet = 50, laser = 10, energy = 35, bomb = 30, bio =0, rad = 0)


/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "helmet_riot"
	valid_accessory_slots = null
	body_parts_covered = HEAD|FACE|EYES //face shield
	armor = list(melee = 82, bullet = 15, laser = 5, energy = 5, bomb = 5, bio = 2, rad = 0)
	siemens_coefficient = 0.7
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/helmet/riot/attack_self(mob/user as mob)
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]_up"
		to_chat(user, "You raise the visor on the [src].")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You lower the visor on the [src].")
	update_clothing_icon()

/obj/item/clothing/head/helmet/ablative
	name = "ablative helmet"
	desc = "A helmet made from advanced materials which protects against concentrated energy weapons."
	icon_state = "helmet_reflect"
	valid_accessory_slots = null
	armor = list(melee = 15, bullet = 5, laser = 82, energy = 50, bomb = 5, bio = 2, rad = 0)
	siemens_coefficient = 0

/obj/item/clothing/head/helmet/ballistic
	name = "ballistic helmet"
	desc = "A helmet with reinforced plating to protect against ballistic projectiles."
	icon_state = "helmet_bulletproof"
	valid_accessory_slots = null
	armor = list(melee = 5, bullet = 82, laser = 30, energy = 5, bomb = 30, bio = 2, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "They're often used by highly trained Swat Members."
	icon_state = "helmet_merc"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	valid_accessory_slots = null
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 10, bomb = 25, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	valid_accessory_slots = null
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE
	siemens_coefficient = 1

/*
/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "An armored helmet capable of being fitted with a multitude of attachments."
	icon_state = "swathelm"
	valid_accessory_slots = null
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/helmet.dmi'
		)

	armor = list(melee = 62, bullet = 50, laser = 50,energy = 35, bomb = 10, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
*/

/obj/item/clothing/head/helmet/augment
	name = "Augment Array"
	desc = "A helmet with optical and cranial augments coupled to it."
	icon_state = "v62"
	valid_accessory_slots = null
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	body_parts_covered = HEAD|EYES|BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/flak
	name = "flak helmet"
	desc = "A solid helmet made from several layers of ablative and impact-resistant materials. A good helmet to wear if you're not looking to catch a skull-full of shrapnel."
	icon_state = "guard"
	armor = list(melee = 45, bullet = 40, laser = 40, energy = 35, bomb = 45, bio = 0, rad = 0)
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/sentryhelm
	name = "Sentry Helmet"
	desc = "Used for taking blows to the noggin without getting hurt."
	armor = list(melee = 75, bullet = 75, laser = 55, energy = 40, bomb = 50, bio = 10, rad = 0)//proteck ya neck
	str_requirement = 18

// Ork

/obj/item/clothing/head/helmet/orkhelmet
	name = "Ork Helmet"
	desc = "Literal bucket with horns glued on it, what did you expect?"
	icon_state = "ork_helm"
	item_state = "ork_helm"
	armor = list(melee = 5, bullet = 5, laser = 30, energy = 30, bomb = 10, bio = 0, rad = 0)
	siemens_coefficient = 1
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/two
	icon_state = "orkhelmet"
	item_state = "orkhelmet"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/three
	icon_state = "orkhelmethorns"
	item_state = "orkhelmethorns"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/four
	icon_state = "orkhelmetsight"
	item_state = "orkhelmetsight"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

// Tau

/obj/item/clothing/head/helmet/fw
	name = "fire warrior Helmet"
	desc = "A advanced helmet produced for Tau Fire Warriors, made out Plasteel Ceramic, Thus it's relatively lightweight & durable."
	icon_state = "fwhelm"
	item_state = "fwhelm"
	armor = list(melee = 15, bullet = 60, laser = 60, energy = 45, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.6
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/scout
	name = "fire warrior scout helmet"
	desc = "A advanced helmet produced for Tau Fire Warriors, made out Plasteel Ceramic, Thus it's relatively lightweight & durable."
	icon_state = "scout"
	item_state = "scout"
	armor = list(melee = 30, bullet = 65, laser = 65, energy = 55, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.6
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
// Eldar

/obj/item/clothing/head/helmet/eldar
  name = "Guardian Mesh Helmet"
  desc = "A ancient helmet. It looks like it's made from Thermoplas in a scale like pattern."
  icon_state = "eldhelmet"
  item_state = "eldhelmet"
  armor = list(melee = 35, bullet = 50, laser = 45, energy = 45, bomb = 15, bio = 40, rad = 0)
  body_parts_covered = HEAD
  cold_protection = HEAD
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

 // Dark Eldar

/obj/item/clothing/head/helmet/darkeldar
  name = "Ghostplate Helmet"
  desc = "A ancient helmet. It looks like it's made from hardened resin in a thin-scale like pattern."
  icon_state = "deldhelmet"
  item_state = "deldhelmet"
  armor = list(melee = 35, bullet = 50, laser = 45, energy = 45, bomb = 15, bio = 40, rad = 0)
  body_parts_covered = HEAD
  cold_protection = HEAD
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

