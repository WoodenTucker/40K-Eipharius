/obj/item/stack/thrones
	name = "$10 thrones"
	desc = "A gilded throne(s) worth $10"
	singular_name = "$10 throne"
	icon = 'icons/obj/thrones.dmi'
	icon_state = "1"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")

/obj/item/stack/thrones/New()
	..()
	update_icon()

/obj/item/stack/thrones/update_icon()
	if(amount > 1)
		icon = 'icons/obj/thrones.dmi'
		icon_state = "10"
	else
		icon = initial(icon)
		icon_state = initial(icon_state)

/obj/item/stack/thrones/use()
	. = ..()
	update_icon()

/obj/item/stack/thrones/add()
	. = ..()
	update_icon()

/obj/item/stack/thrones/split()
	. = ..()
	update_icon()
