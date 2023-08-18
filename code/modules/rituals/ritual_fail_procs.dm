/mob/proc/defaultRitualFail(var/mob/ritual_leader)
	to_chat(ritual_leader, "Nothing happens!")

/proc/preservationFail(var/mob/ritual_leader)
	to_chat(L, "<span class='flick-holy'>+ I can't feel him... +</span>")
	L.happiness -= 1