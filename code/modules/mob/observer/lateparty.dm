// Wel Ard's whacky late party system, look to admin verbs for tools that play around with this namely generate party and another party
//This is the current slightly improved version of the observer file variant, much mo flexible. It is a clown world system but it just works.
/mob/observer/ghost/verb/latepartynew()
	set category = "Ghost"
	set name = "Late Party"
	set desc= "Join a randomized late party picked from a list!"


	if(world.time < GLOB.partydelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		switch(GLOB.partydelay)
			if(18000)
				to_chat(src, "It is too early for a late party! This will open when round duration reaches 0:30!")
				return
			if(27000)
				to_chat(src, "It is too early for a late party! This will open when round duration reaches 0:45!")
				return
			if(48000)
				to_chat(src, "It is too early for a late party! This will open when round duration reaches 1:20!")
				return
			if(72000)
				to_chat(src, "It is too early for a late party! This will open when round duration reaches 2:00!")
				return
			if(432000)
				to_chat(src, "Sorry guy, parties cancelled!")
				return

	if(GLOB.deployed == 3) //checks if a party has already been sent, can make this value higher if you wish to send more than one!
		to_chat(src, "The late party has already deployed!")
		return

	if(src.isreadied == 0)
		src.isreadied = 1 //readies player up
		to_chat(src,"<span class='warning'><b><font size=3>You join the queue for the late party! [GLOB.daparty.len]/[GLOB.partysize] are ready!</b></font size=3>")
		GLOB.daparty[usr.key] = usr.key

		if(GLOB.daparty.len >= GLOB.partysize)
			GLOB.deployed++
			var/attendee
			for(attendee in GLOB.daparty)
				var/partyteam = input("Spawn as late party", "Randomly selected party!") as anything in GLOB.latepartyoptions //automagically puts them into whatever the pick proc chooses

				switch(partyteam)
					if("Kroot")
						message_admins("[attendee] has joined the late party: Kroot.", 0) //msgs jannies
						to_chat(usr, "<span class='warning'><b><font size=3>It's been a long flight, go to your Kroot tab and be sure to stretch!</b></font size=3>") //tells mob to do thing
						usr.loc = get_turf(locate("landmark*krootstart")) //where they spawning
						var/mob/living/carbon/human/kroot/new_character = new(usr.loc) // da mob
						new_character.key = attendee //puts ghost in body with new key
					if("Orkz")
						message_admins("[attendee] has joined the late party: Orkz.", 0) //msgs jannies
						to_chat(usr, "<span class='warning'><b><font size=3>It's been a long flight, go to your Ork tab and be sure to stretch!</b></font size=3>") //tells mob to do thing
						usr.loc = get_turf(locate("landmark*orkstart")) //where they spawning
						var/mob/living/carbon/human/ork/new_character = new(usr.loc) // da mob
						new_character.key = attendee //puts ghost in body with new key
					if("Tau")
						message_admins("[attendee] has joined the late party: Tau.", 0) //msgs jannies
						to_chat(usr, "<span class='warning'><b><font size=3>It has been a long flight but we have landed in Imperial space. Follow the Aun's orders. Assimilate this planet for the greater good! Check the Tau tab and remember your caste!</b></font size=3>") //tells mob to do thing
						usr.loc = get_turf(locate("landmark*taustart")) //where they spawning
						var/mob/living/carbon/human/tau/new_character = new(usr.loc)// da mob
						new_character.key = attendee //puts ghost in body with new key
					if("Sekites")
						message_admins("[attendee] has joined the late party: Sekites.", 0) //msgs jannies
						to_chat(usr, "<span class='warning'>You are veterans of the chaos warband known commonly referred to as the Sekites or Sons of Sek who serve the Immortal Anarch... Anakwanar Sek. Sent to Eipharius you have been tasked with undermining imperial rule and spreading fear throughout the planet. Find and co-ordinate with the local followers of the ruinous powers and plot an uprising to rival old Horus himself. Do not waste your lives, instead spend the lives of your followers whom you recruit from the planet.</b></font size=3>")
						usr.loc = get_turf(locate("landmark*bloodstart")) //where they spawning
						var/mob/living/carbon/human/Bloodpact/new_character = new(usr.loc)// da mob
						new_character.key = attendee //puts ghost in body with new key
					if("Genestealers")
						message_admins("[attendee] has joined the late party: Genestealer.", 0) //msgs jannies
						to_chat(usr, "<span class='warning'><b><font size=3>You are the point of the spear of the Great Devourer. Grow your following and undermine this planets defenses.</b></font size=3>") //tells mob to do thing
						usr.loc = get_turf(locate("landmark*genestart")) //where they spawning
						var/mob/living/carbon/human/genestealer/new_character = new(usr.loc)// da mob
						new_character.key = attendee //puts ghost in body with new key
			GLOB.daparty.Cut() //CLears our list after the loop completes
		else
			src.say("I'm joining the late party [GLOB.daparty.len]/[GLOB.partysize] are ready!")
			return

	else
		src.isreadied = 0
		to_chat(src,"<span class='warning'><b><font size=3>You leave the queue for the late party!</b></font size=3>")
		GLOB.daparty -= usr.key
		src.say("I'm leaving the party [GLOB.daparty.len]/[GLOB.partysize] are ready!")
		return





/hook/startup/proc/chooseparty() //chooses one party on startup
	Get_Party()
	return

/proc/Get_Party() //dis is the proc that actually selects the party
	GLOB.latepartyoptions += pick("Orkz", "Tau",)

	//note for myself, make procs to spawn as group if you ever wanna switch to that.
	//Something like the new_character key that uses an if isreadied to pull them all at once. You could make like beKroot() that contains everything under if("kroot")
