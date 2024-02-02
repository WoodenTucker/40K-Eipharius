
/datum/species/lateparty/guardsmen
	name = SPECIES_GUARDSMEN
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Solar System, and over the last five centuries has spread colonies across a wide swathe of space. They hold a wide range of forms and creeds."
	min_age = 18 //no underage people
	max_age = 80
	gluttonous = GLUT_TINY
	slowdown = -0.2 //Faster than usual.
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

/datum/species/lateparty/guardsmen/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)
	if(H.f_style)
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>I need to remember my Regiment! (Check the Guardsman tab)</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
