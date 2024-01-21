/obj/item/gun/projectile/heavy_bolter
	name = "Astra Militarum Squad Heavy Bolter"
	desc = "Standard-issue Heavy Bolter of Astra Militarum, designed to assist allied forces via direct fire support and supression of enemy forces."
	icon = 'icons/obj/items/mortars.dmi' //Adding in proper icons shortly
	icon_state = "mortar_tube"
	item_state = "mortar_tube"
	deployable = 1

/obj/structure/heavy_bolter_structure //That thing that's created when you place down your weapon, purely for looks.
	name = "Deployed Astra Militarum Heavy Bolter"
	icon = 'icons/obj/items/mortars.dmi'
	icon_state = "mortar_tube_structure"
	anchored = TRUE 

 /obj/item/heavy_bolter/update_icon(var/mob/living/carbon/human/H)
	if(deployed)
		item_state = "blank"
	else
		item_state = "mortar_tube"

	if(istype(H))
		H.regenerate_icons()
	..()

/obj/item/heavy_bolter/afterattack(atom/A, mob/living/user)
	..()
	if(!deployed)//Can't fire.
		to_chat(user, "<span class='danger'>I can't fire it if it's not deployed.</span>")
		return
	if(!loaded)//Nothing to fire.
		to_chat(user, "<span class='danger'>It's not loaded.</span>")
		return
	var/obj/item/I = user.get_inactive_hand()
	if(I)
		to_chat(user, "<span class='danger'>I need a free hand for this.</span>")
		return
  if(rounds_remaining == 0)
		to_chat(user, "<span class='danger'>The Heavy Bolter clicks empty!.</span>")
		loaded = FALSE
		return
	fire_heavy_bolter(A, user)
	rounds_remaining -= 1

/obj/item/heavy_bolter/proc/fire_heavy_bolter(atom/A, mob/living/user)
	user.visible_message("<span class='danger'>[user] fires the [src]!</span>")
	//playsound(src, 'sound/weapons/sound_weapons_guns_fire_30mm.ogg', 100, FALSE)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/bolterrifle(user:loc)
	var/def_zone = get_exposed_defense_zone(target)
	P.launch_projectile(target, def_zone)

/obj/item/heavy_bolter/attack_self(mob/user)
	. = ..()
	if(deployed)//If there's a heavy bolter deployed, then pack it up again.
		pack_up_heavy_bolter(user)
	else
		deploy_heavy_bolter(user)//Otherwise, deploy it.

/obj/item/heavy_bolter/proc/deploy_heavy_bolter(mob/user)
	for(var/obj/structure/heavy_bolter_structure/M in user.loc)//If there's already a mortar there then don't deploy it. Dunno how that's possible but stranger things have happened.
		if(M)
			to_chat(user, "There is already a heavy bolter here.")
			return
	user.visible_message("[user] starts to deploy the [src]")
	if(!do_after(user,30))
		return
	var/obj/structure/heavy_bolter_structure/M = new(get_turf(user)) //Make a new one here.
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

/obj/item/heavy_bolter/proc/pack_up_heavy_bolter(mob/user)
	user.visible_message("[user] packs up the [src]")
	for(var/obj/structure/heavy_bolter_structure/M in user.loc)
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

/obj/item/heavy_bolter/dropped(mob/user)
	. = ..()
	if(deployed)
		pack_up_heavy_bolter(user)

/obj/item/heavy_bolter/attackby(obj/item/W, mob/user)
	. = ..()
	if(!istype(W, /obj/item/heavy_bolter_magazine))
		to_chat(user, "This ammo doesn't fit the weapon!")
		return
	if(loaded)
		to_chat(user, "There is already a magazine loaded!")
		return
	if(!deployed)
		to_chat(user, "I have to deploy the heavy bolter first!")
		return
	var/obj/item/heavy_bolter_magazine/M = W
	loaded = TRUE
 	rounds_remaining = 80
	playsound(src, 'sound/weapons/mortar_load.ogg', 100, FALSE)
	user.visible_message("<span class='danger'>[user] loads the [src] with \the [W]!</span>")
	qdel(W)
	update_icon()

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
