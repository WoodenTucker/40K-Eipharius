/obj/item/gun/projectile/heavy_weapon
	name = "Basic Heavy Weapon"
	desc = "A template heavy weapon, you shouldn't be seeing this."
	name = "template general auto"
	desc = "This shouldnt exist and is bugged or not working. Ahelp immediately."
	icon_state = "saber"	//ugly
	w_class = ITEM_SIZE_NO_CONTAINER
	load_method = MAGAZINE
	max_shells = 20
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	slot_flags = SLOT_BELT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/c9mm
	automatic = 1
	burst_delay = 1
	force = 8
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/smg_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/smg_magin.ogg'
	cock_sound 	 = 'sound/weapons/guns/interact/smg_cock.ogg'
	condition = 10000

// /obj/item/heavy_bolter/afterattack(atom/A, mob/living/user)

	//playsound(src, 'sound/weapons/sound_weapons_guns_fire_30mm.ogg', 100, FALSE)
/obj/item/projectile/bullet/bolterrifle(user:loc)

/obj/item/heavy_bolter_magazine
	name = "Heavy Bolter Magazine"
	desc = "A magazine for a Heavy Bolter"
	icon_state = "ptsdbox"
	icon = 'icons/obj/ammo.dmi'
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	item_state = "ptsdbox"
	matter = list(DEFAULT_WALL_MATERIAL = 500)
	throwforce = 5
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
