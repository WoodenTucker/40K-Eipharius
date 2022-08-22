/mob/living/carbon/human/proc/astaforemperor()
	set name = "For The Emperor"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("For The Emperor")
		playsound(src, 'sound/effects/quotes/astartes/foremperor.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astaforemperorl()
	set name = "For The Emperor!"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("For The Emperor!")
		if(prob(50))
			playsound(src, 'sound/effects/quotes/astartes/foremperorl.ogg', 80, 0, 12)
		else
			playsound(src, 'sound/effects/quotes/astartes/foremperorla.ogg', 80, 0, 12)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astachaos()
	set name = "Chaos sighted"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Chaos sighted")
		playsound(src, 'sound/effects/quotes/astartes/chaos.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astacharge()
	set name = "Charge!"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Chaaaaarge!")
		playsound(src, 'sound/effects/quotes/astartes/charge.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astacrush()
	set name = "We'll crush enemies"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We will crush the enemies of The Imperium")
		playsound(src, 'sound/effects/quotes/astartes/crush.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astadamage()
	set name = "Taking damage"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Taking damage")
		playsound(src, 'sound/effects/quotes/astartes/damage.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astadiescum()
	set name = "Die, scum!"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Die, scum!")
		playsound(src, 'sound/effects/quotes/astartes/diescum.ogg', 80, 0, 15)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astaeatboltgun()
	set name = "Eat boltgun!"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Eat boltgun!")
		playsound(src, 'sound/effects/quotes/astartes/eatboltgun.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astafaithshield()
	set name = "Faith is our shield"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Faith is our shield")
		playsound(src, 'sound/effects/quotes/astartes/faithshield.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astafallback()
	set name = "Fall back"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Fall back and regroup!")
		playsound(src, 'sound/effects/quotes/astartes/fallback.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astaforglory()
	set name = "For the Imperium"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("For the glory of the Imperium")
		playsound(src, 'sound/effects/quotes/astartes/forglory.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astagrenades()
	set name = "Let grenades fly!"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Let the grenades fly!")
		playsound(src, 'sound/effects/quotes/astartes/grenades.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astakill()
	set name = "Cleanse, purge, kill!"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Cleanse, purge, kill!")
		playsound(src, 'sound/effects/quotes/astartes/kill.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astanonestopus()
	set name = "None stop us"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("None shall stop us")
		playsound(src, 'sound/effects/quotes/astartes/nonestopus.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astaourwrath()
	set name = "Feel our wrath"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Feel our wrath")
		playsound(src, 'sound/effects/quotes/astartes/ourwrath.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astaready()
	set name = "Weapon at ready"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Weapons at ready, it is time")
		playsound(src, 'sound/effects/quotes/astartes/ready.ogg', 80, 0, 7)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astatoglory()
	set name = "To glory"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Onward, to glory")
		playsound(src, 'sound/effects/quotes/astartes/toglory.ogg', 80, 0, 9)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/astaxenos()
	set name = "Xenos spotted"
	set category = "Astartes"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Xenos spotted")
		playsound(src, 'sound/effects/quotes/astartes/xenos.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return