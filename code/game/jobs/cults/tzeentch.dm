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
//	if(mind.special_role != "Tzeentch Cultist" && cult_favor != 0)
//		return
	switch(cult_favor)
		if(0)
			var/obj/structure/toilet/T = locate() in src.loc
			if(T)
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				cult_favor++
				to_chat(src, "<font color='#0400ff'>First done</font>")
			else
				to_chat(src, "A wily voice pervades your mind. <font color='#0400ff'>Solve few of my riddles to start down the path of the deceiver. Sit upon the throne of both kings and beggars.</font>")
		if(1)
			STAT_LEVEL(int) +=1
			cult_favor++
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
			//src.faction += list("chaos")
		if(2)
			src.verbs += /mob/living/carbon/human/proc/tzeentchrune
			to_chat(src, "<font color='#0400ff'>To hear my next riddle memorize this symbol, draw it and stand upon it!</font>")
			cult_favor++
			GLOB.tzeentch_cult++
		if(3)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				cult_favor++
				to_chat(src, "<font color='#0400ff'>Good, now listen your next riddle.</font>")
				STAT_LEVEL(end) +=1
			else
				to_chat(src, "I haven't drawn his symbol or I'm not standing directly on it!")
		if(4)
			var/obj/structure/closet/pit/G = locate() in src.loc
			if(G)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>One more done.</font>")
			else
				to_chat(src, "<font color='#0400ff'>You'll find me in a place of stone, Where silence cloaks the ground, Search through all the empty names, And finally I'll be found.</font>")
		if(5)
			var/obj/structure/bed/G = locate() in src.loc
			if(G)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>One more done.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Who you let to eat your consciousness until dawn.</font>")
		if(6)
			var/obj/structure/flora/tree/P = locate() in src.loc
			if(P)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Moveless creature that saw many stories, but will not tell them to anyone. </font>")
		if(7)
			var/obj/machinery/light/stolb/P = locate() in src.loc
			if(P)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>Lonely warden, which soul burns with light. </font>")
		if(8)
			if(istype(src.l_hand, /obj/item/paper))
				qdel(src.l_hand)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else if(istype(src.r_hand, /obj/item/paper))
				qdel(src.r_hand)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				src.add_spell(new /spell/targeted/heal_target/sacrifice)
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>It can show you images it never saw, tell you stories it never heard. </font>")
		if(9)
			if(istype(src.l_hand, /obj/item/pickaxe)||istype(src.l_hand, /obj/item/pickaxe/newpick))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right, use your promotion wisely.</font>")
				STAT_LEVEL(int) +=1
			else if(istype(src.r_hand, /obj/item/pickaxe)||istype(src.r_hand, /obj/item/pickaxe/newpick))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>The one, who used to find own origins in dark places</font>")
		if(10)
			var/obj/structure/curtain/P = locate() in src.loc
			if(P)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>Thin body that will save all your secrets behind itself. </font>")
		if(11)
			if(istype(src.l_hand, /obj/item/reagent_containers/food/drinks/canteen))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else if(istype(src.r_hand, /obj/item/reagent_containers/food/drinks/canteen))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>Gallows of mortal need</font>")
		if(12)
			if(istype(src.l_hand, /obj/item/pyre/self_lit))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/pyre/self_lit))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Red maws of the streets</font>")
		if(13)
			var/obj/structure/barbwire/P = locate() in src.loc
			if(P)
				cult_favor++
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.l_hand, /obj/item/stack/barbwire))
				cult_favor++
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/stack/barbwire))
				cult_favor++
				cult_favor++
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
				cult_favor++
				to_chat(src, "<font color='#0400ff'>Good.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Nest of caution of death.</font>")
*/
		if(15)
			if(istype(src.l_hand, /obj/item/torch)||istype(src.l_hand, /obj/item/device/flashlight/lantern))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 100, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 50, 0, -1)
			else if(istype(src.r_hand, /obj/item/torch)||istype(src.r_hand, /obj/item/device/flashlight/lantern))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				playsound(src, 'sound/items/torch_light.ogg', 100, 0, -1)
			else
				to_chat(src, "<font color='#0400ff'>Wandering bright steel waiting for it's turn to be awaken or sleep once again</font>")
		if(16)
			var/obj/structure/table/steel/P = locate() in src.loc
			var/obj/structure/closet/C = locate() in src.loc
			if(P || C)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
			else
				to_chat(src, "<font color='#0400ff'>The steel one, ready to carry anything it will be forced to. </font>")

