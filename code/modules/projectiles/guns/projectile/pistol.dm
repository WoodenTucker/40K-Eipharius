// 9 mm
/obj/item/gun/projectile/pistol
	name = "template pistol"
	desc = "This should not exist. Please ahelp for staff assistance. Also submit a bug report on discord."
	icon_state = "nurglebpistol"
	item_state = "pistol"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	force = 10
	accuracy = -2.5
	one_hand_penalty = 5
	move_delay = 5
	fire_delay = 6
	sales_price = 10

/obj/item/gun/projectile/pistol/pewter
	name = "Messina Pattern 'Pewter' stub pistol"
	desc = "The locally made 'Pewter' pattern is chambered in 9mm and is more reliable in it's handling than other makeshift 9mm stub pistols. "
	icon_state = "handgun7"
	item_state = "pistol"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = /obj/item/ammo_magazine/mc9mm

	accuracy = -1.5

/obj/item/gun/projectile/pistol/pewter/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "handgun7"
	else
		icon_state = "handgun-e"


/obj/item/gun/projectile/pistol/kieji
	name = "Kieji stub pistol"
	desc = "Barely even a standard template, the 9mm Kieji are manufactured in many different ways. But there are always constants: It will be inaccurate, and unreliable."
	icon_state = "kieji"
	item_state = "pistol"
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = /obj/item/ammo_magazine/mc9mm
	sales_price = 5
	accuracy = -3.5

/obj/item/gun/projectile/pistol/kieji/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "kieji"
	else
		icon_state = "kieji-e"

/obj/item/gun/projectile/pistol/kieji/snub
	name = "Snub nosed Kieji stub pistol"
	desc = "Barely even a standard template, the 9mm Kieji are manufactured in many different ways. But there are always constants: It will be inaccurate, and unreliable. This varient is purposed for a faster firing rate, at the cost of accuracy."
	icon_state = "kiejistub"
	item_state = "pistol"

	accuracy = -5
	fire_delay = 2
	sales_price = 5

/obj/item/gun/projectile/pistol/kieji/snub/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "kiejistub"
	else
		icon_state = "kiejistub-e"

// 45 acp

/obj/item/gun/projectile/pistol/broomhandle
	name = "Messina Pattern 'Broomhandle' stub pistol"
	desc = "An ancient common STC from who knows where. Chambered in .45 and known locally as the 'Broomhandle'. It suffers from a poor fire rate, but is capable of loading SMG standard .45 mags."
	icon_state = "sheetp"
	item_state = "pistol"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc45mm
	allowed_magazines = /obj/item/ammo_magazine/mc45mm

	fire_delay = 7
	screen_shake = 0.2
	sales_price = 20

/obj/item/gun/projectile/pistol/broomhandle/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "sheetp"
	else
		icon_state = "sheetp-e"


/obj/item/gun/projectile/pistol/villiers
	name = "Villiers Pattern stub pistol."
	desc = "This high quality Villiers is chambered in 9mm, crafted with an off planet wood as it's handle and is capable of burst fire, maintaining a high accuracy while doing so."
	icon_state = "stub2"
	item_state = "pistol"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc45mm
	allowed_magazines = /obj/item/ammo_magazine/mc45mm

	fire_delay = 3
	burst = 2
	accuracy = 1
	sales_price = 25


/obj/item/gun/projectile/pistol/villiers/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "stub2"
	else
		icon_state = "stub2-e"


/obj/item/gun/projectile/ork/slugga
	name = "slugga"
	desc = "Da classic 'ard 'itting pistal of da slugga boyz. For boyz who wantz to git in noice and klose with der choppa afta! Load'd wid da .75 caliba boolets innit."
	magazine_type = /obj/item/ammo_magazine/ork/slugga
	allowed_magazines = /obj/item/ammo_magazine/ork/slugga
	icon_state = "slugga"
	caliber = ".75"
	can_jam = TRUE //yes it can jam
	accuracy = -4
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
