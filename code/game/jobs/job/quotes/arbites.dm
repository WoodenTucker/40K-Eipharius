/mob/living/carbon/human/proc/arbattack()
	set name = "Attack!"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Attack!")
		playsound(src, 'sound/effects/quotes/arbites/attack.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbfallback()
	set name = "Fall back!"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We must fall back!")
		playsound(src, 'sound/effects/quotes/arbites/fallback.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbfindguilty()
	set name = "We'll find guilty"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We will find the guilty")
		playsound(src, 'sound/effects/quotes/arbites/findguilty.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbifemperorwish()
	set name = "If Emperor wishes"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("If The Emperor wishes it")
		playsound(src, 'sound/effects/quotes/arbites/ifemperorwish.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbinnocencedeath()
	set name = "Innocence in death!"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Innocence in death!")
		playsound(src, 'sound/effects/quotes/arbites/innocencedeath.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbnoinnocence()
	set name = "No Innocence"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("There's no such thing as innocence!")
		playsound(src, 'sound/effects/quotes/arbites/noinnocence.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbnopeace()
	set name = "No peace tt guilty"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("There's no peace for the guilty")
		playsound(src, 'sound/effects/quotes/arbites/nopeace.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbwearelawl()
	set name = "We are the law!"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We are the law!")
		playsound(src, 'sound/effects/quotes/arbites/wearelaw.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbwearelaw()
	set name = "We are the law"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We are the law")
		playsound(src, 'sound/effects/quotes/arbites/wearedelaw.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbwedielawnever()
	set name = "We die, but law - never"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We may die, but a law never will!")
		playsound(src, 'sound/effects/quotes/arbites/wedielawnever.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/arbwemustcontrol()
	set name = "We must control situation"
	set category = "Arbites"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We must control the situation!")
		playsound(src, 'sound/effects/quotes/arbites/wemustcontrol.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return