/*		if(14)
			var/turf/simulated/floor/trench/D = locate() in src.loc
			if(L||H)
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else if(istype(src.r_hand, /obj/item/torch))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Grants you a gifts and get forgotten</font>")
*/
		if(17)
			if(istype(src.l_hand, /obj/item/book/manual))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
				STAT_LEVEL(str) -=1
			else if(istype(src.r_hand, /obj/item/book/manual))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Right.</font>")
				STAT_LEVEL(int) +=1
				STAT_LEVEL(str) -=1
			else
				to_chat(src, "<font color='#0400ff'>Traitor among sources of knowledge. </font>")
		if(18)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/book/manual))
					qdel(src.l_hand)
					cult_favor++
					playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
					to_chat(src, "<font color='#0400ff'>Ambitious person needs ambitious powers.</font>")
					src.add_spell(new /spell/messa_shroud)
				else if(istype(src.r_hand, /obj/item/book/manual))
					qdel(src.r_hand)
					cult_favor++
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

			if(src.STAT_LEVEL(end)<13)
				src.STAT_LEVEL(end)=13
			else
				src.STAT_LEVEL(end) -=2

			if(src.STAT_LEVEL(str)<13)
				src.STAT_LEVEL(str)=13
			else
				src.STAT_LEVEL(str) -=2

			if(src.STAT_LEVEL(dex)<14)
				src.STAT_LEVEL(dex)=14
			else
				src.STAT_LEVEL(dex) -=1
			if(prob(30))
				adjustBrainLoss(20)
			cult_favor++
			to_chat(src, "<font color='#0400ff'>Your initiation is complete. Better skills, better stats, use wisely</font>")
		if(20)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				cult_favor++
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
				cult_favor++
				to_chat(src, "<font color='#0400ff'>Take my grant, use wisely.</font>")
				new /obj/item/reagent_containers/pill/cyanide(src.loc)
			else
				to_chat(src, "<font color='#0400ff'>Let me grant you thing to kill silently or to kill yourself with no word in capture. Stand upon my rune</font>")
		if(22)
			if(istype(src.l_hand, /obj/item/stack/thrones3) || istype(src.l_hand, /obj/item/stack/thrones2) || istype(src.l_hand, /obj/item/stack/thrones))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/stack/thrones3) || istype(src.r_hand, /obj/item/stack/thrones2) || istype(src.r_hand, /obj/item/stack/thrones))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Many useless things which quantity humanity created and can turn into less, but useful. </font>")
		if(23)
			if(istype(src.l_hand, /obj/item/material/shard))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/material/shard))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>And the last riddle...</font>")
			else
				to_chat(src, "<font color='#0400ff'>Mutilated dangerous remain of smooth blank soul. </font>")
		if(24)
			if(istype(src.l_hand, /obj/item/material/sword/combat_knife))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/material/sword/combat_knife))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>And the last riddle...</font>")
			else
				to_chat(src, "<font color='#0400ff'>Common tool of art of violence. </font>")
		if(25)
			if(istype(src.l_hand, /obj/item/flame/candle))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else if(istype(src.r_hand, /obj/item/flame/candle))
				cult_favor++
				playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Correct.</font>")
			else
				to_chat(src, "<font color='#0400ff'>Trial way to connect to other world for dark or bright urges. </font>")
		if(26)
			to_chat(src, "<font color='#0400ff'>Riddles has ended for you, and now you should prove your actual worship. </font>")
			cult_favor++
		if(27)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/clothing/head/helmet/krieghelmet)||istype(src.l_hand, /obj/item/clothing/head/helmet/guardhelmet)||istype(src.l_hand, /obj/item/clothing/head/helmet/flak)||istype(src.l_hand, /obj/item/clothing/head/helmet/medicae)||istype(src.l_hand, /obj/item/clothing/head/helmet/whiteshield))
					qdel(src.l_hand)
					cult_favor++
					src.STAT_LEVEL(end)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.r_hand, /obj/item/clothing/head/helmet/krieghelmet)||istype(src.r_hand, /obj/item/clothing/head/helmet/guardhelmet)||istype(src.r_hand, /obj/item/clothing/head/helmet/flak)||istype(src.r_hand, /obj/item/clothing/head/helmet/medicae)||istype(src.r_hand, /obj/item/clothing/head/helmet/whiteshield))
					qdel(src.r_hand)
					cult_favor++
					src.STAT_LEVEL(end)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring head protection of one of imperial cannon fodders upon my rune to show me you ready to gain my protection. </font>")
		if(28)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/organ/internal/eyes))
					qdel(src.l_hand)
					cult_favor++
					src.STAT_LEVEL(int)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.r_hand, /obj/item/organ/internal/eyes))
					qdel(src.r_hand)
					cult_favor++
					src.STAT_LEVEL(int)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring eyes of blind corpse slave upon my rune to show me you ready to see new my abilities. </font>")
		if(29)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/organ/external/arm/right)||istype(src.l_hand, /obj/item/organ/external/arm))
					qdel(src.l_hand)
					cult_favor++
					src.STAT_LEVEL(int)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.r_hand, /obj/item/organ/external/arm/right)||istype(src.l_hand, /obj/item/organ/external/arm))
					qdel(src.r_hand)
					cult_favor++
					src.STAT_LEVEL(int)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring arm upon my rune to show me you ready to create with own hands. </font>")
		if(30)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/organ/internal/heart))
					qdel(src.l_hand)
					cult_favor++
					src.STAT_LEVEL(str)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.r_hand, /obj/item/organ/internal/heart))
					qdel(src.r_hand)
					cult_favor++
					src.STAT_LEVEL(str)+=1
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring heart upon my rune to show me you ready to spill blood with my weapon. </font>")
		if(31)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				if(istype(src.l_hand, /obj/item/organ/internal/brain))
					qdel(src.l_hand)
					cult_favor++
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
				else if(istype(src.r_hand, /obj/item/organ/internal/brain))
					qdel(src.r_hand)
					cult_favor++
					playsound(src, 'sound/effects/quotes/cults/tzeentch/breath.ogg', 100, 0, 5)
			else
				to_chat(src, "<font color='#0400ff'>Bring brain upon my rune to show me you will use my gifts wisely. </font>")
		if(32)
			src.verbs += /mob/living/carbon/human/proc/tzeentchcraft
			src.verbs += /mob/living/carbon/human/proc/tzeentchcraftrecipe
			cult_favor++
		if(33)
			to_chat(src, "<font color='#0400ff'>To be continued...</font>")





























