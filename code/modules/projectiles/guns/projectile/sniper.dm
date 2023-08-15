/obj/item/gun/projectile/heavysniper
	name = "Agrinpinaa Pattern Heavy Sniper Rifle"
	desc = "The Agrinpinaa Pattern Heavy Sniper Rifle is used by the Imperial Guard for long-range anti-personnel and anti-materiel work."
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = "14.5mm"
	screen_shake = 2 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SINGLE_LOAD
	max_shells = 3
	ammo_type = /obj/item/ammo_casing/a145
	one_hand_penalty = 2
	accuracy = 0
	scoped_accuracy = 1 //increased accuracy over the LWAP because only one shot //Walker here, i doubt that this does anything, but imma just leave it in.
	var/bolt_open = 0
	wielded_item_state = "heavysniper-wielded"
	bulletinsert_sound = 'sound/weapons/guns/interact/sniper_load.ogg'
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	gun_type = GUN_SNIPER
	far_fire_sound = "sniper_fire"
	sales_price = 30

/obj/item/gun/projectile/heavysniper/update_icon()
	..()
	if(bolt_open)
		icon_state = "heavysniper-open"
	else
		icon_state = "heavysniper"

/obj/item/gun/projectile/heavysniper/examine(mob/user, distance)
	. = ..()
	if(bolt_open)//These guns do not chamber until their fired.
		if(loaded.len)//However, fired rounds will eject automatically when the bolt is open, so there's a good chance the round is live.
			to_chat(user, "There is a <span class='bnotice'>ROUND</span> in the chamber.")//But someone could still place a fired round into this gun, so best to just be generic.
		else
			to_chat(user, "<span class='danger'>The chamber is <b>EMPTY</b>.")

/obj/item/gun/projectile/heavysniper/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src, 'sound/weapons/guns/interact/bolt_open.ogg', 50)
		if(chambered)
			to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			playsound(src, casingsound, 100)
			chambered.loc = get_turf(src)
			loaded -= chambered
			chambered = null
		else
			to_chat(user, "<span class='notice'>You work the bolt open.</span>")
	else
		to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
		bolt_open = 0
		playsound(src, 'sound/weapons/guns/interact/bolt_close.ogg', 50)
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/heavysniper/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/gun/projectile/heavysniper/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/heavysniper/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/heavysniper/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2)

/obj/item/gun/energy/las/lasgun/longlas
	name = "M35 'M-Galaxy' Longlas"
	desc = "The M35 'M-Galaxy' Lasgun outfitted with advanced barrel and scope is one of the most common and less unique sniper weapons that can be found throughout the Imperial Arsenal, used by Astra Militarum Sharpshooters and Ratling Snipers."
	icon_state = "longlas"
	item_state = "longlas"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 2.1
	fire_delay = 8
	accuracy = 1
	move_delay = 4
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 4000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/longlas
	charge_cost = 300
	cell_type = /obj/item/cell/lasgun/hotshot || /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "longlas-wielded"
	sales_price = 50

	firemodes = list(
		list(mode_name="semi-automatic", move_delay=1.5, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=300),
		list(mode_name="overcharge", move_delay=2, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/longlas/overcharge, charge_cost=500),
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
	item_state = "snipeluscius"
	wielded_item_state = "snipeluscius-wielded"

/obj/item/gun/projectile/thrower
	name = "Lead Thrower"
	desc = "The Lead Thrower is a primitive effort in capable calibers on a small scale. It will take forever to reload, but if it hits, it will be devastating. Chambered in Bolter .75"
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "musket"
	item_state = "musket"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK
	caliber = ".75"
	screen_shake = 2.5
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SINGLE_LOAD
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/bolter
	one_hand_penalty = 1.5
	accuracy = 1.5
	var/bolt_open = 0
	wielded_item_state = "musket-wielded"
	bulletinsert_sound = 'sound/weapons/guns/interact/arm_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/musket_fire.ogg'
	gun_type = GUN_SNIPER
	sales_price = 2

/obj/item/gun/projectile/heavysniper/update_icon()
	..()
	if(bolt_open)
		icon_state = "musket-e"
	else
		icon_state = "musket"

/obj/item/gun/projectile/thrower/examine(mob/user, distance)
	. = ..()
	if(bolt_open)//These guns do not chamber until their fired.
		if(loaded.len)//However, fired rounds will eject automatically when the bolt is open, so there's a good chance the round is live.
			to_chat(user, "There is a <span class='bnotice'>ROUND</span> in the chamber.")//But someone could still place a fired round into this gun, so best to just be generic.
		else
			to_chat(user, "<span class='danger'>The chamber is <b>EMPTY</b>.")

/obj/item/gun/projectile/thrower/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(bolt_open)
		playsound(src, 'sound/weapons/guns/interact/bolt_open.ogg', 50)
		if(chambered)
			to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			playsound(src, casingsound, 100)
			chambered.loc = get_turf(src)
			loaded -= chambered
			chambered = null
		else
			to_chat(user, "<span class='notice'>You work the bolt open.</span>")
	else
		to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
		bolt_open = 0
		playsound(src, 'sound/weapons/guns/interact/bolt_close.ogg', 50)
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/thrower/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/gun/projectile/thrower/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/thrower/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()


/obj/item/gun/projectile/automatic/galvanic/rifle
	name = "Mark IV Arkhan Pattern Galvanic Rifle"
	desc = "A semi automatic rifle, modelled after the martian flintlock weapons of the past, it uses servo-eletric rounds which send a powerful eletric current through the targets body while also tracking them."
	icon_state = "galvrifle"
	item_state = "musket"
	loaded_icon = "galvrifle"
	unloaded_icon = "galvrifle-e"
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	wielded_item_state = "las_musket"
	unwielded_loaded_icon = "musket"
	wielded_loaded_icon = "las_musket"
	unwielded_unloaded_icon = "musket"
	wielded_unloaded_icon = "las_musket"
	caliber = "galvanic"
	max_shells = 7 //Fits seven rounds in the mag, with a revolving cylinder. No room for extra rounds.
	str_requirement = 17
	move_delay = 3
	one_hand_penalty = 2.2
	accuracy = 1 //extremely accurate
	fire_delay = 4.9
	slot_flags = SLOT_BACK|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/galvanic
	allowed_magazines = list(/obj/item/ammo_magazine/galvanic, /obj/item/ammo_magazine/galvanic/fire, /obj/item/ammo_magazine/galvanic/emp, /obj/item/ammo_magazine/galvanic/airburst, /obj/item/ammo_magazine/galvanic/pain)
	firemodes = list()
	w_class = ITEM_SIZE_LARGE

/obj/item/gun/projectile/automatic/galvanic/rifle/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2)

