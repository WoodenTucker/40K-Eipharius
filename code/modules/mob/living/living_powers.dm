/mob/living
	var/hiding

/mob/living/proc/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(incapacitated())
		return

	hiding = !hiding
	if(hiding)
		to_chat(src, "<span class='notice'>You are now hiding.</span>")
	else
		to_chat(src, "<span class='notice'>You have stopped hiding.</span>")
	reset_layer()

/mob/living/proc/breath_death()
	set name = "Breath Death"
	set desc = "Infect others with your very breathe."
	set category = "Plague Zombie"

	if(last_special > world.time)
		return

	last_special = world.time + 40 SECONDS

	var/turf/T = get_turf(src)
	var/obj/effect/effect/water/chempuff/chem = new(T)
	chem.create_reagents(10)
	chem.reagents.add_reagent(/datum/reagent/toxin/corrupting,30)
	chem.set_up(get_step(T, dir), 2, 10)
	playsound(T, 'sound/hallucinations/wail.ogg',20,1)

/mob/living/proc/zombie_eat()
	set name = "Consume Corpse"
	set desc = "Regain life by consuming it from others."
	set category = "Plague Zombie"


	var/obj/item/grab/G = src.get_active_hand()
	if(!istype(G))
		to_chat(src, "<span class='warning'>We must be grabbing a creature in our active hand to consume them.</span>")
		return

	var/mob/living/carbon/human/L = G.affecting  //this will be modified later as we add more rando species
	if(!istype(L))
		to_chat(src, "<span class='warning'>[L] is not compatible with our biology.</span>")
		return

	if(HUSK in L.mutations) //Eating husks would be kinda strange, but idk
		to_chat(src, "<span class='warning'>This creature's DNA is ruined beyond useability!</span>")
		return

	var/obj/item/organ/external/affecting = L.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, "<span class='warning'>They are missing that body part!</span>") //Dont try and eat a limb that doesn't exist.

	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				to_chat(src, "<span class='notice'>This creature looks delicious. We must hold still while we consume them...</span>")
			if(2)
				to_chat(src, "<span class='notice'>[src] begins to open their jaw</span>")
				src.visible_message("<span class='warning'>[src] widens their jaw!</span>")
			if(3)
				to_chat(src, "<span class='notice'>We bite [L] with a sickening crunch!</span>")
				src.visible_message("<span class='danger'>[src] bites [L] with a loud crunch</span>")
				to_chat(L, "<span class='danger'>You feel a sharp stabbing pain!</span>")
				affecting.take_damage(39, 0, DAM_SHARP, "large organic needle")
				playsound(src, 'sound/effects/lecrunch.ogg', 50, 0, -1)

		if(!do_mob(src, L, 150))
			to_chat(src, "<span class='warning'>Our meal of [L] has been interrupted!</span>")
			return

	to_chat(src, "<span class='notice'>We have consumed [L]!</span>")
	src.visible_message("<span class='danger'>[src] sucks the marrow from [L]'s bones!</span>")
	to_chat(L, "<span class='danger'>You have been eaten by a plague zombie!</span>")

	L.death(0)
	L.isburied = 1
	L.gib()
	restore_all_organs()
	src.adjustBruteLoss(-40)
	src.adjustOxyLoss(-40)
	src.adjustStaminaLoss(-5)
	src.adjustToxLoss(-40)
	src.adjustBrainLoss(-40)
	src.adjustFireLoss(-40)
	src.radiation = 0
	src.sdisabilities = 0
	src.disabilities = 0
	src.blinded = 0
	src.eye_blind = 0
	src.eye_blurry = 0
	src.ear_deaf = 0
	src.ear_damage = 0
	return 1