//Tyranid base class. Partially just to have a group of all tyranid aliens, but also to have a class that is easier to make new instances of.
//--DrakeMarshall

/mob/living/carbon/alien/humanoid/tyranid
	name = "tyranid"
	icon = 'icons/mob/tyranids.dmi'
	max_plasma = 3000
	storedPlasma = 20
	plasma_rate = 5
	var/brutearmor = 0
	var/firearmor = 0
	var/evol_stage = 0
	var/strong_buildings = 0

/mob/living/carbon/alien/humanoid/tyranid/New()
	..()
	create_reagents(1000)
	verbs.Remove(/mob/living/carbon/alien/humanoid/verb/whisp,/mob/living/carbon/alien/humanoid/verb/plant)
	name = text("[name] ([rand(1, 1000)])")
	real_name = name

/mob/living/carbon/alien/humanoid/tyranid/update_icons()
	update_hud()		//TODO: remove the need for this to be here
	if(stat == DEAD)
		icon_state = "sludge"
	else
		return

/mob/living/carbon/alien/humanoid/tyranid/adjustFireLoss(amount)
	if(amount > 0)
		if(src.firearmor) src << "\red Your scales protect you from some of the heat!"
		..(max(amount-firearmor, 0))
	else
		..(amount)
	return

/mob/living/carbon/alien/humanoid/tyranid/adjustBruteLoss(amount)
	if(amount > 0)
		if(src.brutearmor) src << "\red Your armoring softens the blow!"
		..(max(amount-brutearmor, 0))
	else
		..(amount)
	return

/mob/living/carbon/alien/humanoid/tyranid/verb/telepath(mob/M as mob in orange(30,src)) //Like whisper but free, and much farther range.
	set name = "Telepathy"
	set desc = "Project your mind to others."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	var/msg = sanitize(input("Message:", "Whisper") as text|null)
	if(msg)
		log_say("AlienTelepathy: [key_name(src)]->[M.key] : [msg]")
		M << "<span class='noticealien'><b><i>You hear a strange voice in your head... [msg]</i></b></span>"
		src << {"<span class='noticealien'>You said: "[msg]" to [M]</span>"}

/mob/living/carbon/alien/humanoid/tyranid/verb/illusion(mob/M as mob in orange(30,src)) //Like whisper but free, and much farther range.
	set name = "Project Self"
	set desc = "A more advanced form of telepathy. Send a vision of oneself to the target."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	var/msg = sanitize(input("Message:", "Project Mind") as text|null)
	if(msg)
		log_say("AlienVision: [key_name(src)]->[M.key] : [msg]")
		src << {"<span class='noticealien'>You send a vision saying: "[msg]" to [M]</span>"}
		project_mob(src,M,msg)

/mob/living/carbon/alien/humanoid/tyranid/verb/sendnote(mob/M as mob in oview(30,src)) //Like whisper but free, and much farther range.
	set name = "Project Note"
	set desc = "Send a vision of a piece of paper to a victim. Great way to send dramatic messages. Only the victim can see or interact with this hallucinated note."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	var/msg = sanitize(input("Message:", "Project Note") as text|null)
	if(msg)
		log_say("AlienNote: [key_name(src)]->[M.key] : [msg]")
		src << {"<span class='noticealien'>You send a note of: "[msg]" to [M]</span>"}
		project_note(M,msg)

/mob/living/carbon/alien/humanoid/tyranid/verb/reclaimer()
	set name = "Produce Biomass Pool (300)"
	set desc = "Creates a biomass pool you can use to evolve."
	set category = "Alien"

	if(powerc(300))
		adjustToxLoss(-300)
		src << "<span class='userdanger'>You form a biomass pool.</span>"
		new /obj/structure/alien/resin/reclaimer(get_turf(src))
	return

/mob/living/carbon/alien/humanoid/hunter/handle_regular_hud_updates()
	..()
	if (healths)
		if (stat != 2)
			switch(health)
				if(maxHealth to INFINITY)
					healths.icon_state = "health0"
				if(maxHealth-(maxHealth/5) to maxHealth)
					healths.icon_state = "health1"
				if(maxHealth-((maxHealth/5)*2) to maxHealth-(maxHealth/5))
					healths.icon_state = "health2"
				if(maxHealth-((maxHealth/5)*4) to (maxHealth-(maxHealth/5))*2)
					healths.icon_state = "health3"
				if(0 to (maxHealth-(maxHealth/5))*4)
					healths.icon_state = "health4"
				else
					healths.icon_state = "health5"
		else
			healths.icon_state = "health6"

