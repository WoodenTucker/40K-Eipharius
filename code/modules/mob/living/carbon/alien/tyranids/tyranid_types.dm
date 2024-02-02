//All Tyranid subtypes
//Might be interesting to reduce evolution times but give castes some small progression of powers based on fulfilling certain tasks.
//For example making it easier to evolve into a lictor but having them start out with no verbs, and making them have to gain them from devouring a mind or some such.
//Would need to include a way to discourage mass murder though.

//TODO: Test the new verbs given to hormagaunts, genestealer grabs, and lictor piercing attack.

/*
Tyranid progression ideas
-------------------------
Additional thoughts:
consider manipulating the density variable for adrenal gland powers. Or maybe a cheaper dodge verb that gives you 0.3 seconds no density so a poorly aimed projectile does not land if you press the hotkey at the right time.
High price way to take out single opponent
Toxin that only effects people on weeds
metabolic spores
consider migrating resin spikes and other rudimentary fortifactions
zoanthrope- good against strong infantry like marines and orks
	starts with telekinesis
	progression towards psychologically demoralizing powers
		mindflayer shot (pyshically projects a mindflayer bolt)
		berserk enemy (adds about 3u berserk serum into a target)
		waaaagh inhibitor (passive effect that depletes nearby ork's waaaagh)
		psychic wall (previously exists)
		psyker throw (previously exists)
venomthrope- effective at defense
	starts with toxic gas
	progression towards stronger defender and hive builder
		corrosive acid (like regular alien acid)
		toxic sting (already exists)
		venom sacs (adds toxin to smoke so that it regenerates tyranid biomass, speeds up biomass production rate)
		strong building (double health biomass walls)
		regrowth (high cost, highly effective healing)
		venom cannon (fires a dart that creates venomthrope smoke on impact)
ravener- anti-armor
	starts with eat and stab
	progression towards high power tactical unit
		throw (already exists)
		rending claws (melee weapon that can force open doors and does bonus damage on mecha)
		fireproofed scales or toughened carapace
			fireproofed scales (extra resistance to fire damage)
			toughened carapace (extra resistance to brute damage)
		regrowth (high cost, highly effective healing)
lictor- scout, hunter
	starts with devour mind
	progression towards effective scout and hunter
		hide (already exists)
		night eye (see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING)
		lingual processing (understands human speech)
		speed boost or toughened carapace
			speed boost (makes lictors move faster)
			toughened carapace (a weaker version of ravener's armoring)
		adrenal glands (spurt of ignoring crit and dodging projectiles, expensive)
		regrowth (high cost, highly effective healing)
genestealer- subjugation, infiltration
	starts with convert (which takes a bit of time to take effect so you may need to hold the person hostage for a bit)
	progression towards being able to subjugate outpost
		range of convert increases from having to be standing over them to being able to jab them standing next to them
		night eye (see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING)
		fireproofed scales or toughened carapace
			fireproofed scales (extra resistance to fire damage)
			toughened carapace (extra resistance to brute damage)
		scything talons (a verb that does three weak AOE attacks in succession)
		adrenal glands (a slightly different one that what lictors have, ignores crit, dramatically increases movement speed, heals injuries faster)
warrior- ranged combat
	starts with spit neurotoxin (already exists)
	progression towards decent ranged combat
		night eye (see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING)
		devourer (spawns a tiny ripper on impact)
		death spitter (injects hydrochloric acid on impact)
		toughened carapace (extra resistance to brute damage)
hormagaunt- melee combat
	starts with eat
	progression towards evolution
		harvest efficiency (increases rate of biomass)
		scything talons (three weak AOE attacks in succession)
		speed boost
*/

