//Use this or Orks as a template for adding races in the future. It's not even close to good but it JUST WORKS
/datum/species/kroot
	name = SPECIES_KROOT
	name_plural = "Kroot"
	secondary_langs = list(LANGUAGE_TAU)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_kroot.dmi'
	deform = 'icons/mob/human_races/r_def_kroot.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ANYTHING
	total_health = 250
	mob_size = MOB_MEDIUM
	strength = STR_MEDIUM
	sexybits_location = BP_GROIN
	inherent_verbs = list(
	/mob/living/carbon/human/kroot/proc/givekrootstats,
	/mob/living/carbon/human/kroot/proc/kroot_eat,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
/datum/species/kroot/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//kroot don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>Your a mercenary hired by the Tau. Obey whatever instructions they have, if you cannot communicate with any Tau immediately, then prepare a frontal base..</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
/mob/living/carbon/human
	var/new_kroot = SPECIES_KROOT

/mob/living/carbon/human/kroot/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_kroot)

/mob/living/carbon/human/kroot
	gender = MALE
	var/isempty = 0
	var/iseating = 0

/mob/living/carbon/human/kroot/Initialize()
	. = ..()
	fully_replace_character_name(random_kroot_name(src.gender))
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/kroot)
	outfit.equip(src)

	hand = 0//Make sure one of their hands is active.
	put_in_hands(new /obj/item/gun/projectile/shotgun/pump/boltaction/krootrifle)//Give them a weapon. // kroot rifle to do
	isburied = 1


//this is extremely hacky and clown world but I cannot for the life of me find another way to do this. It adds all necessary stats, languages, items, w/e you want on a normal human mob
//I look forward to the day someone calls me retarded and finds a very easy way to do this during init - wel
//Adding the proc to the init will call it/run it, but it will not apply the stats as I'm guessing they're loaded after init somehow somewhere. I know stats are a datum

/mob/living/carbon/human/kroot/proc/givekrootstats()
	set name = "Stretch your muscles"
	set category = "Kroot"
	set desc = "Gives kroot stats since I can't seem to do it any other way in this clown world."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] stretches their muscles after a long flight, feeling their strength and skill return to them.")
	src.add_stats(rand(14,16),rand(14,18),rand(12,15),10)
	src.add_skills(10,10,rand(0,3),0,0) //skills such as melee, ranged, med, eng and surg
	src.adjustStaminaLoss(-INFINITY)
	src.update_eyes() //should fix grey vision
	src.warfare_language_shit(TAU) //secondary language
	src.verbs -= /mob/living/carbon/human/kroot/proc/givekrootstats //removes verb at the end so they can't spam it for whatever reason
	client?.color = null

	var/obj/item/card/id/dog_tag/kroot/W = new

	W.icon_state = "tagred"
	W.assignment = "Kroot Hunter"
	W.registered_name = real_name
	W.update_label()
	equip_to_slot_or_del(W, slot_wear_id)

//this is the proc that lets Kroot eat bodies.
/mob/living/carbon/human/kroot/proc/kroot_eat()
	set category = "Kroot"
	set name = "Consume Corpse"

	var/obj/item/grab/G = src.get_active_hand()
	if(!istype(G))
		to_chat(src, "<span class='warning'>We must be grabbing a creature in our active hand to consume them.</span>")
		return

	var/mob/living/carbon/human/T = G.affecting //this will be modified later as we add more rando species
	if(!istype(T))
		to_chat(src, "<span class='warning'>[T] is not compatible with our biology.</span>")
		return

	if(HUSK in T.mutations) //Eating husks would be kinda strange, but idk
		to_chat(src, "<span class='warning'>This creature's DNA is ruined beyond useability!</span>")
		return

	if(iseating)
		to_chat(src, "<span class='warning'>We are already eating [T]!</span>")
		return

	var/obj/item/organ/external/affecting = T.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, "<span class='warning'>They are missing that body part!</span>") //Dont try and eat a limb that doesn't exist.

	iseating = 1

	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				to_chat(src, "<span class='notice'>This creature looks delicious. We must hold still while we consume them...</span>")
			if(2)
				to_chat(src, "<span class='notice'>[src] begins to open their jaw</span>")
				src.visible_message("<span class='warning'>[src] widens their jaw!</span>")
			if(3)
				to_chat(src, "<span class='notice'>We bite [T] with a sickening crunch!</span>")
				src.visible_message("<span class='danger'>[src] bites [T] with a loud crunch</span>")
				to_chat(T, "<span class='danger'>You feel a sharp stabbing pain!</span>")
				affecting.take_damage(39, 0, DAM_SHARP, "large organic needle")
				playsound(src, 'sound/effects/lecrunch.ogg', 50, 0, -1)

		if(!do_mob(src, T, 150))
			to_chat(src, "<span class='warning'>Our meal of [T] has been interrupted!</span>")
			iseating = 0
			return

	to_chat(src, "<span class='notice'>We have consumed [T]!</span>")
	src.visible_message("<span class='danger'>[src] sucks the marrow from [T]'s bones!</span>")
	to_chat(T, "<span class='danger'>You have been eaten by a kroot!</span>")

	iseating = 0

	T.death(0)
	T.isburied = 1
	T.gib()
	restore_all_organs()
	src.adjustBruteLoss(-40)
	src.adjustOxyLoss(-40)
	src.adjustStaminaLoss(-5)
	src.adjustToxLoss(-40)
	src.adjustBrainLoss(-40)
	src.adjustFireLoss(-40)
	src.nutrition = 400
	src.thirst = 550
	src.radiation = 0
	src.bodytemperature = T20C
	src.sdisabilities = 0
	src.disabilities = 0
	src.blinded = 0
	src.eye_blind = 0
	src.eye_blurry = 0
	src.ear_deaf = 0
	src.ear_damage = 0
	GLOB.kroot_eats++
	return 1
