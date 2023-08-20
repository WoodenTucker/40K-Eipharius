/area
	var/is_mortar_area = FALSE

// check /datum/controller/subsystem/warfare for warfare vars and procs

/datum/game_mode/warfare
	name = "Warfare"
	round_description = "All out warfare on the battlefront!"
	extended_round_description = "Invade the enemies trenches and then destroy them! War is heck! Expect to die a lot!"
	config_tag = "warfare"
	required_players = 0
	auto_recall_shuttle = TRUE //If the shuttle is even somehow called.

/datum/game_mode/warfare/declare_completion()
	SSwarfare.declare_completion()

/datum/game_mode/warfare/post_setup()
	..()
	SSwarfare.begin_countDown()


/datum/game_mode/warfare/check_finished()
	if(SSwarfare.check_completion())
		return TRUE
	..()


/mob/living/carbon/human/proc/handle_warfare_death()
	if(!iswarfare())
		return
	if(is_npc)
		return
	if(src in SSwarfare.blue.team)//If in the team.
		SSwarfare.blue.left--//Take out a life.
		SSwarfare.blue.team -= src//Remove them from the team.
	if(src in SSwarfare.red.team)//Same here.
		SSwarfare.red.left--
		SSwarfare.red.team -= src

	if(client)
		client.warfare_deaths++

	// as far as i know there are no immediate jobtype vars in mind or human, so here we go
	/*
	if(SSjobs?.GetJobByTitle(job)?.type == /datum/job/soldier/red_soldier/captain)
		for(var/X in SSwarfare.red.team)
			var/mob/living/carbon/human/H = X
			H.add_event("captain death", /datum/happiness_event/captain_death)
	if(SSjobs?.GetJobByTitle(job)?.type == /datum/job/soldier/blue_soldier/captain)
		for(var/X in SSwarfare.blue.team)
			var/mob/living/carbon/human/H = X
			H.add_event("captain death", /datum/happiness_event/captain_death)
	if(SSjobs?.GetJobByTitle(job)?.open_when_dead)//When the person dies who has this job, free this role again.
		SSjobs.allow_one_more(job)

	if(!GLOB.first_death)
		GLOB.first_death = real_name
	if(!GLOB.first_death_happened)
		GLOB.first_death_happened = TRUE
	if(!GLOB.final_words)
		GLOB.final_words = last_words
*/
/mob/living/carbon/human/proc/handle_warfare_life()
	if(!iswarfare())
		return

	if(tracking)
		tracking.update()

/proc/iswarfare()
    return (istype(ticker.mode, /datum/game_mode/warfare) || master_mode=="warfare")

/obj/structure/warfare/barricade
	name = "barricade"
	desc = "it stops you from moving"
	icon = 'icons/obj/warfare.dmi'
	plane = ABOVE_OBJ_PLANE
	layer = BASE_ABOVE_OBJ_LAYER
	anchored = TRUE
	var/health = 100


/obj/structure/warfare/barricade/New()
	..()
	if(dir == SOUTH)
		plane = ABOVE_HUMAN_PLANE


/obj/structure/warfare/barricade/CheckExit(atom/movable/O, turf/target)
	if(istype(O, /obj/item/projectile))//Blocks bullets unless you're ontop of it.
		var/obj/item/projectile/proj = O
		if(proj.firer.resting)//No resting and shooting over these.
			qdel(proj)
			return FALSE
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
	if(get_dir(loc, target) & dir)
		return FALSE
	else
		return TRUE

/obj/structure/warfare/barricade/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /obj/item/projectile))//Blocks bullets unless you're ontop of it.
		var/obj/item/projectile/proj = mover

		if(proj.firer.resting)//No resting and shooting over these.
			return FALSE

		if(proj.firer && Adjacent(proj.firer))
			return TRUE

		if (get_dist(proj.starting, loc) <= 1)
			return TRUE

		return FALSE

	var/obj/structure/S = locate(/obj/structure) in get_turf(mover)
	if(S && !(S.atom_flags & ATOM_FLAG_CHECKS_BORDER) && isliving(mover)) //Climbable objects allow you to universally climb over others
		return TRUE

	if(get_dir(loc, target) & dir)
		return FALSE
	else
		return TRUE


/obj/structure/warfare/barricade/bullet_act(var/obj/item/projectile/Proj)
	..()
	for(var/mob/living/carbon/human/H in loc)
		H.bullet_act(Proj)
	//visible_message("[Proj] hits the [src]!")
	playsound(src, "hitwall", 50, TRUE)
	health -= rand(10, 25)
	if(health <= 0)
		visible_message("<span class='danger'>The [src] crumbles!</span>")
		qdel(src)

/obj/structure/warfare/barricade/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			if(prob(50))
				qdel(src)

//Bullshit snowflake stuff for climbing over it.
/obj/structure/warfare/barricade/do_climb(var/mob/living/user)
	if(!can_climb(user))
		return

	user.visible_message("<span class='warning'>[user] starts climbing onto \the [src]!</span>")
	climbers |= user

	if(!do_after(user,(issmall(user) ? 20 : 30)))
		climbers -= user
		return

	if(!can_climb(user, post_climb_check=1))
		climbers -= user
		return

	if(!neighbor_turf_passable())
		to_chat(user, "<span class='danger'>You can't climb there, the way is blocked.</span>")
		climbers -= user
		return

	if(get_turf(user) == get_turf(src))
		user.forceMove(get_step(src, src.dir))
	else
		user.forceMove(get_turf(src))

	user.visible_message("<span class='warning'>[user] climbed over \the [src]!</span>")
	climbers -= user

/obj/structure/warfare/barricade/can_climb(var/mob/living/user, post_climb_check=0)
	if (!(atom_flags & ATOM_FLAG_CLIMBABLE) || !can_touch(user) || (!post_climb_check && (user in climbers)))
		return FALSE

	if (!user.Adjacent(src))
		to_chat(user, "<span class='danger'>You can't climb there, the way is blocked.</span>")
		return FALSE

	return TRUE


/obj/structure/warfare/barricade/sandbag
	name = "heavy duty sandbag"
	desc = "Effective at blocking bullets, but it gets in the way."
	icon = 'icons/map_project/sandbags.dmi'
	icon_state = "sandbag"
	health = 650

/obj/structure/warfare/barricade/concrete_barrier/sandbag
	name = "sandbag wall"
	desc = "A big sandbag that serves as a barricade of sorts."
	icon = 'icons/map_project/sandbag_wall.dmi'
	icon_state = "solo"
	anchored = 1.0
	density = 1
	health = 550 // Cant be crafted due not exactly understanding honestly how it works (i dont code THAT well guhh), will increase HP to compensate that till someone else can do so.

/obj/structure/warfare/barricade/concrete_barrier
	name = "concrete barrier"
	desc = "Very effective at blocking bullets, but it gets in the way."
	icon_state = "concrete_block"
	anchored = 1.0
	density = 1
	health = 850 // Cant be crafted due not exactly understanding honestly how it works (i dont code THAT well guhh), will increase HP to compensate that till someone else can do so.

