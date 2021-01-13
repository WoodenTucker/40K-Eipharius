/datum/job/cmo
	title = "Sister Hospitaller"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM
	medical_skill = 10
	surgery_skill = 10
	engineering_skill = 0
	ranged_skill = 3
	melee_skill = 3
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Orders Hospitaller. You are the pinnacle of medical knowledge on this world, organize your sisters and ensure they are doing their duty to both the outpost and citizens of this world. Your own skills should not be wasted on the ordinary, keep available for injuries to important people"
	selection_color = "#633d63"
	req_admin_notify = 1
	economic_modifier = 10
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister Superior [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.say(";[title] reporting for duty!")
		H.add_stats(rand(8,12), rand(10,16), rand(10,14), rand(14,17))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.f_style = "shaved"
		H.h_style = "Bob"
		H << "You are the pinnacle of medical knowledge on this world, organize your sisters and ensure they are doing their duty to both the outpost and citizens of this world. Your own skills should not be wasted on the ordinary, keep available for injuries to important people."

/datum/job/doctor
	title = "Discipulus Hospitaller"
	department = "Medical"
	department_flag = MED
	minimal_player_age = 3
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Sister Hospitaller and the Orders Hospitaller.  You are responsible for the health of not only the outpost but the various pilgrims and penitents that live in the shanty town north of the outpost"
	selection_color = "#633d63"
	economic_modifier = 7
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology)
//	alt_titles = list(
//		"Surgeon" = /decl/hierarchy/outfit/job/medical/doctor/surgeon,
//		"Emergency Physician" = /decl/hierarchy/outfit/job/medical/doctor/emergency_physician,
//		"Nurse" = /decl/hierarchy/outfit/job/medical/doctor/nurse,
//		"Virologist" = /decl/hierarchy/outfit/job/medical/doctor/virologist)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.say(";[title] reporting for duty!")
		H.add_stats(rand(6,10), rand(10,14), rand(10,14), rand(12,15))
		H.add_skills(3,3,rand(5,7),0,rand(5,7))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.f_style = "shaved"
		H.h_style = "Bob"


//Chemist is a medical job damnit	//YEAH FUCK YOU SCIENCE	-Pete	//Guys, behave -Erro
/datum/job/chemist
	title = "Chemist"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 7
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sister Hospitaller"
	selection_color = "#633d63"
	economic_modifier = 5
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics)
	minimal_access = list(access_medical, access_medical_equip, access_chemistry)
	alt_titles = list("Pharmacist")
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist

/datum/job/geneticist
	title = "Geneticist"
	department = "Medical"
	department_flag = MED|SCI

	total_positions = 0
	spawn_positions = 0
	minimal_player_age = 7
	supervisors = "the Sister Hospitaller"
	selection_color = "#633d63"
	economic_modifier = 7
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_research)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_research)
	outfit_type = /decl/hierarchy/outfit/job/medical/geneticist

/datum/job/psychiatrist
	title = "Psychiatrist"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	economic_modifier = 5
	minimal_player_age = 3
	supervisors = "the Sister Hospitaller"
	selection_color = "#633d63"
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_psychiatrist)
	minimal_access = list(access_medical, access_medical_equip, access_psychiatrist)
//	alt_titles = list("Psychologist" = /decl/hierarchy/outfit/job/medical/psychiatrist/psychologist)
	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist

/datum/job/Paramedic
	title = "Combat Medic"
	department = "Medical"
	department_flag = SEC|MED

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sister Hospitaller"
	selection_color = "#633d63"
	economic_modifier = 4
	minimal_player_age = 7
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_eva, access_maint_tunnels, access_external_airlocks)
//	alt_titles = list("Emergency Medical Technician" = /decl/hierarchy/outfit/job/medical/paramedic/emt)
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