/*
Zoanthropes
*/
/mob/living/carbon/alien/humanoid/tyranid/zoanthropes //Psychic alien with some spells, TK, and a psychic power to keep someone in one place.
	icon = 'icons/mob/tyranidsmedium.dmi'
	name = "zoanthropes"
	icon_state = "zoanthropes"
	maxHealth = 250
	health = 250
	layer = 5
	ventcrawler = 0
	var/inhibitor = 0

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/New()
	..()
	mutations.Add(TK)
	update_mutations()
	spawn(50)
		if(src.mind)
			src.mind.spell_list += new /obj/effect/proc_holder/spell/targeted/smoke(null)
			src.mind.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/knock(null)

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/ClickOn(var/atom/A, params)

	var/list/modifiers = params2list(params)
	if(modifiers["shift"])
		if(evol_stage >= 1)
			mindflayershot(A)
		return
	..()

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/berserk(var/mob/living/carbon/T in oview(7))
	set name = "Telepathic Berserk (300)"
	set desc = "Uses your psychic abilities to momentarily whip a lesser mind into a mindless fury."
	set category = "Alien"
	if(powerc(300))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we overwhelm?") as null|anything in victims
		if(T)
			if(!istype(T))
				src << "\red We only attack people!"
				return
			src << "We telepathically bombard [T]"
			visible_message("\red <B>[src]'s eyes glow red!</B>")
			T.reagents.add_reagent("berserk", 3)
			adjustToxLoss(-300)
		else
			src << "\blue You cannot attack nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/imprison(var/mob/living/carbon/T in oview(7))
	set name = "Imprison (300)"
	set desc = "Uses your psychic abilities to imprison someone in their own mental barriers."
	set category = "Alien"
	if(powerc(300))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we imprison?") as null|anything in victims
		if(T)
			if(!istype(T))
				src << "\red We only imprison people!"
				return
			src << "We psychically imprison [T]"
			visible_message("\red <B>[src]'s eyes glow green!</B>")
			for(var/turf/W in orange(10,T)) //Their entire view so they can't see outside the walls around them.
				if(get_dist(T,W) > 2)
					var/obj/effect/turf_projection/prison = project_turf(T,W) //Makes a ring of hallucinated walls around you.
					prison.lifetime = 600
			adjustToxLoss(-300)
		else
			src << "\blue You cannot imprison nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/psythrow()
	set name = "Psyker Throw (500)"
	set desc = "Send everyone nearby flying."
	set category = "Alien"
	if(powerc(500))
		src << "We send out pschic shock waves."
		visible_message("\red <B>[src]'s eyes glow red!</B>")
		visible_message("\red <B>A deafening mental shreik emanates from [src]!</B>")
		playsound(src.loc, 'sound/hallucinations/wail.ogg', 50, 1, -3)
		for(var/mob/living/carbon/human/T in oview(pick(4,5)))
			T.take_organ_damage(rand(5,20), rand(5,20))
			T.Weaken(6)
			if(prob(65))
				T.Paralyse(3)
				T << "\red You pass out!"
			var/atom/target = get_edge_target_turf(T, get_dir(src, get_step_away(T, src)))
			T.throw_at(target, 200, 4)
			shake_camera(T, 20, 1)
		adjustToxLoss(-500)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/mindflayershot(var/atom/T)
	set name = "Mindflayer Ray (100)"
	set desc = "Psychically project a mindflayer bolt."
	set category = "Alien"

	if(powerc(100))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we shoot?") as null|anything in victims
		if(T)
			src.visible_message("<span class='danger'>[src] projects psychic energy!", "<span class='alertalien'>You project psychic energy.</span>")
			var/turf/curloc = src.loc
			var/atom/targloc
			if(!istype(T, /turf/))
				targloc = get_turf(T)
			else
				targloc = T
			if (!targloc || !istype(targloc, /turf) || !curloc)
				return
			if (targloc == curloc)
				return
			var/obj/item/projectile/beam/mindflayer/A = new /obj/item/projectile/beam/mindflayer(src.loc)
			A.current = curloc
			A.yo = targloc.y - curloc.y
			A.xo = targloc.x - curloc.x
			adjustToxLoss(-100)
			A.process()
		else
			src << "\blue You cannot shoot at nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/verb/haunt(var/mob/living/carbon/T in oview(7))
	set name = "Haunt"
	set desc = "Projects disturbing sounds to the victim."
	set category = "Alien"

	if(!T)
		var/list/victims = list()
		for(var/mob/living/carbon/human/C in oview(7))
			victims += C
		T = input(src, "Who should we haunt?") as null|anything in victims
	if(T)
		if(!istype(T))
			src << "\red We only haunt people!"
			return
		src << "We haunt [T]"
		playsound(T.loc, pick('sound/hallucinations/behind_you1.ogg',\
			'sound/hallucinations/behind_you2.ogg',\
			'sound/hallucinations/i_see_you1.ogg',\
			'sound/hallucinations/i_see_you2.ogg',\
			'sound/hallucinations/im_here1.ogg',\
			'sound/hallucinations/im_here2.ogg',\
			'sound/hallucinations/look_up1.ogg',\
			'sound/hallucinations/look_up2.ogg',\
			'sound/hallucinations/over_here1.ogg',\
			'sound/hallucinations/over_here2.ogg',\
			'sound/hallucinations/over_here3.ogg',\
			'sound/hallucinations/turn_around1.ogg',\
			'sound/hallucinations/turn_around2.ogg',\
			), 50, 1, -3)
	else
		src << "\blue You cannot haunt nothing!"

/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/verb/evolution()
	set name = "Evolution (1000)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage == 5)
		src << "\red You are already fully developed."
		return
	if(powerc(1000))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/mindflayershot)
				src << "<b>You can project mindflayer shots! Press shift+click to fire.</b>"
			if(2)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/berserk)
				src << "\red You can psychically overwhelm opponents and drive them into a berserk rage."
			if(3)
				src.inhibitor = 1
				src << "<b>Your psychic presence now inhibits nearby WAAGH.</b>"
			if(4)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/imprison)
				src << "\red You can surround opponents in psychic walls."
			if(5)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/zoanthropes/proc/psythrow)
				src << "\red You can throw people telekinetically."
		adjustToxLoss(-1000)
	else
		src << "\red You need more biomass."

/*
Warriors
*/


/mob/living/carbon/alien/humanoid/tyranid/warrior
	name = "warrior"
	icon_state = "warrior"
	maxHealth = 225
	health = 225
	plasma_rate = 10
	ventcrawler = 0
	var/projectiletype = /obj/item/projectile/bullet/neurotoxin
	var/list/unlocked = list("Neurotoxin Glands")

/mob/living/carbon/alien/humanoid/tyranid/warrior/adjustBruteLoss(amount)
	amount *= 2
	..(amount)
	return

/mob/living/carbon/alien/humanoid/tyranid/warrior/New()
	..()
	src << "\red You can shoot neurotoxin! Use shift+click to quickly aim and shoot."

/mob/living/carbon/alien/humanoid/tyranid/warrior/verb/chooseproj()
	set name = "Select Biomorph"
	set desc = "Select a biological gun to shoot the enemy."
	set category = "Alien"

	var/shot = input(src, "Select a biomorph") as null|anything in src.unlocked

	switch(shot)
		if("Neurotoxin Glands")
			src.projectiletype = /obj/item/projectile/bullet/neurotoxin
		if("Devourer")
			src.projectiletype = /obj/item/projectile/bullet/devourer
		if("Death Spitter")
			src.projectiletype = /obj/item/projectile/bullet/dart/acid

/mob/living/carbon/alien/humanoid/tyranid/warrior/verb/neurotoxinshot(var/atom/T) //Significantly improved version of the old neurotoxin proc. This one actually aims and has a shift+click hotkey.
	set name = "Shoot (75)"
	set desc = "Use your selected biomorph to shoot the enemy."
	set category = "Alien"

	if(powerc(75))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we shoot?") as null|anything in victims
		if(T)
			src.visible_message("<span class='danger'>[src] fires a biomorph weapon!", "<span class='alertalien'>You fire your selected biomorph.</span>")
			var/turf/curloc = src.loc
			var/atom/targloc
			if(!istype(T, /turf/))
				targloc = get_turf(T)
			else
				targloc = T
			if (!targloc || !istype(targloc, /turf) || !curloc)
				return
			if (targloc == curloc)
				return
			var/obj/item/projectile/A = new projectiletype(src.loc)
			A.current = curloc
			A.yo = targloc.y - curloc.y
			A.xo = targloc.x - curloc.x
			adjustToxLoss(-75)
			A.process()
		else
			src << "\blue You cannot shoot at nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/warrior/ClickOn(var/atom/A, params)

	var/list/modifiers = params2list(params)
	if(modifiers["shift"])
		neurotoxinshot(A)
		return
	..()

