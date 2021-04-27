/datum/species/human/skitarii
	name = "Skitarii"
	name_plural = "Skitarii"
	blurb = "The Mechanicus' loyal soldiers."
	total_health = 250
	min_age = 18
	max_age = 80
	icobase = 'icons/mob/human_races/r_human.dmi'
	deform = 'icons/mob/human_races/r_def_human.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	pixel_offset_y = -4


/datum/species/human/skitarii/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age doesn't quite matter I suppose
	if(H.f_style)//BALD
		H.f_style = "Shaved"
	if(H.h_style)//SHAVED
		H.h_style = "Bald"
	to_chat(H, "<big><span class='warning'>You are a servant of the Adeptus Mechanicus! Don't forget it!</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human/proc/isSkittari()//Used to tell if someone is a skit boy, can be used for possible jobs later down the line, stole from children
	if(species && species.name == "Skitarii")
		return 1
	else
		return 0

/mob/living/carbon/human/skitarii/Initialize()
	. = ..()
	fully_replace_character_name(random_skitarii_name(src.gender))
	warfare_faction = IMPERIUM
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/kroot)
	outfit.equip(src)

	hand = 0//Make sure one of their hands is active.
	put_in_hands(new /obj/item/gun/projectile/shotgun/pump/boltaction/krootrifle/bayonet)//Give them a weapon.
	isburied = 1

/mob/living/carbon/human/skitarii/New(var/new_loc)
	..(new_loc, "Skitarii")




//Procs for grabbing players into our skit boy
/mob/living/carbon/human/skitarii/proc/request_player() //reqs the player
	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can JB shitters
			continue
		if(O.client) //just duh
			question(O.client)

/mob/living/carbon/human/skitarii/proc/question(var/client/C) //asks the questions
	spawn(0)
		if(!C)	return
		var/response = alert(C, "A Skitarii unit has been manufacted and needs a player. Are you interested?", "Skitarii", "Yes", "No",)
		if(!C || ckey)
			return
		if(response == "Yes")
			transfer_personality(C)
			src.warfare_faction = IMPERIUM

/mob/living/carbon/human/skitarii/proc/transfer_personality(var/client/candidate) //puts the guy in the place

	if(!candidate)
		return

	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "syndicate"
		sleep (2)