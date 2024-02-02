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
	if(user.mind.special_role != "nurgle")
		return
	var/datum/component/cultist/comp = user.GetComponent(/datum/component/cultist)
	var/cult_favor = comp.deity_favor
	if (istype(O, /obj/item/organ/external/arm))
		if(cult_favor < 8) //Keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		comp.deity_favor++
		visible_message("The nganga bubbles happily!")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		new /obj/item/diseasedleftarm(src.loc)
		qdel(O)
		return
	else if (istype(O, /obj/item/organ/external/hand/right))
		if(cult_favor < 9)
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
		if(cult_favor < 9) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(33))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			comp.deity_favor++
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
		if(cult_favor < 11) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		comp.deity_favor++ //total is now 12 decay
		visible_message("As the leg falls into the nganga, an absolutely wonderful smell wafts from the cauldron. It smells like you just walked into the bakery near your childhood home.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		qdel(O)
		new /obj/item/diseasedleftleg(src.loc)
	else if(istype(O, /obj/item/reagent_containers/food/snacks/poo))
		if(cult_favor < 12) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(40))
			comp.deity_favor++
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			to_chat(usr, "The nganga bubbles with a renewed fury, you've done it!")
			qdel(O)
		else
			playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
			to_chat(usr, "The nganga bubbles with a bit more life, more poo, it demands!")
			qdel(O)
	else if (istype(O, /obj/item/organ/external/foot/right))
		if(cult_favor < 14)
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
		if(cult_favor < 14) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(75))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			comp.deity_favor++
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
		if(cult_favor < 16)
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
		if(cult_favor < 16) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		if(prob(25))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
			comp.deity_favor++
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
		if(cult_favor < 17)
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The nganga makes a few joyous bubbles, but you feel it needs some else...")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		pleasedeyes = 1
		qdel(O)

	else if (istype(O, /obj/item/organ/external/head))
		if(pleasedeyes == 0)
			to_chat(usr, "<span class='warning'>The eyes first! THE EYES FIRST!</span>")
			return
		if(cult_favor < 17) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		comp.deity_favor++ // 18 decay
		visible_message("The smiling head fills with ichor as it submurges in the vile stew! The eye balls take their place and quickly a head forms before you!")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		qdel(O)
		new /obj/item/diseasedhead(src.loc)
	else if (istype(O, /obj/item/diseasedrightleg))
		if(cult_favor < 18) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The right leg of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		comp.deity_favor++
		rightleg = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedleftleg))
		if(cult_favor < 19) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The left leg of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		comp.deity_favor++
		leftleg = 1
		qdel(O)

	else if (istype(O, /obj/item/diseasedrightarm))
		if(cult_favor < 20) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The right arm of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		comp.deity_favor++
		rightarm = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedleftarm))
		if(cult_favor < 21) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The left arm of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		comp.deity_favor++
		leftarm = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedtorso))
		if(cult_favor < 22) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("The torso of the beast sinks into the ichor.")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		comp.deity_favor++
		torso = 1
		qdel(O)
	else if (istype(O, /obj/item/diseasedhead))
		if(cult_favor < 23) //keeps people from doing this early
			to_chat(usr, "Don't skip around! Feed me what I ask for!")
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //lets not spam
		visible_message("<span class='warning'>The head of the beast sinks into the ichor causing a sudden froth. A mist rises from the nganga with a piercing howl!</span>")
		playsound(usr, 'sound/effects/bubbling_cauldron.ogg', 80, 0, -1)
		comp.deity_favor = 0
		qdel(O)
		sleep(300)
		playsound(src, 'sound/effects/fornurgle.ogg', 80, 0, 4)
		new /mob/living/simple_animal/hostile/abomination(src.loc)
	else if((O.sharp) || istype(O, /obj/item/material/knife/butch) || istype(O, /obj/item/melee/sword))//what items can cut down trees
		visible_message("<span='bnotice'[user] begins to cut apart \the [src]!</span>" )
		playsound(src, 'sound/weapons/pierce.ogg', 100, FALSE)
		if(do_after(user, 110, src))
			qdel(src)
 //so people can repeat if they wanna I guess
		pleasedhand = 0
		pleasedfoot = 0
		pleasedheart = 0
		pleasedeyes= 0