/mob/living/carbon/alien/humanoid/tyranid/warrior/verb/evolution()
	set name = "Evolution (400)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage >= 4)
		src << "\red You are already fully developed."
		return
	if(powerc(400))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
				src << "<b>Your senses adapt to the dark!</b>"
			if(2)
				src.unlocked.Add("Devourer")
				src << "<b>You have grown a devourer biomorph!</b>"
			if(3)
				src.unlocked.Add("Death Spitter")
				src << "<b>You have grown a death spitter biomorph!</b>"
			if(4)
				src.firearmor += 5
				src << "<b>You grow fireproofed scales!</b>"
		adjustToxLoss(-400)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/warrior/Life()
	..()
	if(evol_stage >= 1)
		src.see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING

/*
Ravener
*/

/mob/living/carbon/alien/humanoid/tyranid/ravener
	icon = 'icons/mob/tyranidslarge.dmi'
	name = "ravener"
	icon_state = "ravener"
	maxHealth = 360
	health = 360
	layer = 5
	ventcrawler = 0
	status_flags = 0
	brutearmor = 1
	var/rending_claws = 0

/mob/living/carbon/alien/humanoid/tyranid/ravener/adjustFireLoss(amount)
	src.adjustToxLoss(-amount*4)
	..(amount)
	return

/*
/mob/living/carbon/alien/humanoid/tyranid/ravener/movement_delay()
	. = -1
	. += ..()
*/

/obj/structure/tunnel //Raveners can dig holes anywhere.
	name = "tunnel"
	desc = "A tunnel in the snow."
	icon = 'icons/mob/tyranidslarge.dmi'
	icon_state = "tunnel"
	density = 1
	opacity = 1
	anchored = 1
	var/obj/structure/tunnel/linked = null

/obj/structure/tunnel/attack_alien(mob/user)
	if(islarva(user))
		return
	if(istype(user,/mob/living/carbon/alien/humanoid/tyranid))
		var/mob/living/carbon/alien/humanoid/tyranid/T = user
		if(linked)
			T.loc = get_turf(linked)
		else
			T << "\red This tunnel seems to have collapsed."

/obj/structure/tunnel/attack_larva(mob/user)
	if(!islarva(user)) return
	if(linked)
		user.loc = get_turf(linked)
	else
		user << "\red This tunnel seems to have collapsed."

/mob/living/carbon/alien/humanoid/tyranid/ravener/verb/tunnel()  //Sort of a bizarre mix of spawning a tunnel and a wizard's teleport. -Drake Marshall
	set name = "Tunnel (20)"
	set desc = "Create a tunnel to quickly move tyranids around."
	set category = "Alien"
	var/turf/current_location = get_turf(usr)
	if(powerc(20))
		for(var/turf/simulated/wall/W in range(1,src))
			src << "\red You cannot dig through walls!"
			return
		if(current_location.z==2)
			src << "\red Oh crap that is space!"
			usr.loc = get_turf(locate("landmark*ravenorfucked"))
			return
		var/A = null
		A = input("Area to dig to", "Dig", A) in teleportlocs
		if(!A)
			return
		var/area/area = teleportlocs[A]
		var/list/L = list()
		for(var/turf/T in get_area_turfs(area))
			if(!T.density)
				var/clear = 1
				for(var/obj/O in T)
					if(O.density)
						clear = 0
						break
				if(clear)
					L+=T
		if(!L.len)
			usr <<"This area is completely obstructed!"
			return
		for(var/turf/simulated/floor/T in range(2,src))
			T.ChangeTurf(/turf/unsimulated/floor/snow) //If this is the wrong path, it will need changing.
		var/obj/structure/tunnel/tunnel1 = new /obj/structure/tunnel(get_turf(src))
		var/list/tempL = L
		var/attempt = null
		var/success = 0
		while(tempL.len)
			attempt = pick(tempL)
			success = src.Move(attempt)
			if(!success)
				tempL.Remove(attempt)
			else
				break
		if(!success)
			src.loc = pick(L)
		for(var/turf/simulated/wall/W in range(1,src))
			W.ChangeTurf(/turf/unsimulated/floor/snow)
		for(var/turf/simulated/floor/T in range(2,src))
			T.ChangeTurf(/turf/unsimulated/floor/snow) //If this is the wrong path, it will need changing.
		var/obj/structure/tunnel/tunnel2 = new /obj/structure/tunnel(get_turf(src))
		tunnel1.linked = tunnel2
		tunnel2.linked = tunnel1
		var/datum/effect/effect/system/harmless_smoke_spread/smoke = new /datum/effect/effect/system/harmless_smoke_spread
		smoke.attach(src)
		smoke.set_up(10, 0, src.loc)
		spawn(0)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()
			sleep(10)
			smoke.start()
		adjustToxLoss(-50)
	else
		src << "\red You need more biomass!"

