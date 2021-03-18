var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Rogue Trader"
	department = "Command"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "The Golden Throne and the High Lords of Terra"
	selection_color = "#1d1d4f"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 25
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/job/captain

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Rogue Trader [current_name]")
		H.add_stats(rand(10,18), rand(10,18), rand(10,18), rand(10,18)) //RT's are really fucking random in lore so we'll make his stats random
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Rogue Trader, the owner and leader of this outpost. You wield a golden writ of authority directly from the High Lords of Terra themselves. None can command you except your lust for profit and your mission to expand Imperial influence.</font></b></span>")


/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/hop
	title = "Seneschal"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Rogue Trader"
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,8), rand(8,14), rand(7,13), rand(13,18))  //Seneschals to me feel like a smart right-hand man rather than a brute, their stats reflect this
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are the Seneschal, the right hand of the Rogue Trader. You are to handle his/her issues when he/she is not present. If the Rogue Trader is incapacitated then you assume command. While he is alive organize his affairs and coordinate trade with the surrounding settlements. You are also responsible for the vault and exchanging currency from it.</font></b></span>")


	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)

	outfit_type = /decl/hierarchy/outfit/job/hop