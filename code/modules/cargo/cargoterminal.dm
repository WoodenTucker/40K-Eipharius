//since we need cargo and shuttles dont work, we gonna do this in true IS12 fashion and remake it in matt/randys image.
//The menu isnt pretty but its functional and no one fukking wants me designing UI, im gunna use this set up for reinforcement buying as well.
//this desparately needs to be rewritten into a switch statement but im lazy and copy/pasting is easier (its now spiraled out of control AHHHHHHHHHHHHH)
//Yandere-dev is now my patron saint

/obj/machinery/computer/planetarytrade  //this is the cargo machine
	name = "interplanetary trade console"
	desc = "A highly complex console used for interplanetary trade."
	icon = 'icons/obj/planetarytrade.dmi'
	icon_state = "active"
	density = 1
	anchored = 1
	bound_height = 64
	bound_width = 64

	var/busy = FALSE
	var/list/obj/effect/landmark/cargospawn/drop_pads = list()
	var/list/datum/cargo_entry/purchaseable_items
	var/list/datum/cargo_category/available_categories
	var/balance = 0
	var/datum/cargo_category/current_category
	var/current_menu = 0

	//Temporary
	var/list/sellable_items = list(
	/obj/item/stack/material/platinum = 200,
	/obj/item/stack/material/gold = 50,
	/obj/item/stack/material/diamond = 100,
	/obj/item/stack/material/silver = 50
	)

/obj/machinery/computer/planetarytrade/Initialize()
	purchaseable_items = init_subtypes(/datum/cargo_entry)
	available_categories = init_subtypes(/datum/cargo_category)

	for(var/datum/cargo_entry/entry in purchaseable_items) // Remove templates
		if(entry.name == null)
			purchaseable_items -= entry
			continue

		for(var/datum/cargo_category/category in available_categories)
			if(entry.category == category.name)
				category.for_sale += entry

	for(var/pad in world) // This is nasty. Maybe make it so the noble has to link drop-pads manually?
		if(istype(pad, /obj/effect/landmark/cargospawn))
			drop_pads += pad

/obj/machinery/computer/planetarytrade/attack_hand(mob/user as mob)	//Starting menu
	user.set_machine(src)
	ui_interact(user)
	return

/obj/machinery/computer/planetarytrade/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/computer/planetarytrade/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/title = "Trade Console"
	var/data[0]
	var/stock[0]
	var/categories[0]

	data["menu"] = current_menu
	data["balance"] = balance
	data["stock"] = stock

	if(current_menu == 0)
		for(var/datum/cargo_category/cat in available_categories)
			categories[++categories.len] = list("name" = cat.name, "ref" = "\ref[cat]")

	if(current_category)
		for(var/datum/cargo_entry/entry in current_category.for_sale)
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

/obj/machinery/computer/planetarytrade/Topic(href, href_list)
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
		var/datum/cargo_entry/entry = locate(href_list["purchase"]) in purchaseable_items
		entry.purchase(src)
		ui_interact(usr)
		return TRUE

	if(href_list["withdraw"])
		var/withdrawamt = round(input(usr, "", "Withdraw thrones") as null|num)
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

/obj/machinery/computer/sidepiece  //this is a computer that can reset the round. That game physically ends when the antag clicks 'exterminatus'
	name = "holo-globe"
	desc = "Displays current delivery/export paths."
	icon = 'icons/obj/planetarytrade.dmi'
	icon_state = "globe_on"
	density = 1
	anchored = 1
	bound_height = 64
	bound_width = 64




//////////////////////////////////////////////////
////////////Put da coin in da machine/////////////
//////////////////////////////////////////////////


