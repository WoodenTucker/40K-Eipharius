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
			to_chat(src, "<font color='#0400ff'>Correct</font>")
			src.mind.special_role = "Tzeentch Cultist"
			src.verbs += list(
			/mob/living/carbon/human/proc/tzeewehere,
			/mob/living/carbon/human/proc/tzeeforthechanger,
			/mob/living/carbon/human/proc/tzeebeconsumed,
			/mob/living/carbon/human/proc/tzeeweshallsacrifise,
			/mob/living/carbon/human/proc/tzeetheyseetruth,
			/mob/living/carbon/human/proc/tzeepeerminds,
			/mob/living/carbon/human/proc/tzeecharge,
			/mob/living/carbon/human/proc/tzeechangecome,
			/mob/living/carbon/human/proc/tzeebehold,
			/mob/living/carbon/human/proc/tzeebelongtous)
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
				to_chat(src, "<font color='#0400ff'>Lonely warden, which soul burns with light. </font>")
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
				to_chat(src, "<font color='#0400ff'>The one, betrayed own origin to find his brothers to unknowns</font>")
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
				to_chat(src, "<font color='#0400ff'>Gallows of need</font>")
		if(12)
			if(istype(src.l_hand, /obj/item/pyre/self_lit))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/pyre/self_lit))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
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
			if(istype(src.l_hand, /obj/item/torch)||istype(src.l_hand, /obj/item/device/flashlight/lantern))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 50, 0, -1)
			else if(istype(src.r_hand, /obj/item/torch)||istype(src.r_hand, /obj/item/device/flashlight/lantern))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 100, 0, -1)
			else
				to_chat(src, "<font color='#0400ff'>Wandering bright steel waiting for it's turn to be awaken or sleep once again</font>")
		if(16)
			var/obj/structure/table/steel/P = locate() in src.loc
			var/obj/structure/closet/C = locate() in src.loc
			if(P || C)
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>The steel one, ready to carry anything it will be forced to. </font>")

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
				to_chat(src, "<font color='#0400ff'>One of advisers with big beautiful story and no sence. </font>")
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

			if(src.STAT_LEVEL(end)<12)
				src.STAT_LEVEL(end)=12
			else
				src.STAT_LEVEL(end) -=2

			if(src.STAT_LEVEL(str)<12)
				src.STAT_LEVEL(str)=12
			else
				src.STAT_LEVEL(str) -=2

			if(src.STAT_LEVEL(dex)<13)
				src.STAT_LEVEL(dex)=13
			else
				src.STAT_LEVEL(dex) -=1
			if(prob(40))
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
				to_chat(src, "<font color='#0400ff'>Let me grant you thing to kill silently or to kill yourself with no word in capture. Stand upon my rune</font>")
		if(22)
			if(istype(src.l_hand, /obj/item/stack/thrones3) || istype(src.l_hand, /obj/item/stack/thrones2) || istype(src.l_hand, /obj/item/stack/thrones))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/stack/thrones3) || istype(src.r_hand, /obj/item/stack/thrones2) || istype(src.r_hand, /obj/item/stack/thrones))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Many useless things that human can turn into one useful. </font>")
		if(23)
			if(istype(src.l_hand, /obj/item/material/shard))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/material/shard))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>And the last riddle...</font>")
			else
				to_chat(src, "<font color='#0400ff'>Mutilated dangerous remain of smooth blank soul. </font>")
		if(24)
			if(istype(src.l_hand, /obj/item/material/sword/combat_knife))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/material/sword/combat_knife))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>And the last riddle...</font>")
			else
				to_chat(src, "<font color='#0400ff'>Common tool of art of violence. </font>")
		if(25)
			if(istype(src.l_hand, /obj/item/flame/candle))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/flame/candle))
				src.intrigue++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Trial way to connect to other world for dark or bright urges. </font>")
		if(26)
			to_chat(src, "<font color='#0400ff'>Riddles has ended for you, and now you should prove your actual worship. </font>")
			src.intrigue++
		if(27)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/clothing/head/helmet/krieghelmet)||istype(src.l_hand, /obj/item/clothing/head/helmet/guardhelmet)||istype(src.l_hand, /obj/item/clothing/head/helmet/flak)||istype(src.l_hand, /obj/item/clothing/head/helmet/medicae)||istype(src.l_hand, /obj/item/clothing/head/helmet/whiteshield))
					qdel(src.l_hand)
					src.intrigue++
					src.STAT_LEVEL(end)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.l_hand, /obj/item/clothing/head/helmet/krieghelmet)||istype(src.r_hand, /obj/item/clothing/head/helmet/guardhelmet)||istype(src.r_hand, /obj/item/clothing/head/helmet/flak)||istype(src.r_hand, /obj/item/clothing/head/helmet/medicae)||istype(src.r_hand, /obj/item/clothing/head/helmet/whiteshield))
					qdel(src.r_hand)
					src.intrigue++
					src.STAT_LEVEL(end)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring head protection of one of imperial cannon fodders upon my rune. </font>")
		if(28)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/organ/internal/eyes))
					qdel(src.l_hand)
					src.intrigue++
					src.STAT_LEVEL(str)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.r_hand, /obj/item/organ/internal/eyes))
					qdel(src.r_hand)
					src.intrigue++
					src.STAT_LEVEL(str)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring eyes of blind corpse slave upon my rune to prove your worship. </font>")
		if(29)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc

			if(T)
