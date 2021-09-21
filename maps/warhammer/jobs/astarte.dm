/datum/job/envoy
	title = "Astartes Envoy"
	total_positions = 1
	spawn_positions = 1
	head_position = 0
	supervisors = "The Rogue Trader and your Chapter Master"
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/envoy //will need to be replaced eventually - wel
	selection_color = "#344FAA"
	department_flag = SEC|COM
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	auto_rifle_skill = 10 //astartes are masters of all weaponry
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	melee_skill = 10
	ranged_skill = 10
	medical_skill = 5
	engineering_skill = 0
	surgery_skill = 1
	req_admin_notify = 1
	open_when_dead = 0
	latejoin_at_spawnpoints = 1
	announced = 0
	species_role = "Astartes"


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Brother [current_name]")
		H.add_stats(40, rand(25,30), rand(25,30), rand(20,30)) //genuinely no idea what to make their stats
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Space Marine, hired to guard the Rogue Trader and further the goals of the Imperium. You are a beacon of Mankind's greatness, your behavior should reflect this always. Guardsmen revere you and will defer to your judgement, make sure it is sound.</font></b></span>")
		H.gender = MALE
		H.bladder = 0 //should make jimmy space marines not have to shit/piss
		H.bowels = 0
		H.verbs += /mob/living/carbon/human/proc/chapterselection
		H.adjustStaminaLoss(-INFINITY) //astardes have basically infinite fight in them
		H.health = 500
		H.maxHealth = 500

/decl/hierarchy/outfit/job/envoy //will eventually code this to randomize to different chapters
	name = OUTFIT_JOB_NAME("Astartes Envoy")
	uniform = /obj/item/clothing/under/color/black
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = null
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	shoes = null
	backpack_contents = null //for now
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


/datum/job/envoy/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/mob/living/carbon/human/proc/chapterselection()
	set name = "Select your chapter"
	set category = "Astartes"
	set desc = "Choose your chapter"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	var/mob/living/carbon/human/U = src
	src.verbs -= /mob/living/carbon/human/proc/chapterselection
	var/static/list/chapter = list("Raven Guard", "Raven Guard Techmarine", "Raven Guard Apothecary", "Ultramarines", "Ultramarines techmarine", "Ultramarines Apothecary", "Salamanders","Blood Ravens", "Salamanders Techmarine", "Salamanders Apothecary") //lists all possible chapters
	var/chapterchoice = input("Choose your chapter and role", "Available chapters") as anything in chapter

	switch(chapterchoice)
		if("Raven Guard")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/ravenguard, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/ravenguard, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/raven, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/ravenguard, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/ravenbolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Ultramarines")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/ultramarine, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/ultramarine, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/smurfs, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/smurfbolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/ultramarine, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Salamanders")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/salamander, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/salamander, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/sallys, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/salamander, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/sallybolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Blood Ravens")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/bloodravens, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/bloodravens, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/bloodraven, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/bloodravens, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/ravenbolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Raven Guard Techmarine")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/techmarine/ravenguard, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/techmarine, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/raven, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/ravenbolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/utility/full, slot_belt)
			U.add_skills(9, 9, 2, 9, 1)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Ultramarines techmarine")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/techmarine/ultramarine, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/techmarine, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/smurfs, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/smurfbolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/techpriest/techpack, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/utility/full, slot_belt)
			U.add_skills(9, 9, 2, 9, 1)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Salamanders Techmarine")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/techmarine/salamander, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/techmarine, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/sallys, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/techpriest/techpack, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/sallybolter, slot_s_store)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			U.add_skills(8, 8, 2, 9, 1)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Raven Guard Apothecary")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/apothecary/ravenguard, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/apothecary/ravenguard, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/raven, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/apothecary, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/bolter_pistol, slot_s_store)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			U.add_skills(9, 9, 9, 1, 8)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Ultramarines Apothecary")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/apothecary/ultramarine, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/apothecary, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/smurfs, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/bolter_pistol, slot_s_store)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/apothecary, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			U.add_skills(9, 9, 9, 1, 8)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)
		if("Salamanders Apothecary")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/apothecary/salamander, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/apothecary, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/astarte/boots/sallys, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/astartes/apothecary, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/bolt_pistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/bolter_pistol, slot_s_store)
			equip_to_slot_or_del(new /obj/item/melee/pcsword, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			U.add_skills(9, 9, 9, 1, 8)
			U.verbs -= list(/mob/living/carbon/human/proc/chapterselection,
			)

