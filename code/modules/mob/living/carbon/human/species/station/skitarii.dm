















/mob/living/carbon/human/proc/isSkittari()//Used to tell if someone is a child.
	if(species && species.name == "Skitarii")
		return 1
	else
		return 0

/mob/living/carbon/human/child/New(var/new_loc)
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