/obj/machinery/computer/planetarytrade/attackby(var/obj/item/O, mob/user) //These manage putting coins directly into the console
	if (!(istype(O, /obj/item/)) || O.sales_price == 0)
		to_chat(user, "<span class='warning'>[O] cannot be exported!</span>")
		return 1
	if(istype(O, /obj/item/stack)) //TODO, for loop to handle amount to sell. Input for len?
		var/obj/item/stack/M = O
		if(M.amount > 1)
			M.amount -=1
			visible_message("[user] places [M] onto the [src]. With a flash of light and a crackle the item is transported to the Messina Spaceport.")
			to_chat(user, "[M.sales_price - round(M.sales_price * GLOB.tax_rate,1)] has been added to the terminal.")
			src.balance += M.sales_price - round(M.sales_price * GLOB.tax_rate, 1)
			GLOB.thrones += round(M.sales_price * GLOB.tax_rate,1) //taxes on all sales through the system
			playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
			M.update_icon() //so coins in hand update
			return
		else
			visible_message("[user] places [M] onto the [src]. With a flash of light and a crackle the item is transported to the Messina Spaceport.")
			to_chat(user, "[M.sales_price - round(M.sales_price * GLOB.tax_rate,1)] has been added to the terminal.")
			src.balance += M.sales_price - round(M.sales_price * GLOB.tax_rate, 1)
			GLOB.thrones += round(M.sales_price * GLOB.tax_rate) //taxes on all sales through the system
			qdel(M)
			return
	else
		visible_message("[user] places [O] onto the [src]. With a flash of light and a crackle the item is transported to the Messina Spaceport.")
		to_chat(user, "[O.sales_price - round(O.sales_price * GLOB.tax_rate,1)] has been added to the terminal.")
		src.balance += O.sales_price - round(O.sales_price * GLOB.tax_rate, 1)
		GLOB.thrones += round(O.sales_price * GLOB.tax_rate,1) //taxes on all sales through the system
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		qdel(O)
		return

	return ..()

//////////////////////////////////////////////////
/////////Administrator PC for tax/tithes//////////
/////////////////////////////////////////////////
/obj/machinery/computer/tithecogitator
	name = "tithe cogitator"
	desc = "An Administratum cogitator used to process taxes and pay this planets Imperial tithe."
	icon = 'icons/obj/modular_console.dmi'
	icon_state = "console"
	anchored = 1
	density = 1
	atom_flags = ATOM_FLAG_CLIMBABLE

	var/locked = 1

//so you can put coins in this bad boy as well.
/obj/machinery/computer/tithecogitator/attackby(var/obj/item/stack/thrones/O, var/mob/user) //These manage putting coins directly into the console
	if(O.amount < 0)
		to_chat(user, "<span class='warning'>You don't have enough [O] to put into the computer!</span>")
		return 1
	else if (istype(O, /obj/item/stack/thrones))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		O.amount -= 1 //takes a shekel from the stack
		GLOB.thrones += 10 //adds crowns to da counter
		visible_message("[usr] deposits a $10 throne coin into the console.")
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		return
	else if (istype(O, /obj/item/stack/thrones2))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		O.amount -= 1 //takes a shekel from the stack
		GLOB.thrones += 5 //adds crowns to da counter
		visible_message("[usr] deposits a $5 throne coin into the console.")
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		return
	else if (istype(O, /obj/item/stack/thrones3))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		O.amount -= 1 //takes a shekel from the stack
		GLOB.thrones += 1 //adds crowns to da counter
		visible_message("[usr] deposits a $1 throne coin into the console.")
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		return

/obj/machinery/computer/tithecogitator/RightClick(mob/living/user)
	if(!CanPhysicallyInteract(user))
		return
	var/obj/item/card/id/ring/administrator/S = user.get_active_hand()
	if(!istype(S))
		return
	if(locked == 1)
		locked = 0
		visible_message("[usr] unlocks the console!")
	else
		locked = 1
		visible_message("[usr] locks the console!")


