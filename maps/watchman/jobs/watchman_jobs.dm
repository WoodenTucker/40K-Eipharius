// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/watchman
	allowed_jobs = list(
	/datum/job/envoy/watchman,
	/datum/job/engineer/watchman,
	/datum/job/ig/guardsman/sharpshooter/watchman,
	/datum/job/mercenary/watchman,
	/datum/job/ig/guardsman/watchman,
	/datum/job/captain,
	/datum/job/envoy/imperial,
	/datum/job/engineer/imperial,
	/datum/job/ig/sergeant/imperial,
	/datum/job/ig/guardsman/sharpshooter/imperial,
	/datum/job/ig/guardsman/sniper/imperial,
	/datum/job/ig/medicae/imperial,
	/datum/job/ig/guardsman/imperial,


	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
