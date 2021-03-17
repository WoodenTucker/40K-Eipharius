//since we need cargo and shuttles dont work, we gonna do this in true IS12 fashion and remake it in matt/randys image.
//The menu isnt pretty but its functional and no one fukking wants me designing UI, im gunna use this set up for reinforcement buying as well.

/obj/machinery/computer/planetarytrade  //this is the cargo machine
	name = "interplanetary trade console"
	desc = "A highly complex console used for interplanetary trade."
	icon = 'icons/obj/planetarytrade.dmi'
	icon_state = "on2"
	density = 1
	anchored = 1
	bound_height = 64
	bound_width = 64

	var/buying = 0 //spam prevention

/obj/machinery/computer/planetarytrade/attack_hand(mob/user as mob)	//Starting menu

	user.set_machine(src)
	var/dat = "<B>Sub-sector Trade:</B><BR>"
	dat += "[GLOB.thrones] thrones<BR>"
	dat += "<B>Items on the Market:</B><BR>"
	dat += "<B> Meats:</B><BR>"
	dat += "<A href='byond://?src=\ref[src];shafra=1'>Shafra Meat (5)</A><BR>"
	dat += "May the Emperor guide and protect all trade. Praise the Immortal Emperor for his unending rule!<HR>"
	user << browse(dat, "window=scroll")
	onclose(user, "scroll")
	return

/obj/machinery/computer/planetarytrade/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/computer/planetarytrade/Topic(href, href_list)
	if(..())
		return

	if (usr.stat || usr.restrained()) return //Nope! We are either dead or restrained!
	if (href_list["shafra"])
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
			new /obj/item/reagent_containers/food/snacks/shaframeat(T.loc) //what they spawning
			src.buying = 0



/obj/machinery/computer/sidepiece  //this is a computer that can reset the round. That game physically ends when the antag clicks 'exterminatus'
	name = "interplanetary trade console power pack"
	desc = "A highly complex console used for interplanetary trade."
	icon = 'icons/obj/planetarytrade.dmi'
	icon_state = "on"
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
