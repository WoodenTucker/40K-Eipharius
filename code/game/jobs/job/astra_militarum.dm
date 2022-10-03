// IG Datum

/datum/job/ig
	title = "IGDATUM" // IMPERIAL GUARDSMAN ROLE
	supervisors = "The Commissar and your Sergeant."
	total_positions = 0
	spawn_positions = 0
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/ig //will need to be replaced eventually - wel
	selection_color = "#33813A"
	department_flag = SEC
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 8
	lmg_skill = 7
	smg_skill = 8
	open_when_dead = FALSE
	announced = FALSE
	can_be_in_squad = TRUE
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common,
			            access_all_personal_lockers, access_village, access_armory)
	minimal_access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_armory
			            )

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(12,16), rand(12,16), rand(12,16), rand (8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,6),rand(1,4),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("Guardsman [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='notice'><b><font size=3>You are a soldier of the Imperium. The Emperor Protects. </font></b></span>")
		var/troopnum = rand(1,50000)
		switch(title)
			if("Krieg Guardsman")
				H.fully_replace_character_name("Guardsman [troopnum]")
				H.implant_loyalty(src)
		H.verbs += list(
		/mob/living/carbon/human/proc/igattack,
		/mob/living/carbon/human/proc/igcanthold,
		/mob/living/carbon/human/proc/igcharge,
		/mob/living/carbon/human/proc/igholdline,
		/mob/living/carbon/human/proc/iginhisname,
		/mob/living/carbon/human/proc/igregroup,
		/mob/living/carbon/human/proc/igretreat,
		/mob/living/carbon/human/proc/igrunforlifes,
		/mob/living/carbon/human/proc/igyessir)

// Guardsmen

