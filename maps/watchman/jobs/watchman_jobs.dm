// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/watchman
	allowed_jobs = list(
	/datum/job/captain,
	/datum/job/envoy,
	/datum/job/qm2,
	/datum/job/janissary,
	/datum/job/mercenary,
	/datum/job/ig/commissar,
	/datum/job/explorer,
	/datum/job/biologis,
	/datum/job/engineer,
	/datum/job/techmenial,
	/datum/job/ig/sergeant,
	/datum/job/ig/medicae,
	/datum/job/ig/guardsman/sharpshooter,
	/datum/job/ig/guardsman/sniper,
	/datum/job/ig/guardsman,
	/datum/job/ig/whiteshield,
	/datum/job/chaplain,
	/datum/job/sisterofbattle,
	/datum/job/doctor,
	/datum/job/undertaker,
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
