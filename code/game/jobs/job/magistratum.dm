// Enforcers

/datum/job/marshal
	title = "Planetary Marshal" // Corrupted. Cult. Loyal.
	head_position = 1
	supervisors = "the Deacon or Inquisition"
	total_positions = 1
	spawn_positions = 1
	social_class = SOCIAL_CLASS_HIGH
	selection_color = "#f0ac25"
	outfit_type = /decl/hierarchy/outfit/job/ig/marshal
	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 10
	lmg_skill = 9
	smg_skill = 9
	cultist_chance = 5
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = INQ
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Marshal [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(16,19), rand(13,17), rand(13,17), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,6),3,rand(2,5)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village)

		to_chat(H, "<span class='notice'><b><font size=3>You are the Marshal appointed by the Magistratum,, your duty is to uphold Imperial law on this planet amongst the Pilgrims and to assist the Deacon where necessary. Your duties involve the investigation of crimes committed on behalf of the magistratum, collection of tithes and the interrogation or execution of criminals apprehended by the Magistratum.</font></b></span>")

/datum/job/investigator
	title = "Planetary Investigator"
	head_position = 1
	supervisors = "the Lord Governor"
	total_positions = 0
	spawn_positions = 0
	social_class = SOCIAL_CLASS_HIGH
	selection_color = "#f0ac25"
	outfit_type = /decl/hierarchy/outfit/job/ig/investigator
	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 10
	lmg_skill = 9
	smg_skill = 9
	cultist_chance = 5
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = INQ
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Investigator [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(16,19), rand(13,17), rand(13,17), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,6),3,rand(2,5)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village)

		to_chat(H, "<span class='notice'><b><font size=3>You're the local detective, a planetary investigator hired by the Governor to solve crimes. ")

/datum/job/enforcer
	title = "Enforcer" // Cult. Criminal. Loyal.
	supervisors = "the Planetary Marshal, Deacon and Inquisition"
	total_positions = 3
	spawn_positions = 3
	social_class = SOCIAL_CLASS_MED
	selection_color = "#f0ac25"
	outfit_type = /decl/hierarchy/outfit/job/ig/enforcer
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 9
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 15
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = INQ
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi,
			            access_all_personal_lockers, access_village,)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		..()
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,18), rand(12,16), rand(12,16), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,5),3,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
		H.witchblood() //Becoming a psyker can happen at any point of your life bro.
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,)

		to_chat(H, "<span class='notice'><b><font size=3> An Enforcer in the Magisterium. The Governership order you. Yet the Inquisition can override them. Patrol with the cadets. Make sure they know what they’re doing. Collect taxes and ensure the order of the world is peaceful and good. Be an undercover cop if you’re feeling ballsy.</font></b></span>")

/datum/job/cadet
	title = "Enforcer Cadet"
	supervisors = "the Planetary Marshal, Deacon and Inquisition"
	total_positions = 0
	spawn_positions = 0
	social_class = SOCIAL_CLASS_MED
	selection_color = "#f0ac25"
	outfit_type = /decl/hierarchy/outfit/job/ig/cadet
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 7
	lmg_skill = 5
	smg_skill = 5
	cultist_chance = 20
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = INQ
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi,
			            access_all_personal_lockers, access_village,)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,18), rand(12,16), rand(12,16), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(6,8),rand(6,8),rand(3,5),3,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,)

		to_chat(H, "<span class='notice'><b><font size=3> (NEW PLAYER ROLE) A cadet in the Magisterium. The Deacon order you. Yet the Inquisition can override them. Your job is to assist the other enforcers in punishing crime and collecting taxes. </font></b></span>")

