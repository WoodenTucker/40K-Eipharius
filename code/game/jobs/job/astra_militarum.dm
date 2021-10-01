// IG Datum

/datum/job/ig
	title = "IGDATUM"
	supervisors = "The Commissar and your Sergeant."
	total_positions = 0
	spawn_positions = 0
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/ig //will need to be replaced eventually - wel
	selection_color = "#33813A"
	department_flag = SEC
	auto_rifle_skill = 10 //This is leftover from coldfare, but we could go back to that one day so better not to mess with it.
	semi_rifle_skill = 10
	sniper_skill = 3
	shotgun_skill = 6
	lmg_skill = 3
	smg_skill = 3
	open_when_dead = TRUE
	announced = FALSE
	can_be_in_squad = TRUE
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_armory
			            )

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(12,16), rand(10,16), rand(8,14), rand (8,11))
		H.add_skills(rand(10,16))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("Guardsman [H.real_name]")
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
		to_chat(H, "<span class='notice'><b><font size=3>You are a soldier of the Imperium. Obey your Sergeant and Commissar. The Emperor Protects. </font></b></span>")
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch,
		/mob/living/carbon/human/proc/regimentselection,)

// Guardsmen

/datum/job/ig/guardsman
	title = "Imperial Guardsman"
	total_positions = 20
	spawn_positions = 20

// Sergeants

/datum/job/ig/sergeant
	title = "Sergeant"
	supervisors = "The Commissar and Astartes Envoy."
	total_positions = 2
	spawn_positions = 2
	selection_color = "#33813A"
	outfit_type = /decl/hierarchy/outfit/job/ig/sergeant
	can_be_in_squad = FALSE //They have snowflake shit for squads.
	department_flag = SEC|COM
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory
			            )

	shotgun_skill = 10
	lmg_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.verbs += /mob/living/carbon/human/proc/morale_boost
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(12,17), rand(10,16), rand(10,14), rand(10,13))
		H.add_skills(rand(7,10),rand(8,10),rand(0,3),0,0)
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
		H.assign_squad_leader(IMPERIUM)
		H.warfare_faction = IMPERIUM
		H.fully_replace_character_name("Sergeant [current_name]")
		to_chat(H, "<span class='notice'><b><font size=3>You are a Sergeant of the Imperial Guard. Round up some guardsmen and construct your own squad. You are to be a beacon of discipline and order amongst your men, let your behavior reflect this.</font></b></span>")
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch,
		/mob/living/carbon/human/proc/sergeantselection,)

// Combat Medicae

/datum/job/ig/Paramedic
	title = "Combat Medicae"
	department = "Medical"
	department_flag = SEC|MED
	social_class = SOCIAL_CLASS_MED
	can_be_in_squad = TRUE
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sister Hospitaller and the Commissar"
	selection_color = "#967096"
	economic_modifier = 4
	minimal_player_age = 4
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist, access_sec_doors, access_security)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_eva, access_maint_tunnels, access_external_airlocks,access_sec_doors,access_security)
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 5
	ranged_skill = 5
	medical_skill = 8
	engineering_skill = 0
	surgery_skill = 5

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		H.warfare_faction = IMPERIUM
		..()
		H.fully_replace_character_name("Medicae [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM, "medic")
		H.add_stats(rand(11,14), rand(11,14), rand(12,15), rand(12,15))
		H.get_equipped_item(slot_s_store)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a combat medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")


// Commissar

/datum/job/ig/commissar
	title = "Commissar"
	supervisors = "the astartes envoy"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#004e07"
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_HIGH
	outfit_type = /decl/hierarchy/outfit/job/ig/commissar
	can_be_in_squad = FALSE
	sniper_skill = 10
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	open_when_dead = FALSE
	department_flag = COM|SEC
	latejoin_at_spawnpoints = TRUE

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Commissar [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,17), rand(10,16), rand(10,14), rand(14,16))
		H.add_skills(rand(14,18))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are an Imperial Commissar. You are the acting head of the Guard force on this planet. The mission is all, maintain morale and maintain discipline. Do not be afraid to execute an unruly guardsmen. </font></b></span>")

		var/obj/O = H.get_equipped_item(slot_s_store)
		if(O)
			qdel(O)
		H.verbs += list(
			/mob/living/carbon/human/proc/help_me,
			/mob/living/carbon/human/proc/retreat,
			/mob/living/carbon/human/proc/announce,
			/mob/living/carbon/human/proc/give_order,
			/mob/living/carbon/human/proc/check_reinforcements
		)


// Outfits

// IG Outfit Datum

/decl/hierarchy/outfit/job/ig
	name = OUTFIT_JOB_NAME("IGDATUM")
	head = null
	uniform = null
	shoes = null
	l_pocket = null
	suit = null
	gloves = null
	back = null
	pda_slot = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = null
	l_hand = null
	l_ear = null
	r_ear = null
	belt = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

// Guardsman

/decl/hierarchy/outfit/job/ig/guardsman
	name = OUTFIT_JOB_NAME("Imeperial Guardsman")
	head = null
	uniform = null
	shoes = null
	l_pocket = null
	suit = null
	gloves = null
	back = null
	pda_slot = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = null
	l_hand = null
	l_ear = null
	r_ear = null
	belt = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

// Sergeant

