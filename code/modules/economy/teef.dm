/obj/item/teef
	name = "0 worth toof"
	desc = "It's worth 0 teef, how dey do that?!."
	gender = PLURAL
	icon = 'icons/obj/teef.dmi'
	icon_state = "teef0"
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

/obj/item/teef/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/teef))
		if(istype(W, /obj/item/teef/ewallet)) return 0

		var/obj/item/teef/bundle/bundle
		if(!istype(W, /obj/item/teef/bundle))
			var/obj/item/teef/cash = W
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
		to_chat(user, "<span class='notice'>You add [src.worth] Teef to the bundles.<br>It holds [bundle.worth] Teef now.</span>")
		qdel(src)


/obj/item/teef/proc/getMoneyImages()
	if(icon_state)
		return list(icon_state)

/obj/item/teef/bundle/t1
	name = "1 teef"
	icon_state = "1"
	desc = "One ork teef, it is long and sharp but only worth 1 unit of orkish currency."


/obj/item/teef/bundle/getMoneyImages()
	if(icon_state)
		return list(icon_state)
	. = list()
	var/sum = src.worth
	var/num = 0
	for(var/i in denominations)
		while(sum >= i && num < 50)
			sum -= i
			num++
			. += "teef[i]"
	if(num == 0) // Less than one credit, let's just make it look like 1 for ease
		. += "teef1"

/obj/item/teef/bundle/update_icon()
	overlays.Cut()
	var/list/images = src.getMoneyImages()

	for(var/A in images)
		var/image/coin = image('icons/obj/items.dmi', A)
		var/matrix/M = matrix()
		M.Translate(rand(-6, 6), rand(-4, 8))
		M.Turn(pick(-45, -27.5, 0, 0, 0, 0, 0, 0, 0, 27.5, 45))
		coin.transform = M
		src.overlays += coin

	src.desc = "They are worth [worth] Teef."
	if(worth in denominations)
		src.SetName("[worth] Teef")
	else
		src.SetName("pile of [worth] Teef")

	if(overlays.len <= 2)
		w_class = ITEM_SIZE_TINY
	else
		w_class = ITEM_SIZE_SMALL

/obj/item/teef/bundle/attack_self()
	var/amount = input(usr, "How many Teef do you want to take? (0 to 19)", "Take Teef", 20) as num
	amount = round(Clamp(amount, 0, src.worth))
	if(amount==0) return 0

	src.worth -= amount
	src.update_icon()
	if(!worth)
		usr.drop_from_inventory(src)
	if(amount in list(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,100,200,300,400,500,600,700,800,900,1000))
		var/cashtype = text2path("/obj/item/teef/bundle/t[amount]")
		var/obj/cash = new cashtype (usr.loc)
		usr.put_in_hands(cash)
	else
		var/obj/item/teef/bundle/bundle = new (usr.loc)
		bundle.worth = amount
		bundle.update_icon()
		usr.put_in_hands(bundle)
	if(!worth)
		qdel(src)

//////////////////////////////////////
////////////10 teef//////////
////////////////////////////////////


/obj/item/teef/bundle/t2
	name = "2 Teefs"
	icon_state = "2"
	desc = "Two ork teef."


/obj/item/teef/bundle/t3
	name = "3 Teefs"
	icon_state = "3"
	desc = "Three ork teef."


/obj/item/teef/bundle/t4
	name = "4 Teefs"
	icon_state = "4"
	desc = "Four ork teef."


/obj/item/teef/bundle/t5
	name = "5 Teef"
	icon_state = "5"
	desc = "Five ork teef."

/obj/item/teef/bundle/t6
	name = "6 Teef"
	icon_state = "6"
	desc = "Six ork teef."


/obj/item/teef/bundle/t7
	name = "7 Teef"
	icon_state = "7"
	desc = "Seven ork teef."

/obj/item/teef/bundle/t8
	name = "8 Teef"
	icon_state = "8"
	desc = "Eight ork teef."


