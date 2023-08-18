/mob/proc/defaultRitualSuccess(var/mob/ritual_leader)
	to_chat(ritual_leader, "We did it boys, we did the ritual!")


/proc/preservationSuccess(var/mob/ritual_leader)
	var/area/cadiaoutpost/oa/service/chapel/C = get_area(ritual_leader)
	C.consecrated = TRUE //marks the chapel area as consecrated, this will make heretics unable to stand being in it for long