// Interrogator

/datum/job/acolyte
	title = "Interrogator" // PLAN: Servant of another. Loyalist. Usurper.
	department_flag = INQ
	social_class = SOCIAL_CLASS_MIN
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "The Golden Throne, and Your Lord Inquisitor"
	selection_color = "#b4821c"
	economic_modifier = 7
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/interrogator
	announced = FALSE
	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9
	cultist_chance = 15

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(15,18), rand(15,18), rand(15,18), rand(15,18)) //highly trained and skilled
		H.add_skills(rand(9,10),rand(9,10),rand(5,7),rand(5,6),rand(6,7)) //SUFFER NOT THE ALIEN, SUFFER NOT THE HERETIC
		H.assign_random_quirk()
		H.witchblood()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_advchapel, access_inquisition)
		H.adjustStaminaLoss(-INFINITY)
		H.vice = null
		H.verbs += list(
			/mob/living/carbon/human/proc/intclass, /mob/living/carbon/human/proc/eqclass)
		H.say(":i [title] &(47*TECHNICA)Z(INQ)... transponder signal active.")
		to_chat(H, "<span class='notice'><b><font size=3> You are an interrogator, the apprentice of, the Lord Inquisitor. It is not uncommon for Interrogators' to work undercover or incognito. Your task is to assist the Lord Inquisitor in investigating, neutralizing and erasing traces of heresy, chaos, xenos and daemons. Now more then ever your actions are being weighed by not only your master, but the inquisition - this mission is the last opportunity to clear the names of not only the Lord Inquisitor but that of his entire retinue...</font></b></span>")

/datum/job/acolyte/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

// Inquisitor

/datum/job/inquisitor
	title = "Inquisitor" // PLAN: Renegade. Cult. Loyalist.
	department_flag = INQ
	social_class = SOCIAL_CLASS_MIN
	total_positions = 0
	spawn_positions = 0
	head_position = 1
	supervisors = "The Golden Throne and the Inquisition"
	selection_color = "#b4821c"
	req_admin_notify = 1
	latejoin_at_spawnpoints = TRUE
	economic_modifier = 7
	minimal_player_age = 21
	open_when_dead = 0
	outfit_type = /decl/hierarchy/outfit/job/inquisitor
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	cultist_chance = 30

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(17,18), rand(17,18), rand(17,18), rand(17,19)) //PRAISE THE EMPEROR
		H.add_skills(10,10,rand(7,10),rand(5,7),rand(7,8)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_faction = IMPERIUM
		H.witchblood()
		H.get_idcard()?.access = list(access_security, access_guard_common, access_magi, access_all_personal_lockers, access_advchapel, access_inquisition, access_inquisition_fancy)
		H.inquisitor = 1
		H.adjustStaminaLoss(-INFINITY)
		H.verbs += list(
			/mob/living/carbon/human/proc/inqclass, /mob/living/carbon/human/proc/intclass)
		H.say(":i [title] &(47*TECHNICA)Z(INQ)... transponder signal active.")
		H.vice = null
		to_chat(H, "<span class='notice'><b><font size=3>You are extremis diabolus, an inquisitor in service to the Ordos that has been considered for reasons up to you, a liability to the inquisition. Every person, asset and object on this planet is a tool or resource to be exploited. Humiliation, torture and the dull thud of a bolt pistol is what awaits you in failure should you not prove yourself here. Your acolytes personally selected to serve only you, whether they survive the horrid taint associated with your name and rise to the ranks of Inquisitor shall be determined in the coming weeks.</font></b></span>")

/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)


// CLASSES
/mob/living/carbon/human/proc/inqclass()
	set name = "Select your equipment." // INQUISITORS GEAR
	set category = "INQUISITION"
	set desc = "Select your equipment."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/inqclass) //removes verb
	var/fates = list("Blade and Bolter","Mercenary","Assassin","Pariah","Militarum")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)

		if("Blade and Bolter")
			if(prob(70))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/bolt_rifle_magazine/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/bolt_rifle_magazine/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol/inquis, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/bolt_pistol_magazine/kp, slot_in_backpack)
			if(prob(40))
				equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/boltrifle/lockebolter/drusian, slot_r_hand)
			else
				equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol/inquis, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/chain/inqcs, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/bowie, slot_in_backpack)
		if("Mercenary")
			if(prob(80))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/a762/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/a762/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/a762/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c50/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c50/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/revolver/mateba, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/bowie, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/storage/firstaid/combat, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/machete/chopper/heavy/adamantine, slot_in_backpack)
		if("Assassin")
			if(prob(90))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c556/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c556/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c556/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/mc45mm/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/mc45mm/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/mc45mm/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/automatic/messina, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/talon/renegade, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/catachan, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/storage/firstaid/combat, slot_in_backpack)
		if("Pariah")
			if(prob(70))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/plasma, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/plasma, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c44/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c44/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c44/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/energy/pulse/plasma/pistol/glock, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/necros, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/cutro/adamantine, slot_in_backpack)
		if("Militarum")
			if(prob(70))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/energy/las/hotshot, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/energy/las/laspistol/militarum/lucius, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/bowie, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/storage/firstaid/combat, slot_in_backpack)


