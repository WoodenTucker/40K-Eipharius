
// Accuracy Guide. Accuracy of -4 = Miss 1/3 shots on average. Accuracy of 0 = You never miss. Make sure weapon accuracy is never higher then -1 unless you want perfect accuracy.
// Skills ONLY effect weapon spread. If the skill of a character is below 6 they'll have a hard time hitting anything.




// Bolt Rifles
/obj/item/gun/projectile/boltrifle //boltus
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XIIIth Chapter Ultramarines's colour scheme."
	icon_state = "ultrabolter"
	str_requirement = 18 //IS12 has a 20 str cap so dont go over it
	w_class = ITEM_SIZE_HUGE
	force = 30
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	caliber = ".75"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/bolter
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_rifle_magazine
	allowed_magazines = list(/obj/item/ammo_magazine/bolt_rifle_magazine, /obj/item/ammo_magazine/bolt_rifle_magazine/kp, /obj/item/ammo_magazine/bolt_rifle_magazine/ms)
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "ultrabolter-30"
	unloaded_icon = "ultrabolter-e"
	wielded_item_state = "hbolter" // Do not remove this. We do not have any sprites for Bolters on-mob beyond this, it is perfect.
	unwielded_loaded_icon = "hbolter"
	wielded_loaded_icon = "hbolter"
	unwielded_unloaded_icon = "hbolter-e"
	wielded_unloaded_icon = "hbolter-e"
	fire_delay = 2
	burst = 1
	move_delay = 3
	one_hand_penalty = 10
	firemodes = list()
	gun_type = GUN_AUTOMATIC
	accuracy = 2
	sales_price = 100

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=4, burst_accuracy=list(0,0,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)

/obj/item/gun/projectile/boltrifle/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ultrabolter-30"
	else
		icon_state = "ultrabolter-e"

/obj/item/gun/projectile/boltrifle/raven
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XIXth Chapter Raven Guards's colour scheme."
	icon_state = "ravenbolter"
	loaded_icon = "ravenbolter-30"
	unloaded_icon = "ravenbolter-e"

/obj/item/gun/projectile/boltrifle/ravenbolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ravenbolter-30"
	else
		icon_state = "ravenbolter-e"

/obj/item/gun/projectile/boltrifle/sally
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XVIIIth Chapter Salamanders's colour scheme."
	icon_state = "sallybolter"
	loaded_icon = "sallybolter-30"
	unloaded_icon = "sallybolter-e"

/obj/item/gun/projectile/boltrifle/sally/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sallybolter-30"
	else
		icon_state = "sallybolter-e"

/obj/item/gun/projectile/boltrifle/bang
	name = "Baal Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in IXth Chapter Blood Angels's colour scheme."
	icon_state = "bangbolter"
	loaded_icon = "bangbolter-30"
	unloaded_icon = "bangbolter-e"

/obj/item/gun/projectile/boltrifle/bang/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bangbolter-30"
	else
		icon_state = "bangbolter-e"

/obj/item/gun/projectile/boltrifle/lockebolter //needs lots of work and love, ok standin for now
	name = "Locke Pattern bolter"
	desc = " Often found in hands of Astra Militarum officers, veterans and Commissar, Though relatively uncommon. It is a human-sized Bolter, Thus it's very popular among the troops and the lucky ones who get their hands on one of these bad boy."
	icon_state = "lockebolter"
	str_requirement = 10
	w_class = ITEM_SIZE_HUGE
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 15
	caliber = ".75"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/bolter
	load_method = MAGAZINE
	one_hand_penalty = 10 //its a bolter not a toy gun
	magazine_type = /obj/item/ammo_magazine/bolt_rifle_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_rifle_magazine
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "lockebolter-30"
	unloaded_icon = "lockebolter-e"
	wielded_item_state = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	fire_delay = 2.4
	burst = 1
	move_delay = 3
	firemodes = list()
	gun_type = GUN_AUTOMATIC
	accuracy = -0.5
	sales_price = 0

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2.4, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=4.6, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)

/obj/item/gun/projectile/lockebolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "lockebolter-30"
	else
		icon_state = "lockebolter-e"

/obj/item/gun/projectile/boltrifle/lockebolter/infernobolter
	name = "Inferno Bolter"
	desc = "Corrupted by the warp, this bolter once was owned by a Heretic Astartes. The chaos infused into it made it capable of being fired by a human. But it's capabilities have suffered. Just as planned."
	icon_state = "1kbolter"
	loaded_icon = "1kbolter-30"
	unloaded_icon = "1kbolter-e"
	accuracy = 1
/obj/item/gun/projectile/lockebolter/infernobolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "1kbolter-30"
	else
		icon_state = "1kbolter-e"

