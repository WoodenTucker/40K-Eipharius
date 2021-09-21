/mob/living/carbon/human/Stat()
	..()
	if(psyker == 1)
		stat(null, "Focus: [focus]/[max_focus]")

/mob/living/carbon/human/Life()
	..()
	var/regen = 0.5
	if(max_focus > 0)
		focus = max(0, min(focus + regen, max_focus))
