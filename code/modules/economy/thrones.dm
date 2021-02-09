/obj/item/thrones
	name = "0 Throne Coin"
	desc = "It's worth 0 Thrones."
	gender = PLURAL //did you just assume my thrones gender?
	icon = 'icons/obj/thrones.dmi'
	icon_state = "coin0"
	opacity = 0
	density = 0
	anchored = 0.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 1
	throw_range = 2
	w_class = ITEM_SIZE_TINY
	var/access = list()
	access = access_crate_cash
	var/worth = 0
	var/global/denominations = list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)

/obj/item/thrones/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/thrones))
		if(istype(W, /obj/item/thrones/ewallet)) return 0

		var/obj/item/thrones/bundle/bundle
		if(!istype(W, /obj/item/thrones/bundle))
			var/obj/item/thrones/cash = W
			user.drop_from_inventory(cash)
			bundle = new (src.loc)
			bundle.worth += cash.worth
			qdel(cash)
		else //is bundle
			bundle = W
		bundle.worth += src.worth
		bundle.update_icon()
		if(istype(user, /mob/living/carbon/human))
			var/mob/living/carbon/human/h_user = user
			h_user.drop_from_inventory(src)
			h_user.drop_from_inventory(bundle)
			h_user.put_in_hands(bundle)
		to_chat(user, "<span class='notice'>You add [src.worth] Thrones worth of money to the bundles.<br>It holds [bundle.worth] Thrones now.</span>")
		qdel(src)


/obj/item/thrones/proc/getMoneyImages()
	if(icon_state)
		return list(icon_state)

/obj/item/thrones/bundle/t1
	name = "1 throne gelt"
	icon_state = "1"
	desc = "They are worth 10 Thrones."


/obj/item/thrones/bundle/getMoneyImages()
	if(icon_state)
		return list(icon_state)
	. = list()
	var/sum = src.worth
	var/num = 0
	for(var/i in denominations)
		while(sum >= i && num < 50)
			sum -= i
			num++
			. += "thrones[i]"
	if(num == 0) // Less than one credit, let's just make it look like 1 for ease
		. += "throne1"

/obj/item/thrones/bundle/update_icon()
	overlays.Cut()
	var/list/images = src.getMoneyImages()

	for(var/A in images)
		var/image/coin = image('icons/obj/items.dmi', A)
		var/matrix/M = matrix()
		M.Translate(rand(-6, 6), rand(-4, 8))
		M.Turn(pick(-45, -27.5, 0, 0, 0, 0, 0, 0, 0, 27.5, 45))
		coin.transform = M
		src.overlays += coin

	src.desc = "They are worth [worth] Thrones."
	if(worth in denominations)
		src.SetName("[worth] Throne")
	else
		src.SetName("pile of [worth] Thrones")

	if(overlays.len <= 2)
		w_class = ITEM_SIZE_TINY
	else
		w_class = ITEM_SIZE_SMALL

/obj/item/thrones/bundle/attack_self()
	var/amount = input(usr, "How many Thrones do you want to take? (0 to 19)", "Take Throne", 20) as num
	amount = round(Clamp(amount, 0, src.worth))
	if(amount==0) return 0

	src.worth -= amount
	src.update_icon()
	if(!worth)
		usr.drop_from_inventory(src)
	if(amount in list(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20))
		var/cashtype = text2path("/obj/item/thrones/bundle/t[amount]")
		var/obj/cash = new cashtype (usr.loc)
		usr.put_in_hands(cash)
	else
		var/obj/item/thrones/bundle/bundle = new (usr.loc)
		bundle.worth = amount
		bundle.update_icon()
		usr.put_in_hands(bundle)
	if(!worth)
		qdel(src)

//////////////////////////////////////
////////////10 throne coins//////////
////////////////////////////////////


/obj/item/thrones/bundle/t2
	name = "2 Throne Gelts"
	icon_state = "2"
	desc = "Two 10 throne coins."


/obj/item/thrones/bundle/t3
	name = "3 Throne Gelts"
	icon_state = "3"
	desc = "Three 10 throne coins."


/obj/item/thrones/bundle/t4
	name = "4 Throne Gelts"
	icon_state = "4"
	desc = "Four 10 throne coins."


/obj/item/thrones/bundle/t5
	name = "5 Throne Gelts"
	icon_state = "5"
	desc = "Five 10 throne coins."

/obj/item/thrones/bundle/t6
	name = "6 Throne Gelts"
	icon_state = "6"
	desc = "Six 10 throne coins."


/obj/item/thrones/bundle/t7
	name = "7 Throne Gelts"
	icon_state = "7"
	desc = "Seven 10 throne coins."

/obj/item/thrones/bundle/t8
	name = "8 Throne Gelts"
	icon_state = "8"
	desc = "Eight 10 throne coins."


/obj/item/thrones/bundle/t9
	name = "9 Throne Gelts"
	icon_state = "9"
	desc = "Nine 10 throne coins."


/obj/item/thrones/bundle/t10
	name = "10 Throne Gelts"
	icon_state = "10"
	desc = "Ten 10 throne coins."


/obj/item/thrones/bundle/t11
	name = "11 Throne Gelts"
	icon_state = "11"
	desc = "Eleven 10 throne coins."


/obj/item/thrones/bundle/t12
	name = "12 Throne Gelts"
	icon_state = "12"
	desc = "Twelve 10 throne coins."


/obj/item/thrones/bundle/t13
	name = "13 Throne Gelts"
	icon_state = "13"
	desc = "Thirteen 10 throne coins."


/obj/item/thrones/bundle/t14
	name = "14 Throne Gelts"
	icon_state = "14"
	desc = "Fourteen 10 throne coins."


/obj/item/thrones/bundle/t15
	name = "15 Throne Gelts"
	icon_state = "15"
	desc = "Fifteen 10 throne coins."


/obj/item/thrones/bundle/t16
	name = "16 Throne Gelts"
	icon_state = "16"
	desc = "Sixteen 10 throne coins."


/obj/item/thrones/bundle/t17
	name = "17 Throne Gelts"
	icon_state = "17"
	desc = "Seventeen 10 throne coins."


/obj/item/thrones/bundle/t18
	name = "18 Throne Gelts"
	icon_state = "18"
	desc = "Eighteen 10 throne coins."

/obj/item/thrones/bundle/t19
	name = "19 Throne Gelts"
	icon_state = "19"
	desc = "Nineteen 10 throne coins."


/obj/item/thrones/bundle/t20
	name = "20 Throne Gelts"
	icon_state = "20"
	desc = "Twenty 10 throne coins."

/obj/item/thrones/ewallet
	name = "Charge card"
	icon_state = "efundcard"
	desc = "A card that holds an amount of money."
	var/owner_name = "" //So the ATM can set it so the EFTPOS can put a valid name on transactions.

/obj/item/thrones/ewallet/examine(mob/user)
	. = ..(user)
	if (!(user in view(2)) && user!=src.loc) return
	to_chat(user, "<span class='notice'>Charge card's owner: [src.owner_name]. Thrones remaining: [src.worth].</span>")