/obj/item/gun/projectile/boltrifle/sisterbolter
	name = "Godwyn-De'az Pattern Bolter Rifle"
	desc = "A modified bolter rifle, developed specifically for the Adepta Sororitas. This rifle is almost more scripture than weapon, and is clearly wielded by a devout woman. A large Sarissa is attached to the end of it, useful for carving the Emperor's Mercy from the flesh of those who defy him. <i>She was an angel, pure as righteous destruction. She laid low the twisted and lifted the hearts of the righteous. At her passing, a million voices cried out her name. Shall we ever again see her like? No, not now, nor ever again...</i>"
	force = 20 //what even is this description?
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	str_requirement = 14
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	caliber = ".75"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/bolter
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_rifle_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_rifle_magazine
	one_hand_penalty = 10 //its still a bolter bro...
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "sisterbolter-30"
	unloaded_icon = "sisterbolter-30-e"
	wielded_item_state = "autoshotty"
	loaded_icon = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	fire_delay = 1.9
	burst = 1
	move_delay = 3
	firemodes = list()
	accuracy = 2.2 //only one gun per round so yeah
	gun_type = GUN_AUTOMATIC
	sales_price = 130

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=1.9, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3.8, burst_accuracy=list(0,-1,-1), dispersion=null, automatic = 0),
		)

/obj/item/gun/projectile/boltrifle/sisterbolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sisterbolter-30"
	else
		icon_state = "sisterbolter-30-e"

//ORKA

// NEEDS BALANCING ! //
/*
/obj/item/gun/projectile/ork/automatic/shoota
	name = "Shoota"
	desc = "A tree borst shoota. Da mekboyz even added dem coolin holes fer de barrel for ya, be grateful ya git! Load'd wid da .75 caliba boolets innit."
	icon_state = "shoota"
	item_state = "shoota"
	w_class = ITEM_SIZE_LARGE
	force = 25
	max_shells = 30
	caliber = ".75"
	can_jam = TRUE
	move_delay = 5
	one_hand_penalty = 5
	accuracy = -5
	ammo_type = /obj/item/ammo_casing/ork/shoota
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ork/shoota
	allowed_magazines = list(/obj/item/ammo_magazine/ork/shoota)
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	gun_type = GUN_AUTOMATIC
	fire_delay = 3
	burst = 3
	sales_price = 15

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="4-round bursts", burst=4, fire_delay=6, burst_accuracy=list(-1,-1,-1), dispersion=list(0.2, 0.4, 0.3), automatic = 0),
		)



/obj/item/gun/projectile/ork/automatic/shoota/bladed
	name = "Bladed Shoota"
	desc = "A tree borst Shoota. Da mekboyz even added dem coolin holes fer de barrel for ya, be grateful ya git! Dey added a STABBY on the end, too! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootabayo"
	item_state = "shootabayo"
	w_class = ITEM_SIZE_LARGE
	force = 33
	max_shells = 30
	caliber = ".75"
	one_hand_penalty = 7
	sales_price = 20

/obj/item/gun/projectile/ork/automatic/shoota/kustom
	name = "Kustom Shoota"
	desc = "Da fancy pants kustom shoota for a 'eal smarty boy! Ya move fast and shoot even fasta! CAUSE IT'S RED! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootakustom"
	item_state = "shootakustom"
	force = 20
	move_delay = 1 // smg
	one_hand_penalty = 2
	accuracy = -4
	sales_price = 25

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="6-round bursts", burst=6, fire_delay=7, burst_accuracy=list(-1,-1,-1), dispersion=list(0.2, 0.4, 0.5), automatic = 0),
		)

/obj/item/gun/projectile/ork/automatic/shoota/big
	name = "Big Shoota"
	desc = "Da biggest shoota, a shoota boy can get! Just holdin' dis 'ere gun makez ya wanna neva let go of da trigga, dat wood be very UNORKY! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootabig"
	item_state = "shootabig"
	w_class = ITEM_SIZE_LARGE
	force = 15 // heffy and slow to hit wid innit
	max_shells = 50
	caliber = ".75"
	can_jam = TRUE
	move_delay = 10
	one_hand_penalty = 15
	accuracy = -6
	gun_type = GUN_AUTOMATIC
	fire_delay = 8
	burst = 5
	automatic = 0.6
	firemodes = list(
		list(mode_name="'ORMAL AUTO'", burst=4, fire_delay=4, burst_accuracy=list(-3,-5,-6), dispersion=list(0.4, 0.5, 0.6), automatic = 0.5),
		list(mode_name="FULLA AUTO", burst=6, fire_delay=5.5, burst_accuracy=list(-6,-5,-8), dispersion=list(0.7, 0.6, 0.5), automatic = 0.7),

	)
	sales_price = 30

/obj/item/gun/projectile/ork/automatic/shoota/furtha
	name = "Furtha Shoota"
	desc = "Fur em gitz dat like to shoot from afar! Da scope is busted, blame da gretchin! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootafurtha"
	item_state = "shootafurtha"
	force = 15
	move_delay = 8
	one_hand_penalty = 15
	accuracy = -3.5
	gun_type = GUN_SNIPER
	sales_price = 50

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		)


//Eldar

/obj/item/gun/projectile/eldar/scatapult
	name = "Shuriken Catapult"
	desc = "A large shuriken-firing ballistic weapon that is the standard and most common armament found amongst Craftworld Aeldari warriors."
	icon_state = "scatapult"
	str_requirement = 12
	w_class = ITEM_SIZE_LARGE
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 1000 //Lots of ammo
	caliber = "shuriken"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5, TECH_ILLEGAL = 3)
	ammo_type = /obj/item/ammo_casing/shuriken
	load_method = MAGAZINE
	one_hand_penalty = 1 //Eldar magic
	magazine_type = /obj/item/ammo_magazine/catapult_magazine
	allowed_magazines = /obj/item/ammo_magazine/catapult_magazine
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
		list(mode_name="semiauto",       burst=1, fire_delay=0.5, one_hand_penalty=1, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=10, fire_delay=1.5, one_hand_penalty=2, burst_accuracy=list(0,1,1), dispersion=list(0.0, 0.1, 0.2), automatic = 2)
		)
	gun_type = GUN_AUTOMATIC
	accuracy = 1

/obj/item/gun/projectile/eldar/scatapult/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "scatapult"
	else
		icon_state = "scatapult-e"

/obj/item/gun/projectile/automatic/galvanicrifle
	name = "Mark IV Arkhan Pattern Galvanic Rifle"
	desc = "A semi automatic rifle, modelled after the flintlock weapons of the past. Favoured by Skitarii rangers, this weapon is incredibly dangerous."
	icon_state = "galvrifle" // OBJ (Make sure when adding any projectile gun to include an icon version with -0 at the end. e.g. snipermusket-0 or it will break)
	item_state = "musket" // ON MOB (This uses a different on-mob to wielded due to sniper musket not having a one handed icon)
	loaded_icon = "galvrifle" // OBJ
	unloaded_icon = "galvrifle" // OBJ
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	wielded_item_state = "las_musket"
	unwielded_loaded_icon = "musket"
	wielded_loaded_icon = "las_musket"
	unwielded_unloaded_icon = "musket"
	wielded_unloaded_icon = "las_musket"
	caliber = "galvanic"
	max_shells = 7
	str_requirement = 13
	move_delay = 4
	one_hand_penalty = 7
	accuracy = 0
	fire_delay = 4.9
	slot_flags = SLOT_BACK|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/galvanic
	allowed_magazines = list(/obj/item/ammo_magazine/galvanic, /obj/item/ammo_magazine/galvanic/fire)
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO

*/

