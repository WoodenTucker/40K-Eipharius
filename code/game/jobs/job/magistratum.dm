// Enforcers

/datum/job/enforcer
	title = "Enforcer"
	supervisors = "The Inquisition firstly, the Governorship secondly"
	total_positions = 2
	spawn_positions = 2
	social_class = SOCIAL_CLASS_MED
	selection_color = "#f0ac25"
	outfit_type = /decl/hierarchy/outfit/job/ig/enforcer
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 9
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 20
	alt_titles = list(
		"Senior Enforcer" = /decl/hierarchy/outfit/job/ig/enforcer,
		"Enforcer" = /decl/hierarchy/outfit/job/ig/enforcer,
		)
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = SEC
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi,
			            access_all_personal_lockers, access_village,)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Enforcer [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,18), rand(12,16), rand(12,16), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,5),3,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,)

		to_chat(H, "<span class='notice'><b><font size=3> An Enforcer in the Magisterium. The Governership order you. Yet the Inquisition can override them. Patrol with the cadets. Make sure they know what they’re doing. Collect taxes and ensure the order of the world is peaceful and good. Be an undercover cop if you’re feeling ballsy.</font></b></span>")

/datum/job/cadet
	title = "Enforcer Cadet"
	supervisors = "The Inquisition firstly, Governorship secondly"
	total_positions = 2
	spawn_positions = 2
	social_class = SOCIAL_CLASS_MED
	selection_color = "#f0ac25"
	outfit_type = /decl/hierarchy/outfit/job/ig/cadet
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 7
	lmg_skill = 5
	smg_skill = 5
	cultist_chance = 0
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = SEC
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi,
			            access_all_personal_lockers, access_village,)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Cadet [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,18), rand(12,16), rand(12,16), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(6,8),rand(6,8),rand(3,5),3,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,)

		to_chat(H, "<span class='notice'><b><font size=3> (NEW PLAYER ROLE) A cadet in the Magisterium. The Governership order you. Yet the Inquisition can override them. Your job is to assist the other enforcers in punishing crime and collecting taxes. </font></b></span>")

/datum/job/arbitrator
	title = "Arbitrator"
	head_position = 1
	supervisors = "The Law, Inquisitor and Interrogator"
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
	department_flag = SEC
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth)
	minimal_access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_medical, access_village, access_administratum, access_change_ids, access_keycard_auth
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Arbitrator [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(18,20), rand(18,20), rand(15,19), rand(15,16)) //intelligence only buffs surgery shit, don't buff it
		H.add_skills(rand(10,11),rand(8,10),rand(3,6),3,rand(2,5)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village, access_inquisition)

		to_chat(H, "<span class='notice'><b><font size=3>You are an Arbitrator, in the Retinue of the Interrogator. Your task is to train the local enforcers and ensure order. You overrule anyone, with authority from Holy Terra Itself.</font></b></span>")

//Outfits

/decl/hierarchy/outfit/job/ig/enforcer
	name = OUTFIT_JOB_NAME("Planetary Enforcer")
	head = null
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak
	suit = /obj/item/clothing/suit/armor/enforcer
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	r_hand = /obj/item/melee/baton/loaded
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/revolver/boscelot
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/projectile/shotgun/pump/voxlegis
	backpack_contents = list(
	/obj/item/ammo_magazine/c44 = 2,
	/obj/item/handcuffs = 1,
	/obj/item/ammo_box/shotgun/stunshell = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/stack/thrones2/five = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/cadet
	name = OUTFIT_JOB_NAME("Enforcer Cadet")
	head = null
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots // /obj/item/stack/medical/bruise_pack
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	suit = /obj/item/clothing/suit/armor/vest
	r_hand = /obj/item/melee/baton/loaded
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/energy/las/laspistol/shitty
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
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
	r_hand = /obj/item/melee/baton/powermaul
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator
	suit = /obj/item/clothing/suit/armor/enforcer2/arbitrator
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/revolver/agripinaa
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/entertainment
	suit_store = /obj/item/gun/projectile/shotgun/pump/voxlegis
	backpack_contents = list( // 1 stun 1 buck box
	/obj/item/handcuffs = 1,
	/obj/item/ammo_magazine/c44 = 2,
	/obj/item/ammo_box/shotgun/stunshell = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/stack/thrones2/twenty = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
/* // this isn't used rn.
/decl/hierarchy/outfit/job/ig/arbitrator
	name = OUTFIT_JOB_NAME("Magistratum Arbitrator")
	uniform = /obj/item/clothing/under/color/brown
	suit = /obj/item/clothing/suit/armor/enforcer/arbitrator
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/baton/loaded
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	l_ear = /obj/item/device/radio/headset/entertainment
	backpack_contents = list(
	/obj/item/handcuffs = 1,
	/obj/item/gun/projectile/bolter_pistol = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)
	*/