/datum/job/ig/guardsman
	title = "Imperial Guardsman"
	total_positions = 4
	spawn_positions = 4
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 8
	lmg_skill = 7
	smg_skill = 8
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/guardsman
	alt_titles = list(
		"Cadian Guardsman" = /decl/hierarchy/outfit/job/guardsman,
		"Catachan Jungle Hunter" = /decl/hierarchy/outfit/job/guardsman/catachan,
		"Krieg Guardsman" = /decl/hierarchy/outfit/job/guardsman/krieg,
		"Valhallan Ice Warrior" = /decl/hierarchy/outfit/job/guardsman/valhallan
		)
	cultist_chance = 20

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(15,17), rand(15,17), rand(15,17), rand (8,14))
		H.add_skills(rand(8,10),rand(8,10),rand(3,6),rand(1,6),rand(1,6)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		if(title == "Krieg Guardsman")
			var/troopnum = rand(1,50000)
			H.fully_replace_character_name("Guardsman [troopnum]")
		else H.fully_replace_character_name("Guardsman [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()

		H.get_idcard()?.access = list(access_security, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")

		if(title == "Krieg Guardsman")
			H.add_skills(rand(7,10),rand(6,10),rand(3,6),rand(3,6),rand(1,3))
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			H.implant_loyalty(src)
		switch(title)
			if("Cadian Guardsman" || "Valhallan Ice Warrior" || "Catachan Jungle Hunter")
				if(title == "Catachan Jungle Hunter")
					H.add_skills(rand(9,10),rand(8,10),rand(3,6),rand(2,5),rand(1,5))
				if(title == "Valhallan Ice Warrior")
					H.add_skills(rand(8,10),rand(8,10),rand(3,6),rand(2,5),rand(1,5))
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)

//Whiteshield

/datum/job/ig/whiteshield
	title = "Imperial Guard Conscript"
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/whiteshield
	can_be_in_squad = FALSE
	auto_rifle_skill = 8
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 6
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(12,16), rand(12,16), rand(12,16), rand (8,14))
		H.add_skills(rand(6,9),rand(3,7),rand(1,5),rand(1,4),rand(1,4)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		H.fully_replace_character_name("Conscript [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='notice'><b><font size=3>STRAIGHTConscripts are units within the Imperial Guard that consist of normal Imperial citizens with little or no military training, new Guard recruits who have not yet entered training, children of an already extant regiment's troops or standing Guardsmen who have not yet completed their training. Sometimes, in military emergencies, the Imperium's need for manpower is so great that normal Imperial citizens will simply find themselves conscripted by their local Imperial Guard regiment. </font></b></span>")

//Sharpshooters

/datum/job/ig/guardsman/sharpshooter // can i be fucked renaming every /sharpshooter into /spec? no. remember to just call /sharpshooter/[regiment] instead
	title = "Imperial Guard Specialist"
	total_positions = 2
	spawn_positions = 2
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sharpshooter
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 10
	shotgun_skill = 8
	lmg_skill = 10
	smg_skill = 8
	cultist_chance = 15 //same chance as sniper now.
	alt_titles = list(
		"Cadian Plasma Gunner" = /decl/hierarchy/outfit/job/sharpshooter,
		"Valhallan Heavy Autogunner" = /decl/hierarchy/outfit/job/sharpshooter/valhalla,
		"Catachan Flamer" = /decl/hierarchy/outfit/job/guardsman/catachan,
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(17,18), rand(14,16), rand(17,18), rand (14,16)) //Specialists are special, they arent every single random ass soldier
		H.add_skills(rand(7,10),rand(9,10),rand(3,4),rand(3,5),rand(1,5)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("Specialist [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()

		to_chat(H, "<span class='notice'><b><font size=2>You are the specialised tool of your Regiment's Doctrine and of the Astra Militarum, using their preferred specialist weapon and unleashing havoc by landing decisive strikes upon the enemies of the Imperium with your extended training. Bring glory to your Regiment. The Emperor Protects. </font></b></span>")
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='notice'><b><font size=2> Obey your Sergeant and Commissar. The Emperor Protects </font></b></span>")

		switch(title)
			if("Cadian Plasma Gunner" || "Valhallan Heavy Autogunner" || "Catachan Flamer")
				if(title == "Catachan Flamer")
					H.add_skills(rand(9,10),rand(7,10),rand(3,4),rand(3,5),rand(1,5))
				if(title == "Valhallan Heavy Autogunner")
					H.add_skills(rand(7,10),rand(9,10),rand(3,4),rand(3,5),rand(1,5))
/* //DO NOT FORGET TO READD IT IN THE MAP CONFIGS ONCE ITS DONE!!!
//el penitente
/datum/job/prisoner/penitent
	title = "Penitent Auxilia"
	total_positions = 0
	spawn_positions = 0
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sniper
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 5
	shotgun_skill = 6
	lmg_skill = 5
	smg_skill = 6
	cultist_chance = 50 //penitents be penitentin
	//these alt titles are wrong, create /outfits/ for penitents and put them down here
	alt_titles = list(
		"Deserter" = /decl/hierarchy/outfit/job/sniper,
		"Drug-Dealer" = /decl/hierarchy/outfit/job/sniper/valhalla,
		"Mad-Surgeon" = /decl/hierarchy/outfit/job/sniper/krieg,
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(11,14), rand(11,16), rand(14,16), rand (10,16)) //prisoners aren't well fed
		H.add_skills(rand(5,8),rand(5,8),rand(3,7),rand(3,7),rand(3,7)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		H.fully_replace_character_name("Penitent [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()

		to_chat(H, "<span class='notice'><b><font size=3>You are a penitent, a criminal, you chose to be turned into a penal legionairee instead of facing the commissar's boltpistol, and here you are, whatever you may have been, you are now just a number. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3> You answer to essentially any imperial force. The Emperor Protects </font></b></span>")

		switch(title)
			if("Deserter" || "Drug-Dealer || "Mad-Surgeon")
				if(title == "Drug-Dealer")
					H.add_skills(rand(3,6),rand(3,6),rand(3,6),rand(2,5),rand(1,5))
				if(title == "Mad-Surgeon")
					H.add_skills(rand(4,7),rand(4,7),rand(8,10),rand(2,5),rand(8,10))
*/

// snipings a good job mate
/datum/job/ig/guardsman/sniper
	title = "Imperial Guard Sniper"
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sniper
	auto_rifle_skill = 7
	semi_rifle_skill = 9
	sniper_skill = 11
	shotgun_skill = 6
	lmg_skill = 7
	smg_skill = 8
	cultist_chance = 15 //snipers have even less chance to be heretics than guardsmen.
	alt_titles = list(
		"Cadian Long Las" = /decl/hierarchy/outfit/job/sniper,
		"Valhallan Scout Sniper" = /decl/hierarchy/outfit/job/sniper/valhalla,
		"Krieg Marksman" = /decl/hierarchy/outfit/job/sniper/krieg,
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,15), rand(14,16), rand(14,16), rand (10,16)) //if you are a SNIPA you must be atleast a bit smarter than your average goardsoman
		H.add_skills(rand(7,10),rand(10,11),rand(3,6),rand(1,4),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("SharpShooter [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()

		to_chat(H, "<span class='notice'><b><font size=3>You are the specialised tool of your Regiment's Doctrine and of the Astra Militarum, using their preferred specialist weapon and unleashing havoc by landing decisive strikes upon the enemies of the Imperium with your extended training. Bring glory to your Regiment. The Emperor Protects. </font></b></span>")

		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='notice'><b><font size=3> Obey your Sergeant and Commissar. The Emperor Protects </font></b></span>")

		switch(title)
			if("Cadian Long Las" || "Valhallan Scout Sniper" || "Krieg Marksman")
				if(title == "Krieg Marksman")
					H.add_skills(rand(8,10),rand(10,11),rand(3,6),rand(2,5),rand(1,5))
				if(title == "Valhallan Scout Sniper")
					H.add_skills(rand(8,10),rand(10,11),rand(3,6),rand(2,5),rand(1,5))
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)


// Sergeants

/datum/job/ig/sergeant
	title = "Sergeant"
	supervisors = "The Rogue Trader."
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	selection_color = "#33813A"
	cultist_chance = 9
	outfit_type = /decl/hierarchy/outfit/job/sergeant
	alt_titles = list(
		"Cadian Sergeant" = /decl/hierarchy/outfit/job/sergeant,
		"Catachan Sergeant" = /decl/hierarchy/outfit/job/sergeant/catachan,
		"Krieg Watchmaster" = /decl/hierarchy/outfit/job/sergeant/krieg,
		"Valhallan Sergeant" = /decl/hierarchy/outfit/job/sergeant/valhallan
		)
	can_be_in_squad = FALSE //They have snowflake shit for squads.
	department_flag = SEC|COM
	access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory, access_armory )

	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9

	equip(var/mob/living/carbon/human/H)
		..()
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(18, rand(17,18), rand(16,18), rand(13,15)) //meant to not only be a Sergeant, but a veteran
		to_chat(H, "<span class='notice'><b><font size=3>You are a sergeant of your Regiment, in service to the Imperium. Ensure the men from your Regiment, and perhaps othe regiments, are in order. Train them, ensure they know the capabilities of their equipment and proper knowledge of tactics in battle. Lead them well. The Emperor Protects. </font></b></span>")
		H.add_skills(rand(9,10),rand(9,10),rand(5,7),5,rand(4,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_squad_leader(IMPERIUM)
		H.warfare_faction = IMPERIUM


		if(title == "Krieg Watchmaster")
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			var/troopnum = rand(1,50000)
			H.fully_replace_character_name("Watchmaster [troopnum]")

		if(title == "Cadian Sergeant")
			H.set_quirk(new/datum/quirk/tough()) //these fuckers went through a lot, but i dont exactly feel like giving them brave.
			H.set_trait(new/datum/trait/death_tolerant())

			switch(title) //DO NOT TOUCH THIS, IT PROBABLY WORKS
			if("Cadian Sergeant" || "Valhallan Sergeant" || "Catachan Sergeant")
				if(title == "Catachan Sergeant")
					H.add_skills(rand(10,11),rand(8,10),rand(5,7),5,rand(4,6))

				if(title == "Cadian Sergeant")
					H.add_skills(rand(9,10),rand(9,10),rand(6,8),6,rand(5,6)) //cadians and kriegers have more balanced skills than catachans or valhallans due to them being, well, pretty normal when compared with the other two

				if(title == "Valhallan Sergeant")
					H.add_skills(rand(8,10),rand(10,11),rand(5,7),5,rand(4,6))
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_guard_armory, access_armory)
// Combat Medicae

/datum/job/ig/medicae
	title = "Combat Medicae"
	department = "Medical"
	department_flag = SEC|MED
	social_class = SOCIAL_CLASS_MED
	can_be_in_squad = TRUE
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	supervisors = "The Rogue Trader"
	selection_color = "#967096"
	economic_modifier = 4
	minimal_player_age = 18
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_surgery, access_chemistry, access_virology, access_village, access_guard_common, access_security
		)
	minimal_access = list(access_medical, access_medical_equip, access_village, access_security
		)
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 9
	lmg_skill = 8
	smg_skill = 9
	cultist_chance = 20 //this man has seen his comrades die from fucking nurgle rot and revive

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		H.warfare_faction = IMPERIUM
		..()
		H.fully_replace_character_name("Medicae [current_name]")
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM, "medic")
		H.add_stats(rand(12,16), rand(12,17), rand(12,15), rand(12,16)) //dodgy as fuck, would probably dodge a bullet even if it meant killing the comrade behind them
		H.add_skills(rand(7,10),rand(8,10),rand(7,10),rand(3,5),rand(6,10)) //melee, ranged, med, eng, surgery
		H.get_equipped_item(slot_s_store)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)

		to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>You are a combat medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")


// Commissar

/datum/job/ig/commissar
	title = "Commissar"
	supervisors = "the Rogue Trader and the Astartes." //mercenary apparently?
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#004e07"
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_HIGH
	outfit_type = /decl/hierarchy/outfit/job/ig/commissar
	/*alt_titles = list(
		"Cadian Lieutenant" = /decl/hierarchy/outfit/job/ig/lieutenant
	)
	*/
	alt_titles = list(
		"Krieg Commissar" = /decl/hierarchy/outfit/job/ig/commissar/krieg,
		"Catachan Commissar" = /decl/hierarchy/outfit/job/ig/commissar/catachan
		)
	can_be_in_squad = FALSE
	auto_rifle_skill = 9 //commissars are more trained than almost any guardsman
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9
	open_when_dead = FALSE
	department_flag = COM|SEC
	latejoin_at_spawnpoints = TRUE
	cultist_chance = 0

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Commissar [current_name]")
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(16,18), rand(16,18), rand(12,16), rand(16,17))
		H.add_skills(rand(9,10),rand(9,10),6,5,3) //commissars are heavily trained
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b>Congrats! You are a fully trained member of the Commissariat, you were sent on this planet a few years ago, since then you were a happy little fool who was happy that your first mission was helping to teach the local PDF what their job was, and to help recruit more PDF and Guardsmen, that was, until the trader bought the colony, now you work for the Rogue Trader! And you have a mixxed guardsman regiment at your fingertips! Oh also, be aware, the Rogue Trader can and will override any decision he deems foolish from you.</font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>(READ THIS) Your role is a command role, in this position you have essentially control over the guardsmen, and be aware, you will be held at a higher RP standard and you will be punished if you metagame lateparties, execute friendly or imperial characters without good reason OR force everyone to dig trenches round start, this is a moderately peaceful town, besides all the heretic worshipping, that is... </font></b></span>")
		H.verbs -= list(
		/mob/living/carbon/human/proc/igattack,
		/mob/living/carbon/human/proc/igcanthold,
		/mob/living/carbon/human/proc/igcharge,
		/mob/living/carbon/human/proc/igholdline,
		/mob/living/carbon/human/proc/iginhisname,
		/mob/living/carbon/human/proc/igregroup,
		/mob/living/carbon/human/proc/igretreat,
		/mob/living/carbon/human/proc/igrunforlifes,
		/mob/living/carbon/human/proc/igyessir)
		H.verbs += list(
		/mob/living/carbon/human/proc/comsaimtrue,
		/mob/living/carbon/human/proc/comsfaceus,
		/mob/living/carbon/human/proc/comsfearme,
		/mob/living/carbon/human/proc/comsfirsttodie,
		/mob/living/carbon/human/proc/comsflee,
		/mob/living/carbon/human/proc/comsgloryepmeror,
		/mob/living/carbon/human/proc/comsmyscars,
		/mob/living/carbon/human/proc/comsmywrath,
		/mob/living/carbon/human/proc/comsretreatnotoption,
		/mob/living/carbon/human/proc/comsservingme,
		/mob/living/carbon/human/proc/comsshallbedone,
		/mob/living/carbon/human/proc/comssomeonehead,
		/mob/living/carbon/human/proc/comsstrikeem,
		/mob/living/carbon/human/proc/comstovictory,
		/mob/living/carbon/human/proc/comswhowithme,
		/mob/living/carbon/human/proc/comswillnotfail,
		/mob/living/carbon/human/proc/comswillwhip,
		/mob/living/carbon/human/proc/comsyoucannotstand,
		/mob/living/carbon/human/proc/comsexecute,
		/mob/living/carbon/human/proc/comsyouwereweak)


