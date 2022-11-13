// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/warhammer
	allowed_jobs = list(
	/datum/job/governor
	/datum/job/heir
	/datum/job/servant
	/datum/job/acolyte
	/datum/job/marshal
	/datum/job/enforcer
	/datum/job/cadet
	/datum/job/ig/sergeant
	/datum/job/ig/sniper
	/datum/job/ig/guardsman/sharpshooter
	/datum/job/ig/medicae
	/datum/job/ig/guardsman
	/datum/job/ig/whiteshield
	/datum/job/captain
	/datum/job/janissary
	/datum/job/mercenary
	/datum/job/explorer
	/datum/job/biologis
	/datum/job/engineer
	/datum/job/techmenial
	/datum/job/chaplain
	/datum/job/sistersuperior
	/datum/job/hospitaller
	/datum/job/novice
	/datum/job/preacher
	/datum/job/innkeeper
	/datum/job/bouncer
	/datum/job/pathfinder
	/datum/job/gangboy
	/datum/job/penitent
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
