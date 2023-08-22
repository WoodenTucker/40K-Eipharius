// IG Datum

/datum/job/ig
	title = "IGDATUM" // IMPERIAL GUARDSMAN ROLE
	supervisors = "The Planetary Governor, Commissar and your Sergeant."
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
		//NOT SAME THING AS GUARDSMAN, DO NOT TOUCH THIS!!!!!!!!!!!
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")
		H.add_stats(rand(15,16), rand(15,16), rand(15,16), rand (8,14))
		H.add_skills(rand(6,8),rand(6,8),rand(3,6),rand(1,4),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		H.fully_replace_character_name("[H.real_name]")
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
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
	total_positions = 2
	spawn_positions = 2
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
		"Valhallan Ice Warrior" = /decl/hierarchy/outfit/job/guardsman/valhallan,
		"Mordian Iron Guard" = /decl/hierarchy/outfit/job/guardsman/mordian,
		)
	cultist_chance = 4

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_skills(rand(6,10),rand(6,10),rand(3,6),rand(4,6),rand(1,6)) //melee, ranged, med, eng, surgery
		H.add_stats(rand(15,18), rand(15,18), rand(15,18), rand (12,16))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		if(title == "Krieg Guardsman")
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			H.implant_loyalty(src)
			cultist_chance = 1
		if(title == "Cadian Guardsman" || "Catachan Jungle Hunter" || "Valhallan Ice Warrior")
			H.assign_random_quirk()
		H.assign_random_quirk()
		H.witchblood()
		H.verbs += list(
			/mob/living/carbon/human/proc/guardclass,)
		H.get_idcard()?.access = list(access_security, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")
		switch(title)
			if("Cadian Guardsman" || "Valhallan Ice Warrior" || "Catachan Jungle Hunter")
				if(title == "Catachan Jungle Hunter")
					H.add_skills(rand(9,11),rand(7,9),rand(3,6),rand(4,6),rand(1,6))
				if(title == "Valhallan Ice Warrior")
					H.add_skills(rand(7,9),rand(9,11),rand(3,6),rand(4,6),rand(1,6))
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		to_chat(H, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
//Whiteshield

/datum/job/ig/whiteshield
	title = "Imperial Guard Recruit"
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
	cultist_chance = 15 // sir what is a heretic

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (8,14))
		H.add_skills(rand(5,7),rand(5,7),rand(1,5),rand(3,4),rand(1,4)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		H.verbs += list(
			/mob/living/carbon/human/proc/guardclass,)
		to_chat(H, "<span class='notice'><b><font size=3>Conscripts are units within the Imperial Guard that consist of normal Imperial citizens with little or no military training, new Guard recruits who have not yet entered training, children of an already extant regiment's troops or standing Guardsmen who have not yet completed their training. Sometimes, in military emergencies, the Imperium's need for manpower is so great that normal Imperial citizens will simply find themselves conscripted by their local Imperial Guard regiment. </font></b></span>")

//Sharpshooters

/datum/job/ig/guardsman/sharpshooter // can i be fucked renaming every /sharpshooter into /spec? no. remember to just call /sharpshooter/[regiment] instead
	title = "Imperial Guard Specialist"
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sharpshooter
	auto_rifle_skill = 10
	semi_rifle_skill = 8
	sniper_skill = 10
	shotgun_skill = 8
	lmg_skill = 10
	smg_skill = 8
	cultist_chance = 8 //same chance as sniper now.
	alt_titles = list(
		"Cadian Plasma Gunner" = /decl/hierarchy/outfit/job/sharpshooter,
		"Krieg Grenadier" = /decl/hierarchy/outfit/job/sharpshooter/krieg,
		"Valhallan Heavy Autogunner" = /decl/hierarchy/outfit/job/sharpshooter/valhalla,
		"Catachan Flamer" = /decl/hierarchy/outfit/job/sharpshooter/catachan,
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(17,18), rand(14,16), rand(17,18), rand (14,16)) //Specialists are special, they arent every single random ass soldier
		H.add_skills(rand(7,10),rand(9,10),rand(3,4),rand(3,5),rand(4,5)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.assign_random_quirk()
		H.witchblood()
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		H.verbs += list(
			/mob/living/carbon/human/proc/veteranclass,)
		if(title == "Krieg Grenadier")
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			H.implant_loyalty(src)
			cultist_chance = 1

		switch(title)
			if("Cadian Plasma Gunner" || "Krieg Grenadier" || "Valhallan Heavy Autogunner" || "Catachan Flamer")
				if(title == "Cadian Plasma Gunner")
					to_chat(H, "<span class='notice'><b><font size=2> You are from the tough planet Cadia. Trained in plasma weaponry, it will devastate any armored person it touches. It's ammo recharges in the gun, too!</font></b></span>")
				if(title == "Catachan Flamer")
					H.add_skills(rand(9,10),rand(7,10),rand(3,4),rand(4,5),rand(1,5))
					to_chat(H, "<span class='notice'><b><font size=2> You've trained on the jungle planet on Catachan with your trusty flamer. Burning any enemy to a crisp. Use your fire extinguisher if needed.</font></b></span>")
				if(title == "Valhallan Heavy Autogunner")
					H.add_skills(rand(7,10),rand(9,10),rand(3,4),rand(4,5),rand(1,5))
					to_chat(H, "<span class='notice'><b><font size=2> You are a Valhallan Specialist. Equipped with a heavy autogun and plenty of ammo. Suppress the enemy to keep their heads down! </font></b></span>")
				if(title == "Krieg Grenadier")
					H.add_skills(rand(7,10),rand(9,10),rand(3,4),rand(4,5),rand(1,5))
					to_chat(H, "<span class='notice'><b><font size=2> You are a Krieg Grenadier, born and bred on the deadworld. Equipped with a hellgun, your mobile firepower is unmatched! Support your brethren and storm the enemy, wherever they dig in. </font></b></span>")

datum/job/ig/bullgryn
	title = "Bullgryn"
	social_class = SOCIAL_CLASS_MED //is it lore accurate? no, does it make sense to have a bullgryn here? also no
	selection_color = "#33813A"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Da Emprah. Da Commesar, and da little on's!"
	outfit_type = /decl/hierarchy/outfit/job/bullgryn
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 1 // grog like emperorah :)
	species_role = "Ogryn"


	equip(var/mob/living/carbon/human/H)
	//theres gunna be some redundencies here but I do not careeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(20,30), rand(17,19), rand(15,18), rand (2,5)) //bullgryn are stronger and quicker than normal ogryn due to their advanced training
		H.add_skills(rand(10,15),1,1,4,1) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.vice = null
		to_chat(H, "<span class='notice'><b><font size=3>MA BEST FREND'S DA EMPRAH. FREND OF GOBERNOR. FREND OF DA COMESSAR. PROTECT DA LITTL UN'S!</font></b></span>")


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
	cultist_chance = 16 
	alt_titles = list(
		"Cadian Long Las" = /decl/hierarchy/outfit/job/sniper,
		"Valhallan Scout Sniper" = /decl/hierarchy/outfit/job/sniper/valhalla,
		"Krieg Marksman" = /decl/hierarchy/outfit/job/sniper/krieg,
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,15), rand(18,20), rand(14,16), rand (16,20)) //if you are a SNIPA you must be atleast a bit smarter than your average goardsoman
		H.add_skills(rand(8,10),rand(10,11),rand(3,6),rand(2,5),rand(1,5)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.assign_random_quirk()
		H.witchblood()
		H.vice = null
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)
		H.verbs += list(
			/mob/living/carbon/human/proc/veteranclass,)
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")
		if(title == "Krieg Marksman")
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			H.implant_loyalty(src)
			cultist_chance = 1

		switch(title)
			if("Cadian Long Las" || "Valhallan Scout Sniper" || "Krieg Marksman")
				if(title == "Krieg Marksman")
					H.add_skills(rand(8,10),rand(10,11),rand(3,6),rand(4,5),rand(1,5))
					H.fully_replace_character_name("Marksman [rand(1,100000)]")
				if(title == "Valhallan Scout Sniper")
					H.add_skills(rand(8,10),rand(10,11),rand(3,6),rand(4,5),rand(1,5))
		H.get_idcard()?.access = list(access_security, access_guard_common, access_all_personal_lockers, access_village)

// Sergeants

/datum/job/ig/sergeant
	title = "Sergeant"
	supervisors = "The Planetary Governor"
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	selection_color = "#23742a"
	department_flag = SEC
	cultist_chance = 4
	outfit_type = /decl/hierarchy/outfit/job/sergeant
	alt_titles = list(
		"Cadian Sergeant" = /decl/hierarchy/outfit/job/sergeant,
		"Catachan Sergeant" = /decl/hierarchy/outfit/job/sergeant/catachan,
		"Krieg Watchmaster" = /decl/hierarchy/outfit/job/sergeant/krieg,
		"Valhallan Sergeant" = /decl/hierarchy/outfit/job/sergeant/valhallan
		)
	can_be_in_squad = FALSE //They have snowflake shit for squads.
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
		H.fully_replace_character_name("Sergeant [H.real_name]")
		H.add_stats(18, rand(17,18), rand(16,18), rand(13,15)) //meant to not only be a Sergeant, but a veteran
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")
		H.add_skills(rand(9,10),rand(9,10),rand(5,7),5,rand(4,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.witchblood()
		H.verbs += list(
			/mob/living/carbon/human/proc/veteranclass)
		H.set_quirk(new/datum/quirk/tough())
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_squad_leader(IMPERIUM)
		H.warfare_faction = IMPERIUM
//		H.vice = null //sarges seen some shit

		switch(title) //DO NOT TOUCH THIS, IT PROBABLY WORKS
			if("Cadian Sergeant" || "Valhallan Sergeant" || "Catachan Sergeant" || "Krieg Watchmaster")
				if(title == "Catachan Sergeant")
					H.add_skills(rand(10,11),rand(9,10),rand(5,7),5,rand(5,6))
				if(title == "Cadian Sergeant")
					H.add_skills(rand(9,10),rand(10,11),rand(6,8),6,rand(5,6))
				if(title == "Sergeant")
					H.add_skills(rand(9,10),rand(10,11),rand(6,8),6,rand(5,6))
				if(title == "Krieg Watchmaster")
					H.add_skills(rand(9,10),rand(10,11),rand(5,7),5,rand(5,6))
					H.set_quirk(new/datum/quirk/brave())
				if(title == "Valhallan Sergeant")
					H.add_skills(rand(9,10),rand(10,11),rand(5,7),5,rand(5,6))
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_guard_armory, access_armory)

// Combat Medicae

/datum/job/ig/medicae
	title = "Combat Medicae"
	department = "Medical"
	department_flag = SEC
	social_class = SOCIAL_CLASS_MED
	can_be_in_squad = TRUE
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	selection_color = "#33813A"
	economic_modifier = 4
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_village, access_guard_common, access_security
		)
	minimal_access = list(access_medical, access_village, access_security, access_guard_common,
		)
	alt_titles = list(
		"Cadian Medicae" = /decl/hierarchy/outfit/job/medical/paramedic,
		"Krieg Quartermaster" = /decl/hierarchy/outfit/job/medical/paramedic/krieg,
		"Valhallan Medicae" = /decl/hierarchy/outfit/job/medical/paramedic/valhallan
		)
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 9
	lmg_skill = 8
	smg_skill = 9
	cultist_chance = 3

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM, "medic")
		H.add_stats(rand(15,17), rand(15,17), rand(15,17), rand (14,18)) //same stats as normal guard but better int, med and surgery
		H.add_skills(rand(6,10),rand(6,10),rand(8,10),rand(5,6),rand(9,11)) //melee, ranged, med, eng, surgery
		H.get_equipped_item(slot_s_store)
		H.assign_random_quirk()
		H.verbs += list(
			/mob/living/carbon/human/proc/medicclass)
		if(title == "Krieg Quartermaster")
			H.implant_loyalty(src)
			cultist_chance = 1
		switch(title)
			if("Cadian Medicae" || "Valhallan Medicae" || "Krieg Quartermaster")
				if(title == "Cadian Medicae")
					H.add_skills(rand(6,10),rand(6,10),rand(8,10),rand(4,6),rand(9,11)) //better surg
					to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
					to_chat(H, "<span class='notice'><b><font size=3>You are a Combat Medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")
				if(title == "Krieg Quartermaster")
					H.add_skills(rand(8,11),rand(6,9),rand(8,10),rand(4,6),rand(8,10)) //better melee
					to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
					to_chat(H, "<span class='notice'><b><font size=3>You are a Quartermaster. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller, as well as keep track of the gear of the dead. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")
				if(title == "Valhallan Medicae")
					H.add_skills(rand(6,9),rand(8,11),rand(8,10),rand(4,6),rand(8,10)) //better aim
					to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
					to_chat(H, "<span class='notice'><b><font size=3>You are a Combat Medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)

/datum/job/kasrkin
	title = "Kasrkin"
	supervisors = "Your Sergeant, The Commissar and The Inquisition."
	department_flag = SEC|INQ
	total_positions = 0 // Disabled. Kasrkin roundstart presence often result in KOS fights with friendly lateparties.
	spawn_positions = 0
	head_position = 1
	selection_color = "#23742a"
	department_flag = SEC|COM
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_MAX
	announced = 0
	access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory, access_armory )
	minimal_player_age = 19
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/kasrkin
	alt_titles = null
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	cultist_chance = 1

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(17,20), rand(16,18), rand(18,19), rand(10,15)) //still not as good as a arbites
		H.add_skills(rand(10,11),rand(9,10),rand(3,5),5,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_guard_armory, access_armory)
		H.warfare_faction = IMPERIUM
