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
//P.S this was copied from current bay and a few features were removed, like limbs regrowing
//P.S.S this is shitcode, meaning that i added a lot of notes, plus, i am not a codeslave
/obj/aura/regenerating/human     // this is the base for healing auras
	name = "regenerating aura"
	var/brute_mult = 1    //brute damage healed per tick
	var/fire_mult = 1    //burn damage healed per tick
//	var/toxin_mult = 1 //organ damage healed, its not working and i have no idea how to fix it
	
/obj/aura/regenerating/human/life_tick() //this causes the two former lines to work
	user.adjustBruteLoss(-brute_mult)
	user.adjustFireLoss(-fire_mult)
//	user.adjustToxLoss(-tox_mult)

/obj/aura/regenerating/human/astartes
	var/nutrition_damage_mult = 0.7 //how much nutrition the retardes needs to heal their limbs
	var/regen_message = "<span class='warning'>Your body throbs as you feel your body regenerates.</span>"
	var/last_nutrition_warning = 0
	var/innate_heal = TRUE // Whether the aura is on, basically.
	brute_mult = 0.5
	fire_mult = 0.5


/obj/aura/regenerating/human/astartes/proc/external_regeneration_effect(var/obj/item/organ/external/O, var/mob/living/carbon/human/H)
	return //im not sure how this works, it just does

/obj/aura/regenerating/human/astartes/life_tick()
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		CRASH("Someone gave [user.type] a [src.type] aura. This is invalid.")
	if(!innate_heal || H.InStasis() || H.stat == DEAD)
		return 0

	if(brute_mult && H.getBruteLoss())
		H.adjustBruteLoss(-brute_mult * config.organ_regeneration_multiplier)

	if(fire_mult && H.getFireLoss())
		H.adjustFireLoss(-fire_mult * config.organ_regeneration_multiplier)
/*		
	if(tox_mult && H.getToxLoss())
		H.adjustToxLoss(-tox_mult * config.organ_regeneration_multiplier)
		H.adjust_nutrition(-nutrition_damage_mult)

	if(!can_regenerate_organs())
		return 1
*/
/*
/obj/aura/regenerating/human/proc/toggle()
	innate_heal = !innate_heal

/obj/aura/regenerating/human/proc/can_toggle()
	return TRUE

/obj/aura/regenerating/human/proc/can_regenerate_organs()
	return TRUE
*/
