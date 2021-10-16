// Rogue Trader

var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Rogue Trader"
	department = "Rogue Trader"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "The Golden Throne and the High Lords of Terra"
	selection_color = "#011c77"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 25
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE

	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/captain
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 12
	ranged_skill = 12
	medical_skill = 5
	engineering_skill = 6
	surgery_skill = 3

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Rogue Trader [current_name]")
		H.add_stats(rand(12,18), rand(12,18), rand(12,18), rand(12,18))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(/mob/living/carbon/human/proc/hire,)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Rogue Trader, the owner and leader of this outpost. You wield a golden writ of authority directly from the High Lords of Terra themselves. None can command you except your lust for profit and your mission to expand Imperial influence.</font></b></span>")


/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/captain/get_access()
	return get_all_station_access()

// Seneschal

/datum/job/hop
	title = "Seneschal"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Rogue Trader"
	selection_color = "#00494e"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 9
	ranged_skill = 9
	medical_skill = 3
	engineering_skill = 4
	surgery_skill = 2

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(10,12), rand(10,14), rand(10,13), rand(13,18))
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


/mob/living/carbon/human/proc/hire(var/mob/living/carbon/human/M in view(src))
	set category = "Rogue Trader"
	set name = "Hire Mercenary"
	set desc = "Finally! Some recognition!"
	if(!client)
		to_chat(src, "<span class='notice'>Thats not a person.</span>")
		return

	var/list/options = list(
		"Hire on",
		"Cancel",
		)

	var/theoptions = input("Would you like to hire [M]?", "Hiring Menu") as null|anything in options
	if (isnull(theoptions))																	//You chose poorly
		return
	if(!Adjacent(M))																			//How close are we?
		to_chat(src, "<span class='notice'>Get a little closer.</span>")
		return

	switch(theoptions)
		if ("Cancel")
			return	//do nothing

		if ("Hire on")
			for(var/obj/item/card/id/W in M.contents)
				M.unEquip(W)
				visible_message(("<span class='alert'>[src] snatches [W] and tosses it on the ground.</span>"))

			var/obj/item/card/id/dog_tag/guardsman/W = new
			W.access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels, access_morgue)
			W.assignment = "Hired Mercenary"
			W.registered_name = M.real_name
			W.update_label()
			M.equip_to_slot_or_del(W, slot_wear_id)
			M.regenerate_icons()
			M.mind.special_role = "Mercenary"
			src.mind.special_role = "Mercenary"
			M.warfare_faction = IMPERIUM
			M.AddInfectionImages()
			src.AddInfectionImages()
			visible_message("<span class='alert'>[src] slaps a new ID onto [M].</span>")
			src.say("Welcome to my service.")
		else
			return

// Undertaker

/datum/job/undertaker
	title = "Undertaker"
	department = "Service"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MIN
	total_positions = 3
	spawn_positions = 3
	latejoin_at_spawnpoints = TRUE
	species_role = "Child"
	open_when_dead = 1
	supervisors = "the Abbot and every adult you see."
	selection_color = "#848484"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	minimal_access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	outfit_type = /decl/hierarchy/outfit/job/service/undertaker
	announced = FALSE
	auto_rifle_skill = 2
	semi_rifle_skill = 2
	sniper_skill = 2
	shotgun_skill = 2
	lmg_skill = 2
	smg_skill = 2
	melee_skill = 4
	ranged_skill = 6
	medical_skill = 5
	engineering_skill = 2
	surgery_skill = 5

	equip(var/mob/living/carbon/human/H)
		H.add_stats(rand(10,10), rand(8,11), rand(16,17), rand(8,10))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,)
		H.set_trait(new/datum/trait/death_tolerant())
		to_chat(H, "<span class='notice'><b><font size=3>You are a war orphan, found and taken in by the generous Rogue Trader you owe him your life. However, you must earn your keep. The Rogue Trader has placed you in the charge of the Abbot who has you burying the dead. This is a vital task, it is said bodies that are left unburied are unable to move on to the Emperor's Grace! Make sure you bury any body you see! </font></b></span>")
