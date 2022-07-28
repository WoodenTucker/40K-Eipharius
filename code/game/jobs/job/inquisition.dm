// Acolytes

/datum/job/acolyte
	title = "Inquisition Acolyte"
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
		"Acolyte of Ordos Malleus" = /decl/hierarchy/outfit/job/acolyte/malleus,
		"Tempestus Scion" = /decl/hierarchy/outfit/job/scion
		)
	announced = FALSE
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(14,17), rand(14,17), rand(14,17), rand(14,17)) //highly trained and skilled
		H.add_skills(rand(9,10),rand(9,10),rand(5,7),rand(5,6),rand(6,7)) //SUFFER NOT THE ALIEN, SUFFER NOT THE HERETIC
		H.assign_random_quirk()
		H.witchblood()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = get_all_accesses()
		to_chat(H, "<span class='notice'><b><font size=3>You are an interrogator-in-training, referred as Acolyte, Your task is to assist the Lord Inquisitor in investigating, neutralising and erasing traces of heresy, chaos, xenos and daemons. Should you fail in your duties, you have no doubt of what will become of you -- this may be your final test.</font></b></span>")

/datum/job/acolyte/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

// Inquisitors

/datum/job/inquisitor
	title = "Imperial Inquisitor"
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
		"Inquisitor" = /decl/hierarchy/outfit/job/inquisitor,
		"Inquisitor of Ordos Malleus" = /decl/hierarchy/outfit/job/inquisitor/malleus
		)
	announced = FALSE
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(17,20), rand(17,20), rand(17,20), rand(17,20)) //PRAISE THE EMPEROR
		H.add_skills(10,10,rand(7,10),rand(5,7),rand(7,8)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_faction = IMPERIUM
		H.witchblood()
		H.inquisitor = 1
		H.get_idcard()?.access = get_all_accesses()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Throne Agent, Loyal servant of the Imperium and Lords of the Inquisition. A single drop of mercy may result in the spilled bloods of untold millions, steel your heart to their suffering. Every person, asset and object on this planet is a tool or resource to be exploited. Excommunication and the dull thud of a bolt pistol is what awaits you in failure. Your acolytes personally selected to serve only you, whether they survive and rise to the ranks of Interrogator shall be determined in the coming weeks.</font></b></span>")

/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
