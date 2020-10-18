/datum/job/assistant
	total_positions = 2

/datum/map/warhammer
	allowed_jobs = list(
	/datum/job/assistant,
	/datum/job/ig/commissar,
	/datum/job/ig/sergeant,
	/datum/job/ig/enforcer,
	/datum/job/guardsman,
	/datum/job/janitor,
	/datum/job/chef,
	/datum/job/hydro,
	/datum/job/chaplain,
	/datum/job/chief_engineer,
	/datum/job/engineer,
	/datum/job/hop,
	/datum/job/doctor,
	/datum/job/captain,
	/datum/job/inquisitor,
	/datum/job/bartender,
	/datum/job/librarian,
	/datum/job/cmo,
	/datum/job/doctor,
	/datum/job/chemist

	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name)
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	var/datum/language/L = null
	add_language(language_name)
	L = all_languages[language_name]

	if(L)
		default_language = L

/datum/job/assistant
	title = "Civilian Penitent"
	total_positions = 2
	spawn_positions = 2

/datum/job/guardsman
	title = "Imperial Guardsman"
	social_class = SOCIAL_CLASS_MIN
	outfit_type = /decl/hierarchy/outfit/job/redsoldier/soldier //will need to be replaced eventually - wel
	selection_color = "#b27676"
	department_flag = SEC
	auto_rifle_skill = 10 //This is leftover from coldfare, but we could go back to that one day so better not to mess with it.
	semi_rifle_skill = 10
	sniper_skill = 3
	shotgun_skill = 6
	lmg_skill = 3
	smg_skill = 3

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(12,17), rand(10,16), rand(8,12))
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("Pvt. [H.real_name]")
		H.warfare_language_shit(LANGUAGE_GOTHIC)
		H.assign_random_quirk()
		if(announced)
			H.say(";Guardsman reporting for duty!")