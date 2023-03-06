///Hoods for winter coats and chaplain hoodie etc

/obj/item/clothing/suit/storage/hooded
	var/obj/item/clothing/head/winterhood/hood
	var/hoodtype = null //so the chaplain hoodie or other hoodies can override this
	var/suittoggled = 0

/obj/item/clothing/suit/storage/hooded/New()
	MakeHood()
	..()

/obj/item/clothing/suit/storage/hooded/Destroy()
	QDEL_NULL(hood)
	return ..()

/obj/item/clothing/suit/storage/hooded/proc/MakeHood()
	if(!hood)
		hood = new hoodtype(src)

/obj/item/clothing/suit/storage/hooded/ui_action_click()
	ToggleHood()

/obj/item/clothing/suit/storage/hooded/equipped(mob/user, slot)
	if(slot != slot_wear_suit)
		RemoveHood()
	..()

/obj/item/clothing/suit/storage/hooded/proc/RemoveHood()
	if(!hood)
		return
	suittoggled = 0
	update_icon()
	if(ishuman(hood.loc))
		var/mob/living/carbon/H = hood.loc
		H.unEquip(hood, 1)
		H.update_inv_wear_suit()
	hood.forceMove(src)

/obj/item/clothing/suit/storage/hooded/dropped()
	RemoveHood()

/obj/item/clothing/suit/storage/hooded/proc/ToggleHood()
	if(!suittoggled)
		if(ishuman(loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.wear_suit != src)
				to_chat(H, "<span class='warning'>You must be wearing \the [src] to put up the hood!</span>")
				return
			if(H.head)
				to_chat(H, "<span class='warning'>You're already wearing something on your head!</span>")
				return
			else
				H.equip_to_slot_if_possible(hood,slot_head,0,0,1)
				suittoggled = 1
				update_icon()
				H.update_inv_wear_suit()
	else
		RemoveHood()

/obj/item/clothing/suit/storage/hooded/update_icon()
	if(suittoggled)
		icon_state = "[initial(icon_state)]_t"
	else
		icon_state = "[initial(icon_state)]"


/obj/item/clothing/suit/storage/hooded/wintercoat
	name = "winter coat"
	desc = "A heavy jacket made from 'synthetic' animal furs."
	icon_state = "coatwinter"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|HANDS|LEGS|FEET
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	action_button_name = "Toggle Winter Hood"
	hoodtype = /obj/item/clothing/head/winterhood
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/device/flashlight,/obj/item/storage/fancy/cigarettes, /obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask)
	siemens_coefficient = 0.6

/obj/item/clothing/head/winterhood
	name = "winter hood"
	desc = "A hood attached to a heavy winter jacket."
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/hooded/wintercoat/captain
	name = "captain's winter coat"
	icon_state = "coatcaptain"
	armor = list(melee = 0, bullet = 0, laser = 0, energy =10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/hooded/wintercoat/security
	name = "security winter coat"
	icon_state = "coatsecurity"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 15, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/hooded/wintercoat/medical
	name = "medical winter coat"
	icon_state = "coatmedical"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 30, rad = 0)

/obj/item/clothing/suit/storage/hooded/wintercoat/science
	name = "science winter coat"
	icon_state = "coatscience"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 30, rad = 0)

/obj/item/clothing/suit/storage/hooded/wintercoat/engineering
	name = "engineering winter coat"
	icon_state = "coatengineer"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 30)

/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos
	name = "atmospherics winter coat"
	icon_state = "coatatmos"

/obj/item/clothing/suit/storage/hooded/wintercoat/hydro
	name = "hydroponics winter coat"
	icon_state = "coathydro"

/obj/item/clothing/suit/storage/hooded/wintercoat/cargo
	name = "cargo winter coat"
	icon_state = "coatcargo"

/obj/item/clothing/suit/storage/hooded/wintercoat/miner
	name = "mining winter coat"
	icon_state = "coatminer"
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/hooded/hoodie
	name = "hoodie"
	desc = "A warm sweatshirt."
	icon_state = "hoodie"
	item_state = "hoodie"
	min_cold_protection_temperature = T0C - 20
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/hoodiehood

/obj/item/clothing/head/hoodiehood
	name = "hoodie hood"
	desc = "A hood attached to a warm sweatshirt."
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	min_cold_protection_temperature = T0C - 20
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR

/obj/item/clothing/head/inqhood
	name = "inquisitor's hood"
	desc = "A blood red hood with golden trim"
	icon_state = "inqhood"
	item_state = "inqhood"
	body_parts_covered = HEAD
	min_cold_protection_temperature = T0C - 30
	cold_protection = HEAD
	flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEEARS

/obj/item/clothing/head/genehood
	name = "Biologis' hood"
	desc = "An ancient cowl covering a heavily augmented face."
	icon_state = "genetor"
	item_state = "genetor"
	flags_inv = HIDEEARS | BLOCKHAIR
	unacidable = 1
	armor = list(melee = 38, bullet = 30, laser = 40,energy = 40, bomb = 70, bio = 100, rad = 20)
	flags_inv = BLOCKHAIR|BLOCKHEADHAIR|HIDEEARS|HIDEEYES
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/head/mininghood
	name = "mining hood"
	desc = "A black mining hood"
	icon_state = "mortician_hood"
	item_state = "mortician_hood"
	body_parts_covered = HEAD
	min_cold_protection_temperature = T0C - 30
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR

/obj/item/clothing/head/skithood
	name = "skitarii hood"
	desc = "A blood red hood with embroidered with the Adeptus Mechanicus' logo."
	icon_state = "skithood"
	item_state = "skithood"
	body_parts_covered = HEAD
	min_cold_protection_temperature = T0C - 30
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 40, bomb = 20, bio = 100, rad = 100) //gives ranger the same armor as ruststalker, anyone who wants this shit balanced, ping me with the stats you want it to have

/obj/item/clothing/head/rusthood
	name = "ruststalker hood"
	desc = "A shiny hood embroidered with the Adeptus Mechanicus' logo."
	icon_state = "skithood"
	item_state = "skithood"
	body_parts_covered = HEAD|FACE|EYES
	min_cold_protection_temperature = T0C - 30
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	armor = list(melee = 45, bullet = 25, laser = 25, energy = 40, bomb = 20, bio = 100, rad = 100)

/obj/item/clothing/head/vanhelm
	name = "vanguard helmet"
	desc = "A shiny helmet covered in Mechanicus etchings."
	icon_state = "rghelmet2"
	item_state = "rghelmet2"
	body_parts_covered = HEAD|FACE|EYES
	min_cold_protection_temperature = T0C - 30
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	armor = list(melee = 50, bullet = 50, laser = 45, energy = 80, bomb = 50, bio = 100, rad = 160)