/obj/item/gun/projectile/automatic/radcarbine
	name = "Radium Carbine"
	desc = "A deadly and highly dangerous personal weapon that are used exclusively by the forces of the Skitarii Legions of the Adeptus Mechanicus. It fires highly radioactive rounds."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "emitter_carbine"
	loaded_icon = "emitter_carbine"
	unloaded_icon = "emitter_carbine_e"
	item_state = "emitter_carbine"
	wielded_item_state = "laer"
	fire_sound = 'sound/weapons/gunshot/shotgun3.ogg'
	unwielded_loaded_icon = "emitter_carbine"
	wielded_loaded_icon = "laer"
	unwielded_unloaded_icon = "emitter_carbine_e"
	wielded_unloaded_icon = "laer"
	caliber = "rad"
	max_shells = 30
	str_requirement = 11
	move_delay= 4
	one_hand_penalty = 4
	accuracy = 0.5 //Good gun, well maintained by the Mechanicus
	fire_delay = 3.5
	slot_flags = SLOT_BACK|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/radcarbine
	allowed_magazines = list(/obj/item/ammo_magazine/radcarbine)
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO

/obj/item/gun/projectile/automatic/radcarbine/radpistol
	name = "Radium Pistol"
	desc = "A sidearm favoured by Skitarii Vanguards and Ranger Alphas."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "teslar"
	item_state = "pulse_pistol"
	wielded_item_state = "pulse_pistol"
	fire_sound = 'sound/weapons/gunshot/shotgun3.ogg'
	loaded_icon = "teslar"
	unwielded_loaded_icon = "pulse_pistol"
	wielded_loaded_icon = "pulse_pistol"
	unloaded_icon = "teslar0"
	unwielded_unloaded_icon = "pulse_pistol0"
	wielded_unloaded_icon = "pulse_pistol0"
	caliber = "rad"
	max_shells = 10
	str_requirement = 11
	move_delay= 2
	one_hand_penalty = 1
	accuracy = 0.6 //Good gun, well maintained by the Mechanicus
	fire_delay = 2.5
	slot_flags = SLOT_BELT|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/radcarbine/radpistol
	allowed_magazines = list(/obj/item/ammo_magazine/radcarbine/radpistol)
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO
