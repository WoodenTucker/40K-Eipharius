
////////////////////////////////////////
////////////////Altar/rune making//////
//////////////////////////////////////
/mob/living/carbon/human/proc/nurglerune()
	set category = "Ruinous Powers"
	set name = "Nurgle Rune"
	set desc = "In the embrace of great Nurgle, I am no longer afraid."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You can't draw a rune while restrained.")	//user is tied up
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	isdrawing = 1
	if(decay >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/nurgle(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		isdrawing = 0
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return




/mob/living/carbon/human/proc/slaaneshrune()
	set category = "Ruinous Powers"
	set name = "Slaanesh Rune"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't draw runes when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You can't draw a rune while restrained.")	//user is tied up
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	isdrawing = 1
	if(lust >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/slaanesh(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		isdrawing = 0
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return

/mob/living/carbon/human/proc/khornerune()
	set category = "Ruinous Powers"
	set name = "Khorne Rune"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't draw a rune when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src,"You can't draw a rune while restrained.")	//user is tied up
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	isdrawing = 1

	if(rage >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/khorne(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		isdrawing = 0
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return

/mob/living/carbon/human/proc/tzeentchrune()
	set category = "Ruinous Powers"
	set name = "Tzeentch Rune"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(isdrawing)
		to_chat(src, "<span class='warning'>We are drawing a rune!</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src,"You can't draw a rune while restrained.")	//user is tied up
		return
	isdrawing = 1
	if(intrigue >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/tzeentch(get_turf(src))
		src.adjustBruteLoss(2)
		src.add_fingerprint(src)
		to_chat(src, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		isdrawing = 0
	else
		to_chat(src, "<span class='notice'>Your attempt to draw a rune fails...</span>")
		isdrawing = 0
		return

//////////////////icons above  mob showing cult/////////////

/mob/living/carbon/human/proc/AddInfectionImages() //yoinked and reworked for ayylmaos
	if (client)
		for (var/mob/living/carbon/human/cultist in SSmobs.mob_list)
			if(cultist.mind && cultist.mind.special_role == "Khorne Cultist" && rage >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "khorne")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Slaanesh Cultist" && lust >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "slaanesh")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Nurgle Cultist" && decay >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "nurgle")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Tzeentch Cultist" && intrigue >= 1) //rage check very important to not show everyone
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "tzeentch")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Mercenary") //unrelated to the above, its for merc hiring.
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "merc")
				client.images += I
			if(cultist.mind && cultist.mind.special_role == "Tyranid" && gsc >= 1) //genestealer cult/tyranid converts
				var/I = image('icons/mob/chaoshud.dmi', loc = cultist, icon_state = "genestealer")
				client.images += I
	return


/mob/living/carbon/human/Login() //so they can get it on login if they dc or somethin
	..()
	AddInfectionImages()
	return

