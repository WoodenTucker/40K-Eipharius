/datum/job/magos
	title = "Magos Dominus"
	department = "Adeptus Mechanicus"
	head_position = 1
	department_flag = ENG|COM|SCI
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
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 5
	ranged_skill = 9
	medical_skill = 7
	engineering_skill = 15
	surgery_skill = 9

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
		H.add_stats(rand(12,15), rand(14,16), rand(15,18), rand(16,20)) //idk what to do with Magos xd
		H.warfare_faction = IMPERIUM
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos. The highest ranking member of the Adeptus Mechanicus on the outpost. Your duty is to ensure all mechanical and electrical services remain online and operational. Use your talents and the skills of your tech priests to further the goals of the Imperium. Praise the Omnissiah!</font></b></span>")
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink




/datum/job/engineer
	title = "Tech Priest Enginseer"
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
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 4
	ranged_skill = 7
	medical_skill = 5
	engineering_skill = 13
	surgery_skill = 7

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

// Biologis

// Magos

/datum/job/geneticist
	title = "Magos Biologis"
	department = "Medical"
	department_flag = MED|SCI|ENG
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	open_when_dead = 1
	supervisors = "the Sister Hospitaller and Magos"
	selection_color = "#967096"
	economic_modifier = 7
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_research,access_maint_tunnels, access_robotics, access_engine, access_engine_equip,)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_research,access_maint_tunnels, access_robotics, access_engine_equip, access_engine)
	outfit_type = /decl/hierarchy/outfit/job/medical/geneticist
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 6
	ranged_skill = 6
	medical_skill = 5
	engineering_skill = 10
	surgery_skill = 13

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Biologis [current_name]")
		H.add_stats(rand(10,14), rand(10,14), rand(10,13), rand(15,20))
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Biologis. You lead biological research on the outpost and oversee the construction of Skitarii.</font></b></span>")

// Magos Biologis Xenobiologist

/datum/job/xenobiologist
	title = "Magos Xenologist"
	department = "Science"
	department_flag = SCI

	total_positions = 3
	spawn_positions = 2
	supervisors = "the Magos Dominus"
	selection_color = "#633d63"
	economic_modifier = 7
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_hydroponics)
	minimal_access = list(access_research, access_xenobiology, access_hydroponics)
//	alt_titles = list("Xenobotanist")
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/science/xenobiologist




//Skitarii
/decl/hierarchy/outfit/job/skitarii
	uniform = /obj/item/clothing/under/rank/skitarii
	suit = /obj/item/clothing/suit/storage/hooded/skitarii
	shoes = /obj/item/clothing/shoes/skitshoes
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/red_team
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/warfare/rat = 1,)


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