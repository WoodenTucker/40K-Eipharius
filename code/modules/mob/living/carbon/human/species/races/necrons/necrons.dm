/

/datum/species/human/necron
	name = SPECIES_NECRON
	brute_mod =      0.1                   //Why are you trying to punch a metal robot to death
	burn_mod =       0.2                  //Once more, they are metal. The armor values compensate for the fact that they lack any armor as of now and I cant sprite shit
	blurb = "A Hulking Necron Warrior, consisting of cold metal and malice."
	min_age = 100
	max_age = 120000000
	icobase = 'icons/mob/human_races/r_necron.dmi'
	deform = 'icons/mob/human_races/r_def_necron.dmi'
	blood_volume = 1000 // how much "Coolant" a necron has since I cant remove blood
	blood_color = "#1FBD6E"
	slowdown = 0.2 //Slower then normal
	total_health = 50 //They will die upon reaching crit state,
	appearance_flags = RADIATION_GLOWS
	mob_size = MOB_LARGE
	strength = STR_VHIGH //Duplicate definition here.
	var/pain_power = 20
	//sexybits_location = BP_GROIN //its a robot, what the fuck man
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_SLIP|SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_EMBED
	inherent_verbs = list(
	/mob/living/carbon/human/necron/proc/givenecronstats
	)
	radiation_mod = 0

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/unbreakable/necron),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unbreakable/necron),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unbreakable/necron),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/unbreakable/necron),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/unbreakable/necron),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/unbreakable/necron),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/unbreakable/necron),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/unbreakable/necron),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/unbreakable/necron),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/unbreakable/necron),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/unbreakable/necron)
		)

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/augmetic/advanced/upgraded,
		BP_HEART =    /obj/item/organ/internal/heart/necron,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_LUNGS =   /obj/item/organ/internal/lungs/necron,
		BP_LIVER =    /obj/item/organ/internal/liver/necron,
		BP_KIDNEYS =    /obj/item/organ/internal/kidneys
		)
/mob/living/carbon/human/necron/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_necron)

/mob/living/carbon/human/necron/proc/givenecronstats()
	set name = "Initialize Restoration Protocol"
	set category = "Necron"
	set desc = "Gives necron stats because shitcode"

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] reboots, with green energy flowing through their necrodemis")
	src.add_stats(rand(20,21),rand(20,21),rand(20,21),10)
	src.add_skills(10,10,rand(0,3),0,0) //skills such as melee, ranged, med, eng and surg
	src.adjustStaminaLoss(-INFINITY)
	src.update_eyes() //should fix grey vision
	src.warfare_language_shit(necron) //secondary language
	src.verbs -= /mob/living/carbon/human/necron/proc/givenecronstats //removes verb at the end so they can't spam it for whatever reason
	client?.color = null


/obj/item/organ/external/chest/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 0

/obj/item/organ/external/groin/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 0
	encased = "lower ribcage"

/obj/item/organ/external/arm/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	gibbable = FALSE

/obj/item/organ/external/arm/right/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	gibbable = FALSE

/obj/item/organ/external/leg/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	gibbable = FALSE

/obj/item/organ/external/leg/right/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	gibbable = FALSE

/obj/item/organ/external/foot/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	can_stand = 1
	gibbable = FALSE

/obj/item/organ/external/foot/right/unbreakable/necron
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	can_stand = 1
	gibbable = FALSE

/obj/item/organ/external/hand/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	can_grasp = 1
	gibbable = FALSE

/obj/item/organ/external/hand/right/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 1
	can_grasp = 1
	gibbable = FALSE

/obj/item/organ/external/head/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.01
	cannot_break = 0
	gibbable = FALSE
