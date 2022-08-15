/mob/living/carbon/human/proc/sobemperorgivesstrenght()
	set name = "Emperor gives us strenght"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Emperor gives us strength")
		playsound(src, 'sound/effects/quotes/sob/emperorgivesstrenght.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobnotforsakeme()
	set name = "Emperor do not forsake me"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Emperor do not forsake me!")
		playsound(src, 'sound/effects/quotes/sob/notforsakeme.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobpraise()
	set name = "Praise the Emperor!"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Praise the Emperor!")
		playsound(src, 'sound/effects/quotes/sob/praise.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobsororitas()
	set name = "Prepared to serve"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Adepta Sororitas prepared to serve!")
		playsound(src, 'sound/effects/quotes/sob/sororitas.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobtheemperor()
	set name = "Our father and guardian"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("The Emperor. Our father and guardian")
		playsound(src, 'sound/effects/quotes/sob/theemperor.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobfearthesister()
	set name = "Fear the sisters"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Fear the sisters of battle")
		playsound(src, 'sound/effects/quotes/sob/fearthesister.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobfeelwrath()
	set name = "Feel our wrath"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Feel our wrath")
		playsound(src, 'sound/effects/quotes/sob/feelwrath.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobfoesapproach()
	set name = "Foes approach, prepare"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Our foes approach, prepare yourselves")
		playsound(src, 'sound/effects/quotes/sob/foesapproach.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobnomercy()
	set name = "No mercy"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Show no mercy!")
		playsound(src, 'sound/effects/quotes/sob/nomercy.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobretreat()
	set name = "Retreat"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Retreat!")
		playsound(src, 'sound/effects/quotes/sob/retreat.ogg', 80, 0, 8)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobtakingfire()
	set name = "Taking fire"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We are taking fire!")
		playsound(src, 'sound/effects/quotes/sob/takingfire.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/sobweservants()
	set name = "We are servants"
	set category = "Sororitas"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("We are servants of The God Emperor")
		playsound(src, 'sound/effects/quotes/sob/weservants.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return