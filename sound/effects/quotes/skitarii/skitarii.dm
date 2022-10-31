/mob/living/carbon/human/proc/skitaloyal()
	set name = "Loyal Forever"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Techguard, loyal forever to the Red Planet")
		playsound(src, 'sound/effects/quotes/skitarii/redplanet.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitadevotees()
	set name = "Devotees"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Devotees of the Machine God")
		playsound(src, 'sound/effects/quotes/skitarii/devotees.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitaexterminate()
	set name = "Exterminate"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Register exterminate command	")
		playsound(src, 'sound/effects/quotes/skitarii/exterminate.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitaforgeworld()
	set name = "We serve"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We serve the forge world")
		playsound(src, 'sound/effects/quotes/skitarii/forgeworld.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitahailomnissiah()
	set name = "Hail Omnissiah"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("All hail the Omnissiah")
		playsound(src, 'sound/effects/quotes/skitarii/hailomnissiah.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitaletminions()
	set name = "Let us know the master"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Let the minions know their masters")
		playsound(src, 'sound/effects/quotes/skitarii/letminions.ogg', 80, 0, 4)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitamachinemercy()
	set name = "Machine knows no mercy nor weakness"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("The machine knows need a mercy nor weakness")
		playsound(src, 'sound/effects/quotes/skitarii/machinemercy.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitamachinestrong()
	set name = "Machine is strong"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Biomatter is weak, the Machine God is strong")
		playsound(src, 'sound/effects/quotes/skitarii/machinestrong.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitamanmachine()
	set name = "Union of main and machine"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Achieved by union of man and machine")
		playsound(src, 'sound/effects/quotes/skitarii/manmachine.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitaorganic()
	set name = "Your organic is weak"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Your organic is weak")
		playsound(src, 'sound/effects/quotes/skitarii/organic.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitaskitarii()
	set name = "Skitarii, made to suit the task in hands"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Skitarii, modified to suit the task in hands")
		playsound(src, 'sound/effects/quotes/skitarii/skitarii.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitayourpurpose()
	set name = "Serving your purpose"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Serving your purpose")
		playsound(src, 'sound/effects/quotes/skitarii/yourpurpose.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return

/mob/living/carbon/human/proc/skitataskcompl()
	set name = "Task completed"
	set category = "Skitarii"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Task completed")
		playsound(src, 'sound/effects/quotes/skitarii/taskcompl.ogg', 80, 0, 3)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
		return