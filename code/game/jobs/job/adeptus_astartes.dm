//  Astartes Envoy

/datum/job/envoy
	title = "Astartes Envoy"
	total_positions = 1
	spawn_positions = 1
	head_position = 0
	supervisors = "The Rogue Trader and your Chapter Master"
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/astartes //will need to be replaced eventually - wel
	alt_titles = list(
		"Blood Angels Tactical Marine" = /decl/hierarchy/outfit/job/astartes,
		"Blood Angels Sanguinary Priest" = /decl/hierarchy/outfit/job/astartes/bangapoth,
		"Blood Angels Techmarine" = /decl/hierarchy/outfit/job/astartes/bangtech,
		"Raven Guard Tactical Marine" = /decl/hierarchy/outfit/job/astartes/ravenguard,
		"Raven Guard Apothecary" = /decl/hierarchy/outfit/job/astartes/ravapoth,
		"Raven Guard Techmarine" = /decl/hierarchy/outfit/job/astartes/raventech,
		"Salamander Tactical Marine" = /decl/hierarchy/outfit/job/astartes/salamander,
		"Salamander Apothecary" = /decl/hierarchy/outfit/job/astartes/salapoth,
		"Salamander Techmarine" = /decl/hierarchy/outfit/job/astartes/saltech,
		"Ultramarine Tactical Marine" = /decl/hierarchy/outfit/job/astartes/ultramarine,
		"Ultramarine Apothecary" = /decl/hierarchy/outfit/job/astartes/ultrapoth,
		"Ultramarine Techmarine" = /decl/hierarchy/outfit/job/astartes/ultratech
		)
	selection_color = "#3e0177"
	department_flag = SEC|COM
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	req_admin_notify = 1
	open_when_dead = 0
	latejoin_at_spawnpoints = 1
	announced = 0
	species_role = "Astartes"
	cultist_chance = 1

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Brother [current_name]")
		H.verbs +=  list(
		/mob/living/carbon/human/proc/astachaos,
		/mob/living/carbon/human/proc/astacharge,
		/mob/living/carbon/human/proc/astacrush,
		/mob/living/carbon/human/proc/astadamage,
		/mob/living/carbon/human/proc/astadiescum,
		/mob/living/carbon/human/proc/astaeatboltgun,
		/mob/living/carbon/human/proc/astafaithshield,
		/mob/living/carbon/human/proc/astafallback,
		/mob/living/carbon/human/proc/astaforglory,
		/mob/living/carbon/human/proc/astagrenades,
		/mob/living/carbon/human/proc/astakill,
		/mob/living/carbon/human/proc/astanonestopus,
		/mob/living/carbon/human/proc/astaourwrath,
		/mob/living/carbon/human/proc/astaready,
		/mob/living/carbon/human/proc/astatoglory,
		/mob/living/carbon/human/proc/astaxenos)
		H.verbs -= list(/mob/living/carbon/human/verb/emoteemperorprotects)
		H.add_stats(28, rand(20,26), rand(22,26), rand(17,24)) //genuinely no idea what to make their stats
		H.add_skills(11,11,11,11,11)
/*switch(title) //either you get this to work or you dont change it, ok?
			if("Blood Angel Tactical Marine")
				H.add_skills(rand(13,15),rand(11,13),5,5,5)
			if("Raven Guard Tactical Marine")
				H.add_skills(rand(11,13),rand(13,15),5,5,5)
			if("Salamander Tactical Marine")
				H.add_skills(rand(11,13),rand(11,13),5,7,5)
			if("Ultramarine Tactical Marine")
				H.add_skills(rand(11,13),rand(11,13),5,5,5)
			if("Blood Angel Sanguinary Priest")
				H.add_skills(15, 13, 9, 1, 10)
			if("Raven Guard Apothecary")
				H.add_skills(13, 15, 9, 1, 10)
			if("Salamander Apothecary")
				H.add_skills(13, 13, 9, 3, 10)
			if("Ultramarine Apothecary")
				H.add_skills(13, 13, 9, 1, 10)
			if("Blood Angel Techmarine")
				H.add_skills(15, 13, 2, 11, 1)
			if("Raven Guard Techmarine")
				H.add_skills(13, 15, 2, 11, 1)
			if("Salamander Techmarine")
				H.add_skills(13, 13, 4, 11, 1)
			if("Ultramarine Techmarine")
				H.add_skills(13, 13, 2, 11, 1)*/
		H.set_trait(new/datum/trait/death_tolerant())
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.say(":v [title] reporting for duty!")
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is in debt to the trader for services rendered that saved the lives of countless brothers, being sent you have been instructed to protect and serve them in every capacity. This is a matter of honor, lives owed to a great Lord whom you have come to know over many decades, your new master on this forsaken world.</font></b></span>")
		H.gender = MALE
		H.f_style = "shaved"
		H.h_style = "Bald"
		H.bladder = -INFINITY
		H.bowels = -INFINITY //integrated shitter
		H.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
		H.vice = null //off for now

/datum/job/envoy/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/envoy/imperial
	title = "Astartes Battle Brother"
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Blood Angels Tactical Marine" = /decl/hierarchy/outfit/job/astartes,
		"Blood Angels Sanguinary Priest" = /decl/hierarchy/outfit/job/astartes/bangapoth,
		"Blood Angels Techmarine" = /decl/hierarchy/outfit/job/astartes/bangtech,
		"Salamander Tactical Marine" = /decl/hierarchy/outfit/job/astartes/salamander,
		"Salamander Apothecary" = /decl/hierarchy/outfit/job/astartes/salapoth,
		"Salamander Techmarine" = /decl/hierarchy/outfit/job/astartes/saltech,
		"Ultramarine Tactical Marine" = /decl/hierarchy/outfit/job/astartes/ultramarine,
		"Ultramarine Apothecary" = /decl/hierarchy/outfit/job/astartes/ultrapoth,
		"Ultramarine Techmarine" = /decl/hierarchy/outfit/job/astartes/ultratech
		)

