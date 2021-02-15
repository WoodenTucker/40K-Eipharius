/mob/living/carbon/human/proc/khorne(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Khorne"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		M.say("You cannot call upon Khorne while restrained!")	//user is tied up
		return