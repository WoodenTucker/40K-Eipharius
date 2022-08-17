/obj/item/stack/thrones
	name = "$10 thrones"
	desc = "Gilded throne(s) worth $10"
	singular_name = "$10 throne"
	icon = 'icons/obj/thrones.dmi'
	icon_state = "throne"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")
	sales_price = 10

/obj/item/stack/thrones/New()
	..()
	update_icon()

/obj/item/stack/thrones/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.



/obj/item/stack/thrones/use()
	. = ..()
	update_icon()

/obj/item/stack/thrones/add()
	. = ..()
	update_icon()

/obj/item/stack/thrones/split()
	. = ..()
	update_icon()

/obj/item/stack/thrones/five
	amount = 5


/obj/item/stack/thrones/ten
	amount = 10

/obj/item/stack/thrones/twenty
	amount = 20

/obj/item/stack/thrones2
	name = "$5 thrones"
	desc = "Silver throne(s) worth $5"
	singular_name = "$5 throne"
	icon = 'icons/obj/thrones2.dmi'
	icon_state = "throne"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")
	sales_price = 5

/obj/item/stack/thrones2/New()
	..()
	update_icon()

/obj/item/stack/thrones2/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.



/obj/item/stack/thrones2/use()
	. = ..()
	update_icon()

/obj/item/stack/thrones2/add()
	. = ..()
	update_icon()

/obj/item/stack/thrones2/split()
	. = ..()
	update_icon()


/obj/item/stack/thrones2/five
	amount = 5

/obj/item/stack/thrones2/ten
	amount = 10


/obj/item/stack/thrones2/twenty
	amount = 20



/obj/item/stack/thrones3
	name = "$1 thrones"
	desc = "Copper throne(s) worth $1"
	singular_name = "$1 throne"
	icon = 'icons/obj/thrones3.dmi'
	icon_state = "throne"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_TINY
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")
	sales_price = 1

/obj/item/stack/thrones3/New()
	..()
	update_icon()

/obj/item/stack/thrones3/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.


/obj/item/stack/thrones3/use()
	. = ..()
	update_icon()

/obj/item/stack/thrones3/add()
	. = ..()
	update_icon()

/obj/item/stack/thrones3/split()
	. = ..()
	update_icon()

/obj/item/stack/thrones3/three
	amount = 3

/obj/item/stack/thrones3/five
	amount = 5

/obj/item/stack/thrones3/ten
	amount = 10


/obj/item/stack/thrones3/twenty
	amount = 20
