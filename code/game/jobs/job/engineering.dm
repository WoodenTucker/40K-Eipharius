/datum/job/chief_engineer
	title = "Magos"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Adeptus Mechanicus"
	selection_color = "#7f6e2c"
	social_class = SOCIAL_CLASS_HIGH
	req_admin_notify = 1
	economic_modifier = 10
	open_when_dead = 0
	ideal_character_age = 50
	engineering_skill = 10
	medical_skill = 2
	surgery_skill = 0
	melee_skill = 4
	ranged_skill = 4
	announced = FALSE //never ever change this to anything else unless you want crazy lag on join
	latejoin_at_spawnpoints = TRUE
	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Magos [current_name]")
		H.add_stats(rand(12,15), rand(10,13), rand(14,18), rand(16,20)) //idk what to do with Magos xd
		H.warfare_faction = IMPERIUM
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos. The highest ranking member of the Adeptus Mechanicus on the outpost. Your duty is to ensure all mechanical and electrical services remain online and operational. Use your talents and the skills of your tech priests to further the goals of the Imperium. Praise the Omnissiah!</font></b></span>")
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink


	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer

/datum/job/engineer
	title = "Tech Priest"
	department = "Engineering"
	department_flag = ENG
	social_class = SOCIAL_CLASS_MED
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Magos"
	selection_color = "#5b4d20"
	economic_modifier = 5
	minimal_player_age = 7
	open_when_dead = 1
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage)
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