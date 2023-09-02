//since we need cargo and shuttles dont work, we gonna do this in true IS12 fashion and remake it in matt/randys image.
//The menu isnt pretty but its functional and no one fukking wants me designing UI, im gunna use this set up for reinforcement buying as well.
//this desparately needs to be rewritten into a switch statement but im lazy and copy/pasting is easier (its now spiraled out of control AHHHHHHHHHHHHH)
//Yandere-dev is now my patron saint

/obj/machinery/computer/planetarytrade2  //this is the cargo machine
	name = "interplanetary trade console"
	desc = "A highly complex console used for interplanetary trade."
	icon = 'icons/obj/planetarytrade.dmi'
	icon_state = "active"
	density = 1
	anchored = 1
	bound_height = 64
	bound_width = 64

	var/busy = FALSE
	var/list/obj/effect/landmark/cargospawn2/drop_pads = list()
	var/list/datum/noble_entry/purchaseable_items
	var/list/datum/noble_category/available_categories
	var/balance = 0
	var/datum/noble_category/current_category
	var/current_menu = 0

	//Temporary
	var/list/sellable_items = list(
	/obj/item/stack/material/platinum = 200,
	/obj/item/stack/material/gold = 50,
	/obj/item/stack/material/diamond = 100,
	/obj/item/stack/material/silver = 50
	)

/obj/machinery/computer/planetarytrade2/Initialize()
	purchaseable_items = init_subtypes(/datum/noble_entry)
	available_categories = init_subtypes(/datum/noble_category)

	for(var/datum/noble_entry/entry in purchaseable_items) // Remove templates
		if(entry.name == null)
			purchaseable_items -= entry
			continue

		for(var/datum/noble_category/category in available_categories)
			if(entry.category == category.name)
				category.for_sale += entry

	for(var/pad in world) // This is nasty. Maybe make it so the noble has to link drop-pads manually?
		if(istype(pad, /obj/effect/landmark/cargospawn2))
			drop_pads += pad

/obj/machinery/computer/planetarytrade2/attack_hand(mob/user as mob)	//Starting menu
	user.set_machine(src)
	ui_interact(user)
	return

/obj/machinery/computer/planetarytrade2/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/computer/planetarytrade2/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/title = "Trade Console"
	var/data[0]
	var/stock[0]
	var/categories[0]

	data["menu"] = current_menu
	data["balance"] = balance
	data["stock"] = stock

	if(current_menu == 0)
		for(var/datum/noble_category/cat in available_categories)
			categories[++categories.len] = list("name" = cat.name, "ref" = "\ref[cat]")

	if(current_category)
		for(var/datum/noble_entry/entry in current_category.for_sale)
			stock[++stock.len] = list("name" = entry.name, "cost" = entry.cost + round(GLOB.tax_rate * entry.cost), "ref" = "\ref[entry]")

	data["categories"] = categories
	if(current_category)
		data["category"] = current_category.name
	// update the ui if it exists, returns null if no ui is passed/found
	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)	// No auto-refresh
		ui = new(user, src, ui_key, "tradeconsole.tmpl", title, 450, 600)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/computer/planetarytrade2/Topic(href, href_list)
	if(..())
		return

	if(get_dist(src, usr) > 2)
		to_chat(usr, "You need to be at the computer to push that button!")
		return

	if (usr.stat || usr.restrained())
		return //Nope! We are either dead or restrained!

	if(href_list["category"])
		if(href_list["category"] == "main")
			current_category = null
			current_menu = 0
			ui_interact(usr)
			return TRUE
		current_category = locate(href_list["category"]) in available_categories
		current_menu = 1
		ui_interact(usr)
		return TRUE

	if(href_list["purchase"])
		var/datum/noble_entry/entry = locate(href_list["purchase"]) in purchaseable_items
		entry.purchase(src)
		ui_interact(usr)
		return TRUE

	if(href_list["withdraw"])
		var/withdrawamt = round(input(usr, "", "Withdraw money") as null|num)
		if(withdrawamt > balance)
			return FALSE
		if(withdrawamt <= 0)
			return FALSE
		balance -= withdrawamt
		while(withdrawamt > 0)
			if(withdrawamt >= 10)
				var/obj/item/stack/thrones/money = new(get_turf(usr))
				money.amount = round(withdrawamt / 10)
				withdrawamt -= (money.amount * 10)
			if(withdrawamt >= 5 && withdrawamt < 10)
				var/obj/item/stack/thrones2/money = new(get_turf(usr))
				money.amount = round(withdrawamt / 5)
				withdrawamt -= (money.amount * 5)
			if(withdrawamt >= 1 && withdrawamt < 5)
				var/obj/item/stack/thrones3/money = new(get_turf(usr))
				money.amount = withdrawamt
				withdrawamt -= money.amount
		ui_interact(usr)
		return TRUE

//////////////////////////////////////////////////
////////////Put da coin in da machine/////////////
//////////////////////////////////////////////////


/obj/machinery/computer/planetarytrade2/attackby(var/obj/item/O, mob/user) //These manage putting coins directly into the console
	if (!(istype(O, /obj/item/)) || O.sales_price == 0)
		to_chat(user, "<span class='warning'>[O] cannot be exported!</span>")
		return 1
	if(istype(O, /obj/item/stack)) //TODO, for loop to handle amount to sell. Input for len?
		var/obj/item/stack/M = O
		if(M.amount > 1)
			M.amount -=1
			visible_message("[user] places [M] onto the [src]. ")
			to_chat(user, "[M.sales_price - round(M.sales_price * GLOB.tax_rate,1)] has been added to the terminal.")
			src.balance += M.sales_price - round(M.sales_price * GLOB.tax_rate, 1)
			GLOB.thrones += round(M.sales_price * GLOB.tax_rate,1) //taxes on all sales through the system
			playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
			M.update_icon() //so coins in hand update
			return
		else
			visible_message("[user] places [M] onto the [src]. ")
			to_chat(user, "[M.sales_price - round(M.sales_price * GLOB.tax_rate,1)] has been added to the terminal.")
			src.balance += M.sales_price - round(M.sales_price * GLOB.tax_rate, 1)
			GLOB.thrones += round(M.sales_price * GLOB.tax_rate) //taxes on all sales through the system
			qdel(M)
			return
	else
		visible_message("[user] places [O] onto the [src]. ")
		to_chat(user, "[O.sales_price - round(O.sales_price * GLOB.tax_rate,1)] has been added to the terminal.")
		src.balance += O.sales_price - round(O.sales_price * GLOB.tax_rate, 1)
		GLOB.thrones += round(O.sales_price * GLOB.tax_rate,1) //taxes on all sales through the system
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		qdel(O)
		return

	return ..()
