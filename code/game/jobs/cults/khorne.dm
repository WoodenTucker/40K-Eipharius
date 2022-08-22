/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Khorne////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/obj/item/skull
	name = "skull"
	desc = "Once it belonged to a living being, now it will make a good decoration"
	icon = 'icons/obj/items/skull.dmi'
	icon_state = "skull"

/mob/living/carbon/human/proc/khorne()
	set category = "Ruinous Powers"
	set name = "The Path of Khorne"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Khorne while restrained!")	//user is tied up
		return
	if(mind.special_role != "Khorne Cultist" && cult_favor != 0)
		return
	switch(cult_favor)
		if(0)
			if(istype(src.l_hand, /obj/item/skull))
				qdel(usr.l_hand)
				to_chat(src, "You bring your first skull to the Throne <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/quotes/cults/khorne/khorne.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				cult_favor++
				mind.special_role = "Khorne Cultist"
			else if(istype(src.r_hand, /obj/item/skull))
				qdel(usr.r_hand)
				to_chat(src, "You bring your first skull to the throne. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/quotes/cults/khorne/khorne.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				cult_favor++
				mind.special_role = "Khorne Cultist"
			else
				to_chat(src, "Bring me your first heart of your enemy, mortal, and prove your worship to strength and honor of battle.")
				return
		if(1)
			to_chat(src, "Strength and fury fills your muscles. A feeling begins to grow in your gut, you must fight, you must kill, you must be victorious.")
			cult_favor++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			src.faction = "Khorne"
			src.verbs += list(
			/mob/living/carbon/human/proc/bludforbludguy,
			/mob/living/carbon/human/proc/letriverflow,
			/mob/living/carbon/human/proc/moving,
			/mob/living/carbon/human/proc/overthere,
			/mob/living/carbon/human/proc/praynslay,
			/mob/living/carbon/human/proc/chaaaaaarge,
			/mob/living/carbon/human/proc/chopdem,
			/mob/living/carbon/human/proc/bringdeath,
			/mob/living/carbon/human/proc/advance,
			/mob/living/carbon/human/proc/aaaaaa)
			AddInfectionImages()
		if(2)
			var/active_hand = get_active_hand()
			if(istype(active_hand, /obj/item/skull))
				to_chat(src, "You bring your first skull to the Blood God. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/quotes/cults/khorne/khorne.ogg', 50, 0, -1)
				drop_from_inventory(active_hand)
				qdel(active_hand)
				cult_favor++
				if(src.STAT_LEVEL(str)>12)
					src.STAT_LEVEL(str)+=3
				else if(src.STAT_LEVEL(str)<10)
					src.STAT_LEVEL(str)+=3
				if(src.SKILL_LEVEL(melee)>4)
					src.SKILL_LEVEL(melee)+=2
				else if (src.SKILL_LEVEL(melee)<4)
					src.SKILL_LEVEL(melee)=5
				mind.special_role = "Khorne Cultist"
			else
				to_chat(src, "<font color='#720202'>Bring me skull of your enemy, mortal, and prove your worship to strength and honor of battle once again</font>.")
				return
		if(3)
			src.verbs += /mob/living/carbon/human/proc/khornerune
			to_chat(src, "<font color='#720202'>Hatred, rage and fury like you've never known consume your mind and block out your every thought. Flashes of a symbol appear in your mind. You feel compelled to draw it</font>.")
			cult_favor++
			GLOB.khorne_cult++
		if(4)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(T)
				cult_favor++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "This... is it. That symbol. Just the sight of it quickens your heart and pumps adrenaline through your veins. <font color='#720202'>You can hear his voice more clearly now.</font>")
			else
				to_chat(src, "I must draw his symbol and stand upon it!")
				return
		if(5)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(istype(src.l_hand, /obj/item/skull))
				qdel(src.l_hand)
				to_chat(src, "<font color='#720202'>You bring one more skull to the throne.</font>")
				playsound(src, 'sound/effects/quotes/cults/khorne/khorne.ogg', 50, 0, -1)
				if(STAT_LEVEL(end)<21)
					STAT_LEVEL(end) +=1
				if(STAT_LEVEL(end)==21)
					to_chat(src, "<font color='#720202'>That was your last endurance improvement.</font>")
				if(STAT_LEVEL(end)>20)
					to_chat(src, "<font color='#720202'>You cannot improve your endurance more with skulls.</font>")
				src.update_inv_l_hand()
				if(src.SKILL_LEVEL(melee)<7)
					src.SKILL_LEVEL(melee)+=2
				if(STAT_LEVEL(int)>8)
					STAT_LEVEL(int)-=2
			else if(istype(src.r_hand, /obj/item/skull))
				qdel(src.r_hand)
				to_chat(src, "<font color='#720202'>You bring one more skull to the throne.</font>")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				if(STAT_LEVEL(end)<20)
					STAT_LEVEL(end) +=2
				if(STAT_LEVEL(end)==21)
					to_chat(src, "<font color='#720202'>That was your last endurance improvement.</font>")
				if(STAT_LEVEL(end)>20)
					to_chat(src, "<font color='#720202'>You cannot improve your endurance more with skull.</font>")
				src.update_inv_r_hand()
				if(src.SKILL_LEVEL(melee)<7)
					src.SKILL_LEVEL(melee)+=2
				if(STAT_LEVEL(int)>8)
					STAT_LEVEL(int)-=2
			else if(istype(src.l_hand, /obj/item/skull))
				if(STAT_LEVEL(str)<18)
					qdel(usr.l_hand)
					to_chat(src, "<font color='#720202'>You bring more skulls for the Skull Throne.</font>")
					playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
					src.update_inv_l_hand()
					STAT_LEVEL(str) +=2
				if(STAT_LEVEL(str)==21)
					to_chat(src, "<font color='#720202'>That was your last strength improvement.</font>")
				if(STAT_LEVEL(str)>20)
					to_chat(src, "<font color='#720202'>You're too strong to gain power with mortal's skulls.</font>")
				if(src.SKILL_LEVEL(ranged)<8)
					src.SKILL_LEVEL(ranged)+=1
				if(STAT_LEVEL(dex)<19)
					STAT_LEVEL(dex)+=2
			else if(istype(src.r_hand, /obj/item/skull))
				if(STAT_LEVEL(str)<21)
					qdel(usr.r_hand)
					to_chat(src, "<font color='#720202'>You bring more skulls for the Skull Throne.</font>")
					playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
					src.update_inv_r_hand()
					STAT_LEVEL(str) +=2
				if(STAT_LEVEL(str)==21)
					to_chat(src, "<font color='#720202'>That was your last strength improvement.</font>")
				if(STAT_LEVEL(str)>20)
					to_chat(src, "<font color='#720202'>You're too strong to gain power with mortal's skulls.</font>")
				if(src.SKILL_LEVEL(ranged)<8)
					src.SKILL_LEVEL(ranged)+=2
				if(STAT_LEVEL(dex)<19)
					STAT_LEVEL(dex)+=2
			else if(istype(src.l_hand, /obj/item/stack/teeth) && istype(src.r_hand, /obj/item/material/sword/combat_knife) && T)
				qdel(src.r_hand)
				src.update_inv_r_hand()
				qdel(src.l_hand)
				src.update_inv_l_hand()
				switch(rand(1,10))
					if(1)
						new /obj/item/melee/chain/pcsword/eviscerator(src.loc)
					if(2)
						new /obj/item/material/sword/cane(src.loc)
					if(3)
						new /obj/item/material/sword/combat_knife/catachan(src.loc)
					if(4)
						new /obj/item/melee/chain/inqcs(src.loc)
					if(5)
						new /obj/item/material/sword/choppa(src.loc)
					if(6)
						new /obj/item/melee/baton/loaded(src.loc)
					if(7)
						new /obj/item/melee/chain/mercycs(src.loc)
					if(8)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(9)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(10)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
				to_chat(src, "<font color='#720202'>Take your weapon, warrior.</font>")
			else if(istype(src.r_hand, /obj/item/stack/teeth) && istype(src.l_hand, /obj/item/material/sword/combat_knife) && T)
				qdel(src.r_hand)
				src.update_inv_r_hand()
				qdel(src.l_hand)
				src.update_inv_l_hand()
				switch(rand(1,8))
					if(1)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(2)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(3)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(4)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(5)
						new /obj/item/melee/chain/mercycs(src.loc)
					if(6)
						new /obj/item/melee/chain/pcsword/khorneaxe(src.loc)
					if(7)
						new /obj/item/melee/chain/inqcs(src.loc)
					if(8)
						new /obj/item/melee/chain/pcsword/eviscerator(src.loc)
				to_chat(src, "<font color='#720202'>Take your weapon, warrior.</font>")
			else
				to_chat(src, "Bring me next a skull for health or a skull for strength, if you still need it mortal. Otherwise. Bring me a tooth from a slain, in right hand. Steel combat knife in the left and stand upon my rune to gain a weapon fit for your might")
				return
