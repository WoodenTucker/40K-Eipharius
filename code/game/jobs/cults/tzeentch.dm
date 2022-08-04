/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Tzeentch//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/tzeentch()
	set category = "Ruinous Powers"
	set name = "The Path of Tzeentch"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Tzeentch while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(src, "You are already sworn to Khorne!")	//src has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//src has already selected another path!
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//src has already selected another path!
		return
	switch(src.intrigue)
		if(0)
			var/obj/structure/toilet/T = locate() in src.loc
			if(T)
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>First done</font>")
			else
				to_chat(src, "A wily voice pervades your mind. <font color='#0400ff'>Solve few of my riddles to start down the path of the deceiver. Sit upon the throne of both kings and beggars.</font>")
				adjustBrainLoss(3)
		if(1)
			STAT_LEVEL(int) +=1
			src.intrigue++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/slaanesh)
			to_chat(src, "<font color='#0400ff'>One down, eight to go!</font>")
			src.mind.special_role = "Tzeentch Cultist"
			AddInfectionImages()
			src.faction = "Tzeentch"
		if(2)
			src.verbs += /mob/living/carbon/human/proc/tzeentchrune
			to_chat(src, "<font color='#0400ff'>To hear my next riddle memorize this symbol, draw it and stand upon it!</font>")
			src.intrigue++
			GLOB.tzeentch_cult++
		if(3)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Good, now listen your next riddle.</font>")
				STAT_LEVEL(end) +=1
			else
				to_chat(src, "I haven't drawn his symbol or I'm not standing directly on it!")
		if(4)
			var/obj/structure/closet/pit/G = locate() in src.loc
			if(G)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>One more done.</font>")
			else
				to_chat(src, "<font color='#0400ff'>You'll find me in a place of stone, Where silence cloaks the ground, Search through all the empty names, And finally I'll be found.</font>")
				adjustBrainLoss(3)
		if(5)
			var/obj/structure/bed/G = locate() in src.loc
			if(G)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>One more done.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Place to release your thoughts, your pain for time or eternity.</font>")
				adjustBrainLoss(3)
		if(6)
			var/obj/structure/flora/tree/pine/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Creature in white, ready to listen, but will not answer. </font>")
				adjustBrainLoss(3)
		if(7)
			var/obj/machinery/light/stolb/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Warden, which soul burns with light. </font>")
				adjustBrainLoss(3)
		if(8)
			if(istype(src.l_hand, /obj/item/paper))
				qdel(src.l_hand)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else if(istype(src.r_hand, /obj/item/paper))
				qdel(src.r_hand)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>It can show you images it never saw, tell you stories it never heard. </font>")
				adjustBrainLoss(3)
		if(9)
			if(istype(src.l_hand, /obj/item/pickaxe))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else if(istype(src.r_hand, /obj/item/pickaxe))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Attribute of dark slavery</font>")
				adjustBrainLoss(3)
		if(10)
			var/obj/structure/curtain/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>Thin body that will save all your secrets behind itself. </font>")
				adjustBrainLoss(3)
		if(11)
			if(istype(src.l_hand, /obj/item/reagent_containers/food/drinks/canteen))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else if(istype(src.r_hand, /obj/item/reagent_containers/food/drinks/canteen))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>The main way to keep your cup full</font>")
				adjustBrainLoss(3)
		if(12)
			if(istype(src.l_hand, /obj/item/book/manual))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
				STAT_LEVEL(str) -=1
			else if(istype(src.r_hand, /obj/item/book/manual))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>Beautiful cover, blank soul. </font>")
				adjustBrainLoss(3)
		if(13)
			var/turf/simulated/floor/trench/T = locate() in src.loc
			if(T)
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				if(do_after(src,10))
					playsound(src, 'sound/effects/explosionfar.ogg', 80, 0, -1)
					if(do_after(src,10))
						playsound(src, 'sound/effects/Explosion2.ogg', 80, 0, -1)
						if(do_after(src,5))
							playsound(src, 'sound/voice/agony_male4.ogg', 80, 0, -1)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Good.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Nest of caution of death.</font>")
				adjustBrainLoss(3)
		if(14)
			if(istype(src.l_hand, /obj/item/torch))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/torch))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Wandering bright steel waiting for it's turn to be awaken</font>")
				adjustBrainLoss(3)
		if(15)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/book/manual))
					qdel(src.l_hand)
					src.intrigue++
					playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
					to_chat(src, "<font color='#0400ff'>Ambitious person needs ambitious powers.</font>")
					src.add_spell(new /spell/messa_shroud)
				else if(istype(src.r_hand, /obj/item/book/manual))
					qdel(src.r_hand)
					src.intrigue++
					playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
					to_chat(src, "<font color='#0400ff'>Ambitious person needs ambitious powers.</font>")
					src.add_spell(new /spell/messa_shroud)
			else
				to_chat(src, "<font color='#0400ff'>Bring that book at my rune and let me show you one of my secrets. </font>")
				adjustBrainLoss(3)
		if(16)
			src.STAT_LEVEL(int) +=1
			if(src.SKILL_LEVEL(melee)<6)
				src.SKILL_LEVEL(melee)=6
			else
				src.SKILL_LEVEL(melee)+=1

			if(src.SKILL_LEVEL(ranged)<6)
				src.SKILL_LEVEL(ranged)=6
			else
				src.SKILL_LEVEL(ranged)+=1

			if(src.SKILL_LEVEL(medical)<5)
				src.SKILL_LEVEL(medical)=5
			else
				src.SKILL_LEVEL(medical)+=2

			if(src.SKILL_LEVEL(surgery)<5)
				src.SKILL_LEVEL(surgery)=5
			else
				src.SKILL_LEVEL(surgery)+=2

			if(src.SKILL_LEVEL(engineering)<5)
				src.SKILL_LEVEL(engineering)=5
			else
				src.SKILL_LEVEL(engineering)+=2

			if(src.STAT_LEVEL(end)<10)
				src.STAT_LEVEL(end)=12
			else
				src.STAT_LEVEL(end) -=2

			if(src.STAT_LEVEL(str)<10)
				src.STAT_LEVEL(str)=10
			else
				src.STAT_LEVEL(str) -=2

			if(src.STAT_LEVEL(dex)<12)
				src.STAT_LEVEL(dex)=12
			else
				src.STAT_LEVEL(dex) -=1

			adjustBrainLoss(20)
			src.intrigue++
			to_chat(src, "<font color='#0400ff'>Your initiation is complete. Better skills, better stats, use wisely</font>")
		if(17)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Take my grant.</font>")
				switch(rand(1,2))
					if(1)
						new /obj/item/clothing/mask/gas/nam(src.loc)
					if(2)
						new /obj/item/clothing/head/spookyhood(src.loc)
			else
				to_chat(src, "<font color='#0400ff'>Let me grant you thing to hide your face from unwilling eyes. Stand upon my rune</font>")

		if(18)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Take my grant, use wisely.</font>")
				new /obj/item/reagent_containers/pill/cyanide(src.loc)
			else
				to_chat(src, "<font color='#0400ff'>Let me grant you thing to kill silently or to die with no word in defeat. Stand upon my rune</font>")

		if(19)
			to_chat(src, "<font color='#0400ff'>To be continued...</font>")
