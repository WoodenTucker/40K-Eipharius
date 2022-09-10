// Interrogator

/datum/job/acolyte
	title = "Interrogator"
	department_flag = INQ
	social_class = SOCIAL_CLASS_MED
	total_positions = 1 // Interrogator has one slot. Admins must enable further slots.
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "The Golden Throne, the Inquisition and Your Lord Inquisitor"
	selection_color = "#FF3A3A"
	economic_modifier = 7
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/interrogator
	announced = FALSE
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 20

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
		H.adjustStaminaLoss(-90)
		to_chat(H, "<span class='notice'><b><font size=3> You are an interrogator, the apprentice of, the Lord Inquisitor. It is not uncommon for Interrogators' to work undercover or incognito. Your task is to assist the Lord Inquisitor in investigating, neutralizing and erasing traces of heresy, chaos, xenos and daemons. Now more then ever your actions are being weighed by not only your master, but the inquisition - this mission is the last opportunity to clear the names of not only the Lord Inquisitor but that of his entire retinue...</font></b></span>")

/datum/job/acolyte/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
// Scion is now attached to the Guard
/datum/job/scion
	title = "Tempestus Scion"
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "The Astra Militarum."
	selection_color = "#33813A"
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
		H.add_stats(rand(16,19), rand(15,18), rand(14,17), rand(14,17)) //highly trained and skilled
		H.add_skills(rand(10,10),rand(9,10),rand(5,7),rand(5,6),rand(6,7)) //SUFFER NOT THE ALIEN, SUFFER NOT THE HERETIC
		H.assign_random_quirk()
		H.witchblood()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.assign_squad_leader(IMPERIUM)
		H.warfare_faction = IMPERIUM
		H.adjustStaminaLoss(-100)
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Tempestus Scion attached to the retinue of the Lord Trader, your services ultimately being in the protection of imperial assets here on Eipharius on behalf of the Astra Militarum. It's barely been a week since leaving your Regiment and you are still adjusting to the new reality of your posting. Loyal to the Emperor above all else, Tempestus Scions provide the Imperial High Command with a core of flexible, nigh-incorruptible soldiers. Deployed sparingly, they can be depended upon to complete any mission, no matter how deadly. Racing into battle aboard armoured transports or plummeting down on Grav-Chutes, the Scions are the sharp edge of the Imperial Guard war machine.</font></b></span>")

// Inquisitor

/datum/job/inquisitor
	title = "Imperial Inquisitor"
	department_flag = INQ|COM
	social_class = SOCIAL_CLASS_MED
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
	announced = TRUE
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	cultist_chance = 50

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
		H.adjustStaminaLoss(-110)
		to_chat(H, "<span class='notice'><b><font size=3>You are extremis diabolus, an inquisitor in service to the Ordos that has been considered for reasons up to you, a liability to the inquisition. Every person, asset and object on this planet is a tool or resource to be exploited. Humiliation, torture and the dull thud of a bolt pistol is what awaits you in failure should you not prove yourself here. Your acolytes personally selected to serve only you, whether they survive the horrid taint associated with your name and rise to the ranks of Inquisitor shall be determined in the coming weeks.</font></b></span>")

/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
