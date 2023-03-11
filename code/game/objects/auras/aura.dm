/*Auras are simple: They are simple overriders for attackbys, bullet_act, damage procs, etc. They also tick after their respective mob.
They should be used for undeterminate mob effects, like for instance a toggle-able forcefield, or indestructability as long as you don't move.
They should also be used for when you want to effect the ENTIRE mob, like having an armor buff or showering candy everytime you walk.
*/

/obj/aura
	var/mob/living/user

/obj/aura/New(var/mob/living/target)
	..()
	user = target
	user.add_aura(src)

/obj/aura/Destroy()
	if(user)
		user.remove_aura(src)
		user = null
	return ..()

/obj/aura/proc/life_tick()
	return 0

/obj/aura/attackby(var/obj/item/I, var/mob/user)
	return 0

/obj/aura/bullet_act(var/obj/item/projectile/P, var/def_zone)
	return 0

/obj/aura/hitby(var/atom/movable/M, var/speed)
	return 0

/obj/aura/debug
	var/returning = 0

/obj/aura/debug/attackby(var/obj/item/I, var/mob/user)
	log_debug("Attackby for \ref[src]: [I], [user]")
	return returning

/obj/aura/debug/bullet_act(var/obj/item/projectile/P, var/def_zone)
	log_debug("Bullet Act for \ref[src]: [P], [def_zone]")
	return returning

/obj/aura/debug/life_tick()
	log_debug("Life tick")
	return returning

/obj/aura/debug/hitby(var/atom/movable/M, var/speed)
	log_debug("Hit By for \ref[src]: [M], [speed]")
	return returning


//REGENERATION AURA BELOW 

//i am not sure how this works, it just does
//P.S this was copied from current bay and a few features were removed, like limbs regrowing //Added features back in, because who knows, it might be useful - Magi.
//P.S.S this is shitcode, meaning that i added a lot of notes, plus, i am not a codeslave
/obj/aura/regenerating/human     // this is the base for healing auras
	name = "regenerating aura"
	var/brute_mult = 1    //brute damage healed per tick
	var/fire_mult = 1    //burn damage healed per tick
	var/tox_mult = 1 //organ damage healed, its not working and i have no idea how to fix it //Fixed it -Magi
	var/innate_heal = TRUE // Whether the aura is on, basically.	
	var/regen_message = "<span class='warning'>Your body throbs as you feel your ORGAN regenerate.</span>"
	var/grow_chance = 0
	var/grow_threshold = 0
	var/ignore_tag //organ tag to ignore
	var/last_nutrition_warning = 0
	var/nutrition_damage_mult = 1 //How much nutrition it takes to heal regular damage
	var/external_nutrition_mult = 50 // How much nutrition it takes to regrow a limb
	var/organheal = 1 //The number of points of damage per organ the regen heals per tick, if organ healing is enabled.
	var/can_regenerate_organs = FALSE
	var/max_brain_damage_heal = 25 //The maximum amount of brain damage that the regen can heal. Anything above this will result in no healing occuring.Bruised is 25% of the species Total Health value, or 30 for a basic human, broken is 75%, or 90 for a basic human.
	var/needsres = 0 //A check to see if the heart's stopped, and thus a ressurection is needed.

	
/obj/aura/regenerating/human/life_tick() //this causes the two former lines to work
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		CRASH("Someone gave [user.type] a [src.type] aura. This is invalid.")

	user.adjustBruteLoss(-brute_mult)
	user.adjustFireLoss(-fire_mult)
	user.adjustToxLoss(-tox_mult)

	if(!can_regenerate_organs())
		return 1
	if(tox_mult)
		if(prob(50)) 
			var/obj/item/organ/external/h = H.get_organ(BP_HEAD)
			if (h.disfigured)
				h.disfigured = 0

		for(var/bpart in shuffle(H.internal_organs_by_name - BP_BRAIN))
			var/obj/item/organ/internal/regen_tox = H.internal_organs_by_name[bpart]
			if(ORGAN_ROBOT(regen_tox))
				continue
			if(istype(regen_tox))
				if(regen_tox.damage > 0 && !(regen_tox.status & ORGAN_DEAD))
					regen_tox.damage = max(regen_tox.damage - tox_mult, 0)
					to_chat(H, replacetext(regen_message,"ORGAN", regen_tox.name))
					
		for(var/obj/item/organ/internal/I in H.internal_organs)
			if(I.robotic >= ORGAN_ROBOT)
				continue
			if(I.organ_tag == BP_BRAIN)
				if(I.damage > 0)
					H.confused++
					H.drowsyness++
					if(I.damage >= max_brain_damage_heal)
						continue			
			if(I.organ_tag == BP_HEART)
				if(H.is_asystole()) //Check for heart issues.
					if(I.damage == 0)
						sleep(100)
						I.status -= ORGAN_DEAD
						H.resuscitate()
			if(I.damage > 0) 
				I.damage -= organheal
				I.status -= ORGAN_DEAD
			if(I.damage < 0)
				I.damage = 0
				I.status -= ORGAN_DEAD



	if(prob(grow_chance))
		for(var/limb_type in H.species.has_limbs)
			var/obj/item/organ/external/E = H.organs_by_name[limb_type]
			if((E.is_stump() || E.status & ORGAN_DEAD))	//Skips heads and vital bits...
				E.removed()			//...because no one wants their head to explode to make way for a new one.
				qdel(E)
				E= null

			if(!E)
				var/list/organ_data = H.species.has_limbs[limb_type]
				var/limb_path = organ_data["path"]
				var/obj/item/organ/external/O = new limb_path(H)
				external_regeneration_effect(O,H)
				organ_data["descriptor"] = O.name
				H.update_body()
				return
			else
				for(var/datum/wound/W in E.wounds)
					if(W.wound_damage() == 0 && prob(50))
						qdel(W)
	return 1