/obj/item/teef/bundle/t9
	name = "9 Teef"
	icon_state = "9"
	desc = "Nine ork teef."


/obj/item/teef/bundle/t10
	name = "10 Teef"
	icon_state = "10"
	desc = "Ten ork teef."


/obj/item/teef/bundle/t11
	name = "11 Teef"
	icon_state = "11"
	desc = "Eleven ork teef."


/obj/item/teef/bundle/t12
	name = "12 Teef"
	icon_state = "12"
	desc = "Twelve ork teef."


/obj/item/teef/bundle/t13
	name = "13 Teef"
	icon_state = "13"
	desc = "Thirteen ork teef."


/obj/item/teef/bundle/t14
	name = "14 Teef"
	icon_state = "14"
	desc = "Fourteen ork teef."


/obj/item/teef/bundle/t15
	name = "15 Teef"
	icon_state = "15"
	desc = "Fifteen ork teef."


/obj/item/teef/bundle/t16
	name = "16 Teef"
	icon_state = "16"
	desc = "Sixteen ork teef."


/obj/item/teef/bundle/t17
	name = "17 Teef"
	icon_state = "17"
	desc = "Seventeen ork teef."


/obj/item/teef/bundle/t18
	name = "18 Teef"
	icon_state = "18"
	desc = "Eighteen ork teef."

/obj/item/teef/bundle/t19
	name = "19 Teef"
	icon_state = "19"
	desc = "Nineteen ork teef."


/obj/item/teef/bundle/t20
	name = "20 Teef"
	icon_state = "20"
	desc = "Twenty ork teef."

/obj/item/teef/bundle/t100
	name = "1 Gold Teef"
	icon_state = "g_1"
	desc = "One gold teef worth a 'undred normal ork teef.

/obj/item/teef/bundle/t200
	name = "2 Gold Teef"
	icon_state = "g_2"
	desc = "2 gold teef worth two 'undred normal ork teef.

/obj/item/teef/bundle/t300
	name = "3 Gold Teef"
	icon_state = "g_3"
	desc = "3 gold teef worth three 'undred normal ork teef.

/obj/item/teef/bundle/t400
	name = "4 Gold Teef"
	icon_state = "g_4"
	desc = "4 gold teef worth four 'undred normal ork teef.

/obj/item/teef/bundle/t500
	name = " 5 Gold Teef"
	icon_state = "g_5"
	desc = "5 gold teef worth five 'undred normal ork teef.

/obj/item/teef/bundle/t600
	name = " 6 Gold Teef"
	icon_state = "g_6"
	desc = "6 gold teef worth six 'undred normal ork teef.

/obj/item/teef/bundle/t700
	name = " 7 Gold Teef"
	icon_state = "g_7"
	desc = "7 gold teef worth seven 'undred normal ork teef.

/obj/item/teef/bundle/t800
	name = " 8 Gold Teef"
	icon_state = "g_8"
	desc = "8 gold teef worth seven 'undred normal ork teef.

/obj/item/teef/bundle/t900
	name = " 9 Gold Teef"
	icon_state = "g_9"
	desc = "9 gold teef worth seven 'undred normal ork teef.

/obj/item/teef/bundle/t1000
	name = " 10 Gold Teef"
	icon_state = "g_10"
	desc = "By Gork & Mork! 10 gold teef worth ten 'undred normal ork teef!.

/obj/item/teef/ewallet
	name = "Teef Tab card"
	icon_state = "teef_ecard"
	desc = "If a ork believes hard enough that teef will appear when this card is presented, it will do so from their funds."
	var/owner_name = "" //So the ATM can set it so the EFTPOS can put a valid name on transactions.

/obj/item/teef/ewallet/examine(mob/user)
	. = ..(user)
	if (!(user in view(2)) && user!=src.loc) return
	to_chat(user, "<span class='notice'>Charge card's owner: [src.owner_name]. Teef remaining: [src.worth].</span>")



