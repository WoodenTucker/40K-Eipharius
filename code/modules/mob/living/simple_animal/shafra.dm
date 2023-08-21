/mob/living/simple_animal/hostile/shafra
	name = "Shafra"
	real_name = "Shafra"
	desc = "A Bogani Hunting Dog"
	icon = 'icons/mob/shafra.dmi'
	icon_state = "shafra"
	icon_living = "shafra"
	icon_dead = "shafra_dead"
	maxHealth = 140
	health = 140
	meat_type = /obj/item/reagent_containers/food/snacks/shaframeat
	universal_speak = 1
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "barks"
	response_disarm = "shoves"
	response_harm   = "mauls"
	melee_damage_lower = 25
	melee_damage_upper = 35
	attacktext = "mauls and claws with all its might!"
	maxbodytemp = 1000
	see_in_dark = 10
	wander = 1

	speed = -2

	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/stance_step = 0

	faction = "russian"

/mob/living/simple_animal/hostile/shafra/Life()
	. =..()
	if(!.)
		return


	switch(stance)

		if(HOSTILE_STANCE_TIRED)
			stop_automated_movement = 1
			stance_step++
			if(stance_step >= 10) //rests for 10 ticks
				if(target_mob && target_mob in ListTargets(10))
					stance = HOSTILE_STANCE_ATTACK //If the mob he was chasing is still nearby, resume the attack, otherwise go idle.
				else
					stance = HOSTILE_STANCE_IDLE

		if(HOSTILE_STANCE_ALERT)
			stop_automated_movement = 1
			var/found_mob = 0
			if(target_mob && target_mob in ListTargets(10))
				if(!(SA_attackable(target_mob)))
					stance_step = max(0, stance_step) //If we have not seen a mob in a while, the stance_step will be negative, we need to reset it to 0 as soon as we see a mob again.
					stance_step++
					found_mob = 1
					src.set_dir(get_dir(src,target_mob))	//Keep staring at the mob

					if(stance_step in list(1,4,7)) //every 3 ticks
						var/action = pick( list( "growls at [target_mob]", "stares angrily at [target_mob]", "prepares to attack [target_mob]", "closely watches [target_mob]" ) )
						if(action)
							custom_emote(1,action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 4)   //If we have been staring at a mob for 7 ticks,
				stance = HOSTILE_STANCE_ATTACK

		if(HOSTILE_STANCE_ATTACKING)
			if(stance_step >= 20)	//attacks for 20 ticks, then it gets tired and needs to rest
				custom_emote(1, "is worn out and needs to rest." )
				stance = HOSTILE_STANCE_TIRED
				stance_step = 0
				walk(src, 0) //This stops the bear's walking
				return



/mob/living/simple_animal/hostile/shafra/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = user
	..()

/mob/living/simple_animal/hostile/shafra/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = M
	..()

/mob/living/simple_animal/hostile/shafra/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"stares alertly at [.]")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/shafra/LoseTarget()
	..(5)

/mob/living/simple_animal/hostile/shafra/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(20,30)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L


/mob/living/simple_animal/pig
	name = "Pig"
	desc = "The most common animal on any human farm, known to be just fed and then slaughtered for their meat."
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "pig"
	icon_living = "pig"
	icon_dead = "pig_dead"
	speak = list("oink?","oink","OOOOOINK!")
	speak_emote = list("oinks","oinks hauntingly")
	emote_hear = list("squeals")
	emote_see = list("shakes its head")
	speak_chance = 1 // I'll be honest with you, i really gotta check videos or go to a farm to hear the noises of a pig ? Aint got the time
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/food/snacks/meat/pig
	meat_amount = 6
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 50
	min_gas = null
	max_gas = null
	minbodytemp = 0

/obj/item/reagent_containers/food/snacks/meat/pig
	name = "slab of pork"
	desc = "A big chunk of pork coming from a poor pig. Cook first!"
	sales_price = 8

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		reagents.add_reagent(/datum/reagent/nutriment/protein, 11) // Enough to feed 1 human entirely
		bitesize = 3