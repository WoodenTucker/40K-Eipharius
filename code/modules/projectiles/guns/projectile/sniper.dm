/obj/item/gun/projectile/heavysniper
	name = "Mk. III Sniper Rifle"
	desc = "The Mark III Sniper rifle is a Needler sniper rifle used by the Imperial Guard for long-range anti-personnel and anti-materiel work."
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = ITEM_SIZE_HUGE
	force = 10 //give it to the assfartes for the funny.
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
	scoped_accuracy = 5 //increased accuracy over the LWAP because only one shot //Walker here, i doubt that this does anything, but imma just leave it in.
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

/obj/item/gun/energy/sniperrifle
	name = "marksman energy rifle"
	desc = "The HI DMR 9E is an older design of Hephaestus Industries. A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon to kill from a distance."
	icon_state = "sniper"
	item_state = "laser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	one_hand_penalty = 5 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	slot_flags = SLOT_BACK
	charge_cost = 40
	max_shots = 4
	fire_delay = 10
	force = 10
	w_class = ITEM_SIZE_HUGE
	accuracy = -2 //shooting at the hip
	scoped_accuracy = 0
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/sniperrifle/update_icon()
	..()
	item_state_slots[slot_back_str] = icon_state //so that the on-back overlay uses the different charged states

/obj/item/gun/energy/sniperrifle/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2.0)


/obj/item/gun/energy/las/lasgun/longlas
	name = "M35 'M-Galaxy' Longlas"
	desc = "The M35 'M-Galaxy' Lasgun outfitted with advanced barrel and scope is one of the most common and less unique sniper weapons that can be found throughout the Imperial Arsenal, used by Astra Militarum Sharpshooters and Ratling Snipers."
	icon_state = "longlas"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 3.4
	fire_delay = 4.5
	accuracy = -3.5
	move_delay = 4
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 4)
	matter = list(DEFAULT_WALL_MATERIAL = 4000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/longlas
	charge_cost = 200
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=4.5, move_delay=1.5, one_hand_penalty=3.4, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="overcharge", fire_delay = 4.95, move_delay=2, one_hand_penalty=4.25, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/longlas/overcharge, charge_cost=400),
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
