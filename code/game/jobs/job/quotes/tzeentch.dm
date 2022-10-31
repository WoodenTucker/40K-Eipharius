/mob/living/carbon/human/proc/tzeewehere()
	set name = "We are here"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("We are here")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/werehere.ogg', 80, 0, 20)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeeforthechanger()
	set name = "For the Changer of Ways! (Say)"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("For the Changer of Ways!")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/fortzeentch.ogg', 80, 0, 18)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeebeconsumed()
	set name = "You will be consumed"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("You will be consumed")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/youbeconsumed.ogg', 80, 0, 12)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeeweshallsacrifise()
	set name = "We shall sacrifice our lives"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("We shall gladly sacrifice our lives for Tzeentch's designs")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/weshallsacrifice.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeetheyseetruth()
	set name = "They'll see the truth"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("And then they'll see the truth")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/theyseetruth.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeepeerminds()
	set name = "We'll pierce theirs little minds"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("We'll pierce theirs little minds")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/peerminds.ogg', 80, 0, 5)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeecharge()
	set name = "Charge!(Say)"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		src.say("Charge!")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/charge.ogg', 80, 0, 18)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeechangecome()
	set name = "Change has come"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("Change has come")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/changecome.ogg', 80, 0, 6)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeebelongtous()
	set name = "It shall belong to us"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("It shall belong to us")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/belongtous.ogg', 80, 0, 10)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return

/mob/living/carbon/human/proc/tzeebehold()
	set name = "Behold the light of Tzeentch"
	set category = "Tzeentch"
	set desc = name
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		return
	if(src.quote_cd == 0)
		//src.say("Behold the light of Tzeentch")
		playsound(src, 'sound/effects/quotes/cults/tzeentch/behold.ogg', 80, 0, 12)
		src.quote_cd = 1
		sleep(50)
		src.quote_cd = 0
	else
		to_chat(src, "You cannot yell again so soon")
		return