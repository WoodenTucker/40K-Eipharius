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

	var/buying = 0 //spam prevention
	var/food = 0 //food section

/obj/machinery/computer/planetarytrade/attack_hand(mob/user as mob)	//Starting menu

	user.set_machine(src)
	if(food == 0)
		var/dat = "<B>Sub-sector Trade:</B><BR>"
		dat += "[GLOB.thrones] thrones<BR>"
		dat += "<A href='byond://?src=\ref[src];withdraw=1'>Withdraw Thrones</A><BR>"
		dat += "<B>Items on the Market:</B><BR>"
		dat += "<B> Medical Supplies:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];akit=1'>Advanced Aid Kit (15)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];mb=1'>Medical Belt (20)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];ckit=1'>Combat Aid Kit (25)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];skit=1'>Surgery Kit (20)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];ac=1'>Atepoine Crate (30)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];vatboy=1'>Vat-Grown Human (100)</A><BR>"
		dat += "<B> Luxury Foods/Drinks:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];ca=1'>Cheap Amasec (3)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];ea=1'>Expensive Amasec (8)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];meat=1'>Meat Crate (25)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];lho=1'>Pack of Lho (10)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];lighter=1'>Lighter (3)</A><BR>"
		dat += "<B> Construction Materials & Tools:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];glass=1'>Stack of Glass (15)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];metal=1'>Stack of Metal (15)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];wire=1'>Barbed Wire (5)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];cloth=1'>Stack of Cloth (20)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];miningcrate=1'>Mining Crate (15)</A><BR>"
		dat += "<B> Equipment:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];shovel=1'>Shovel (5)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];sabre=1'>Sabre (8)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];cmask=1'>Military Gas Mask (5)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];chelmet=1'>Flak Helmet (10)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];carmor=1'>Flak Armor (15)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];nvg=1'>Photo Visor (35)</A><BR>"
		dat += "<B> Weaponry:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];lasgun=1'>Las Rifle (20)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];lascarb=1'>Las Carbine (25)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];laspistol=1'>Las Pistol (12)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];mcsword=1'>Mercy Chainsword (40)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];stubber=1'>Auto Stubber (25)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];bolter=1'>Bolt Pistol (50)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];frag=1'>Frag Grenade (15)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];incen=1'>Incendiary Grenade (18)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];krak=1'>Krak Grenade (22)</A><BR>"
		dat += "<B> Ammunition:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];bolterammo=1'>Bolt Pistol Magazine (10)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];stubberammo=1'>Auto Stubber Magazine (5)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];rifleammo=1'>Rifle Ammo Box (5)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];lasmag=1'>Las Magazine (5)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];shotshell=1'>Shotgun Shell Box (8)</A><BR>"
		dat += "<B> Laboratory/Misc Materials:</B><BR>"
		dat += "<A href='byond://?src=\ref[src];silver=1'>Cut Silver (100)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];gold=1'>Cut Gold (100)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];diamonds=1'>Cut Diamonds (200)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];plasteel=1'>Plasteel (80)</A><BR>"
		dat += "<A href='byond://?src=\ref[src];phoron=1'>Solid Phoron (100)</A><BR>"
		dat += "May the Emperor guide and protect all trade. Praise the Immortal Emperor for his unending rule!<HR>"
		user << browse(dat, "window=scroll")
		onclose(user, "scroll")
		return

