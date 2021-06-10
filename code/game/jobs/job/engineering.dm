/datum/job/magos
	title = "Magos"
	department = "Engineering"
	head_position = 1
	department_flag = ENG|COM
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Adeptus Mechanicus"
	selection_color = "#7f6e2c"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer
	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors, access_robotics,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload, access_research,)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload, access_robotics, access_research,)

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Magos [current_name]")
		H.add_stats(rand(12,15), rand(10,13), rand(14,18), rand(16,20)) //idk what to do with Magos xd
		H.add_skills(rand(1,3), rand(3,5), rand(4,6),10, rand(1,3))
		H.warfare_faction = IMPERIUM
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos. The highest ranking member of the Adeptus Mechanicus on the outpost. Your duty is to ensure all mechanical and electrical services remain online and operational. Use your talents and the skills of your tech priests to further the goals of the Imperium. Praise the Omnissiah!</font></b></span>")
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink




/datum/job/engineer
	title = "Tech Priest"
	department = "Engineering"
	department_flag = ENG
	social_class = SOCIAL_CLASS_MED
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Magos"
	selection_color = "#B2A15F"
	economic_modifier = 5
	minimal_player_age = 7
	open_when_dead = 1
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_robotics, access_research)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_robotics, access_research)
	//alt_titles = list("Maintenance Technician","Engine Technician","Electrician",
	//	"Atmospheric Technician" = /decl/hierarchy/outfit/job/engineering/atmos)
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Tech-Priest [current_name]")
		H.add_stats(rand(12,14), rand(10,13), rand(12,15), rand(14,16)) //idk what to do with Magos xd
		H.add_skills(rand(2,5),rand(2,5),rand(1,2),rand(6,9),0)
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		to_chat(H, "<span class='notice'><b><font size=3>Praise the Omnissiah! You live to further mankinds knowledge and understanding of technology. Obey your Magos and ensure all machine spirits are pleased.</font></b></span>")





/*
/datum/job/atmos
	title = "Atmospheric Technician"
	department = "Engineering"
	department_flag = ENG

	total_positions = 0
	spawn_positions = 0
	supervisors = "the Magos"
	selection_color = "#5b4d20"
	economic_modifier = 5
	minimal_player_age = 7
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage)
	outfit_type = /decl/hierarchy/outfit/job/engineering/atmos
*/ //we dont use atmos here