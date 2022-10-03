// Enforcers

/datum/job/enforcer
	title = "Planetary Enforcer"
	supervisors = "the Planetary Marshal and the Rogue Trader"
	total_positions = 3
	spawn_positions = 3
	social_class = SOCIAL_CLASS_MED
	selection_color = "#848484"
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

		to_chat(H, "<span class='notice'><b><font size=3>You are a proud officer of the Magistratum, your duty is to uphold Imperial law on this planet amongst the Pilgrims and to assist the Rogue Trader where necessary. Your duties involve the investigation of crimes committed on behalf of the magistratum, collection of tithes and the interrogation or execution of criminals apprehended by the Magistratum. For a list of laws, read here : https://wiki-40k.herokuapp.com/index.php?title=Messina_Law</font></b></span>")

/datum/job/marshal
	title = "Planetary Marshal"
	head_position = 1
	supervisors = "the Rogue Trader"
	total_positions = 1
	spawn_positions = 1
	social_class = SOCIAL_CLASS_HIGH
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/ig/marshal
	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 10
	lmg_skill = 9
	smg_skill = 9
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = SEC|COM
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
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_village,)

		to_chat(H, "<span class='notice'><b><font size=3>You are the Marshal appointed by the Magistratum,, your duty is to uphold Imperial law on this planet amongst the Pilgrims and to assist the Rogue Trader where necessary. Your duties involve the investigation of crimes committed on behalf of the magistratum, collection of tithes and the interrogation or execution of criminals apprehended by the Magistratum.</font></b></span>")

/*/datum/job/arbites
	title = "Adeptus Arbites"
	total_positions = 2
	spawn_positions = 2
	social_class = SOCIAL_CLASS_MIN
	outfit_type = /decl/hierarchy/outfit/job/redsoldier/sentry
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 10
	smg_skill = 3
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Arbites [current_name]")
		H.add_stats(18, rand(10,16), rand(15,18))
		H.say(";Arbites reporting for duty!")
*/ //ill find a job for these guys one day
/*All of this will need to be redone/re-pointed to once we have actual sprites to use - wel
Begin Warhammer loadouts
*/

//Outfits

/decl/hierarchy/outfit/job/ig/enforcer
	name = OUTFIT_JOB_NAME("Planetary Enforcer")
	head = null
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	suit = /obj/item/clothing/suit/armor/enforcer
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	r_hand = /obj/item/melee/baton/loaded
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/slugrevolver
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty/magrave
	backpack_contents = list(
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/ammo_magazine/box/shotgun/stun = 1,
	/obj/item/handcuffs = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2/five = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/marshal
	name = OUTFIT_JOB_NAME("Planetary Marshal")
	head = null
	uniform = /obj/item/clothing/under/rank/marshal
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	r_pocket = /obj/item/device/flashlight/lantern
	l_hand = /obj/item/gun/projectile/revolver/mateba
	suit = /obj/item/clothing/suit/armor/marshal
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/gun/projectile/revolver/cpt/marshal
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/entertainment
	suit_store = null
	backpack_contents = list(
	/obj/item/ammo_magazine/c50/ms = 3,
	/obj/item/handcuffs = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
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