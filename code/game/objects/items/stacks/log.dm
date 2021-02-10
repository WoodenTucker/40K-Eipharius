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
	if(istype(W,/obj/item/material/sword/combat_knife))
		(do_after(user,30,src))
		new /obj/item/torch(get_turf(src))
		to_chat(user, "You carve the log into a usable torch.")
		qdel(src)
	else
		..()