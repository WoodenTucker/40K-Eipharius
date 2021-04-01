
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

/obj/item/ingots/copperingot/attackby(var/obj/item/device/autochisel/O, var/mob/living/carbon/human/user)
	if (!(istype(O,	/obj/item/device/autochisel)))
		visible_message("That isn't a valid ingot!")
		return

	else if(istype(O, /obj/item/device/autochisel))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Mg08 Ammo", "Meme",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Mg08 Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over the [O], morphing the shape and marking it as future MG-08 ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking.Cut()
				src.whatwemaking += "Mg08 Ammo"
			if("Meme")
				visible_message("[user]'s auto-chisel moves in a blur over the [O], morphing the shape and marking it as future MG-08 ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)

