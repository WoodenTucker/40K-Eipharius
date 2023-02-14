//Some new tyranid verbs.

/*proc/specialedits(var/mob/living/carbon/alien/humanoid/tyranid/T)
	//I want to make special character stuff application-based... Gonna encourage the faction members to apply for this stuff.
	if(T.key == " Not yet ")
		var/evolchoice
		evolchoice = input("Choose what you wish to evolve into.","Tyranid Evolution") as null|anything in list("Hormagaunt","Warrior","Genestealer","Lictor","Ravener","Venomthropes","Zoanthropes")
		switch(evolchoice)
			if("Hormagaunt")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/hormagaunt(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma())
				qdel(T)
			if("Warrior")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/warrior(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma()) //Any biomass on top of what you spend evolving you keep.
				qdel(T)
			if("Genestealer")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/genestealer(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma()) //Any biomass on top of what you spend evolving you keep.
				qdel(T)
			if("Lictor")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/lictor(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma()) //Any biomass on top of what you spend evolving you keep.
				qdel(T)
				new_xeno.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/adrenaline,/mob/living/carbon/alien/humanoid/tyranid/proc/stealthsting,/mob/living/carbon/alien/humanoid/tyranid/proc/empulse)
				new_xeno.name = "marsh stalker"
				new_xeno.real_name = "marsh stalker"
			if("Ravener")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/ravener(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma()) //Any biomass on top of what you spend evolving you keep.
				qdel(T)
				new_xeno.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/empulse)
				new_xeno.maxHealth = 400
				new_xeno.health = 400
				new_xeno.name = "red terror"
				new_xeno.real_name = "red terror"
			if("Zoanthropes")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/zoanthropes(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma()) //Any biomass on top of what you spend evolving you keep.
				qdel(T)
				new_xeno.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/possess)
			if("Venomthropes")
				var/mob/living/carbon/alien/humanoid/new_xeno = new /mob/living/carbon/alien/humanoid/tyranid/venomthropes(T.loc)
				if(T.mind)	T.mind.transfer_to(new_xeno)
				new_xeno.adjustToxLoss(T.getPlasma()) //Any biomass on top of what you spend evolving you keep.
				qdel(T)
				new_xeno.verbs.Add(/mob/living/carbon/alien/humanoid/tyranid/proc/neurotoxinblast)
	return T*/

/mob/living/carbon/alien/humanoid/tyranid/proc/stealthsting(var/mob/living/carbon/T in oview(1)) //For lictors.
	set name = "Stealth Sting (150)"
	set desc = "Delivers a lethal dose of delayed toxins."
	set category = "Alien"
	if(powerc(150))
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
			T << "\red <b>The [src] slashes you!<\b>" //Doesn't directly let them know you stung them, looks like a regular attack.
			if(!T.reagents)
				src << "\red Warning: Target does not have reagents. You should probably contact a coder about this."
				return
			T.reagents.add_reagent("stealth", 20)
			adjustToxLoss(-150)
		else
			src << "\blue You cannot sting nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/proc/possess(var/mob/living/carbon/T in oview(7))  //For zoanthropes
	set name = "Possess (300)"
	set desc = "Temporarily seize control of a weaker mind."
	set category = "Alien"
	if(powerc(300))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we possess?") as null|anything in victims
		if(T)
			if(!istype(T))
				src << "\red We only possess people!"
				return
			src << "We possess [T]"
			visible_message("\red <B>[src]'s eyes glow green!</B>") //Considering giving this to zoan instead of psychic wall.
			var/oldkey = T.key                                      //Or maybe just raise the price of psychic wall.
			var/mykey = src.key                                     //Would this proc even work though? P sure possessing is more difficult than this.
			src.key = null
			T.key = mykey
			spawn(80)
				src.key = mykey
				T.key = oldkey
			adjustToxLoss(-300)
		else
			src << "\blue You cannot possess nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/proc/neurotoxinblast(var/atom/T) //For venomthropes
	set name = "Neurotoxin Volley (600)"
	set desc = "Use venom sacs to blast a large volley of neurotoxin."
	set category = "Alien"

	if(powerc(600))
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/human/C in oview(7))
				victims += C
			T = input(src, "Who should we shoot?") as null|anything in victims
		if(T)
			src.visible_message("<span class='danger'>[src] shoots neurotoxin!", "<span class='alertalien'>You shoot neurotoxin.</span>")
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
			adjustToxLoss(-300)
			for(var/stage = 1, stage<=8, stage++)
				sleep(2)
				spawn()
					var/obj/item/projectile/bullet/neurotoxin/A = new /obj/item/projectile/bullet/neurotoxin(src.loc) //Shoots seven projectiles in rapid fire
					A.current = curloc
					A.yo = targloc.y - curloc.y
					A.xo = targloc.x - curloc.x
					A.process()
		else
			src << "\blue You cannot shoot at nothing!"
	else
		src << "\red You need more biomass."

/mob/living/carbon/alien/humanoid/tyranid/proc/empulse() //For raveners to fight mecha
	set name = "Technology Overload (100)"
	set desc = "Overload nearby technology... Like mechs. Close range EMP."
	set category = "Alien"
	if(powerc(100))
		adjustToxLoss(-100)
		empulse(src.loc, 4, 5)
		return
	else
		src << "\red You need more biomass."

/mob/living/carbon/var/dodging = 0

/mob/living/carbon/alien/humanoid/tyranid/proc/adrenaline()
	set name = "Adrenal Glands (300)"
	set desc = "Use your adrenal glands to stimulate reflexes to insane levels."
	set category = "Alien"
	if(powerc(300))
		adjustToxLoss(-300)
		dodging = 1
		sleep(80) //8 seconds of being defended against a lot of attacks.
		dodging = 0
		return
	else
		src << "\red You need more biomass."
