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
	set name = "WAAAAGH! (100)"
	set desc = "Scream your lungs out to heal yourself, no one knows how it works but it does."
	var/cooldown = FALSE
	if(waaagh >= 100 && !cooldown)
		visible_message("<span class='notice'>The [src] starts healing rapidly in front of your eyes.</span>", "<span class='notice'>You heal rapidly.</span>")
		playsound(src, 'sound/voice/ork/orkscream.ogg', 50, 5)
		adjustBruteLoss(-50)
		adjustFireLoss(-50)
		adjustOxyLoss(-50)
		adjustToxLoss(-50)
		cooldown = TRUE
		spawn(50)
			cooldown = FALSE
		waaagh -= 100
	else
		to_chat(src, "<span class='notice'>YOU DON HAVE ENUF WAAAAAAAAGH!</span>")

//Mek Abilities

/mob/living/carbon/human/ork/proc/scavenge()
	set category = "Ork"
	set name = "Scavenge (150)"
	set desc = "Scavenge for scrap."
	if(waaagh >= 150)
		to_chat(src, "<span class='notice'> You start searching resources in your area. </span>")
		if(do_after(src, 30))
			new /obj/item/stack/material/scrap/fifty(loc)
			to_chat(src, "<span class='notice'> You found scrap! </span>")
			waaagh -= 150
			if(istype(src, /mob/living/carbon/human/ork/mek))
				playsound(src, 'sound/voice/ork/orknobscav.ogg', 50)
				return
			playsound(src, 'sound/voice/ork/gretpilo.ogg', 50)
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
