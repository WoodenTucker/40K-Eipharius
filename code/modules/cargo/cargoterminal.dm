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

/obj/machinery/computer/sidepiece
	name = "holo-globe"
	desc = "Displays current delivery/export paths. It also has a built-in small money printer for printing scrip. You can put extra currency here to get rid of it."
	icon = 'icons/obj/planetarytrade.dmi'
	icon_state = "globe_on"
	density = 1
	anchored = 1
	bound_height = 64
	bound_width = 64

/obj/machinery/computer/sidepiece/attack_hand(mob/user as mob)
	visible_message("[user] pressed a few keys on [src]. With a flash of light a small wad of bills was spat out of a small compartment.")
	new /obj/item/spacecash/bundle/c1000(src.loc)
	return

/obj/machinery/computer/sidepiece/attackby(var/obj/item/O, mob/user)
	if(istype(O, /obj/item/spacecash/bundle))
		visible_message("[user] puts a bundle of scrip into [src]. A small compartment clanged shut and swallowed the currency.")
		qdel(O)
	else
		return

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
	var/obj/item/card/id/gold/S = user.get_active_hand()
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
		visible_message("The console is locked, present your Governor ID!")
		return
	user.set_machine(src)
	var/dat = "<B>Imperial Tithe:</B><BR>"
	dat += "[GLOB.thrones] throne balance<BR>"
	dat += "<B>Tithe owed to the Imperium</B></BR>"
	dat += "<A href='byond://?src=\ref[src];tithe=1'>Imperial Tithe (350)</A><BR>"
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
		if(GLOB.thrones < 350) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		else
			visible_message("Thank you for your service to the Imperium, the Emperor protects!") //lil flavor text confirming
			GLOB.thrones -= 350 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			GLOB.tithe_paid = 1 //yay we paid the tithe
			playsound(world, 'sound/effects/tithepaid.ogg', 90, 0, -1)

	if (href_list["tax"])
		var/taxrates = list("5", "10", "15", "20", "25", "30",) //lists tax rates, we'll do set ones for now
		var/taxchoice = input("Choose the tax rate", "Available rates") as null|anything in taxrates

		switch(taxchoice)
			if("5")
				GLOB.tax_rate = 0.5
				to_world("<span class='warning'>[usr] has set the tax rate to 5%!</span>")
			if("10")
				GLOB.tax_rate = 0.10
				to_world("<span class='warning'>[usr] has set the tax rate to 10%!</span>")
			if("15")
				GLOB.tax_rate = 0.15
				to_world("<span class='warning'>[usr] has set the tax rate to 15%!</span>")
			if("20")
				GLOB.tax_rate = 0.20
				to_world("<span class='warning'>[usr] has set the tax rate to 20%!</span>")
			if("25")
				GLOB.tax_rate = 0.25
				to_world("<span class='warning'>[usr] has set the tax rate to 25%!</span>")
			if("30")
				GLOB.tax_rate = 0.30
				to_world("<span class='warning'>[usr] has set the tax rate to 30%!</span>")



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
	dat += "<A href='byond://?src=\ref[src];Whiteshield=1'>Purchase a Whiteshield (80)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];guardsman=1'>Purchase a Guardsman (150)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];medicae=1'>Purchase a Combat Medicae (225)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];specialist=1'>Purchase a Guard Specialist (250)</A><BR>"
	dat += "<B>Elite mercenaries</B><HR>"
	dat += "These are the best of the best. They are expensive, but very effective stand-alone units. You will not regret.<HR>"
	dat += "<A href='byond://?src=\ref[src];janissary=1'>Purchase a Vessorine Janissary (300)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a Ogryn (UNAVAILABLE) (450)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];unavailable=1'>Purchase a Psyker (UNAVAILABLE) (450)</A><BR>"
	dat += "<A href='byond://?src=\ref[src];scion=1'>Purchase a Tempestus Scion (350)</A><BR>"
	dat += "<B>Xeno scum</B><HR>"
	dat += "Each xenos comes in a wooden crate and fitted with a sedative implant to prevent unwanted awakening. You can disable the implant using golden writ. You must have exceptional leadership skills to maintain discipline among the xenos mercenaries, otherwise expect a revolt. Expect increased attention from the Ordo Xenos Inquisition as well.<HR>"
	dat += "<A href='byond://?src=\ref[src];ork=1'>Purchase a Ork Freeboota (400)</A><BR>"
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
	if (href_list["Whiteshield"])
		if(GLOB.thrones < 80)
			visible_message("You cannot afford that!")
			return
		else
			for (var/datum/job/job in SSjobs.occupations)
			var/job = "Imperial Guard Whiteshield"
			if (job)
				var/res = SSjobs.FreeRole(job)
				if(res == 0)
					visible_message("We have sent you enough [job]s. Wait for them to arrive before ordering new ones.")
				if(res == 1)
					playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
					visible_message("[job] has been sent. He will arrive at your outpost as soon as he can.")
					GLOB.thrones -= 80
					log_admin("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["guardsman"])
		if(GLOB.thrones < 150)
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
					GLOB.thrones -= 150
					log_admin("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["medicae"])
		if(GLOB.thrones < 225)
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
					GLOB.thrones -= 225
					log_admin("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["specialist"])
		if(GLOB.thrones < 250)
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
					GLOB.thrones -= 250
					log_admin("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["janissary"])
		if(GLOB.thrones < 300)
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
					GLOB.thrones -= 300
					log_admin("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["scion"])
		if(GLOB.thrones < 350)
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
					GLOB.thrones -= 350
					log_admin("A job slot for [job] has been opened by [key_name_admin(usr)] using mercenary hiring system")
				return
	if (href_list["ork"])
		if(GLOB.thrones < 400)
			visible_message("You cannot afford that!")
			return
		else
			visible_message("Ork delivered, Lord-Trader. He is your problem now")
			GLOB.thrones -= 400
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

//                  __________                _______
// \\           // |__________| ||\\      || ||      \\
//  \\         //  |            || \\     || ||       \\
//   \\       //   |__________  ||  \\    || ||        ||
//    \\     //    |__________| ||   \\   || ||        ||
//     \\   //     |            ||    \\  || ||        ||
//      \\_//      |__________  ||     \\ || ||       //
//       \_/       |__________| ||      \\|| ||______//

// -- Key --
/obj/item/key/vending
	name = "Vending Servitor Key"
	desc = "Vending servitor key."
	icon = 'icons/obj/items.dmi' // !!!!!!!ФАЙЛ!!!!!!!!!!
	icon_state = "keys"
	var/id = 0

/obj/item/key/vending/proc/set_name(newname)
	if(name != newname)
		name = newname + " key"

/obj/item/key/vending/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/pen))
		var/newkeyname = input(usr, "Input a new key name", "Name change", name) as null|text
		set_name(newkeyname)
		to_chat(usr, "You changed the name to - " + name)

// -- Lock --
/obj/item/lock_part
	name = "Vending Servitor Lock"
	desc = "Vending servitor lock"
	icon = 'icons/obj/storage.dmi' // !!!!!!!ФАЙЛ!!!!!!!!!!
	icon_state = "largebinemag"

	var/is_open = 0
	var/is_secured = 1
	var/keys[0]

/obj/item/lock_part/proc/check_key(obj/item/key/vending/K)
	if(K in keys)
		return 1
	else
		return 0

/obj/item/lock_part/proc/set_open(newopen)
	if(is_open != newopen)
		is_open = newopen

/obj/item/lock_part/proc/store_key(obj/item/key/vending/K)
	if(is_secured)
		to_chat(usr, "Nothing happens. I need to use screwdriver first")
		return

	if(K in keys)
		to_chat(usr, "Key already stored.")
	else
		keys += K
		playsound(src, 'sound/machines/ding.ogg', 60, 1)
		to_chat(usr, "Now you can unlock this lock by your key..")

/obj/item/lock_part/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/screwdriver))
		if(is_secured)
			is_secured = 0
			to_chat(usr, "Now you can store your key.")
		else
			is_secured = 1
			to_chat(usr, "Now this lock can be attached to vending servitor.")
		playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)

	if(istype(P, /obj/item/key/vending))
		store_key(P)

