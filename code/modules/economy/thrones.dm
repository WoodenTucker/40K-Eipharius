/obj/item/thrones
	name = "0 Throne"
	desc = "It's worth 0 Thrones."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "throne1"
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
	var/global/denominations = list(10000,5000,1000,500,200,100,50,20,10,1)

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

/obj/item/thrones/bundle
	name = "pile of Thrones"
	icon_state = ""
	desc = "They are worth 0 Thrones."
	worth = 0

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
	var/amount = input(usr, "How many Thrones do you want to take? (0 to [src.worth])", "Take Throne", 20) as num
	amount = round(Clamp(amount, 0, src.worth))
	if(amount==0) return 0

	src.worth -= amount
	src.update_icon()
	if(!worth)
		usr.drop_from_inventory(src)
	if(amount in list(10000,5000,1000,500,200,100,50,20,1))
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

/obj/item/thrones/bundle/t1
	name = "1 Throne Gelts"
	icon_state = "throne1"
	desc = "It's worth 1 credit."
	worth = 1

/obj/item/thrones/bundle/t10
	name = "10 Throne Gelts"
	icon_state = "throne10"
	desc = "It's worth 10 credits."
	worth = 10

/obj/item/thrones/bundle/t20
	name = "20 Throne Gelts"
	icon_state = "throne20"
	desc = "It's worth 20 credits."
	worth = 20

/obj/item/thrones/bundle/t50
	name = "50 Throne Gelts"
	icon_state = "throne50"
	desc = "It's worth 50 credits."
	worth = 50

/obj/item/thrones/bundle/t100
	name = "100 Throne Gelts"
	icon_state = "throne100"
	desc = "It's worth 100 credits."
	worth = 100

/obj/item/thrones/bundle/t200
	name = "200 Throne Gelts"
	icon_state = "throne200"
	desc = "It's worth 200 credits."
	worth = 200

/obj/item/thrones/bundle/t500
	name = "500 Throne Gelts"
	icon_state = "throne500"
	desc = "It's worth 500 credits."
	worth = 500

/obj/item/thrones/bundle/t1000
	name = "1000 Throne Gelts"
	icon_state = "throne1000"
	desc = "It's worth 1000 credits."
	worth = 1000

/obj/item/thrones/bundle/t5000
	name = "5000 Throne Gelts"
	icon_state = "throne5000"
	desc = "It's worth 5000 credits."
	worth = 5000

/obj/item/thrones/bundle/t10000
	name = "10000 Throne Gelts"
	icon_state = "throne10000"
	desc = "It's worth 10000 credits."
	worth = 10000

/obj/item/thrones/ewallet
	name = "Charge card"
	icon_state = "efundcard"
	desc = "A card that holds an amount of money."
	var/owner_name = "" //So the ATM can set it so the EFTPOS can put a valid name on transactions.

/obj/item/thrones/ewallet/examine(mob/user)
	. = ..(user)
	if (!(user in view(2)) && user!=src.loc) return
	to_chat(user, "<span class='notice'>Charge card's owner: [src.owner_name]. Thrones remaining: [src.worth].</span>")