/mob/living/carbon/alien/humanoid/tyranid/ravener/proc/grabthrow(var/mob/living/carbon/T in oview(1))
	set name = "Throw (200)"
	set desc = "Lash out with lightning speed to throw enemies back."
	set category = "Alien"
	if(powerc(200))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(1))
				victims += C
			//T = input(src, "Who should we throw?") as null|anything in victims
			T = pick(victims)
		if(T)
			if(!istype(T))
				src << "\red We only throw people!"
				return
			src << "We strike [T]."
			visible_message("\red <B>[src] whips its tail around, striking [T] and sending them flying!</B>")
			T.take_organ_damage(15, 0)
			T.Weaken(6)
			if(prob(65))
				T.Paralyse(3)
				T << "\red You pass out!"
			var/atom/target = get_edge_target_turf(T, get_dir(src, get_step_away(T, src)))
			T.throw_at(target, 200, 4)
			shake_camera(T, 20, 1)
			adjustToxLoss(-200)
		else
			src << "\blue You cannot throw nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/ravener/verb/autohit(var/mob/living/carbon/T in oview(1))
	set name = "Stab (350)"
	set desc = "Lash out with lightning speed to pierce enemy armor."
	set category = "Alien"
	if(powerc(350))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(1))
				victims += C
			//T = input(src, "Who should we hit?") as null|anything in victims
			T = pick(victims)
		if(T)
			if(!istype(T))
				src << "\red We only hit people!"
				return
			src << "We strike [T]."
			visible_message("\red <B>[src] lunges forward, impaling [T]!</B>")
			T.take_organ_damage(25, 0) //ignores armor
			new /obj/effect/gibspawner/blood(T.loc)
			T.Weaken(1)
			adjustToxLoss(-350)
		else
			src << "\blue You cannot stab nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/ravener/verb/eat(var/mob/living/carbon/T in oview(1))
	set name = "Devour"
	set desc = "Use your claws and jaws to tear apart a human corpse and claim its biomass."
	set category = "Alien"
	if(!T)
		var/list/victims = list()
		for(var/mob/living/carbon/human/C in oview(1))
			victims += C
		T = input(src, "Who should we devour?") as null|anything in victims
	if(T)
		if(!istype(T))
			src << "\red We only devour people!"
			return
		if(T.stat != DEAD)
			src << "\red We can only devour the dead! Kill them before eating!"
			return
		src << "We tear [T] to pieces and feast on the remains."
		visible_message("\red <B>The [src] tears [T] apart in a flurry of blood and slashing claws and gorges itself on the butchered remains!</B>")
		T.gib()
		adjustToxLoss(500)   //Lots of biomass here.
		adjustBruteLoss(-50) //This also heals you a bit if you happen to be badly injured.
		adjustFireLoss(-50)
		adjustOxyLoss(-50)
	else
		src << "\blue You cannot devour nothing!"

/mob/living/carbon/alien/humanoid/tyranid/ravener/verb/evolution() //High progression cost because raveners have a source of biomass, a short progression path, and significant buffs in this.
	set name = "Evolution (1000)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage >= 4)
		src << "\red You are already fully developed."
		return
	if(powerc(1000))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/ravener/proc/grabthrow)
				src << "\red You can throw opponents."
			if(2)
				src.rending_claws = 1
				src << "<b>You develop rending claws! Your claws are now able to force airlocks open, and completely ignore armor.</b>"
			if(3)
				var/choice = alert(src, "Enter an option.",,"Toughened Carapace","Fireproofed Scales")
				switch(choice)
					if("Toughened Carapace")
						src.brutearmor += 2
						src << "\red Your carapace hardens."
					if("Fireproofed Scales")
						src.firearmor += 2
						src << "\red Your scales shield against heat."
			if(4)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/regrowth)
				src << "\red You gain the ability to regenerate off spare biomass."
		adjustToxLoss(-1000)
	else
		src << "\red You need more biomass."

/*
Lictor
*/


/mob/living/carbon/alien/humanoid/tyranid/lictor //Stealthy. Like all 'nids, also telepathic. Finally, they devour people's brains.
	name = "lictor"
	icon_state = "lictor"
	maxHealth = 325
	health = 325
	var/speed_bonus = 1
	var/lingual = 0
	var/piercing = 0

/mob/living/carbon/alien/humanoid/tyranid/lictor/adjustFireLoss(amount)
	src.adjustToxLoss(-amount*2)
	..(amount)
	return

/mob/living/carbon/alien/humanoid/tyranid/lictor/leader //For the RTD leadership
	name = "lictor"
	icon_state = "lictor"
	maxHealth = 325
	health = 325

/mob/living/carbon/alien/humanoid/tyranid/lictor/movement_delay()
	. = -speed_bonus
	. += ..()

/mob/living/carbon/alien/humanoid/tyranid/lictor/say_understands(var/other)
	if (istype(other, /mob/living/carbon/alien))
		return 1
	if(src.lingual) return 1
	..()

/mob/living/carbon/alien/humanoid/tyranid/lictor/proc/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath certain items. Toggled on or off."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	if (layer != TURF_LAYER+0.2)
		layer = TURF_LAYER+0.2
		src << text("<span class='noticealien'>You are now hiding.</span>")
		for(var/mob/O in oviewers(src, null))
			if ((O.client && !( O.blinded )))
				O << text("<span class='name'>[] dives to the floor!</span>", src)
	else
		layer = MOB_LAYER
		src << text("<span class='noticealien'>You have stopped hiding.</span>")
		for(var/mob/O in oviewers(src, null))
			if ((O.client && !( O.blinded )))
				O << text("[] stands up from the ground...", src)

