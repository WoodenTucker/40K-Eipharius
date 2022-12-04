
/obj/item/gun/energy/las/lasgun/longlas
	name = "M35 'M-Galaxy' Longlas"
	desc = "The M35 'M-Galaxy' Lasgun outfitted with advanced barrel and scope is one of the most common and less unique sniper weapons that can be found throughout the Imperial Arsenal, used by Astra Militarum Sharpshooters and Ratling Snipers."
	icon_state = "longlas"
	item_state = "las_musket"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 10
	fire_delay = 8
	accuracy = 1
	move_delay = 4
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 4)
	matter = list(DEFAULT_WALL_MATERIAL = 4000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/longlas
	charge_cost = 300
	cell_type = /obj/item/cell/lasgun/hotshot || /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "las_musket"
	sales_price = 0

	firemodes = list(
		list(mode_name="semi-automatic", move_delay=1.5, one_hand_penalty=9, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=300),
		list(mode_name="overcharge", move_delay=2, one_hand_penalty=9, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/longlas/overcharge, charge_cost=500),
		)

/obj/item/gun/energy/las/lasgun/longlas/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2)

/obj/item/gun/energy/las/lasgun/longlas/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()


/obj/item/gun/energy/las/lasgun/longlas/krieg
	name = "Krieg Pattern Longlas"
	desc = "An overpowered longlas used by Krieg Snipers, it requires expert handling and maintenance to keep in working order. For the death world of Krieg, such gun lore is both common and expected of even the most average of conscripts."
	icon_state = "kriegsniper"
	item_state = "las_musket"



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
