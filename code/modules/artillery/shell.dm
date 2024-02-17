/obj/item/cannon_ball
	icon = 'icons/obj/cannon_ball.dmi'
	name = "cannon ball"
	icon_state = "cannon_ball"
	w_class = 4.0
	sales_price = 15
	var/reagent_payload = null
	var/damage = 100
	var/caliber = 75
	var/atype = "cannonball"
	var/subtype = /obj/item/projectile/shell

/obj/item/cannon_ball/chainshot
	name = "chain shot"
	icon_state = "chainshot"
	damage = 60
	subtype = /obj/item/projectile/shell/cannonball/chainshot
	atype = "chainshot"

/obj/item/cannon_ball/grapeshot
	name = "grape shot"
	icon_state = "grapeshot"
	damage = 30
	subtype = /obj/item/projectile/shell/cannonball/grapeshot
	atype = "grapeshot"

/obj/item/cannon_ball/shell
	icon = 'icons/obj/cannon_ball.dmi'
	name = "artillery shell"
	icon_state = "shell"
	w_class = 4.0
	sales_price = 20
	atype = "HE"
/obj/item/cannon_ball/shell/tank
	icon = 'icons/obj/cannon_ball.dmi'
	name = "cannon shell"
	icon_state = "shellHE"
	w_class = 5.0
	sales_price = 20
	caliber = 75
	//heavy_armor_penetration = 15
	atype = "HE"
	New()
		..()
		name = "[caliber]mm [atype] shell"
		icon_state = "shell[atype]"

/obj/item/cannon_ball/shell/tank/HE57
	atype = "HE"
	caliber = 57
	//heavy_armor_penetration = 15
	damage = 225

/obj/item/cannon_ball/shell/tank/AP57
	atype = "AP"
	caliber = 57
	//heavy_armor_penetration = 52
	damage = 95

/obj/item/cannon_ball/shell/tank/APCR57
	atype = "APCR"
	caliber = 57
	//heavy_armor_penetration = 75
	damage = 115

/obj/item/cannon_ball/shell/tank/HE75
	atype = "HE"
	caliber = 75
	//heavy_armor_penetration = 15
	damage = 250

/obj/item/cannon_ball/shell/tank/AP75
	atype = "AP"
	caliber = 75
	//heavy_armor_penetration = 52
	damage = 100

/obj/item/cannon_ball/shell/tank/APCR75
	atype = "APCR"
	caliber = 75
	//heavy_armor_penetration = 75
	damage = 125

/obj/item/cannon_ball/shell/tank/HE88
	atype = "HE"
	caliber = 88
	//heavy_armor_penetration = 22
	damage = 350

/obj/item/cannon_ball/shell/tank/AP88
	atype = "AP"
	caliber = 88
	//heavy_armor_penetration = 110
	damage = 145

/obj/item/cannon_ball/shell/tank/APCR88
	atype = "APCR"
	caliber = 88
	//heavy_armor_penetration = 130
	damage = 175

/obj/item/cannon_ball/shell/tank/HE85
	atype = "HE"
	caliber = 85
	//heavy_armor_penetration = 20
	damage = 330

/obj/item/cannon_ball/shell/tank/AP85
	atype = "AP"
	caliber = 85
	//heavy_armor_penetration = 110
	damage = 140

/obj/item/cannon_ball/shell/tank/APCR85
	atype = "APCR"
	caliber = 85
	//heavy_armor_penetration = 130
	damage = 170

/obj/item/cannon_ball/shell/tank/HE76
	atype = "HE"
	caliber = 76.2
	//heavy_armor_penetration = 6
	damage = 250

/obj/item/cannon_ball/shell/tank/AP76
	atype = "AP"
	caliber = 76.2
	//heavy_armor_penetration = 55
	damage = 100

/obj/item/cannon_ball/shell/tank/APCR76
	atype = "APCR"
	caliber = 76.2
	//heavy_armor_penetration = 80
	damage = 125

/obj/item/cannon_ball/shell/tank/HE204
	atype = "HE"
	caliber = 204
	//heavy_armor_penetration = 100
	damage = 500

/obj/item/cannon_ball/shell/tank/AP204
	atype = "AP"
	caliber = 204
	//heavy_armor_penetration = 150
	damage = 400

/obj/item/cannon_ball/shell/tank/APCR204
	atype = "APCR"
	caliber = 204
	//heavy_armor_penetration = 125
	damage = 450
/obj/item/cannon_ball/shell/tank/nuclear/
	atype = "NUCLEAR"
	New()
		..()
		icon = 'icons/obj/cannon_ball.dmi'
		icon_state = "shell_nuclear"
/obj/item/cannon_ball/mortar_shell
	icon = 'icons/obj/cannon_ball.dmi'
	name = "mortar shell"
	icon_state = "shell_mortar"
	w_class = 4.0
	sales_price = 20

