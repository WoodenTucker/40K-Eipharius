#define HEALING_NORMAL 1
#define HEALING_ORGANS 2
#define NO_HEAL        0

/mob/living/carbon/human
	var/waaagh = 0
	var/max_waaagh = 0
	//var/waaagh_regen = 0  //natural regeneration of waaagh it changes when the ork is in presence of a ork banner or if he was buffed by the warboss
	var/inspired = FALSE  //this changes when the ork is buffed by the warboss
	var/new_species = SPECIES_ORK_GRETCHIN

/mob/living/carbon/human/Stat()
	..()
	if(max_waaagh > 0)
		stat(null, "Waaagh: [waaagh]/[max_waaagh]")

/mob/living/carbon/human/Life()
	..()
	var/regen = 5
	//waaagh_regen = 0
	//var/healing = NO_HEAL
	//var/bannerinview = FALSE
	if(max_waaagh > 0)
		/*for(var/obj/structure/orkbanna/O in oview(7)) //checks for the orkbanner in sight
			bannerinview = TRUE
			visible_message("Debug, banner in view")
		if(bannerinview || inspired)
			waaagh_regen = 5
			healing = HEALING_NORMAL
			visible_message("Debug, scream effect")*/
		if(inspired)
			regen = 8
			//healing = HEALING_ORGANS
		else
			regen = 5

		waaagh = max(0, min(waaagh + regen, max_waaagh))

		//first heal damages
		if(prob(20))
			if(getBruteLoss() || getFireLoss() || getOxyLoss() || getToxLoss())
				adjustBruteLoss(-1)
				adjustFireLoss(-1)
				adjustOxyLoss(-1)
				adjustToxLoss(-1)

		//next internal organs
		if(prob(5))
			for(var/obj/item/organ/I in internal_organs)
				if(I.damage > 0)
					I.damage = max(I.damage - 1, 0)
/mob/living/carbon/human/ork
	name = "ork"
	real_name = "ork"
	gender = MALE
	maxHealth = 150
	health = 150
	status_flags = 0
	var/isempty = 0

/mob/living/carbon/human/ork/New(var/new_loc)
	max_waaagh = 300
	waaagh = max_waaagh
	var/dice = rand(1, 2)
	switch(dice)
		if(1)
			playsound(src, 'sound/voice/ork/gretspawn1.ogg', 50)
		if(2)
			playsound(src, 'sound/voice/ork/gretspawn2.ogg', 50)
	..(new_loc, new_species)

/mob/living/carbon/human/ork/Initialize()
	. = ..()
	fully_replace_character_name(random_ork_name(src.gender))
	warfare_faction = ORKZ
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/kroot)
	outfit.equip(src)

	hand = 0//Make sure one of their hands is active.
	put_in_hands(new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/krootrifle/bayonet)//Give them a weapon.

/mob/living/carbon/human/ork/nob/New(var/new_loc)
	var/namelist = list("Nob")
	var/ork_name = pick(namelist)

	name = "[ork_name]"
	real_name = "[ork_name]"
	h_style = "Bald"
	size_multiplier = 1.2
	max_waaagh = 300
	waaagh = max_waaagh
	warfare_faction = ORKZ
	new_species = SPECIES_ORK_NOB
	playsound(src, 'sound/voice/ork/dakkashout3.ogg', 50)
	..(new_loc, SPECIES_ORK_NOB)

/mob/living/carbon/human/ork/mek/New(var/new_loc)
	var/namelist = list("Mek-boy")
	var/ork_name = pick(namelist)

	name = "[ork_name]"
	real_name = "[ork_name]"
	h_style = "Bald"
	max_waaagh = 300
	waaagh = max_waaagh
	warfare_faction = ORKZ
	new_species = SPECIES_ORK_MEK
	playsound(src, 'sound/voice/ork/workwork.ogg', 50)
	..(new_loc, SPECIES_ORK_MEK)

/mob/living/carbon/human/ork/boss/New(var/new_loc)
	..()

	var/namelist = list("Warboss")
	var/ork_name = pick(namelist)

	name = "[ork_name]"
	real_name = "[ork_name]"
	h_style = "Bald"
	size_multiplier = 1.4
	max_waaagh = 500
	warfare_faction = ORKZ
	waaagh = max_waaagh
	new_species = SPECIES_ORK_BOSS
	playsound(src, 'sound/voice/ork/warboss.ogg', 50)
	..(new_loc, SPECIES_ORK_BOSS)