//		H.vice = null //THE VETERAN HAS SEEN SOME SHIT BRO
		to_chat(H, "<span class='notice'><b><font size=3>You are a Kasrkin serving as an agent to the Imperial Guard Sergeant on behalf of your regiment, while expected to follow orders you ultimately serve the Astra Militarum and the memory of Cadia to whom you are loyal above all else. You unlike most veterans of the Astra Militarum are likely experienced and knowledgeable enough about Chaos to not be drinking the kool aid the Imperium gives to it's soldiers and instead serve because of your true understanding of what The God Emperor and all humanity stand against...</font></b></span>")


// Commissar

/datum/job/ig/commissar
	title = "Commissar"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#23742a"
	department_flag = SEC
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/ig/commissar
	alt_titles = list(
		"Krieg Commissar" = /decl/hierarchy/outfit/job/ig/commissar/krieg,
		"Catachan Commissar" = /decl/hierarchy/outfit/job/ig/commissar/catachan
		)
	can_be_in_squad = FALSE
	economic_modifier = 9
	auto_rifle_skill = 9 //commissars are more trained than almost any guardsman
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9
	open_when_dead = FALSE
	latejoin_at_spawnpoints = TRUE
	cultist_chance = 1 // 0 fucks stuff allegedly
	access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_guard_common, access_all_personal_lockers, access_village, access_guard_armory, access_armory )

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(16,18), rand(16,18), rand(12,16), rand(16,17))
		H.add_skills(rand(9,11),rand(9,10),6,5,3) //commissars are heavily trained
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.fully_replace_character_name("Commissar [current_name]")
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_guard_armory, access_armory)
		H.warfare_faction = IMPERIUM
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
		to_chat(H, "<span class='notice'><b><font size=3>The commissar is empowered to use any means necessary to ensure the loyalty and moral purity of his or her charges, including overriding or even executing a regiment's commanding officer if necessary, and so is regarded with a mixture of fear and admiration by rank-and-file Guardsmen -- and not a few of their officers. Commissars provide the link between regimental officers and the Departmento Munitorum. They are tough, ruthless individuals whose primary responsibilities are to preserve the courage, discipline and loyalty of the regiment. Only a handful of commissars have ever obtained leadership over large Imperial forces as a lord commander, or even a governor militant, such as Yarrick at Armageddon, and only a handful are known to have even retained full command of an entire regiment, such as Colonel-Commissar Ibram Gaunt. All commissars are trained as excellent orators, and often deliver stirring speeches to their regiment or company prior to battle. During battle, the commissar is almost always amongst the front lines, and roars a litany of battle cries and prayers to the Emperor to inspire his troops to battle. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>(READ THIS) Your role like any others is to make the round more interesting, you will be punished if you metagame lateparties, murder allied characters without good reason OR force people to stay in trenches all game. </font></b></span>")

// CLASSES
/mob/living/carbon/human/proc/guardclass()
	set name = "Select your class"
	set category = "The Imperium"
	set desc = "Roll the dice and discover a new story."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/guardclass,) //removes verb
	var/fates = list("ROLL THE DICE!")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)

		if("ROLL THE DICE!")
			if(prob(30))
				to_chat(U,"<span class='danger'><b><font size=4>THE VETERAN</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>A veteran of many campaigns, you've experienced the horrors of the warp and the alien.</font></b></span>")
				U.add_stats(rand(16,18), rand(16,18), rand(13,17), rand (12,16))
				new /obj/item/gun/projectile/bolter_pistol(src.loc) 
				new /obj/item/clothing/accessory/medal/silver/Administratum(src.loc) 
				
			else if(prob(8))
				to_chat(U,"<span class='danger'><b><font size=4>THE TRAITOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a traitor to the Imperium and for reasons unknown to you now, shall be it's destruction. Praise the hivemind/cult/cogitae!</font></b></span>")
				U.add_stats(rand(13,17), rand(16,18), rand(16,18), rand (12,20))
				if(prob(30))
					new /obj/item/device/radio/headset/blue_team/all(src.loc) 
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/clothing/mask/smokable/cigarette/cigar(src.loc) 
				if(prob(15))
					new /obj/item/clothing/suit/armor/hjacket(src.loc) 
				else
					new /obj/item/clothing/suit/armor/towntrench(src.loc) 
				if(prob(5))
					new /obj/item/clothing/accessory/medal/bronze/Administratum(src.loc) 
				if(prob(10))
					new /obj/item/device/multitool/hacktool(src.loc) 
					new /obj/item/clothing/mask/smokable/cigarette/cigar(src.loc) 
					new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE FORSAKEN</font></b></span>") 
				U.add_stats(rand(15,18), rand(15,18), rand(15,18), rand (12,16))
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/clothing/mask/smokable/cigarette/cigar(src.loc) 
				if(prob(35))
					new /obj/item/clothing/suit/armor/hjacket(src.loc) 
				else
					new /obj/item/clothing/suit/armor/towntrench(src.loc) 
				if(prob(15))
					new /obj/item/clothing/accessory/medal/bronze/Administratum(src.loc) 
				if(prob(30))
					new /obj/item/device/multitool/hacktool(src.loc) 
					new /obj/item/clothing/mask/smokable/cigarette/cigar(src.loc) 
					new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 
				to_chat(U,"<span class='goodmood'><b><font size=3>You are one of many untold trillions of Guardsmen taken from your homeworld and pressed into service to the meatgrinder that is the Astra Militarum. As a result of the mind numbing horrors of war, you have taken to... interesting vices to survive your many years of service.</font></b></span>")