/datum/job/arbitrator
	title = "Arbitrator"
	head_position = 1
	supervisors = "The Adeptus Arbites"
	total_positions = 1
	spawn_positions = 1
	social_class = SOCIAL_CLASS_HIGH
	selection_color = "#c9952f"
	outfit_type = /decl/hierarchy/outfit/job/ig/arbitrator
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = INQ
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Arbitrator [current_name]")
		H.add_stats(rand(18,20), rand(18,20), rand(15,19), rand(15,16)) //intelligence only buffs surgery shit, don't buff it
		H.add_skills(rand(10,11),rand(8,10),rand(3,6),3,rand(2,5)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_inquisition)

		to_chat(H, "<span class='notice'><b><font size=3>You are an Arbitrator, in service to the Adeptus Arbites -- after a long journey across the sub-sector, you have arrived planetside and can begin your holy work bringing judgement to this planet. Your ultimate loyalty being to Holy Terra herself and the judiciary arm of the Adeptus Arbites.</font></b></span>")


//Outfits

/decl/hierarchy/outfit/job/ig/enforcer
	name = OUTFIT_JOB_NAME("Planetary Enforcer")
	head = /obj/item/clothing/head/helmet/guardhelmet/patrol
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit = /obj/item/clothing/suit/armor/enforcer
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/melee/baton/loaded
	id_type = /obj/item/card/id/dog_tag/guardsman
	r_pocket = /obj/item/storage/box/coin
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty/magrave
	l_hand = /obj/item/device/flashlight/lantern
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/handcuffs = 2,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/marshal
	name = OUTFIT_JOB_NAME("Planetary Marshal")
	head = /obj/item/clothing/head/helmet/guardhelmet/patrol
	uniform = /obj/item/clothing/under/rank/marshal
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	r_pocket = /obj/item/device/flashlight/lantern
	suit = /obj/item/clothing/suit/armor/enforcer/marshal
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/revolver/mateba
	id_type = /obj/item/card/id/dog_tag/guardsman
	r_pocket = /obj/item/storage/box/coin
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/entertainment
	suit_store = null
	backpack_contents = list(
	/obj/item/ammo_magazine/c50/ms = 1,
	/obj/item/handcuffs = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
	)

/decl/hierarchy/outfit/job/ig/investigator
	name = OUTFIT_JOB_NAME("Planetary Investigator")
	uniform = /obj/item/clothing/under/rank/marshal
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	r_pocket = /obj/item/device/flashlight/lantern
	suit = /obj/item/clothing/suit/storage/det_trench
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/revolver/mateba
	id_type = /obj/item/card/id/dog_tag/guardsman
	r_pocket = /obj/item/storage/box/coin
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/entertainment
	suit_store = null
	backpack_contents = list(
	/obj/item/ammo_magazine/c50/ms = 1,
	/obj/item/handcuffs = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
	)

/decl/hierarchy/outfit/job/ig/cadet
	name = OUTFIT_JOB_NAME("Enforcer Cadet")
	head = null
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	suit = /obj/item/clothing/suit/armor/vest
	r_hand = /obj/item/melee/baton/loaded
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/energy/las/laspistol/shitty
	id_type = /obj/item/card/id/dog_tag/guardsman
	r_pocket = /obj/item/storage/box/coin
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile/shotgun/pump/voxlegis
	backpack_contents = list(
	/obj/item/handcuffs = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/ammo_box/shotgun/stunshell = 1,
	/obj/item/stack/thrones2/five = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


/decl/hierarchy/outfit/job/ig/arbitrator
	name = OUTFIT_JOB_NAME("Adeptus Arbitrator")
	head = null
	uniform = /obj/item/clothing/under/rank/marshal
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	r_pocket = /obj/item/device/flashlight/lantern
	l_hand = null
	r_hand = /obj/item/melee/powermaul
	r_pocket = /obj/item/storage/box/coin
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator
	suit = /obj/item/clothing/suit/armor/arbitrator
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/bolter_pistol
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/entertainment
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty/magrave
	backpack_contents = list( // 1 stun 1 buck box
	/obj/item/handcuffs = 1,
	/obj/item/ammo_box/shotgun/msslug = 2,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 1,
	/obj/item/stack/thrones2/twenty = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