/mob/living/carbon/alien/humanoid/tyranid/verb/resin2()
	set name = "Secrete Resin (15)"
	set desc = "Secrete tough malleable resin."
	set category = "Alien"

	if(powerc(15))
		var/choice = input("Choose what you wish to shape.","Resin building") as null|anything in list("resin door","resin wall","resin membrane","resin nest") //would do it through typesof but then the player choice would have the type path and we don't want the internal workings to be exposed ICly - Urist
		if(!choice || !powerc(15))	return
		if(locate(/obj/structure/alien/resin) in loc)
			src << "\red There is already a wall here!"
			return
		adjustToxLoss(-15)
		src << "<span class='userdanger'>You shape a [choice].</span>"
		for(var/mob/O in viewers(src, null))
			O.show_message(text("<span class='userdanger'>[src] vomits up a thick purple substance and begins to shape it!</span>"), 1)
		switch(choice)
			if("resin door")
				new /obj/structure/mineral_door/resin/tyranid(loc)
			if("resin wall")
				var/obj/structure/alien/resin/wall/tyranid/T = new /obj/structure/alien/resin/wall/tyranid(loc)
				if(src.strong_buildings)
					T.health += 300
					T.name = "strong wall"
			if("resin membrane")
				new /obj/structure/alien/resin/membrane/tyranid(loc)
			if("resin nest")
				new /obj/structure/stool/bed/nest/tyranid(loc)
	return

/mob/living/carbon/alien/humanoid/tyranid/proc/spikes()
	set name = "Build Spikes (80)"
	set desc = "Secrete spikes to defend the hive."
	set category = "Alien"

	if(powerc(80))
		if(locate(/obj/effect/resinspikes) in loc)
			src << "<span class='userdanger'>There are already spikes there!</span>"
			return
		adjustToxLoss(-80)
		src << "<span class='userdanger'>You shape spikes.</span>"
		for(var/mob/O in viewers(src, null))
			O.show_message(text("<span class='userdanger'>[src] vomits up a thick purple substance and begins to shape it!</span>"), 1)
		new /obj/effect/resinspikes(loc)
	return

/mob/living/carbon/alien/humanoid/tyranid/proc/mine()
	set name = "Spore Mine (750)"
	set desc = "Produce an explosive spore mine."
	set category = "Alien"

	if(powerc(750))
		adjustToxLoss(-750)
		src << "<span class='userdanger'>You produce a spore mine.</span>"
		for(var/mob/O in viewers(src, null))
			O.show_message(text("<span class='userdanger'>[src] produces a spore mine!</span>"), 1)
		new /obj/structure/alien/resin/spore(loc)
	return

/mob/living/carbon/alien/humanoid/tyranid/verb/plant2()
	set name = "Plant Weeds (5)"
	set desc = "Plants some alien weeds"
	set category = "Alien"

	if(locate(/obj/structure/alien/weeds/tyranid/node) in get_turf(src))
		src << "There's already a weed node here."
		return

	if(powerc(5,1))
		adjustToxLoss(-5)
		for(var/mob/O in viewers(src, null))
			O.show_message(text("<span class='alertalien'>[src] has planted some alien weeds!</span>"), 1)
		new /obj/structure/alien/weeds/tyranid/node(loc)
	return

/mob/living/carbon/alien/humanoid/tyranid/verb/rally_rippers()

	set name = "Rally Rippers (75)"
	set desc = "Rallies rippers to you."
	set category = "Alien"

	if(powerc(75))
		adjustToxLoss(-75)
		src << "You rally rippers to yourself."
		var/turf/T = get_turf(src)
		var/list/surrounding_turfs = block(locate(T.x - 1, T.y - 1, T.z), locate(T.x + 1, T.y + 1, T.z))
		if(!surrounding_turfs.len)
			return
		for(var/mob/living/simple_animal/hostile/alien/ripper/R in living_mob_list)
			if(isturf(R.loc) && get_dist(R, T) <= 100 && R.health > 0)
				R.LoseTarget()
				R.Goto(pick(surrounding_turfs), R.move_to_delay)
	return

/mob/living/carbon/alien/humanoid/tyranid/proc/regrowth()
	set name = "Regrowth (500)"
	set desc = "Rapidly heal from wounds with spare biomass."
	set category = "Alien"

	if(src.storedPlasma >= 500) //Can be done while unconscious
		adjustToxLoss(-500)
		spawn(0)
			for(var/i = 0, i<5,i++)
				adjustBruteLoss(-10)
				adjustOxyLoss(-10)
				adjustFireLoss(-10)
				sleep(10)
	return

/mob/living/carbon/alien/humanoid/tyranid/Stat()

	statpanel("Status")
	stat(null, "Intent: [a_intent]")
	stat(null, "Move Mode: [m_intent]")

	if (client.statpanel == "Status")
		stat(null, "Biomass Stored: [getPlasma()]/[max_plasma]")

	/*if(emergency_shuttle)
		if(emergency_shuttle.online && emergency_shuttle.location < 2)
			var/timeleft = emergency_shuttle.timeleft()
			if (timeleft)
				stat(null, "ETA-[(timeleft / 60) % 60]:[add_zero(num2text(timeleft % 60), 2)]")*/

/mob/living/carbon/alien/humanoid/tyranid/gib() //No more xenomorph bits flying out of explosions.
	new /obj/effect/gibspawner/generic(get_turf(src))
	qdel(src)
	return
