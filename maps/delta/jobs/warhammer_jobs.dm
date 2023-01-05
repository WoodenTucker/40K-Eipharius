// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/warhammer
	allowed_jobs = list(
	/datum/job/governor,
	/datum/job/heir,
	/datum/job/servant,
	/datum/job/inquisitor,
	/datum/job/acolyte,
	/datum/job/arbitrator,
	/datum/job/enforcer,
	/datum/job/cadet,
	/datum/job/ig/commissar,
	/datum/job/ig/sergeant,
	/datum/job/ig/guardsman/sniper,
	/datum/job/ig/guardsman/sharpshooter,
	/datum/job/ig/medicae,
	/datum/job/ig/guardsman,
	/datum/job/ig/bullgryn,
	/datum/job/ig/whiteshield,
	/datum/job/roguetrader,
	/datum/job/vetmerc,
	/datum/job/xenomerc,
	/datum/job/explorer,
	/datum/job/biologis,
	/datum/job/engineer,
	/datum/job/techmenial,
	/datum/job/confessor,
	/datum/job/sistersuperior,
	/datum/job/hospitaller,
	/datum/job/novice,
	/datum/job/preacher,
	/datum/job/innkeeper,
	/datum/job/bouncer,
	/datum/job/pathfinder,
	/datum/job/gangboy,
	/datum/job/penitent,
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