/mob/living/carbon/human/proc/veteranclass()
	set name = "Select your class"
	set category = "The Imperium"
	set desc = "Roll the dice and discover a new story."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/veteranclass,) //removes verb
	var/fates = list("ROLL THE DICE!")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)

		if("ROLL THE DICE!")
			if(prob(60))
				to_chat(U,"<span class='danger'><b><font size=4>HERO OF THE IMPERIUM</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>A veteran of many campaigns, you've experienced the horrors of the warp and the alien.</font></b></span>")
				if(prob(60))
					new /obj/item/gun/projectile/revolver/mateba(src.loc) 
					new /obj/item/ammo_magazine/c50/ap(src.loc) 
				if(prob(60))
					new /obj/item/clothing/accessory/medal/gold/Administratum(src.loc) 
					new /obj/item/clothing/accessory/medal/silver/Administratum(src.loc) 
				
			else if(prob(6))
				to_chat(U,"<span class='danger'><b><font size=4>THE TRAITOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a traitor to the Imperium and for reasons unknown to you now, shall be it's destruction. Praise the hivemind/cult/cogitae!</font></b></span>")
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(50))
					new /obj/item/device/radio/headset/blue_team/all(src.loc) 
				if(prob(10))
					new /obj/item/storage/pill_bottle/happy(src.loc)  
				if(prob(10))
					new /obj/item/clothing/suit/armor/ranger2(src.loc) 
				if(prob(10))
					new /obj/item/clothing/suit/armor/towntrench(src.loc) 
				if(prob(10))
					new /obj/item/clothing/accessory/medal/silver/Administratum(src.loc) 
					new /obj/item/clothing/accessory/medal/bronze/Administratum(src.loc) 
				if(prob(15))
					new /obj/item/device/multitool/hacktool(src.loc) 
				if(prob(15))
					new /obj/item/plastique(src.loc) 
				if(prob(15))
					new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 
			else 
				to_chat(U,"<span class='danger'><b><font size=4>THE SURVIVOR</font></b></span>") 
				to_chat(U,"<span class='goodmood'><b><font size=3>You are one of many untold trillions of Guardsmen taken from your homeworld and pressed into service to the meatgrinder that is the Astra Militarum. As a result of the mind numbing horrors of war, you have taken to... interesting vices to survive your many years of service.</font></b></span>")
				new /obj/item/stack/thrones2/twenty(src.loc)  
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/clothing/mask/smokable/cigarette/cigar(src.loc)  
				if(prob(40))
					new /obj/item/storage/pill_bottle/happy(src.loc)  
				if(prob(10))
					new /obj/item/clothing/suit/armor/ranger2(src.loc) 
				if(prob(10))
					new /obj/item/clothing/suit/armor/towntrench(src.loc) 
				if(prob(30))
					new /obj/item/clothing/accessory/medal/silver/Administratum(src.loc) 
					new /obj/item/clothing/accessory/medal/bronze/Administratum(src.loc) 
				if(prob(45))
					new /obj/item/device/multitool/hacktool(src.loc) 
				if(prob(45))
					new /obj/item/plastique(src.loc) 
				if(prob(35))
					new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 
				


