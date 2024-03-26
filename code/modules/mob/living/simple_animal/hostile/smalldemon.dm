/mob/living/simple_animal/hostile/smalldemon
	name = "Lesser Daemon"
	real_name = "Lesser Daemon"
	desc = "A disgusting horror of the warp." // Fast moving daemon. Deadly in large mobs, especially against unarmored humans.
	icon = 'icons/mob/Demon.dmi' // Make sure to set this to the icon of whatever new mob you add.
	icon_state = "demon"
	icon_living = "demon"
	icon_dead = "demon_dead"
	maxHealth = 401
	health = 401
	universal_speak = 1
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	melee_damage_lower = 35 // This only effects if controlled by a player.
	melee_damage_upper = 55
	attacktext = "claws"
	maxbodytemp = 1000
	see_in_dark = 8
	wander = 1
	turns_per_move = 25

	speed = 1.6 // Higher number means slower.

	min_gas = null
	max_gas = null
	minbodytemp = 0
	faction = "Demon"
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
						playsound(src, 'sound/effects/quotes/cults/demon/demon_spawn_alert.ogg', 100, 1)
						if(action)
							custom_emote(1,action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 3)   //If we have been staring at a mob for 3 ticks,
				stance = HOSTILE_STANCE_ATTACK
				playsound(src, 'sound/effects/quotes/cults/demon/demon_spawn2.ogg', 100, 1)

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
		stance_step = 3
		target_mob = user
	..()

/mob/living/simple_animal/hostile/smalldemon/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 3
		target_mob = M
	..()

/mob/living/simple_animal/hostile/smalldemon/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"stares alertly at [.]")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/smalldemon/LoseTarget()
	..(2)

/mob/living/simple_animal/hostile/smalldemon/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(25,45)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_HEAD, BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP)
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
	maxHealth = 410
	health = 410
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "sloshes"
	see_in_dark = 6

	speed = 1.7

/mob/living/simple_animal/hostile/smalldemon/zygote/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("sloshes at [target_mob]", "pulls [target_mob]") ) ) // attack emotes

	var/damage = rand(25,45) // Damage Value

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
	desc = "This violent bubbling mass of flesh and meat crawls toward you." // Bubbling masses similar to Zygotes are slow and more deadly in caves/dungeons.
	icon = 'icons/mob/animal.dmi'
	icon_state = "oormat"
	icon_living = "oormat"
	icon_dead = "oormat2"
	maxHealth = 950
	health = 950
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "crushes"
	see_in_dark = 6

	speed = 1.6

/mob/living/simple_animal/hostile/smalldemon/bubblingmass/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("bites at [target_mob]", "crushes [target_mob]") ) ) // attack emotes

	var/damage = rand(20,60) // Damage Value

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
	maxHealth = 1100
	health = 1100
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "crushes"
	see_in_dark = 6

	speed = 1.4

/mob/living/simple_animal/hostile/smalldemon/bloodletter/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slices at [target_mob]", "tears [target_mob]") ) ) // attack emotes

	var/damage = rand(35,65) // Damage Value

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

// For now this is one of the few Daemons that won't just straight up kill cultists as in lore the more veteran of these creatures are considered to be the 'Officers/Lieutenants' of the blood legions. They can't be dragged and are VERY ideal to be posessed by ghosts so they can command cultists.

/mob/living/simple_animal/hostile/smalldemon/fleshbeast
	name = "Flesh Beast"
	real_name = "Flesh Beast"
	desc = "This violent mass of flesh and meat scatters toward you."
	icon = 'icons/mob/animal.dmi'
	icon_state = "loge"
	icon_living = "loge"
	icon_dead = "loge2"
	maxHealth = 540
	health = 540
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "bites"
	see_in_dark = 6

	speed = 1.5

