//  Astartes Envoy

/datum/job/envoy
	title = "Astartes Envoy"
	total_positions = 1
	spawn_positions = 1
	head_position = 0
	supervisors = "The Rogue Trader and your Chapter Master"
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/astartes //will need to be replaced eventually - wel
	alt_titles = list(
		"Blood Angels Tactical Marine" = /decl/hierarchy/outfit/job/astartes,
		"Blood Angels Sanguinary Priest" = /decl/hierarchy/outfit/job/astartes/bangapoth,
		"Blood Angels Techmarine" = /decl/hierarchy/outfit/job/astartes/bangtech,
		"Raven Guard Tactical Marine" = /decl/hierarchy/outfit/job/astartes/ravenguard,
		"Raven Guard Apothecary" = /decl/hierarchy/outfit/job/astartes/ravapoth,
		"Raven Guard Techmarine" = /decl/hierarchy/outfit/job/astartes/raventech,
		"Salamander Tactical Marine" = /decl/hierarchy/outfit/job/astartes/salamander,
		"Salamander Apothecary" = /decl/hierarchy/outfit/job/astartes/salapoth,
		"Salamander Techmarine" = /decl/hierarchy/outfit/job/astartes/saltech,
		"Ultramarine Tactical Marine" = /decl/hierarchy/outfit/job/astartes/ultramarine,
		"Ultramarine Apothecary" = /decl/hierarchy/outfit/job/astartes/ultrapoth,
		"Ultramarine Techmarine" = /decl/hierarchy/outfit/job/astartes/ultratech
		)
	selection_color = "#344FAA"
	department_flag = SEC|COM
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	req_admin_notify = 1
	open_when_dead = 0
	latejoin_at_spawnpoints = 1
	announced = 0
	species_role = "Astartes"

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Brother [current_name]")
		H.add_stats(30, rand(25,30), rand(25,30), rand(20,30)) //genuinely no idea what to make their stats
		H.add_skills(11,11,11,11,11)
/*switch(title) //either you get this to work or you dont change it, ok?
			if("Blood Angel Tactical Marine")
				H.add_skills(rand(13,15),rand(11,13),5,5,5)
			if("Raven Guard Tactical Marine")
				H.add_skills(rand(11,13),rand(13,15),5,5,5)
			if("Salamander Tactical Marine")
				H.add_skills(rand(11,13),rand(11,13),5,7,5)
			if("Ultramarine Tactical Marine")
				H.add_skills(rand(11,13),rand(11,13),5,5,5)
			if("Blood Angel Sanguinary Priest")
				H.add_skills(15, 13, 9, 1, 10)
			if("Raven Guard Apothecary")
				H.add_skills(13, 15, 9, 1, 10)
			if("Salamander Apothecary")
				H.add_skills(13, 13, 9, 3, 10)
			if("Ultramarine Apothecary")
				H.add_skills(13, 13, 9, 1, 10)
			if("Blood Angel Techmarine")
				H.add_skills(15, 13, 2, 11, 1)
			if("Raven Guard Techmarine")
				H.add_skills(13, 15, 2, 11, 1)
			if("Salamander Techmarine")
				H.add_skills(13, 13, 4, 11, 1)
			if("Ultramarine Techmarine")
				H.add_skills(13, 13, 2, 11, 1)*/
		H.set_trait(new/datum/trait/death_tolerant())
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Space Marine, hired to guard the Rogue Trader and further the goals of the Imperium. You are a beacon of Mankind's greatness, your behavior should reflect this always. Guardsmen revere you and will defer to your judgement, make sure it is sound.</font></b></span>")
		H.gender = MALE
		H.f_style = "shaved"
		H.h_style = "Bald"
		H.bladder = -INFINITY
		H.bowels = -INFINITY //integrated shitter
		H.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them

/datum/job/envoy/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)