/*
		H.verbs -= list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch,)*/

		var/obj/O = H.get_equipped_item(slot_s_store)
		if(O)
			qdel(O)

// Outfits

// IG Outfits

// Guardsman

/decl/hierarchy/outfit/job/whiteshield
	name = OUTFIT_JOB_NAME("Imperial Guard Conscript")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/whiteshield
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/guardsman
	name = OUTFIT_JOB_NAME("Cadian Guardsman")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/guardsman/krieg
	name = OUTFIT_JOB_NAME("Krieg Guardsman")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/krieger
	back = /obj/item/storage/backpack/satchel/krieger
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = /obj/item/storage/box/ifak
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/lucius
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel/krieg = 1
	)

/decl/hierarchy/outfit/job/guardsman/catachan
	name = OUTFIT_JOB_NAME("Catachan Jungle Fighter")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachan
	head = /obj/item/clothing/head/catachan
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	mask = null
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/catachan
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

/decl/hierarchy/outfit/job/guardsman/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Ice Warrior")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	head = /obj/item/clothing/head/valushanka
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/autogrim
	suit_store = /obj/item/gun/projectile/automatic/autogrim
	backpack_contents = list(
	/obj/item/ammo_magazine/autogrim/ap = 1,
	/obj/item/ammo_magazine/autogrim/ms = 1,
	/obj/item/ammo_magazine/autogrim = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

///Specialists

/decl/hierarchy/outfit/job/sharpshooter
	name = OUTFIT_JOB_NAME("Cadian Plasmagunner")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/energy/pulse/plasma/rifle
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/plasma = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/sharpshooter/valhalla
	name = OUTFIT_JOB_NAME("Valhallan Heavy Autogunner")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/gun/projectile/automatic/machinepistol/a80
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket =  /obj/item/ammo_magazine/box/a556/mg08
	suit_store = /obj/item/gun/projectile/automatic/stubber
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08/ap = 1,
	/obj/item/ammo_magazine/box/a556/mg08/ms = 1,
	/obj/item/ammo_magazine/mc9mmt/machinepistol = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

/decl/hierarchy/outfit/job/guardsman/catachan
	name = OUTFIT_JOB_NAME("Catachan Flamer")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachan
	head = /obj/item/clothing/head/catachan
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/extinguisher
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	mask = null
	glasses = null
	suit_store = /obj/item/gun/projectile/automatic/flamer
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/flamer = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

// Sniper

/decl/hierarchy/outfit/job/sniper
	name = OUTFIT_JOB_NAME("Cadian Sniper")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun/longlas
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/sniper/krieg
	name = OUTFIT_JOB_NAME("Krieg Marksman")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/krieger/grenadier
	back = /obj/item/storage/backpack/satchel/krieger
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	suit_store = /obj/item/gun/energy/las/lasgun/longlas/krieg
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel/krieg = 1
	)