/mob/living/carbon/human/proc/tzeentchcraftrecipe()
	set category = "Ruinous Powers"
	set name = "Tzeentch Recipes"
	set desc = "Let me remind you..."

	to_chat(src, "<font color='#0400ff'>You successfully proved your worship, now you can create, change, improve different items upon my rune. </font>")
	to_chat(src, "<font color='#0400ff'>Let me give you examples.</font>")
	to_chat(src, "<font color='#0400ff'>Lasgun + Lasgun -> Modified Lasgun.</font>")
	to_chat(src, "<font color='#0400ff'>Tinkered Lasgun + Adamantium -> Plasma Pistol.</font>")
	to_chat(src, "<font color='#0400ff'>Silver Ingot + Villiers Pistol -> Renegade Pistol.</font>")
	to_chat(src, "<font color='#0400ff'>Two Villiers Pistols -> Mk.22 Autogun.</font>")
	to_chat(src, "<font color='#0400ff'>Combat Knife + Combat Knife -> Catachan Combat Knife. </font>")
	to_chat(src, "<font color='#0400ff'>Catachan Combat Knife + Iron Ore -> Cane Sword.</font>")
	to_chat(src, "<font color='#0400ff'>Combat Knife + Adamantium Ore -> Chaos Knife.</font>")
	to_chat(src, "<font color='#0400ff'>Lasgun + Krieg Helmet -> Lucius Pattern Lasgun.</font>")
	to_chat(src, "<font color='#0400ff'>Log + Iron Ingot -> Trench Club.</font>")
	to_chat(src, "<font color='#0400ff'>Shard + Iron Ingot -> Combat Knife.</font>")
	to_chat(src, "<font color='#0400ff'>Coal + Copper Ingot -> Pistol Magazine.</font>")
	to_chat(src, "<font color='#0400ff'>Coal + Iron Ingot -> Soulburn Magazine.</font>")
	to_chat(src, "<font color='#0400ff'>Soulburn Magazine + Iron Ore -> Warmonger Magazine.</font>")
	to_chat(src, "<font color='#0400ff'>Coal + Silver Ingot -> Lasgun Magazine.</font>")
	to_chat(src, "<font color='#0400ff'>Torch -> Coal.</font>")
	to_chat(src, "<font color='#0400ff'>Pyre -> Villers Pistol.</font>")
	to_chat(src, "<font color='#0400ff'>Pistol + Iron Ingot -> Warmonger Revolver.</font>")
	to_chat(src, "<font color='#0400ff'>Candle + Poo -> Skinless Summon.</font>")
	to_chat(src, "<font color='#0400ff'>Cooper/Silver/Gold Ore -> Thrones.</font>")
	to_chat(src, "<font color='#0400ff'>Newspaper -> IFAK.</font>")

	to_chat(src, "<font color='#0400ff'>Pipe Grenade + Villiers Pistol -> Boscolet Stub Rifle.</font>")
	to_chat(src, "<font color='#0400ff'>Lasgun +  Mk.5 Warmonger -> Catachan Lasgun.</font>")
	to_chat(src, "<font color='#0400ff'>Uranium Ore -> Copper Ore.</font>")
//	to_chat(src, "<font color='#0400ff'>Astartes Helmet -> Boltpistol + Boltpistol Magazine.</font>")
	to_chat(src, "<font color='#0400ff'>Cane + Commissar Hat -> Commissar Sword.</font>")
	to_chat(src, "<font color='#0400ff'>Torch + Commissar Hat -> Flamethrower.</font>")
	to_chat(src, "<font color='#0400ff'>Lord Trader Hat -> Plasma Pistol + Ammo.</font>")
