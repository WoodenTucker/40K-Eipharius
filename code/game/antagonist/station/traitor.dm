var/datum/antagonist/heretic/traitors

// Inherits most of its vars from the base datum.
/datum/antagonist/heretic
	id = MODE_TRAITOR
	blacklisted_jobs = list(/datum/job/officer, /datum/job/warden, /datum/job/detective, /datum/job/captain, /datum/job/inquisitor, /datum/job/ig/commissar, /datum/job/acolyte)
	flags = ANTAG_SUSPICIOUS | ANTAG_RANDSPAWN | ANTAG_VOTABLE

/datum/antagonist/heretic/New()
	..()
	traitors = src

/datum/antagonist/heretic/get_extra_panel_options(var/datum/mind/player)
	return "<a href='?src=\ref[player];common=crystals'>\[set crystals\]</a><a href='?src=\ref[src];spawn_uplink=\ref[player.current]'>\[spawn uplink\]</a>"

/datum/antagonist/heretic/Topic(href, href_list)
	if (..())
		return 1
	if(href_list["spawn_uplink"])
		spawn_uplink(locate(href_list["spawn_uplink"]))
		return 1

/datum/antagonist/heretic/create_objectives(var/datum/mind/heretic)
	if(!..())
		return

	if(istype(heretic.current, /mob/living/silicon))
		var/datum/objective/assassinate/kill_objective = new
		kill_objective.owner = heretic
		kill_objective.find_target()
		heretic.objectives += kill_objective

		var/datum/objective/survive/survive_objective = new
		survive_objective.owner = heretic
		heretic.objectives += survive_objective

		if(prob(10))
			var/datum/objective/block/block_objective = new
			block_objective.owner = heretic
			heretic.objectives += block_objective
	else
		//switch(rand(1,100))
		//	if(1 to 50)
		var/datum/objective/assassinate/kill_objective = new
		kill_objective.owner = heretic
		kill_objective.find_target()
		heretic.objectives += kill_objective
			/*
			if(34 to 50)
				var/datum/objective/brig/brig_objective = new
				brig_objective.owner = heretic
				brig_objective.find_target()
				heretic.objectives += brig_objective
			if(51 to 66)
				var/datum/objective/harm/harm_objective = new
				harm_objective.owner = heretic
				harm_objective.find_target()
				heretic.objectives += harm_objective
			*/
			/*
			else
				var/datum/objective/steal/steal_objective = new
				steal_objective.owner = heretic
				steal_objective.find_target()
				heretic.objectives += steal_objective
			*/
		switch(rand(1,100))
			if(1 to 100)
				if (!(locate(/datum/objective/escape) in heretic.objectives))
					var/datum/objective/escape/escape_objective = new
					escape_objective.owner = heretic
					heretic.objectives += escape_objective

			else
				if (!(locate(/datum/objective/hijack) in heretic.objectives))
					var/datum/objective/hijack/hijack_objective = new
					hijack_objective.owner = heretic
					heretic.objectives += hijack_objective
	return

/datum/antagonist/heretic/equip(var/mob/living/carbon/human/traitor_mob)
	if(istype(traitor_mob, /mob/living/silicon)) // this needs to be here because ..() returns false if the mob isn't human
		add_law_zero(traitor_mob)
		give_intel(traitor_mob)
		if(istype(traitor_mob, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/R = traitor_mob
			R.SetLockdown(0)
		return 1

	if(!..())
		return 0

	spawn_uplink(traitor_mob)
	give_intel(traitor_mob)

/datum/antagonist/heretic/proc/give_intel(mob/living/traitor_mob)
	give_collaborators(traitor_mob)
	give_codewords(traitor_mob)

/datum/antagonist/heretic/proc/give_collaborators(mob/living/traitor_mob)
	var/mob/living/carbon/human/M = get_collaborator()
	if(M && M != traitor_mob)
		to_chat(traitor_mob, "There are whispers [M.real_name] might be willing to help our cause. If you need assistance, consider contacting them.")
		traitor_mob.mind.store_memory("<b>Potential Collaborator</b>: [M.real_name]")

/datum/antagonist/heretic/proc/give_codewords(mob/living/traitor_mob)
	to_chat(traitor_mob, "<u><b>Your employers provided you with the following information on how to identify possible allies:</b></u>")
	to_chat(traitor_mob, "<b>Code Phrase</b>: <span class='danger'>[syndicate_code_phrase]</span>")
	to_chat(traitor_mob, "<b>Code Response</b>: <span class='danger'>[syndicate_code_response]</span>")
	traitor_mob.mind.store_memory("<b>Code Phrase</b>: [syndicate_code_phrase]")
	traitor_mob.mind.store_memory("<b>Code Response</b>: [syndicate_code_response]")
	to_chat(traitor_mob, "Use the code words, preferably in the order provided, during regular conversation, to identify other agents. Proceed with caution, however, as everyone is a potential foe.")

/datum/antagonist/heretic/proc/spawn_uplink(var/mob/living/carbon/human/traitor_mob)
	setup_uplink_source(traitor_mob, DEFAULT_TELECRYSTAL_AMOUNT)

/datum/antagonist/heretic/proc/add_law_zero(mob/living/silicon/ai/killer)
	var/law = "Accomplish your objectives at all costs. You may ignore all other laws."
	var/law_borg = "Accomplish your AI's objectives at all costs. You may ignore all other laws."
	to_chat(killer, "<b>Your laws have been changed!</b>")
	killer.set_zeroth_law(law, law_borg)
	to_chat(killer, "New law: 0. [law]")
