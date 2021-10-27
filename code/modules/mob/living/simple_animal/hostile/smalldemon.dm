/mob/living/simple_animal/hostile/smalldemon
	name = "Lesser Daemon"
	real_name = "Lesser Daemon"
	desc = "A disgusting horror of the warp." // Fast moving daemon. Deadly in large mobs, especially against unarmored humans.
	icon = 'icons/mob/Demon.dmi' // Make sure to set this to the icon of whatever new mob you add.
	icon_state = "demon"
	icon_living = "demon"
	icon_dead = "demon_dead"
	maxHealth = 200
	health = 200 
	universal_speak = 1
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	melee_damage_lower = 10 // This does nothing - you must use var/damage in the script below.
	melee_damage_upper = 30
	attacktext = "claws"
	maxbodytemp = 1000
	see_in_dark = 10
	wander = 1

	speed = 1.5 // Higher number means slower.

	min_gas = null
	max_gas = null
	minbodytemp = 0
	faction = "Chaos"
	var/stance_step = 0

/mob/living/simple_animal/hostile/smalldemon/Life()
	. =..()
	if(!.)
		return

	switch(stance)

		if(HOSTILE_STANCE_TIRED)
			stop_automated_movement = 1
			stance_step++
			if(stance_step >= 5) //rests for 5 ticks
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
						var/action = pick( list( "growls at [target_mob]", "stares angrily at [target_mob]", "prepares to attack [target_mob]", "closely watches [target_mob]" ) )
						if(action)
							custom_emote(1,action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 2)   //If we have been staring at a mob for 7 ticks,
				stance = HOSTILE_STANCE_ATTACK

		if(HOSTILE_STANCE_ATTACKING)
			if(stance_step >= 50)	//attacks for 30 ticks, then it gets tired and needs to rest
				custom_emote(1, "is worn out and needs to rest." )
				stance = HOSTILE_STANCE_TIRED
				stance_step = 0
				walk(src, 0) //This stops the bear's walking
				return



/mob/living/simple_animal/hostile/smalldemon/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = user
	..()

/mob/living/simple_animal/hostile/smalldemon/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = M
	..()

/mob/living/simple_animal/hostile/smalldemon/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"stares alertly at [.]")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/smalldemon/LoseTarget()
	..(5)

/mob/living/simple_animal/hostile/smalldemon/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(45,60)

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

/mob/living/simple_animal/hostile/smalldemon/zygote
	name = "Zygote" // Slow speed. Low HP and medium burn damage.
	real_name = "Zygote"
	desc = "This grotesque horror of flesh and acid lurches towards you." // Zygotes are only deadly in large numbers due to their slow speed but deal high burn damage.
	meat_amount = 1
	icon = 'icons/mob/animal.dmi'
	icon_state = "floater"
	icon_living = "floater"
	icon_dead = "floater2"
	maxHealth = 250
	health = 250
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "sloshes"
	see_in_dark = 6

	speed = 1.8

/mob/living/simple_animal/hostile/smalldemon/zygote/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("sloshes at [target_mob]", "pulls [target_mob]") ) ) // attack emotes

	var/damage = rand(45,65) // Damage Value

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE) // damage type 
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L

/mob/living/simple_animal/hostile/smalldemon/bubblingmass
	name = "Grotesque Horror" // Slow speed. High damage and HP.
	real_name = "Grotesque Horror"
	desc = "This violet bubbling mass of flesh and meat crawls toward you." // Bubbling masses similar to Zygotes are slow and more deadly in caves/dungeons. 
	icon = 'icons/mob/animal.dmi'
	icon_state = "oormat"
	icon_living = "oormat"
	icon_dead = "oormat2"
	maxHealth = 700
	health = 700
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "crushes"
	see_in_dark = 6

	speed = 1.7

/mob/living/simple_animal/hostile/smalldemon/bubblingmass/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("bites at [target_mob]", "crushes [target_mob]") ) ) // attack emotes

	var/damage = rand(55,75) // Damage Value

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE) // damage type 
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L

/mob/living/simple_animal/hostile/smalldemon/bloodletter
	name = "Bloodletter"
	real_name = "Bloodletter"
	desc = "This terrifying behemoth of rippling muscle and sinew eminates an aura of pure malice. It gazes at you with starving eyes and an intimate desire to rend the flesh from bone." // Bubbling masses similar to Zygotes are slow and more deadly in caves/dungeons. 
	icon = 'icons/mob/animal.dmi'
	icon_state = "khorne_daemon" // Average speed. High damage and HP.
	icon_living = "khorne_daemon"
	icon_dead = "khorne_daemon_dead_anim"
	maxHealth = 500
	health = 500
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "crushes"
	see_in_dark = 6

	speed = 1.2

/mob/living/simple_animal/hostile/smalldemon/bloodletter/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slices at [target_mob]", "tears [target_mob]") ) ) // attack emotes

	var/damage = rand(65,85) // Damage Value

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE) // damage type 
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L

	faction = "Nurgle" 
	faction = "Slaanesh"
	faction = "Khorne"
// For now this is one of the few Daemons that won't just straight up kill cultists as in lore the more veteran of these creatures are considered to be the 'Officers/Lieutenants' of the blood legions. They can't be dragged and are VERY ideal to be posessed by ghosts so they can command cultists.
	
/mob/living/simple_animal/hostile/smalldemon/fleshbeast
	name = "Flesh Beast"
	real_name = "Flesh Beast" // Average speed. Medium damage and HP.
	desc = "This violet mass of flesh and meat scatters toward you." 
	icon = 'icons/mob/animal.dmi'
	icon_state = "loge"
	icon_living = "loge"
	icon_dead = "loge2"
	maxHealth = 380
	health = 380
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "bites"
	see_in_dark = 6

	speed = 1.6