#define STATE_IDLE 0
#define STATE_SERVICE 1
#define STATE_VEND 2
#define STATE_LOCKOPEN 3

#define CASH_CAP_VENDOR 1

/obj/machinery/trading_machine
	name = "Vending Servitor"
	desc = "Vending Servitor! Unlock with a key, load your goods, and profit!"

	icon = 'icons/obj/vending.dmi' // !!!!!!!ФАЙЛ!!!!!!!!!!
	icon_state = "robotics"
	var/idle_icon_state = "robotics"
	var/service_icon_state = "robotics"
	var/lock_icon_state = "robotics"

	anchored = 1
	density = 1
	layer = 2.9
	use_power = 0

	var/stored_item_type = list(/obj/item)
	var/content[0]		// store items
	var/stored_credits = 0	// store credits
	var/obj/item/lock_part/lock = null
	var/machine_state = STATE_IDLE // 0 - working, 1 - on service, 2 - on vending, 3 - open lock
	var/id = 0
	var/create_lock = TRUE
	var/create_key = TRUE
	var/create_description = FALSE
	var/basic_price = 20
	var/expected_price = 0
	var/obj/item/vending_item
	var/item_not_acceptable_message = "Something is wrong... Can't insert an item."

/obj/machinery/trading_machine/Initialize()
	. = ..()
	if(create_lock)
		lock = new /obj/item/lock_part()
		lock.forceMove(src)
	if(create_key)
		var/obj/item/key/vending/K = new /obj/item/key/vending()
		K.name = "[src.name] key"
		K.forceMove(src.loc)
		if(lock)
			lock.is_secured = 0
			lock.store_key(K)
			lock.is_secured = 1
	if(create_description)
		var/obj/item/paper/P = new /obj/item/paper
		P.info = get_paper_description_data()
		P.update_icon()
		P.forceMove(src.loc)

