/obj/item/gun/projectile/automatic //Hopefully someone will find a way to make these fire in bursts or something. --Superxpdude
	name = "template SMG"
	desc = "This shouldnt exist and is bugged or not working. Ahelp immediately."
	icon_state = "saber"	//ugly
	w_class = ITEM_SIZE_NORMAL
	load_method = MAGAZINE
	max_shells = 20
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c9mm
	multi_aim = 1
	burst_delay = 2
	force = 8
	fire_delay = 2.2
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

