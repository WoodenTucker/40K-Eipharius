/obj/item/cane
	name = "cane"
	desc = "A cane used by a true gentlemen. Or a clown."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "canesword_hidden"
	item_state = "stick"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 5.0
	block_chance = 35
	throwforce = 7.0
	w_class = ITEM_SIZE_SMALL
	matter = list(DEFAULT_WALL_MATERIAL = 50)
	attack_verb = list("bludgeoned", "whacked", "disciplined", "thrashed")

/obj/item/cane/concealed
	var/concealed_blade

/obj/item/cane/concealed/New()
	..()
	var/obj/item/melee/sword/cane/temp_blade = new(src)
	concealed_blade = temp_blade
	temp_blade.attack_self()

/obj/item/cane/concealed/attack_self(var/mob/user)
	if(concealed_blade)
		user.visible_message("<span class='warning'>[user] has unsheathed \a [concealed_blade] from [src]!</span>", "You unsheathe \the [concealed_blade] from [src].")
		// Calling drop/put in hands to properly call item drop/pickup procs
		//playsound(user.loc, 'sound/items/unholster_sword01.ogg', 50, 1)
		user.drop_from_inventory(src)
		user.put_in_hands(concealed_blade)
		user.put_in_hands(src)
		concealed_blade = null
		update_icon()
		user.update_inv_l_hand()
		user.update_inv_r_hand()
	else
		..()

/obj/item/cane/concealed/attackby(var/obj/item/melee/sword/cane/W, var/mob/user)
	if(!src.concealed_blade && istype(W))
		user.visible_message("<span class='warning'>[user] has sheathed \a [W] into [src]!</span>", "You sheathe \the [W] into [src].")
		playsound(user.loc, 'sound/items/holster_sword1.ogg', 50, 1)
		user.drop_from_inventory(W)
		W.loc = src
		src.concealed_blade = W
		update_icon()
		user.update_inv_l_hand()
		user.update_inv_r_hand()
	else
		..()

/obj/item/cane/concealed/update_icon()
	if(concealed_blade)
		SetName(initial(name))
		icon_state = initial(icon_state)
		item_state = initial(item_state)
	else
		SetName("cane shaft")
		icon_state = "canesword_sheath"
		item_state = "foldcane"

/obj/item/melee/sword/cane
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "cane_sword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	block_chance = 50
	force = 30
	armor_penetration = 10
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_NORMAL
	item_state = "sabre"
	name = "cane sword"
	desc = "A sword specially modified to nest inside the body of a cane, extremely sharp"
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_sword01.ogg'
