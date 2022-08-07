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
		if(1)
			STAT_LEVEL(int) +=1
			src.intrigue++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/slaanesh)
			to_chat(src, "<font color='#0400ff'>One down, eight to go!</font>")
			src.mind.special_role = "Tzeentch Cultist"
			src.verbs += list(
			/mob/living/carbon/human/proc/wehere,
			/mob/living/carbon/human/proc/forthechanger,
			/mob/living/carbon/human/proc/beconsumed,
			/mob/living/carbon/human/proc/weshallsacrifise,
			/mob/living/carbon/human/proc/theyseetruth,
			/mob/living/carbon/human/proc/peerminds,
			/mob/living/carbon/human/proc/charge,
			/mob/living/carbon/human/proc/changecome,
			/mob/living/carbon/human/proc/belongtous)
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
		if(5)
			var/obj/structure/bed/G = locate() in src.loc
			if(G)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>One more done.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Place to release your thoughts, your pain for time or eternity.</font>")
		if(6)
			var/obj/structure/flora/tree/pine/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Creature in white, ready to listen, but will not answer. </font>")
		if(7)
			var/obj/machinery/light/stolb/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Warden, which soul burns with light. </font>")
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
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>It can show you images it never saw, tell you stories it never heard. </font>")
		if(9)
			if(istype(src.l_hand, /obj/item/pickaxe))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				STAT_LEVEL(int) +=1
			else if(istype(src.r_hand, /obj/item/pickaxe))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>The one, betrayed own kind to find his brother to unknowns</font>")
		if(10)
			var/obj/structure/curtain/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>Thin body that will save all your secrets behind itself. </font>")
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
				to_chat(src, "<font color='#0400ff'>Chain of the slave, but for mortal weakness</font>")
		if(12)
			if(istype(src.l_hand, /obj/item/pyre/self_lit))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 50, 0, -1)
			else if(istype(src.r_hand, /obj/item/pyre/self_lit))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 100, 0, -1)
			else
				to_chat(src, "<font color='#0400ff'>Red maw surrounded by scum</font>")
		if(13)
			var/obj/structure/barbwire/P = locate() in src.loc
			if(P)
				src.intrigue++
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.l_hand, /obj/item/stack/barbwire))
				src.intrigue++
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/stack/barbwire))
				src.intrigue++
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Little solids begging for flesh</font>")
/*		if(14)
			var/turf/simulated/floor/trench/T = get_turf(C.mob)
			if(T && (T.z in zlevels))
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				if(do_after(src,10))
					playsound(src, 'sound/effects/explosionfar.ogg', 80, 0, -1)
	CURSED			if(do_after(src,10))
						playsound(src, 'sound/effects/Explosion2.ogg', 80, 0, -1)
						if(do_after(src,5))
							playsound(src, 'sound/voice/agony_male4.ogg', 80, 0, -1)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Good.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Nest of caution of death.</font>")
*/
		if(15)
			if(istype(src.l_hand, /obj/item/torch))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 50, 0, -1)
			else if(istype(src.r_hand, /obj/item/torch))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 100, 0, -1)
			else
				to_chat(src, "<font color='#0400ff'>Wandering bright steel waiting for it's turn to be awaken</font>")
		if(16)
			var/obj/structure/table/steel/P = locate() in src.loc
			if(P)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Carrying abomination burried in steel. </font>")

/*		if(14)
			var/turf/simulated/floor/trench/D = locate() in src.loc
			if(L||H)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/torch))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Grants you a gifts and get forgotten</font>")
*/
		if(17)
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
		if(18)
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
		if(19)
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

			if(src.STAT_LEVEL(end)<11)
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
		if(20)
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

		if(21)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Take my grant, use wisely.</font>")
				new /obj/item/reagent_containers/pill/cyanide(src.loc)
			else
				to_chat(src, "<font color='#0400ff'>Let me grant you thing to kill silently or to kill yourself with no word in defeat. Stand upon my rune</font>")
		if(22)
			to_chat(src, "<font color='#0400ff'>To be continued...</font>")


/mob/living/carbon/human/proc/wehere()
	set name = "We are here"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We are here")
		playsound(src, 'sound/effects/cults/tzeentch/werehere.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/forthechanger()
	set name = "For the Changer of Ways!"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("For the Changer of Ways!")
		playsound(src, 'sound/effects/cults/tzeentch/fortzeentch.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/beconsumed()
	set name = "You will be consumed"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("You will be consumed")
		playsound(src, 'sound/effects/cults/tzeentch/youbeconsumed.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/weshallsacrifise()
	set name = "We shall sacrifice our lives"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We shall gladly sacrifice our lives for Tzeentch's designs")
		playsound(src, 'sound/effects/cults/tzeentch/weshallsacrifice.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/theyseetruth()
	set name = "They'll see the truth"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("And then they'll see the truth")
		playsound(src, 'sound/effects/cults/tzeentch/theyseetruth.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/peerminds()
	set name = "We'll peer theirs little minds"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We'll peer theirs little minds")
		playsound(src, 'sound/effects/cults/tzeentch/peerminds.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/charge()
	set name = "Charge!"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Charge!")
		playsound(src, 'sound/effects/cults/tzeentch/charge.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/changecome()
	set name = "Change has come"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Change has come")
		playsound(src, 'sound/effects/cults/tzeentch/changecome.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/belongtous()
	set name = "It shall belong to us"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("It shall belong to us")
		playsound(src, 'sound/effects/cults/tzeentch/belongtous.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/behold()
	set name = "Behold the light of Tzeentch"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Behold the light of Tzeentch")
		playsound(src, 'sound/effects/cults/tzeentch/behold.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return