/obj/machinery/computer/planetarytrade/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/computer/planetarytrade/Topic(href, href_list)
	if(..())
		return

	if(get_dist(src, usr) > 2)
		to_chat(usr, "You need to be at the computer to push that button!")
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["akit"])
		if(GLOB.thrones < 15) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 15 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/storage/firstaid/adv(T.loc) //what they spawning
			src.buying = 0
	if (href_list["mb"])
		if(GLOB.thrones < 20) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 20 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/storage/belt/medical/full(T.loc) //what they spawning
			src.buying = 0
	if (href_list["ckit"])
		if(GLOB.thrones < 25) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 25 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/storage/firstaid/combat(T.loc) //what they spawning
			src.buying = 0
	if (href_list["skit"])
		if(GLOB.thrones < 20) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 20 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/storage/firstaid/surgery(T.loc) //what they spawning
			src.buying = 0
	if (href_list["ac"])
		if(GLOB.thrones < 30) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 30 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/structure/closet/crate/ateopoine(T.loc) //what they spawning
			src.buying = 0
	if (href_list["ca"])
		if(GLOB.thrones < 3) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 3 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/reagent_containers/food/drinks/bottle/amasecpoor(T.loc) //what they spawning
			src.buying = 0
	if (href_list["ea"])
		if(GLOB.thrones < 8) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 8 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/reagent_containers/food/drinks/bottle/amasecexpensive(T.loc) //what they spawning
			src.buying = 0
	if (href_list["glass"])
		if(GLOB.thrones < 15) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 15 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/glass/fifty(T.loc) //what they spawning
			src.buying = 0
	if (href_list["metal"])
		if(GLOB.thrones < 15) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 15 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/steel/fifty(T.loc) //what they spawning
			src.buying = 0
	if (href_list["wire"])
		if(GLOB.thrones < 5) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/barbwire(T.loc) //what they spawning
			src.buying = 0
	if (href_list["shovel"])
		if(GLOB.thrones < 5) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/shovel(T.loc) //what they spawning
			src.buying = 0
	if (href_list["sabre"])
		if(GLOB.thrones < 8) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 8 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/material/sword/commissword/sabre(T.loc) //what they spawning
			src.buying = 0
	if (href_list["cmask"])
		if(GLOB.thrones < 5) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/clothing/mask/gas/security(T.loc) //what they spawning
			src.buying = 0
	if (href_list["chelmet"])
		if(GLOB.thrones < 10) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 10 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/clothing/head/helmet/guardhelmet(T.loc) //what they spawning
			src.buying = 0
	if (href_list["carmor"])
		if(GLOB.thrones < 15) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 15 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/clothing/suit/armor/guardsman(T.loc) //what they spawning
			src.buying = 0
	if (href_list["nvg"])
		if(GLOB.thrones < 35) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 35 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/clothing/glasses/night(T.loc) //what they spawning
			src.buying = 0
	if (href_list["lasgun"])
		if(GLOB.thrones < 20) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 20 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/gun/energy/las/lasgun(T.loc) //what they spawning
			src.buying = 0
	if (href_list["lascarb"])
		if(GLOB.thrones < 25) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 25 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/gun/energy/las/lasgun/tinkered/lascarbine(T.loc) //what they spawning
			src.buying = 0
	if (href_list["laspistol"])
		if(GLOB.thrones < 12) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 12 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/gun/energy/las/laspistol(T.loc) //what they spawning
			src.buying = 0
	if (href_list["lasmag"])
		if(GLOB.thrones < 5) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/cell/lasgun(T.loc) //what they spawning
			src.buying = 0
	if (href_list["mcsword"])
		if(GLOB.thrones < 40) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 40 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/melee/mercycs(T.loc) //what they spawning
			src.buying = 0
	if (href_list["stubber"])
		if(GLOB.thrones < 25) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 25 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/gun/projectile/automatic/stubber(T.loc) //what they spawning
			src.buying = 0
	if (href_list["stubberammo"])
		if(GLOB.thrones < 5) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/ammo_magazine/box/a556/mg08(T.loc) //what they spawning
			src.buying = 0
	if (href_list["bolter"])
		if(GLOB.thrones < 50) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 50 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/gun/projectile/bolter_pistol(T.loc) //what they spawning
			src.buying = 0
	if (href_list["krak"])
		if(GLOB.thrones < 22) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 22
			 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/grenade/frag/high_yield/krak(T.loc) //what they spawning
			src.buying = 0
	if (href_list["bolterammo"])
		if(GLOB.thrones < 10) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 10) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/ammo_magazine/bolt_pistol_magazine(T.loc) //what they spawning
			src.buying = 0
	if (href_list["rifleammo"])
		if(GLOB.thrones < 5) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 5 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/ammo_magazine/brifle(T.loc) //what they spawning
			src.buying = 0
	if (href_list["shotshell"])
		if(GLOB.thrones < 8) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 8 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/ammo_box/shotgun(T.loc) //what they spawning
			src.buying = 0
	if (href_list["meat"])
		if(GLOB.thrones < 25) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 25 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/structure/closet/crate/meat(T.loc) //what they spawning
			src.buying = 0
	if (href_list["lho"])
		if(GLOB.thrones < 10) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 10 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/storage/fancy/cigarettes/dromedaryco(T.loc) //what they spawning
			src.buying = 0
	if (href_list["lighter"])
		if(GLOB.thrones < 3) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 3 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/flame/lighter/zippo(T.loc) //what they spawning
			src.buying = 0
	if (href_list["miningcrate"])
		if(GLOB.thrones < 15) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 15 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/structure/closet/crate/miningcrate(T.loc) //what they spawning
			src.buying = 0
	if (href_list["vatboy"])
		if(GLOB.thrones < 100) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 100 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/structure/closet/crate/vatgrownboy(T.loc) //what they spawning
			src.buying = 0
	if (href_list["cloth"])
		if(GLOB.thrones < 20) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 20 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/cloth/fifty(T.loc) //what they spawning
			src.buying = 0
	if (href_list["frag"])
		if(GLOB.thrones < 15) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 15 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/grenade/frag/warfare(T.loc) //what they spawning
			src.buying = 0
	if (href_list["incen"])
		if(GLOB.thrones < 18) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 18 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/grenade/fire(T.loc) //what they spawning
			src.buying = 0
	if (href_list["silver"])
		if(GLOB.thrones < 100) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 100 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/silver/ten(T.loc) //what they spawning
			src.buying = 0
	if (href_list["gold"])
		if(GLOB.thrones < 100) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 100 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/gold/ten(T.loc) //what they spawning
			src.buying = 0
	if (href_list["diamonds"])
		if(GLOB.thrones < 200) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 200 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/diamond/ten(T.loc) //what they spawning
			src.buying = 0
	if (href_list["plasteel"])
		if(GLOB.thrones < 50) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 50 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/plasteel/ten(T.loc) //what they spawning
			src.buying = 0
	if (href_list["phoron"])
		if(GLOB.thrones < 100) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		if (src.buying == 1) //stops spam buying
			visible_message("Please wait for your previous order to finish!")
			return
		else
			visible_message("Your order has been confirmed!") //lil flavor text confirming
			GLOB.thrones -= 100 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			src.buying = 1
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			sleep(40)
			var/obj/effect/landmark/cargospawn/T = locate() //where dey spawning
			new /obj/item/stack/material/phoron/ten(T.loc) //what they spawning
			src.buying = 0
	if (href_list["withdraw"])
		var/withdrawamount = list("one", "five", "ten", "fifteen", "twenty", "twenty-five", "fifty", "one-hundred",) //lists tax rates, we'll do set ones for now
		var/withdrawchoice = input("Withdraw thrones", "Available amounts") as null|anything in withdrawamount

		switch(withdrawchoice)
			if("one")
				if(GLOB.thrones < 1)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=1
					new /obj/item/stack/thrones3(src.loc)
					return
			if("five")
				if(GLOB.thrones < 5)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=5
					new /obj/item/stack/thrones2(src.loc)
					return
			if("ten")
				if(GLOB.thrones < 10)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=10
					new /obj/item/stack/thrones(src.loc)
					return
			if("fifteen")
				if(GLOB.thrones < 15)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=15
					new /obj/item/stack/thrones2(src.loc)
					new /obj/item/stack/thrones(src.loc)
					return
			if("twenty")
				if(GLOB.thrones < 20)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=20
					new /obj/item/stack/thrones(src.loc)
					new /obj/item/stack/thrones(src.loc)
					return
			if("twenty-five")
				if(GLOB.thrones < 25)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=25
					new /obj/item/stack/thrones(src.loc)
					new /obj/item/stack/thrones(src.loc)
					new /obj/item/stack/thrones2(src.loc)
					return
			if("fifty")
				if(GLOB.thrones < 50)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=50
					new /obj/item/stack/thrones/five(src.loc)

					return
			if("one-hundred")
				if(GLOB.thrones < 100)
					visible_message("You don't have enough thrones to withdraw that many!")
					return
				else
					GLOB.thrones -=100
					new /obj/item/stack/thrones/ten(src.loc)
					return






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


