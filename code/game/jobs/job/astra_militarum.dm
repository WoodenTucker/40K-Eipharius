// IG Datum

/datum/job/ig
	title = "IGDATUM" // IMPERIAL GUARDSMAN ROLE
	supervisors = "The Commissar and your Sergeant."
	total_positions = 0
	spawn_positions = 0
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/ig //will need to be replaced eventually - wel
	selection_color = "#33813A"
	department_flag = SEC
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 8
	lmg_skill = 7
	smg_skill = 8
	open_when_dead = FALSE
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
		H.add_stats(rand(12,16), rand(12,16), rand(12,16), rand (8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,6),rand(1,4),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("[H.real_name]")
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
		to_chat(H, "<span class='notice'><b><font size=3>You are a soldier of the Imperium. The Emperor Protects. </font></b></span>")
		var/troopnum = rand(1,50000)
		switch(title)
			if("Krieg Guardsman")
				H.fully_replace_character_name("Guardsman [troopnum]")
				H.implant_loyalty(src)
		H.verbs += list(
		/mob/living/carbon/human/proc/igattack,
		/mob/living/carbon/human/proc/igcanthold,
		/mob/living/carbon/human/proc/igcharge,
		/mob/living/carbon/human/proc/igemperorprotects,
		/mob/living/carbon/human/proc/igholdline,
		/mob/living/carbon/human/proc/iginhisname,
		/mob/living/carbon/human/proc/igregroup,
		/mob/living/carbon/human/proc/igretreat,
		/mob/living/carbon/human/proc/igrunforlifes,
		/mob/living/carbon/human/proc/igyessir)
		H.verbs -= list(/mob/living/carbon/human/verb/emoteemperorprotects)

// Guardsmen

/datum/job/ig/guardsman
	title = "Imperial Guardsman"
	total_positions = 7
	spawn_positions = 7
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 8
	lmg_skill = 7
	smg_skill = 8
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/guardsman
	alt_titles = list(
		"Cadian Guardsman" = /decl/hierarchy/outfit/job/guardsman,
		"Catachan Jungle Hunters" = /decl/hierarchy/outfit/job/guardsman/catachan,
		"Krieg Guardsman" = /decl/hierarchy/outfit/job/guardsman/krieg,
		"Valhallan Ice Warriors" = /decl/hierarchy/outfit/job/guardsman/valhallan
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(14,16), rand(14,16), rand(12,16), rand (8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,6),rand(1,4),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		if(title == "Krieg Guardsman")
			var/troopnum = rand(1,50000)
			H.fully_replace_character_name("Guardsman [troopnum]")
		else H.fully_replace_character_name("[H.real_name]")
		var/corruption = rand(1,8)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh)
		H.assign_random_quirk()
		H.witchblood()

		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
		to_chat(H, "<span class='notice'><b><font size=3>   You are an Imperial Guardsmen selected personally by the Lord Trader to serve as the primary source of manpower and security within their retinue, your services go beyond the wielding of your lasgun and may involve tasks varying from hard labour, exploration and peacekeeping -- up until the point in which it is decided you must lay down your life to protect the citizens of The Imperium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   The Astra Militarum, also known as the Imperial Guard in colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They serve as the Imperium of Man's primary combat force and first line of defence from the myriad threats which endanger the existence of the Human race in the 41st Millennium. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>   There is no universal uniform or regimental command hierarchy in the Astra Militarum, although it is compulsory for every regiment to have at least one commissar to maintain the discipline and morale of the troops while watching for any signs of corruption or heretical taint in the ranks. </font></b></span>")

		if(title == "Krieg Guardsman")
			H.add_skills(rand(7,10),rand(6,10),rand(3,6),rand(3,6),rand(1,3))
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			H.implant_loyalty(src)
		switch(title)
			if("Cadian Guardsman" || "Valhallan Ice Warrior" || "Catachan Jungle Hunter")
				if(title == "Catachan Jungle Hunter")
					H.add_skills(rand(8,10),rand(7,10),rand(3,6),rand(1,4),rand(1,3))
				if(title == "Valhallan Ice Warrior")
					H.add_skills(rand(7,10),rand(8,10),rand(3,6),rand(1,4),rand(1,3))
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)

