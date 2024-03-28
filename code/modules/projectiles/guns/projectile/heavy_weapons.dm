/obj/item/gun/projectile/heavy_weapon
	name = "Basic Heavy Weapon"
	desc = "A template heavy weapon, you shouldn't be seeing this."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "saber"	//ugly
	w_class = ITEM_SIZE_NO_CONTAINER
	load_method = MAGAZINE
	max_shells = 80
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

/obj/item/gun/projectile/heavy_weapon/heavy_bolter
	name = "Heavy Bolter"
	desc = "A Heavy Bolter used by the Astra Militarum, this one appears to be just light enough for a single person to carry on their own, although it needs to be set up before firing."
	icon_state = "hmg"
	w_class = ITEM_SIZE_NO_CONTAINER
	load_method = MAGAZINE
	max_shells = 80
	caliber = ".95"
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	slot_flags = SLOT_BELT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/bolter/astartes
	automatic = 1
	burst_delay = 1
	force = 8
	magazine_type = /obj/item/ammo_magazine/heavy_weapon/heavy_bolter
	allowed_magazines = /obj/item/ammo_magazine/heavy_weapon/heavy_bolter
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound = 'sound/weapons/guns/interact/smg_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/smg_magin.ogg'
	cock_sound 	 = 'sound/weapons/guns/interact/smg_cock.ogg'
	condition = 10000
	no_pickup = 1

/obj/item/ammo_magazine/heavy_weapon/heavy_bolter
	name = "Heavy Bolter Magazine"
	icon_state = "bolty"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".95"
	w_class = ITEM_SIZE_NORMAL
	matter = list(DEFAULT_WALL_MATERIAL = 5260)
	ammo_type = /obj/item/ammo_casing/bolter/astartes
	max_ammo = 80
	multiple_sprites = 0

/*

//STRUCTURES

//The mortar shell launcher item. This is the one you use.
/obj/item/heavy_weapon_emplaced
	name = "Heavy Weapon Base Template"
	desc = "A basic fire support heavy weapon template. Report this to an admin if you see it.."
	icon = 'icons/obj/items/mortars.dmi'
	icon_state = "mortar_tube"
	item_state = "mortar_tube"
	var/ammo_type = null
	var/loaded = FALSE
	var/deployed = FALSE
	var/ammo_count = 0
	var/burst_size = 1
	var/automatic_fire = 0


/obj/item/heavy_weapon_emplaced/attackby(obj/item/W, mob/user)
	. = ..()
	if(!istype(W, /obj/item/ammo_magazine/heavy_weapon_emplaced)
		return
	if(loaded)
		to_chat(user, "The gun is already loaded!")
		return
	if(!deployed)
		to_chat(user, "I have to deploy the platform first!")
		return
	var/obj/item/ammo_magazine/heavy_weapon_emplaced/E = W
	loaded = TRUE
	ammo_type = E.ammo_type
	ammo_count = E.ammo_count
	playsound(src, 'sound/weapons/mortar_load.ogg', 100, FALSE)
	user.visible_message("<span class='danger'>[user] loads the [src] with \the [W]!</span>")
	qdel(W)
	update_icon()


/obj/item/heavy_weapon_emplaced/update_icon(var/mob/living/carbon/human/H)
	if(deployed)
		item_state = "blank"
	else
		item_state = "mortar_tube"

	if(istype(H))
		H.regenerate_icons()
	..()

/obj/item/heavy_weapon_emplaced/afterattack(atom/A, mob/living/user)
	..()
	if(!deployed)//Can't fire.
		to_chat(user, "<span class='danger'>I can't fire it if it's not deployed.</span>")
		return
	if(!loaded)//Nothing to fire.
		to_chat(user, "<span class='danger'>It's not loaded.</span>")
		return
	if(!user.zoomed)
		to_chat(user, "<span class='danger'>I must zoom into the distance to get a good shot in on.</span>")
		return
	var/obj/item/I = user.get_inactive_hand()
	if(I)
		to_chat(user, "<span class='danger'>I need a free hand for this.</span>")
		return
	fire_heavy_weapon(A, user, loaded_with)
	QDEL_NULL(loaded)

/obj/item/heavy_weapon_emplaced/proc/fire_heavy_weapon()


/obj/item/mortar_launcher/attack_self(mob/user)
	. = ..()
	if(deployed)//If there's a mortar deployed, then pack it up again.
		pack_up_mortar(user)
	else
		deploy_mortar(user)//Otherwise, deploy that motherfucker.

/obj/item/mortar_launcher/proc/deploy_mortar(mob/user)
	for(var/obj/structure/mortar_launcher_structure/M in user.loc)//If there's already a mortar there then don't deploy it. Dunno how that's possible but stranger things have happened.
		if(M)
			to_chat(user, "There is already a mortar here.")
			return
	user.visible_message("[user] starts to deploy the [src]")
	if(!do_after(user,30))
		return
	var/obj/structure/mortar_launcher_structure/M = new(get_turf(user)) //Make a new one here.
	M.dir = user.dir
	switch(M.dir)
		if(EAST)
			user.pixel_x -= 5
		if(WEST)
			user.pixel_x += 5
		if(NORTH)
			user.pixel_y -= 5
		if(SOUTH)
			user.pixel_y += 5
			M.plane = ABOVE_HUMAN_PLANE
	deployed = TRUE
	playsound(src, 'sound/weapons/mortar_deploy.ogg', 100, FALSE)
	update_icon(user)

/obj/item/mortar_launcher/proc/pack_up_mortar(mob/user)
	user.visible_message("[user] packs up the [src]")
	for(var/obj/structure/mortar_launcher_structure/M in user.loc)
		switch(M.dir)//Set our offset back to normal.
			if(EAST)
				user.pixel_x += 5
			if(WEST)
				user.pixel_x -= 5
			if(NORTH)
				user.pixel_y += 5
			if(SOUTH)
				user.pixel_y -= 5
		qdel(M) //Delete the mortar structure.
	deployed = FALSE
	update_icon(user)

/obj/item/mortar_launcher/dropped(mob/user)
	. = ..()
	if(deployed)
		pack_up_mortar(user)

/obj/structure/mortar_launcher_structure //That thing that's created when you place down your mortar, purely for looks.
	name = "Deployed Astra Militarum Squad Mortar"
	icon = 'icons/obj/items/mortars.dmi'
	icon_state = "mortar_tube_structure"
	anchored = TRUE //No moving this around please

/obj/structure/mortar_launcher_structure/CanPass(atom/movable/mover, turf/target, height, air_group)//Humans cannot pass cross this thing in any way shape or form.
	if(ishuman(mover))
		return FALSE

/obj/structure/mortar_launcher_structure/CheckExit(atom/movable/O, turf/target)//Humans can't leave this thing either.
	if(ishuman(O))
		return FALSE
*/
