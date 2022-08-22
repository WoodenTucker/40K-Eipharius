/mob/living/carbon/human/proc/servaswish()
	set name = "As you wish"
	set category = "Servitor"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("As you wish")
		playsound(src, 'sound/effects/quotes/servitor/aswish.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/serviexisttoserve()
	set name = "Exist to serve"
	set category = "Servitor"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("I exist to serve")
		playsound(src, 'sound/effects/quotes/servitor/iexisttoserve.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/servishallobey()
	set name = "Shall obey"
	set category = "Servitor"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("I shall obey")
		playsound(src, 'sound/effects/quotes/servitor/ishallobey.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/servwaitinstructions()
	set name = "Waiting for instructions"
	set category = "Servitor"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("I await for instructions")
		playsound(src, 'sound/effects/quotes/servitor/waitinstructions.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/servyeslord()
	set name = "Yes, lord?"
	set category = "Servitor"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Yes, lord?")
		playsound(src, 'sound/effects/quotes/servitor/yeslord.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return