/obj/aura/regenerating/human/proc/low_nut_warning(var/wound_type)
	if (last_nutrition_warning + 1 MINUTE < world.time)
		to_chat(user, "<span class='warning'>You need more energy to regenerate your [wound_type || "wounds"].</span>")
		last_nutrition_warning = world.time
		return 1
	return 0

/obj/aura/regenerating/human/proc/toggle()
	innate_heal = !innate_heal


/obj/aura/regenerating/human/astartes
	//var/regen_message = "<span class='warning'>Your body throbs as you feel your body regenerates.</span>"
	//var/innate_heal = TRUE // Whether the aura is on, basically.
	can_regenerate_organs = TRUE
	brute_mult = 33 // Value of 10 = 1 per second. Bleeding slows this down a lot, so a minimum of 15-20 is needed to stop bleeding.
	fire_mult = 27
	tox_mult = 5 // We don't want toxin to heal as quickly as we want death to still be possible -- only slowed down. Not stopped.
	organheal = 0.3 // Leave this as is. Any higher and you become god.

/obj/aura/regenerating/human/ork
	can_regenerate_organs = TRUE
	brute_mult = 39
	fire_mult = 30
	tox_mult = 2
	organheal = 0.3

/obj/aura/regenerating/human/ogryn
	can_regenerate_organs = TRUE
	brute_mult = 20
	fire_mult = 10
	tox_mult = 2
	organheal = 0.3

/obj/aura/regenerating/human/khornate
	can_regenerate_organs = TRUE
	brute_mult = 5
	fire_mult = 5
	tox_mult = 1
	organheal = 0.2

/obj/aura/regenerating/human/skinless
	can_regenerate_organs = TRUE
	brute_mult = 48
	fire_mult = 48
	tox_mult = 28
	organheal = 0.6

/obj/aura/regenerating/human/nid
	can_regenerate_organs = TRUE
	brute_mult = 38
	fire_mult = 38
	tox_mult = 20
	organheal = 0.6

/obj/aura/regenerating/human/ultimate
	//var/regen_message = "<span class='warning'>Your body throbs as you feel your body regenerates.</span>"
	//var/innate_heal = TRUE // Whether the aura is on, basically.
	can_regenerate_organs = TRUE
	brute_mult = 45
	fire_mult = 45
	tox_mult = 8
	organheal = 0.7


/*/obj/aura/regenerating/human/astartes/life_tick()
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		CRASH("Someone gave [user.type] a [src.type] aura. This is invalid.")
	if(!innate_heal || H.InStasis() || H.stat == DEAD)
		return 0

	if(brute_mult && H.getBruteLoss())
		H.adjustBruteLoss(-brute_mult * config.organ_regeneration_multiplier)

	if(fire_mult && H.getFireLoss())
		H.adjustFireLoss(-fire_mult * config.organ_regeneration_multiplier)
		
	if(tox_mult && H.getToxLoss())
		H.adjustToxLoss(-tox_mult * config.organ_regeneration_multiplier)
//		H.adjust_nutrition(-nutrition_damage_mult)

	if(!can_regenerate_organs())
		return 1*/

/obj/aura/regenerating/human/proc/can_toggle()
	return TRUE

/obj/aura/regenerating/human/proc/can_regenerate_organs()
	return TRUE

/obj/aura/regenerating/human/proc/external_regeneration_effect(var/obj/item/organ/external/O, var/mob/living/carbon/human/H)
	return

/obj/aura/regenerating/human/perpetual
	name = "regenerating aura"
	brute_mult = 100    //brute damage healed per tick
	fire_mult = 100    //burn damage healed per tick
	tox_mult = 100 //organ damage healed per tick
	innate_heal = TRUE // Whether the aura is on, basically.
	nutrition_damage_mult = 0 //How much nutrition it takes to heal regular damage
	external_nutrition_mult = 0 // How much nutrition it takes to regrow a limb
	can_regenerate_organs = TRUE
	organheal = 50

/mob/living/carbon/human/proc/altresuscitate() //For resuscitating without heart damage or shock.
	var/obj/item/organ/internal/heart/heart = internal_organs_by_name[BP_HEART]
	if(istype(heart) && heart.robotic <= ORGAN_ROBOT && !(heart.status & ORGAN_DEAD))
		var/species_organ = species.breathing_organ
		var/active_breaths = 0
		if(species_organ)
			var/obj/item/organ/internal/lungs/L = internal_organs_by_name[species_organ]
			if(L)
				active_breaths = L.active_breathing
		if(!nervous_system_failure() && active_breaths)
			visible_message("\The [src] jerks and gasps for breath!")
		else
			visible_message("\The [src] twitches a bit as \his heart restarts!")
		shock_stage = 0 // 120 is the point at which the heart stops.
		if(getOxyLoss() >= 75)
			setOxyLoss(75)
		heart.pulse = PULSE_NORM
		heart.handle_pulse()
	unlock_achievement(new/datum/achievement/revived())