/obj/item/cannon_ball/mortar_shell/type89
	icon = 'icons/obj/cannon_ball.dmi'
	name = "type 89 mortar shell"
	icon_state = "shell_mortar_89"
	w_class = 4.0
	sales_price = 20

/obj/item/cannon_ball/shell/gas/chlorine
	reagent_payload = "chlorine_gas"
	name = "Chlorine Shell"
	icon_state = "shell_chlorine"

/obj/item/cannon_ball/shell/gas/mustard
	reagent_payload = "mustard_gas"
	name = "Mustard Gas Shell"
	icon_state = "shell_mustard"

/obj/item/cannon_ball/shell/gas/phosgene
	reagent_payload = "phosgene_gas"
	name = "Phosgene Gas Shell"
	icon_state = "shell_phosgene"

/obj/item/cannon_ball/shell/gas/white_phosphorus
	reagent_payload = "white_phosphorus_gas"
	name = "White Phosphorus Shell"
	icon_state = "shell_wp"

/obj/item/cannon_ball/shell/gas/xylyl_bromide
	reagent_payload = "xylyl_bromide"
	name = "Xylyl Bromide Shell"
	icon_state = "shell_xb"

/obj/item/cannon_ball/shell/gas/zyklon_b
	reagent_payload = "zyclon_b"
	name = "Zyklon B Shell"
	icon_state = "shell_xb"

/obj/item/cannon_ball/rocket/nuclear
	icon = 'icons/obj/cannon_ball.dmi'
	name = "Nuclear Rocket"
	icon_state = "shell_nuclear_rocket"
	w_class = 4.0
	sales_price = 80

/obj/item/cannon_ball/shell/nuclear
	icon = 'icons/obj/cannon_ball.dmi'
	name = "Nuclear Shell"
	icon_state = "shell_nuclear"
	w_class = 4.0
	sales_price = 25

/obj/item/cannon_ball/shell/nuclear/makeshift
	icon = 'icons/obj/cannon_ball.dmi'
	name = "Makeshift Nuclear Shell"
	icon_state = "shell_nuclear"
	w_class = 4.0
	sales_price = 20

/obj/item/cannon_ball/shell/nuclear/W9
	icon = 'icons/obj/cannon_ball.dmi'
	name = "W9 Atomic Demolition Munition"
	icon_state = "shell_nuclear"
	w_class = 4.0
	sales_price = 40

/obj/item/cannon_ball/shell/nuclear/W19
	icon = 'icons/obj/cannon_ball.dmi'
	name = "W19 Katie Nuclear Shell"
	icon_state = "shell_nuclear"
	w_class = 4.0
	sales_price = 30

/obj/item/cannon_ball/shell/nuclear/W33
	icon = 'icons/obj/cannon_ball.dmi'
	name = "W33 Nuclear Shell"
	icon_state = "shell_nuclear"
	w_class = 4.0
	sales_price = 20

/obj/item/cannon_ball/shell/nuclear/W33Boosted
	icon = 'icons/obj/cannon_ball.dmi'
	name = "Boosted W33 Nuclear Shell"
	icon_state = "shell_nuclear"
	w_class = 4.0
	sales_price = 50


