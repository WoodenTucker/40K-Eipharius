/obj/machinery/kaos/cargo_machine
	name = "Supply Computer"
	desc = "You use this to buy shit."
	icon = 'icons/obj/old_computers.dmi'
	icon_state = "cargo_machine"
	anchored = TRUE
	density = TRUE


/obj/machinery/kaos/cargo_machine/red

/obj/machinery/kaos/cargo_machine/blue

/obj/effect/landmark/red_cargo

/obj/effect/landmark/blue_cargo


//Just for looks, it shows off nicely where the cargo will be dropped off.
/obj/structure/cargo_pad
	name = "Cargo Pad"
	desc = "Stuff ordered from the cargo computer will appear on these pads."
	icon = 'icons/obj/old_computers.dmi'
	icon_state = "cargo_pad"
	density = FALSE
	unacidable = TRUE
	anchored = TRUE
	plane = WALL_PLANE

/obj/structure/cargo_pad/ex_act()
	return

/obj/structure/cargo_pad/bottom_left
	icon_state = "bottom_left"

/obj/structure/cargo_pad/bottom_middle
	icon_state = "bottom_middle"

/obj/structure/cargo_pad/bottom_right
	icon_state = "bottom_right"

//this desparately needs to be rewritten into a switch statement but im lazy and copy/pasting is easier (its now spiraled out of control AHHHHHHHHHHHH)
//Yandere-dev is now my patron saint

/obj/structure/cargo_pad/attackby(var/obj/item/O, var/mob/user) //lets do some exporting!
	if (!(istype(O, /obj/item/)))
		to_chat(user, "<span class='warning'>[O] cannot be exported!</span>")
		return 1
	else if (istype(O, /obj/item/reagent_containers/food/snacks/meat/grox))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes item
		GLOB.thrones += 10 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O, /obj/item/reagent_containers/food/snacks/shaframeat))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 7 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O, /obj/item/stack/logs))
		var/obj/item/stack/logs/S = O
		if (S)
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			S.amount -=1
			S.update_icon()
			GLOB.thrones += 3 //adds crowns to da counter
			visible_message("[usr] packages the [O] and loads it into the teleporter.")
			playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
			return
	else if (istype(O, /obj/item/reagent_containers/food/snacks/bearmeat))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 7 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O, /obj/item/organ/internal/appendix))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 3 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O, /obj/item/organ/internal/eyes))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 5 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O, /obj/item/organ/internal/heart))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 10 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/organ/internal/kidneys))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 5 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/organ/internal/liver))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 5 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/organ/internal/lungs))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 7 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/newore/coalore))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 3 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/newore/copperore))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 2 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/newore/ironore))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 4 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/newore/goldore))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 10 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/newore/adamantiumore))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 50 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/newore/silverore))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 5 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/copperingot))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 8 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/ironingot))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 12 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/goldingot))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 25 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/silveringot))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 18 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return
	else if (istype(O,	/obj/item/adamantiumingot))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		qdel(O) //deletes ring
		GLOB.thrones += 120 //adds crowns to da counter
		visible_message("[usr] packages the [O] and loads it into the teleporter.")
		playsound(usr, 'sound/effects/beam.ogg', 50, 0, -1)
		return