/mob/living/simple_animal/hostile/smalldemon/plague
	name = "Plague Zombie"
	real_name = "Plague Zombie"
	desc = "This shambling cadaver scatters toward you."
	faction = "Chaos"
	icon = 'icons/mob/Demon.dmi'
	icon_state = "plague"
	icon_living = "plague"
	icon_dead = "plague_dead"
	maxHealth = 500
	health = 500
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "bites"
	faction = "Chaos"
	see_in_dark = 6

	speed = 1.6

/mob/living/simple_animal/hostile/smalldemon/chaos
	name = "Chaos Spawn"
	real_name = "Chaos Spawn"
	desc = "This violent mass of flesh and meat scatters toward you."
	icon = 'icons/mob/Demon.dmi'
	icon_state = "goliath"
	icon_living = "goliath"
	icon_dead = "goliath_dead"
	maxHealth = 610
	health = 610
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "bites"
	see_in_dark = 6
	speed = 1.5

/mob/living/simple_animal/hostile/nurgling
	name = "nurgling"
	desc = "A small, flabby, impish lesser daemon of Nurgle. It stares at you with a wide grin."
	icon = 'icons/mob/animal.dmi'
	throw_range = 600
	icon_state = "stinky"
	icon_living = "stinky"
	icon_dead = "stinky_dead"
	pass_flags = PASS_FLAG_TABLE
	speak = list("Hihihihihi", "Hreee!", "Teehee!")
	speak_emote = list("giggles", "laughs", "sneers")
	emote_hear = list("giggles", "smirks", "yaps", "squeals")
	emote_see = list("jumps around!", "picks its nose", "claps")
	speak_chance = 75
	turns_per_move = 25
	speed = 5
	maxHealth = 450
	health = 450
	response_help  = "pats"
	response_disarm = "kicks aside"
	response_harm   = "stomps"
	see_in_dark = 5
	possession_candidate = 1
	holder_type = /obj/item/holder
	mob_size = 1
	density = 0

	var/death_msg = "lets out a waning screech, bursting into a mess of entrails."

	harm_intent_damage = 35
	melee_damage_lower = 30
	melee_damage_upper = 40
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bite.ogg'

	faction = "Chaos"

/mob/living/simple_animal/hostile/retaliate/nurgling/FindTarget()
	. = ..()
	if(.)
		visible_emote("hisses angrily at [.]!")

/mob/living/simple_animal/hostile/retaliate/nurgling/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(1))
			L.Weaken(1)
			L.visible_message("<span class='danger'>\the [src] knocks down \the [L]!</span>")

/mob/living/simple_animal/hostile/shadow
	name = "Warping Shadow"
	desc = "What used to be human once has been turned into some sort of warping abomination, you cannot even tell if it's looking at you or preparing to attack."
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "shadow"
	icon_living = "shadow"
	icon_dead = "shadow_dead"
	speak_chance = 0
	turns_per_move = 25
	response_help = "passes through"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 1
	maxHealth = 320
	health = 320
	faction = "Demon"

	harm_intent_damage = 20
	melee_damage_lower = 25
	melee_damage_upper = 45
	attacktext = "slashes"
	attack_sound = 'sound/hallucinations/growl1.ogg'


/mob/living/simple_animal/hostile/shadow/subject_22 // Xeno Research Area
	desc = "Increased use of Obscura alongside other chemicals turned the heretical pilgrim into this, further study required once hostility lowers to an acceptable level."

/mob/living/simple_animal/hostile/undead
	name = "Reanimated Corpse"
	desc = "A reanimated corpse, despite the major injuries it still seems alive and craving for flesh."
	icon = 'icons/map_project/creatures.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	icon_dead = "zombie_dead"
	speak_chance = 0
	turns_per_move = 25
	response_help = "passes through"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 1.5
	maxHealth = 285
	health = 285
	faction = "Demon"

	harm_intent_damage = 30
	melee_damage_lower = 35
	melee_damage_upper = 35
	attacktext = "bites"
	attack_sound = 'sound/hallucinations/growl1.ogg'


