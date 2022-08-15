/mob/living/carbon/human/proc/astafortheemperor()
	set name = "For the Emperor"
	set category = "Emotes"
	set desc = "For the Emperor"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping your mom immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>That isn't nightmare to sream, only the final rest...</span>")
		return
	if(src.quote_cd == 0)
		src.say("For the Emperor")
		playsound(src, 'sound/effects/fortheemperor.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(100)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/astafortheemperorl()
	set name = "For the Emperor!"
	set category = "Emotes"
	set desc = "For the Emperor!"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping your mom immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>That isn't nightmare to sream, only the final rest...</span>")
		return
	if(src.quote_cd == 0)
		src.say("For the Emperor!")
		playsound(src, 'sound/effects/fortheemperorl.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(100)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return