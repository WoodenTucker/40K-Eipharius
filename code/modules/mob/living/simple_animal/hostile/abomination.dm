//For the nurgle path
/mob/living/simple_animal/hostile/abomination
	name = "Abomination" // Path of Nurgle Daemon Summon
	desc = "A hulking, grotesque behemoth of Nurgle!"
	icon = 'icons/mob/critter.dmi'
	icon_state = "vargo"
	icon_living = "vargo"
	icon_dead = "vargo2"
	icon_gib = "vargo2"
	speak = list("COME INTO MY EMBRACE!!","THE LORD OF THE FLIES WELCOMES YOU!!","THE MIGHT OF THE PLAGUEFATHER!!",)
	speak_emote = list("chortles", "roars")
	emote_hear = list("belches","grumbles","vomits")
	emote_see = list("shoots ichor from his syringe", "stomps")
	speak_chance = 5
	turns_per_move = 5
	see_in_dark = 6
	wander = 1
	meat_type = /obj/item/reagent_containers/food/snacks/khornemeat
	meat_amount = 8
	response_help  = "licks"
	response_disarm = "struggles against the mass of"
	response_harm   = "slaps"
	maxHealth = 2500
	health = 2500
	stop_automated_movement_when_pulled = 1 //lets you pull and release your new friend
	melee_damage_lower = 60 // This value does nothing
	melee_damage_upper = 80 // This value does nothing
	harm_intent_damage = 60
	attacktext = "cleaved"
	speed = 0 //ZOOM


	//aboms dont need NO ATMOS
	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/stance_step = 0

	faction = "Nurgle"

/mob/living/simple_animal/hostile/abomination/Life()
	. =..()
	if(!.)
		return


	switch(stance)

		if(HOSTILE_STANCE_TIRED)
			stop_automated_movement = 1
			stance_step++
			if(stance_step >= 5) //rests for 10 ticks
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
						var/action = pick( list( "turns it fat head towards [target_mob]", "stares happily at [target_mob]", "stumbles towards [target_mob]", "closely watches [target_mob]" ) )
						if(action)
							custom_emote(1,action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 2)   //If we have been staring at a mob for 7 ticks,
				stance = HOSTILE_STANCE_ATTACK

		if(HOSTILE_STANCE_ATTACKING)
			if(stance_step >= 900)	//attacks for 20 ticks, then it gets tired and needs to rest
				custom_emote(1, "is worn out and needs to rest." )
				stance = HOSTILE_STANCE_TIRED
				stance_step = 0
				walk(src, 0) //This stops the bear's walking
				return



/mob/living/simple_animal/hostile/abomination/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = user
	..()

/mob/living/simple_animal/hostile/abomination/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = M
	..()

/mob/living/simple_animal/hostile/abomination/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"starts stumbling towards [.]")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/abomination/LoseTarget()
	..(5)

/mob/living/simple_animal/hostile/abomination/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("cleaves [target_mob]") ) )

	var/damage = rand(70,100)

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

//putting this in place if I can figure out how to make players able to do damage as simple animals
//Procs for grabbing players.
/mob/living/simple_animal/hostile/abomination/proc/request_player() //reqs the player
	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can JB shitters
			continue
		if(O.client) //just duh
			question(O.client)

/mob/living/simple_animal/hostile/abomination/proc/question(var/client/C) //asks the questions
	spawn(0)
		if(!C)	return
		var/response = alert(C, "A Nurgle Cultist has created a plague monstrosity and it needs a player! Are you interested?", "Plague Monstrosity", "Yes", "No",)
		if(!C || ckey)
			return
		if(response == "Yes")
			transfer_personality(C)
			src.mind.special_role = "Nurgle Cultist"
			AddInfectionImages()

/mob/living/simple_animal/hostile/abomination/proc/transfer_personality(var/client/candidate) //puts the guy in the place

	if(!candidate)
		return

	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "syndicate"
		sleep (2)


/mob/living/simple_animal/hostile/abomination/proc/AddInfectionImages() //yoinked and reworked for ayylmaos
	if (client)
		for (var/mob/living/simple_animal/hostile/abomination/cultist in SSmobs.mob_list)
			if(cultist.mind && cultist.mind.special_role == "Nurgle Cultist") //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "nurgle")
				client.images += I
	return