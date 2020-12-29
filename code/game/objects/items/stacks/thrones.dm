/*  Keeping this In case I made a mistake and need to use this file instead

/obj/item/stack/thrones
    name = "Throne Gelt"
    desc = "A small golden coin with the Imperial Aquila Stamped on it"
    singular_name = "Coin"
    icon = 'icons/obj/items.dmi'
    icon_state = "coin-throne"
    obj_flags = OBJ_FLAG_CONDUCTIBLE
    w_class = ITEM_SIZE_TINY
    force = 0.0
    throwforce = 0.0
    max_amount = 10000



/obj/item/stack/thrones/five
	name = "Throne Gelt"
	icon_state = "throne-5"
	amount = 5


/obj/item/stack/thrones/ten
	name = "Throne Gelt"
	icon_state = "throne10"
	amount = 10

/obj/item/stack/thrones/thirty
	name = "Throne Gelt"
	icon_state = "throne-30"
	amount = 30


/obj/item/stack/thrones/sixty
	name = "Throne Gelt"
	icon_state = "throne-60"
	amount = 60


/obj/item/stack/thrones/hundred
	name = "Throne Gelt"
	icon_state = "throne-hundred"
	amount = 100


/obj/item/stack/thrones/twohundred
    name = "Throne Gelt"
    icon_state = "throne-2hundred"
    amount = 200

/obj/item/stack/thrones/fivehundred
    name = "Throne Gelt"
    icon_state = "throne-5hundred"
    amount = 500

/obj/item/stack/thrones/thousand
	name = "Throne Gelt"
	icon_state = "throne-thousand"
	amount =1000


/obj/item/stack/thrones/fivethousand
	name = "Throne Gelt"
	icon_state = "throne-5thousand"
	amount =5000

/obj/item/stack/thrones/tenthousand
    name = "Throne Gelt"
    icon_state = "throne-10thousand"
    amount = 10000

/obj/item/stack/thrones/update_icon()
	var/amount = get_amount()
	if((amount <=5) && (amount >= 10000))
		icon_state = "throne-[amount]"
	else
		icon_state = "throne"

/obj/item/stack/rods/use()
	. = ..()
	update_icon()

/obj/item/stack/rods/add()
	. = ..()
	update_icon()
*/