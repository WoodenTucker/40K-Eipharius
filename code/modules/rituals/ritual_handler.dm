//Here is where the acutal functions act upon our datums, includes the initial switch statement for finding our specific little ritual :) - wel


/mob/living/proc/find_and_begin_ritual(phrase, ritual_leader)
	var/cleaned_phrase = lowertext(trim(phrase)) //trims the devil white space and puts our text to lowerspace
	var/datum/current_ritual = new /datum/ritual //we will set our ritual using the switch


	switch(cleaned_phrase)
		if("emperor preserve us")
			current_ritual = new /datum/ritual/preserve_us
			to_chat(ritual_leader, "I see your ritual beginning! [current_ritual]");

		else
			to_chat(ritual_leader, "Failed to find an adequate ritual... (Report this as a bug to jannies)")
			return

	//After the switch finds and assigns our ritual we go to the actual handling of it....
	run_ritual(current_ritual, ritual_leader)





/mob/living/proc/run_ritual(var/datum/ritual/current_ritual, var/mob/living/carbon/ritual_leader)
	if(ritual_leader.can_lead_ritual == FALSE)
		to_chat(ritual_leader, "I'm still exhausted from my last ritual attempt...")
		return;

	if(current_ritual.location_specific == TRUE)

		//theres gotta be a better way to compare areas but idk what
		var/area/ritual_leader_area = get_area(ritual_leader)
		var/area/ritual_area = current_ritual.ritual_area

		// if(ritual_leader_area.type != ritual_area)
		// 	to_chat(ritual_leader, "You cannot perform this ritual here...")
		// 	return;



	//this while is the most dangerous part, it must always have a way to break/exit to prevent infinite loops
	ritual_leader.ritual_leading = TRUE


	spawn(current_ritual.timeout) ritual_fails(current_ritual, ritual_leader)






/mob/living/proc/ritual_fails(var/datum/ritual/current_ritual,var/mob/living/carbon/ritual_leader)
	ritual_leader.ritual_leading = FALSE
	ritual_leader.correct_ritual_responses = 0
	ritual_leader.can_lead_ritual = FALSE
	spawn(300000)
		ritual_leader.can_lead_ritual = TRUE
	return;