/obj/machinery/computer/planetarytrade/attackby(var/obj/item/stack/thrones/O, var/mob/user) //These manage putting coins directly into the console
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
	dat += "<A href='byond://?src=\ref[src];kroot=1'>Purchase a Kroot mercenary (100)</A><BR>"
	dat += "May the Emperor guide and protect all trade. Praise the Immortal Emperor for his unending rule!<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return

/obj/machinery/computer/requisitioncogitator/Topic(href, href_list)
	if(..())
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["kroot"])
		if(GLOB.thrones < 100) //do we got enough shekels?
			visible_message("You cannot afford that!")
			return
		else
			visible_message("A Kroot hunter is on his way, Lord-Trader.") //lil flavor text confirming
			GLOB.thrones -= 100 //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			var/obj/effect/landmark/reqspawn/T = locate() //where dey spawning
			new /mob/living/carbon/human/kroot(T.loc) //what they spawning

//Procs for grabbing players.
/mob/living/carbon/human/kroot/proc/request_player() //reqs the player
	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can JB shitters
			continue
		if(O.client) //just duh
			question(O.client)

/mob/living/carbon/human/kroot/proc/question(var/client/C) //asks the questions
	spawn(0)
		if(!C)	return
		var/response = alert(C, "A Kroot Mercenary has been hired by the RT. Are you interested?", "Kroot Hunter", "Yes", "No",)
		if(!C || ckey)
			return
		if(response == "Yes")
			transfer_personality(C)
			src.warfare_faction = IMPERIUM

/mob/living/carbon/human/kroot/proc/transfer_personality(var/client/candidate) //puts the guy in the place

	if(!candidate)
		return

	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "syndicate"
		sleep (2)