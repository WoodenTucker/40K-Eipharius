/obj/item/stack/logs
    name = "logs"
    desc = "Usable logs from a cut down tree."
    singular_name = "Log"
    icon = 'icons/obj/objects.dmi'
    icon_state = "firewood"
    w_class = ITEM_SIZE_SMALL
    force = 3.0
    throwforce = 3.0
    max_amount = 10


/obj/item/stack/logs/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/sword/combat_knife|| istype(W.sharp)|| istype(W.edge)))
		(do_after(user,30,src))
		new /obj/item/torch(get_turf(src))
		to_chat(user, "You carve the log into a usable torch.")
		qdel(src)
	else
		..()


/obj/item/stack/logs/attack_self(mob/user as mob)

	src.add_fingerprint(user)

	if(!istype(user.loc,/turf)) return 0

	if (locate(/turf/simulated/wall/wood, usr.loc))
		for(var/turf/simulated/wall/wood/G in usr.loc)

			if (G.destroyed)
				G.health = 50
				G.set_density(1)
				G.destroyed = 0
				G.icon_state = "wood0"
				use(1)
			else
				return 1

	else if(!in_use)
		if(get_amount() < 2)
			to_chat(user, "<span class='warning'>You need at least two logs to do this.</span>")
			return
		to_chat(usr, "<span class='notice'>Constructing wall...</span>")
		in_use = 1
		if (!do_after(usr, 10))
			in_use = 0
			return
		var/turf/simulated/wall/wood/F = new /turf/simulated/wall/wood ( usr.loc )
		to_chat(usr, "<span class='notice'>You construct a wall</span>")
		in_use = 0
		F.add_fingerprint(usr)
		use(2)
	return


	//TODO make some sort of circular saw or woodworking stuff that turns logs into planks, will then activate the construction menu of wood.