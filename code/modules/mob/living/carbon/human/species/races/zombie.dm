/datum/species/human/zombie
	name = "Zombie"
	name_plural = "Zombies"
	icobase = 'Add relevant one here'
	deform = 'Add relevant one here'
	damage_mask = 'Add relevant one here'
	blood_mask = 'Add relevant one here'
	language = LANGUAGE_GALCOM
	min_age = 1 //Irrelevant, but might be used later
	max_age = 8000
	total_health = 50 //Aim for the head
	mob_size = MOB_MEDIUM
	strength = STR_VHIGH
	teeth_type = /obj/item/stack/teeth/human
	sexybits_location = BP_GROIN
	var/pain_power = 0 //Zombies, no pain.
	inherent_verbs = list(
	/mob/living/carbon/human/zombie/verb/convert)
	slowdown = 2
	unarmed_types = list(
		/datum/unarmed_attack/rendingclaws,
		/datum/unarmed_attack/rendingclaws,
		)

	has_fine_manipulation = 0
	siemens_coefficient = 0
	gluttonous = GLUT_ANYTHING
	stomach_capacity = MOB_MEDIUM
	darksight = 20
	innate_heal = TRUE
	thirst = INFINITY
	nutrition = INFINITY
	bladder = -INFINITY
	bowels = -INFINITY

	brute_mod = 1.1// Pretty fragile.
	burn_mod = 1.8 // FIRE BURNS
	tox_mod = 0

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_PAIN
	appearance_flags = HAS_EYE_COLOR | HAS_SKIN_COLOR

	blood_color = "#05ee05"

	gibbed_anim = "gibbed-a"
	dusted_anim = "dust-a"
	death_message = "lets out a waning guttural screech, blood bubbling from its maw."
	death_sound = 'sound/voice/hiss6.ogg'

	speech_chance = 100

	breath_type = null
	poison_type = null

	vision_flags = SEE_SELF|SEE_MOBS

/datum/species/human/zombie/handle_post_spawn(var/mob/living/carbon/human/H)
	if(H.f_style)//They're a walking corpse
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>I have seen Grandfather's light! I must serve the cultists of Nurgle, and convert corpses. (Check your Zombie tab.)</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human/zombie/proc/convert()
	set category = "Zombie"
	set name = "Convert"
	set desc = "Convert a corpse to Nurgle"

	if(!src.stat == DEAD)
		to_chat(src, "<span class='warning'>This body still lives, it cannot yet recieve Nurgle's blessing!.</span>")
		return

	var/obj/item/grab/G = src.get_active_hand()
	if(!istype(G))
		to_chat(src, "<span class='warning'>We must be grabbing the corpse in our active hand to convert them.</span>")
		return

	var/mob/living/carbon/human/T = G.affecting //this will be modified later as we add more rando species
	if(!istype(T))
		to_chat(src, "<span class='warning'>[T] is not compatible with the disease.</span>")
		return

	if(HUSK in T.mutations) //Eating husks would be kinda strange, but idk
		to_chat(src, "<span class='warning'>This body has been stripped bare!</span>")
		return

	if(isconverting)
		to_chat(src, "<span class='warning'>We are already converting [T]!</span>")
		return

	var/obj/item/organ/external/affecting = T.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, "<span class='warning'>They are missing that body part!</span>") //Dont try and eat a limb that doesn't exist.

	isconverting = 1

	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				to_chat(src, "<span class='notice'>This creature is suitable for the virus...</span>")
			if(2)
				to_chat(src, "<span class='notice'>[src] begins to open their jaw</span>")
				src.visible_message("<span class='warning'>[src] widens their jaw!</span>")
			if(3)
				to_chat(src, "<span class='notice'>[T] is torn terribly by [src]!</span>")
				src.visible_message("<span class='danger'>[src] tears chunks out of [T]!</span>")
				to_chat(T, "<span class='danger'>You feel enormous pain!</span>")
				affecting.take_damage(9, 0, DAM_SHARP, "Jagged teeth")
				playsound(src, 'sound/effects/lecrunch.ogg', 50, 0, -1)
			
	isconverting = 0
	T.set_species(Zombie)
	T.reset_hair()
	T.handle_post_spawn
	return 1
