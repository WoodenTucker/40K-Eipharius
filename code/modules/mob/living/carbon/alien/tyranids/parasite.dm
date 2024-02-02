/mob/living/simple_animal/hostile/alien/parasite
	name = "parasite"
	desc = "A fanged snake like creature that doesn't look very friendly."
	icon = 'icons/mob/tyranids.dmi'
	icon_state = "ripper"
	icon_living = "ripper"
	icon_dead = "ripper_dead"
	health = 35
	melee_damage_lower = 0
	melee_damage_upper = 0
	attacktext = "bumps into"
	speed = 0
	wander = 1
	layer = 5
	stat_attack = 3
	var/infesting = 0

/mob/living/simple_animal/hostile/alien/parasite/AttackingTarget()
	return

/mob/living/simple_animal/hostile/alien/parasite/New()
	..()
	pixel_x = rand(-16, 16)
	pixel_y = rand(-16, 16)

/mob/living/simple_animal/hostile/alien/parasite/Die()
	..()
	visible_message("[src] collapses back into a soup of biomass!")
	playsound(src, 'sound/voice/hiss6.ogg', 100, 1)

/mob/living/simple_animal/hostile/alien/parasite/Life()
	..()
	if(src.stat == DEAD) return
	for(var/mob/living/carbon/human/H in range(1, get_turf(src)))
		if(H.stat == DEAD)
			infest(H)
		else
			H.Weaken(1)
			infest(H)

/mob/living/simple_animal/hostile/alien/parasite/proc/infest(var/mob/living/carbon/human/target)
	if(!istype(target)) return
	if(infesting) return
	if(target.status_flags & XENO_HOST) return
	infesting = 1
	src.visible_message("\red <b>The [src] begins to gnaw it's way into [target]!</b>")
	spawn(0)
		for(var/stage = 1, stage<=4, stage++)
			sleep(10)
			if(prob(2))
				target.Weaken(1)
			if(get_dist(get_turf(src),get_turf(target)) > 1)
				src.visible_message("\red <b>The [src] is ripped away from [target]!</b>")
				infesting = 0
				return
		if(!target.getlimb(/obj/item/organ/limb/robot/chest) && !(target.status_flags & XENO_HOST))
			new /obj/item/alien_embryo/tyranid(target)
		qdel(src)
