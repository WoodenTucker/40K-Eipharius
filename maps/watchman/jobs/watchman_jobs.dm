// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/watchman
	allowed_jobs = list(
	/datum/job/pathfinder/watchman, // leader
	/datum/job/envoy/watchman, // chaos asfartes.
	///datum/job/engineer/watchman, need dark mech sprite
	///datum/job/ig/guardsman/sharpshooter/watchman, need cultist switch case outfits
	/datum/job/mercenary/watchman,
	/datum/job/ig/guardsman/watchman, // need cultist switch case outfits
	/datum/job/captain, // RT, which is leader
	/datum/job/envoy/imperial,
	///datum/job/engineer/imperial, // add when dark mech is also added for balance
	/datum/job/ig/sergeant, // 2nd in command
	/datum/job/ig/guardsman/sharpshooter/imperial, // increased slots spec
	/datum/job/ig/guardsman/imperial,
	///datum/job/ig/guardsman/sniper/imperial, landmark no work yet
	/datum/job/sisterofbattle, // just one so far
	/datum/job/ig/medicae/imperial,

	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