/* Adding item to machine and spawn Set Price dialog */
/obj/machinery/trading_machine/proc/add_item(obj/item/Itm, mob/living/carbon/human/user)
	if(machine_state != STATE_SERVICE)
		return

	if(is_available_category(Itm) && is_acceptable_item_state(Itm))
		var/price = input(usr, "Enter price for " + Itm.name + ".", "Setup Price", basic_price) as null|num

		if(!price)
			return

		content[Itm] = min(max(round(price),0),50000)

		if(istype(Itm.loc, /mob))
			var/mob/M = Itm.loc
			if(!M.drop_item(Itm))
				to_chat(usr, "<span class='warning'>\the [Itm] is stuck to your hand, you cannot put it in \the [src]!</span>")
				return

		Itm.forceMove(src)
		to_chat(usr, "You loaded [Itm.name] to vending machine. New price - [content[Itm]] credits..")
		src.ui_interact(usr)
	else
		if(!is_available_category(Itm))
			to_chat(usr, "*beep* ..wrong item.")
		else if (!is_acceptable_item_state(Itm))
			to_chat(usr, item_not_acceptable_message)

/* Check item type and compare it with stored_item_type */
/obj/machinery/trading_machine/proc/is_available_category(obj/item/Itm)
	for(var/item_type in stored_item_type)
		if(istype(Itm, item_type))
			return 1
	return 0

/* Hook for check item parameters */
/obj/machinery/trading_machine/proc/is_acceptable_item_state(obj/item/Itm)
	return 1

/* Remove item from machine. */
/obj/machinery/trading_machine/proc/remove_item(obj/item/ItemToRemove)
	if(content.Remove(ItemToRemove))
		ItemToRemove.forceMove(src.loc)
		src.ui_interact(usr)

/*  Receive payment with cashmoney. */
/obj/machinery/trading_machine/proc/pay_with_cash(var/obj/item/spacecash/bundle/I)
	if(machine_state != STATE_VEND)
		return
	if(istype(I, /obj/item/spacecash/bundle))
		if(expected_price > I.worth)
			to_chat(usr, "\icon[I] <span class='warning'>That is not enough money.</span>")
			return 0

		visible_message("<span class='info'>\The [usr] inserts some scrip into \the [src]. [vending_item.name] is vended out of it.</span>")
		stored_credits += expected_price
		I.worth -= expected_price
		remove_item(vending_item)
		set_state(STATE_IDLE)
		onclose(usr, "vending")

		if(I.worth <= 0)
			usr.drop_from_inventory(I)
			qdel(I)
		else
			I.update_icon()

