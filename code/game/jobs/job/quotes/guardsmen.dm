/mob/living/carbon/human/proc/igattack()
	set name = "Attack!"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Attaaack!")
		playsound(src, 'sound/effects/quotes/guardsmen/attack.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igcanthold()
	set name = "We can't hold"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We can't hold!")
		playsound(src, 'sound/effects/quotes/guardsmen/canthold.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igcharge()
	set name = "Charge!"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Chaaaaaaarge!")
		playsound(src, 'sound/effects/quotes/guardsmen/charge.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igemperorprotects()
	set name = "Emperor protects"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("The Emperor protects")
		playsound(src, 'sound/effects/quotes/guardsmen/emperorprotects.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igholdline()
	set name = "Hold line!"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Hold the line!")
		playsound(src, 'sound/effects/quotes/guardsmen/holdline.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/iginhisname()
	set name = "Fight in His name!"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Fight in His name!")
		playsound(src, 'sound/effects/quotes/guardsmen/inhisname.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igregroup()
	set name = "Regroup"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Regroup!")
		playsound(src, 'sound/effects/quotes/guardsmen/regroup.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igretreat()
	set name = "Retreat!"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Retreat!")
		playsound(src, 'sound/effects/quotes/guardsmen/retreat.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igrunforlifes()
	set name = "Run for your lifes!"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Run for your lifes!")
		playsound(src, 'sound/effects/quotes/guardsmen/runforlifes.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/igyessir()
	set name = "Yes, sir"
	set category = "Guardsmen"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Yes, sir")
		playsound(src, 'sound/effects/quotes/guardsmen/yessir.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return