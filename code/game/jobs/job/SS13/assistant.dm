/datum/job/assistant
	title = "Assistant"
	department = "Civilian"

	total_positions = 0
	spawn_positions = 0
	supervisors = "absolutely everyone"
	selection_color = "#515151"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
//	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor")
	outfit_type = /decl/hierarchy/outfit/job/assistant

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_village)
	else
		return list()
