// Enforcers

/datum/job/enforcer
	title = "Planetary Enforcer"
	supervisors = "the Rogue Trader"
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
	medical_skill = 3
	engineering_skill = 2
	surgery_skill = 3
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels,)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,18), rand(12,16), rand(12,16), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(9,10),rand(7,10),rand(3,5),3,rand(2,4)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
//		H.witchblood() //Psyker Enforcers don't exist
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		var/corruption = rand(1,8)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh,
				/mob/living/carbon/human/proc/tzeentch)
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,)

		to_chat(H, "<span class='notice'><b><font size=3>You are a proud officer of the Magistratum, your duty is to uphold Imperial law on this planet amongst the Pilgrims and to assist the Rogue Trader where necessary. Your duties involve the investigation of crimes committed on behalf of the magistratum, collection of tithes and the interrogation or execution of criminals apprehended by the Magistratum.</font></b></span>")

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
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	suit = /obj/item/clothing/suit/armor/enforcer
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/melee/baton/loaded
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	l_hand = /obj/item/device/flashlight/lantern
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/handcuffs = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/arbitrator
	name = OUTFIT_JOB_NAME("Magistratum Arbitrator")
	uniform = /obj/item/clothing/under/color/brown
	suit = /obj/item/clothing/suit/armor/enforcer/arbitrator
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/baton/loaded
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/handcuffs = 1,
	/obj/item/gun/projectile/bolter_pistol = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)