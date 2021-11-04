//Food && these jobs are outpost support staff

// Bar Servitor

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
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 8
	ranged_skill = 3
	medical_skill = 5
	engineering_skill = 5
	surgery_skill = 5


	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "abel"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(10,10), rand(8,11), rand(16,17), rand(8,10)) //extremely simple minded
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for managing a bar and serving drinks. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")

// Cook

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
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 9
	ranged_skill = 7
	medical_skill = 3
	engineering_skill = 2
	surgery_skill = 2
//	alt_titles = list("Cook")
	outfit_type = /decl/hierarchy/outfit/job/service/chef

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Pvt. [current_name]")
		H.add_stats(rand(11,12), rand(10,12), rand(10,12), rand(8,11)) //highly trained and skilled
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Trooper, your training recently complete you were assigned kitchen duties. It is up to you to feed a hungry outpost.</font></b></span>")

// Farmer

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
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 8
	ranged_skill = 8
	medical_skill = 3
	engineering_skill = 3
	surgery_skill = 2

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(13,15), rand(10,13), rand(12,15), rand(8,13))
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>Possibly the most important job on the entire planet. The Guard will thrive or starve depending on how skilled you are. Report to your farm in the southeastern corner of the outpost and get growing!</font></b></span>")

// Janitor Servitor

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
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 8
	ranged_skill = 3
	medical_skill = 5
	engineering_skill = 5
	surgery_skill = 5

	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "daan"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(10,10), rand(8,11), rand(16,17), rand(8,10)) //extremely simple minded
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for cleaning and maintaining the outpost. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")