/decl/hierarchy/outfit/job/sniper/valhalla
	name = OUTFIT_JOB_NAME("Valhallan Scout Sniper")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/device/binoculars
	r_pocket =  /obj/item/ammo_magazine/handful/brifle_handful/ms
	suit_store = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/brifle_handful/ms = 2,
	/obj/item/ammo_magazine/handful/brifle_handful/ap = 2,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1
	)

// Sergeant

/decl/hierarchy/outfit/job/sergeant
	name = OUTFIT_JOB_NAME("Cadian Sergeant")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/cadiansgt
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/chain/inqcs/guard
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/plasma = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/sergeant/krieg
	name = OUTFIT_JOB_NAME("Krieg Watchmaster")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/kriegsgt
	back = /obj/item/storage/backpack/satchel/krieger
	belt = /obj/item/melee/chain/inqcs/guard
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/launcher/rcl_rifle
	r_hand = /obj/item/gun/energy/las/laspistol/militarum/lucius
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 1,
	/obj/item/ammo_casing/heat_shell = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel/krieg = 1
	)

/decl/hierarchy/outfit/job/sergeant/catachan
	name = OUTFIT_JOB_NAME("Catachan Sergeant")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachansgt
	belt = /obj/item/melee/chain/mercycs
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	head = /obj/item/clothing/head/catachan
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bolter_pistol // might be too op not sure
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

