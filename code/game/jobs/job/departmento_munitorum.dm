//  Munitorum Tribunus

/datum/job/qm
	title = "Munitorum Tribunus"
	department = "Supply"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Seneschal and the Administrator"
	selection_color = "#337C81"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station,)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/qm
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(12,15), rand(12,15), rand(12,15), rand(15,16))
		H.add_skills(rand(6,8),rand(6,8),rand(3,5),rand(3,5),4) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>The others may not know it, but you're the most powerful man on the planet. You control what comes and goes as well as which palms are greased and which are left wanting.</font></b></span>")

// Munitorum Menial

/datum/job/cargo_tech
	title = "Munitorum Menial"
	department = "Supply"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = 1
	social_class = SOCIAL_CLASS_MED
	announced = 0
	supervisors = "the Munitorum Tribunus, the Administrator and the Seneschal"
	selection_color = "#337C81"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(10,14), rand(10,13), rand(10,13), rand(10,13))
		H.add_skills(rand(5,7),rand(5,7),rand(3,5),rand(2,4),1) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>Keep things moving! Make sure imports and exports get where they need to go! If you're lost, speak to the Munitorum Priest!</font></b></span>")
// Munitorum Explorator

/datum/job/mining
	title = "Munitorum Explorator"
	department = "Supply"
	department_flag = SUP
	total_positions = 0
	spawn_positions = 0 //remember to open these one day when its ready
	supervisors = "the Munitorum Tribunus and the Seneschal"
	selection_color = "#337C81"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_mining, access_mining_station, access_mailsorting)
	alt_titles = list("Drill Technician","Prospector")
	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

// Munitorum Record Keeper

/datum/job/librarian
	title = "Record Keeper"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "the Munitorum Tribunus and the Seneschal"
	selection_color = "#515151"
	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library)
	alt_titles = list("Journalist")
	outfit_type = /decl/hierarchy/outfit/job/librarian
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 6
	ranged_skill = 7
	medical_skill = 3
	engineering_skill = 3
	surgery_skill = 2
