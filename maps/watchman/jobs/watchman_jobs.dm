// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/watchman
	allowed_jobs = list(
	/datum/job/pathfinder/watchman, // leader
	/datum/job/ig/sergeant/watchman, // 2nd in command
	/datum/job/ig/guardsman/sharpshooter/watchman, // 3 slots, always have decent less than imperial
	/datum/job/mercenary/watchman, // xeno
	/datum/job/ig/guardsman/watchman, // chaos cultist
	/datum/job/captain, // RT, which is leader
	/datum/job/ig/commissar/imperial, // 2nd in command
	/datum/job/ig/sergeant/imperial, // 3rd in command
	/datum/job/ig/guardsman/sharpshooter/imperial, // 5 slots
	/datum/job/ig/guardsman/sniper/imperial, // 2 slots
	/datum/job/ig/guardsman/imperial,
	///datum/job/ig/guardsman/sniper/imperial, landmark no work yet
	/datum/job/sisterofbattle/imperial, // 3 for now, as there are no assfartes
	/datum/job/doctor, // hospitaller
	/datum/job/ig/medicae/imperial,

	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