/mob/living/carbon/alien/humanoid/tyranid/lictor/proc/adrenalineglands()
	set name = "Adrenal Glands (500)"
	set desc = "Use your adrenal glands to stimulate reflexes to insane levels and negate all knockouts."
	set category = "Alien"
	if(dodging)
		src << "\red They are already active."
		return
	if(src.storedPlasma >= 500)
		adjustToxLoss(-500)
		dodging = 1
		status_flags = 0
		speed_bonus += 1
		src << "\red Adrenaline active."
		spawn(90)
			src << "\red Adrenaline no longer active."
			dodging = 0
			status_flags = CANPARALYSE|CANPUSH
			speed_bonus -= 1
		return
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/lictor/verb/eatbrain(var/mob/living/carbon/human/T in view(1))
	set name = "Devour Mind"
	set desc = "Feast upon the brain of a dead or incapacitated person, taking their memories and neural tissue for yourself. This process is naturally extremely painful and lethal to the living."
	set category = "Alien"
	if(!T)
		var/list/victims = list()
		for(var/mob/living/carbon/human/C in oview(1))
			victims += C
		T = input(src, "Which mind should we devour?") as null|anything in victims
	if(T)
		if(!istype(T))
			src << "\red We only devour human minds!"
			return
		var/obj/item/organ/brain/B = T.getorgan(/obj/item/organ/brain)
		if(!B)
			src << "\red They have no brain to eat!"
			return
		src << "We begin to bury our tentacles into [T]'s skull..."
		visible_message("\red <B>[src] buries it's tentacles in [T]'s face!</B>")
		T << "\red You feel incredible pain as tiny tentacles burrow into your skull and eye sockets!"
		T.emote("scream")
		for(var/stage = 1, stage<=8, stage++)
			sleep(30)
			if(get_dist(get_turf(src),get_turf(T)) > 1)
				visible_message("\red <B>The [src]'s tentacles are torn out of [T]'s skull!</B>")
				src << "\red Our feeding is interrupted."
				adjustToxLoss(stage*10) //You still ate some of the brain.
				T.adjustBrainLoss(stage*25) //Which should really damage your brain.
				award(T, "I WANNA PET TEH monkeyS!!1!1")
				return
			T << pick("\red The [src]'s tentacles probe agonizingly deeper into your brain!","\red You feel the [src] feeding on your brain!", "\red You feel an agonizing pain in your skull!", "\red You feel horribly faint!", "\red The [src]'s spiked tentacles dig like lances in your head!", "\red You feel an intense pain in your skull.", "\red YOUR HEAD", "\red You feel like rusty shivs are being twisted into your skull!", "\red You feel your consciousness slipping away as your portions of your brain are devoured...")
		T << "\red The [src] has devoured your brain."
		src << "\red You have devoured [T]'s brain!"
		if(T.mind)
			T.mind.show_memory(src, 0) //Yay for lictors. Wish I could show the last few conversations they had too but there is absolutely no good way to do this since conversation goes directly to the output of the client.
			if(!src.lingual)
				src << "<b>You have learned this creature's language!</b>"
				src.lingual = 1
		T.death(0)
		T.Drain()
		B.loc = get_turf(T)
		if(T.key)
			B.transfer_identity(T)
		T.internal_organs -= B
		B.loc = src
		src.stomach_contents.Add(B)
		if(B.brainmob)
			B.brainmob << "\red Your brain is quickly being digested in the [src]'s stomach. You feel faint."
		spawn(300)
			if(B.loc == src)
				award(B, "Burp.")
				src.emote("burp")
				if(B.brainmob)
					B.brainmob << "\red Your brain is digested in the [src]'s stomach."
				qdel(B)
		adjustToxLoss(500) //Brains are quite high quality biomass.
		adjustBruteLoss(-50) //This also heals you a bit if you happen to be badly injured.
		adjustFireLoss(-50)
		adjustOxyLoss(-50)
	else
		src << "\blue You cannot devour nothing!"

/mob/living/carbon/alien/humanoid/tyranid/lictor/verb/evolution()
	set name = "Evolution (800)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage >= 7)
		src << "\red You are already fully developed."
		return
	if(powerc(800))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/lictor/proc/hide)
				src << "\red You are better at hiding."
			if(2)
				src.see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
				src << "<b>Your senses adapt to the dark!</b>"
			if(3)
				var/choice = alert(src, "Enter an option.",,"Toughened Carapace","Enhanced Speed")
				switch(choice)
					if("Toughened Carapace")
						src.brutearmor += 7
						src << "\red Your carapace hardens."
					if("Enhanced Speed")
						src.speed_bonus = 2
						src << "\red You feel faster."
			if(4)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/regrowth)
				src << "\red You gain the ability to regenerate off spare biomass."
				src << "\red Your grab ability is enhanced."
			if(5)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/lictor/proc/adrenalineglands)
				src << "\red You grow lictor adrenaline glands."
			if(6)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/lictor/proc/pierce)
				src << "\red You adapt a piercing ability. This will temporarily raise attack power, and can be used against particularly strong enemies."
			if(7)
				src.plasma_rate = 10
				src << "\red Your harvest rate increases."
		adjustToxLoss(-800)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/lictor/Life()
	..()
	if(evol_stage >= 2)
		src.see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING

/mob/living/carbon/alien/humanoid/tyranid/lictor/proc/pierce()
	set name = "Piercing Attacks (2500)"
	set desc = "Temporarily increase attack power to pierce heavily armored opponents."
	set category = "Alien"
	if(piercing)
		src << "\red Attacks are already piercing."
		return
	if(powerc(2500))
		piercing = 1
		src << "\red Attacks will pierce enemies."
		spawn(250)
			src << "\red Attacks are no longer piercing."
			piercing = 0
		adjustToxLoss(-2500)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/proc/duck() //I have not put this in, but I would like to test this out sometime.
	set name = "Dodge (50)"                             //Genestealers, lictors, and hormagaunts could all use this.
	set desc = "Hit the ground for a small fraction of a second. If you time it perfectly, this can save you from a projectile."
	set category = "Alien"
	if(powerc(50))
		src.density = 0
		spawn(3) src.density = 1
		adjustToxLoss(-50)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/proc/grant_duck() //This way I can call it in runtime without actually implementing it anywhere, just to see how it works.
	src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/duck)

/*
Larva
*/

/mob/living/carbon/alien/larva/tyranid //Larva that grows into hormagaunt. -Marshall
	name = "alien larva"
	real_name = "alien larva"
	var/isempty = 0

/mob/living/carbon/alien/larva/tyranid/evolve()
	set name = "Evolve"
	set desc = "Evolve into a fully grown Tyranid."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	if(handcuffed || legcuffed)
		src << "<span class='danger'>You cannot evolve when you are cuffed.</span>"

	if(amount_grown >= max_grown)
		var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/hormagaunt(loc)
		if(mind)	mind.transfer_to(new_xeno)
		qdel(src)
		return
	else
		src << "<span class='danger'>You are not fully grown.</span>"
		return

/mob/living/carbon/alien/larva/tyranid/New()
	..()
	spawn(100) //Give ten seconds for the actual whitelisted tyranid to take control.
		if(!src.ckey)
			isempty = 1 //Then the larva can be possessed by any ghost.
			request_player()

/mob/living/carbon/alien/larva/tyranid/proc/request_player()
	for(var/mob/dead/observer/O in player_list)
		if(jobban_isbanned(O, "Syndicate"))
			continue
		if(O.client)
			if(O.client.prefs.be_special & BE_ALIEN)
				question(O.client)

/mob/living/carbon/alien/larva/tyranid/proc/question(var/client/C)
	spawn(0)
		if(!C)	return
		var/response = alert(C, "A tyranid larva has been produced. Do you wish to be considered to be a tyranid?", "Tyranid Larva request", "My life for the hive!", "Nope.", "Never for this round.")
		if(!C || ckey)
			return
		if(response == "My life for the hive!")
			transfer_personality(C)
		else if (response == "Never for this round.")
			C.prefs.be_special ^= BE_ALIEN

