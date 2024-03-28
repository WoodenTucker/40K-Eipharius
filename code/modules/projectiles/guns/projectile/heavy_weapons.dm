/obj/item/gun/projectile/heavy_weapon
	name = "Basic Heavy Weapon"
	desc = "A template heavy weapon, you shouldn't be seeing this."
	name = "template general auto"
	desc = "This shouldnt exist and is bugged or not working. Ahelp immediately."
	icon_state = "saber"	//ugly
	w_class = ITEM_SIZE_NO_CONTAINER
	load_method = MAGAZINE
	max_shells = 20
	caliber = ".95"
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	slot_flags = SLOT_BELT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/bolter/astartes
	automatic = 1
	burst_delay = 1
	force = 8
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/smg_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/smg_magin.ogg'
	cock_sound 	 = 'sound/weapons/guns/interact/smg_cock.ogg'
	condition = 10000
	no_pickup = 1

/obj/item/ammo_magazine/heavy_weapon
	name = "Heavy Weapon Magazine"
	icon_state = "bolty"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".95"
	w_class = ITEM_SIZE_NORMAL
	matter = list(DEFAULT_WALL_MATERIAL = 5260)
	ammo_type = /obj/item/ammo_casing/bolter/astartes
	max_ammo = 80
	multiple_sprites = 0