/datum/job/envoy/watchman
	title = "Chaos Astartes"
	total_positions = 2
	spawn_positions = 2
	selection_color = "#373ab6"

//assfartes outfits


/decl/hierarchy/outfit/job/astartes
	name = OUTFIT_JOB_NAME("Blood Angels Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/bloodangel
	back = /obj/item/storage/backpack/satchel/astartes/bloodangel
	belt = /obj/item/melee/chain/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/astartes/bloodangel
	head = /obj/item/clothing/head/helmet/astartes/bloodangel
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/boltrifle/bang
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = /obj/item/device/pda

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/astartes/bangapoth
	name = OUTFIT_JOB_NAME("Blood Angels Sanguinary Priest")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/bloodangel
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/apothecary
	shoes = /obj/item/clothing/shoes/jackboots/astartes/bloodangel
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/chain/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor/apoth = 1
	)

/decl/hierarchy/outfit/job/astartes/bangtech
	name = OUTFIT_JOB_NAME("Blood Angels Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/bloodangel
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/magos/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/jackboots/astartes/bloodangel
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/headset_sec
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/ravenguard
	name = OUTFIT_JOB_NAME("Ravenguard Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/ravenguard
	belt = /obj/item/melee/chain/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/astartes/raven
	head = /obj/item/clothing/head/helmet/astartes/ravenguard
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	suit_store = /obj/item/gun/projectile/boltrifle/raven
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/chain/pcsword = 1,
	/obj/item/ammo_magazine/bolt_rifle_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/ravenguard/Sergeant
	name = OUTFIT_JOB_NAME("Ravenguard Sergeant")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/sergeant/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/ravenguard
	belt = /obj/item/melee/energy/powersword/astartes/ingelldina
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/astartes/raven
	head = /obj/item/clothing/head/helmet/astartes/sergeant/ravenguard
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/plasma = 4,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/ravapoth
	name = OUTFIT_JOB_NAME("Ravenguard Apothecary")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/apothecary
	shoes = /obj/item/clothing/shoes/jackboots/astartes/raven
	head = /obj/item/clothing/head/helmet/astartes/apothecary/ravenguard
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/chain/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor/apoth = 1
	)

/decl/hierarchy/outfit/job/astartes/raventech
	name = OUTFIT_JOB_NAME("Ravenguard Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/ravenguard
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/magos/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/jackboots/astartes/raven
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/salamander
	name = OUTFIT_JOB_NAME("Salamanders Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/salamander
	back = /obj/item/storage/backpack/satchel/astartes/salamander
	belt = /obj/item/melee/chain/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/astartes/sallys
	head = /obj/item/clothing/head/helmet/astartes/salamander
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	suit_store = /obj/item/gun/projectile/boltrifle/sally
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1,
	/obj/item/gun/projectile/automatic/flamer = 1
	)

/decl/hierarchy/outfit/job/astartes/salamander/sergeant
	name = OUTFIT_JOB_NAME("Salamander Company Sergeant")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/sergeant/salamander
	back = /obj/item/storage/backpack/satchel/astartes/salamander
	belt = /obj/item/melee/energy/powersword/astartes/ingelldina
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/astartes/sallys
	head = /obj/item/clothing/head/helmet/astartes/sergeant/salamander
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/plasma = 4,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1,
	/obj/item/gun/projectile/automatic/flamer = 1
	)

/decl/hierarchy/outfit/job/astartes/salapoth
	name = OUTFIT_JOB_NAME("Salamanders Apothecary")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/salamander
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/apothecary
	shoes = /obj/item/clothing/shoes/jackboots/astartes/sallys
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/chain/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor/apoth = 1
	)

/decl/hierarchy/outfit/job/astartes/saltech
	name = OUTFIT_JOB_NAME("Salamanders Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/salamander
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/magos/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/jackboots/astartes/sallys
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/ultramarine
	name = OUTFIT_JOB_NAME("Ultramarines Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ultramarine
	back = /obj/item/storage/backpack/satchel/astartes/ultramarine
	belt = /obj/item/melee/chain/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/astartes/smurfs
	head = /obj/item/clothing/head/helmet/astartes/ultramarine
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/boltrifle
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/ultramarine/sergeant
	name = OUTFIT_JOB_NAME("Ultramarine Sergeant")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ultramarine/sergeant
	back = /obj/item/storage/backpack/satchel/astartes/ultramarine
	belt = /obj/item/melee/energy/powersword/astartes/ingelldina
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/astartes/smurfs
	head = /obj/item/clothing/head/helmet/astartes/sergeant/ultramarine
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/plasma = 4,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)

/decl/hierarchy/outfit/job/astartes/ultrapoth
	name = OUTFIT_JOB_NAME("Ultramarines Apothecary")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/ultramarine
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/apothecary
	shoes = /obj/item/clothing/shoes/jackboots/astartes/smurfs
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/pulse/plasma/pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/chain/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor/apoth = 1
	)

/decl/hierarchy/outfit/job/astartes/ultratech
	name = OUTFIT_JOB_NAME("Ultramarines Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/ultramarine
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/magos/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/jackboots/astartes/smurfs
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/glasses/astartes/visor = 1
	)
