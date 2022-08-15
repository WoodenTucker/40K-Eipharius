/mob/living/carbon/human/proc/lordofflies()
	set name = "For the Lord of the flies!"
	set category = "Nurgle"
	set desc = "For the Lord of the flies!"

	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Nurgle immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>Not in death.</span>")
		return

	if(src.quote_cd == 0)
		src.say("For the Lord of the flies!")
		playsound(src, 'sound/effects/quotes/cults/nurgle/fornurgle.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(100)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return