////////////////////////////////////////////////////////
/*/obj/structure/shellrack
	icon = 'icons/obj/structures.dmi'
	name = "shell rack"
	icon_state = "shellrack0"
	w_class = 10.0
	var/obj/item/weapon/storage/internal/storage
	density = FALSE
	opacity = FALSE

/obj/structure/shellrack/New()
	..()
	storage = new/obj/item/weapon/storage/internal(src)
	storage.storage_slots = 16
	storage.max_w_class = 10
	storage.max_storage_space = 600
	storage.can_hold = list(/obj/item/cannon_ball/shell)
	update_icon()

/obj/structure/shellrack/Destroy()
	qdel(storage)
	storage = null
	..()

/obj/structure/shellrack/attack_hand(mob/user as mob)
	if (istype(user, /mob/living/carbon/human) && user in range(1,src))
		if (storage)
			storage.open(user)
		update_icon()
	else
		return
/obj/structure/shellrack/MouseDrop(obj/over_object as obj)
	if (storage && storage.handle_mousedrop(usr, over_object))
		..(over_object)
		update_icon()

/obj/structure/shellrack/attackby(obj/item/W as obj, mob/user as mob)
	..()
	storage.attackby(W, user)
	update_icon()

/obj/structure/shellrack/update_icon()
	..()
	if (storage)
		icon_state = "shellrack[storage.contents.len]"

/obj/structure/shellrack/full57/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE57(storage)
	new /obj/item/cannon_ball/shell/tank/HE57(storage)
	new /obj/item/cannon_ball/shell/tank/HE57(storage)
	new /obj/item/cannon_ball/shell/tank/HE57(storage)
	new /obj/item/cannon_ball/shell/tank/HE57(storage)
	new /obj/item/cannon_ball/shell/tank/HE57(storage)


	new /obj/item/cannon_ball/shell/tank/AP57(storage)
	new /obj/item/cannon_ball/shell/tank/AP57(storage)
	new /obj/item/cannon_ball/shell/tank/AP57(storage)
	new /obj/item/cannon_ball/shell/tank/AP57(storage)
	new /obj/item/cannon_ball/shell/tank/AP57(storage)

	new /obj/item/cannon_ball/shell/tank/APCR57(storage)
	new /obj/item/cannon_ball/shell/tank/APCR57(storage)
	new /obj/item/cannon_ball/shell/tank/APCR57(storage)
	new /obj/item/cannon_ball/shell/tank/APCR57(storage)
	new /obj/item/cannon_ball/shell/tank/APCR57(storage)
	update_icon()


/obj/structure/shellrack/full75/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	new /obj/item/cannon_ball/shell/tank/HE75(storage)

	new /obj/item/cannon_ball/shell/tank/AP75(storage)
	new /obj/item/cannon_ball/shell/tank/AP75(storage)
	new /obj/item/cannon_ball/shell/tank/AP75(storage)
	new /obj/item/cannon_ball/shell/tank/AP75(storage)

	new /obj/item/cannon_ball/shell/tank/APCR75(storage)
	new /obj/item/cannon_ball/shell/tank/APCR75(storage)
	new /obj/item/cannon_ball/shell/tank/APCR75(storage)
	new /obj/item/cannon_ball/shell/tank/APCR75(storage)
	update_icon()

/obj/structure/shellrack/full75/american/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	new /obj/item/cannon_ball/shell/tank/HE75(storage)
	update_icon()

/obj/structure/shellrack/full85/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE85(storage)
	new /obj/item/cannon_ball/shell/tank/HE85(storage)
	new /obj/item/cannon_ball/shell/tank/HE85(storage)
	new /obj/item/cannon_ball/shell/tank/HE85(storage)

	new /obj/item/cannon_ball/shell/tank/AP85(storage)
	new /obj/item/cannon_ball/shell/tank/AP85(storage)
	new /obj/item/cannon_ball/shell/tank/AP85(storage)
	new /obj/item/cannon_ball/shell/tank/AP85(storage)

	new /obj/item/cannon_ball/shell/tank/APCR85(storage)
	new /obj/item/cannon_ball/shell/tank/APCR85(storage)
	new /obj/item/cannon_ball/shell/tank/APCR85(storage)
	new /obj/item/cannon_ball/shell/tank/APCR85(storage)

/obj/structure/shellrack/full88/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE88(storage)
	new /obj/item/cannon_ball/shell/tank/HE88(storage)
	new /obj/item/cannon_ball/shell/tank/HE88(storage)
	new /obj/item/cannon_ball/shell/tank/HE88(storage)

	new /obj/item/cannon_ball/shell/tank/AP88(storage)
	new /obj/item/cannon_ball/shell/tank/AP88(storage)
	new /obj/item/cannon_ball/shell/tank/AP88(storage)
	new /obj/item/cannon_ball/shell/tank/AP88(storage)

	new /obj/item/cannon_ball/shell/tank/APCR88(storage)
	new /obj/item/cannon_ball/shell/tank/APCR88(storage)
	new /obj/item/cannon_ball/shell/tank/APCR88(storage)
	new /obj/item/cannon_ball/shell/tank/APCR88(storage)
	update_icon()

/obj/structure/shellrack/full76/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE76(storage)
	new /obj/item/cannon_ball/shell/tank/HE76(storage)
	new /obj/item/cannon_ball/shell/tank/HE76(storage)
	new /obj/item/cannon_ball/shell/tank/HE76(storage)

	new /obj/item/cannon_ball/shell/tank/AP76(storage)
	new /obj/item/cannon_ball/shell/tank/AP76(storage)
	new /obj/item/cannon_ball/shell/tank/AP76(storage)
	new /obj/item/cannon_ball/shell/tank/AP76(storage)

	new /obj/item/cannon_ball/shell/tank/APCR76(storage)
	new /obj/item/cannon_ball/shell/tank/APCR76(storage)
	new /obj/item/cannon_ball/shell/tank/APCR76(storage)
	new /obj/item/cannon_ball/shell/tank/APCR76(storage)
	update_icon()

/obj/structure/shellrack/full204/New()
	..()
	new /obj/item/cannon_ball/shell/tank/HE204(storage)
	new /obj/item/cannon_ball/shell/tank/HE204(storage)
	new /obj/item/cannon_ball/shell/tank/HE204(storage)
	new /obj/item/cannon_ball/shell/tank/HE204(storage)
	new /obj/item/cannon_ball/shell/tank/HE204(storage)
	new /obj/item/cannon_ball/shell/tank/HE204(storage)


	new /obj/item/cannon_ball/shell/tank/AP204(storage)
	new /obj/item/cannon_ball/shell/tank/AP204(storage)
	new /obj/item/cannon_ball/shell/tank/AP204(storage)
	new /obj/item/cannon_ball/shell/tank/AP204(storage)
	new /obj/item/cannon_ball/shell/tank/AP204(storage)

	new /obj/item/cannon_ball/shell/tank/APCR204(storage)
	new /obj/item/cannon_ball/shell/tank/APCR204(storage)
	new /obj/item/cannon_ball/shell/tank/APCR204(storage)
	new /obj/item/cannon_ball/shell/tank/APCR204(storage)
	new /obj/item/cannon_ball/shell/tank/APCR204(storage)
	update_icon()


/obj/item/weapon/storage/internal
	var/obj/item/master_item

/obj/item/weapon/storage/internal/New(obj/item/MI)
	master_item = MI
	if (master_item)
		loc = master_item
		name = master_item.name
//	verbs -= /obj/item/verb/verb_pickup	//make sure this is never picked up.
	..()

/obj/item/weapon/storage/internal/Destroy()
	master_item = null
	..()

/obj/item/weapon/storage/internal/attack_hand()
	return		//make sure this is never picked up

/obj/item/weapon/storage/internal/mob_can_equip()
	return FALSE	//make sure this is never picked up

//Helper procs to cleanly implement internal storages - storage items that provide inventory slots for other items.
//These procs are completely optional, it is up to the master item to decide when it's storage get's opened by calling open()
//However they are helpful for allowing the master item to pretend it is a storage item itself.
//If you are using these you will probably want to override attackby() as well.
//See /obj/item/clothing/suit/storage for an example.

//items that use internal storage have the option of calling this to emulate default storage MouseDrop behaviour.
//returns TRUE if the master item's parent's MouseDrop() should be called, FALSE otherwise. It's strange, but no other way of
//doing it without the ability to call another proc's parent, really.
/obj/item/weapon/storage/internal/proc/handle_mousedrop(mob/user as mob, obj/over_object as obj)
	if (ishuman(user) || issmall(user)) //so monkeys can take off their backpacks -- Urist

		if (over_object == user && Adjacent(user)) // this must come before the screen objects only block
			open(user)
			return FALSE

		if (!( istype(over_object, /obj/screen) ))
			return TRUE

		//makes sure master_item is equipped before putting it in hand, so that we can't drag it into our hand from miles away.
		//there's got to be a better way of doing this...
		if (!(master_item.loc == user) || (master_item.loc && master_item.loc.loc == user))
			return FALSE

		if (!( user.restrained() ) && !( user.stat ) && (istype(over_object, /obj/screen/inventory/hand)))
			var/obj/screen/inventory/hand/H = over_object
			switch(H.slot_id)
				if (slot_r_hand)
					user.u_equip(master_item)
					user.put_in_r_hand(master_item)
				if (slot_l_hand)
					user.u_equip(master_item)
					user.put_in_l_hand(master_item)
			/*switch(over_object.name)
				if ("r_hand")
					user.u_equip(master_item)
					user.put_in_r_hand(master_item)
				if ("l_hand")
					user.u_equip(master_item)
					user.put_in_l_hand(master_item)*/
			master_item.add_fingerprint(user)

			return FALSE
	return FALSE

//items that use internal storage have the option of calling this to emulate default storage attack_hand behaviour.
//returns TRUE if the master item's parent's attack_hand() should be called, FALSE otherwise.
//It's strange, but no other way of doing it without the ability to call another proc's parent, really.
/obj/item/weapon/storage/internal/proc/handle_attack_hand(mob/user as mob)

	if (ishuman(user))
		var/mob/living/carbon/human/H = user
		if (H.l_store == master_item && !H.get_active_hand())	//Prevents opening if it's in a pocket.
			H.put_in_hands(master_item)
			H.l_store = null
			return FALSE
		if (H.r_store == master_item && !H.get_active_hand())
			H.put_in_hands(master_item)
			H.r_store = null
			return FALSE

	add_fingerprint(user)
	if (master_item.loc == user)
		open(user)
		return FALSE

	for (var/mob/M in range(1, master_item.loc))
		if (M.s_active == src)
			close(M)
	return TRUE

/obj/item/weapon/storage/internal/Adjacent(var/atom/neighbor)
	return master_item.Adjacent(neighbor)*/