//Veteran Lasgun
				if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/energy/las/lasgun/tinkered(src.loc)
//Laspistol
				else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/gun/projectile/warfare))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/energy/las/laspistol(src.loc)
				else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/energy/las/laspistol(src.loc)
//Renegade
				else if(istype(src.l_hand, /obj/item/ingots/silveringot) && istype(src.r_hand, /obj/item/gun/projectile/warfare))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/projectile/talon/renegade(src.loc)
				else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/ingots/silveringot))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/projectile/talon/renegade(src.loc)
//Catachan Knife
				else if(istype(src.l_hand, /obj/item/material/sword/combat_knife) && istype(src.r_hand, /obj/item/material/sword/combat_knife))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/material/sword/combat_knife/catachan(src.loc)
//Cane
				else if(istype(src.l_hand, /obj/item/newore/ironore) && istype(src.r_hand, /obj/item/material/sword/combat_knife/catachan))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						if(prob(45))
							new /obj/item/cane/concealed(src.loc)
						else
							new /obj/item/material/sword/cane(src.loc)
				else if(istype(src.l_hand, /obj/item/material/sword/combat_knife/catachan) && istype(src.r_hand, /obj/item/newore/ironore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						if(prob(45))
							new /obj/item/cane/concealed(src.loc)
						else
							new /obj/item/material/sword/cane(src.loc)
//Chaosknife
				else if(istype(src.l_hand, /obj/item/newore/adamantiumore) && istype(src.r_hand, /obj/item/material/sword/combat_knife))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/material/sword/chaosknife(src.loc)
				else if(istype(src.l_hand, /obj/item/material/sword/combat_knife) && istype(src.r_hand, /obj/item/newore/adamantiumore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/material/sword/chaosknife(src.loc)
//Lucius
				else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/clothing/head/helmet/krieghelmet))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/energy/las/lasgun/lucius(src.loc)
				else if(istype(src.l_hand, /obj/item/clothing/head/helmet/krieghelmet) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/energy/las/lasgun/lucius(src.loc)
//Club
				else if(istype(src.l_hand, /obj/item/stack/logs) && istype(src.r_hand, /obj/item/ingots/ironingot))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/melee/classic_baton/trench_club(src.loc)
				else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/stack/logs))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/melee/classic_baton/trench_club(src.loc)
//Knife
				else if(istype(src.l_hand, /obj/item/material/shard) && istype(src.r_hand, /obj/item/ingots/ironingot))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/material/sword/combat_knife(src.loc)
				else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/material/shard))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/material/sword/combat_knife(src.loc)
