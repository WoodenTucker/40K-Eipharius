var/datum/antagonist/ert/astartes

/datum/antagonist/ert/astartes
	id = MODE_ERT
	role_text = "Astartes Squad"
	role_text_plural = "Astartes Squads"
	welcome_text = "A member of the Adeptus Astartes, deployed to the planet by your Chapter, obey your Squad Lead and Segmentum Command."
	antag_text = "You are an <b>anti</b> antagonist! Within the rules, \
		try to save the installation and its inhabitants from the ongoing crisis. \
		Try to make sure other players have <i>fun</i>! If you are confused or at a loss, always adminhelp, \
		and before taking extreme actions, please try to also contact the administration! \
		Think through your actions and make the roleplay immersive! <b>Please remember all \
		rules aside from those without explicit exceptions apply to the team.</b>"
	leader_welcome_text = "You lead a highly elite squad of the Adeptus Astartes. You report only to Segmentum Command and your Chapter Master. SERVE THE EMPEROR!"
	landmark_id = "Response Team"

	flags = ANTAG_OVERRIDE_JOB | ANTAG_HAS_LEADER | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED
	antaghud_indicator = "hudloyalist"

	hard_cap = 5
	hard_cap_round = 7
	initial_spawn_req = 3
	initial_spawn_target = 5
	show_objectives_on_creation = 0 //we are not antagonists, we do not need the antagonist shpiel/objectives
	landmark_id = "ERT"

/datum/antagonist/ert/astartes/New()
	..()
	leader_welcome_text = "As leader of the Emergency Response Team, you answer only to [GLOB.using_map.boss_name], and have authority to override the Rogue Trader where it is necessary to achieve your mission goals. It is recommended that you attempt to cooperate with the Rogue Trader where possible, however."
	//astartesert = src

/datum/antagonist/ert/astartes/greet(var/datum/mind/player)
	if(!..())
		return
	to_chat(player.current, "As a member of the Adeptus Astartes, you represent the best of the best of humanity, and serve as the final bulwark against the endless night. Listen to your squad lead and Segmentum Command.")
