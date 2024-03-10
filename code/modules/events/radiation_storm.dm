/datum/event/radiation_storm
	var/const/enterBelt		= 30
	var/const/radIntervall 	= 5	// Enough time between enter/leave belt for 10 hits, as per original implementation
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 165 //Hopefully long enough for radiation levels to dissipate.
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0

/datum/event/radiation_storm/announce()
	threat_announcement.Announce("High levels of radiation detected, please evacuate into a solid structure in an orderly fashion.", new_sound = GLOB.using_map.radiation_detected_sound)

/datum/event/radiation_storm/start()
	make_maint_all_access()

/datum/event/radiation_storm/tick()
	if(activeFor == enterBelt)
		threat_announcement.Announce("Please remain in shelter until the radiation has passed.")
		radiate()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		radiate()

	else if(activeFor == leaveBelt)
		threat_announcement.Announce("Radioactive activity has ceased. Please allow for up to one minute while radiation levels dissipate, and report to a Medicae should you experience any symptoms.")

/datum/event/radiation_storm/proc/radiate()
	var/radiation_level = rand(15, 35)
	for(var/z in GLOB.using_map.station_levels)
		radiation_repository.z_radiate(locate(1, 1, z), radiation_level, 1)

	for(var/mob/living/carbon/C in GLOB.living_mob_list_)
		var/area/A = get_area(C)
		if(!A)
			continue
		if(A.area_flags & AREA_FLAG_RAD_SHIELDED)
			continue
		if(istype(C,/mob/living/carbon/human) && (A = /area/cadiaoutpost/new_hive/hive_city))
			var/mob/living/carbon/human/H = C
			if(prob(5 * (0.01 * (100 - H.getarmor(null, "rad")))))
				if (prob(75))
					randmutb(H) // Applies bad mutation
					domutcheck(H,null,MUTCHK_FORCED)
				else
					randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)

/datum/event/radiation_storm/end()
	revoke_maint_all_access()

/datum/event/radiation_storm/syndicate/radiate()
	return