/* Spawn all credits on world and clear credits storage */
/obj/machinery/trading_machine/proc/remove_all_credits()
	if(stored_credits <= 0)
		return
	var/obj/item/spacecash/bundle/C = new /obj/item/spacecash/bundle
	C.worth = stored_credits
	C.forceMove(src.loc)
	C.forceMove(src.loc)
	C.update_icon()
	stored_credits = 0
	src.ui_interact(usr)

/* Storing item and price and switch machine to vending mode*/
/obj/machinery/trading_machine/proc/vend(obj/item/Itm)
	if(content.Find(Itm))
		vending_item = Itm
		expected_price = content[Itm]
		set_state(STATE_VEND)
		src.attack_hand(usr)

/* Remove lock from machine */
/obj/machinery/trading_machine/proc/drop_lock()
	if(!lock)
		to_chat(usr, "No lock here.")
		return

	lock.forceMove(loc)
	lock = null
	src.ui_interact(usr)

/* Assign lock to this machine */
/obj/machinery/trading_machine/proc/set_lock(obj/item/lock_part/newLock)
	if(lock)
		to_chat(usr, "This machine is already have a lock")
		return
	else
		lock = newLock
		if(usr.drop_item(lock))
			lock.forceMove(src)
			to_chat(usr, "Lock installed.")
	src.ui_interact(usr)

/* Switch machine to service mode */
/obj/machinery/trading_machine/proc/set_service(newMode)
	switch(machine_state)
		if(0)
			if(newMode)
				set_state(STATE_SERVICE)
		if(1)
			if(!newMode)
				set_state(STATE_IDLE)

	if(machine_state == STATE_SERVICE)
		to_chat(usr, "Vending Machine now on service")
	else
		to_chat(usr, "Vending Machine now working")
	src.ui_interact(usr)

/* Update icon depends on machine_state */
/obj/machinery/trading_machine/proc/updateIcon()
	switch(machine_state)
		if(STATE_IDLE)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_SERVICE)
			cut_overlays()
			icon_state = service_icon_state
		if(STATE_VEND)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_LOCKOPEN)
			cut_overlays()
			icon_state = lock_icon_state
			add_overlay(image(icon, "[initial(icon_state)]-panel"))

/* Seting machine state and update icon */
/obj/machinery/trading_machine/proc/set_state(new_state)
	if(machine_state == new_state)
		return

	if(new_state == STATE_IDLE && !lock)
		return

	if(!anchored)
		return

	machine_state = new_state
	updateIcon()

/* Attack By */
/obj/machinery/trading_machine/attackby(obj/item/OtherItem, mob/living/carbon/human/user, parameters)
	switch(machine_state)
		if(STATE_IDLE) // working

			/* Vending Key */
			if(istype(OtherItem, /obj/item/key/vending))
				if(lock)
					if(lock.check_key(OtherItem))
						set_service(STATE_SERVICE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						to_chat(usr, "Unknown key.")
				else
					to_chat(usr, "No lock here")

			/* Other */
			else
				attack_hand(user)

		if(STATE_SERVICE) // service

			/* Screwdriver */
			if(istype(OtherItem, /obj/item/screwdriver))
				set_state(STATE_LOCKOPEN)
				playsound(src, 'sound/items/Screwdriver.ogg', 60, 1)

			/* Locker */
			if(istype(OtherItem, /obj/item/lock_part))
				set_lock(OtherItem)
				playsound(src, 'sound/items/Crowbar.ogg', 60, 1)

			/* Key */
			if(istype(OtherItem, /obj/item/key/vending))
				if(lock)
					var/obj/item/key/vending/used_key = OtherItem
					if(lock.check_key(OtherItem) || id == used_key.id)
						set_state(STATE_IDLE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						to_chat(usr, "Unknown key.")
				else
					to_chat(usr, "No lock")


			else if(is_available_category(OtherItem))
				add_item(OtherItem, user)

			else
				attack_hand(user)

		if(STATE_VEND) // vending
			// credits
			if(istype(OtherItem, /obj/item/spacecash/bundle))
				pay_with_cash(OtherItem)
			else
				attack_hand(user)

		if(STATE_LOCKOPEN)
			/* Screwdriver */
			if(istype(OtherItem, /obj/item/screwdriver))
				set_state(STATE_SERVICE)
				playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)


			/* Wrench */
			else if(istype(OtherItem, /obj/item/wrench))
				anchored = !anchored
				playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
				user.visible_message("<span class='warning'>[user] has [anchored ? "" : "un" ]secured \the [src]!</span>",
									"You have [anchored ? "" : "un" ]secured \the [src]!")

			/* Crowbar */
			else if(istype(OtherItem, /obj/item/crowbar))
				drop_lock()

			else if(istype(OtherItem, /obj/item/lock_part))
				var/obj/item/lock_part/P = OtherItem
				if(P.is_secured)
					set_lock(OtherItem)
				else
					to_chat(usr, "You need to secure lock first. Use screwdriver.")

	src.ui_interact(user)

/* Spawn input dialog and set item price */
/obj/machinery/trading_machine/proc/set_price_by_input(obj/item/Itm, mob/user)
	if(machine_state != STATE_SERVICE)
		return

	var/new_price = input(user, "Enter price for " + Itm.name + ".", "Setup Price", content[Itm]) as null|num
	if(new_price)
		content[Itm] = 	max(round(new_price),0)

		playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 60, 1)
		src.ui_interact(user)

