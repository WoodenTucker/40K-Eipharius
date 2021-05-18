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
			if(istype(src.l_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.l_hand)
				to_chat(src, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				src.rage++

			else if(istype(src.r_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.r_hand)
				to_chat(src, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. <font color='#720202'>You have taken the first step on the path of the Blood God.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				src.rage++
			else
				to_chat(src, "You need a certain type of meat... Something filled with rage and a lust for bloodshed.")
				return
		if(1)
			to_chat(src, "Strength and fury fills your muscles. A feeling begins to grow in your gut, you must fight, you must kill, you must be victorious.")
			STAT_LEVEL(str)+=1
			src.rage++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			src.mind.special_role = "Khorne Cultist"
			src.faction = "Khorne"
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
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Nurgle////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/nurgle()
	set category = "Ruinous Powers"
	set name = "The Path of Nurgle"
	set desc = "In the embrace of great Nurgle, I am no longer afraid."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Nurgle while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(src, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(src, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(src.decay)
		if(0)
			if(istype(src.l_hand, /obj/item/reagent_containers/food/snacks/poo))
				qdel(usr.l_hand)
				to_chat(src, "As if commanded, you raise the feces to your lips. You take a small bite followed by a much larger one. You thought it would be disgusting, but it is actually the most incredible thing you've ever tasted. As it enters your stomach you feel it changing you, the lord of flies voice jovially rings out in your ears. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/fornurgle.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				src.decay++
			else if(istype(src.r_hand, /obj/item/reagent_containers/food/snacks/poo))
				qdel(usr.r_hand)
				to_chat(src, "As if commanded, you raise the feces to your lips. You take a small bite followed by a much larger one. You thought it would be disgusting, but it is actually the most incredible thing you've ever tasted. As it enters your stomach you feel it changing you, the lord of flies voice jovially rings out in your ears. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/fornurgle.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				src.decay++
			else
				to_chat(src, "For some reason you have always been drawn to disgusting things. Find the most vile thing you can think of and hold it in your hand.")
				return
		if(1)
			src.decay++
			STAT_LEVEL(end) +=1
			src.verbs -= list(/mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			to_chat(src, "The voice of gentle grandfather fills your inner mind. You cannot see him, but you feel the warmth of his smile. It is calming, it is pleasing. You want to listen to what he has to say, to sit like a child before a wise elder telling tales of his youth.")
			src.mind.special_role = "Nurgle Cultist"
			AddInfectionImages()
			src.faction = "Nurgle"
		if(2)
			src.decay++
			GLOB.nurgle_cult++
			src.verbs += /mob/living/carbon/human/proc/nurglerune
			to_chat(src, "He tells you story after story, some make you laugh, some make you cry and some make you stare in wonder. Before he departs he fills your mind with a symbol. It is quite pleasant. Maybe if I draw this symbol I can speak to him again.")
		if(3)
			var/obj/effect/decal/cleanable/nurgle/T = locate() in src.loc
			if(T)
				src.decay++
				to_chat(src, "Standing upon this rune fills me with warmth, like standing before a roaring fireplace. <font color='#03420e'>His voice returns at once, its clear he is pleased. He greets me like a returning child.</font> I am eager to please.")
			else
				to_chat(src, "I must draw his symbol and stand upon it!")
				return
		if(4)
			src.decay++
			to_chat(src, "There will be no stories this time. He has a request for me. I want to please him, I want him to prove to him my worth. To communicate with him I will need to stand upon his symbol.")
		if(5)
			var/obj/effect/decal/cleanable/nurgle/T = locate() in src.loc
			var/mob/living/simple_animal/hostile/retaliate/rat/Q = locate() in T.loc
			if(T && Q)
				src.decay++
				src.happiness += 5
				src.nogross = 1 //makes you love da stink
				src.set_trait(new/datum/trait/death_tolerant) //no more getting spooked
				STAT_LEVEL(end) += 1
				playsound(src, 'sound/effects/fornurgle.ogg', 50, 0, -1)
				to_chat(src, "It is done. I gingerly laid the corpse of his child upon the mark. With a faint flash it is gone. <font color='#03420e'>That familiar warmth returns like a hug.</font> ")
				qdel(Q)
			else if(!Q)
				to_chat(src, "He requires something of me. He asked me to bring him one of his children, a rat. He asked me to kill it and place it upon his mark. <font color='#03420e'>He has grand designs for me, but they all start with one small step.</font>")
				return
		if(6)
			src.decay++
			to_chat(src, "<font color='#03420e'>Well done my acolyte. You have taken an important step by returning this child to me. Next, you will concoct a irresistibly infectious brew to bring my children to life! Get somewhere away from onlookers and call out to me again!</font>")
			return
		if(7)
			new /obj/structure/nganga(src.loc)
			to_chat(src, "<font color='#03420e'>Use this nganga to create life! Hide it somewhere away from the prying eyes of the Inquisiton or it will surely be your downfall!</font>")
			src.decay++
			return
		if(8)
			to_chat(src,"<span class='warning'>The nganga hungers... Feed it and it will build you a champion in His image! LEFT ARM it hisses! FEED ME!</span>" )
			return
		if(9)
			to_chat(src, "<span class='warning'> Take your reward and store it! You will need it later. The nganga bubbles happily and spits out another request! Right hand! It must be made stronger! Include syringes in the mix until it is pleased!</span>")
			return
		if(10)
			to_chat(src, "<span class='warning'>The arms have been formed... The nganga grows in power and blesses you with a gift!</span>")
			STAT_LEVEL(end) +=1
			STAT_LEVEL(str) +=1
			src.decay++
			return
		if(11)
			to_chat(src, "<span class='warning'> Now we must create the legs on which this pox will walk. Feed the nganga a left leg! </span>")
			return
		if(12)
			to_chat(src,"<span class='warning'> The grandfatherly voice returns with a chuckle... Another task complete my child! Well done! The nganga is low on material you must embue it with life! Place more poo into the nganga and refill its stores!</span>" )
			return
		if(13)
			to_chat(src, "<span class='warning'> You've done it! The nganga is revived and reloaded. Now for the other leg. This one requires a bit more...</span>")
			src.decay++
			return
		if(14)
			to_chat(src, "<span class='warning'>Place a right foot into the nganga and combine it with rat meat! </span>")
			return
		if(15)
			to_chat(src, "<span class='warning'>Well done! You are nearly there my child! Next on the list is the torso, this will hold the beating heart of the coming plague... </span>")
			src.decay++
			return
		if(16)
			to_chat(src, "<span class='warning'>Place into the nganga a heart with which to fuel this putrid pestilence and with it stir in logs to serve as its bones! </span>")
			return
		if(17)
			to_chat(src, "<span class='warning'> Now for the final piece, a carved pumpkin head and pair of eyes to guide it.</span>")
			return
		if(18)
			to_chat(src, "<span class='warning'> You have everything you need my child. The nganga is beyond pleased. Place the pieces of my servant into the nganga and bring him to life. Place them in this order! Right leg, left leg, right arm, left arm, torso, head!</span>")
			return
		if(19)
			to_chat(src, "<span class='warning'> Now the left leg...</span>")
			return
		if(20)
			to_chat(src, "<span class='warning'> Now the right arm...</span>")
			return
		if(21)
			to_chat(src, "<span class='warning'> Now the left arm...</span>")
			return
		if(22)
			to_chat(src, "<span class='warning'> Now the torso...</span>")
			return
		if(23)
			to_chat(src, "<span class='warning'> Finally, the head...</span>")
			return
		if(24)
			to_chat(src, "<font color='#03420e'>You've brought my harbinger to this world... You've earned your place amongst my children. Repeat the ritual as many times as you can! (End of current Nurgle path)</font>")
			src.decay = 8
			return


/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Slaanesh//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/slaanesh()
	set category = "Ruinous Powers"
	set name = "The Path of Slaanesh"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>") //notice I removed restraint requirement. A lil bdsm never stopped a slaaneshi boy
		return
	if(rage > 0)
		to_chat(src, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(src, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(src.lust)
		if(0)
			if(istype(src.l_hand, /obj/item/reagent_containers/pill/happy))
				qdel(usr.l_hand)
				to_chat(src, "You crack open the obscura instead of taking it orally, you snort the contents all at once. Sheer bliss courses through your neurons. Your mind has been opened to unfathomable depths of ecstasy. You feel his call for more. You have taken the first step on the path of the Dark Prince. You are not yet visibly corrupted but avoid detailed investigation. ")
				playsound(src, 'sound/effects/slaanesh1.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				src.lust++
			else if(istype(src.r_hand, /obj/item/reagent_containers/pill/happy))
				qdel(usr.r_hand)
				to_chat(src, "You crack open the obscura instead of taking it orally, you snort the contents all at once. Sheer bliss courses through your neurons. Your mind has been opened to unfathomable depths of ecstasy. You feel his call for more. You have taken the first step on the path of the Dark Prince. You are not yet visibly corrupted but avoid detailed investigation. ")
				playsound(src, 'sound/effects/slaanesh1.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				src.lust++
			else
				to_chat(src, "You love to get high... To experience true bliss and excess. Seek out the scum of this planet, maybe they will have something that could expand your mind. Don't take it orally, make sure to snort it all at once.")
				return
		if(1)
			to_chat(src, "Your body is flooded with the knowledge of excess and pleasure. The Dark Prince's voice is faint but you can make out some commands. Every fiber in your body is flooded with pleasure that fades as fast as it arrives. You want more, you need more.")
			STAT_LEVEL(dex)+=1
			src.lust++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/tzeentch)
			src.mind.special_role = "Slaanesh Cultist"
			AddInfectionImages()
			src.faction = "Slaanesh"
		if(2)
			src.verbs += /mob/living/carbon/human/proc/slaaneshrune
			to_chat(src, "His command is clear. I must have that feeling of ecstasy again. I will obey. His symbol fills my mind, I see it when I close my eyes. I must find a place to draw it, I must honor him.")
			src.lust++
			GLOB.slaanesh_cult++
		if(3)
			var/obj/effect/decal/cleanable/slaanesh/T = locate() in src.loc
			if(T)
				src.lust++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "Yes! YES! He is pleased, the feeling returns for mere moments. Every pleasure is experienced at once to its absolute pinnacle. Yet again it fades with a sinister laugh. He needs more, I must continue to serve.")
			else
				to_chat(src, "I must draw xer symbol and stand upon it!")
				return
		if(4)
			playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
			src.lust++
			to_chat(src, "Submitting to them fills your body with pleasure. They speak to you, command you and you obey. The first command comes in a deep baritone voice as a small knife materializes at your feet. <font color='#800080'>You've done well... You may have potential... How would you like to attend a party I'm throwing?</font>")
			new /obj/item/material/sword/skinning_knife(src.loc)
			return
		if(5)
			to_chat(src, "<font color='#800080'>The party is a masquerade! That means you need a mask and not just any will do! You require a mask made from human skin! Take my gift and harvest your materials from a dead body...</font> <font color='#b60c00'> The voice switches genders between words effortlessly and leaves you with some final advice.</font><font color='#800080'> Do build a tanning rack, you should be able to whittle one out of the logs strewn about this world. No one wants a soggy mask... When you have the tanned hide, try my knife on it and carve yourself a new face so that the world may never find you...</font> ")
			src.lust++
			return
		if(6)
			for(var/obj/item/clothing/mask/masquerade/X in src.contents)
				if(X.slan == 1)
					playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
					src.lust++
					to_chat(src, "<font color='#800080'> Brilliant! That looks marvelous. My child, I never did tell you what sort of party this is... You will need a toy of sorts, something to entertain my many guests!</font>")
					STAT_LEVEL(dex) += 2
					return
				else
					to_chat(src, "If it's a masquerade, I'll need a mask...")
					return

			to_chat(src, "If it's a masquerade, I'll need a mask...")
		if(7)
			to_chat(src, "<font color='#800080'>A lash should spice things up! Get some more tanned skin and a handle. How about an arm? That would certainly be macabre! Perfect for the theme! Wrap that hide around an arm, I'll take care of the rest.</font>")
			src.lust++
		if(8)
			for(var/obj/item/melee/whip/lashoftorment/X in src.contents)
				if(X.slan == 1)
					playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
					src.lust++
					STAT_LEVEL(dex) += 1
					to_chat(src, "<font color='#800080'>Just a moment... How wonderful! That lash is an extension of myself, I can feed off of the suffering it brings. It's sure to be a hit! </font>")

			to_chat(src, "Tanned skin and an arm... Combine the two and I'll be one step closer to the party. How fun!")
		if(9)
			to_chat(src, "<font color='#800080'>A mask and a lash, kinky! You're nearly ready! You weren't planning on wearing those clothes though, were you? How drab? They are lacking in luster and elegance one would expect! Let's work on your threads, get some tanned hide, (sensing a theme?) and a few spools of cloth, put them together and let me go to work!</font>")
			src.lust++
		if(10)
			for(var/obj/item/clothing/suit/armor/slanclothing/X in src.contents)
				if(X.slan == 1)
					playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
					STAT_LEVEL(str) += 1
					to_chat(src, "<font color='#800080'>Oh you look wonderful! Now you would fit right in!</font>")
					src.lust++


			to_chat(src, "More skin... I need more skin. I overheard some of the Tech-priests purchasing cloth from the munitorum earlier...")
		if(11)
			to_chat(src, "<font color='#800080'>You do know its proper to bring favors, yes? I'm not talking amasec or obscura, we indulge in something much sweeter... SUFFERING! Bring me, say, 100 units of suffering and we shall call that sufficient! (Check Ruinous Powers tab to pay your tithe!)</font>")
			src.verbs += list(/mob/living/carbon/human/proc/painpayment,)
		if(12)
			to_chat(src, "<font color='#800080'>A bit of bondage is nothing for my followers, grant me a taste of that succulent suffering and I shall make it so no chains can bind you.</font>")
			src.lust++
		if(13)
			to_chat(src, "<font color='#800080'>Now for one of my favorite party tricks, put on the mask and outfit and I will show it to you!</font>")
			src.lust++
		if(14)
			if(istype(wear_mask, /obj/item/clothing/mask/masquerade) && istype(wear_suit, /obj/item/clothing/suit/armor/slanclothing)) //hijacking this to give creepo noises
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				STAT_LEVEL(str) += 1
				STAT_LEVEL(dex) += 1
				to_chat(src, "<font color='#800080'>You feel it too, don't you? Stronger, more agile, more powerful. Will yourself to change and you can, offer me their suffering and in exchange you will feel nothing but the most intense of pleasures.</font>")
				src.verbs += /mob/living/carbon/human/proc/slannyarm
				src.lust++
			else
				to_chat(src, "I need to equip both my masquerade mask and macabre clothing!")
				return













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



////////////////////////////////////////
////////////////Altar/rune making//////
//////////////////////////////////////
/mob/living/carbon/human/proc/nurglerune()
	set category = "Ruinous Powers"
	set name = "Nurgle Rune"
	set desc = "In the embrace of great Nurgle, I am no longer afraid."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You can't draw a rune while restrained.")	//user is tied up
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	isdrawing = 1
	if(decay >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/nurgle(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		isdrawing = 0
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return




/mob/living/carbon/human/proc/slaaneshrune()
	set category = "Ruinous Powers"
	set name = "Slaanesh Rune"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't draw runes when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You can't draw a rune while restrained.")	//user is tied up
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	isdrawing = 1
	if(lust >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/slaanesh(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		isdrawing = 0
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return

/mob/living/carbon/human/proc/khornerune()
	set category = "Ruinous Powers"
	set name = "Khorne Rune"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't draw a rune when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src,"You can't draw a rune while restrained.")	//user is tied up
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	isdrawing = 1

	if(rage >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/khorne(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		isdrawing = 0
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return

/mob/living/carbon/human/proc/tzeentchrune()
	set category = "Ruinous Powers"
	set name = "Tzeentch Rune"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src,"You can't draw a rune while restrained.")	//user is tied up
		return
	isdrawing = 1
	if(intrigue >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/tzeentch(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		isdrawing = 0
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return

//////////////////icons above  mob showing cult/////////////

/mob/living/carbon/human/proc/AddInfectionImages() //yoinked and reworked for ayylmaos
	if (client)
		for (var/mob/living/carbon/human/cultist in SSmobs.mob_list)
			if(cultist.mind && cultist.mind.special_role == "Khorne Cultist" && rage >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "khorne")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Slaanesh Cultist" && lust >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "slaanesh")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Nurgle Cultist" && decay >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "nurgle")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Tzeentch Cultist" && intrigue >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "tzeentch")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Mercenary") //unrelated to the above, its for merc hiring.
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "merc")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Tyranid" && gsc >= 1) //genestealer cult/tyranid converts
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "genestealer")
				client.images += I
	return


/mob/living/carbon/human/Login() //so they can get it on login if they dc or somethin
	..()
	AddInfectionImages()
	return


//this is for Nurgle abom making
/obj/structure/nganga
	name = "festering nganga"
	desc = "This bubbling cauldron smells of rot and seems to hiss as you approach. It seems alive in its own way."
	icon = 'icons/obj/nganga.dmi'
	item_state = "nganga"
	icon_state = "nganga"
	density = 1
	anchored = 0
	add_fingerprint(usr)
	add_fibers(usr)
	var/leftarm = 0
	var/rightarm = 0
	var/leftleg = 0
	var/rightleg = 0
	var/torso = 0
	var/head = 0
	var/pleasedhand = 0
	var/pleasedfoot = 0
	var/pleasedheart = 0
	var/pleasedeyes= 0

/obj/structure/nganga/attackby(var/obj/item/O, var/mob/living/carbon/human/user) //These manage feedings the nganga
	if (!(istype(O, /obj/item/)))
		to_chat(user, "<span class='warning'>[O] is not what I asked for!</span>")
		return 1
	/*
	if(user.decay < 6)
		to_chat(user, "You wouldn't even begin to know what this is...")
		return*/
	else if (istype(O, /obj/item/organ/external/arm))
		if(user.decay < 8 ) //Keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		user.decay++ //total is now 9 decay
		visible_message("The nganga bubbles happily!")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		new /obj/item/diseasedleftarm(src.loc)
		qdel(O)
		return
	else if (istype(O, /obj/item/organ/external/hand/right))
		if(user.decay < 9 )
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The nganga makes a few joyous bubbles, but you feel it needs some else...")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		pleasedhand = 1
		qdel(O)
		return
	else if (istype(O, /obj/item/reagent_containers/syringe))
		if(pleasedhand == 0)
			to_chat(usr, "<span class='warning'>The hand first! THE HAND FIRST!</span>")
			return
		if(user.decay < 9 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(33))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			user.decay++ //total is now 10 decay
			visible_message("The syringes mix and slosh around the hand, they seemingly worm their way inside beneath the tendons until the hand begins to resemble that of a large syringe extending up into a shoulder joint!")
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			qdel(O)
			new /obj/item/diseasedrightarm(src.loc)
		else
			qdel(O)
			visible_message("The syringe is added to the mix, the nganga lets off a hiss of approval but it was not enough, more syringes!")
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			return
	else if (istype(O, /obj/item/organ/external/leg))
		if(user.decay < 11 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		user.decay++ //total is now 12 decay
		visible_message("As the leg falls into the nganga, an absolutely wonderful smell wafts from the cauldron. It smells like you just walked into the bakery near your childhood home.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		qdel(O)
		new /obj/item/diseasedleftleg(src.loc)
	else if(istype(O, /obj/item/reagent_containers/food/snacks/poo))
		if(user.decay < 12 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(40))
			user.decay++ //total is now 13
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			to_chat(usr, "The nganga bubbles with a renewed fury, you've done it!")
			qdel(O)
		else
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			to_chat(usr, "The nganga bubbles with a bit more life, more poo, it demands!")
			qdel(O)
	else if (istype(O, /obj/item/organ/external/foot/right))
		if(user.decay < 14 )
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The nganga makes a few joyous bubbles, but you feel it needs some else...")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		pleasedfoot = 1
		qdel(O)
	else if (istype(O, /obj/item/reagent_containers/food/snacks/meat/rat_meat))
		if(pleasedfoot == 0)
			to_chat(usr, "<span class='warning'>The foot first! THE FOOT FIRST!</span>")
			return
		if(user.decay < 14 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(75))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			user.decay++ //total is now 15 decay
			visible_message("The rat meat mixes and sloshes around the foot, the meat seems to come alive, wrappping around the human foot and turning it into something far more foul!")
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			qdel(O)
			new /obj/item/diseasedrightleg(src.loc)
		else
			qdel(O)
			visible_message("The rat meat is added to the mix, the nganga lets off a hiss of approval but it was not enough, more meat!")
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			return
	else if (istype(O, /obj/item/organ/internal/heart))
		if(user.decay < 16 )
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The nganga makes a few joyous bubbles, but you feel it needs some else...")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		pleasedheart = 1
		qdel(O)
	else if (istype(O, /obj/item/stack/logs))
		var/obj/item/stack/logs/S = O
		if(pleasedheart == 0)
			to_chat(usr, "<span class='warning'>The heart first! THE HEART FIRST!</span>")
			return
		if(user.decay < 16 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(25))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			user.decay++ //total is now 17 decay
			visible_message("The wood rots and twists in the bubbling stew. The warped wood begins to form what appears to be a ribcage around the once again beating heart!")
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			S.amount-=1
			S.update_icon()
			new /obj/item/diseasedtorso(src.loc)
		else
			S.amount -=1
			S.update_icon()
			visible_message("The logs are added to the mix, the nganga lets off a hiss of approval but it was not enough, more wood!")
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			return
	else if (istype(O, /obj/item/organ/internal/eyes))
		if(user.decay < 17 )
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The nganga makes a few joyous bubbles, but you feel it needs some else...")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		pleasedeyes = 1
		qdel(O)

	else if (istype(O, /obj/item/clothing/head/pumpkinhead))
		if(pleasedeyes == 0)
			to_chat(usr, "<span class='warning'>The eyes first! THE EYES FIRST!</span>")
			return
		if(user.decay < 17 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		user.decay++ //total is now 18 decay
		visible_message("The smiling pumpkin head fills with ichor as it submurges in the vile stew! The eye balls take their place and quickly a head forms before you!")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		qdel(O)
		new /obj/item/diseasedhead(src.loc)
	else if (istype(O, /obj/item/diseasedrightleg))
		if(user.decay < 18 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The right leg of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		user.decay++
		rightleg = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedleftleg))
		if(user.decay < 19 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The left leg of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		user.decay++
		leftleg = 1
		qdel(O)

	else if (istype(O, /obj/item/diseasedrightarm))
		if(user.decay < 20 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The right arm of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		user.decay++
		rightarm = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedleftarm))
		if(user.decay < 21 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The left arm of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		user.decay++
		leftarm = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedtorso))
		if(user.decay < 22 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The torso of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		user.decay++
		torso = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedhead))
		if(user.decay < 23 ) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("<span class='warning'>The head of the beast sinks into the ichor causing a sudden froth. A mist rises from the nganga with a piercing howl!</span>")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		user.decay++
		qdel(O)
		sleep(300)
		playsound(src, 'sound/effects/fornurgle.ogg', 80, 0, 4)
		new /mob/living/simple_animal/hostile/abomination(src.loc)
 //so people can repeat if they wanna I guess
		pleasedhand = 0
		pleasedfoot = 0
		pleasedheart = 0
		pleasedeyes= 0

//Slaanesh pain payment
/mob/living/carbon/human/proc/painpayment()
	set category = "Ruinous Powers"
	set name = "Offer Suffering"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>") //notice I removed restraint requirement. A lil bdsm never stopped a slaaneshi boy
		return
	if(src.slanpain < 100)
		to_chat(src, "<span class='notice'>it's not enough! I need more suffering!</span>")
		return
	else
		to_chat(src, "<font color='#800080'>Delicious! Oh how wonderful, its rare to taste suffering this fresh, my guests will be overjoyed! You've done so well, I simply must reward you.</font>")
		src.verbs -= /mob/living/carbon/human/proc/painpayment
		src.verbs += /mob/living/carbon/human/proc/bdsmescape
		src.lust++
		src.slanpain -=100
		playsound(src, 'sound/effects/slanlaugh.ogg', 80, 0, -1)
		playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
		return

/mob/living/carbon/human/proc/bdsmescape()
	set category = "Ruinous Powers"
	set name = "Restraint Escape (20)"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	if(!src.restrained())
		to_chat(src, "<span class='notice'>You aren't restrained!</span>")
		return
	if(src.slanpain < 20)
		to_chat(src, "<span class='notice'>I don't have enough suffering to call upon my host!</span>")
		return
	else if((src.handcuffed) && (istype(src.handcuffed, /obj/item/handcuffs)))
		visible_message("[src] slips their bindings!")
		src.slanpain -=20
		src.handcuffed = null
		if(src.buckled && src.buckled.buckle_require_restraints)
			src.buckled.unbuckle_mob()
		src.update_inv_handcuffed()
		return

/mob/living/carbon/human/proc/slannyarm()
	set category = "Ruinous Powers"
	set name = "Mutate Arm (20)"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/material/sword/slanarm)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'>  [usr] speedily transforms their arm back to normal!</span>", "<span class='notice'>Your arm changes back to normal!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
			for(var/datum/species/X)
				X.slowdown = 0
		if(istype(usr.r_hand, /obj/item/material/sword/slanarm)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] speedily transforms their arm back to normal!</span>", "<span class='notice'>Your arm changes back to normal!</span>", "<span class='warning>What was that sound?</span>")
			for(var/datum/species/X)
				X.slowdown = 0
		src.icon_state = initial(icon_state)
		to_chat(usr,"You hide your mutated arm!")
		src.is_toggled = 1
	else if(src.slanpain < 20)
		to_chat(src, "<span class='notice'>You don't have enough suffering!</span>")
		return
	else
		visible_message("[src]'s arm rapidly mutates into a terrifying blade!")
		usr.put_in_hands(new /obj/item/material/sword/slanarm(usr))
		src.is_toggled = 2
		src.slanpain -=20
		for(var/datum/species/X) //this is one of those things that absolutely shouldn't work, but does. For some reason, this is the only way I've found to increase move speed.
			X.slowdown = -1