/mob/living/carbon/human/proc/medicclass()
	set name = "Select your class"
	set category = "The Imperium"
	set desc = "Roll the dice and discover a new story."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/medicclass,) //removes verb
	var/fates = list("ROLL THE DICE!")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)

		if("ROLL THE DICE!")
			if(prob(87))
				to_chat(U,"<span class='danger'><b><font size=4>THE MEDICAE</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>An experienced medicae practitioner you were selected from your homeworld to serve as the very lifeblood of the guard.</font></b></span>")
				new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 
				new /obj/item/reagent_containers/hypospray/autoinjector/combatpain(src.loc) 
				if(prob(13))
					new /obj/item/clothing/suit/armor/scum2(src.loc) 
				if(prob(14))
					new /obj/item/clothing/suit/armor/slumcoat(src.loc) 
			else if(prob(6))
				to_chat(U,"<span class='danger'><b><font size=4>THE TRAITOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a traitor to the Imperium and for reasons unknown to you now, shall be it's destruction. Praise the hivemind/cult/cogitae!</font></b></span>")
				U.add_stats(rand(13,17), rand(16,18), rand(16,18), rand (12,20))
				if(prob(30))
					new /obj/item/device/radio/headset/blue_team/all(src.loc) 
				new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 
				new /obj/item/reagent_containers/hypospray/autoinjector/combatpain(src.loc) 
				new /obj/item/reagent_containers/hypospray/autoinjector/death(src.loc) 
				if(prob(15))
					new /obj/item/clothing/suit/armor/scum2(src.loc) 
				if(prob(15))
					new /obj/item/clothing/suit/armor/slumcoat(src.loc) 
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
			else 
				to_chat(U,"<span class='danger'><b><font size=4>THE TROUBLED DOCTOR</font></b></span>") 
				to_chat(U,"<span class='goodmood'><b><font size=3>Years of exposure to the practices of medicine, the horrors of chaos plagues and the concoctions of the sanguinary worlds has driven you mad. Express your madness, let the world know what the rot has done to you!</font></b></span>")
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/stack/thrones3/twenty(src.loc)  
				new /obj/item/clothing/mask/smokable/cigarette/cigar(src.loc)  
				if(prob(35))
					new /obj/item/clothing/suit/armor/scum2(src.loc) 
				else
					new /obj/item/clothing/suit/armor/slumcoat(src.loc) 
				if(prob(100))
					new /obj/item/reagent_containers/hypospray/autoinjector/mindbreaker(src.loc) 
					new /obj/item/reagent_containers/hypospray/autoinjector/death(src.loc) 
					new /obj/item/reagent_containers/hypospray/autoinjector/tau(src.loc) 
					new /obj/item/reagent_containers/food/drinks/bottle/specialwhiskey(src.loc) 