//Whiteshield

/datum/job/ig/whiteshield
	title = "Imperial Guard Conscript"
	total_positions = 3
	spawn_positions = 3
	open_when_dead = FALSE
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/whiteshield
	can_be_in_squad = FALSE
	auto_rifle_skill = 8
	semi_rifle_skill = 7
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 7

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(12,14), rand(12,14), rand(12,14), rand (8,14))
		H.add_skills(rand(6,9),rand(3,7),rand(1,2),rand(1,3),rand(1,2)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		H.fully_replace_character_name("[H.real_name]")
		var/corruption = rand(1,6)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh)
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
		to_chat(H, "<span class='notice'><b><font size=3>Conscripts are units within the Imperial Guard that consist of normal Imperial citizens with little or no military training, new Guard recruits who have not yet entered training, children of an already extant regiment's troops or standing Guardsmen who have not yet completed their training. Sometimes, in military emergencies, the Imperium's need for manpower is so great that normal Imperial citizens will simply find themselves conscripted by their local Imperial Guard regiment. </font></b></span>")

//Sharpshooters

/datum/job/ig/guardsman/sharpshooter
	title = "Imperial Guard Sharpshooter"
	total_positions = 1
	spawn_positions = 1
	open_when_dead = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sharpshooter
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 11
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 8
	alt_titles = list(
		"Cadian Sharpshooter" = /decl/hierarchy/outfit/job/sharpshooter,
		"Valhallan Ice Warriors" = /decl/hierarchy/outfit/job/guardsman/valhallan
		)

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,15), rand(14,16), rand(14,16), rand (10,16)) //if you are a SNIPA you must be atleast a bit smarter than your average goardsoman
		H.add_skills(rand(6,10),rand(9,10),rand(3,6),rand(1,4),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("[H.real_name]")
		var/corruption = rand(1,5)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh)
		H.assign_random_quirk()
		H.witchblood()

		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
		to_chat(H, "<span class='notice'><b><font size=3>You are the fine tool of the Astra Militarum, landing precise strikes upon the enemies. You can see controls in top right -> OOC tab -> View Controls.  The Emperor Protects. </font></b></span>")

		switch(title)
			if("Cadian Sharpshooter" || "Valhallan Sharpshooter")
				if(title == "Valhallan Sharpshooter")
					H.add_skills(rand(6,10),rand(9,10),rand(3,6),rand(1,4),rand(1,3))
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)

// Sergeants

/datum/job/ig/sergeant
	title = "Sergeant"
	supervisors = "The Rogue Trader."
	total_positions = 2
	spawn_positions = 2
	open_when_dead = FALSE
	selection_color = "#33813A"
	outfit_type = /decl/hierarchy/outfit/job/sergeant
	alt_titles = list(
		"Cadian Sergeant" = /decl/hierarchy/outfit/job/sergeant,
		"Catachan Sergeant" = /decl/hierarchy/outfit/job/sergeant/catachan,
		"Krieg Quartermaster" = /decl/hierarchy/outfit/job/sergeant/krieg,
		"Valhallan Sergeant" = /decl/hierarchy/outfit/job/sergeant/valhallan
		)
	can_be_in_squad = FALSE //They have snowflake shit for squads.
	department_flag = SEC|COM
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory
			            )

	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9

	equip(var/mob/living/carbon/human/H)
		..()
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,17), rand(14,17), rand(14,18), rand(13,15))
		H.add_skills(rand(8,10),rand(9,10),rand(5,7),5,rand(4,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_squad_leader(IMPERIUM)
		H.warfare_faction = IMPERIUM
		var/corruption = rand(1,10)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh)

		if(title == "Krieg Guardsman")
			var/watchnum = rand(1,50000)
			H.fully_replace_character_name("Guardsman [watchnum]")
		else H.fully_replace_character_name("Sergeant [H.real_name]")

		if(title == "Krieg Quartermaster")
			H.add_skills(rand(8,10),rand(9,10),rand(7,10),6,rand(4,6))
			H.set_quirk(new/datum/quirk/brave())
			H.set_trait(new/datum/trait/death_tolerant())
			H.implant_loyalty(src)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Krieg Quartermaster, you are brave just like a normal kriegsman, but, you are also smarter making your lifespan twice as good as that of your fellow kriegsman, you are a beacon of discipline, and remember, if your squad's trenches are horrible, its your fault.</font></b></span>")
		switch(title)
			if("Cadian Sergeant" || "Valhallan Sergeant" || "Catachan Sergeant")
				if(title == "Catachan Sergeant")
					H.add_skills(rand(9,11),rand(9,10),rand(5,7),5,rand(4,6))
				if(title == "Valhallan Sergeant")
					H.add_skills(rand(8,10),rand(10,11),rand(5,7),5,rand(4,6))
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)

