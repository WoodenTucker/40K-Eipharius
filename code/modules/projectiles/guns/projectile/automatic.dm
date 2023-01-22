/obj/item/gun/projectile/automatic //Hopefully someone will find a way to make these fire in bursts or something. --Superxpdude
	name = "template general auto"
	desc = "This shouldnt exist and is bugged or not working. Ahelp immediately."
	icon_state = "saber"	//ugly
	w_class = ITEM_SIZE_NORMAL
	load_method = MAGAZINE
	max_shells = 20
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
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
/*
	//machine pistol, easier to one-hand with
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=3, one_hand_penalty=0, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="automatic",   	 burst=1, fire_delay=3, one_hand_penalty=2, burst_accuracy=list(0,-1,-1), dispersion=null, automatic = 1)
		//list(mode_name="short bursts",   burst=5, fire_delay=null,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)
*/

/obj/item/gun/projectile/automatic/smg
	name = "template smg"
	desc = "This shouldnt exist and is bugged or not working. Ahelp immediately."
	gun_type = GUN_SMG

/obj/item/gun/projectile/automatic/smg/boscelot
	name = "Boscelot Pattern Stub SMG"
	desc = "Chambered in 9mm, as well as being full auto. It is a robust stub SMG for any frontiersmen."
	icon_state = "sten"
	max_shells = 30
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	burst_delay = 1
	automatic = 1
	accuracy = -1
	force = 8
	fire_delay = 1
	sales_price = 10

	magazine_type = /obj/item/ammo_magazine/smgmc9mm
	allowed_magazines = /obj/item/ammo_magazine/smgmc9mm
/*
/obj/item/gun/projectile/automatic/smg/villiers // valhallan
	name = "Villiers Pattern Stub SMG"
	desc = "Chambered in .45 and loved by the Valhallan regiments, this Stub SMG is locked into a burst fire mode, with a high rate of fire. "
	icon_state = "auto_grim" // Object Icon
	item_state = "autorifle" // On-Mob
	loaded_icon = "auto_grim" // Object Icon
	unloaded_icon = "auto_grim-e" // Object Icon
	caliber = ".45"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	fire_sound = 'sound/weapons/gunshot/auto2.ogg'
	move_delay = 2.5
	accuracy = 0
	fire_delay = 3
	sales_price = 40

	magazine_type = /obj/item/ammo_magazine/autogrim
	allowed_magazines = /obj/item/ammo_magazine/autogrim
*/
