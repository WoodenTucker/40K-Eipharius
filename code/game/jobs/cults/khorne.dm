/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Khorne////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
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
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(src, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(src.rage)
		if(0)
			if(istype(src.l_hand, /obj/item/organ/external/head) && istype(src.r_hand, /obj/item/organ/internal/heart))
				qdel(usr.l_hand)
				to_chat(src, "You bring your first skull to the Skull Throne and heart to the Blood God. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				src.rage++
			else if(istype(src.r_hand, /obj/item/organ/external/head) && istype(src.l_hand, /obj/item/organ/internal/heart))
				qdel(usr.r_hand)
				to_chat(src, "You bring your first skull to the Skull Throne and heart to the Blood God. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				src.rage++
			else
				to_chat(src, "Bring me your first skull and heart of your enemy, mortal, and prove your worship to strength and honor of battle.")
				return
		if(1)
			to_chat(src, "Strength and fury fills your muscles. A feeling begins to grow in your gut, you must fight, you must kill, you must be victorious.")
			if(src.STAT_LEVEL(str)>12)
				src.STAT_LEVEL(str)+=3
			else if(src.STAT_LEVEL(str)<10)
				src.STAT_LEVEL(str)+=4
			if(src.SKILL_LEVEL(melee)>4)
				src.SKILL_LEVEL(melee)+=1
			else if (src.SKILL_LEVEL(melee)<4)
				src.SKILL_LEVEL(melee)=4
			src.rage++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			src.mind.special_role = "Khorne Cultist"
			src.faction = "Khorne"
			src.verbs += list(/mob/living/carbon/human/proc/bludforbludguy)
			AddInfectionImages()
		if(2)
			src.verbs += /mob/living/carbon/human/proc/khornerune
			to_chat(src, "Hatred, rage and fury like you've never known consume your mind and block out your every thought. Flashes of a symbol appear in your mind. You feel compelled to draw it.")
			src.rage++
			GLOB.khorne_cult++
		if(3)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(T)
				src.rage++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "This... is it. That symbol. Just the sight of it quickens your heart and pumps adrenaline through your veins. <font color='#720202'>You can hear his voice more clearly now.</font>")
			else
				to_chat(src, "I must draw his symbol and stand upon it!")
				return
		if(3)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(istype(src.l_hand, /obj/item/organ/external/head))
				qdel(usr.l_hand)
				to_chat(src, "You bring one more skull to the Skull Throne.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				if(STAT_LEVEL(end)<20)
					STAT_LEVEL(end) +=1
				src.update_inv_l_hand()
				if(src.SKILL_LEVEL(melee)<6)
					src.SKILL_LEVEL(melee)+=1
				if(STAT_LEVEL(int)>10)
					STAT_LEVEL(int)-=1
			else if(istype(src.r_hand, /obj/item/organ/external/head))
				qdel(usr.r_hand)
				to_chat(src, "You bring one more skull to the Skull Throne .")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				if(STAT_LEVEL(end)<20)
					STAT_LEVEL(end) +=1
				src.update_inv_r_hand()
				if(src.SKILL_LEVEL(melee)<6)
					src.SKILL_LEVEL(melee)+=1
				if(STAT_LEVEL(int)>10)
					STAT_LEVEL(int)-=1
			else if(istype(src.l_hand, /obj/item/organ/internal/heart))
				if(STAT_LEVEL(str)<18)
					qdel(usr.l_hand)
					to_chat(src, "You bring more blood for the Blood God.")
					playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
					src.update_inv_l_hand()
					STAT_LEVEL(str) +=1
				if(STAT_LEVEL(str)<17)
					to_chat(src, "That was your last strength improvement.")
				if(STAT_LEVEL(str)>18)
					to_chat(src, "You're too strong to gain power with mortal's blood.")
				if(src.SKILL_LEVEL(ranged)<5)
					src.SKILL_LEVEL(ranged)+=1
				if(STAT_LEVEL(dex)<15)
					STAT_LEVEL(dex)+=1
			else if(istype(src.r_hand, /obj/item/organ/internal/heart))
				if(STAT_LEVEL(str)<18)
					qdel(usr.r_hand)
					to_chat(src, "You bring more blood for the Blood God.")
					playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
					src.update_inv_r_hand()
					STAT_LEVEL(str) +=1
				if(STAT_LEVEL(str)<17)
					to_chat(src, "That was your last strength improvement.")
				if(STAT_LEVEL(str)>18)
					to_chat(src, "You're too strong to gain power with mortal's blood.")
				if(src.SKILL_LEVEL(ranged)<5)
					src.SKILL_LEVEL(ranged)+=1
				if(STAT_LEVEL(dex)<15)
					STAT_LEVEL(dex)+=1
			else if(istype(src.l_hand, /obj/item/stack/teeth) && istype(src.r_hand, /obj/item/material/sword/combat_knife))
				qdel(usr.l_hand)
				src.update_inv_l_hand()
				qdel(usr.r_hand)
				src.update_inv_r_hand()
			else if(istype(src.r_hand, /obj/item/stack/teeth) && istype(src.l_hand, /obj/item/material/sword/combat_knife) && T)
				qdel(src.r_hand)
				src.update_inv_r_hand()
				qdel(src.l_hand)
				src.update_inv_l_hand()
				switch(rand(1,8))
					if(1)
						new /obj/item/material/sword/choppa(src.loc)
					if(2)
						new /obj/item/material/sword/cane(src.loc)
					if(3)
						new /obj/item/material/sword/combat_knife/catachan(src.loc)
					if(4)
						new /obj/item/melee/classic_baton/trench_club(src.loc)
					if(5)
						new /obj/item/melee/trench_axe(src.loc)
					if(6)
						new /obj/item/melee/baton/loaded(src.loc)
					if(7)
						new /obj/item/melee/mercycs(src.loc)
					if(8)
						new /obj/item/gun/projectile/shotgun/pump/shitty/bayonet(src.loc)
			else
				to_chat(src, "Bring me next skull for health or the heart for strength, mortal. Bring me tooth and knife upon my rune to gain weapon")
				return
/
/mob/living/carbon/human/proc/bludforbludguy()
	set name = "Blood for the Blood God!"
	set category = "Ruinous Powers"
	set desc = "BLOOD FOR THE BLOOD GOD!"

	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return

	if(src.khorne_cd == 0)
		src.say("Blood for the Blood God!")
		playsound(src, 'sound/effects/khorne.ogg', 80, 0, 3)
		src.khorne_cd = 1
		sleep(100)
		src.khorne_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return