// Combat Medicae

/datum/job/ig/medicae
	title = "Combat Medicae"
	department = "Medical"
	department_flag = SEC|MED
	social_class = SOCIAL_CLASS_MED
	can_be_in_squad = TRUE
	total_positions = 2
	spawn_positions = 2
	open_when_dead = FALSE
	supervisors = "The Rogue Trader"
	selection_color = "#967096"
	economic_modifier = 4
	minimal_player_age = 18
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist, access_sec_doors, access_security)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_eva, access_maint_tunnels, access_external_airlocks,access_sec_doors,access_security)
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 7
	shotgun_skill = 9
	lmg_skill = 8
	smg_skill = 9

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		H.warfare_faction = IMPERIUM
		..()
		H.fully_replace_character_name("Medicae [current_name]")
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		var/corruption = rand(1,15)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh)
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM, "medic")
		H.add_stats(rand(12,16), rand(12,17), rand(12,15), rand(12,16)) //dodgy as fuck, would probably dodge a bullet even if it meant killing the comrade behind them
		H.add_skills(rand(7,10),rand(8,10),rand(7,10),rand(3,5),rand(6,10)) //melee, ranged, med, eng, surgery
		H.get_equipped_item(slot_s_store)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		to_chat(H, "<span class='notice'><b><font size=3>You are a combat medicae. Your purpose is to both fight the enemies of the Imperium and to triage the wounded and ensure they survive long enough to be seen by a Sister Hospitaller. You have medical training but little surgical training so avoid field surgery unless absolutely necessary</font></b></span>")


// Commissar

