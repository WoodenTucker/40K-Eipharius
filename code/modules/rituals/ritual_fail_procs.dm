/mob/proc/defaultRitualFail(var/mob/ritual_leader)
	to_chat(ritual_leader, "Nothing happens!")

/proc/preservationFail(var/mob/ritual_leader)
	var/i
	for(i=1,i<=ritual_leader.active_ritual.ritualists.len,i++)
		var/mob/living/carbon/human/ritualist = ritual_leader.active_ritual.ritualists[i]
		to_chat(ritualist, "<span class='flick-holy'>+ I can't feel Him... +</span>")
		ritualist.happiness -= 1