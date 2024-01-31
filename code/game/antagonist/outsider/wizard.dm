var/datum/antagonist/wizard/wizards

/datum/antagonist/wizard
	id = MODE_WIZARD
	role_text = "Rogue Psyker" //40k Edit: Corrected spelling
	role_text_plural = "Rogue Psykers" //40k Edit: Corrected spelling
	landmark_id = "Rogue Psyker" //40k Edit: Corrected spelling
	welcome_text = "For too long have you been running, from the dark whispers in your mind and the people in the black cloaks that seem to melt from the shadows trying to take you away. And now you find yourself here in this filthy backwater, try to survive another day but always look over your shoulder."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudwizard"

	hard_cap = 1
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 1
	min_player_age = 18

	faction = "IMPERIUM" //40k Edit: Changed faction to appropriate one for Psykers.


/datum/antagonist/wizard/New()
	..()
	wizards = src

/*/datum/antagonist/wizard/create_objectives(var/datum/mind/wizard)

	if(!..())
		return

	var/kill
	var/escape
	var/steal
	var/hijack

	switch(rand(1,100))
		if(1 to 30)
			escape = 1
			kill = 1
		if(31 to 60)
			escape = 1
			steal = 1
		if(61 to 99)
			kill = 1
			steal = 1
		else
			hijack = 1

	if(kill)
		var/datum/objective/assassinate/kill_objective = new
		kill_objective.owner = wizard
		kill_objective.find_target()
		wizard.objectives |= kill_objective
	if(steal)
		var/datum/objective/steal/steal_objective = new
		steal_objective.owner = wizard
		steal_objective.find_target()
		wizard.objectives |= steal_objective
	if(escape)
		var/datum/objective/survive/survive_objective = new
		survive_objective.owner = wizard
		wizard.objectives |= survive_objective
	if(hijack)
		var/datum/objective/hijack/hijack_objective = new
		hijack_objective.owner = wizard
		wizard.objectives |= hijack_objective
	return*/

/datum/antagonist/wizard/update_antag_mob(var/datum/mind/wizard)
	..()
	wizard.store_memory("<B>Remember:</B> do not forget to prepare your spells.")
	//wizard.current.real_name = "[pick(GLOB.wizard_first)] [pick(GLOB.wizard_second)]"
	wizard.current.SetName(wizard.current.real_name)

/*
/datum/antagonist/wizard/equip(var/mob/living/carbon/human/player)

	player.equip_to_slot_or_del(new /obj/item/(src), slot_r_hand)

	return 1

/datum/antagonist/wizard/check_victory()
	var/survivor
	for(var/datum/mind/player in current_antagonists)
		if(!player.current || player.current.stat)
			continue
		survivor = 1
		break
	if(!survivor)
		feedback_set_details("round_end_result","loss - psyker killed") ////40k Edit: Corrected name
		to_world("<span class='danger'><font size = 3>The [(current_antagonists.len>1)?"[role_text_plural] have":"[role_text] has"] been killed by the crew! The Space Wizards Federation has been taught a lesson they will not soon forget!</font></span>")*/


/datum/antagonist/wizard/print_player_summary()
	..()
	for(var/p in current_antagonists)
		var/datum/mind/player = p
		var/text = "<b>[player.name]'s spells were:</b>"
		if(!player.learned_spells || !player.learned_spells.len)
			text += "<br>None!"
		else
			for(var/s in player.learned_spells)
				var/spell/spell = s
				text += "<br><b>[spell.name]</b> - "
				text += "Speed: [spell.spell_levels["speed"]] Power: [spell.spell_levels["power"]]"
		text += "<br>"
		to_world(text)


//To batch-remove wizard spells. Linked to mind.dm.
/mob/proc/spellremove()
	if(!mind || !mind.learned_spells)
		return
	for(var/spell/spell_to_remove in mind.learned_spells)
		remove_spell(spell_to_remove)



// Humans can wear clothes.
//40k Edit: Removed clothing requirements - Psykers don't need to wear sandals
