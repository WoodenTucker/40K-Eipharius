//  Trader House

/datum/job/roguetrader
	title = "Rogue Trader"
	department = "Rogue Trader"
	head_position = 1
	department_flag = SUP
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Yourself."
	selection_color = "#315dd4"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 25
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/roguetrader
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 40


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]") // No title testing. 
		H.add_stats(rand(14,18), rand(14,18), rand(14,18), rand(14,18))
		H.add_skills(rand(6,10),rand(6,10),rand(5,6),rand(1,8),rand(1,8)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.witchblood()
		H.warfare_faction = IMPERIUM
		H.verbs += list(/mob/living/carbon/human/proc/hire)
		to_chat(H, "<span class='notice'><b><font size=3>You are the Rogue Trader, taking residence upon this world to gain power and prestige. You have your mercenaries. Your Veteran and your Xeno. Buy and sell well in your Bazaar. Overthrow the Governorship with or without the heir if the opportunity presents itself.</font></b></span>")


/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/janissary
	title = "Vessorine Janissary"
	department_flag = SUP
	total_positions = 0 // Disabled for now.
	spawn_positions = 0
	supervisors = "the Rogue Trader"
	selection_color = "#315dd4"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_bar, access_village, access_village, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_village, access_village, access_administratum, access_change_ids, access_keycard_auth,)
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
	cultist_chance = 20

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

/datum/job/xenomerc
	title = "Xeno Mercenary"
	department_flag = SUP
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Rogue Trader"
	selection_color = "#315dd4"
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 5


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(16,22), rand(16,22), rand(17,20), rand (6,40)) //its a xeno mercenary, random shit.
		H.add_skills(rand(10,12),rand(9,10),rand(3,5),5,rand(2,4)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.stat = UNCONSCIOUS
		H.sleeping = 500
		to_chat(H, "<span class='notice'><b><font size=3>You are a Xeno Mercenary hired by the Rogue Trader. Listen to their every command.  <br> <span class = 'badmood'> + Go to your Mercenary tab and select your fate. + </span> </font></b></span>")
		H.verbs += list(
			/mob/living/carbon/human/proc/mercenaryclass,
		)


/*
Mercenary System
*/

/mob/living/carbon/human/proc/mercenaryclass()
	set name = "Select your class"
	set category = "Xeno Mercenary"
	set desc = "Choose your species and job."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	src.verbs -= list(/mob/living/carbon/human/proc/mercenaryclass)
	var/fates = list("Kroot Shaper", "Ork Freeboota", /*"Eldar Corsair"*/)


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Kroot Shaper")
			var/mob/living/carbon/human/kroot/new_character = new(usr.loc) // da mob
			new_character.key = usr.key //puts ghost in body with new key
			visible_message("You wake up after a long flight to find yourself in Imperial space. Go to your kroot tab and stretch your muscles.")
			src.verbs -= list(/mob/living/carbon/human/proc/mercenaryclass)
			qdel(src)
		if("Ork Freeboota")
			var/mob/living/carbon/human/ork/new_character = new(usr.loc) // da mob
			new_character.key = usr.key //puts ghost in body with new key
			visible_message("You wake up after a long flight to find yourself in Imperial space.")
			src.verbs -= list(/mob/living/carbon/human/proc/mercenaryclass)
			qdel(src)
		/*if("Eldar Corsair")
			var/mob/living/carbon/human/eldar/corsair/new_character = new(usr.loc) // da mob
			new_character.key = usr.key //puts ghost in body with new key
			visible_message("You wake up after a long flight to find yourself in Imperial space.")
			src.verbs -= list(/mob/living/carbon/human/proc/mercenaryclass)
			qdel(src)
*/
// OLD UNDER HERE!//

/*

/datum/job/qm2
	title = "House Noble"
	department_flag = PIL
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "The merchant guilds"
	selection_color = "#3e0177"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_bar, access_village, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_village, access_administratum, access_change_ids, access_keycard_auth,)
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
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Noble [current_name]")
		H.add_skills(rand(5,8),rand(5,8),rand(5,8),rand(5,8),rand(5,8)) //melee, ranged, med, eng, surgery
		H.add_stats(rand(12,15), rand(14,16), rand(12,18), rand (12,12)) //a lil better fed than others.
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.witchblood()
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
	access = list(access_bar, access_village, access_village, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_village, access_village, access_administratum, access_change_ids, access_keycard_auth,)
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
	cultist_chance = 20

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Penitent [current_name]")
		H.add_stats(rand(14,16), rand(12,15), rand(12,15), rand(10,12)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,6),4,rand(3,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>A penitent in service to the Noble Household of this planet, you owe a debt of life to the family that extends generations down your lines to a distant ancestor, though despite the brand upon your neck and your status as a penitent. You fare better then most who come seeking fortune in this accursed world.</font></b></span>")

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
	access = list(access_village, access_cargo, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_village, access_cargo)
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	cultist_chance = 20

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(10,14), rand(10,13), rand(10,13), rand(10,13))
		H.add_skills(rand(6,7),rand(5,7),rand(3,5),rand(2,4),1) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.adjustStaminaLoss(-INFINITY)
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
	access = list(access_village, access_cargo, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_mining, access_mining_station)
	alt_titles = list("Drill Technician","Prospector")
	outfit_type = /decl/hierarchy/outfit/job/cargo/mining
	cultist_chance = 20

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
	access = list(access_library, access_village)
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
	cultist_chance = 20

/datum/job/scion
	title = "Tempestus Scion"
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "The Astra Militarum."
	selection_color = "#c9952f"
	economic_modifier = 7
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/scion
	announced = FALSE
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Scion [current_name]")
		H.add_stats(rand(16,18), rand(15,18), rand(14,17), rand(14,17)) //highly trained and skilled
		H.add_skills(rand(10,10),rand(9,10),rand(5,7),rand(5,6),rand(6,7)) //SUFFER NOT THE ALIEN, SUFFER NOT THE HERETIC
		H.assign_random_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.assign_squad_leader(IMPERIUM)
		H.warfare_faction = IMPERIUM
		H.adjustStaminaLoss(-INFINITY)
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Tempestus Scion attached to the retinue of the Lord Trader, your services ultimately being in the protection of imperial assets here on Eipharius on behalf of the Astra Militarum. It's barely been a week since leaving your Regiment and you are still adjusting to the new reality of your posting. Loyal to the Emperor above all else, Tempestus Scions provide the Imperial High Command with a core of flexible, nigh-incorruptible soldiers. Deployed sparingly, they can be depended upon to complete any mission, no matter how deadly. Racing into battle aboard armoured transports or plummeting down on Grav-Chutes, the Scions are the sharp edge of the Imperial Guard war machine.</font></b></span>")


*/
