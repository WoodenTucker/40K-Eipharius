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
		to_chat(src, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	switch(src.intrigue)
		if(0)
			var/obj/structure/toilet/T = locate() in src.loc
			if(T)
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Well done! You are wittier than I first thought!</font>")
			else
				to_chat(src, "A wily voice pervades your mind. <font color='#0400ff'>Solve 9 of my 999 riddles to start down the path of the deceiver. Sit upon the throne of both kings and beggars.</font>")
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
				to_chat(src, "<font color='#0400ff'>Good... Good! From now on I will only speak to you while you stand upon this rune... Now, for your next riddle.</font>")
			else
				to_chat(src, "I haven't drawn his symbol or I'm not standing directly on it!")
		if(4)
			var/obj/structure/closet/pit/G = locate() in src.loc
			if(G)
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Well done! Maybe you aren't as dim as you appear... Seek me out upon my rune for your next riddle.</font>")
			else
				to_chat(src, "<font color='#0400ff'>You'll find me in a place of stone, Where silence cloaks the ground, Search through all the empty names, And finally I'll be found.</font>")