/decl/hierarchy/outfit/job/sergeant/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Sergeant")
	uniform =  /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallasgt
	belt = /obj/item/gun/projectile/automatic/machinepistol/a80
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile/automatic/stubber
	l_ear = /obj/item/device/radio/headset/red_team
	neck = /obj/item/reagent_containers/food/drinks/canteen/valhallan
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08 = 1,
	/obj/item/ammo_magazine/mc9mmt/machinepistol = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

// Commissar

/decl/hierarchy/outfit/job/ig/commissar
	name = OUTFIT_JOB_NAME("Cadian Commissar")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/commissar
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/material/sword/commissword
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/commissar
	head = /obj/item/clothing/head/commissar
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/binoculars
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/heads/hos
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/grenade/smokebomb = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/commissar/krieg
	name = OUTFIT_JOB_NAME("Krieg Commissar")
	uniform =  /obj/item/clothing/under/rank/krieg_uniform/commissar
	suit = /obj/item/clothing/suit/armor/commissar/krieg
	head = /obj/item/clothing/head/commissar/krieg
	mask = /obj/item/clothing/mask/gas/commissar
	glasses = null
	l_ear = /obj/item/device/radio/headset/heads/hos

/decl/hierarchy/outfit/job/ig/commissar/catachan
	name = OUTFIT_JOB_NAME("Catachan Commissar")
	uniform =  /obj/item/clothing/under/rank/catachancommissar
	suit = /obj/item/clothing/suit/armor/commissar/catachan
	belt = /obj/item/melee/chain/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/commissar/catachan
	mask = null
	glasses = null
	l_ear = /obj/item/device/radio/headset/heads/hos

