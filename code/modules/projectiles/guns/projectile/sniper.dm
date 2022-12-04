


/*
/obj/item/gun/projectile/exitus
	name = "Exitus Sniper Rifle"
	desc = "The Exitus Rifle is a specialised projectile rifle used exclusively by the Imperial Assassins of the Officio Assassinorum's Vindicare Temple. It is purpose-built for each individual Vindicare sniper."
	icon_state = "slayersniper"
	item_state = "slayersniper"
	w_class = ITEM_SIZE_HUGE
	force = 10 //give it to the assfartes for the funny.
	slot_flags = SLOT_BACK|SLOT_S_STORE
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	caliber = "exitus"
	screen_shake = 2 //extra kickback
	handle_casings = EJECT_CASINGS
	load_method = MAGAZINE
	max_shells = 5
	silenced = 1
	str_requirement = 18 //Needs peak human strength to even think about using.
	ammo_type = /obj/item/ammo_casing/exitus
	magazine_type = /obj/item/ammo_magazine/exitus
	allowed_magazines = list(/obj/item/ammo_magazine/exitus, /obj/item/ammo_magazine/exitus/toxin, /obj/item/ammo_magazine/exitus/fire/, /obj/item/ammo_magazine/exitus/explosive)
	one_hand_penalty = 50
	accuracy = 1 //Don't shoot it one-handed.
	scoped_accuracy = 50 //Hit or miss. I guess they never miss, huh? //Due to the way accuracy works, I know this seems incredibly high, but it's actually needed for long range shots to have any reasonable chance of a hit.
	wielded_item_state = "heavysniper-wielded"
	unload_sound = 'sound/weapons/guns/interact/smg_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/smg_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	gun_type = GUN_SNIPER
	far_fire_sound = "sniper_fire"
	sales_price = 0 //Try selling it and you'll get a killteam though.

/obj/item/gun/projectile/exitus/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "slayersniper"
	else
		icon_state = "slayersniper-e"

/obj/item/gun/projectile/exitus/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 4)
*/
