

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