/mob/living/simple_animal/hostile/undead/subject_11 // Xeno Research Area
	desc = "Subject was brought to Elipharius for further examination, was afflicted with some pathogen which allowed reanimation even though necrotic decay was set, possible work of heretical bio weapon. Test Subject only craves for flesh."

/mob/living/simple_animal/hostile/mold
	name = "Glowing Humanoid"
	desc = "An strange humanoid that seems entirely made out of some plant organism. One thing is for sure, it does not seem friendly."
	icon = 'icons/map_project/creatures.dmi'
	speak_chance = 0
	icon_state = "spookyxenos"
	icon_living = "spookyxenos"
	icon_dead = "spookyxenos"
	health = 350
	maxHealth = 350
	melee_damage_lower = 35
	melee_damage_upper = 45
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.7

/mob/living/simple_animal/hostile/mold/subject_08 // Xeno Research Area
	desc = "Subject was found on the lower levels of Elipharius, possibly an human being before it was assimilated by some plant organism and turned into this, the area it was located contained several organism like the subject here."

/mob/living/simple_animal/hostile/broken_servitor
	name = "Malfunctioning Servitor"
	desc = "An once operational servitor for the Mechanicus, whatever happened to it now turned it hostile to anyone.."
	icon = 'icons/map_project/creatures.dmi'
	speak_chance = 0
	icon_state = "tombs3"
	icon_living = "tombs3"
	icon_dead = "tombs3"
	health = 444
	maxHealth = 500
	melee_damage_lower = 35
	melee_damage_upper = 45
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	speed = 1.8

