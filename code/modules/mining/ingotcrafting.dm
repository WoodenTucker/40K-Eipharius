
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

/*
   _____
  / ____|
 | |     ___  _ __  _ __   ___ _ __
 | |    / _ \| '_ \| '_ \ / _ \ '__|
 | |___| (_) | |_) | |_) |  __/ |
  \_____\___/| .__/| .__/ \___|_|
             | |   | |
             |_|   |_|
*/


/obj/item/ingots/copperingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W) || isChisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Heavy Stubber Ammo", "Stub Rifle Ammo", "Shells Boxes", "Sniper Rifle Ammo", "Warmonger Magazine", "Mk.3 Autogun Magazine", "Pistol Magazine", ".44 Revolver Speed Loader", "Trench Shovel", "Galvanic Rifle Ammo") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Heavy Stubber Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future MG-08 ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Heavy Stubber Ammo)"
			if("Stub Rifle Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Stormrider Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Stub Rifle Ammo)"
			if("Shells Boxes")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Shells Boxes.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Copper Ingot (Shells Boxes)"
			if("Sniper Rifle Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Sniper Rifle Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Copper Ingot (Sniper Rifle Ammo)"
			if("Warmonger Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Warmonger Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Copper Ingot (Warmonger Magazine)"
			if("Pistol Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Villian Pistol Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Copper Ingot (Pistol Magazine)"
			if(".44 Revolver Speed Loader")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future .44 Speed Loader.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Copper Ingot (.44 Revolver Speed Loader)"

			if("Trench Shovel")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future trench shovel.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Trench Shovel)"
			if("Mk.3 Autogun Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Autogun Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 9
				src.ismarked = 1
				src.name = "Copper Ingot (Mk.3 Autogun Magazine)"
			if("Galvanic Rifle Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future set of galvanic rifle ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 10
				src.ismarked = 1
				src.name = "Copper Ingot (Galvanic Rifle Ammo)"



	if(isLasercutter(W)||isHammer(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed heavy stubber rounds! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Heavy Stubber Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed stub rifle rounds! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Stub Rifle Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed shells boxes! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Shells Boxes)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed sniper rifle ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Sniper Rifle Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed warmonger ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Warmonger magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed pistol magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Pistol Magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed .44 magnum speed loader! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (.44 magnum speed loader)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(8)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed trench shovel! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Trench Shovel)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(9)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed soulburn magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Mk.3 Autogun Magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(10)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed galvanic rifle ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Galvanic Rifle Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
	if(isHolyoils(W)||isLube(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/box/a556/mg08(user.loc)
				new /obj/item/ammo_magazine/box/a556/mg08(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/brifle(user.loc)
				new /obj/item/ammo_magazine/brifle(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/box/shotgun(user.loc)
				new /obj/item/ammo_magazine/box/shotgun(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_casing/a145(user.loc)
				new /obj/item/ammo_casing/a145(user.loc)
				new /obj/item/ammo_casing/a145(user.loc)
				new /obj/item/ammo_casing/a145(user.loc)
				new /obj/item/ammo_casing/a145(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/c45rifle/akarabiner(user.loc)
				new /obj/item/ammo_magazine/c45rifle/akarabiner(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/c45m/warfare(user.loc)
				new /obj/item/ammo_magazine/c45m/warfare(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/c44(user.loc)
				new /obj/item/ammo_magazine/c44(user.loc)
				qdel(src)
				return
			if(8)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/shovel(user.loc)
				new /obj/item/shovel(user.loc)
				qdel(src)
				return
			if(9)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/mc9mmt/machinepistol(user.loc)
				new /obj/item/ammo_magazine/mc9mmt/machinepistol(user.loc)
				qdel(src)
				return
			if(10)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/galvanic(user.loc)
				new /obj/item/ammo_magazine/galvanic(user.loc)
				qdel(src)
				return


/*
  _____
 |_   _|
   | |  _ __ ___  _ __
   | | | '__/ _ \| '_ \
  _| |_| | | (_) | | | |
 |_____|_|  \___/|_| |_|

*/

/obj/item/ingots/ironingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W)||isChisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Boscolet Pattern Stub Rifle", "Snapper Pattern Stub Rifle", "Enforcer Shotgun", "Mk. III Sniper Rifle", "Warmonger Autogun", "Mk.22 Autogun", "Vraks Pattern Heavy Stubber", "Villiers Pistol",/* "The Chrome Stub Pistol",*/ "The Slug Revolver", "Skitarii Plating", "Combat Knife", "Cane Sword", "Landmine") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Boscolet Pattern Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mark I Stormrider.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Iron Ingot (Boscolet Pattern Stub Rifle)"
			if("Snapper Pattern Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mark I Snapper.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Iron Ingot (Snapper Pattern Stub Rifle)"
			if("Enforcer Shotgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Enforcer Shotgun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Iron Ingot (Enforcer Shotgun)"
			if("Mk. III Sniper Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mk. III Sniper Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Iron Ingot (Mk. III Sniper Rifle)"
			if("Warmonger Autogun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mk.3 Warmonger.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Iron Ingot (Warmonger Autogun)"
			if("Vraks Pattern Heavy Stubber")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Vraks Pattern Heavy Stubber.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Iron Ingot (Vraks Pattern Heavy Stubber)"
			if("Villiers Pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Villiers Pistol.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Iron Ingot (Villiers Pistol)"
			if("The Chrome Stub Pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Chrome Stub Pistol.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Iron Ingot (Chrome Stub Pistol)"
			if("The Slug Revolver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Slug Revolver.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 9
				src.ismarked = 1
				src.name = "Iron Ingot (Slug Revolver)"
			if("Skitarii Plating")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future skitarii plating.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 10
				src.ismarked = 1
				src.name = "Iron Ingot (Skitarii Plating)"
			if("Mk.22 Autogun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Mk.22 Autogun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 11
				src.ismarked = 1
				src.name = "Iron Ingot (Mk.22 Autogun)"
			if("Combat Knife")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future combat knife.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 12
				src.ismarked = 1
				src.name = "Iron Ingot (Combat Knife)"
			if("Cane Sword")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future cane sword.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 13
				src.ismarked = 1
				src.name = "Iron Ingot (Cane Sword)"
			if("Landmine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future landmine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 14
				src.ismarked = 1
				src.name = "Iron Ingot (Landmine)"



	if(isLasercutter(W)||isHammer(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Boscolet Pattern Stub Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Mark I Stormrider Body)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Snapper Pattern Stub Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Mark I Snapper)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Enforcer Shotgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Enforcer Shotgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Mk. III Sniper Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Mk. III Sniper Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Mk.3 Warmonger! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Warmonger Autogun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Vraks Pattern Heavy Stubber! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Vraks Pattern Heavy Stubber)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Villiers Pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Villiers Pistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(8)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Chrome Stub Pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Chrome Stub Pistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(9)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Slug Revolver! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Slug Revolver)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(10)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed skitarii plating! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved skitarii plating)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(11)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Mk.22 Autogun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Mk.22 Autogun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(12)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed combat knife! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Combat Knife)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(13)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed cane sword! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Cane Sword)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(14)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed lanmine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Landmine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)


	if(isHolyoils(W)||isLube(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/shitty(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/heavysniper(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/m22/warmonger(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/stubber(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/warfare(user.loc)
				qdel(src)
				return
			if(8)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/talon(user.loc)
				qdel(src)
				return
			if(9)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/slugrevolver(user.loc)
				qdel(src)
				return
			if(10)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/skitariiplating(user.loc)
				qdel(src)
				return
			if(11)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/machinepistol(user.loc)
				qdel(src)
				return
			if(12)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/material/sword/combat_knife(user.loc)
				new /obj/item/material/sword/combat_knife(user.loc)
				qdel(src)
				return
			if(13)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/material/sword/cane(user.loc)
				qdel(src)
				return
			if(14)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/landmine(user.loc)
				qdel(src)
				return


/*
   _____ _ _
  / ____(_) |
 | (___  _| |_   _____ _ __
  \___ \| | \ \ / / _ \ '__|
  ____) | | |\ V /  __/ |
 |_____/|_|_| \_/ \___|_|

*/

/obj/item/ingots/silveringot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W)||isChisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Bolt Rifle Magazine","Kantrael M36 Lasgun", "Catachan Mark IV Lascarbine","Lucius No.98 Lasgun", "Kantrael MG Laspistol", ".338 Lapua Magnum Magazine", "Machine Silver", "Galvanic Rifle") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Bolt Rifle Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Bolt Rifle Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Silver Ingot (Bolt Rifle Magazine)"

			if("Kantrael M36 Lasgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Lasgun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Silver Ingot (Kantrael M36 Lasgun)"

			if("Catachan Mark IV Lascarbine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Las-Carbine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Silver Ingot (Catachan Mark IV Lascarbine)"

			if("Lucius No.98 Lasgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Lucius Lasgun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Silver Ingot (Lucius No.98 Lasgun)"

			if("Kantrael MG Laspistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Kantrael MG Laspistol.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Silver Ingot (Kantrael MG Laspistol)"

			if("Machine Silver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Silver.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Silver Ingot (Machine Silver)"

			if(".338 Lapua Magnum Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future .338 Lapua Magnum Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Silver Ingot (.338 Lapua Magnum Magazine)"

			if("Galvanic Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Galvanic Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Silver Ingot (Galvanic Rifle)"

	if(isLasercutter(W)||isHammer(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Bolt Rifle Magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Bolt Rifle Magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed lasgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved lasgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed las-carbine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved las-carbine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Lucius lasgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (carved lucius lasgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed laspistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Kantrael MG Laspistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed unit of Silver! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Machine Silver)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed .338 Lapua Magnum Magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (.338 Lapua Magnum Magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(8)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Galvanic Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Galvanic Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)


	if(isHolyoils(W)||isLube(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/bolt_rifle_magazine(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun/tinkered/catachan(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun/lucius(user.loc,1)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/laspistol(user.loc,1)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/silver(user.loc,1)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/lp338(user.loc,1)
				qdel(src)
				return
			if(8)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/galvanic/rifle(user.loc,1)
				qdel(src)
				return

/*
   _____       _     _
  / ____|     | |   | |
 | |  __  ___ | | __| |
 | | |_ |/ _ \| |/ _` |
 | |__| | (_) | | (_| |
  \_____|\___/|_|\__,_|

*/

/obj/item/ingots/goldingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W)||isChisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Golden Ring", "Machine Gold",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Golden Ring")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Golden Ring.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Gold Ingot (Golden Ring)"

			if("Machine Gold")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Gold.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Gold Ingot (Machine Gold)"

	if(isLasercutter(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Golden Ring! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Golden Ring)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed unit of Gold! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Machine Gold)"
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
				new /obj/item/card/id/ring/goldring(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/gold(user.loc,1)
				qdel(src)
				return

/*

   _____      _           _ _
  / ____|    | |         | | |
 | |     ___ | |__   ___ | | |_
 | |    / _ \| '_ \ / _ \| | __|
 | |___| (_) | |_) | (_) | | |_
  \_____\___/|_.__/ \___/|_|\__|


*/

/obj/item/ingots/coboltingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Golden Ring", "Machine Gold",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Golden Ring")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Golden Ring.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Gold Ingot (Golden Ring)"

			if("Machine Gold")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Gold.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Gold Ingot (Machine Gold)"

	if(isLasercutter(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Golden Ring! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Golden Ring)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed unit of Gold! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Machine Gold)"
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
				new /obj/item/card/id/ring/goldring(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/gold(user.loc,1)
				qdel(src)
				return

/*

kultrinium

*/

/obj/item/ingots/kultriniumingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Golden Ring", "Machine Gold",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Golden Ring")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Golden Ring.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Gold Ingot (Golden Ring)"

			if("Machine Gold")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Gold.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Gold Ingot (Machine Gold)"

	if(isLasercutter(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Golden Ring! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Golden Ring)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed unit of Gold! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Machine Gold)"
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
				new /obj/item/card/id/ring/goldring(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/gold(user.loc,1)
				qdel(src)
				return

/*

  Diamantine

*/

/obj/item/ingots/diamantineingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Golden Ring", "Machine Gold",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Golden Ring")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Golden Ring.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Gold Ingot (Golden Ring)"

			if("Machine Gold")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Gold.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Gold Ingot (Machine Gold)"

	if(isLasercutter(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)

			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Golden Ring! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Golden Ring)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed unit of Gold! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Gold Ingot (Carved Machine Gold)"
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
				new /obj/item/card/id/ring/goldring(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/gold(user.loc,1)
				qdel(src)
				return


/*            _                             _   _
     /\      | |                           | | (_)
    /  \   __| | __ _ _ __ ___   __ _ _ __ | |_ _ _   _ _ __ ___
   / /\ \ / _` |/ _` | '_ ` _ \ / _` | '_ \| __| | | | | '_ ` _ \
  / ____ \ (_| | (_| | | | | | | (_| | | | | |_| | |_| | | | | | |
 /_/    \_\__,_|\__,_|_| |_| |_|\__,_|_| |_|\__|_|\__,_|_| |_| |_|

*/

/obj/item/ingots/adamantiumingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Locke Pattern Bolt-Rifle", "Blood Angels Baal Mark Vb Pattern Bolt-Rifle", "Raven Guard Godwyn Mark Vb Pattern Bolt-Rifle", "Salamanders Godwyn Mark Vb Pattern Bolt-Rifle", "Ultramarines Godwyn Mark Vb Pattern Bolt-Rifle", "Kraken penetrator bolter magazine", "Mark IV .338 Stub Rifle", "Incendiary Galvanic Rifle Ammo", "Radium Carbine Ammo", "Radium Pistol Ammo") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Locke Pattern Bolt-Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Locke Pattern Bolt Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Adamantium Ingot (Locke Pattern Bolter)"
			if("Blood Angels Baal Mark Vb Pattern Bolt-Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Blood Angels Baal Mark Vb Pattern Bolt Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Adamantium Ingot (Blood Angels Baal Mark Vb Pattern Bolter)"
			if("Raven Guard Godwyn Mark Vb Pattern Bolt-Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Raven Guard Godwyn Mark Vb Pattern Bolt Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Adamantium Ingot (Raven Guard Godwyn Mark Vb Pattern Bolter)"
			if("Salamanders Godwyn Mark Vb Pattern Bolt-Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Salamanders Godwyn Mark Vb Pattern Bolt Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Adamantium Ingot (Ultramarines Godwyn Mark Vb Pattern Bolter)"
			if("Ultramarines Godwyn Mark Vb Pattern Bolt-Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Ultramarines Godwyn Mark Vb Pattern Bolt Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Adamantium Ingot (Ultramarines Godwyn Mark Vb Pattern Bolter)"

			if("Kraken penetrator bolter magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Kraken penetrator bolter magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Adamantium Ingot (Kraken penetrator bolter magazine)"

			if("Mark IV .338 Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mark IV .338 Stub Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Adamantium Ingot (Mark IV .338 Stub Rifle)"
			if("Incendiary Galvanic Rifle Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Incendiary Galvanic Rifle Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Adamantium Ingot (Incendiary Galvanic Rifle Ammo)"

			if("Radium Carbine Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Radium Carbine Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 9
				src.ismarked = 1
				src.name = "Adamantium Ingot (Radium Carbine Ammo)"

			if("Radium Pistol Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Radium Pistol Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 10
				src.ismarked = 1
				src.name = "Adamantium Ingot (Radium Pistol Ammo)"


	if(isLasercutter(W))
		if(ismarked == 0)
			visible_message("Use your auto-chisel first!")
			return
		if(src.rubtheoils == 1)
			visible_message("It's been carved! Use your holy oils!")
			return

		switch(whatwemaking)
			if(1)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Locke Pattern Bolt-Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Locke Pattern Bolt-Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Blood Angels Baal Mark Vb Bolt-Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Baal Mark Vb Bolt-Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Raven Guard Godwyn Mark Vb Bolt-Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Raven Guard Godwyn Mark Vb Bolt-Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Salamanders Godwyn Mark Vb Pattern Bolt-Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Salamanders Godwyn Mark Vb Pattern Bolt-Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Ultramarines Godwyn Mark Vb Pattern Bolt-Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Ultramarines Godwyn Mark Vb Pattern Bolt-Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Kraken penetrator bolter magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Kraken penetrator bolter magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Mark IV .338 Stub Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Mark IV .338 Stub Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(8)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Incendiary Galvanic Rifle Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Incendiary Galvanic Rifle Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(9)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Radium Carbine Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Radium Carbine Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(10)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Radium Pistol Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Radium Pistol Ammo)"
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
				new /obj/item/gun/projectile/lockebolter(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/bolter/bang(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/bolter/raven(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/bolter/sally(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/bolter(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/bolt_rifle_magazine/kp(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338(user.loc)
				qdel(src)
				return
			if(8)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/galvanic/fire(user.loc)
				new /obj/item/ammo_magazine/galvanic/fire(user.loc)
				new /obj/item/ammo_magazine/galvanic/fire(user.loc)
				new /obj/item/ammo_magazine/galvanic/fire(user.loc)
				qdel(src)
				return
			if(9)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/radcarbine(user.loc)
				new /obj/item/ammo_magazine/radcarbine(user.loc)
				new /obj/item/ammo_magazine/radcarbine(user.loc)
				qdel(src)
				return
			if(10)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/radcarbine/radpistol(user.loc)
				new /obj/item/ammo_magazine/radcarbine/radpistol(user.loc)
				new /obj/item/ammo_magazine/radcarbine/radpistol(user.loc)
				new /obj/item/ammo_magazine/radcarbine/radpistol(user.loc)
				new /obj/item/ammo_magazine/radcarbine/radpistol(user.loc)
				qdel(src)
