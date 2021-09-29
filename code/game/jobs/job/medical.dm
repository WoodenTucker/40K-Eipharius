/datum/job/cmo
	title = "Sister Hospitaller"
	head_position = 1
	department = "Medical"
	department_flag = COM|MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Orders Hospitaller"
	selection_color = "#633d63"
	req_admin_notify = 1
	economic_modifier = 10
	open_when_dead = FALSE
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 6
	ranged_skill = 5
	medical_skill = 10
	engineering_skill = 1
	surgery_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister Hospitaller [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(11,15), rand(11,15), rand(11,15), rand(12,16))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.f_style = "shaved"
		H.h_style = "Bob"

		to_chat(H, "<span class='notice'><b><font size=3>You are the pinnacle of medical knowledge within the Ordos Hospitaller, organize your sisters and ensure they are doing their duty to both the Lord Trader and the Codex Sororitas. Sanctify and heal this unholy land of it's festering heretical past... in the name of your Emperor.</font></b></span>")

/datum/job/doctor
	title = "Discipulus Hospitaller"
	department = "Medical"
	department_flag = MED
	minimal_player_age = 3
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Sister Hospitaller and the Orders Hospitaller"
	selection_color = "#967096"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = TRUE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_maint_tunnels, access_sob)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_maint_tunnels, access_sob)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 5
	ranged_skill = 4
	medical_skill = 8
	engineering_skill = 0
	surgery_skill = 8

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(10,14), rand(10,14), rand(10,14), rand(12,15))
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.warfare_faction = IMPERIUM
		H.f_style = "shaved"
		H.h_style = "Bob"
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are a junior sister of the Ordos Hospitaller, serving under the Sister Hospitaller to maintain the health and divinity of the garrison.</font></b></span>")


//Chemist is a medical job damnit	//YEAH FUCK YOU SCIENCE	-Pete	//Guys, behave -Erro
/datum/job/chemist
	title = "Alchemist"
	department = "Medical"
	department_flag = MED
	social_class = SOCIAL_CLASS_MED
	minimal_player_age = 7
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sister Hospitaller"
	selection_color = "#967096"
	economic_modifier = 5
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics,access_maint_tunnels)
	minimal_access = list(access_medical, access_medical_equip, access_chemistry,access_maint_tunnels,)
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 4
	ranged_skill = 4
	medical_skill = 8
	engineering_skill = 1
	surgery_skill = 7

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,13), rand(9,13), rand(9,13), rand(10,13))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You mix and concoct the numerous decoctions, medicines and salves so beloved by the Ordos Hospitaller.</font></b></span>")

/datum/job/geneticist
	title = "Biologis"
	department = "Medical"
	department_flag = MED|SCI|ENG
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	open_when_dead = 1
	supervisors = "the Sister Hospitaller and Magos"
	selection_color = "#967096"
	economic_modifier = 7
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_research,access_maint_tunnels, access_robotics, access_engine, access_engine_equip,)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_research,access_maint_tunnels, access_robotics, access_engine_equip, access_engine)
	outfit_type = /decl/hierarchy/outfit/job/medical/geneticist
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 3
	ranged_skill = 3
	medical_skill = 6
	engineering_skill = 8
	surgery_skill = 8

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Biologis [current_name]")
		H.add_stats(rand(10,14), rand(10,14), rand(10,13), rand(15,20))
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Biologis. You lead biological research on the outpost and oversee the construction of Skitarii.</font></b></span>")

/datum/job/psychiatrist
	title = "Psychiatrist"
	department = "Medical"
	department_flag = MED

	total_positions = 0
	spawn_positions = 0
	economic_modifier = 5
	minimal_player_age = 3
	supervisors = "the Sister Hospitaller"
	selection_color = "#633d63"
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_psychiatrist)
	minimal_access = list(access_medical, access_medical_equip, access_psychiatrist)
	outfit_type = null

/datum/job/Paramedic
	title = "Combat Medicae"
	department = "Medical"
	department_flag = SEC|MED
	social_class = SOCIAL_CLASS_MED
	can_be_in_squad = TRUE
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sister Hospitaller and the Commissar"
	selection_color = "#967096"
	economic_modifier = 4
	minimal_player_age = 4
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist, access_sec_doors, access_security)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_eva, access_maint_tunnels, access_external_airlocks,access_sec_doors,access_security)
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 5
	ranged_skill = 5
	medical_skill = 8
	engineering_skill = 0
	surgery_skill = 5

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		H.warfare_faction = IMPERIUM
		..()
		H.fully_replace_character_name("Medicae [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM, "medic")
		H.add_stats(rand(11,14), rand(11,14), rand(12,15), rand(12,15))
		H.get_equipped_item(slot_s_store)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a combat medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")
