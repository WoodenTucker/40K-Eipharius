//Food && these jobs are outpost support staff
/datum/job/bartender
	title = "Bar Servitor"
	department = "Service"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MIN
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 1
	supervisors = "Every Imperial Citizen"
	selection_color = "#337C81"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender
	announced = FALSE



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
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Seneschal, the Commissar"
	selection_color = "#337C81"
	access = list(access_hydroponics, access_bar, access_kitchen, access_maint_tunnels)
	minimal_access = list(access_kitchen)
	announced = FALSE
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
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Trooper, your training recently complete you were assigned kitchen duties. It is up to you to feed a hungry outpost.</font></b></span>")
/datum/job/hydro
	title = "Farmer"
	department = "Service"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Seneschal"
	selection_color = "#848484"
	latejoin_at_spawnpoints = TRUE
	access = list(access_hydroponics, access_bar, access_kitchen,access_maint_tunnels, access_grox)
	minimal_access = list(access_hydroponics, access_maint_tunnels, access_kitchen, access_grox)
//	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(13,16), rand(10,11), rand(10,11), rand(8,10))
		H.add_skills(rand(1,3),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>Possibly the most important job on the entire planet. The Guard will thrive or starve depending on how skilled you are. Report to your farm in the southeastern corner of the outpost and get growing!</font></b></span>")

//Cargo
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

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(10,16), rand(10,11), rand(10,11), rand(8,10))
		H.add_skills(rand(1,3),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>The others may not know it, but you're the most powerful man on the planet. You control what comes and goes as well as which palms are greased and which are left wanting.</font></b></span>")

/datum/job/cargo_tech
	title = "Munitorum Menial"
	department = "Supply"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = 1
	social_class = SOCIAL_CLASS_MED
	announced = 0
	supervisors = "the Munitorum Priest, the Administrator and the Seneschal"
	selection_color = "#337C81"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(13,16), rand(10,11), rand(10,11), rand(8,10))
		H.add_skills(rand(1,3),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>Keep things moving! Make sure imports and exports get where they need to go! If you're lost, speak to the Munitorum Priest!</font></b></span>")



/datum/job/mining
	title = "Explorator"
	department = "Supply"
	department_flag = SUP
	total_positions = 0
	spawn_positions = 0 //remember to open these one day when its ready
	supervisors = "the Munitorum Priest and the Seneschal"
	selection_color = "#337C81"
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
	latejoin_at_spawnpoints = TRUE
	social_class = SOCIAL_CLASS_MIN
	supervisors = "Every Imperial Citizen"
	selection_color = "#337C81"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	minimal_access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	//alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/service/janitor
	announced = FALSE

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
	title = "Acolyte"
	department_flag = INQ
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 3
	spawn_positions = 3
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "The Golden Throne, the Ministorum, the Inquisition."
	selection_color = "#FF3A3A"
	economic_modifier = 7
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/acolyte
	alt_titles = list(
		"Acolyte Of Ordo Malleus" = /decl/hierarchy/outfit/job/acolyte/malleus
		)
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Acolyte [current_name]")
		H.add_stats(rand(14,18), rand(14,18), rand(14,18), rand(14,18)) //highly trained and skilled
		H.add_skills(rand(6,10),rand(6,10),rand(4,8),rand(1,8),0)
		H.assign_random_quirk()
		H.witchblood()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = get_all_accesses()
		to_chat(H, "<span class='notice'><b><font size=3>You are an inquisitor-in-training, referred as Acolyte, Your task is to assist the Throne Agent, Lord Inquisitor in investigating, neutralising and erasing traces of heresy, chaos, xenos and daemons.</font></b></span>")

/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

/datum/job/leadinquisitor
	title = "Inquisitor"
	department_flag = INQ|COM
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	supervisors = "The Golden Throne, the Inquisition, Lord Inquisitor Rorkan and the masters of the Ordos Helican."
	selection_color = "#fd0707"
	req_admin_notify = 1
	latejoin_at_spawnpoints = TRUE
	economic_modifier = 7
	minimal_player_age = 21
	open_when_dead = 0
	outfit_type = /decl/hierarchy/outfit/job/inquisitor
	alt_titles = list(
		"Inquisitor Of Ordo Malleus" = /decl/hierarchy/outfit/job/inquisitor/malleus
		)
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Inquisitor [current_name]")
		H.add_stats(rand(16,18), rand(16,18), rand(16,18), rand(16,18)) //highly trained and skilled
		H.add_skills(rand(7,15),rand(7,15),rand(6,12),rand(4,8),0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_faction = IMPERIUM
		H.witchblood()
		H.verbs += list(/mob/living/carbon/human/proc/declareheretic,)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Throne Agent, Loyal servant of the Imperium. As full-fledged Inquisitor. Your task is to seek and destroy enemies of the Imperium, whether they're daemons, Chaos, Xenos or Heretics. The Emperor Protects.</font></b></span>")
/datum/job/leadinquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

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
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,8), rand(5,7), rand(6,8), rand(6,8)) //kids are dumb and weak
		H.add_skills(rand(1,2),rand(1,2),0,0,0)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,)
		H.set_trait(new/datum/trait/death_tolerant())
		to_chat(H, "<span class='notice'><b><font size=3>You are a war orphan, found and taken in by the generous Rogue Trader you owe him your life. However, you must earn your keep. The Rogue Trader has placed you in the charge of the Abbot who has you burying the dead. This is a vital task, it is said bodies that are left unburied are unable to move on to the Emperor's Grace! Make sure you bury any body you see! </font></b></span>")