// Outfits

/decl/hierarchy/outfit/job/whiteshield
	name = OUTFIT_JOB_NAME("Imperial Guard Whiteshield")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/whiteshield
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/whiteshield
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/storage/box/coin
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

// Guardsmen
/decl/hierarchy/outfit/job/guardsman
	name = OUTFIT_JOB_NAME("Cadian Guardsman")
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
	r_pocket = /obj/item/storage/box/coin
	r_hand = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


/decl/hierarchy/outfit/job/guardsman/mordian
	name = OUTFIT_JOB_NAME("Mordian Iron Guardsman")
	uniform = /obj/item/clothing/under/color/brown
	suit = /obj/item/clothing/suit/armor/mordian
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet/mordian
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	r_hand = /obj/item/storage/box/coin
	suit_store = /obj/item/gun/energy/las/triplex
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 1,
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
	r_hand = /obj/item/storage/box/coin
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/lucius
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
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
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	mask = null
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/catachan
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	r_hand = /obj/item/storage/box/coin
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/handcuffs = 1,
	/obj/item/stack/thrones3/five = 1
	)

/decl/hierarchy/outfit/job/guardsman/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Ice Warrior")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	head = /obj/item/clothing/head/valushanka
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	mask = null
	glasses = null
	r_hand = /obj/item/storage/box/coin
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile/automatic/autogrim
	backpack_contents = list(
	/obj/item/ammo_magazine/c556/ms = 4,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

//Karskin
/decl/hierarchy/outfit/job/kasrkin
	name = OUTFIT_JOB_NAME("Kasrkin")
	uniform = /obj/item/clothing/under/cadian_uniform
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	suit = /obj/item/clothing/suit/armor/kasrkin
	head = /obj/item/clothing/head/helmet/kasrkin
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadian
	id = /obj/item/card/id/dog_tag/guardsman
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/clothing/gloves/combat/cadian
	r_hand = /obj/item/storage/box/coin
	suit_store = /obj/item/gun/energy/las/hotshot //Hotshots are annoyingly common, makes them standout more.
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/cell/lasgun/hotshot = 3,
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
	r_pocket = /obj/item/device/flashlight/lantern
	r_hand = /obj/item/storage/box/coin
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/energy/pulse/plasma/rifle
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/plasma = 2,
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
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_hand = /obj/item/storage/box/coin
	r_pocket =  /obj/item/ammo_magazine/box/a556/mg08/ms
	suit_store = /obj/item/gun/projectile/automatic/heavystubber
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08/ms = 2,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)

/decl/hierarchy/outfit/job/sharpshooter/krieg
	name = OUTFIT_JOB_NAME("Krieg Grenadier")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/krieger/grenadier
	back = /obj/item/storage/backpack/satchel/krieger/grenadier
	belt = 	/obj/item/pickaxe
	gloves = /obj/item/clothing/gloves/combat/krieg/grenadier
	shoes = /obj/item/clothing/shoes/jackboots/krieg/grenadier
	head = /obj/item/clothing/head/helmet/krieghelmet/grenadier
	mask = /obj/item/clothing/mask/gas/krieg/grenadier
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_hand = /obj/item/storage/box/coin
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/energy/las/hotshot/krieg
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel/krieg = 1
	)

/decl/hierarchy/outfit/job/sharpshooter/catachan
	name = OUTFIT_JOB_NAME("Catachan Flamer")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachan/flamerspecialist
	head = /obj/item/clothing/head/catachan
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/extinguisher
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	mask = null
	glasses = null
	suit_store = /obj/item/gun/projectile/automatic/flamer
	l_pocket = /obj/item/storage/box/ifak
	r_hand = /obj/item/storage/box/coin
	r_pocket = /obj/item/device/flashlight/lantern
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/flamer = 3,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)


// bullgryn
/decl/hierarchy/outfit/job/bullgryn
	name = OUTFIT_JOB_NAME("Bullgryn")
	uniform = /obj/item/clothing/under/ogryn/jumpsuit
	head = null
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/ogryn/two
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	l_ear = null
	r_ear = /obj/item/device/radio/headset/red_team
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	r_hand = /obj/item/shield/riot
	l_hand = /obj/item/melee/classic_baton/trench_club
	backpack_contents = list(
	/obj/item/grenade/frag = 1
	)



