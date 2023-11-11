
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

		var/craftingchoices = list("Inferior Lasgun Cell", "Boscelot Revolver", "Shells Boxes", ".357 Speedloaders", "9mm Pistol Mags", ".45 Pistol Magazines", "Bolt Pistol Magazine", "Trench Shovel", "Chisel", "Hammer", "Ingot Lube", "Kieji Handgun", "Snub Nose Kieji Handgun", "Sawn-Off Shotgun", "Combat Knife") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Inferior Lasgun Cell")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Inferior Lasgun Cell")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Inferior Lasgun Cell)"
			if("Boscelot Revolver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Boscolet Revolver")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Boscelot Revolver)"
			if("Shells Boxes")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Shells Boxes.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Copper Ingot (Shells Boxes)"
			if(".357 Speedloaders")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future .357 Speedloaders")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Copper Ingot (.357 Speedloaders)"
			if("9mm Pistol Mags")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future 9mm Pistol Mags.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Copper Ingot (9mm Pistol Mag)"
			if(".45 Pistol Magazines")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future .45 Pistol Magazines.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Copper Ingot (.45 Pistol Magazines)"
			if("Bolt Pistol Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Bolt Pistol Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Copper Ingot (Bolt Pistol Magazine)"
			if("Trench Shovel")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future trench shovel.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Trench Shovel)"
			if("Chisel")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Chisel")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 9
				src.ismarked = 1
				src.name = "Copper Ingot (Chisel)"
			if("Hammer")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Hammer")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 10
				src.ismarked = 1
				src.name = "Copper Ingot (Hammer)"
			if("Ingot Lube")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Ingot Lube")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 11
				src.ismarked = 1
				src.name = "Copper Ingot (Ingot Lube)"
			if("Kieji Handgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Kieji Handgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 12
				src.ismarked = 1
				src.name = "Copper Ingot (Kieji Handgun)"
			if("Snub Nose Kieji Handgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Snub Nose Kieji Handgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 13
				src.ismarked = 1
				src.name = "Copper Ingot (Snub Nose Kieji Handgun)"
			if("Sawn-Off Shotgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Sawn-Off Shotgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 14
				src.ismarked = 1
				src.name = "Copper Ingot (Sawn-Off Shotgun)"
			if("Combat Knife")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Combat Knife")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 15
				src.ismarked = 1
				src.name = "Copper Ingot (Combat Knife)"






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
					visible_message("[user] carefully carves the ingot into a blessed Inferior Lasgun Cell! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Inferior Lasgun Cell)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Boscelot Revolver! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Boscelot Revolver)"
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
					visible_message("[user] carefully carves the ingot into blessed .357 Speedloaders! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved .357 Speedloaders)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into  blessed 9mm Pistol Mags! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved 9mm Pistol Mags)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed .45 pistol magazines! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved .45 Pistol Magazines)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Bolt Pistol Magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Bolt Pistol Magazine)"
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
					visible_message("[user] carefully carves the ingot into a blessed Chisel! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Chisel)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(10)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed  Hammer! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Hammer)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(11)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Ingot Lube! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Ingot Lube)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(12)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Kieji Handgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Kieji Handgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(13)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Snub Nose Kieji Handgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Snub Nose Kieji Handgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(14)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Sawn-Off Shotgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Sawn-Off Shotgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(15)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Combat Knife! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Combat Knife)"
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
				new /obj/item/cell/lasgun/small(user.loc)
				new /obj/item/cell/lasgun/small(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/revolver/detective/boscelot(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_box/shotgun(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/a357(user.loc)
				new /obj/item/ammo_magazine/a357(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/mc9mm(user.loc)
				new /obj/item/ammo_magazine/mc9mm(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/mc45mm(user.loc)
				new /obj/item/ammo_magazine/mc45mm(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/bolt_pistol_magazine(user.loc)
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
				new /obj/item/device/chisel(user.loc)
				qdel(src)
				return
			if(10)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/device/hammer(user.loc)
				qdel(src)
				return
			if(11)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/device/lube(user.loc)
				qdel(src)
				return
			if(12)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/pistol/kieji(user.loc)
				qdel(src)
				return
			if(13)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/pistol/kieji/snub(user.loc)
				qdel(src)
				return
			if(14)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/doublebarrel(user.loc)
				qdel(src)
				return
			if(15)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/melee/sword/combat_knife(user.loc)
				new /obj/item/melee/sword/combat_knife(user.loc)
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

		var/craftingchoices = list("Messina Pattern 'Pewter' stub pistol", "Boscelot Pattern Stub Rifle", "SMG magazine (9mm)", "Speed Loaders (.44)", "Loose Rifle Ammo (7.62)", ) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Messina Pattern 'Pewter' stub pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Messina Pattern 'Pewter' stub pistol")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Iron Ingot (Messina Pattern 'Pewter' stub pistol)"
			if("Boscelot Pattern Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Boscelot Pattern Stub Rifle")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Iron Ingot (Boscolet Pattern Stub Rifle)"
			if("SMG magazine (9mm)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future SMG magazine (9mm)")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Iron Ingot (SMG magazine (9mm))"
			if("Speed Loaders (.44)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Speed Loaders (.44)")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Iron Ingot (Speed Loaders (.44))"
			if("Loose Rifle Ammo (7.62)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Loose Rifle Ammo (7.62).")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Iron Ingot (Loose Rifle Ammo (7.62))"



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
					visible_message("[user] carefully carves the ingot into a blessed Messina Pattern 'Pewter' stub pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Messina Pattern 'Pewter' stub pistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Boscelot Pattern Stub Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Boscelot Pattern Stub Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed SMG magazine (9mm)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved SMG magazine (9mm))"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Speed Loaders (.44)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Speed Loaders (.44))"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Loose Rifle Ammo (7.62)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Loose Rifle Ammo (7.62))"
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
				new /obj/item/gun/projectile/pistol/pewter(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/smgmc9mm(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/c44(user.loc)
				new /obj/item/ammo_magazine/c44(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/handful/brifle_handful(user.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful(user.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful(user.loc)
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

		var/craftingchoices = list("Lasgun Cell","Machine Silver",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Lasgun Cell")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Lasgun Cells.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Silver Ingot (Lasgun Cell)"

			if("Machine Silver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Silver.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Silver Ingot (Machine Silver)"

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
					visible_message("[user] carefully carves the ingot into a blessed Lasgun Cell! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Lasgun Cell)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
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


	if(isHolyoils(W)||isLube(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/cell/lasgun(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/silver(user.loc,1)
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

		var/craftingchoices = list("Skitarii Plating", "Hotshot Lascells", "Strange Alloy", ) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Skitarii Plating")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Skitarii Plating.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Cobolt Ingot (Skitarii Plating)"

			if("Hotshot Lascells")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Hotshot Lascells.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Cobolt Ingot (Hotshot Lascells)"

			if("Strange Alloy")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Strange Alloy.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Cobolt Ingot (Strange Alloy)"

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
					visible_message("[user] carefully carves the ingot into a blessed Skitarii Plating! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Skitarii Plating)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Hotshot Lascells! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Hotshot Lascells)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Hotshot Lascells! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Strange Alloy)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)


	if(isHolyoils(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/skitariiplating(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/cell/lasgun/hotshot(user.loc,1)
				new /obj/item/cell/lasgun/hotshot(user.loc,1)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/diamond(user.loc)
				qdel(src)
				return

/*

kultrinium

*/

/obj/item/ingots/kultriniumingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Plasma Flask", "Strange Alloy",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Plasma Flask")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Plasma Flask.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Plasma Flask)"

			if("Strange Alloy")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Strange Alloy.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Strange Alloy)"

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
					visible_message("[user] carefully carves the ingot into a blessed Plasma Flask! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Plasma Flask)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Strange Alloy! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Strange Alloy)"
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
				new /obj/item/cell/plasma(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/diamond(user.loc)
				qdel(src)
				return


/*

  Diamantine

*/

/obj/item/ingots/diamantineingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Bolter Rifle Mag", "Bolt Pistol Mags", "Heavy Stubber Ammo Box", "Galvanic Rifle Ammo", "Strange Alloy",) //going to add AP and manstopper later. probably all of them!


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Bolter Rifle Mag")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Bolter Rifle Mag.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Diamantine Ingot (Bolter Rifle Mag)"

			if("Bolt Pistol Mags")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Bolt Pistol Mags.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Diamantine Ingot (Bolt Pistol Mags)"

			if("Heavy Stubber Ammo Box")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Heavy Stubber Ammo Box.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Diamantine Ingot (Heavy Stubber Ammo Box)"

			if("Galvanic Rifle Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Galvanic Rifle Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Diamantine Ingot (Galvanic Rifle Ammo)"

			if("Strange Alloy")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Strange Alloy.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Diamantine Ingot (Strange Alloy)"

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
					visible_message("[user] carefully carves the ingot into a blessed Bolter Rifle Mag! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Bolter Rifle Mag)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Bolt Pistol Mags! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Bolt Pistol Mags)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Heavy Stubber Ammo Box! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Heavy Stubber Ammo Box)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Galvanic Rifle Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Galvanic Rifle Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Strange Alloy! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Strange Alloy)"
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
				new /obj/item/ammo_magazine/bolt_rifle_magazine(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/bolt_pistol_magazine(user.loc,1)
				new /obj/item/ammo_magazine/bolt_pistol_magazine(user.loc,1)
				qdel(src)
				return

			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/box/a556/mg08(user.loc,1)
				qdel(src)
				return

			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/galvanic(user.loc,1)
				new /obj/item/ammo_magazine/galvanic(user.loc,1)
				qdel(src)
				return

			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/diamond(user.loc,1)
				new /obj/item/stack/material/diamond(user.loc,1)
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

		var/craftingchoices = list("Strange Alloy",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Strange Alloy")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Strange Alloy.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Adamantium Ingot (Strange Alloy)"

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
					visible_message("[user] carefully carves the ingot into blessed Strange Alloy! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Strange Alloy)"
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
				new /obj/item/stack/material/diamond(user.loc)
				new /obj/item/stack/material/diamond(user.loc)
				new /obj/item/stack/material/diamond(user.loc)
				qdel(src)
				return


// OLD INGOT CRAFTING CODE. DO NOT DELETE THIS.
/*


/obj/item/ingots/copperingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W) || isChisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Inferior Lasgun Cell", "Boscelot Revolver", "Shells Boxes", ".357 Speedloaders", "9mm Pistol Mags", ".45 Pistol Magazines", "Bolt Pistol Magazine", "Trench Shovel", "Chisel", "Hammer", "Ingot Lube", "Kieji Handgun", "Snub Nose Kieji Handgun", "Sawn-Off Shotgun", "Combat Knife") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Inferior Lasgun Cell")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Inferior Lasgun Cell")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Inferior Lasgun Cell)"
			if("Boscelot Revolver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Boscolet Revolver")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Boscelot Revolver)"
			if("Shells Boxes")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Shells Boxes.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Copper Ingot (Shells Boxes)"
			if(".357 Speedloaders")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future .357 Speedloaders")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Copper Ingot (.357 Speedloaders)"
			if("9mm Pistol Mags")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future 9mm Pistol Mags.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Copper Ingot (9mm Pistol Mag)"
			if(".45 Pistol Magazines")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future .45 Pistol Magazines.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Copper Ingot (.45 Pistol Magazines)"
			if("Bolt Pistol Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Bolt Pistol Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Copper Ingot (Bolt Pistol Magazine)"

			if("Trench Shovel")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future trench shovel.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Trench Shovel)"
			if("Chisel")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Chisel")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 9
				src.ismarked = 1
				src.name = "Copper Ingot (Chisel)"
			if("Hammer")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Hammer")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 10
				src.ismarked = 1
				src.name = "Copper Ingot (Hammer)"
			if("Ingot Lube")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Ingot Lube")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 11
				src.ismarked = 1
				src.name = "Copper Ingot (Ingot Lube)"
			if("Kieji Handgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Kieji Handgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 12
				src.ismarked = 1
				src.name = "Copper Ingot (Kieji Handgun)"
			if("Snub Nose Kieji Handgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Snub Nose Kieji Handgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 13
				src.ismarked = 1
				src.name = "Copper Ingot (Snub Nose Kieji Handgun)"
			if("Sawn-Off Shotgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Sawn-Off Shotgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 14
				src.ismarked = 1
				src.name = "Copper Ingot (Sawn-Off Shotgun)"
			if("Combat Knife")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Combat Knife")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 15
				src.ismarked = 1
				src.name = "Copper Ingot (Combat Knife)"






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
					visible_message("[user] carefully carves the ingot into a blessed Inferior Lasgun Cell! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Inferior Lasgun Cell)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Boscelot Revolver! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Boscelot Revolver)"
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
					visible_message("[user] carefully carves the ingot into blessed .357 Speedloaders! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved .357 Speedloaders)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into  blessed 9mm Pistol Mags! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved 9mm Pistol Mags)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed .45 pistol magazines! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved .45 Pistol Magazines)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Bolt Pistol Magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Bolt Pistol Magazine)"
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
					visible_message("[user] carefully carves the ingot into a blessed Chisel! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Chisel)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(10)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed  Hammer! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Hammer)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(11)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Ingot Lube! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Ingot Lube)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(12)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Kieji Handgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Kieji Handgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(13)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Snub Nose Kieji Handgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Snub Nose Kieji Handgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(14)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Sawn-Off Shotgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Sawn-Off Shotgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(15)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Combat Knife! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Carved Combat Knife)"
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
				new /obj/item/cell/lasgun/small(user.loc)
				new /obj/item/cell/lasgun/small(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/revolver/detective/boscelot(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_box/shotgun(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/a357(user.loc)
				new /obj/item/ammo_magazine/a357(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/mc9mm(user.loc)
				new /obj/item/ammo_magazine/mc9mm(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/mc45mm(user.loc)
				new /obj/item/ammo_magazine/mc45mm(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/bolt_pistol_magazine(user.loc)
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
				new /obj/item/device/chisel(user.loc)
				qdel(src)
				return
			if(10)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/device/hammer(user.loc)
				qdel(src)
				return
			if(11)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/device/lube(user.loc)
				qdel(src)
				return
			if(12)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/pistol/kieji(user.loc)
				qdel(src)
				return
			if(13)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/pistol/kieji/snub(user.loc)
				qdel(src)
				return
			if(14)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/doublebarrel(user.loc)
				qdel(src)
				return
			if(15)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/melee/sword/combat_knife(user.loc)
				new /obj/item/melee/sword/combat_knife(user.loc)
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

		var/craftingchoices = list("Messina Pattern 'Pewter' stub pistol", "Portsmith W. Lasrifle", "Portsmith W. Laspistol", "Boscelot Pattern Stub Rifle", "SMG magazine (9mm)", "Speed Loaders (.44)", "Loose Rifle Ammo (7.62)", ) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Messina Pattern 'Pewter' stub pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Messina Pattern 'Pewter' stub pistol")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Iron Ingot (Messina Pattern 'Pewter' stub pistol)"
			if("Portsmith W. Lasrifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Portsmith W. Lasrifle")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Iron Ingot (Portsmith W. Lasrifle)"
			if("Portsmith W. Laspistols")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Portsmith W. Laspistols")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Iron Ingot (Portsmith W. Laspistols)"
			if("Boscelot Pattern Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Boscelot Pattern Stub Rifle")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Iron Ingot (Boscolet Pattern Stub Rifle)"
			if("SMG magazine (9mm)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future SMG magazine (9mm)")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Iron Ingot (SMG magazine (9mm))"
			if("Speed Loaders (.44)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Speed Loaders (.44)")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Iron Ingot (Speed Loaders (.44))"
			if("Loose Rifle Ammo (7.62)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Loose Rifle Ammo (7.62).")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Iron Ingot (Loose Rifle Ammo (7.62))"



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
					visible_message("[user] carefully carves the ingot into a blessed Messina Pattern 'Pewter' stub pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Messina Pattern 'Pewter' stub pistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Portsmith W. Lasrifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Portsmith W. Lasrifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Portsmith W. Laspistols! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Portsmith W. Laspistols)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Boscelot Pattern Stub Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Boscelot Pattern Stub Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed SMG magazine (9mm)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved SMG magazine (9mm))"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Speed Loaders (.44)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Speed Loaders (.44))"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Loose Rifle Ammo (7.62)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Loose Rifle Ammo (7.62))"
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
				new /obj/item/gun/projectile/pistol/pewter(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun/shitty(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/laspistol/shitty(user.loc)
				new /obj/item/gun/energy/las/laspistol/shitty(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/smgmc9mm(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/c44(user.loc)
				new /obj/item/ammo_magazine/c44(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/handful/brifle_handful(user.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful(user.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful(user.loc)
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

		var/craftingchoices = list("Lasgun Cells","Villiers Pistol", "Civitas Pattern Laspistol","Voxlegis", "Messina Pattern Stub Revolver", ".338 Lapua Magnum Magazine", "Machine Silver", "Cane Sword") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Lasgun Cells")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Lasgun Cells.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Silver Ingot (Lasgun Cells)"

			if("Villiers Pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Villiers Pistol.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Silver Ingot (Villiers Pistol)"

			if("Civitas Pattern Laspistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Civitas Pattern Laspistol")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Silver Ingot (Civitas Pattern Laspistol)"

			if("Voxlegis")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Voxlegis.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Silver Ingot (Voxlegis)"

			if("Messina Pattern Stub Revolver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Messina Pattern Stub Revolver")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Silver Ingot (Messina Pattern Stub Revolver)"

			if(".338 Lapua Magnum Magazine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future .338 Lapua Magnum Magazine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Silver Ingot (.338 Lapua Magnum Magazine)"


			if("Machine Silver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Silver.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Silver Ingot (Machine Silver)"

			if("Cane Sword")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Cane Sword.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 8
				src.ismarked = 1
				src.name = "Silver Ingot (Cane Sword)"

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
					src.name = "Silver Ingot (Carved Lasgun cells)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Villiers Pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Villiers Pistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Civitas Pattern Laspistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Civitas Pattern Laspistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Voxlegis! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Voxlegis)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a Messina Pattern Stub Revolver! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Messina Pattern Stub Revolver)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed .338 Lapua Magnum Magazine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved .338 Lapua Magnum Magazine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(7)
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
					
			if(8)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Cane Sword! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Silver Ingot (Carved Cane Sword)"
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
				new /obj/item/cell/lasgun(user.loc)
				new /obj/item/cell/lasgun(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/pistol/villiers(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/laspistol(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/voxlegis(user.loc,1)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/revolver/messina(user.loc,1)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/lp338(user.loc,1)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/stack/material/silver(user.loc,1)
				qdel(src)
				return
			if(8)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/melee/sword/cane(user.loc,1)
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

		var/craftingchoices = list("Skitarii Plating", "Hotshot Lascells", "Agripinaa Pattern Stub rifle MK II", "Necros Revolver", "Landmine", "Mercy Chainsword", ) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Skitarii Plating")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Skitarii Plating.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Cobolt Ingot (Skitarii Plating)"

			if("Hotshot Lascells")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Hotshot Lascells.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Cobolt Ingot (Hotshot Lascells)"

			if("Agripinaa Pattern Stub rifle MK II")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Agripinaa Pattern Stub rifle MK II.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Cobolt Ingot (Agripinaa Pattern Stub rifle MK II)"
				
			if("Necros Revolver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Necros Revolver.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Cobolt Ingot (Necros Revolver)"

			if("Landmine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Landmine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Cobolt Ingot (Landmine)"

			if("Mercy Chainsword")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mercy Chainsword")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Cobolt Ingot (Mercy Chainsword)"


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
					visible_message("[user] carefully carves the ingot into a blessed Skitarii Plating! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Skitarii Plating)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Hotshot Lascells! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Hotshot Lascells)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Agripinaa Pattern Stub rifle MK II! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Agripinaa Pattern Stub rifle MK II)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Necros Revolver! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Necros Revolver)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed landmine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Landmine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Mercy Chainsword! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Cobolt Ingot (Carved Mercy chainsword)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)


	if(isHolyoils(W))
		if(rubtheoils == 0)
			visible_message("Use your laser cutter first!")
			return

		switch(whatwemaking)

			if(1)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/skitariiplating(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/cell/lasgun/hotshot(user.loc,1)
				new /obj/item/cell/lasgun/hotshot(user.loc,1)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/agripinaaii(user.loc,1)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/necros(user.loc,1)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/landmine(user.loc,1)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/melee/chain/mercycs(user.loc,1)
				qdel(src)
				return

/*

kultrinium

*/

/obj/item/ingots/kultriniumingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Plasma Flask", "Kantrael M36 Lasgun", "Lucius No.98 Lasgun", "Catachan Mark IV Lascarbine", "Messina Pattern Autogun","Vraks Pattern Heavy Stubber","Drusian Pattern Chainsword",) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Plasma Flask")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Plasma Flask.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Plasma Flask)"

			if("Kantrael M36 Lasgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Kantrael M36 Lasgun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Kantrael M36 Lasgun)"

			if("Lucius No.98 Lasgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Lucius No.98 Lasgun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Lucius No.98 Lasgun)"

			if("Catachan Mark IV Lascarbine")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Catachan Mark IV Lascarbine.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Catachan Mark IV Lascarbine)"

			if("Messina Pattern Autogun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Messina Pattern Autogun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Messina Pattern Autogun)"

			if("Vraks Pattern Heavy Stubber")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Vraks Pattern Heavy Stubber.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Vraks Pattern Heavy Stubber)"

			if("Drusian Pattern Chainsword")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Drusian Chainsword.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Kultrinium Ingot (Drusian Pattern Chainsword)"

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
					visible_message("[user] carefully carves the ingot into a blessed Plasma Flask! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Plasma Flask)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Kantrael M36 Lasgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Kantrael M36 Lasgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Lucius No.98 Lasgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Lucius No.98 Lasgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Catachan Mark IV Lascarbine! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Catachan Mark IV Lascarbine)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Messina Pattern Autogun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Messina Pattern Autogun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Vraks Pattern Heavy Stubber! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Vraks Pattern Heavy Stubber)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Drusian Chainsword! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Kultrinium Ingot (Carved Drusian Pattern Chainsword)"
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
				new /obj/item/cell/plasma(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun(user.loc,1)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun/lucius(user.loc,1)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/lasgun/catachan(user.loc,1)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/messina(user.loc,1)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/heavystubber(user.loc,1)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/melee/chain/inqcs(user.loc,1)
				qdel(src)
				return

/*

  Diamantine

*/

/obj/item/ingots/diamantineingot/attackby(obj/item/device/W as obj, mob/user as mob)
	if(isAutochisel(W))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		var/craftingchoices = list("Bolter Rifle Mag", "Bolt Pistol Mags", "Heavy Stubber Ammo Box", "Galvanic Rifle Ammo",) //going to add AP and manstopper later. probably all of them!


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Bolter Rifle Mag")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Bolter Rifle Mag.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Diamantine Ingot (Bolter Rifle Mag)"

			if("Bolt Pistol Mags")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Bolt Pistol Mags.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Diamantine Ingot (Bolt Pistol Mags)"

			if("Heavy Stubber Ammo Box")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Heavy Stubber Ammo Box.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Diamantine Ingot (Heavy Stubber Ammo Box)"

			if("Galvanic Rifle Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Galvanic Rifle Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Diamantine Ingot (Galvanic Rifle Ammo)"

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
					visible_message("[user] carefully carves the ingot into a blessed Bolter Rifle Mag! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Bolter Rifle Mag)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Bolt Pistol Mags! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Bolt Pistol Mags)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Heavy Stubber Ammo Box! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Heavy Stubber Ammo Box)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)

			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Galvanic Rifle Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Diamantine Ingot (Carved Galvanic Rifle Ammo)"
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
				new /obj/item/ammo_magazine/bolt_rifle_magazine(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/bolt_pistol_magazine(user.loc,1)
				new /obj/item/ammo_magazine/bolt_pistol_magazine(user.loc,1)
				qdel(src)
				return

			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/box/a556/mg08(user.loc,1)
				qdel(src)
				return

			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/galvanic(user.loc,1)
				new /obj/item/ammo_magazine/galvanic(user.loc,1)
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

		var/craftingchoices = list("Cognis Pattern Heavy Stubber", "Galvanic Rifle", "Plasma Pistol", "Ryza Pattern Hot-Shot Lasgun", "Plasma Flasks", "Mark IV .338 Stub Rifle", "Bolt Pistol", "Incendiary Galvanic Rifle Ammo", "Radium Carbine Ammo", "Radium Pistol Ammo", "Galvanic Rifle EMP Ammo", "Galvanic Rifle Airburst Ammo", "Galvanic Rifle Stun Ammo") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Cognis Pattern Heavy Stubber")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Cognis Pattern Heavy Stubber.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Adamantium Ingot (Cognis Pattern Heavy Stubber)"
			if("Galvanic Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Galvanic Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Adamantium Ingot (Galvanic Rifle)"
			if("Plasma Pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Plasma Pistol.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Adamantium Ingot (Plasma Pistol)"
			if("Ryza Pattern Hot-Shot Lasgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Ryza Pattern Hot-Shot Lasgun.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Adamantium Ingot (Ryza Pattern Hot-Shot Lasgun)"
			if("Plasma Flasks")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Plasma Flasks.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Adamantium Ingot (Plasma Flasks)"

			if("Mark IV .338 Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mark IV .338 Stub Rifle.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Adamantium Ingot (Mark IV .338 Stub Rifle)"

			if("Bolt Pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Bolt Pistol")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 7
				src.ismarked = 1
				src.name = "Adamantium Ingot (Bolt Pistol)"

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

			if("Galvanic Rifle EMP Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Galvanic Rifle EMP Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 11
				src.ismarked = 1
				src.name = "Adamantium Ingot (Galvanic Rifle EMP Ammo)"

			if("Galvanic Rifle Airburst Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Galvanic Rifle Airburst Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 12
				src.ismarked = 1
				src.name = "Adamantium Ingot (Galvanic Rifle Airburst Ammo)"

			if("Galvanic Rifle Stun Ammo")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Galvanic Rifle Stun Ammo.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 13
				src.ismarked = 1
				src.name = "Adamantium Ingot (Galvanic Rifle Stun Ammo)"

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
					visible_message("[user] carefully carves the ingot into a blessed Cognis Pattern Heavy Stubber! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Cognis Pattern Heavy Stubber)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(2)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Galvanic Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Galvanic Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Plasma Pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Plasma Pistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Ryza Pattern Hot-Shot Lasgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Ryza Pattern Hot-Shot Lasgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Plasma Flasks! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Carved Plasma Flasks)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(6)
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
			if(7)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed a Bolt Pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Bolt Pistol)"
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
			if(11)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Galvanic Rifle EMP Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Galvanic Rifle EMP Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(12)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Galvanic Rifle Airburst Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Galvanic Rifle Airburst Ammo)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts way at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(13)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Galvanic Rifle Stun Ammo! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Adamantium Ingot (Galvanic Rifle Stun Ammo)"
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
				new /obj/item/gun/projectile/automatic/heavystubber/cognis(user.loc)
				qdel(src)
				return
			if(2)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/automatic/galvanic/rifle(user.loc)
				qdel(src)
				return
			if(3)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/pulse/plasma/pistol(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/energy/las/hotshot(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/cell/plasma(user.loc)
				new /obj/item/cell/plasma(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/bolter_pistol(user.loc)
				qdel(src)
				return
			if(8)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
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
				qdel(src)
				return
			if(11)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/galvanic/emp(user.loc)
				new /obj/item/ammo_magazine/galvanic/emp(user.loc)
				new /obj/item/ammo_magazine/galvanic/emp(user.loc)
				qdel(src)
				return
			if(13)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/galvanic/pain(user.loc)
				new /obj/item/ammo_magazine/galvanic/pain(user.loc)
				new /obj/item/ammo_magazine/galvanic/pain(user.loc)
				qdel(src)
				return
				
*/
