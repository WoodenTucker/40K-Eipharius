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