// Medicae

/decl/hierarchy/outfit/job/medical/paramedic/krieg
	name = OUTFIT_JOB_NAME("Krieg Quartermaster")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/krieger
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	gloves = /obj/item/clothing/gloves/combat/krieg
	back = /obj/item/storage/backpack/satchel/krieger
	neck = /obj/item/reagent_containers/food/drinks/canteen
	glasses = /obj/item/clothing/glasses/hud/health
	suit_store = /obj/item/gun/energy/las/lasgun/lucius
	belt = /obj/item/storage/belt/medical/full
	head = /obj/item/clothing/head/helmet/krieghelmet/medicae
	mask = /obj/item/clothing/mask/gas/krieg/medicae
	r_pocket = /obj/item/storage/box/ifak
	r_hand = /obj/item/storage/box/coin
	l_pocket = /obj/item/device/flashlight/lantern
	id_type = /obj/item/card/id/medical/paramedic
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	backpack_contents = list(
	/obj/item/cell/lasgun = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/handcuffs = 1,
	/obj/item/shovel/krieg = 1
	)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/medical/paramedic
	name = OUTFIT_JOB_NAME("Cadian Medicae")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/medicae
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	glasses = /obj/item/clothing/glasses/hud/health
	belt = /obj/item/storage/belt/medical/full
	head = /obj/item/clothing/head/helmet/medicae
	r_pocket = /obj/item/storage/box/ifak
	l_pocket = /obj/item/cell/lasgun
	r_hand = /obj/item/storage/box/coin
	id_type = /obj/item/card/id/medical/paramedic
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	backpack_contents = list(
	/obj/item/cell/lasgun = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/clothing/mask/gas/half/cadianrespirator = 1,
	/obj/item/handcuffs = 1,
	/obj/item/clothing/glasses/cadiangoggles = 1
	)
	suit_store = /obj/item/gun/energy/las/lasgun
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL


/decl/hierarchy/outfit/job/medical/paramedic/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Medicae")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor/medicae
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	gloves = /obj/item/clothing/gloves/combat/cadian
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	glasses = /obj/item/clothing/glasses/hud/health
	suit_store = /obj/item/gun/projectile/automatic/autogrim
	belt = /obj/item/storage/belt/medical/full
	head = /obj/item/clothing/head/valushanka/medicae
	r_pocket = /obj/item/storage/box/ifak
	r_hand = /obj/item/storage/box/coin
	l_pocket = /obj/item/device/flashlight/lantern
	id_type = /obj/item/card/id/medical/paramedic
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	backpack_contents = list(
    /obj/item/ammo_magazine/c556/ms = 4,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/handcuffs = 1,
	/obj/item/stack/thrones3/five = 1
	)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL



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
	r_hand = /obj/item/storage/box/coin
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/energy/las/lasgun/longlas
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/handcuffs = 1,
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
	r_pocket = /obj/item/device/flashlight/lantern
	r_hand = /obj/item/storage/box/coin
	l_pocket = /obj/item/storage/box/ifak
	suit_store = /obj/item/gun/energy/las/lasgun/longlas/krieg
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/handcuffs = 1,
	/obj/item/shovel/krieg = 1
	)

/decl/hierarchy/outfit/job/sniper/valhalla
	name = OUTFIT_JOB_NAME("Valhallan Scout Sniper")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_hand = /obj/item/storage/box/coin
	l_hand = /obj/item/device/binoculars
	r_pocket =  /obj/item/ammo_casing/a145/apds
	suit_store = /obj/item/gun/projectile/heavysniper
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/storage/box/sniperammo/apds = 4,
	/obj/item/handcuffs = 1,
	/obj/item/stack/thrones2/five = 1
	)




// Sarge

/decl/hierarchy/outfit/job/sergeant
	name = OUTFIT_JOB_NAME("Cadian Sergeant")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/cadiansgt
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/chain/inqcs
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet/sargecap
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	r_hand = /obj/item/storage/box/coin
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/cell/plasma = 2,
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
	belt = /obj/item/melee/chain/mercycs
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet/sgt
	mask = /obj/item/clothing/mask/gas/krieg
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/launcher/rcl_rifle
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	l_hand = /obj/item/storage/box/coin
	r_hand = /obj/item/gun/energy/las/laspistol/militarum/lucius
	backpack_contents = list(
	/obj/item/cell/lasgun/hotshot = 1,
	/obj/item/ammo_casing/heat_shell = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/handcuffs = 1,
	/obj/item/shovel/krieg = 1
	)

