var/const/GHOST_IMAGE_NONE = 0
var/const/GHOST_IMAGE_DARKNESS = 1
var/const/GHOST_IMAGE_SIGHTLESS = 2
var/const/GHOST_IMAGE_ALL = ~GHOST_IMAGE_NONE

/mob/observer
	density = 0
	alpha = 127
	plane = OBSERVER_PLANE
	invisibility = INVISIBILITY_OBSERVER
	see_invisible = SEE_INVISIBLE_OBSERVER
	sight = SEE_TURFS|SEE_MOBS|SEE_OBJS|SEE_SELF
	simulated = FALSE
	stat = DEAD
	status_flags = GODMODE
	var/ghost_image_flag = GHOST_IMAGE_DARKNESS
	var/image/ghost_image = null //this mobs ghost image, for deleting and stuff

/mob/observer/New()
	..()
	ghost_image = image(src.icon,src)
	ghost_image.plane = plane
	ghost_image.layer = layer
	ghost_image.appearance = src
	ghost_image.appearance_flags = RESET_ALPHA
	if(ghost_image_flag & GHOST_IMAGE_DARKNESS)
		ghost_darkness_images |= ghost_image //so ghosts can see the eye when they disable darkness
	if(ghost_image_flag & GHOST_IMAGE_SIGHTLESS)
		ghost_sightless_images |= ghost_image //so ghosts can see the eye when they disable ghost sight
	updateallghostimages()

/mob/observer/Destroy()
	if (ghost_image)
		ghost_darkness_images -= ghost_image
		ghost_sightless_images -= ghost_image
		qdel(ghost_image)
		ghost_image = null
		updateallghostimages()
	. = ..()

mob/observer/check_airflow_movable()
	return FALSE

/mob/observer/CanPass()
	return TRUE

/mob/observer/dust()	//observers can't be vaporised.
	return

/mob/observer/gib()		//observers can't be gibbed.
	return

/mob/observer/is_blind()	//Not blind either.
	return

/mob/observer/is_deaf() 	//Nor deaf.
	return

/mob/observer/set_stat()
	stat = DEAD // They are also always dead

/proc/updateallghostimages()
	for (var/mob/observer/ghost/O in GLOB.player_list)
		O.updateghostimages()

/mob/observer/touch_map_edge()
	if(z in GLOB.using_map.sealed_levels)
		return

	var/new_x = x
	var/new_y = y

	if(x <= TRANSITIONEDGE)
		new_x = TRANSITIONEDGE + 1
	else if (x >= (world.maxx - TRANSITIONEDGE + 1))
		new_x = world.maxx - TRANSITIONEDGE
	else if (y <= TRANSITIONEDGE)
		new_y = TRANSITIONEDGE + 1
	else if (y >= (world.maxy - TRANSITIONEDGE + 1))
		new_y = world.maxy - TRANSITIONEDGE

	var/turf/T = locate(new_x, new_y, z)
	if(T)
		forceMove(T)
		inertia_dir = 0
		throwing = 0
		to_chat(src, "<span class='notice'>You cannot move further in this direction.</span>")


/mob/observer/Stat()
	. = ..()
	if(statpanel("Status"))
		if(iswarfare())
			if(client?.holder)
				stat("[BLUE_TEAM] reinforcements:", SSwarfare.blue.left)
				//stat("[BLUE_TEAM] capture points:", SSwarfare.blue.points)
				stat("[RED_TEAM] reinforcements:", SSwarfare.red.left)
				//stat("[RED_TEAM] capture points:", SSwarfare.red.points)

			for(var/area/A in GLOB.red_captured_zones)
				stat("Red Captured Trench:", A)
			for(var/area/A in GLOB.blue_captured_zones)
				stat("Blue Captured Trench:", A)

 //not the final mob obv, this needs much more work, probably won't be ready for first test, will need lots of love and work.
/mob/observer/verb/lateparty()
	set category = "Ghost"
	set name = "Late Party"
	set desc= "Join a randomized late party picked from a list!"

	var/partydelay = 12000 //in deciseconds (20 min rn)

	if(world.time < partydelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		to_chat(src, "It is too early for a late party!")
		return

	var/response = alert(src, "Would you like to try and join the late party?", "Join the Late Party", "Yes", "No")



	if(response == "Yes")
		for(var/mob/living/carbon/human/kroot/M in world) //the mob they will be placed in
			if(M.isempty == 1) //is the mob empty?
				if(M.health > 0)
					to_chat(M,"To be filled later")
					M.key = usr.key
					M.isempty = 0
					break
				to_chat(src,"\blue [M] is dead.")
			else
				to_chat(src,"\blue [M] is occupied.")
				to_chat(src,"\blue They are all occupied!!")
	else if (response == "No")
		to_chat(src,"\blue Then stop bothering me.")

/mob/living/carbon/human/ork/proc/request_player() //this grabs the friend and requests it
	for(var/mob/observer/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can ban shitters
			continue

/mob/living/carbon/human/kroot/proc/request_player() //this grabs the friend and requests it
	for(var/mob/observer/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can ban shitters
			continue

/mob/observer/ghost/verb/latepartynew()
	set category = "Ghost"
	set name = "Late Party Test"
	set desc= "Join a randomized late party picked from a list!"




	var/partydelay = 0 //in deciseconds (20 min rn)

	if(world.time < partydelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		to_chat(src, "It is too early for a late party!")
		return

	if(GLOB.deployed == 1) //checks if a party has already been sent, can make this value higher if you wish to send more than one!
		to_chat(src, "The late party has already deployed!")
		return

	if(src.isreadied == 1)
		to_chat(src,"<span class='warning'><b><font size=3>You leave the queue for the late party!</b></font size=3>")
		src.isreadied = 0 //unreadies player
		GLOB.partygang-- //subtracts from amount readied up
		return
	else
		to_chat(src,"<span class='warning'><b><font size=3>You join the late party!</b></font size=3>")
		src.isreadied = 1 //readies player up
		GLOB.partygang++ //adds to amount readied up


	switch(GLOB.partygang)
		if(1)
			usr.say("I'm joining the late party 1/6 deployed!")
		if(2)
			usr.say("I'm joining the late party 2/6 deployed!")
		if(3)
			usr.say("I'm joining the late party 3/6 deployed!")
		if(4)
			usr.say("I'm joining the late party 4/6 deployed!")
		if(5)
			usr.say("I'm joining the late party 5/6 deployed!")
		if(6)
			usr.say("I'm joining the late party 6/6 deployed! All slots are now filled!")
			GLOB.deployed++ //ensures that only 1 party can be sent



	var/latepartyoptions = list("")

	latepartyoptions += pick("Kroot") //randomly picks a late party

	var/partyteam = input("Spawn as late party", "Randomly selected party!") as anything in latepartyoptions

	switch(partyteam)

		if("Kroot")
			message_admins("[usr.key] has joined the late party: Kroot.", 0) //msgs jannies
			to_chat(usr, "<span class='warning'><b><font size=3>It's been a long flight, go to your Kroot tab and be sure to stretch!</b></font size=3>") //tells mob to do thing
			usr.loc = get_turf(locate("landmark*krootstart")) //where they spawning
			var/mob/living/carbon/human/kroot/new_character = new(usr.loc) // da mob
			new_character.key = usr.key //puts ghost in body with new key