

/datum/map/warhammer
	allowed_jobs = list(
	/datum/job/penitent,
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
	/datum/job/cmo,
	/datum/job/chemist,
	/datum/job/geneticist,
	/datum/job/Paramedic,
	/datum/job/mining,
	/datum/job/cargo_tech,
	/datum/job/qm,
	/datum/job/envoy,
	/datum/job/leadinquisitor,
	/datum/job/innkeeper,
	/datum/job/undertaker,
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