/decl/hierarchy/outfit/job/ig/sergeant
	name = OUTFIT_JOB_NAME("Imperial Guard Sergeant")
	glasses = /obj/item/clothing/glasses/cadiangoggles
	head = null
	uniform = null
	shoes = null
	l_pocket = null
	suit = null
	gloves = null
	back = null
	pda_slot = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = null
	l_ear = null
	r_ear = null
	belt = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


// Commissar

/decl/hierarchy/outfit/job/ig/commissar
	name = OUTFIT_JOB_NAME("Commissar")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/color/black
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/commissar
	head = /obj/item/clothing/head/commissar
	l_pocket = /obj/item/storage/box/ifak
	l_ear = /obj/item/device/radio/headset/red_team
	belt = /obj/item/material/sword/commissword
	l_hand = /obj/item/gun/projectile/bolter_pistol
	r_pocket = /obj/item/device/binoculars
	pda_slot = null
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	backpack_contents = list(
	 /obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	 /obj/item/grenade/smokebomb = 1,
	 /obj/item/device/flashlight/lantern = 1,
	 /obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/five = 1,
)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

// REGIMENT SELECTION

// TROOPER REGIMENT SELECTION

/mob/living/carbon/human/proc/regimentselection()
	set name = "Select your regiment"
	set category = "Guardsmen"
	set desc = "Choose your regiment"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	var/mob/living/carbon/human/U = src
	var/chapter = list("Cadian", "Krieger", "Catachan", "Valhallan") //lists all possible chapters
	var/chapterchoice = input("Choose your regiment", "Available regiments") as anything in chapter

	switch(chapterchoice)
		if("Krieger")
			var/troopnum = rand(1,50000)
			src.name = "Guardsman [troopnum]"
			src.real_name = "Guardsman [troopnum]"
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/krieger, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/krieger, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, slot_gloves)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/shovel, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun/luscius, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(
			/mob/living/carbon/human/proc/regimentselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
			W.assignment = "Krieg Guardsman"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Cadian")
			equip_to_slot_or_del(new /obj/item/clothing/under/cadian_uniform, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/guardsman, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/guardhelmet, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half/cadianrespirator, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/cadiangoggles, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/cadian, slot_gloves)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(/mob/living/carbon/human/proc/regimentselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
			W.assignment = "Cadian Guardsman"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Catachan")
			equip_to_slot_or_del(new /obj/item/clothing/under/casual_pants/catachan, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/head/catachan, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/CatachanVest, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun/tinkered/lascarbine, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/cadian, slot_gloves)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(/mob/living/carbon/human/proc/regimentselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
			W.assignment = "Catachan Guardsman"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
		if("Valhallan")
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/valhallan_uniform, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/head/valushanka, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/valhallanarmor, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/cadian, slot_gloves)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(/mob/living/carbon/human/proc/regimentselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
			W.assignment = "Valhallan Guardsman"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

/// SERGEANT REGIMENT SELECTION

/mob/living/carbon/human/proc/sergeantselection()
	set name = "Select your regiment"
	set category = "Regimental Sergeant Position"
	set desc = "Choose your regiment"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	var/mob/living/carbon/human/U = src
	var/static/list/chapter = list("Cadian", "Krieger", "Catachan", "Valhallan") //lists all possible chapters
	if(!length(chapter))
		chapter = list("Cadian", "Krieger", "Catachan", "Valhallan")
	var/chapterchoice = input("Choose your regiment", "Available regiments") as anything in chapter
	if(chapterchoice)
		chapter -= chapterchoice

	switch(chapterchoice)
		if("Krieger")
			var/troopnum = rand(1,50000)
			src.name = "Watchmaster [troopnum]"
			src.real_name = "Watchmaster [troopnum]"
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/kriegsgt, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/krieger, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, slot_gloves)
			equip_to_slot_or_del(new /obj/item/melee/mercycs, slot_belt)
			equip_to_slot_or_del(new /obj/item/shovel, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/stubber, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(
			/mob/living/carbon/human/proc/sergeantselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
			W.assignment = "Krieg Watchmaster"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Cadian")
			equip_to_slot_or_del(new /obj/item/clothing/under/cadian_uniform, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/cadiansgt, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/guardhelmet, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/cadian, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/melee/mercycs, slot_belt)
			equip_to_slot_or_del(new /obj/item/melee/mercycs, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half/cadianrespirator, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/cadiangoggles/elite, slot_glasses)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/cadian, slot_gloves)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/stubber, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(/mob/living/carbon/human/proc/sergeantselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
			W.assignment = "Cadian Sergeant"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Catachan")
			equip_to_slot_or_del(new /obj/item/clothing/under/casual_pants/catachan, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/head/catachan, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/catachansgt, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/cadian, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/melee/mercycs, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/cadian, slot_gloves)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/stubber, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(/mob/living/carbon/human/proc/sergeantselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
			W.assignment = "Catachan Sergeant"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Valhallan")
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/valhallan_uniform, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/head/valushanka, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/valhallasgt, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/cadian, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak, slot_l_store)
			equip_to_slot_or_del(new /obj/item/melee/mercycs, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/cadian, slot_gloves)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/stubber, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/box/a556/mg08, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/five, slot_in_backpack)
			U.verbs -= list(/mob/living/carbon/human/proc/sergeantselection,)

			var/obj/item/card/id/dog_tag/guardsman/W = new

			W.icon_state = "tagred"
			W.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
			W.assignment = "Valhallan Sergeant"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
