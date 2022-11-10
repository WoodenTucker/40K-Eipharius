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

	
/obj/aura/regenerating/human/life_tick() //this causes the two former lines to work
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		CRASH("Someone gave [user.type] a [src.type] aura. This is invalid.")
	if(!innate_heal || H.InStasis() || H.stat == DEAD)
		return 0
	if(H.nutrition < nutrition_damage_mult)
		low_nut_warning()
		return 0

	user.adjustBruteLoss(-brute_mult)
	user.adjustFireLoss(-fire_mult)
	user.adjustToxLoss(-tox_mult)

	if(!can_regenerate_organs())
		return 1
	if(tox_mult)
		if(prob(10) && H.nutrition >= 150)
			var/obj/item/organ/external/h = H.get_organ(BP_HEAD)
			if (h.disfigured)
				if (H.nutrition >= 20)
					h.disfigured = 0
					H.nutrition -= 20
				else
					low_nut_warning("head")

		for(var/bpart in shuffle(H.internal_organs_by_name - BP_BRAIN))
			var/obj/item/organ/internal/regen_tox = H.internal_organs_by_name[bpart]
			if(ORGAN_ROBOT(regen_tox))
				continue
			if(istype(regen_tox))
				if(regen_tox.damage > 0 && !(regen_tox.status & ORGAN_DEAD))
					if (H.nutrition >= tox_mult)
						regen_tox.damage = max(regen_tox.damage - tox_mult, 0)
						H.nutrition -= tox_mult
//						if(prob(5))
//							to_chat(H, replacetext(regen_message,"ORGAN", regen_organ.name))
					else
						low_nut_warning(regen_tox.name)

	if(prob(grow_chance))
		for(var/limb_type in H.species.has_limbs)
			var/obj/item/organ/external/E = H.organs_by_name[limb_type]
			if(E?.organ_tag != BP_HEAD && !E.vital && (E.is_stump() || E.status & ORGAN_DEAD))	//Skips heads and vital bits...
				if (H.nutrition > grow_threshold)
					E.removed()			//...because no one wants their head to explode to make way for a new one.
					qdel(E)
					E= null
				else
					low_nut_warning(E.name)
			if(!E)
				var/list/organ_data = H.species.has_limbs[limb_type]
				var/limb_path = organ_data["path"]
				var/obj/item/organ/external/O = new limb_path(H)
				external_regeneration_effect(O,H)
				organ_data["descriptor"] = O.name
				H.update_body()
				return
			else if (H.nutrition > grow_threshold) //We don't subtract any nut here, but let's still only heal wounds when we have nut.
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
	brute_mult = 5
	fire_mult = 5
	tox_mult = 5

/obj/aura/regenerating/human/nid
	//var/regen_message = "<span class='warning'>Your body throbs as you feel your body regenerates.</span>"
	//var/innate_heal = TRUE // Whether the aura is on, basically.
	brute_mult = 10
	fire_mult = 10

/obj/aura/regenerating/human/ultimate
	//var/regen_message = "<span class='warning'>Your body throbs as you feel your body regenerates.</span>"
	//var/innate_heal = TRUE // Whether the aura is on, basically.
	brute_mult = 50
	fire_mult = 50
	tox_mult = 50


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
	var/can_regenrate_organs = TRUE
	
/obj/aura/regenerating/human/perpetual/life_tick() //this causes the two former lines to work
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

