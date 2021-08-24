/datum/job/cmo
	title = "Sister Hospitaller"
	head_position = 1
	department = "Medical"
	department_flag = COM|MED
	medical_skill = 10
	surgery_skill = 10
	engineering_skill = 0
	ranged_skill = 3
	melee_skill = 3
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

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister Hospitaller [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(8,12), rand(10,16), rand(10,14), rand(14,17))
		H.add_skills(3,3,10,0,10)
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.f_style = "shaved"
		H.h_style = "Bob"

		to_chat(H, "<span class='notice'><b><font size=3>You are the pinnacle of medical knowledge on this world, organize your sisters and ensure they are doing their duty to both the outpost and citizens of this world. Your own skills should not be wasted on the ordinary, keep available for injuries to important people</font></b></span>")

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

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(8,12), rand(10,14), rand(10,14), rand(12,15))
		H.add_skills(3,3,rand(7,9),0,rand(7,9))
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

		to_chat(H, "<span class='notice'><b><font size=3>You are responsible for the health of not only the outpost but the various pilgrims and penitents that live in the shanty town north of the outpost</font></b></span>")


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


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,10), rand(7,12), rand(8,12), rand(9,13))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.add_skills(2,2,rand(2,4),0,rand(1,3)) //they have limited medical knowledge
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You mix and concoct the numerous healing tincures and salves so beloved by the Ordos Hospitaller. Keep the outpost stocked and maybe sell a little something on the side if you're willing to brave the Inquisition.</font></b></span>")

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

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Biologis [current_name]")
		H.add_stats(rand(6,14), rand(8,14), rand(10,13), rand(15,20))
		H.add_skills(rand(0,5),rand(0,5),rand(6,10),rand(3,6),10)
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

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		H.warfare_faction = IMPERIUM
		..()
		H.fully_replace_character_name("Medicae [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM, "medic")
		H.add_stats(rand(10,13), rand(10,14), rand(10,14), rand(12,15))
		H.add_skills(rand(4,6),rand(4,6),10,0,rand(5,7))
		H.get_equipped_item(slot_s_store)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a combat medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")