//Squads - If we don't plan to use this code it can probably be commented out

/mob/living/carbon/human/proc/assign_random_squad(var/team, var/rank)
	switch(team)
		if(IMPERIUM)//You're now put in whatever squad has the least amount of living people in it.
			var/alpha_members = SSwarfare.red.squadA.members.len
			var/bravo_members = SSwarfare.red.squadB.members.len
			var/charlie_members = SSwarfare.red.squadC.members.len
			var/delta_members = SSwarfare.red.squadD.members.len
			var/minimum = min(alpha_members, bravo_members, charlie_members, delta_members)
			if(minimum == alpha_members)
				SSwarfare.red.squadA.members += src
				src.squad = SSwarfare.red.squadA
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/alpha/A = new(src)
				RC.attach_accessory(src,A)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)

			else if(minimum == bravo_members)
				SSwarfare.red.squadB.members += src
				src.squad = SSwarfare.red.squadB
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/bravo/B = new(src)
				RC.attach_accessory(src,B)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)

			else if(minimum == charlie_members)
				SSwarfare.red.squadC.members += src
				src.squad = SSwarfare.red.squadC
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/charlie/C = new(src.loc)
				RC.attach_accessory(src,C)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)
/*
			else if(minimum == delta_members)
				SSwarfare.red.squadD.members += src
				src.squad = SSwarfare.red.squadD
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/delta(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/delta/D = new(src.loc)
				RC.attach_accessory(src,D)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)
*/
			else
				SSwarfare.red.squadB.members += src
				src.squad = SSwarfare.red.squadB
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/bravo/B = new(src.loc)
				RC.attach_accessory(src,B)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)
			/*if(4)
				SSwarfare.red.squadD.members += src
				src.squad = SSwarfare.red.squadD
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/delta(src),slot_l_ear)
			*/

	var/obj/item/card/id/I = GetIdCard()
	var/actual_job = "Guardsman"
	switch(rank)
		if("medic")
			actual_job = "Medic"
		if("engineer")
			actual_job = "Engineer"
	I.assignment = "[src.squad.name] Squad [actual_job]"

	to_chat(src, "<b>I am apart of [src.squad.name] Squad</b>")


