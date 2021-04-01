
/*
   _____            __ _   _
  / ____|          / _| | (_)
 | |     _ __ __ _| |_| |_ _ _ __   __ _
 | |    | '__/ _` |  _| __| | '_ \ / _` |
 | |____| | | (_| | | | |_| | | | | (_| |
  \_____|_|  \__,_|_|  \__|_|_| |_|\__, |
                                    __/ |
                                   |___/
*/

/obj/item/ingots/copperingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Mg08 Ammo", "Meme",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Mg08 Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future MG-08 ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Copper Ingot (Marked MG-08 Ammo)"
			if("Meme")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future MG-08 ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)

	if(isLasercutter(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed MG-08 Rounds! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved MG-08 Ammo)"
					src.oilammo = 1
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

	if(isHolyoils(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/box/a556/mg08(src.loc)
				new /obj/item/ammo_magazine/box/a556/mg08(src.loc)
				qdel(src)
				return

