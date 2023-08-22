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



	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "abel"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(10,11), rand(8), rand(6,16), rand(7,8)) //extremely simple minded and weak
		H.add_skills(rand(6,9),rand(3,6),1,rand(5,7),3) //servitors know how to make basic self repairs
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for managing a bar and serving drinks. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")

/datum/job/hydro
	title = "Farmer"
	department = "Service"
	department_flag = PIL
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Town"
	selection_color = "#848484"
	latejoin_at_spawnpoints = TRUE
	access = list(access_hydroponics, access_bar, access_kitchen,access_village, access_grox)
	minimal_access = list(access_hydroponics, access_village, access_kitchen, access_grox)
//	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Farmer [current_name]")
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14)) //well fed and robust
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3) //farmers are handy
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are one of the few skilled hands on this frozen hellscape capable of keeping these apostates from starving in the winter.</font></b></span>")


// Cook
/*
/datum/job/chef
	title = "Cook"
	department = "Service"
	department_flag = CIV
	total_positions = 0
	spawn_positions = 0
	open_when_dead = 1
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Seneschal, the Commissar"
	selection_color = "#337C81"
	access = list(access_hydroponics, access_bar, access_kitchen, access_village)
	minimal_access = list(access_kitchen)
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	outfit_type = /decl/hierarchy/outfit/job/service/chef
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(11,12), rand(10,12), rand(10,12), rand(8,11)) //highly trained and skilled
		H.add_skills(rand(6,8),rand(6,7),rand(1,6),rand(1,2),1)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Trooper, your training recently complete you were assigned kitchen duties. It is up to you to feed a hungry outpost.</font></b></span>")

// Farmer

/datum/job/hydro
	title = "Farmer"
	department = "Service"
	department_flag = CIV
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Town"
	selection_color = "#848484"
	latejoin_at_spawnpoints = TRUE
	access = list(access_hydroponics, access_bar, access_kitchen,access_village, access_grox)
	minimal_access = list(access_hydroponics, access_village, access_kitchen, access_grox)
//	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14)) //well fed and robust
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3) //farmers are handy
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are one of the few skilled hands on this frozen hellscape capable of keeping these apostates from starving in the winter.</font></b></span>")

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
	access = list(access_janitor, access_village, access_mechanicus, access_medical)
	minimal_access = list(access_janitor, access_village, access_mechanicus, access_medical)
	//alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/service/janitor
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3


	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "daan"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(18,18), rand(8,11), rand(10,16), rand(8,12)) //simple minded
		H.add_skills(rand(6,9),rand(3,6),1,rand(5,7),3) //servitors know how to make basic self repairs
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for cleaning and maintaining the outpost. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")
*/

/mob/living/proc/assign_child_quirk()
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

/datum/job/undertaker
	title = "Scholam Youth"
	department = "Service"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MIN
	total_positions = 2 // noob greytider role.
	spawn_positions = 2
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "the Ecclesiarchy."
	selection_color = "#FCFBFA"
	access = list(access_janitor, access_village, access_medical)
	minimal_access = list(access_janitor, access_village, access_medical)
	outfit_type = /decl/hierarchy/outfit/job/service/undertaker
	announced = FALSE
	auto_rifle_skill = 2
	semi_rifle_skill = 2
	sniper_skill = 2
	shotgun_skill = 2
	lmg_skill = 2
	smg_skill = 2
	species_role = "Child"
	cultist_chance = 10

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,12), rand(18,19), rand(6,12), rand(10,14))
		H.add_skills(rand(6,9),rand(3,6),5,rand(6,7),6)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.witchblood()
		H.get_idcard()?.access = list(access_janitor, access_village, access_medical)
		H.assign_child_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
		to_chat(H, "<span class='notice'><b><font size=3>You are a war orphan, found and taken in by the generous Deacon you owe him your life. However, you must earn your keep. </font></b></span>")