//Pistol magazine
				else if(istype(src.l_hand, /obj/item/newore/coalore) && istype(src.r_hand, /obj/item/ingots/copperingot))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/ammo_magazine/c45m/warfare(src.loc)
				else if(istype(src.l_hand, /obj/item/ingots/copperingot) && istype(src.r_hand, /obj/item/newore/coalore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/ammo_magazine/c45m/warfare(src.loc)
//Soulburn magazine
				else if(istype(src.l_hand, /obj/item/newore/coalore) && istype(src.r_hand, /obj/item/ingots/ironingot))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/ammo_magazine/mc9mmt/machinepistol(src.loc)
				else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/newore/coalore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/ammo_magazine/mc9mmt/machinepistol(src.loc)
//Lasgun magazine
				else if(istype(src.l_hand, /obj/item/newore/coalore) && istype(src.r_hand, /obj/item/ingots/silveringot))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/cell/lasgun(src.loc)
				else if(istype(src.l_hand, /obj/item/ingots/silveringot) && istype(src.r_hand, /obj/item/newore/coalore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/cell/lasgun(src.loc)
//Autogun
				else if(istype(src.l_hand, /obj/item/gun/projectile/talon/renegade) && istype(src.r_hand, /obj/item/gun/projectile/warfare))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/projectile/automatic/machinepistol(src.loc)
				else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/gun/projectile/talon/renegade))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/gun/projectile/automatic/machinepistol(src.loc)
//Coal
				else if(istype(src.l_hand, /obj/item/torch))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						new /obj/item/newore/coalore(src.loc)
				else if(istype(src.r_hand, /obj/item/torch))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.r_hand)
						new /obj/item/newore/coalore(src.loc)
//Thrones3
				else if(istype(src.l_hand, /obj/item/newore/copperore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						new /obj/item/stack/thrones3/three(src.loc)
				else if(istype(src.r_hand, /obj/item/newore/copperore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.r_hand)
						new /obj/item/stack/thrones3/three(src.loc)
//Thrones2
				else if(istype(src.l_hand, /obj/item/newore/silverore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						new /obj/item/stack/thrones2(src.loc)
				else if(istype(src.r_hand, /obj/item/newore/silverore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.r_hand)
						new /obj/item/stack/thrones2(src.loc)
//Thrones
				else if(istype(src.l_hand, /obj/item/newore/goldore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						new /obj/item/stack/thrones2(src.loc)
				else if(istype(src.r_hand, /obj/item/newore/goldore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.r_hand)
						new /obj/item/stack/thrones(src.loc)
//Noble uniform
				else if(istype(src.l_hand, /obj/item/clothing/under/rank/penitent) && istype(src.r_hand, /obj/item/newore/goldore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/clothing/under/rank/consort/adept(src.loc)
				else if(istype(src.l_hand, /obj/item/newore/goldore) && istype(src.r_hand, /obj/item/clothing/under/rank/penitent))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/clothing/under/rank/consort/adept(src.loc)
//Valhallah uniform
				else if(istype(src.l_hand, /obj/item/clothing/under/rank/penitent) && istype(src.r_hand, /obj/item/newore/smallrock))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/clothing/under/rank/valhallan_uniform(src.loc)
				else if(istype(src.l_hand, /obj/item/newore/smallrock) && istype(src.r_hand, /obj/item/clothing/under/rank/penitent))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/clothing/under/rank/valhallan_uniform(src.loc)
//Militia uniform
				else if(istype(src.l_hand, /obj/item/clothing/under/rank/penitent) && istype(src.r_hand, /obj/item/newore/ironore))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/clothing/suit/armor/militia(src.loc)
				else if(istype(src.l_hand, /obj/item/newore/ironore) && istype(src.r_hand, /obj/item/clothing/under/rank/penitent))
					playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 5)
					if(do_after(usr,45,src))
						qdel(src.l_hand)
						qdel(src.r_hand)
						new /obj/item/clothing/suit/armor/militia(src.loc)
			else
				to_chat(src, "<font color='#0400ff'>You successfully proved your worship, now you can create, change, improve different items upon my rune. </font>")
				to_chat(src, "<font color='#0400ff'>Let me give you examples.</font>")
				to_chat(src, "<font color='#0400ff'>Lasgun + Lasgun -> Modified Lasgun.</font>")
				to_chat(src, "<font color='#0400ff'>Lasgun + Villiers Pistol -> Laspistol.</font>")
				to_chat(src, "<font color='#0400ff'>Silver Ingot + Villiers Pistol -> Renegade Pistol.</font>")
				to_chat(src, "<font color='#0400ff'>Renegade Pistol + Villiers Pistol -> Mk.22 Autogun.</font>")
				to_chat(src, "<font color='#0400ff'>Combat Knife + Combat Knife -> Catachan Combat Knife. </font>")
				to_chat(src, "<font color='#0400ff'>Catachan Combat Knife + Iron Ore -> Cane Sword.</font>")
				to_chat(src, "<font color='#0400ff'>Combat Knife + Adamantium Ore -> Chaos Knife.</font>")
				to_chat(src, "<font color='#0400ff'>Lasgun + Krieg Helmet -> Lucius Pattern Lasgun.</font>")
				to_chat(src, "<font color='#0400ff'>Log + Iron Ingot -> Trench Club.</font>")
				to_chat(src, "<font color='#0400ff'>Shard + Iron Ingot -> Combat Knife.</font>")
				to_chat(src, "<font color='#0400ff'>Coal + Copper Ingot -> Pistol Magazine.</font>")
				to_chat(src, "<font color='#0400ff'>Coal + Iron Ingot -> Soulburn Magazine.</font>")
				to_chat(src, "<font color='#0400ff'>Coal + Silver Ingot -> Lasgun Magazine.</font>")
				to_chat(src, "<font color='#0400ff'>Torch -> Coal.</font>")
				to_chat(src, "<font color='#0400ff'>Cooper Ore -> 3 copper coins.</font>")
				to_chat(src, "<font color='#0400ff'>Silver Ore -> 1 silver coin.</font>")
				to_chat(src, "<font color='#0400ff'>Gold Ore -> 1 gold coin.</font>")
				to_chat(src, "<font color='#0400ff'>Penitent Jumpsuit + Small Rock -> Valhallah Uniform.</font>")
				to_chat(src, "<font color='#0400ff'>Penitent Jumpsuit + Gold Ore -> Noble Uniform.</font>")
				to_chat(src, "<font color='#0400ff'>Penitent Jumpsuit + Iron Ore -> Militia Uniform.</font>")
/*
		if(30)
			to_chat(src, "<font color='#0400ff'>To be continued...</font>")
*/