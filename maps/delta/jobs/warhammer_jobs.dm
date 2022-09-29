

/datum/map/warhammer
	allowed_jobs = list(
	/datum/job/captain,
	/datum/job/envoy,
	/datum/job/inquisitor,
	/datum/job/acolyte,
	/*/datum/job/scion,*/
	/datum/job/ig/commissar,
	/datum/job/ig/sergeant,
	/datum/job/ig/guardsman,
	/datum/job/ig/guardsman/sharpshooter,
	/datum/job/ig/guardsman/sniper,
	/datum/job/ig/whiteshield,
	/datum/job/cmo,
	/datum/job/doctor,
	/datum/job/progena,
	/datum/job/ig/medicae,
	/*/datum/job/chemist,*/
	/datum/job/geneticist,
	/datum/job/magos,
	/datum/job/engineer,
	/datum/job/hop,
	/datum/job/heir,
	/datum/job/servant,
	/* /datum/job/chef, */
	/*/datum/job/janitor,*/
	/*/datum/job/bartender,*/
	/* /datum/job/mining, */
	/*/datum/job/cargo_tech, */
	/* /datum/job/qm1, */
	/datum/job/chaplain,
	/datum/job/sisterofbattle,
	/datum/job/qm2,
	/datum/job/gangboy,
	/datum/job/janissary,
	/datum/job/enforcer,
	/datum/job/marshal,
	/datum/job/innkeeper,
	/datum/job/hydro,
	/datum/job/undertaker,
	/datum/job/pathfinder,
	/datum/job/penitent,
	/datum/job/bouncer,
	/* /datum/job/prisoner/penitent, //NOT READY */
	/* /datum/job/prisoner/penitent/sarge, //WIP */
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