/datum/job/ig/commissar
	title = "Commissar"
	supervisors = "the Rogue Trader and his Astartes Bodyguard."
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#004e07"
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_HIGH
	outfit_type = /decl/hierarchy/outfit/job/ig/commissar
	/*alt_titles = list(
		"Cadian Lieutenant" = /decl/hierarchy/outfit/job/ig/lieutenant
	)
	*/
	alt_titles = list(
		"Krieg Commissar" = /decl/hierarchy/outfit/job/ig/commissar/krieg,
		"Catachan Commissar" = /decl/hierarchy/outfit/job/ig/commissar/catachan
		)
	can_be_in_squad = FALSE
	auto_rifle_skill = 9 //commissars are more trained than almost any guardsman
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9
	open_when_dead = FALSE
	department_flag = COM|SEC
	latejoin_at_spawnpoints = TRUE

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Commissar [current_name]")
		var/corruption = rand(1,30)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh,
				/mob/living/carbon/human/proc/tzeentch)
		H.set_quirk(new/datum/quirk/brave())
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,18), rand(13,18), rand(12,16), rand(16,17))
		H.add_skills(rand(9,10),rand(9,10),6,5,3) //commissars are heavily trained
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>The commissar is empowered to use any means necessary to ensure the loyalty and moral purity of his or her charges, including overriding or even executing a regiment's commanding officer if necessary, and so is regarded with a mixture of fear and admiration by rank-and-file Guardsmen -- and not a few of their officers. Commissars provide the link between regimental officers and the Departmento Munitorum. They are tough, ruthless individuals whose primary responsibilities are to preserve the courage, discipline and loyalty of the regiment. Only a handful of commissars have ever obtained leadership over large Imperial forces as a lord commander, or even a governor militant, such as Yarrick at Armageddon, and only a handful are known to have even retained full command of an entire regiment, such as Colonel-Commissar Ibram Gaunt. All commissars are trained as excellent orators, and often deliver stirring speeches to their regiment or company prior to battle. During battle, the commissar is almost always amongst the front lines, and roars a litany of battle cries and prayers to the Emperor to inspire his troops to battle. </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>(READ THIS) Your role like any others is to make the round more interesting, you will be punished if you metagame lateparties, murder allied characters without good reason OR force people to dig trenches round start. Period. You are an officer of the Commesariert, there's more you can do then pretend to be an infantry officer. </font></b></span>")
		H.verbs -= list(
		/mob/living/carbon/human/proc/igattack,
		/mob/living/carbon/human/proc/igcanthold,
		/mob/living/carbon/human/proc/igcharge,
		/mob/living/carbon/human/proc/igemperorprotects,
		/mob/living/carbon/human/proc/igholdline,
		/mob/living/carbon/human/proc/iginhisname,
		/mob/living/carbon/human/proc/igregroup,
		/mob/living/carbon/human/proc/igretreat,
		/mob/living/carbon/human/verb/emoteemperorprotects,
		/mob/living/carbon/human/proc/igrunforlifes,
		/mob/living/carbon/human/proc/igyessir)
		H.verbs += list(
		/mob/living/carbon/human/proc/comsaimtrue,
		/mob/living/carbon/human/proc/comsfaceus,
		/mob/living/carbon/human/proc/comsfearme,
		/mob/living/carbon/human/proc/comsfirsttodie,
		/mob/living/carbon/human/proc/comsflee,
		/mob/living/carbon/human/proc/comsgloryepmeror,
		/mob/living/carbon/human/proc/comsmyscars,
		/mob/living/carbon/human/proc/comsmywrath,
		/mob/living/carbon/human/proc/comsretreatnotoption,
		/mob/living/carbon/human/proc/comsservingme,
		/mob/living/carbon/human/proc/comsshallbedone,
		/mob/living/carbon/human/proc/comssomeonehead,
		/mob/living/carbon/human/proc/comsstrikeem,
		/mob/living/carbon/human/proc/comstovictory,
		/mob/living/carbon/human/proc/comswhowithme,
		/mob/living/carbon/human/proc/comswillnotfail,
		/mob/living/carbon/human/proc/comswillwhip,
		/mob/living/carbon/human/proc/comsyoucannotstand,
		/mob/living/carbon/human/proc/comsyouwereweak)


/*
		H.verbs -= list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch,)*/

		var/obj/O = H.get_equipped_item(slot_s_store)
		if(O)
			qdel(O)

// Outfits

// IG Outfits

// Guardsman

/decl/hierarchy/outfit/job/whiteshield
	name = OUTFIT_JOB_NAME("Imperial Guard Conscript")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/whiteshield
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/guardsman
	name = OUTFIT_JOB_NAME("Cadian Guardsman")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/guardsman/krieg
	name = OUTFIT_JOB_NAME("Krieg Guardsman")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/krieger
	back = /obj/item/storage/backpack/satchel/krieger
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/lucius
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel = 1
	)

/decl/hierarchy/outfit/job/guardsman/catachan
	name = OUTFIT_JOB_NAME("Catachan Jungle Fighter")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachan
	head = /obj/item/clothing/head/catachan
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	mask = null
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/catachan
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

/decl/hierarchy/outfit/job/guardsman/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Ice Warrior")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	head = /obj/item/clothing/head/valushanka
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

///Sharpshooter

/decl/hierarchy/outfit/job/sharpshooter
	name = OUTFIT_JOB_NAME("Cadian Sharpshooter")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun/longlas
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/sharpshooter/valhalla
	name = OUTFIT_JOB_NAME("Valhallan Sharpshooter")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_box/rifle
	suit_store = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/brifle_handful = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

// Sergeant

/decl/hierarchy/outfit/job/sergeant
	name = OUTFIT_JOB_NAME("Cadian Sergeant")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/cadiansgt
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/mercycs
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/automatic/stubber
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08 = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/sergeant/krieg
	name = OUTFIT_JOB_NAME("Krieg Watchmaster")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/kriegsgt
	back = /obj/item/storage/backpack/satchel/krieger
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	suit_store = /obj/item/gun/launcher/rcl_rifle
	backpack_contents = list(
	/obj/item/ammo_casing/heat_shell = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel = 1
	)

