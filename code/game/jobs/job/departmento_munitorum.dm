//  Munitorum Tribunus

/datum/job/qm2
	title = "House Noble"
	department_flag = PIL
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the merchant guilds"
	selection_color = "#337C81"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/administrator
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 100

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Lord [current_name]")
		H.add_skills(rand(5,8),rand(5,8),rand(5,8),rand(5,8),rand(5,8)) //melee, ranged, med, eng, surgery
		H.add_stats(rand(14,16), rand(14,16), rand(12,18), rand (12,18)) //a lil better fed than others.
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a member of an ancient Imperial House on this planet. You act as a go-between for the village and your merchant contacts on the outer systems. Work with your Servant Penitent to ensure the continued survival of your house, it is imperative that the line of succession remains unbroken. Ensure there are pilgrims working the farm and that the clinic is staffed, you are as reliant on them as they are upon you.</font></b></span>")

/datum/job/qm
	title = "House Penitent"
	department_flag = PIL
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Noble household"
	selection_color = "#337C81"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/qm
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Penitent [current_name]")
		H.add_stats(rand(15,16), rand(12,15), rand(12,15), rand(10,14)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,6),4,rand(3,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>A penitent in service to the Noble Household of this planet, you owe a debt of life to the family that extends generations down your lines to a distant ancestor, though despite the brand upon your neck and your status as a penitent. You fare better then most who come seeking fortune in this accursed world.</font></b></span>")

/datum/job/janissary
	title = "Vessorine Janissary"
	department_flag = PIL
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Noble household"
	selection_color = "#337C81"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/janissary
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(16,18), rand(16,18), rand(18,19), rand(10,13)) // Vessorine are the strongest, most formidable warriors in The Imperium. On the same level as Cadian Kasrkin.
		H.add_skills(rand(13,14),rand(9,10),rand(3,5),5,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>Three concepts hold primacy in Vessorine clan society to the exclusion of nearly all else: property, warcraft, and currency. The scarcity of resources and rocky landscape of Vessor made the ownership of arable land and grazing beasts one of the most important aspects of their primitive society. The populace grouped into clans for increased security and resources, and though the leader of a clan holds the title of Clansire, the term refers neither to patrilineal nor matrilineal descent. From an early age, typically after First Bonding, both male and female children begin training as janissaries. They undergo training to enhance their strength, stamina, and agility, sometimes doing so with only the food and water they can find in the wilderness. They also learn the three primary Vessorine battle arts: open-hand, blade, and gun lore. By the time they participate in their first contract, an ascension ritual called Second Bonding, they are formidable warriors equal to any in the Imperium. In preparation for Second Bonding, janissaries receive their first repatriation tattoo, which declares the bond a clan will pay for the return of their soldier if captured.</font></b></span>")

// Munitorum Menial

/datum/job/cargo_tech
	title = "Munitorum Menial"
	department = "Supply"
	department_flag = CIV
	total_positions = 0
	spawn_positions = 0
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
	cultist_chance = 100

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(10,14), rand(10,13), rand(10,13), rand(10,13))
		H.add_skills(rand(6,7),rand(5,7),rand(3,5),rand(2,4),1) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
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
	cultist_chance = 100

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
	cultist_chance = 100
