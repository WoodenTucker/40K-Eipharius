/obj/item/gun/projectile/heavysniper
	name = "Mk. III Sniper Rifle"
	desc = "The Mark III Sniper rifle is a Needler sniper rifle used by the Imperial Guard for long-range anti-personnel and anti-materiel work."
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	caliber = "14.5mm"
	screen_shake = 2 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SINGLE_LOAD
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/a145
	one_hand_penalty = 50
	accuracy = -2
	scoped_accuracy = 5 //increased accuracy over the LWAP because only one shot
	var/bolt_open = 0
	wielded_item_state = "heavysniper-wielded"
	bulletinsert_sound = 'sound/weapons/guns/interact/sniper_load.ogg'
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	gun_type = GUN_SNIPER
	far_fire_sound = "sniper_fire"

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
	if(!user.zoomed)
		to_chat(user, "<span class='warning'>You can't get a clear shot to fire without looking down the scope!</span>")
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


/obj/item/gun/projectile/heavysniper/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

/obj/item/gun/projectile/heavysniper/lp338
	name = "Mark IV .338 Stub-Rifle"
	desc = "Powerful bolt-action stub-rifle, chambered in .338 for long-range assasinations."
	icon_state = "needler"
	item_state = "needler"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	caliber = ".338"
	screen_shake = 1.25 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|MAGAZINE
	max_shells = 10
	ammo_type = /obj/item/ammo_casing/lp338
	one_hand_penalty = 50
	accuracy = -2
	far_fire_sound = "sniper_fire"

/obj/item/gun/projectile/heavysniper/lp338/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 3)


/obj/item/gun/projectile/heavysniper/lp338/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

/obj/item/gun/projectile/heavysniper/lp338/needler
	name = "Mark IVb Needler Sniper Rifle"
	desc = "Powerful bolt-action needler rifle, chambered in .338 and issued to the Adeptus Astartes for long-range assasinations."
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