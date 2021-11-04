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
	else if((O.sharp) || istype(O, /obj/item/material/knife/butch) || istype(O, /obj/item/material/sword))//what items can cut down trees
		visible_message("<span='bnotice'[user] begins to cut apart \the [src]!</span>" )
		playsound(src, 'sound/weapons/pierce.ogg', 100, FALSE)
		if(do_after(user, 110, src))
			qdel(src)
 //so people can repeat if they wanna I guess
		pleasedhand = 0
		pleasedfoot = 0
		pleasedheart = 0
		pleasedeyes= 0