/*/mob/living/carbon/human/ork/proc/check_warboss()                            //this was made to check if there was a warboss in the game, it is used in the evolve() proc
	for(var/mob/living/carbon/human/ork/Q in GLOB.living_mob_list_)
		if(Q.species.name != "Ork Warboss")
			continue
		if(!Q.key || !Q.client || Q.stat)
			continue
		return 1
	return 0

//GENERAL ABILITIES

/mob/living/carbon/human/ork/proc/evolve()                                     //this proc is in WIP, it really gave me various headaches and shit so im going to comment it out so people can try and fix it
	set category = "Ork"
	set name = "Evolve (300)"
	set desc = "Evolve to wage WAAAAAGH TO YA ENEMIES EVEN HARDA!"
	var/oldbody = src
	if(istype(src, /mob/living/carbon/human/ork/nob) || istype(src, /mob/living/carbon/human/ork/mek))
		if(!check_warboss)
			var/mob/living/carbon/human/ork/boss/B = new /mob/living/carbon/human/ork/boss(loc)
			B.ckey = ckey
			del(oldbody)
		else
			to_chat(src, "<span class='notice'> Yer boss is still alive and fighting you cant evolve.</span>")
	else if(waaagh >= 300)
		var/evolvelist = input("Evolve.","Select yer evolution:") as null|anything in list("Nob", "Mek")
		switch(evolvelist)
			if("Nob")
				var/mob/living/carbon/human/ork/nob/N = new /mob/living/carbon/human/ork/nob(loc)
				N.ckey = ckey
				del(oldbody)
			if("Mek")
				var/mob/living/carbon/human/ork/mek/M = new /mob/living/carbon/human/ork/mek(loc)
				M.ckey = ckey
				del(oldbody)
	else
		to_chat(src, "<span class ='warning'>YE DON HAVE ENUF WAAAAAAAAAAAGH!</span>")*/

/mob/living/carbon/human/ork/proc/warscream()
	set category = "Ork"
	set name = "WAAAAGH! (1)"
	set desc = "WE AIN'T DONE FIGHTIN' YET!"
	var/cooldown = FALSE
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>Ya can't waaaagh when ya' dead ya' git!</span>",)
		return
	if(waaagh >= 1 && !cooldown)
		playsound(src, 'sound/voice/ork/orkscream.ogg', 50, 5)
		src.radiation = 0
		src.bodytemperature = T20C
		src.eye_blurry = 0
		src.ear_deaf = 0
		src.ear_damage = 0
		waaagh -= 1
	else
		to_chat(src, "<span class='notice'>YOU DON HAVE ENUF WAAAAAAAAGH!</span>")

//Mek Abilities

/mob/living/carbon/human/ork/proc/scavenge()
	set category = "Ork"
	set name = "Scavenge (60)"
	set desc = "Scavenge for scrap."
	if(waaagh >= 60)
		to_chat(src, "<span class='notice'> You search the area for scrap metal. </span>")
		if(do_after(src, 30))
			new /obj/item/stack/material/scrap/fifty(loc)
			to_chat(src, "<span class='notice'> You found scrap! </span>")
			waaagh -= 60 /*
			if(istype(src, /mob/living/carbon/human/ork/mek))
				playsound(src, 'sound/voice/ork/orknobscav.ogg', 50)
				return*/
			playsound(src, 'sound/voice/ork/gretpilo.ogg', 60)
		else
			to_chat(src, "<span class='notice'> You stop searching for resources. </span>")
	else
		to_chat(src, "<span class='notice'>YOU DON HAVE ENUF WAAAAAAAAGH!</span>")

//Warboss abilities

/mob/living/carbon/human/ork/proc/bozzscream()
	set category = "Ork"
	set name = "WAAAAAAAAAAAAAAAAAAAAAAAAAAAAGH!!! (300)"
	set desc = "THIS IS THE OFFICIAL SCREAM TO WAGE WAAAAAAGH AGAINST YOUR FOES!!!!!!!!!"
	var/cooldown = FALSE
	if(waaagh >= 300 && !cooldown)
		visible_message("<span class='warning'> [src] screams loudly! Inspiring other orks and making them slightly better in combat.</span>", "<span class='notice'>You scream to inspire nearby orks and scare your enemies.</span>")
		playsound(src, 'sound/voice/ork/orkscream.ogg', 100, 5)
		for(var/mob/living/carbon/human/ork/O in oview(7))
			if(!O.stat)
				playsound(O, 'sound/voice/ork/orkscream.ogg', 50, 5)
			O.inspired = TRUE
			spawn(150)
				O.inspired = FALSE
			cooldown = TRUE
			spawn(1200)
				cooldown = FALSE
			waaagh -= 300
	else
		to_chat(src, "<span class='notice'>YOU DON HAVE ENUF WAAAAAAAAGH!</span>")

/mob/living/carbon/human/ork/proc/giveorkzstats()
	set name = "Git ready ta' krump!"
	set category = "Ork"
	set desc = "Gives Orkz stats since I can't seem to do it any other way in this clown world."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] flexs der' muscles afa' a long nap, feelin' der' strength an' skill return to 'em.")
	src.add_stats(rand(22,23),rand(21,23),rand(10,15),rand(14,16)) //gives stats str, end, int, dex
	src.add_skills(rand(10,10),rand(6,10),rand(0,3),0,0) //skills such as melee, ranged, med, eng and surg
	src.adjustStaminaLoss(-INFINITY)
	src.update_eyes() //should fix grey vision
	src.warfare_language_shit(ORKZ) //secondary language
	client?.color = null
	src.verbs -= /mob/living/carbon/human/ork/proc/giveorkzstats //removes verb at the end so they can't spam it for whatever reason

	var/obj/item/card/id/dog_tag/ork/W = new

	W.icon_state = "tagred"
	W.assignment = "Orky Boy"
	W.registered_name = real_name
	W.update_label()
	equip_to_slot_or_del(W, slot_wear_id)