/* Find item by name and price in content and return type */
/obj/machinery/trading_machine/proc/find_item(item_name, item_price)
	for(var/obj/item/Itm in content)
		item_price = text2num(item_price)
		if(content[Itm] == item_price && sanitize(Itm.name) == sanitize(item_name))
			return Itm

/* Attack Hand */
/obj/machinery/trading_machine/attack_hand(mob/user)
	ui_interact(user)

/* Design UI here */
/obj/machinery/trading_machine/ui_interact(mob/user)
	. = ..()
	var/datum/browser/popup = new(user, "vending", (name), 400, 500)
	popup.set_content(get_ui_content(machine_state))
	popup.open()

/obj/machinery/trading_machine/proc/get_ui_content(state)
	var/dat = ""
	switch(state)
		// --- Work
		if(STATE_IDLE)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			if(content.len == 0)
				dat += "<font color = 'red'>No products loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<a href='byond://?src=\ref[src];vend=[item_name];current_price=[price]'>[Itm.name] | [price] credits</a> "
					dat += "<a href='byond://?src=\ref[src];examine=[item_name];current_price=[price]'>Examine</a><br> "

		//--- Service
		if(STATE_SERVICE)
			dat += "<h3>Machine setup menu</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color='green'>credits stored - [stored_credits]</font>"
			dat += "<a href='?src=\ref[src];removecredits=1'>Unload</a>"
			dat += "<h4> Items </h4> "

			if(content.len == 0)
				dat += "<font color = 'red'>No products loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<b>[Itm.name]</b> - [content[Itm]] credits"
					dat += "<a href='?src=\ref[src];setprice=[item_name];current_price=[price]'>Set price</a> "
					dat += "<a href='?src=\ref[src];remove=[item_name];current_price=[price]'>Remove</a> <br>"

		// --- Vend
		if(STATE_VEND)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color = 'red'>Waiting for [expected_price] credits!</font>"
			dat += "<a href='?src=\ref[src];back=1'> Back</a> "

		// --- Lock Open
		if(STATE_LOCKOPEN)
			dat += ""

	return dat

/obj/machinery/trading_machine/proc/get_paper_description_data()
	var/data
	data += "<h1> Wasteland Wending Machines </h1>"
	data += "Wasteland Trading Company guide."
	return data

/* TOPIC */
/obj/machinery/trading_machine/Topic(href, href_list)
	if(..())
		return

	if(href_list["vend"])
		var/vend_item_name = href_list["vend"]
		var/actual_price = href_list["current_price"]
		to_chat(usr, "Vending [vend_item_name]...")
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			vend(I)

	if(href_list["back"])
		to_chat(usr, "Machine is working")
		src.set_state(STATE_IDLE)
		ui_interact(usr)

	if(href_list["setprice"])
		to_chat(usr, "Set new price...")
		var/vend_item_name = href_list["setprice"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			set_price_by_input(I, usr)

	if(href_list["remove"])
		var/vend_item_name = href_list["remove"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			to_chat(usr, "Unloading item [href_list["unload"]]")
			remove_item(I)

	if(href_list["removecredits"])
		remove_all_credits()

	if(href_list["examine"])
		var/item_name = href_list["examine"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(item_name, actual_price)
		I.examine(usr)

	ui_interact()
