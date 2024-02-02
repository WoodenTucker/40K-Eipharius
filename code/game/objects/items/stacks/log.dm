/obj/item/stack/logs
    name = "logs"
    desc = "Usable logs from a cut down tree. Can be sold to the trader or made into planks in a log machine."
    singular_name = "Log"
    icon = 'icons/obj/objects.dmi'
    icon_state = "firewood"
    w_class = ITEM_SIZE_SMALL
    force = 3.0
    throwforce = 3.0
    max_amount = 10
    sales_price = 4

/obj/item/stack/logs/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return


/obj/item/stack/logs/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/melee/sword/combat_knife|| istype(W.sharp)|| istype(W.edge)))
		(do_after(user,30,src))
		new /obj/item/torch/self_lit(get_turf(src))
		to_chat(user, "You carve the log into a usable torch.")
		qdel(src)
	else if(istype(W, /obj/item/melee/sword/skinning_knife))
		playsound(src, 'sound/effects/ash_chop.ogg', 80, TRUE)
		(do_after(user,40,src))
		new /obj/structure/statue/tanningrack(get_turf(src))
		to_chat(user, "You carve the log into a tanning rack.")
		qdel(src)
	else
		..()


/obj/item/stack/logs/attack_self(mob/user as mob)

	src.add_fingerprint(user)

	if(!istype(user.loc,/turf)) return 0

	if (locate(/obj/item/campfire/self_lit, usr.loc))
		for(var/obj/item/campfire/self_lit/G in usr.loc)

			if (G.destroyed)
				G.health = 50
				G.set_density(1)
				G.destroyed = 0
				G.icon_state = "cauldron0"
				use(1)
			else
				return 1

	else if(!in_use)
		if(get_amount() < 2)
			to_chat(user, "<span class='warning'>You need at least two logs to do this.</span>")
			return
		to_chat(usr, "<span class='notice'>Making a campfire...</span>")
		in_use = 1
		if (!do_after(usr, 10))
			in_use = 0
			return
		var/obj/item/campfire/self_lit/F = new /obj/item/campfire/self_lit ( usr.loc )
		to_chat(usr, "<span class='notice'>You build a campfire!</span>")
		in_use = 0
		F.add_fingerprint(usr)
		use(2)
	return