/decl/hierarchy/outfit/job/sergeant/catachan
	name = OUTFIT_JOB_NAME("Catachan Sergeant")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachansgt
	belt = /obj/item/melee/mercycs
	shoes = /obj/item/clothing/shoes/jackboots/catachan
	head = /obj/item/clothing/head/catachan
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun/tinkered/catachan
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

/decl/hierarchy/outfit/job/sergeant/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Sergeant")
	uniform =  /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallasgt
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/automatic/stubber
	neck = /obj/item/reagent_containers/food/drinks/canteen/valhallan
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08 = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

// Commissar

/decl/hierarchy/outfit/job/ig/commissar
	name = OUTFIT_JOB_NAME("Cadian Commissar")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/commissar
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/material/sword/commissword
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/commissar
	head = /obj/item/clothing/head/commissar
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/binoculars
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/grenade/smokebomb = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/commissar/krieg
	name = OUTFIT_JOB_NAME("Krieg Commissar")
	uniform =  /obj/item/clothing/under/rank/krieg_uniform/commissar
	suit = /obj/item/clothing/suit/armor/commissar/krieg
	head = /obj/item/clothing/head/commissar/krieg
	mask = /obj/item/clothing/mask/gas/commissar
	glasses = null

/decl/hierarchy/outfit/job/ig/commissar/catachan
	name = OUTFIT_JOB_NAME("Catachan Commissar")
	uniform =  /obj/item/clothing/under/rank/catachancommissar
	suit = /obj/item/clothing/suit/armor/commissar/catachan
	belt = /obj/item/melee/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/commissar/catachan
	mask = null
	glasses = null

//Squads

/mob/living/carbon/human/proc/assign_random_squad(var/team, var/rank)
	switch(team)
		if(IMPERIUM)//You're now put in whatever squad has the least amount of living people in it.
			var/alpha_members = SSwarfare.red.squadA.members.len
			var/bravo_members = SSwarfare.red.squadB.members.len
			var/charlie_members = SSwarfare.red.squadC.members.len
			var/delta_members = SSwarfare.red.squadD.members.len
			var/minimum = min(alpha_members, bravo_members, charlie_members, delta_members)
			if(minimum == alpha_members)
				SSwarfare.red.squadA.members += src
				src.squad = SSwarfare.red.squadA
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/alpha/A = new(src)
				RC.attach_accessory(src,A)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)

			else if(minimum == bravo_members)
				SSwarfare.red.squadB.members += src
				src.squad = SSwarfare.red.squadB
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/bravo/B = new(src)
				RC.attach_accessory(src,B)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)

			else if(minimum == charlie_members)
				SSwarfare.red.squadC.members += src
				src.squad = SSwarfare.red.squadC
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/charlie/C = new(src.loc)
				RC.attach_accessory(src,C)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)
/*
			else if(minimum == delta_members)
				SSwarfare.red.squadD.members += src
				src.squad = SSwarfare.red.squadD
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/delta(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/delta/D = new(src.loc)
				RC.attach_accessory(src,D)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)
*/
			else
				SSwarfare.red.squadB.members += src
				src.squad = SSwarfare.red.squadB
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/bravo/B = new(src.loc)
				RC.attach_accessory(src,B)
				if(rank == "medic")
					var/obj/item/clothing/accessory/medal/medical/M = new(src)
					RC.attach_accessory(src,M)
			/*if(4)
				SSwarfare.red.squadD.members += src
				src.squad = SSwarfare.red.squadD
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/delta(src),slot_l_ear)
			*/

	var/obj/item/card/id/I = GetIdCard()
	var/actual_job = "Guardsman"
	switch(rank)
		if("medic")
			actual_job = "Medic"
		if("engineer")
			actual_job = "Engineer"
	I.assignment = "[src.squad.name] Squad [actual_job]"

	to_chat(src, "<b>I am apart of [src.squad.name] Squad</b>")


