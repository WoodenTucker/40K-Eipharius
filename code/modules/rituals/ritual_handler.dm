//Here is where the acutal functions act upon our datums, includes the initial switch statement for finding our specific little ritual :) - wel



/mob/living/proc/find_and_begin_ritual(phrase, var/mob/ritual_leader)
	var/cleaned_phrase = lowertext(trim(phrase)) //trims the devil white space and puts our text to lowerspace
	var/datum/current_ritual = new /datum/ritual //we will set our ritual using the switch

	if(ritual_leader.can_lead_ritual == FALSE)
		to_chat(ritual_leader, "I'm still exhausted from my last ritual attempt...")
		return;


//for now put stuff in the switch, this could probably be made more efficient in the future
	switch(cleaned_phrase)
		if("emperor i consecrate this place today anew and without reserve to your righteous fury")
			current_ritual = new /datum/ritual/preserve_us //attaches a fresh datum
		if("holy emperor you have given us your saints to purge wickedness across the stars i call upon them now to reveal the truth")
			current_ritual = new /datum/ritual/invoke_the_saints
		else
			to_chat(ritual_leader, "Failed to find an adequate ritual... (Report this as a bug to jannies)")
			return

	//After the switch finds and assigns our ritual we go to the actual handling of it....
	run_ritual(current_ritual, ritual_leader)





/mob/living/proc/run_ritual(var/datum/ritual/current_ritual, var/mob/living/carbon/ritual_leader)


	// if this ritual is job restricted runs a check to ensure you got the job mang!
	if(current_ritual.allowed_jobs.len > 0)
		var/datum/job/J = SSjobs.GetJob(ritual_leader.job)
		if(!is_type_in_list(J,current_ritual.allowed_jobs))
			return


	if(current_ritual.location_specific == TRUE)

		// theres gotta be a better way to compare areas but idk what I'm rusty as shit at DM
		var/area/ritual_leader_area = get_area(ritual_leader)
		var/area/ritual_area = current_ritual.ritual_area

		if(ritual_leader_area.type != ritual_area)
			return;


	ritual_leader.active_ritual = current_ritual
	ritual_leader.can_lead_ritual = FALSE //cant lead 2 rituals at once
	ritual_leader.active_ritual.ritualists[ritual_leader.ckey] = ritual_leader //Automatically adds the ritual leader as a ritualist so they don't necessarily have to say response




	//timer to fail ritual, sets timer onto mob so it can be cancelled in hear_say if ritual succeeds.
	current_ritual.timer_id = addtimer(CALLBACK(src, .proc/ritual_ends), current_ritual.timeout, TIMER_STOPPABLE|TIMER_UNIQUE|TIMER_NO_HASH_WAIT|TIMER_OVERRIDE)




/mob/living/proc/ritual_ends()
    var/datum/ritual/current_ritual = src.active_ritual
    current_ritual.ritual_active = FALSE


    var success = FALSE // Assume failure by default

    // Did we say the thing enough and did we have enough friends?
    if (current_ritual.correct_responses >= current_ritual.min_chants && current_ritual.ritualists.len >= current_ritual.min_ritualists)
        if (current_ritual.additional_req_check != null)
            success = call(current_ritual.additional_req_check)(src) == TRUE
        else
            success = TRUE // No additional check required, so it's a success

    if (success)
        call(current_ritual.success_result)(src)
    else
        call(current_ritual.fail_result)(src) // Calls our fail result function

    addtimer(CALLBACK(src, .proc/can_ritual_again), 5 MINUTES, TIMER_UNIQUE|TIMER_NO_HASH_WAIT|TIMER_OVERRIDE)
    return;


/mob/living/proc/can_ritual_again()
	src.can_lead_ritual = TRUE
	return;