/obj/machinery/computer/tithecogitator/attack_hand(mob/user as mob)	//Starting menu
	if(locked == 1)
		visible_message("The console is locked, present your Administratum ring!")
		return
	user.set_machine(src)
	var/dat = "<B>Imperial Tithe:</B><BR>"
	dat += "[GLOB.thrones] throne balance<BR>"
	dat += "<B>Tithe owed to the Imperium</B></BR>"
	dat += "<A href='byond://?src=\ref[src];tithe=1'>Imperial Tithe (750)</A><BR>"
	dat += "<B>Set the tax rate:</B></BR>"
	dat += "<A href='byond://?src=\ref[src];tax=1'>Set tax rate (default is 15%)</A><BR>"
	dat += "May the Emperor guide and protect all trade. Praise the Immortal Emperor for his unending rule!<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return

/obj/machinery/computer/tithecogitator/Topic(href, href_list)
	if(..())
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["tithe"])
		if(GLOB.thrones < 750) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		else
			visible_message("Thank you for your service to the Imperium, the Emperor protects!") //lil flavor text confirming
			GLOB.thrones -= 750 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			GLOB.tithe_paid = 1 //yay we paid the tithe
			playsound(world, 'sound/effects/tithepaid.ogg', 90, 0, -1)

	if (href_list["tax"])
		var/taxrates = list("fifteen", "twenty", "twenty-five", "thirty", "thirty-five", "fourty", "fourty-five", "fifty",) //lists tax rates, we'll do set ones for now
		var/taxchoice = input("Choose the tax rate", "Available rates") as null|anything in taxrates

		switch(taxchoice)
			if("fifteen")
				GLOB.tax_rate = 0.15
				to_world("<span class='warning'>[usr] has set the tax rate to 15%!</span>")
			if("twenty")
				GLOB.tax_rate = 0.20
				to_world("<span class='warning'>[usr] has set the tax rate to 20%!</span>")
			if("twenty-five")
				GLOB.tax_rate = 0.25
				to_world("<span class='warning'>[usr] has set the tax rate to 25%!</span>")
			if("thirty")
				GLOB.tax_rate = 0.30
				to_world("<span class='warning'>[usr] has set the tax rate to 30%!</span>")
			if("thirty-five")
				GLOB.tax_rate = 0.35
				to_world("<span class='warning'>[usr] has set the tax rate to 35%!</span>")
			if("fourty")
				GLOB.tax_rate = 0.40
				to_world("<span class='warning'>[usr] has set the tax rate to 40%!</span>")
			if("fourty-five")
				GLOB.tax_rate = 0.45
				to_world("<span class='warning'>[usr] has set the tax rate to 45%!</span>")
			if("fifty")
				GLOB.tax_rate = 0.50
				to_world("<span class='warning'>[usr] has set the tax rate to 50%!</span>")


/obj/machinery/computer/tithecogitator/attack_paw(mob/user as mob)
	return src.attack_hand(user)


////////////////////////////////////////////////
//////////////Bounty Computer stuff////////////
//////////////////////////////////////////////

/obj/machinery/computer/bountycogitator
	name = "bounty cogitator"
	desc = "An Administratum cogitator used to process sub-sector bounties."
	icon = 'icons/obj/modular_console.dmi'
	icon_state = "console"
	anchored = 1
	density = 1
	atom_flags = ATOM_FLAG_CLIMBABLE

//so you can put bounties in this bad boy
/obj/machinery/computer/bountycogitator/attackby(var/obj/item/card/id/O, var/mob/user) //These manage putting coins directly into the console
	if (!(istype(O, /obj/item/card/id)))
		to_chat(user, "<span class='warning'>[O] is not an active bounty!</span>")
		return 1
	else if (istype(O, /obj/item/card/id/ring/tau))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 50 //adds crowns to da counter
		visible_message("[usr] completes an Imperial bounty! Tau ring deposited.")
		playsound(usr, 'sound/effects/bountycomplete.ogg', 100, 0, -1)
		new /obj/item/stack/thrones2(src.loc)
		return
	else if (istype(O, /obj/item/card/id/dog_tag/kroot))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 50 //adds crowns to da counter
		visible_message("[usr] completes an Imperial bounty! Kroot tags deposited.")
		playsound(usr, 'sound/effects/bountycomplete.ogg', 50, 0, -1)
		new /obj/item/stack/thrones2(src.loc)
		return
	else if (istype(O, /obj/item/card/id/dog_tag/ork))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 50 //adds crowns to da counter
		visible_message("[usr] completes an Imperial bounty! Ork tags deposited.")
		playsound(usr, 'sound/effects/bountycomplete.ogg', 50, 0, -1)
		new /obj/item/stack/thrones2(src.loc)
		return