/obj/item/gun/projectile/automatic/galvanic/rifle/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

//needs sorting when im done doing this, i have not balanced it in any way whatsoever, just brought it from deleted code

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338
	name = "Mark IV .338 Stub Rifle"
	desc = "Powerful sniper rifle, chambered in .338 for long-range assasinations."
	icon_state = "needler"
	item_state = "needler"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = ".338"
	screen_shake = 1.2 //extra kickback
	max_shells = 10
	ammo_type = /obj/item/ammo_casing/lp338
	one_hand_penalty = 2.3
	accuracy = 1.4
	gun_type = GUN_SNIPER
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	far_fire_sound = "sniper_fire"
	gping = FALSE
	sales_price = 0
/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1
	toggle_scope(usr, 2.5)
/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()
/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338/needler
	name = "Mark IVb Needler Sniper Rifle"
	desc = "Powerful needler rifle, chambered in .338 and issued to the Adeptus Astartes for long-range assasinations."
	fire_sound = 'sound/weapons/guns/fire/needler_fire.ogg'
	far_fire_sound = "needler_fire"
/obj/item/ammo_magazine/lp338
	name = "magazine (.338 Lapua Magnum)"
	icon_state = "needler"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".338"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/lp338
	max_ammo = 10
	multiple_sprites = 0
/obj/item/ammo_magazine/lp338/jhp
	name = "magazine (.338 Lapua Magnum JHP)"
	ammo_type = /obj/item/ammo_casing/lp338/jhp
/obj/item/ammo_magazine/lp338/jhp/empty
	ammo_type = /obj/item/ammo_casing/lp338/jhp
	initial_ammo = 0
/obj/item/ammo_magazine/lp338/empty
	initial_ammo = 0
/obj/item/ammo_magazine/lp338/needler
	name = "magazine (.338 Needler Rifle)"
	desc = "Toxin-coated needles, when you need to deal with some extradimensional baddies to not ruin the reality. Or to just kill an enemy leader with style."
	ammo_type = /obj/item/ammo_casing/lp338/needler
	max_ammo = 5
/obj/item/ammo_magazine/lp338/needler/empty
	ammo_type = /obj/item/ammo_casing/lp338/needler
	initial_ammo = 0
/obj/item/ammo_casing/lp338
	desc = "A .338 Lapua Magnum bullet casing."
	caliber = ".338"
	projectile_type = /obj/item/projectile/bullet/rifle/lp338
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/lp338/jhp
	desc = "A .338 Lapua Magnum bullet casing."
	caliber = ".338"
	projectile_type = /obj/item/projectile/bullet/rifle/lp338/jhp
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/ammo_casing/lp338/needler
	desc =   "A spent .338 needler casing."
	projectile_type = /obj/item/projectile/bullet/rifle/lp338/needler
/obj/item/projectile/bullet/rifle/lp338
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	damage = 130
	armor_penetration = 45
	penetration_modifier = 1.5
	penetrating = TRUE

/obj/item/projectile/bullet/rifle/lp338/jhp
	name = "JHP bullet"
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	damage = 160
	armor_penetration = 5

/obj/item/projectile/bullet/rifle/lp338/needler
	name = "needler bullet"
	fire_sound = 'sound/weapons/gunshot/needler.ogg'
	damage = 90
	damage_type = TOX
	penetration_modifier = 2



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
	one_hand_penalty = 2.5
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
