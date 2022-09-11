
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

		var/craftingchoices = list("Inferior Lasgun Cell", "Boscelot Revolver", "Shells Boxes", ".38 Speedloaders", "9mm Pistol Mags", ".45 Pistol Magazines", "Bolt Pistol Magazine", "Trench Shovel", "Chisel", "Hammer", "Ingot Lube", "Kieji Handgun", "Snub Nose Kieji Handgun", "Musket", "Sawn-Off Shotgun", "Combat Knife") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Inferior Lasgun Cell")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Inferior Lasgun Cell")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Copper Ingot (Marked Inferior Lasgun Cell)"
			if("Boscelot Revolver")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Boscelot Revolver")
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
			if(".38 Speedloaders")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future .38 Speedloaders")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Copper Ingot (.38 Speedloaders)"
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
			if("Musket")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Musket")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 14
				src.ismarked = 1
				src.name = "Copper Ingot (Musket)"
			if("Sawn-Off Shotgun")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Sawn-Off Shotgun")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 15
				src.ismarked = 1
				src.name = "Copper Ingot (Sawn-Off Shotgun)"
			if("Combat Knife")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Combat Knife")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 16
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
					visible_message("[user] carefully carves the ingot into blessed .38 Speedloaders! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (.38 Speedloaders)"
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
					src.name = "Copper Ingot (9mm Pistol Mags)"
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
					src.name = "Copper Ingot (.45 Pistol Magazines)"
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
					src.name = "Copper Ingot (Bolt Pistol Magazine)"
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
					src.name = "Copper Ingot (Chisel)"
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
					src.name = "Copper Ingot (Hammer)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(11)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Ingot Lube! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Ingot Lube)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(12)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Kieji Handgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Kieji Handgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(13)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Snub Nose Kieji Handgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Snub Nose Kieji Handgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(14)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Musket! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Musket)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(15)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Sawn-Off Shotgun! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Sawn-Off Shotgun)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(16)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Combat Knife! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Copper Ingot (Combat Knife)"
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
				new /obj/item/ammo_magazine/box/shotgun(user.loc)
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/c38(user.loc)
				new /obj/item/ammo_magazine/c38(user.loc)
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
				new /obj/item/ammo_magazine/c45m/warfare(user.loc)
				new /obj/item/ammo_magazine/c45m/warfare(user.loc)
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
				new /obj/item/gun/projectile/warfare/kieji(user.loc)
				qdel(src)
				return
			if(13)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/warfare/kieji2(user.loc)
				qdel(src)
				return
			if(14)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/thrower(user.loc)
				qdel(src)
				return
			if(15)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/doublebarrel/sawn(user.loc)
				qdel(src)
				return
			if(16)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/material/sword/combat_knife(user.loc)
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

		var/craftingchoices = list("Genmessor Stub-pistol", "Portsmith W. Lasrifle", "Portsmith W. Laspistol", "Boscolet Pattern Stub Rifle", "Auto Grim Mag", "Speed Loaders (.357)", "Loose Rifle Ammo (7.62)", ) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Genmessor Stub-pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Mark I Stormrider.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Iron Ingot (Villiers Pistol)"
			if("Portsmith W. Lasrifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Portsmith W. Lasrifle")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Iron Ingot (Portsmith W. Lasrifle)"
			if("Portsmith W. Laspistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Portsmith W. Laspistol")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 3
				src.ismarked = 1
				src.name = "Iron Ingot (Portsmith W. Laspistol)"
			if("Boscolet Pattern Stub Rifle")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Boscolet Pattern Stub Rifle")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 4
				src.ismarked = 1
				src.name = "Iron Ingot (Boscolet Pattern Stub Rifle)"
			if("Auto Grim Mag")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Auto Grim Mag")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 5
				src.ismarked = 1
				src.name = "Iron Ingot (Auto Grim Mag)"
			if("Speed Loaders (.357)")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as future Speed Loaders (.357)")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 6
				src.ismarked = 1
				src.name = "Iron Ingot (Speed Loaders (.357))"
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
					visible_message("[user] carefully carves the ingot into a blessed Genmessor Stub-pistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Carved Genmessor Stub-pistol)"
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
					src.name = "Iron Ingot (Portsmith W. Lasrifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(3)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Portsmith W. Laspistol! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Portsmith W. Laspistol)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(4)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Boscolet Pattern Stub Rifle! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Boscolet Pattern Stub Rifle)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
			if(5)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into a blessed Auto Grim Mag! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Auto Grim Mag)"
					playsound(src, 'sound/effects/lasercutter.ogg', 100, 1, 1)
				else
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] cuts away at the ingot, it will take a few more passes until we're done!")
			if(6)
				if(prob(25))
					user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
					visible_message("[user] carefully carves the ingot into blessed Speed Loaders (.357)! Now take the ingot and dip it into the holy oil!")
					src.rubtheoils = 1
					src.name = "Iron Ingot (Speed Loaders (.357))"
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
					src.name = "Iron Ingot (Loose Rifle Ammo (7.62))"
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
				new /obj/item/gun/projectile/genmessorp(user.loc)
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
				qdel(src)
				return
			if(4)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty(user.loc)
				qdel(src)
				return
			if(5)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/autogrim(user.loc)
				qdel(src)
				return
			if(6)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
				new /obj/item/ammo_magazine/a357(user.loc)
				new /obj/item/ammo_magazine/a357(user.loc)
				qdel(src)
				return
			if(7)
				playsound(src, 'sound/voice/blessing.ogg', 100, 0, 1)
				visible_message("As the carvings are lathered with the holy oil they begin to take their intended shape!")
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

		var/craftingchoices = list("Lasgun Cell","Villiers Pistol", "Catachan Mark IV Lascarbine","Lucius No.98 Lasgun", "Kantrael MG Laspistol", ".338 Lapua Magnum Magazine", "Machine Silver", "Galvanic Rifle") //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Lasgun Cell")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Lasgun Cell.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Silver Ingot (Lasgun Cell)"

			if("Villiers Pistol")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Villiers Pistol.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Silver Ingot (Villiers Pistol)"

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
				new /obj/item/gun/projectile/warfare(user.loc)
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

		var/craftingchoices = list("Skitarii Plating", /*"Machine Gold",*/) //lists all possible crafting choices


		var/craftchoice = input("Choose what to craft", "Available crafts") as null|anything in craftingchoices

		switch(craftchoice)
			if("Skitarii Plating")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future Skitarii Plating.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 1
				src.ismarked = 1
				src.name = "Cobolt Ingot (Skitarii Plating)"

			if("TODO")
				visible_message("[user]'s auto-chisel moves in a blur over [src], morphing the shape and marking it as a future unit of Gold.")
				playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
				src.whatwemaking = 2
				src.ismarked = 1
				src.name = "Cobolt Ingot (Machine Gold)"

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
				new /obj/item/skitariiplating(user.loc)
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