/mob/living/carbon/human/proc/assign_squad_leader(var/team)
	switch(team)
		if(IMPERIUM)//Start from A, go to D
			if(!SSwarfare.red.squadA.squad_leader)
				SSwarfare.red.squadA.members += src
				SSwarfare.red.squadA.squad_leader = src
				src.squad = SSwarfare.red.squadA
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_alpha(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/alpha/A = new(src)
				RC.attach_accessory(src,A)

			else if(!SSwarfare.red.squadB.squad_leader)
				SSwarfare.red.squadB.members += src
				SSwarfare.red.squadB.squad_leader = src
				src.squad = SSwarfare.red.squadB
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_bravo(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/bravo/B = new(src)
				RC.attach_accessory(src,B)

			else if(!SSwarfare.red.squadC.squad_leader)
				SSwarfare.red.squadC.members += src
				SSwarfare.red.squadC.squad_leader = src
				src.squad = SSwarfare.red.squadC
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_charlie(src),slot_l_ear)
				var/obj/item/clothing/suit/armor/redcoat/RC = get_equipped_item(slot_wear_suit)
				var/obj/item/clothing/accessory/armband/charlie/C = new(src)
				RC.attach_accessory(src,C)

/*
			else if(!SSwarfare.red.squadD.squad_leader)
				SSwarfare.red.squadD.members += src
				SSwarfare.red.squadD.squad_leader = src
				src.squad = SSwarfare.red.squadD
				equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team/sl_delta(src),slot_l_ear)
				var/obj/item/clothing/accessory/armband/delta/D = new(src)
				RC.attach_accessory(src,D)
*/
			else
				return

	var/obj/item/card/id/I = GetIdCard()
	I.assignment = "[src.squad.name] Squad"

	to_chat(src, "<b>I am the Squad Leader of [src.squad.name] Squad</b>")

//Misc

/mob/proc/voice_in_head(message)
	to_chat(src, "<i>...[message]</i>")

GLOBAL_LIST_INIT(lone_thoughts, list(
		"Why are we still here... just to suffer?",
		"We fight to win, and that's all that matters.",
		"Why we don't get any more reinforcements?",
		"We have not gotten any orders from segmentum command in months...",
		"Did something happened while we were holding this outpost?",
		"Is there any reason to keep fighting?",
		"It's middle of summer... Why it's so cold?",
		"Greg died last night.",
		"I do not want to die.",
		"There is no hope... anymore...",
		"Is any of this real?",
		"My teeth hurt.",
		"I am not ready to die.",
		"I don't remember joining the military...",
		"Does the Emperor truly protect?",
		"I hope the Inquisitor doesn't find my Eldar Mommy fan-fiction",))

/mob/living/proc/assign_random_quirk()
	if(prob(75))//75% of not choosing a quirk at all.
		return
	if(is_hellbanned())//Hellbanned people will never get quirks.
		return
	var/list/random_quirks = list()
	for(var/thing in subtypesof(/datum/quirk))//Populate possible quirks list.
		var/datum/quirk/Q = thing
		random_quirks += Q
	if(!random_quirks.len)//If there's somewhow nothing there afterwards return.
		return
	var/datum/quirk/chosen_quirk = pick(random_quirks)
	src.quirk = new chosen_quirk
	to_chat(src, "<span class='bnotice'>I was formed a bit different. I am [quirk.name]. [quirk.description]</span>")
	switch(chosen_quirk)
		if(/datum/quirk/cig_addict)
			var/datum/reagent/new_reagent = new /datum/reagent/nicotine
			src.reagents.addiction_list.Add(new_reagent)
		if(/datum/quirk/alcoholic)
			var/datum/reagent/new_reagent = new /datum/reagent/ethanol
			src.reagents.addiction_list.Add(new_reagent)
		if(/datum/quirk/obscura)
			var/datum/reagent/new_reagent = new /datum/reagent/space_drugs
			src.reagents.addiction_list.Add(new_reagent)

/mob/living/carbon/human/proc/witchblood()
	if(prob(99))//99% of not being a psyker
		return
	else
		src.psyker = 1
		src.verbs += list(/mob/living/carbon/human/proc/remotesay,)
