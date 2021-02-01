//Food && these jobs are outpost support staff
/datum/job/bartender
	title = "Bar Servitor"
	department = "Service"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MIN
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Every Imperial Citizen"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender



	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "abel"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(6,8), rand(5,7), rand(6,8), rand(6,8)) //extremely simple minded
		H.add_skills(rand(1,2),rand(1,2),0,0,0)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for managing a bar and serving drinks. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")

/datum/job/chef
	title = "Cook"
	department = "Service"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "the Seneschal, the Commissar"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_kitchen)
//	alt_titles = list("Cook")
	outfit_type = /decl/hierarchy/outfit/job/service/chef

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Pvt. [current_name]")
		H.add_stats(rand(8,12), rand(10,12), rand(10,12), rand(8,11)) //highly trained and skilled
		H.add_skills(rand(1,3),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.say("Cook reporting for duty!")
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Trooper, your training recently complete you were assigned kitchen duties. It is up to you to feed a hungry outpost.</font></b></span>")
/datum/job/hydro
	title = "Farmer"
	department = "Service"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Seneschal"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_hydroponics)
//	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(8,11), rand(10,11), rand(10,11), rand(8,10))
		H.add_skills(rand(1,3),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.say("Farmer reporting for duty!")
		to_chat(H, "<span class='notice'><b><font size=3>Possibly the most important job on the entire planet. The Guard will thrive or starve depending on how skilled you are. Report to your farm in the southeastern corner of the outpost and get growing!</font></b></span>")

//Cargo
/datum/job/qm
	title = "Munitorum Priest"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Seneschal"
	selection_color = "#515151"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/qm

/datum/job/cargo_tech
	title = "Munitorum Adept"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Munitorum Priest and the Seneschal"
	selection_color = "#515151"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech



/datum/job/mining
	title = "Explorator"
	department = "Supply"
	department_flag = SUP
	total_positions = 0
	spawn_positions = 0 //remember to open these one day when its ready
	supervisors = "the Munitorum Priest and the Seneschal"
	selection_color = "#515151"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_mining, access_mining_station, access_mailsorting)
	alt_titles = list("Drill Technician","Prospector")
	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

/datum/job/janitor
	title = "Janitor Servitor"
	department = "Service"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	social_class = SOCIAL_CLASS_MIN
	supervisors = "Every Imperial Citizen"
	selection_color = "#515151"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_sec_doors, access_medical)
	minimal_access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_sec_doors, access_medical)
	//alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "daan"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(6,8), rand(5,7), rand(6,8), rand(6,8)) //extremely simple minded
		H.add_skills(rand(1,2),rand(1,2),0,0,0)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for cleaning and maintaining the outpost. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")

//More or less assistants
/datum/job/librarian
	title = "Record Keeper"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "the Seneschal"
	selection_color = "#515151"
	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library)
	alt_titles = list("Journalist")
	outfit_type = /decl/hierarchy/outfit/job/librarian

/datum/job/inquisitor
	title = "Principal Agent"
	department_flag = INQ
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 2
	spawn_positions = 2
	open_when_dead = 0
	supervisors = "The Golden Throne, the Ministorum, the Ordos Hereticus"
	selection_color = "#fd0707"
	economic_modifier = 7
	minimal_player_age = 10
	outfit_type = /decl/hierarchy/outfit/job/internal_affairs_agent

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Agent [current_name]")
		H.add_stats(rand(10,18), rand(10,18), rand(10,18), rand(10,18)) //highly trained and skilled
		H.add_skills(rand(5,8),rand(5,8),rand(2,4),rand(1,3),0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = get_all_accesses()
		H.say("Throne Agent reporting for duty!")
		to_chat(H, "<span class='notice'><b><font size=3>You are a Principle agent of the Ordos Helican, your Master, a fully fledged Inquisitor has ordered you to this planet to perform reconaissance and keep an eye on the various pilgrims/penitents passing through. Report any heresy, suffer not the heretic to live.</font></b></span>")

/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

/datum/job/leadinquisitor
	title = "Ordos Helican Inquisitor"
	department_flag = INQ
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Golden Throne, the Ordos Hereticus, Lord Inquisitor Rorkan and the masters of the Ordos Helican"
	selection_color = "#fd0707"
	req_admin_notify = 1
	economic_modifier = 7
	minimal_player_age = 21
	open_when_dead = 0
	outfit_type = /decl/hierarchy/outfit/job/inquisitor

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Inquisitor [current_name]")
		H.add_stats(rand(14,18), rand(13,18), rand(14,18), rand(14,18)) //highly trained and skilled
		H.add_skills(rand(7,10),rand(7,10),rand(2,4),rand(1,3),0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = get_all_accesses()
		to_chat(H, "<span class='notice'><b><font size=3>You are a full-fledged Inquisitor of the Ordos Hereticus Helican. You answer directly to Lord Inquisitor Alessandro Rorken. He has deployed you and your team to this outpost after certain... whispers reached the ears of the Inquisition. Investigate the outpost and its surrounding village, root out any heresy with the help of your principal agents and secure the safety of the faithful. The Emperor Protects! </font></b></span>")

/datum/job/leadinquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