//	to_chat(src, "<font color='#0400ff'>Seneschal Hat -> Full Access.</font>")
	to_chat(src, "<font color='#0400ff'>Sister of Battle Helmet -> Bolter + Ammo.</font>")
	to_chat(src, "<font color='#0400ff'>Noble Hat -> Money.</font>")
	to_chat(src, "<font color='#0400ff'>Enforcer Helmet -> Shotgun.</font>")
	to_chat(src, "<font color='#0400ff'>Night Vision Glasses + Mark XIc Visor -> Mark XIc/NV Visor.</font>")
	to_chat(src, "<font color='#0400ff'>Stub Rifle + Lasgun -> Longlas.</font>")
	to_chat(src, "<font color='#0400ff'>Heavy Stubber + Lasgun -> Hotshot.</font>")
	to_chat(src, "<font color='#0400ff'>Spooky Hood -> Acolyte Mask + Acolyte Helmet.</font>")
	to_chat(src, "<font color='#0400ff'>Heavy Stubber + Stub Rifle -> Armageddon Pattern Stubber.</font>")
	to_chat(src, "<font color='#0400ff'>Super Battery + Bone Saw -> Chainsword.</font>")
	to_chat(src, "<font color='#0400ff'>Cane + Pickaxe -> Trench Axe.</font>")
	to_chat(src, "<font color='#0400ff'>Trench Club + Cleaver -> Choppa.</font>")
	to_chat(src, "<font color='#0400ff'>Iron Ingot + Copper Ingot -> ?.</font>")
	to_chat(src, "<font color='#0400ff'>Combat Knife + Plank -> Barbwire.</font>")
	to_chat(src, "<font color='#0400ff'>Metal Rod + Metal Rod -> Crowbar.</font>")
	to_chat(src, "<font color='#0400ff'>Lantern + Torch -> Welding Tool.</font>")
	to_chat(src, "<font color='#0400ff'>Tube Lamp -> Torch.</font>")
	to_chat(src, "<font color='#0400ff'>Matchbox -> Shells Box.</font>")
	to_chat(src, "<font color='#0400ff'>Obscura Pill -> Cyanide Pill.</font>")
	to_chat(src, "<font color='#0400ff'>Obscura Pill Botte -> Medical Stuff.</font>")
	to_chat(src, "<font color='#0400ff'>Head + Cloth -> Cult Hood.</font>")
	to_chat(src, "<font color='#0400ff'>Barbwire + Pickaxe -> Pipe Grenade.</font>")
//	to_chat(src, "<font color='#0400ff'>Pliars of truth -> Chainaxe.</font>")
	to_chat(src, "<font color='#0400ff'>Arm + Bandage -> Suture.</font>")
	to_chat(src, "<font color='#0400ff'>Two Boscolet Stub Rifles -> Sniper Rifle.</font>")
	to_chat(src, "<font color='#0400ff'>Astartes Bolter -> Rocket Launcher.</font>")
	to_chat(src, "<font color='#0400ff'>Pen -> Sniper Bullet.</font>")
	to_chat(src, "<font color='#0400ff'>Two Pipe Grenades -> Fragmetation Grenade.</font>")
	to_chat(src, "<font color='#0400ff'>Penitent Jumpsuit + Iron Ingot/Gold Ore/Small Rock -> ?.</font>")

/mob/living/carbon/human/proc/tzeentchcraft()
	set category = "Ruinous Powers"
	set name = "Tzeentch Craft"
	set desc = "From nowhere to nowhere."
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>Come to me, initiate.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "Not in such statement")	//user is tied up
		return
	var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
	if(T)
//Veteran Lasgun
		if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/tinkered(src.loc)
//Krak
		else if(istype(src.l_hand, /obj/item/grenade/frag/high_yield/homemade) && istype(src.r_hand, /obj/item/grenade/frag/high_yield/homemade))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/grenade/frag/high_yield/krak(src.loc)
//Laspistol
		else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun/tinkered) && istype(src.r_hand, /obj/item/newore/adamantiumore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/pulse/plasma/pistol(src.loc)
		else if(istype(src.l_hand, /obj/item/newore/adamantiumore) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun/tinkered))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/pulse/plasma/pistol(src.loc)
//Renegade
		else if(istype(src.l_hand, /obj/item/ingots/silveringot) && istype(src.r_hand, /obj/item/gun/projectile/warfare))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/talon/renegade(src.loc)
		else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/ingots/silveringot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/talon/renegade(src.loc)
//Catachan Knife
		else if(istype(src.l_hand, /obj/item/material/sword/combat_knife) && istype(src.r_hand, /obj/item/material/sword/combat_knife))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/combat_knife/catachan(src.loc)
