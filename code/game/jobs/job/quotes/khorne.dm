
/mob/living/carbon/human/proc/bludforbludguy()
	set name = "Blood for the Blood God!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("BLOOD FOR THE BLOOD GOD!")
		playsound(src, 'sound/effects/quotes/cults/khorne/khorne.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/letriverflow()
	set name = "Let the red river flow!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Let the red river flow!")
		playsound(src, 'sound/effects/quotes/cults/khorne/letriverflow.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/aaaaaa()
	set name = "AAAAAA!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("AAAAAA!")
		playsound(src, 'sound/effects/quotes/cults/khorne/aaaaaa.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/advance()
	set name = "Advance for battle!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Advance for battle!")
		playsound(src, 'sound/effects/quotes/cults/khorne/advance.ogg', 80, 0, 12)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/bringdeath()
	set name = "We bring death!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We bring death!")
		playsound(src, 'sound/effects/quotes/cults/khorne/bringdeath.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/chopdem()
	set name = "Chop dem down!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Chop dem down!")
		playsound(src, 'sound/effects/quotes/cults/khorne/chopdem.ogg', 80, 0, 12)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/chaaaaaarge()
	set name = "Chaaaaaarge!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Chaaaaaarge!")
		playsound(src, 'sound/effects/quotes/cults/khorne/charge.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/praynslay()
	set name = "Pray 'n slay!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Pray 'n slay!")
		playsound(src, 'sound/effects/quotes/cults/khorne/praynslay.ogg', 80, 0, 12)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/overthere()
	set name = "Get over there!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Get over there!")
		playsound(src, 'sound/effects/quotes/cults/khorne/overthere.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/moving()
	set name = "Get moving!"
	set category = "Khorne"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Get moving!")
		playsound(src, 'sound/effects/quotes/cults/khorne/moving.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(60)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return