/mob/living/carbon/human/proc/assign_squad_leader(var/team)
	switch(team)
		if(IMPERIUM)//Start from A, go to D
			if(!SSwarfare.red.squadA.squad_leader)
				SSwarfare.red.squadA.members += src
				SSwarfare.red.squadA.squad_leader = src
				src.squad = SSwarfare.red.squadA
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_alpha(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/alpha/A = new(src)
				RC.attach_accessory(src,A)

			else if(!SSwarfare.red.squadB.squad_leader)
				SSwarfare.red.squadB.members += src
				SSwarfare.red.squadB.squad_leader = src
				src.squad = SSwarfare.red.squadB
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_bravo(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/bravo/B = new(src)
				RC.attach_accessory(src,B)

			else if(!SSwarfare.red.squadC.squad_leader)
				SSwarfare.red.squadC.members += src
				SSwarfare.red.squadC.squad_leader = src
				src.squad = SSwarfare.red.squadC
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_charlie(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/charlie/C = new(src)
				RC.attach_accessory(src,C)

/*
			else if(!SSwarfare.red.squadD.squad_leader)
				SSwarfare.red.squadD.members += src
				SSwarfare.red.squadD.squad_leader = src
				src.squad = SSwarfare.red.squadD
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_delta(src),slot_l_ear)
				var/obj/item/clothing/accessory/armband/delta/D = new(src)
				RC.attach_accessory(src,D)
*/
			else
				return

	var/obj/item/card/id/I = GetIdCard()
	I.assignment = "[src.squad.name] Squad"

	to_chat(src, "<b>I am the Squad Leader of [src.squad.name] Squad</b>")

//Misc

/mob/proc/voice_in_head(message)
	to_chat(src, "<i>...[message]</i>")

GLOBAL_LIST_INIT(lone_thoughts, list(
		"Why are we still here... just to suffer?",
		"We fight to win, and that's all that matters.",
		"Why we don't get any more reinforcements?",
		"We have not gotten any orders from segmentum command in months...",
		"Did something happen while we were holding this outpost?",
		"Is there any reason to keep fighting?",
		"It's middle of summer... Why it's so cold?",
		"Greg died last night.",
		"I do not want to die.",
		"There is no hope... anymore...",
		"Is any of this real?",
		"My teeth hurt.",
		"I am not ready to die.",
		"I don't remember joining the military...",
		"Does the Emperor truly protect?",
		"I hope the Inquisitor doesn't find my Eldar Mommy fan-fiction",))

/mob/living/proc/assign_random_quirk()
	if(prob(75))//75% of not choosing a quirk at all.
		return
	if(is_hellbanned())//Hellbanned people will never get quirks.
		return
	var/list/random_quirks = list()
	for(var/thing in subtypesof(/datum/quirk))//Populate possible quirks list.
		var/datum/quirk/Q = thing
		random_quirks += Q
	if(!random_quirks.len)//If there's somewhow nothing there afterwards return.
		return
	var/datum/quirk/chosen_quirk = pick(random_quirks)
	src.quirk = new chosen_quirk
	to_chat(src, "<span class='bnotice'>I was formed a bit different. I am [quirk.name]. [quirk.description]</span>")

/mob/living/carbon/human/proc/witchblood()
	if(prob(99))//99% of not being a psyker
		return
	else
		src.psyker = 1
		src.verbs += list(/mob/living/carbon/human/proc/remotesay,)