//Cane
		else if(istype(src.l_hand, /obj/item/newore/ironore) && istype(src.r_hand, /obj/item/material/sword/combat_knife/catachan))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				if(prob(45))
					new /obj/item/cane/concealed(src.loc)
				else
					new /obj/item/material/sword/cane(src.loc)
		else if(istype(src.l_hand, /obj/item/material/sword/combat_knife/catachan) && istype(src.r_hand, /obj/item/newore/ironore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				if(prob(45))
					new /obj/item/cane/concealed(src.loc)
				else
					new /obj/item/material/sword/cane(src.loc)
//Chaosknife
		else if(istype(src.l_hand, /obj/item/newore/adamantiumore) && istype(src.r_hand, /obj/item/material/sword/combat_knife))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/chaosknife(src.loc)
		else if(istype(src.l_hand, /obj/item/material/sword/combat_knife) && istype(src.r_hand, /obj/item/newore/adamantiumore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/chaosknife(src.loc)
//Lucius
		else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/clothing/head/helmet/krieghelmet))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/lucius(src.loc)
		else if(istype(src.l_hand, /obj/item/clothing/head/helmet/krieghelmet) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/lucius(src.loc)
//Club
		else if(istype(src.l_hand, /obj/item/stack/logs) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/melee/classic_baton/trench_club(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/stack/logs))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/melee/classic_baton/trench_club(src.loc)
//Knife
		else if(istype(src.l_hand, /obj/item/material/shard) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/combat_knife(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/material/shard))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/combat_knife(src.loc)
//Pistol magazine
		else if(istype(src.l_hand, /obj/item/newore/coalore) && istype(src.r_hand, /obj/item/ingots/copperingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/ammo_magazine/c45m/warfare(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/copperingot) && istype(src.r_hand, /obj/item/newore/coalore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/ammo_magazine/c45m/warfare(src.loc)
//Soulburn magazine
		else if(istype(src.l_hand, /obj/item/newore/coalore) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/ammo_magazine/mc9mmt/machinepistol(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/newore/coalore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/ammo_magazine/mc9mmt/machinepistol(src.loc)
//Lasgun magazine
		else if(istype(src.l_hand, /obj/item/newore/coalore) && istype(src.r_hand, /obj/item/ingots/silveringot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/cell/lasgun(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/silveringot) && istype(src.r_hand, /obj/item/newore/coalore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/cell/lasgun(src.loc)
//Autogun
		else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/gun/projectile/warfare))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/automatic/machinepistol(src.loc)
//Coal
		else if(istype(src.l_hand, /obj/item/torch))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/newore/coalore(src.loc)
		else if(istype(src.r_hand, /obj/item/torch))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/newore/coalore(src.loc)
				/obj/item/newspaper
//Thrones3
		else if(istype(src.l_hand, /obj/item/newore/copperore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/stack/thrones3/three(src.loc)
		else if(istype(src.r_hand, /obj/item/newore/copperore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/stack/thrones3/three(src.loc)
//Thrones2
		else if(istype(src.l_hand, /obj/item/newore/silverore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/stack/thrones2(src.loc)
		else if(istype(src.r_hand, /obj/item/newore/silverore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/stack/thrones2(src.loc)
//Thrones
		else if(istype(src.l_hand, /obj/item/newore/goldore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/stack/thrones2(src.loc)
		else if(istype(src.r_hand, /obj/item/newore/goldore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/stack/thrones(src.loc)
//Noble uniform
		else if(istype(src.l_hand, /obj/item/clothing/under/rank/penitent) && istype(src.r_hand, /obj/item/newore/goldore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/under/rank/consort/adept(src.loc)
		else if(istype(src.l_hand, /obj/item/newore/goldore) && istype(src.r_hand, /obj/item/clothing/under/rank/penitent))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/under/rank/consort/adept(src.loc)
//Valhallah uniform
		else if(istype(src.l_hand, /obj/item/clothing/under/rank/penitent) && istype(src.r_hand, /obj/item/newore/smallrock))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/under/rank/valhallan_uniform(src.loc)
		else if(istype(src.l_hand, /obj/item/newore/smallrock) && istype(src.r_hand, /obj/item/clothing/under/rank/penitent))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/under/rank/valhallan_uniform(src.loc)
//Militia uniform
		else if(istype(src.l_hand, /obj/item/clothing/under/rank/penitent) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/suit/armor/heretcoat(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/clothing/under/rank/penitent))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/suit/armor/heretcoat(src.loc)
//IFAK
		else if(istype(src.l_hand, /obj/item/newspaper))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/storage/box/ifak(src.loc)
		else if(istype(src.r_hand, /obj/item/newspaper))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/storage/box/ifak(src.loc)
//Boscolet
		else if(istype(src.l_hand, /obj/item/grenade/frag/high_yield/homemade) && istype(src.r_hand, /obj/item/gun/projectile/warfare))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty(src.loc)
		else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/grenade/frag/high_yield/homemade))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty(src.loc)
//Catachan
		else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/gun/projectile/automatic/m22/warmonger/fully_auto))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/catachan(src.loc)
		else if(istype(src.l_hand, /obj/item/gun/projectile/automatic/m22/warmonger/fully_auto) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/catachan(src.loc)
//Uranium
		else if(istype(src.l_hand, /obj/item/newore/uraniumore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				if(prob(10))
					new /obj/item/newore/goldore(src.loc)
				else
					new /obj/item/newore/copperore(src.loc)
		else if(istype(src.r_hand, /obj/item/newore/uraniumore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				if(prob(10))
					new /obj/item/newore/goldore(src.loc)
				else
					new /obj/item/newore/copperore(src.loc)
//Commissar Sword
		else if(istype(src.l_hand, /obj/item/material/sword/cane) && istype(src.r_hand, /obj/item/clothing/head/commissar))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/commissword(src.loc)
		else if(istype(src.l_hand, /obj/item/clothing/head/commissar) && istype(src.r_hand, /obj/item/material/sword/cane))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/commissword(src.loc)
//Flamer
		else if(istype(src.l_hand, /obj/item/torch) && istype(src.r_hand, /obj/item/clothing/head/commissar))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/automatic/flamer(src.loc)
		else if(istype(src.l_hand, /obj/item/clothing/head/commissar) && istype(src.r_hand, /obj/item/torch))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/automatic/flamer(src.loc)
//Trader Hat
		else if(istype(src.l_hand, /obj/item/clothing/head/rt))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/gun/energy/pulse/plasma/pistol(src.loc)
				new /obj/item/cell/lasgun(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/rt))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/gun/energy/pulse/plasma/pistol(src.loc)
				new /obj/item/cell/lasgun(src.loc)
//Sister Helmet
		else if(istype(src.l_hand, /obj/item/clothing/head/helmet/sisterofbattle))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/gun/projectile/sisterbolter(src.loc)
				new /obj/item/ammo_magazine/bolt_rifle_magazine/sister(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/helmet/sisterofbattle))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/gun/projectile/sisterbolter(src.loc)
				new /obj/item/ammo_magazine/bolt_rifle_magazine/sister(src.loc)
//Noble Hat
		else if(istype(src.l_hand, /obj/item/clothing/head/commissar/adept))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/stack/thrones/twenty(src.loc)
				new /obj/item/stack/thrones/twenty(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/commissar/adept))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/stack/thrones/twenty(src.loc)
				new /obj/item/stack/thrones/twenty(src.loc)
//Enforcer Helmet
		else if(istype(src.l_hand, /obj/item/clothing/head/helmet/guardhelmet/enforcer))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/gun/projectile/shotgun/pump/shitty(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/helmet/guardhelmet/enforcer))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 50)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/gun/projectile/shotgun/pump/shitty(src.loc)
//////
//NVG Cadian
		else if(istype(src.l_hand, /obj/item/clothing/glasses/night) && istype(src.r_hand, /obj/item/clothing/glasses/cadiangoggles))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 40)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/glasses/cadiangoggles/elite(src.loc)
		else if(istype(src.l_hand, /obj/item/clothing/glasses/cadiangoggles) && istype(src.r_hand, /obj/item/clothing/glasses/night))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 40)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/glasses/cadiangoggles/elite(src.loc)
//Longlas
		else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/gun/projectile/shotgun/pump/boltaction/shitty))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/longlas(src.loc)
		else if(istype(src.l_hand, /obj/item/gun/projectile/shotgun/pump/boltaction/shitty) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/lasgun/longlas(src.loc)
//Hotshot
		else if(istype(src.l_hand, /obj/item/gun/energy/las/lasgun) && istype(src.r_hand, /obj/item/gun/projectile/automatic/stubber))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/hotshot(src.loc)
		else if(istype(src.l_hand, /obj/item/gun/projectile/automatic/stubber) && istype(src.r_hand, /obj/item/gun/energy/las/lasgun))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/energy/las/hotshot(src.loc)
//Acolyte Helmet
		else if(istype(src.l_hand, /obj/item/clothing/head/spookyhood))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/clothing/head/inqhelm(src.loc)
				new /obj/item/clothing/mask/gas/security/agent(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/spookyhood))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/clothing/head/inqhelm(src.loc)
				new /obj/item/clothing/mask/gas/security/agent(src.loc)
//Armaggeddon Bolt Rifle
		else if(istype(src.l_hand, /obj/item/gun/projectile/shotgun/pump/boltaction/shitty) && istype(src.r_hand, /obj/item/gun/projectile/automatic/stubber))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle/rsc(src.loc)
		else if(istype(src.l_hand, /obj/item/gun/projectile/automatic/stubber) && istype(src.r_hand, /obj/item/gun/projectile/shotgun/pump/boltaction/shitty))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle/rsc(src.loc)
//Chainsword
		else if(istype(src.l_hand, /obj/item/circular_saw) && istype(src.r_hand, /obj/item/computer_hardware/battery_module/super))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/melee/chain/mercycs(src.loc)
		else if(istype(src.l_hand, /obj/item/computer_hardware/battery_module/super) && istype(src.r_hand, /obj/item/circular_saw))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/melee/chain/mercycs(src.loc)
//Trenchaxe
		else if((istype(src.l_hand, /obj/item/pickaxe)||istype(src.l_hand, /obj/item/pickaxe/newpick)) && istype(src.r_hand, /obj/item/material/sword/cane))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/melee/trench_axe(src.loc)
		else if(istype(src.l_hand, /obj/item/material/sword/cane) && (istype(src.r_hand, /obj/item/pickaxe)||istype(src.r_hand, /obj/item/pickaxe/newpick)))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/melee/trench_axe(src.loc)
//Choppa
		else if(istype(src.l_hand, /obj/item/material/knife/butch) && istype(src.r_hand, /obj/item/melee/classic_baton/trench_club))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/choppa(src.loc)
		else if(istype(src.l_hand, /obj/item/melee/classic_baton/trench_club) && istype(src.r_hand, /obj/item/material/knife/butch))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/material/sword/choppa(src.loc)
//Iron+Copper
		else if(istype(src.l_hand, /obj/item/ingots/copperingot) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				if(prob(40))
					new /obj/item/material/sword/combat_knife(src.loc)
				else if(prob(30))
					new /obj/item/gun/projectile/warfare(src.loc)
				else if(prob(20))
					new /obj/item/shield/riot(src.loc)
				else
					new /obj/item/grenade/frag/high_yield/homemade(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/ingots/copperingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				if(prob(40))
					new /obj/item/material/sword/combat_knife(src.loc)
				else if(prob(30))
					new /obj/item/gun/projectile/warfare(src.loc)
				else if(prob(20))
					new /obj/item/shield/riot(src.loc)
				else
					new /obj/item/grenade/frag/high_yield/homemade(src.loc)
//Barbwire
		else if(istype(src.l_hand, /obj/item/stack/material/wood) && istype(src.r_hand, /obj/item/material/sword/combat_knife))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/stack/barbwire(src.loc)
		else if(istype(src.l_hand, /obj/item/material/sword/combat_knife) && istype(src.r_hand, /obj/item/stack/material/wood))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/stack/barbwire(src.loc)
//Crowbar
		else if(istype(src.l_hand, /obj/item/stack/rods) && istype(src.r_hand, /obj/item/stack/rods))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/crowbar(src.loc)
//Welding
		else if(istype(src.l_hand, /obj/item/device/flashlight/lantern) && istype(src.r_hand, /obj/item/torch))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/weldingtool(src.loc)
		else if(istype(src.l_hand, /obj/item/torch) && istype(src.r_hand, /obj/item/device/flashlight/lantern))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/weldingtool(src.loc)
//Sniper Bullet
		else if(istype(src.l_hand, /obj/item/pen))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/ammo_casing/a145(src.loc)
		else if(istype(src.r_hand, /obj/item/pen))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/ammo_casing/a145(src.loc)
//Hood
		else if(istype(src.l_hand, /obj/item/organ/external/head) && istype(src.r_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/heretichood(src.loc)
		else if(istype(src.l_hand, /obj/item/stack/material/cloth) && istype(src.r_hand, /obj/item/organ/external/head))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/heretichood(src.loc)
//Hood
		else if(istype(src.l_hand, /obj/item/clothing/head/heretichood/alt) && istype(src.r_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/clothing/head/heretichood/alt2(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/heretichood/alt) && istype(src.l_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/clothing/head/heretichood/alt2(src.loc)
//Hood
		else if(istype(src.l_hand, /obj/item/clothing/head/heretichood/alt2) && istype(src.r_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/clothing/head/heretichood(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/heretichood/alt2) && istype(src.l_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/clothing/head/heretichood(src.loc)
//Hood
		else if(istype(src.l_hand, /obj/item/clothing/head/heretichood) && istype(src.r_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/clothing/head/heretichood/alt(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/head/heretichood) && istype(src.l_hand, /obj/item/stack/material/cloth))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/clothing/head/heretichood/alt(src.loc)
//Tube
		else if(istype(src.l_hand, /obj/item/light/tube))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/torch(src.loc)
		else if(istype(src.r_hand, /obj/item/light/tube))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/torch(src.loc)
//Matches
		else if(istype(src.l_hand, /obj/item/storage/box/matches))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/ammo_box/shotgun(src.loc)
		else if(istype(src.r_hand, /obj/item/storage/box/matches))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/ammo_box/shotgun(src.loc)
//Cyanide
		else if(istype(src.l_hand, /obj/item/reagent_containers/pill/happy))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/reagent_containers/pill/cyanide(src.loc)
		else if(istype(src.r_hand, /obj/item/reagent_containers/pill/happy))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/reagent_containers/pill/cyanide(src.loc)
//Medical
		else if(istype(src.l_hand, /obj/item/storage/pill_bottle/happy))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				if(prob(30))
					new /obj/item/storage/firstaid/surgery(src.loc)
				else
					new /obj/item/storage/firstaid/adv(src.loc)
		else if(istype(src.r_hand, /obj/item/storage/pill_bottle/happy))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				if(prob(30))
					new /obj/item/storage/firstaid/surgery(src.loc)
				else
					new /obj/item/storage/firstaid/adv(src.loc)
//Pipe Grenade
		else if(istype(src.l_hand, /obj/item/stack/barbwire) && (istype(src.l_hand, /obj/item/pickaxe)||istype(src.l_hand, /obj/item/pickaxe/newpick)))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/grenade/frag/high_yield/homemade(src.loc)
		else if((istype(src.l_hand, /obj/item/pickaxe)||istype(src.l_hand, /obj/item/pickaxe/newpick)) && istype(src.r_hand, /obj/item/stack/barbwire))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/grenade/frag/high_yield/homemade(src.loc)
//Suture
		else if(istype(src.l_hand, /obj/item/organ/external/arm) && istype(src.r_hand, /obj/item/stack/medical/bruise_pack))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/suture(src.loc)
		else if(istype(src.l_hand, /obj/item/stack/medical/bruise_pack) && istype(src.r_hand, /obj/item/organ/external/arm))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/suture(src.loc)
//Sniper
		else if(istype(src.l_hand, /obj/item/gun/projectile/shotgun/pump/boltaction/shitty)&&istype(src.r_hand, /obj/item/gun/projectile/shotgun/pump/boltaction/shitty))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				qdel(src.l_hand)
				new /obj/item/gun/projectile/heavysniper(src.loc)
//Rocket Launcher
		else if(istype(src.l_hand, /obj/item/gun/projectile/bolter))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/gun/launcher/rcl_rifle(src.loc)
				new /obj/item/ammo_casing/heat_shell(src.loc)
		else if(istype(src.r_hand, /obj/item/gun/projectile/bolter))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/gun/launcher/rcl_rifle(src.loc)
				new /obj/item/ammo_casing/heat_shell(src.loc)
//Skinless
		else if(istype(src.l_hand, /obj/item/reagent_containers/food/snacks/poo) && istype(src.r_hand, /obj/item/flame/candle))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /mob/living/carbon/human/skinless(src.loc)
		else if(istype(src.l_hand, /obj/item/flame/candle) && istype(src.r_hand, /obj/item/reagent_containers/food/snacks/poo))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /mob/living/carbon/human/skinless(src.loc)
//Helmet
		else if(istype(src.l_hand, /obj/item/clothing/head/helmet/culthelm/alt) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/helmet/culthelm/alt2(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/clothing/head/helmet/culthelm/alt))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/helmet/culthelm/alt2(src.loc)
//Helmet
		else if(istype(src.l_hand, /obj/item/clothing/head/heretichood) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/helmet/culthelm(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/clothing/head/heretichood))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/helmet/culthelm(src.loc)
//Helmet
		else if(istype(src.l_hand, /obj/item/clothing/head/helmet/culthelm) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/helmet/culthelm/alt(src.loc)
		else if(istype(src.l_hand, /obj/item/ingots/ironingot) && istype(src.r_hand, /obj/item/clothing/head/helmet/culthelm))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				qdel(src.r_hand)
				new /obj/item/clothing/head/helmet/culthelm/alt(src.loc)
//Boots
		else if(istype(src.l_hand, /obj/item/clothing/shoes/prac_boots))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/clothing/shoes/jackboots(src.loc)
		else if(istype(src.r_hand, /obj/item/clothing/shoes/prac_boots))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/clothing/shoes/jackboots(src.loc)
//Pyre Pistol
		else if(istype(src.l_hand, /obj/item/pyre/self_lit))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/gun/projectile/warfare(src.loc)
		else if(istype(src.r_hand, /obj/item/pyre/self_lit))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/gun/projectile/warfare(src.loc)

//Revolver
		else if(istype(src.l_hand, /obj/item/gun/projectile/warfare) && istype(src.r_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/gun/projectile/automatic/m22/warmonger/fully_auto/nemesis(src.loc)
		else if(istype(src.r_hand, /obj/item/gun/projectile/warfare) && istype(src.l_hand, /obj/item/ingots/ironingot))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/gun/projectile/automatic/m22/warmonger/fully_auto/nemesis(src.loc)

//Revolver Warmonger Ammo
		else if(istype(src.l_hand, /obj/item/ammo_magazine/mc9mmt/machinepistol) && istype(src.r_hand, /obj/item/newore/ironore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.l_hand)
				new /obj/item/ammo_magazine/c45rifle/akarabiner(src.loc)
		else if(istype(src.r_hand, /obj/item/ammo_magazine/mc9mmt/machinepistol) && istype(src.l_hand, /obj/item/newore/ironore))
			playsound(src, 'sound/effects/quotes/cults/tzeentch/ritual.ogg', 100, 0, 20)
			if(do_after(usr,45,src))
				qdel(src.r_hand)
				new /obj/item/ammo_magazine/c45rifle/akarabiner(src.loc)

		else
			to_chat(src, "<font color='#0400ff'>Stand upon my rune with items of one of my recipes for you.</font>")
	else
		to_chat(src, "<font color='#0400ff'>Stand upon my rune with items of one of my recipes for you.</font>")