/decl/hierarchy/outfit/job/sergeant/catachan
	name = OUTFIT_JOB_NAME("Catachan Sergeant")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachansgt
	belt = /obj/item/melee/chain/inqcs
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	head = /obj/item/clothing/head/catachan
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile/bolter_pistol // might be too op not sure
	neck = /obj/item/reagent_containers/food/drinks/canteen
	r_hand = /obj/item/storage/box/coin
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/handcuffs = 1
	)

/decl/hierarchy/outfit/job/sergeant/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Sergeant")
	uniform =  /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallasgt
	belt = null // pistol
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = null // rifle maybe? not sure
	l_ear = /obj/item/device/radio/headset/red_team
	r_hand = /obj/item/storage/box/coin
	neck = /obj/item/reagent_containers/food/drinks/canteen/valhallan
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/handcuffs = 1
	)


// Commissar

/decl/hierarchy/outfit/job/ig/commissar
	name = OUTFIT_JOB_NAME("Cadian Commissar")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/commissar
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/sword/commissword
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
	r_hand = /obj/item/storage/box/coin
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/grenade/smokebomb = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/handcuffs = 1
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












//chaos bad boy guard

/decl/hierarchy/outfit/job/bloodpact
	uniform = /obj/item/clothing/under/rank/victorian/black
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/warfare
	mask = null
	l_ear = /obj/item/device/radio/headset/blue_team/all
	r_ear = /obj/item/device/radio/headset/red_team
	r_pocket = /obj/item/storage/box/ifak
	l_pocket = /obj/item/device/flashlight/lantern
	backpack_contents = list(
	/obj/item/gun/energy/las/laspistol = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	)

/decl/hierarchy/outfit/job/bloodpact2 // Old
	uniform = /obj/item/clothing/under/guard/renegadeuniform
	suit = /obj/item/clothing/suit/armor/guardsman/bloodpact
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/chain/pcsword/khorneaxe
	gloves = /obj/item/clothing/gloves/thick/swat/combat
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator/bloodpact2
	mask = null
	glasses = /obj/item/clothing/glasses/cadiangoggles
	id = null
	l_ear = /obj/item/device/radio/headset/blue_team/all
	r_ear = /obj/item/reagent_containers/hypospray/autoinjector/blood
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/energy/las/laspistol/militarum/bloodpact
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/grenade/frag/high_yield/krak = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	)

/decl/hierarchy/outfit/job/vraks // generic culty boy
	uniform = /obj/item/clothing/under/guard/renegadeuniform
	suit = /obj/item/clothing/suit/armor/flak1/renegadearmor
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/sword/combat_knife
	gloves = /obj/item/clothing/gloves/thick/swat/combat
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/culthelm/gas
	mask = null
	glasses = /obj/item/clothing/glasses/cadiangoggles
	id = null
	l_ear = /obj/item/device/radio/headset/blue_team/all
	r_ear = /obj/item/reagent_containers/hypospray/autoinjector/blood
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/grenade/frag = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	)

// chaos sgt

/decl/hierarchy/outfit/job/watchman/sergeant
	name = OUTFIT_JOB_NAME("Cadian Sergeant")
	uniform = /obj/item/clothing/under/guard/uniform
	suit =/obj/item/clothing/suit/armor/guardsman/bloodpact
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/chain/inqcs
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/heretichood
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/blue_team/all
	backpack_contents = list(
	/obj/item/cell/plasma = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


/decl/hierarchy/outfit/job/watchman/sergeant/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Sergeant")
	uniform =  /obj/item/clothing/under/guard/uniform
	suit = /obj/item/clothing/suit/armor/guardsman/bloodpact
	belt = null
	head = /obj/item/clothing/head/heretichood
	mask = null
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	l_ear = /obj/item/device/radio/headset/blue_team/all
	neck = /obj/item/reagent_containers/food/drinks/canteen/valhallan
	suit_store = /obj/item/gun/projectile/automatic/autogrim
	backpack_contents = list(
	/obj/item/ammo_magazine/c556/ap = 4,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2/five = 1
	)

/decl/hierarchy/outfit/job/watchman/sergeant/krieg
	name = OUTFIT_JOB_NAME("Krieg Watchmaster")
	uniform = /obj/item/clothing/under/guard/uniform
	suit = /obj/item/clothing/suit/armor/guardsman/bloodpact
	back = /obj/item/storage/backpack/satchel/krieger
	belt = /obj/item/melee/chain/inqcs
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/heretichood
	mask = /obj/item/clothing/mask/gas/krieg
	l_ear = /obj/item/device/radio/headset/blue_team/all
	suit_store = /obj/item/gun/launcher/rcl_rifle
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
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

/decl/hierarchy/outfit/job/watchman/sergeant/catachan
	name = OUTFIT_JOB_NAME("Catachan Sergeant")
	uniform = /obj/item/clothing/under/guard/uniform
	suit = /obj/item/clothing/suit/armor/guardsman/bloodpact
	belt = /obj/item/melee/chain/mercycs
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	head = /obj/item/clothing/head/heretichood
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile/bolter_pistol // might be too op not sure
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/blue_team/all
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)
