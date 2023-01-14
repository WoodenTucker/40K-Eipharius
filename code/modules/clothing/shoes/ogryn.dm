//im not sure why this is the only thing in this file or why this file exists, it just does, either way, heres the shoes

/obj/item/clothing/shoes/jackboots/ogryn
	name = "Ogryn Combat Boots"
	desc = "Giant slabs of leather and steel hiding Emperor knows what."
	icon = 'icons/mob/32x40/feet.dmi'
	item_icons = list(slot_shoes_str = 'icons/mob/32x40/feet.dmi')
	icon_state = "ogryn_boots"
	item_state = "ogryn_boots"
	armor = list(melee = 60, bullet = 35, laser = 40, energy = 35, bomb = 35, bio = 0, rad = 0)
	//no more ogryn foot pics, remove the 3 lines below to add ogryn foot pics
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP|ITEM_FLAG_NODROP
	canremove = FALSE
	
//giant knife
/obj/item/clothing/shoes/jackboots/ogryn/New()
	..()
	knife = new /obj/item/material/sword/combat_knife/catachan/giant
	update_icon()