// /obj/item/cane/concealed

			if(prob(70))
				to_chat(U,"<span class='danger'><b><font size=4>THE INQUISITOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>A loyal inquisitor to The Imperium, you've managed to avoid death by the heretic and even execution at the hands of your own Inquisiton for what feels like multiple lifetimes. </font></b></span>")
				if(prob(12))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_eng, slot_in_backpack)
				if(prob(10))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/blue_team/all, slot_in_backpack)
			else if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE RENEGADE</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are traitorus diabolus as a result of your decisions, whether you truly are corrupted or loyal to The God Emperor is still debated by many of your peers. But regardless judgement has been made and you are now hunted by your fellow inquisitors, whether you will embrace your judgemenet or fight against it is your own decision.</font></b></span>")
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE BETRAYER</font></b></span>") 
				to_chat(U,"<span class='goodmood'><b><font size=3>You are an agent working on behalf of another ideology of your choosing, in allegiance with them against The God Emperor you plot to the Imperium's ultimate demise. While the end of imperial rule on this planet may be beneficial, it is only one world -- so you must plan ahead to the ending of... every imperial world.</font></b></span>")
				if(prob(52))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_eng, slot_in_backpack)
				if(prob(90))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/blue_team/all, slot_in_backpack)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)


/mob/living/carbon/human/proc/intclass()
	set name = "Select your disguise" // DISGUISES
	set category = "INQUISITION"
	set desc = "Select your disguise.."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/intclass) //removes verb
	var/fates = list("ROLL THE DICE!")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)

		if("ROLL THE DICE!")
			if(prob(90))
				to_chat(U,"<span class='danger'><b><font size=4>THE INTERROGATOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>A loyal interrogator to The Imperium and your Inquisitor, you've managed to avoid death by the heretic and have yet to be discarded by your master. In time you may attain the rank of Inquisitor. </font></b></span>")
				if(prob(5))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_eng, slot_in_backpack)
				if(prob(5))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/blue_team/all, slot_in_backpack)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE BETRAYER</font></b></span>") 
				to_chat(U,"<span class='goodmood'><b><font size=3>You are an agent working on behalf of another ideology of your choosing, in allegiance with them against The God Emperor you plot to the Imperium's ultimate demise. While the end of imperial rule on this planet may be beneficial, it is only one world -- so you must plan ahead to the ending of... every imperial world.</font></b></span>")
				if(prob(12))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_eng, slot_in_backpack)
				if(prob(50))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/blue_team/all, slot_in_backpack)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)		

/mob/living/carbon/human/proc/eqclass()
	set name = "Select your equipment" // INTERROGATORS GEAR
	set category = "INQUISITION"
	set desc = "Roll the dice and discover a new story."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/eqclass) //removes verb
	var/fates = list("Blade and Bolter","Mercenary","Assassin","Pariah","Militarum")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)

		if("Blade and Bolter")
			if(prob(70))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/bolt_rifle_magazine, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol/inquis, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/bolt_pistol_magazine/kp, slot_in_backpack)
			if(prob(40))
				equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol, slot_r_hand)
			else
				equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol/inquis, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/chain/inqcs, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/bowie, slot_in_backpack)
		if("Mercenary")
			if(prob(80))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/a762/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/a762/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/a762/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c50/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c50/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/revolver/mateba, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/bowie, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/storage/firstaid/combat, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/machete/chopper/heavy/adamantine, slot_in_backpack)
		if("Assassin")
			if(prob(90))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c556/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c556/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c556/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/mc45mm/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/mc45mm/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/mc45mm/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/automatic/messina, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/talon/renegade, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/catachan, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/storage/firstaid/combat, slot_in_backpack)
		if("Pariah")
			if(prob(70))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/plasma, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c44/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c44/ap, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/ammo_magazine/c44/kp, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/energy/pulse/plasma/pistol/glock, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/necros, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/cutro/adamantine, slot_in_backpack)
		if("Militarum")
			if(prob(70))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			if(prob(60))
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/cell/lasgun/hotshot, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/energy/las/hotshot, slot_r_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/gun/energy/las/laspistol/militarum/lucius, slot_l_hand)
			equip_to_slot_or_store_or_drop(new /obj/item/melee/sword/combat_knife/bowie, slot_in_backpack)
			equip_to_slot_or_store_or_drop(new /obj/item/storage/firstaid/combat, slot_in_backpack)

// inq outfits
/decl/hierarchy/outfit/job/interrogator
	name = OUTFIT_JOB_NAME("Interrogator")
	uniform = /obj/item/clothing/under/rank/principalagent
	suit = null
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	shoes = /obj/item/clothing/shoes/jackboots/inquisitor/acolyte
	head = null
	mask = null
	glasses = null
	id = /obj/item/card/id/inquisition/principal_agent
	l_ear = /obj/item/device/radio/headset/inquisition
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/storage/box/coin
	suit_store = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/twenty = 1
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/inquisitor
	name = OUTFIT_JOB_NAME("Inquisitor")
	uniform = /obj/item/clothing/under/rank/principalagent
	suit = null
	back = /obj/item/storage/backpack/satchel/warfare
	belt = null
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	shoes = /obj/item/clothing/shoes/jackboots/inquisitor
	head = null
	mask = null
	glasses = null
	id = /obj/item/card/id/inquisition/principal_agent
	l_ear = /obj/item/device/radio/headset/inquisition
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/storage/box/coin
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
