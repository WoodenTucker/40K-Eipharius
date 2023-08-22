/mob/living/simple_animal/hostile/tyranid
	name = "tyranid gaunt"
	real_name = "tyranid gaunt"
	desc = "..." //
	icon = 'icons/mob/newmob/xenos.dmi' // Make sure to set this to the icon of whatever new mob you add.
	icon_state = "gaunt"
	icon_living = "gaunt"
	icon_dead = "gauntdead"
	universal_speak = 1
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "slams"
	response_harm   = "claws"

	attacktext = "claws"
	maxbodytemp = 1000
	see_in_dark = 10
	wander = 1

	maxHealth = 300
	health = 300
	resistance = 2
	speed = 1.2 // Higher number means slower.
	melee_damage_lower = 35 // This only effects if controlled by a player.
	melee_damage_upper = 65

	min_gas = null
	max_gas = null
	minbodytemp = 0
	faction = "Tyranids"
	var/stance_step = 0

/mob/living/simple_animal/hostile/tyranid/Life()
	. =..()
	if(!.)
		return

	switch(stance)

		if(HOSTILE_STANCE_TIRED)
			stop_automated_movement = 1
			stance_step++
			if(stance_step >= 1) //rests for 1 ticks
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

					if(stance_step in list(1,2,2)) //every 3 ticks
						var/action = pick( list( "screeches at [target_mob]", "charges at [target_mob]", "sprints at [target_mob]", "closely watches [target_mob]" ) )
						playsound(src, 'sound/effects/quotes/cults/demon/demon_spawn_alert.ogg', 100, 1)
						if(action)
							custom_emote(1,action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 2)   //If we have been staring at a mob for 2 ticks,
				stance = HOSTILE_STANCE_ATTACK
				playsound(src, 'sound/effects/quotes/cults/demon/demon_spawn2.ogg', 100, 1)

		if(HOSTILE_STANCE_ATTACKING)
			if(stance_step >= 10)	//attacks for 10 ticks, then it gets tired and needs to rest
				custom_emote(1, "is worn out and needs to rest." )
				stance = HOSTILE_STANCE_TIRED
				stance_step = 0
				walk(src, 0) //This stops the bear's walking
				return



/mob/living/simple_animal/hostile/tyranid/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 3
		target_mob = user
	..()

/mob/living/simple_animal/hostile/tyranid/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 3
		target_mob = M
	..()

/mob/living/simple_animal/hostile/tyranid/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"stares alertly at [.]")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/tyranid/LoseTarget()
	..(1)

/mob/living/simple_animal/hostile/tyranid/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "rends [target_mob]") ) )

	var/damage = rand(25,55)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_HEAD, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP)
		H.reagents.add_reagent(/datum/reagent/soporific, 1)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L

/////////////////////////////
/////////////////////////////
/////////////////////////////


/mob/living/simple_animal/hostile/tyranid/warrior
	name = "tyranid warrior"
	real_name = "tyranid warrior"
	icon_state = "warrior"
	icon_living = "warrior"
	icon_dead = "warriordead"
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "slams"
	response_harm   = "slashes"

	attacktext = "slashes"

	maxHealth = 500
	health = 500
	resistance = 3
	speed = 1.5 // Higher number means slower.
	melee_damage_lower = 25 // This only effects if controlled by a player.
	melee_damage_upper = 55


/mob/living/simple_animal/hostile/tyranid/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob] with their blade", "slams into [target_mob]") ) )

	var/damage = rand(25,65)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_HEAD, BP_L_HAND, BP_R_HAND)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L

/mob/living/simple_animal/hostile/tyranid/warrior/prime
	name = "tyranid prime"
	real_name = "tyranid prime"
	icon_state = "warrior"
	icon_living = "warrior"
	icon_dead = "warriordead"
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "slams"
	response_harm   = "slashes"

	attacktext = "slashes"

	maxHealth = 700
	health = 700
	resistance = 3
	speed = 1.6 // Higher number means slower.
	melee_damage_lower = 45 // This only effects if controlled by a player.
	melee_damage_upper = 75


/mob/living/simple_animal/hostile/tyranid/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob] with their blade", "slams into [target_mob]") ) )

	var/damage = rand(45,85)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_HEAD, BP_L_HAND, BP_R_HAND)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L