/mob/living/carbon/alien/larva/tyranid/proc/transfer_personality(var/client/candidate)

	if(!candidate)
		return

	isempty = 0
	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "tyranid"

/*
Hormagaunt
*/

/mob/living/carbon/alien/humanoid/tyranid/hormagaunt //A lot easier since I made the tyranid base class do a lot of things automatically.
	name = "hormagaunt"
	icon_state = "hormagaunt"
	maxHealth =150
	health = 150
	plasma_rate = 20
	var/speedmod = 1

/mob/living/carbon/alien/humanoid/tyranid/hormagaunt/movement_delay()
	. = -speedmod
	. += ..()

/mob/living/carbon/alien/humanoid/tyranid/hormagaunt/adjustFireLoss(amount)
	amount *= 2
	..(amount)
	return

/mob/living/carbon/alien/humanoid/tyranid/hormagaunt/proc/talons()
	set name = "Scything Talons (50)"
	set desc = "Lash out in rapid succession at everyone nearby."
	set category = "Alien"
	if(powerc(50))
		playsound(loc, 'sound/weapons/slice.ogg', 25, 1, -1)
		for(var/mob/living/carbon/human/C in oview(1))
			visible_message("\red <B>[src] slashes [C] with scything talons!</B>")
			spawn(2) visible_message("\red <B>[src] slashes [C] with scything talons!</B>")
			var/obj/item/organ/limb/affecting = C.get_organ(ran_zone(src.zone_sel.selecting))
			var/armor_block = C.run_armor_check(affecting, "melee")
			C.apply_damage(rand(15, 35), BRUTE, affecting, armor_block - 25)
			new /obj/effect/gibspawner/blood(C.loc)
			if(prob(50))
				C.drop_item()
			adjustToxLoss(-50)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/proc/venom(var/mob/living/carbon/T in oview(1))
	set name = "Venom (1500)"
	set desc = "Bite with a venom that makes it difficult to stand on tyranid weeds."
	set category = "Alien"
	if(powerc(1500))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(1))
				victims += C
			//T = input(src, "Who should we hit?") as null|anything in victims
			T = pick(victims)
		if(T)
			if(!istype(T))
				src << "\red We only bite people!"
				return
			src << "We bite [T]."
			visible_message("\red <B>[src] bites [T] with venomous fangs!</B>")
			T.take_organ_damage(10, 0) //ignores armor
			T.reagents.add_reagent("tyranid", 7)
			adjustToxLoss(-1500)
		else
			src << "\blue You cannot bite nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/hormagaunt/verb/evolution()
	set name = "Evolution (800)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage >= 4)
		src << "\red You are already fully developed."
		return
	if(powerc(800))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/proc/corrosive_acid)
				src << "\red You gain acid glands."
			if(2)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/hormagaunt/proc/talons)
				src << "\red You adapt scything talons!"
			if(3)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/venom)
				src << "\red You adapt a venomous bite! The venom will make targets react badly to harvest weeds, keeping them away from the hive."
			if(4)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/spikes, /mob/living/carbon/alien/humanoid/tyranid/proc/mine)
				src << "\red You are now able to build spike defenses and spore mines."
		adjustToxLoss(-800)
	else
		src << "\red You need more biomass."

/*
Genestealer
*/


/mob/living/carbon/alien/humanoid/tyranid/genestealer
	name = "genestealer"
	icon_state = "genestealer"
	maxHealth = 200
	health = 200
	var/convert_range = 0
	var/speedboost = 1

/mob/living/carbon/alien/humanoid/tyranid/genestealer/movement_delay()
	. = -speedboost
	. += ..()

/mob/living/carbon/alien/humanoid/tyranid/genestealer/verb/convert()
	set name = "Convert (50)"
	set desc = "Depending on your evolution progress, you must either be standing over them or next to the target."
	set category = "Alien"
	if(powerc(50))
		var/mob/living/carbon/human/T = null
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in view(src, convert_range))
				victims += C
			if(victims.len) T = pick(victims)
		if(T)
			if(!istype(T))
				src << "\red We only infect people!"
				return
			if(istype(T, /mob/living/carbon/human/whitelisted/))
				src << "\red No... it is too difficult! We must find another."
				return
			if(iscultist(T))
				src << "\red This one's mind is already too closely bonded to immaterial forces!"
				return
			src << "We jab [T]. They will become one of us in approximately two minutes."
			visible_message("\red <B>[src] jabs [T] with its tongue!</B>")
			T << "\red The [src] jabs you with its tongue!"
			T.Paralyse(15)
			spawn(1200)
				T << "\red You are suddenly able to sense all the other tyranids on the outpost!"
				T << "\red You are a member of the genestealer cult. Serve the tyranids at all costs."
				T.alien_talk_understand = 1
				T.mind.special_role = "Genestealer Cult Member"
				spawn(10)
					for(var/mob/living/C in world)
						if(isalien(C) || (C.mind && C.mind.special_role == "Genestealer Cult Member"))
							var/I = image('icons/mob/alien.dmi', loc = T, icon_state = "genestealer")
							C.client.images += I
			adjustToxLoss(-50)
		else
			src << "\blue No targets in range!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/genestealer/proc/talons()
	set name = "Scything Talons (50)"
	set desc = "Lash out in rapid succession at everyone nearby."
	set category = "Alien"
	if(powerc(50))
		playsound(loc, 'sound/weapons/slice.ogg', 25, 1, -1)
		for(var/mob/living/carbon/human/C in oview(1))
			visible_message("\red <B>[src] slashes [C] with scything talons!</B>")
			spawn(2) visible_message("\red <B>[src] slashes [C] with scything talons!</B>")
			if(src.evol_stage >= 6)
				C.take_organ_damage(rand(25, 45), 0)
				C.drop_item()
				new /obj/effect/gibspawner/blood(C.loc)
			else
				var/obj/item/organ/limb/affecting = C.get_organ(ran_zone(src.zone_sel.selecting))
				var/armor_block = C.run_armor_check(affecting, "melee")
				C.apply_damage(rand(15, 45), BRUTE, affecting, armor_block - 35)
				new /obj/effect/gibspawner/blood(C.loc)
			adjustToxLoss(-50)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/genestealer/proc/adrenalineglands()
	set name = "Adrenal Glands (300)"
	set desc = "Use your adrenal glands to negate all knockouts, heal faster, and move faster."
	set category = "Alien"
	if(speedboost >= 3)
		src << "\red They are already active."
		return
	if(src.storedPlasma >= 300)
		adjustToxLoss(-300)
		status_flags = 0
		speedboost = 3
		spawn(0)
			for(var/i = 0, i<9,i++)
				adjustBruteLoss(-2)
				adjustOxyLoss(-2)
				adjustFireLoss(-2)
				sleep(10)
		spawn(90)
			status_flags = CANPARALYSE|CANPUSH
			speedboost = 1
		return
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/genestealer/verb/evolution()
	set name = "Evolution (800)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage >= 6)
		src << "\red You are already fully developed."
		return
	if(powerc(800))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.convert_range = 1
				src << "<b>You can now convert adjacent individuals rather than having to stand over them.</b>"
			if(2)
				src.see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
				src << "<b>Your senses adapt to the dark!</b>"
			if(3)
				var/choice = alert(src, "Enter an option.",,"Toughened Carapace","Fireproofed Scales")
				switch(choice)
					if("Toughened Carapace")
						src.brutearmor += 7
						src << "\red Your carapace hardens."
					if("Fireproofed Scales")
						src.firearmor += 5
						src << "\red You grow heat-resistant scales."
			if(4)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/genestealer/proc/talons)
				src << "\red You adapt scything talons."
				src << "\red Your grab ability is enhanced."
			if(5)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/genestealer/proc/adrenalineglands)
				src << "\red You adapt genestealer adrenal glands."
			if(6)
				src.name = "brood lord"
				src.health += 100
				src.maxHealth += 100
				src << "\red You have evolved into a brood lord!"
		adjustToxLoss(-800)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/genestealer/Life()
	..()
	if(evol_stage >= 2)
		src.see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING

/*
Ripper
*/

/mob/living/simple_animal/hostile/alien/ripper
	name = "ripper"
	desc = "A fanged snake like creature that doesn't look very friendly."
	icon = 'icons/mob/tyranids.dmi'
	icon_state = "ripper"
	icon_living = "ripper"
	icon_dead = "ripper_dead"
	health = 25
	melee_damage_lower = 10
	melee_damage_upper = 10
	speed = -1
	wander = 1
	layer = 5
	var/size = 25

/mob/living/simple_animal/hostile/alien/ripper/New()
	..()
	pixel_x = rand(-16, 16)
	pixel_y = rand(-16, 16)
	size = rand(40, 50)
	src.update_size()

/mob/living/simple_animal/hostile/alien/ripper/proc/update_size()
	transform = initial(transform)
	transform *= TransformUsingVariable(size, 100, 0.5)

/mob/living/simple_animal/hostile/alien/ripper/Die()
	..()
	visible_message("[src] collapses back into a soup of biomass!")
	playsound(src, 'sound/voice/hiss6.ogg', 100, 1)

/mob/living/simple_animal/hostile/alien/ripper/Life()
	..()
	if(src.stat == DEAD) return
	for(var/mob/living/carbon/human/H in range(1, get_turf(src)))
		if(H.stat == DEAD && src.size < 95)
			src.visible_message("The [src] tears into [H] greedily!")
			new /obj/effect/gibspawner/blood(H.loc)
			src.maxHealth += 5
			src.health += 5
			melee_damage_upper += 1
			size += 3
			src.update_size()
			if(prob(3))
				H.gib()

/mob/living/simple_animal/hostile/alien/ripper/CanAttack(var/atom/L)
	if(isliving(L))
		var/mob/living/M = L
		if(M.mind && M.mind.special_role == "Genestealer Cult Member")
			return 0
		if(M.status_flags & XENO_HOST)
			return 0
	return ..()

/*
Venomthropes
*/

//Venomthropes. Creates large smoke clouds that melt off masks and poison humans and does not effect aliens, and tentacles that give you a dose of peudelozine.

/mob/living/carbon/alien/humanoid/tyranid/venomthropes
	name = "venomthropes"
	icon_state = "venomthropes"
	maxHealth = 200
	health = 200
	ventcrawler = 0
	var/venom_sacs = 0
	var/autogas = 0

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/adjustFireLoss(amount)
	amount *= 1.5
	..(amount)
	return

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/New()
	..()
	reagents.add_reagent("venomthropes",1000)

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/Life()
	..()
	reagents.add_reagent("venomthropes",5) //Always chalk full of this stuff. Makes you immune to other poisons and is the source of chemical smokes.
	if(src.venom_sacs)
		reagents.add_reagent("toxin",5)
		reagents.add_reagent("chloromethane",5)
	if(autogas && prob(20))
		adjustToxLoss(20)
		src.gas()

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/verb/gas()
	set name = "Toxic Gas (20)"
	set desc = "Send out toxic gasses to disable and kill nearby non-Tyranid life forms."
	set category = "Alien"
	if(powerc(20))
		reagents.add_reagent("venomthropes",5)
		var/location = get_turf(src)
		var/datum/effect/effect/system/chem_smoke_spread/S = new /datum/effect/effect/system/chem_smoke_spread //And time for toxic smokescreen.
		S.attach(location)
		playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
		spawn(0)
			if(S)
				S.set_up(src.reagents, 10, 0, location)
				S.start()
				sleep(10)
				S.start()
		adjustToxLoss(-20)
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/proc/sting(var/mob/living/carbon/T in oview(1))
	set name = "Tentacle Sting (20)"
	set desc = "Delivers a lethal dose of toxins with one of your venom-infused tentacles."
	set category = "Alien"
	if(powerc(20))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(1))
				victims += C
			T = input(src, "Who should we sting?") as null|anything in victims
		if(T)
			if(!istype(T))
				src << "\red We only sting people!"
				return
			src << "We sting [T]"
			visible_message("\red <B>[src] stings [T]!</B>")
			if(!T.reagents)
				src << "\red Warning: Target does not have reagents. You should probably contact a coder about this."
				return
			T.reagents.add_reagent("stoxin", 50) //Venomthropes may die from a few lasers but they are still quite powerful because of death gas and lethal melee attacks.
			T.reagents.add_reagent("plasma", 50) //Considering the disarm/slash combo for all aliens, this poison isn't as OP as you think. Plus these guys have low health.
			T.reagents.add_reagent("lexorin", 50)//Massive dose of the toxins so that antitox will have a hard time curing it.
			T.reagents.add_reagent("mutagen", 5) //Just to give them some bad mutation on contact with the poisons.
			adjustToxLoss(-20)
		else
			src << "\blue You cannot sting nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/proc/venomshot(var/atom/T)
	set name = "Venom Cannon (350)"
	set desc = "Fire a venom crystal from the venom cannon biomorph."
	set category = "Alien"

	if(powerc(350))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we shoot?") as null|anything in victims
		if(T)
			src.visible_message("<span class='danger'>[src] shoots the venom cannon!", "<span class='alertalien'>You fire the venom cannon.</span>")
			var/turf/curloc = src.loc
			var/atom/targloc
			if(!istype(T, /turf/))
				targloc = get_turf(T)
			else
				targloc = T
			if (!targloc || !istype(targloc, /turf) || !curloc)
				return
			if (targloc == curloc)
				return
			var/obj/item/projectile/bullet/dart/venom/A = new /obj/item/projectile/bullet/dart/venom(src.loc)
			A.current = curloc
			A.yo = targloc.y - curloc.y
			A.xo = targloc.x - curloc.x
			adjustToxLoss(-350)
			A.process()
		else
			src << "\blue You cannot shoot at nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/ClickOn(var/atom/A, params)

	var/list/modifiers = params2list(params)
	if(modifiers["shift"])
		if(evol_stage >= 6)
			venomshot(A)
		return
	..()