/mob/living/simple_animal/hostile/broken_servitor/death()
	..(null, "blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/broken_servitor/subject_03 // Xeno Research Area, also a hint to Archangel
	desc = "Servitor was brought from the now abandoned and derelict Archangel Outpost, it appears his programming has been damaged during the expedition it was last tasked to do, any attempts to recover the information it has stored of the Archangel Outpost has been halted due increased hostilities."

/mob/living/simple_animal/hostile/eldar
	name = "Eldar"
	desc = "An Eldar that has seemingly been trapped here, seems that it wont be leaving any time soon."
	icon = 'icons/map_project/creatures.dmi'
	speak_chance = 0
	icon_state = "dire_avenger"
	icon_living = "dire_avenger"
	icon_dead = "dire_avenger" // Gotta add it dies horribly by gibbing due the lack of dead icon state
	health = 350
	maxHealth = 350
	melee_damage_lower = 25
	melee_damage_upper = 45
	attacktext = "pierces"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	speed = 1.2

/mob/living/simple_animal/hostile/flesh
	name = "Headcrab"
	desc = "A disgusting flesh creature formed out of flesh vines that have occupied a human head..."
	icon = 'icons/map_project/port/components_large.dmi'
	speak_chance = 0
	icon_state = "head"
	icon_living = "head"
	icon_dead = "head_dead_2"
	health = 175
	maxHealth = 175
	melee_damage_lower = 15
	melee_damage_upper = 25
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.6
	faction = "Demon"

/mob/living/simple_animal/hostile/giant_spider/flesh
	name = "Infestor"
	desc = "A disgusting motherly creature with long tentacles protruding from it's mating hole."
	icon = 'icons/map_project/port/components_large.dmi'
	icon_state = "example"
	icon_living = "example"
	icon_dead = "torso_lying_2"
	faction = "Demon"
	health = 325
	maxHealth = 325
	melee_damage_lower = 15
	melee_damage_upper = 25
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.6
	poison_per_bite = 3
	poison_type = /datum/reagent/soporific // Makes you sleepy

/mob/living/simple_animal/hostile/flesh/stalker
	name = "Lurker"
	desc = "A young hunter-killer bioform xenos with a carapace-like armor structure over it's body, it seems to be a broodling."
	icon = 'icons/map_project/port/components_large.dmi'
	speak_chance = 0
	icon_state = "liz1"
	icon_living = "liz1"
	icon_dead = "bodylying"
	health = 315
	maxHealth = 315
	melee_damage_lower = 25
	melee_damage_upper = 40
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.5
	faction = "Demon"

/mob/living/simple_animal/hostile/flesh/stalker2
	name = "Lurker"
	desc = "An old hunter-killer bioform xenos with a carapace-like armor structure over it's body."
	icon = 'icons/map_project/port/components_large.dmi'
	speak_chance = 0
	icon_state = "liz2"
	icon_living = "liz2"
	icon_dead = "torso_lying1"
	health = 365
	maxHealth = 365
	melee_damage_lower = 30
	melee_damage_upper = 45
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.5
	faction = "Demon"

/mob/living/simple_animal/hostile/flesh/abomination/tzee
	name = "Abomination"
	desc = "A disgusting flesh creature formed out of flesh vines that have occupied a human corpse..."
	icon = 'icons/map_project/port/components_large.dmi'
	speak_chance = 0
	icon_state = "preview"
	icon_living = "preview"
	icon_dead = "torso_lying_2"
	health = 225
	maxHealth = 225
	melee_damage_lower = 19
	melee_damage_upper = 29
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.7
	faction = "Chaos"

/mob/living/simple_animal/hostile/flesh/abomination/tzee/Initialize()
	. =..()
	if(prob(40))
		explosion(src.loc, -1, 2, 3, 4)
	else
		return

/mob/living/simple_animal/hostile/flesh/abomination
	name = "Abomination"
	desc = "A disgusting flesh creature formed out of flesh vines that have occupied a human corpse..."
	icon = 'icons/map_project/port/components_large.dmi'
	speak_chance = 0
	icon_state = "preview"
	icon_living = "preview"
	icon_dead = "torso_lying_2"
	health = 315
	maxHealth = 315
	melee_damage_lower = 19
	melee_damage_upper = 29
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speed = 1.7
	faction = "Demon"

/mob/living/simple_animal/hostile/flesh/advanced
	name = "Guardian"
	desc = "A disgusting flesh creature formed out of many corpses  sewn together with living flesh vines..."
	icon = 'icons/map_project/port/components_large.dmi'
	icon_state = "brute-d"
	icon_living = "brute-d"
	icon_dead = "brute-d-dead"
	maxHealth = 1201
	health = 1201
	universal_speak = 1
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	melee_damage_lower = 45 // This only effects if controlled by a player.
	melee_damage_upper = 75
	attacktext = "claws"
	maxbodytemp = 1000
	see_in_dark = 8
	wander = 1
	turns_per_move = 25

	speed = 1.6 // Higher number means slower.

	min_gas = null
	max_gas = null
	minbodytemp = 0
	faction = "Demon"
	var/stance_step = 0

/mob/living/simple_animal/hostile/flesh/advanced/Life()
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
						playsound(src, 'sound/effects/quotes/cults/demon/demon_spawn_alert.ogg', 100, 1)
						if(action)
							custom_emote(1,action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 3)   //If we have been staring at a mob for 3 ticks,
				stance = HOSTILE_STANCE_ATTACK
				playsound(src, 'sound/effects/quotes/cults/demon/demon_spawn2.ogg', 100, 1)

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
		stance_step = 3
		target_mob = user
	..()

/mob/living/simple_animal/hostile/smalldemon/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 3
		target_mob = M
	..()

/mob/living/simple_animal/hostile/smalldemon/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"charges at [.]")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/smalldemon/LoseTarget()
	..(2)

/mob/living/simple_animal/hostile/smalldemon/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(20,60)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L


// Missing Ubermorph and have yet to make variants of necromorphs using smalldemon code. Alongside simplemob variants of the Ubermorph, Bloodletter and Guardian. Same required for Tyranid Bioforms.