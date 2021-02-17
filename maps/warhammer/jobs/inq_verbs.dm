/mob/living/carbon/human/proc/declareheretic(var/mob/living/carbon/human/M)
	set category = "Inquisitor"
	set name = "Declare Heretic"
	set desc="Declare a member of the crew a heretic!"
	if(M.stat==DEAD)
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot declare a heretic if you're tied up!")	//user is tied up
		return

	var/message = input("Name of the heretic", "Declare heretic", null, null) as message
	message = sanitize(message, 500, extra = 0)
	if(message)
		message = replacetext(message, "\n", "<br>") // required since we're putting it in a <p> tag
		to_world("<span class=danger><b>[src.real_name] declares the following as heretic(s):</b><p style='text-indent: 50px'>[message]</p></span>")
		log_admin("Announce: [key_name(usr)] : [message]")