/obj/machinery/computer/bountycogitator/attack_hand(mob/user as mob)	//Starting menu

	user.set_machine(src)
	var/dat = "<B>Imperial Bounties:</B><BR>"
	dat += "[GLOB.thrones] throne balance<BR>"
	dat += "<B>Current Bounties</B></BR>"
	dat += "Tau Rings (50/5):</BR>"
	dat += "Kroot Tags (50/5):</BR>"
	dat += "Ork Tags (50/5):</BR>"
	dat += "May the Emperor guide and protect all trade. Praise the Immortal Emperor for his unending rule!<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return


/obj/machinery/computer/bountycogitator/attack_paw(mob/user as mob)
	return src.attack_hand(user)



///////////////////////////////////////
////////////Requisition Computer//////
/////////////////////////////////////
/obj/machinery/computer/requisitioncogitator
	name = "requisition cogitator"
	desc = "An cogitator capable of hiring mercenaries from around the imperium!"
	icon = 'icons/obj/modular_console.dmi'
	icon_state = "console"
	anchored = 1
	density = 1
	atom_flags = ATOM_FLAG_CLIMBABLE
	var/merc_crate

//so you can put coins in this bad boy as well.
/obj/machinery/computer/requisitioncogitator/attackby(var/obj/item/stack/thrones/O, var/mob/user) //These manage putting coins directly into the console
	if(O.amount < 0)
		to_chat(user, "<span class='warning'>You don't have enough [O] to put into the computer!</span>")
		return 1
	else if (istype(O, /obj/item/stack/thrones))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		O.amount -= 1 //takes a shekel from the stack
		GLOB.thrones += 10 //adds crowns to da counter
		visible_message("[usr] deposits a $10 throne coin into the console.")
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		return
	else if (istype(O, /obj/item/stack/thrones2))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		O.amount -= 1 //takes a shekel from the stack
		GLOB.thrones += 5 //adds crowns to da counter
		visible_message("[usr] deposits a $5 throne coin into the console.")
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		return
	else if (istype(O, /obj/item/stack/thrones3))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		O.amount -= 1 //takes a shekel from the stack
		GLOB.thrones += 1 //adds crowns to da counter
		visible_message("[usr] deposits a $1 throne coin into the console.")
		playsound(usr, 'sound/effects/coin_ins.ogg', 50, 0, -1)
		O.update_icon() //so coins in hand update
		return


