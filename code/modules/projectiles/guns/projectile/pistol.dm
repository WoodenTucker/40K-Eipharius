
/obj/item/gun/projectile/ork/slugga
	name = "slugga"
	desc = "Da classic 'ard 'itting pistal of da slugga boyz. For boyz who wantz to git in noice and klose with der choppa afta! Load'd wid da .75 caliba boolets innit."
	magazine_type = /obj/item/ammo_magazine/ork/slugga
	allowed_magazines = /obj/item/ammo_magazine/ork/slugga
	icon_state = "slugga"
	caliber = ".75"
	can_jam = TRUE //yes it can jam
	accuracy = -4 //WHY WAS IT SO FUCKING ACCURATE BEFORE? IT WAS 0.2!
	force = 20
	move_delay = 1.5
	load_method = MAGAZINE


// BOLT PISTOL

/obj/item/gun/projectile/bolter_pistol
	name = "Garm Pattern Service Bolt Pistol"
	desc = "A human sized bolter pistol, designed for usage by the Commissars of the Officio Prefectus, It also found itself in usage by officers of Astra Militarum, Rogue Traders as well Inquisitorial agents, Thus, it is relatively common and easily found across the Galaxy."
	icon_state = "bpistol"
	item_state = "bpistol"
	force = 10
	caliber = ".75"
	accuracy = -1
	fire_delay = 1.8
	move_delay = 1.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_pistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_pistol_magazine
	slot_flags = SLOT_BELT|SLOT_S_STORE
	sales_price = 38

/obj/item/gun/projectile/bolter_pistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bpistol-10"
	else
		icon_state = "bpistol-10-e"

/obj/item/gun/projectile/bolter_pistol/gold
	name = "Gold Bolt Pistol"
	desc = "A Gold Bolt Pistol. Probably meant to be in the Rogue Trader's armory. What's it doing here?"
	icon_state = "gpistol"
	item_state = "gpistol"
	force = 10
	caliber = ".75"
	accuracy = -1.2
	fire_delay = 2
	move_delay = 5.0 // make it shit and mostly ornamental
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_pistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_pistol_magazine
	slot_flags = SLOT_BELT|SLOT_S_STORE
	sales_price = 110

/obj/item/gun/projectile/bolter_pistol/gold/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "gpistol-10"
	else
		icon_state = "gpistol-e"

/obj/item/gun/projectile/bolter_pistol/inquis
	name = "Drusian Pattern Service Bolt Pistol"
	icon_state = "bpistol"
	item_state = "bpistol"
	force = 15
	caliber = ".75"
	accuracy = -0.5 //VERY well maintained--maintened? eh, you get what i mean!
	fire_delay = 1.4
	move_delay = 1.3
	sales_price = 58

/obj/item/gun/projectile/bolter_pistol/sisterofbattle
	name = "Godwyn-De'az Pattern Bolter Pistol"
	desc = "A heavily modified Bolter Pistol designed for the Adeptas Sororitas, It is more reliable and potent than most Bolt pistol patterns, and because it is designed for human usage, It is much smaller and lighter than most boltpistols, strangely enough, this bolt pistol has a bayonet attached to it.</i>"
	icon_state = "sisterbpistol"
	loaded_icon = "sisterbpistol"
	force = 20 //i don't think that De'az bolt pistols can have bayonets attached to them, but, imma leave this in, oh also, the Mars Pattern Mark II Scourge is the one with a bayonet.
	sharp = 1
	accuracy = 2.2 //normally only 2 of those spawn on the map, one with the sisters, and one on a room in the caves, and they can't even be fabricated
	fire_delay = 1.5 //fastaa!
	move_delay = 1.5 //honestly this is kinda of useless
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	sales_price = 58

/obj/item/gun/projectile/bolter_pistol/sisterofbattle/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sisterbpistol"
	else
		icon_state = "sisterbpistol-e"

/obj/item/gun/projectile/eldar/spistol
	name = "Shuriken pistol"
	desc = "A small shuriken-firing ballistic weapon that is the standard and most common sidearm found amongst Craftworld Aeldari warriors."
	icon_state = "shuriken_pistol"
	str_requirement = 8
	w_class = ITEM_SIZE_NORMAL
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	max_shells = 60
	caliber = "shuriken"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5, TECH_ILLEGAL = 3)
	ammo_type = /obj/item/ammo_casing/shuriken/pistol
	load_method = MAGAZINE
	one_hand_penalty = 0 //Eldar magic
	magazine_type = /obj/item/ammo_magazine/spistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/spistol_magazine
	handle_casings = CLEAR_CASINGS
	auto_eject = 1
	fire_sound = 'sound/weapons/guns/fire/needler_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "scatapult"
	unloaded_icon = "scatapult-e"
	fire_delay = 0.5
	burst = 1
	move_delay = 0
	automatic = 1
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0.5,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=10, fire_delay=1.5,  move_delay=0, one_hand_penalty=1, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.2), automatic = 2)
		)
	gun_type = GUN_AUTOMATIC
	accuracy = 1

/obj/item/gun/projectile/eldar/spistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "shuriken_pistol"
	else
		icon_state = "shuriken_pistol-e"