/mob/living/carbon/alien/humanoid/tyranid/venomthropes/verb/evolution()
	set name = "Evolution (500)"
	set desc = "Adapt and become more powerful."
	set category = "Alien"
	if(evol_stage >= 6)
		src << "\red You are already fully developed."
		return
	if(powerc(500))
		evol_stage += 1
		switch(evol_stage)
			if(1)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/proc/corrosive_acid)
				src << "\red You gain acid glands."
			if(2)
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/venomthropes/proc/sting)
				src << "\red Your tentacles develop a sting."
			if(3)
				src.reagents.clear_reagents()
				src.venom_sacs = 1
				plasma_rate = 7
				src << "<b>You grow additional venom sacs.</b>"
			if(4)
				src.strong_buildings = 1
				src << "<b>You become better at building walls.</b>"
			if(5)
				src.autogas = 1
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/regrowth)
				src << "<b>You develop regrowth. Your venom sacs also start flooding additional toxins into the air.</b>"
			if(6)
				plasma_rate = 10
				src << "<b>You evolve a venom cannon! Use shift+click to fire.</b>"
				src.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/venomthropes/proc/venomshot)
		adjustToxLoss(-500)
	else
		src << "\red You need more biomass."

datum/reagent/toxin/venomthropes
	name = "Tyranid Toxin"
	id = "venomthropes"
	description = "A caustic, neurotoxic, generally horrible substance that is ingeniously designed to wreak havoc on all non-Tyranid life."
	color = "#30DB50"
	toxpwr = 0

datum/reagent/toxin/venomthropes/reaction_mob(var/mob/living/M, var/method=TOUCH, var/volume)//magic numbers everywhere
	if(!istype(M, /mob/living))
		return
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.head)
			if(!H.head.unacidable)
				H << "<span class='danger'>Your headgear melts away!</span>" //Melts away stuff. No internals will render you safe.
				qdel(H.head)
				H.update_inv_head(0)
				H.update_hair(0)
		if(H.wear_mask)
			if(!H.wear_mask.unacidable)
				H << "<span class='danger'>Your mask melts away!</span>"
				qdel(H.wear_mask)
				H.update_inv_wear_mask(0)
				H.update_hair(0)
		if(H.glasses)
			if(!H.glasses.unacidable)
				H << "<span class='danger'>Your glasses melts away!</span>"
				qdel(H.glasses)
				H.update_inv_glasses(0)

datum/reagent/toxin/venomthropes/on_mob_life(var/mob/living/carbon/M) //Pretty high damage and a lot of random incapacitating effects. Won't exactly cause instant death but pretty powerful. It should be, as what is basically the venomthrope's only defense.
	if(!istype(M))	return
	if(!M) M = holder.my_atom
	if(ishuman(M))
		M.adjustOxyLoss(2)
		M.adjustFireLoss(2)
		M.adjustToxLoss(4)
		M.Jitter(2)
		M.Dizzy(2)
		M.hallucination += 1
		if(prob(20)) M.emote("gasp")
		if(prob(20)) M.Stun(2)
		if(prob(10)) M.Paralyse(3)
		if(prob(10)) M.eye_blurry = max(M.eye_blurry, 10)
		if(prob(10)) M.damageoverlaytemp = 60
		if(prob(10))
			shake_camera(M, 20, 1)
			M.Weaken(3)
		if(prob(20))
			randmutb(M)
			M.apply_effect(10,IRRADIATE,0)
	..()
	return

datum/reagent/tyranid
	name = "Tyranid Hypersensitivity Agent"
	id = "tyranid"
	description = "A substance that renders the subject unable to safely stand near tyranid harvest nodes."
	color = "#30DB50"

datum/reagent/tyranid/on_mob_life(var/mob/living/carbon/M) //Pretty high damage and a lot of random incapacitating effects. Won't exactly cause instant death but pretty powerful. It should be, as what is basically the venomthrope's only defense.
	if(!istype(M))	return
	if(!M) M = holder.my_atom
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(locate(/obj/structure/alien/weeds) in H.loc)
			if(prob(15))
				H.visible_message("\red <b>[H] reacts violently to the tyranid weeds!</b>")
				H.take_organ_damage(1, 1)
				H.drop_item()
				H.Dizzy(5)
				shake_camera(H, 10, 1)
				H.reagents.remove_reagent(src.id, 0.05)
	return