/obj/machinery/computer/requisitioncogitator/attack_hand(mob/user as mob)	//Starting menu
	if(GLOB.tithe_paid == 0)
		visible_message("You must first pay off your tithe before accessing this computer!")
		return
	user.set_machine(src)
	var/dat = "<B>Imperial Requisition:</B><BR>"
	dat += "[GLOB.thrones] throne balance<BR>"
	dat += "<B>Thank you for your loyalty to the Imperium</B></BR>"
	dat += "<B>Available units:</B></BR>"
	dat += "<B>Common mercenaries</B><HR>"
	dat += "Those are well trained soldiers. Not the best, but loyal. They are effective only in groups<HR>"
	dat += "<A href='byond://?src=\ref[src];conscript=1'>Purchase a Conscript (100)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];guardsman=1'>Purchase a Guardsman (200)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];medicae=1'>Purchase a Combat Medicae (250)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];specialist=1'>Purchase a Guard Specialist (300)</A><BR>"
	dat += "<B>Elite mercenaries</B><HR>"
	dat += "These are the best of the best. They are expensive, but very effective stand-alone units. You will not regret.<HR>"
	dat += "<A href='byond://?src=\ref[src];janissary=1'>Purchase a Vessorine Janissary (400)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a Ogryn (UNAVAILABLE) (450)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a Psyker (UNAVAILABLE) (450)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];scion=1'>Purchase a Tempestus Scion (500)</A><BR>"
	dat += "<B>Xeno scum</B><HR>"
	dat += "Each xenos comes in a wooden crate and fitted with a sedative implant to prevent unwanted awakening. You can disable the implant using golden writ. You must have exceptional leadership skills to maintain discipline among the xenos mercenaries, otherwise expect a revolt. Expect increased attention from the Ordo Xenos Inquisition as well.<HR>"
	dat += "<A href='byond://?src=\ref[src];ork=1'>Purchase a Ork Freebooter (500)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a Kroot Shaper (UNAVAILABLE) (600)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a Eldar Corsair (UNAVAILABLE) (850)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a (REDACTED) (UNAVAILABLE) (1000)</A><BR>" // Someone cool and very usefull. Like Jokaero
	dat += "May the Emperor guide and protect all trade. Praise the Immortal Emperor for his unending rule!<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return

/obj/machinery/computer/requisitioncogitator/Topic(href, href_list)
	if(..())
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["unavailable"])
		visible_message("This type of mercenary is temporarily unavailable")
		return
	if (href_list["conscript"])
		if(GLOB.thrones < 100)
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Imperial Guard Conscript"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 100
					message_admins("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["guardsman"])
		if(GLOB.thrones < 200)
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Imperial Guardsman"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 200
					message_admins("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["medicae"])
		if(GLOB.thrones < 250) 
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Combat Medicae"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 250
					message_admins("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["specialist"])
		if(GLOB.thrones < 300) 
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Imperial Guard Specialist"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 300
					message_admins("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["janissary"])
		if(GLOB.thrones < 400) 
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Vessorine Janissary"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 400
					message_admins("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["scion"])
		if(GLOB.thrones < 500) 
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Tempestus Scion"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 500
					message_admins("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["ork"])
		if(GLOB.thrones < 500)
			visible_message("You cannot afford that!")
			return
		else
			visible_message("Ork delivered, Lord-Trader. He is your problem now")
			GLOB.thrones -= 500 
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			merc_crate = /obj/structure/largecrate/animal/orkmerc
			new merc_crate(src.loc)

/obj/structure/largecrate/animal/orkmerc
	name = "Ork Freebooter"
	held_type = /mob/living/carbon/human/ork/merc



				//PATH FOR A XENO MERCENARIES



/mob/living/carbon/human/ork/merc



				//HOW DO WE AWAKE THEM



/obj/item/card/id/gold/attack(mob/living/carbon/human/ork/merc/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		playsound(src, 'sound/effects/adapter.ogg', 100, 1, 1)
		visible_message("<span class='notice'>[user] brings [src] to [C]'s head in an attempt to disable his sedative implant. This may require several attempts after a while.</span>")
		C.request_player()
	..()



				//PROCS FOR GRABBING PLAYERS



/mob/living/carbon/human/ork/merc/proc/request_player()
	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(O.client)
			question(O.client)

/mob/living/carbon/human/ork/merc/proc/question(var/client/C)
	if(!C)
		return FALSE
	var/response = alert(C, "A new xenos mercenary has been awoken by Lord Trader. Are you interested?", "Ork Freebooter", "Yes", "No",)
	if(!C || ckey)
		return FALSE
	if(response == "Yes")
		transfer_personality(C)
		src.warfare_faction = IMPERIUM
		return TRUE
	return FALSE

/mob/living/carbon/human/ork/merc/proc/transfer_personality(var/client/candidate)

	if(!candidate)
		return

	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "syndicate"
		sleep (2)
