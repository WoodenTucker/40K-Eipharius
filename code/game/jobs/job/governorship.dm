// Governor

var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/governor
	title = "Planetary Governor"
	department = "Planetary Governor"
	head_position = 1
	department_flag = COM
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "The Golden Throne and the High Lords of Terra."
	selection_color = "#540c97"
	req_admin_notify = 1
	access = list(20, 331, access_RC_announce, access_ai_upload, access_heads) 			//See get_access()
	minimal_access = list(20, 331, access_RC_announce, access_ai_upload, access_heads)
	minimal_player_age = 65
	economic_modifier = 20
	announced = TRUE
	latejoin_at_spawnpoints = TRUE
	ideal_character_age = 120
	outfit_type = /decl/hierarchy/outfit/job/governor
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 5 // we want funny inq vs nonsense


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Governor [current_name]")
		H.add_stats(rand(14,18), rand(14,18), rand(14,18), rand(14,18))
		H.add_skills(rand(6,10),rand(6,10),rand(5,6),rand(1,8),rand(1,8)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.verbs += list(/mob/living/carbon/human/proc/hire)
		to_chat(H, "<span class='notice'><b><font size=3>  </font></b></span>")
		H.get_idcard()?.access = list(20, 331, access_RC_announce, access_ai_upload, access_heads)
		H.verbs += list(
			/mob/living/carbon/human/proc/governorclass)

/datum/job/heir
	title = "Heir"
	head_position = 1
	department_flag = COM
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Yourself. Make sure you get that inheritance..."
	selection_color = "#6220a0"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 15 // lots of delicacies growing up

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Lord [current_name]") //
		H.add_stats(rand(12,16), rand(12,16), rand(13,15), rand(13,17))
		H.add_skills(rand(5,10),rand(5,10),rand(1,8),rand(1,8),rand(1,6)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are still young. Orders probably won’t be taken seriously. The next in line to the throne of Eipharius. Waiting simply takes too long. Why not have the Governor simply… fall down some stairs? Make sure the Enforcers and Inquisition don’t get suspicious and have a stable rise to the throne.</font></b></span>")
		H.verbs += list(
			/mob/living/carbon/human/proc/servantclass)
	access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_mechanicus, access_change_ids, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_change_ids, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)

	outfit_type = /decl/hierarchy/outfit/job/heir


/mob/living/carbon/human/proc/governorclass()
	set name = "Select your class"
	set category = "Governor"
	set desc = "Roll the dice and discover a new story."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/governorclass) //removes verb
	var/fates = list("ROLL THE DICE!")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)

		if("ROLL THE DICE!")
			if(prob(95))
				to_chat(U,"<span class='danger'><b><font size=4>THE LOYALIST</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>A loyal servant to the imperium, as Governor of the Eipharius colony and proclaimed master of the xenos city of Eipharius it is your responsibility to ensure both the continued survival of The Imperium and your family. Resting upon your shoulders is the countless untold billions who might one day spawn from your world, of the countless wars that shall surely be fought in your families name. This is your duty, your curse -- this is how you died.</font></b></span>")
				equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol, slot_wear_suit)
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
				if(prob(8))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_eng, slot_in_backpack)
				if(prob(2))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/inquisition, slot_in_backpack)
				if(prob(6))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_sci, slot_in_backpack)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE SPY</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a traitor to the Imperium and for reasons known only to you now, shall be it's destruction. Praise the hivemind/cult/cogitae!(A-Help for info on the rounds lateparty and don't RDM plz.) </font></b></span>")
				U.add_stats(rand(13,17), rand(16,18), rand(16,18), rand (12,20))
				equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/blue_team/all, slot_in_backpack)
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/tau, slot_in_backpack)
				equip_to_slot_or_store_or_drop(new /obj/item/gun/projectile/bolter_pistol, slot_wear_suit)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(10))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_eng, slot_in_backpack)
				if(prob(4))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/inquisition, slot_in_backpack)
				if(prob(12))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/headset_sci, slot_in_backpack)


/mob/living/carbon/human/proc/servantclass()
	set name = "Select your class"
	set category = "Governor"
	set desc = "Roll the dice and discover a new story."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/servantclass) //removes verb
	var/fates = list("ROLL THE DICE!")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)

		if("ROLL THE DICE!")
			if(prob(80))
				to_chat(U,"<span class='danger'><b><font size=4>THE LOYALIST</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>A loyal servant to the imperium livin and underling to the master of the xenos city of Eipharius it is your responsibility to ensure both the continued survival of The Imperium and the Governor's lineage. This is your duty, your curse -- this is how you died.</font></b></span>")
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE SPY</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a traitor to the Imperium and for reasons known only to you now, shall be it's destruction. Praise the hivemind/cult/cogitae!(A-Help for info on the rounds lateparty and don't RDM plz.) </font></b></span>")
				U.add_stats(rand(13,17), rand(16,18), rand(16,18), rand (12,20))
				if(prob(30))
					equip_to_slot_or_store_or_drop(new /obj/item/device/radio/headset/blue_team/all, slot_in_backpack)
				equip_to_slot_or_store_or_drop(new /obj/item/reagent_containers/hypospray/autoinjector/death, slot_in_backpack)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)

// Seneschal/steward removed until we need it due to pop
/*
/datum/job/hop
	title = "Steward"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Rogue Trader"
	selection_color = "#3e0177"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 30 // command going culty is good in round wildness


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Steward [current_name]")
		H.add_stats(rand(12,14), rand(16,18), rand(10,13), rand(13,18)) //they are like rogues but smarter and faster
		H.add_skills(rand(7,10),rand(7,10),rand(5,6),rand(4,8),rand(1,6)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are the Steward and personal aid to the Lord Trader acting as their Major-Domo, you interact with the Administratum and Munitorium on behalf of your Lord while wielding some semblence of the golden writ of authority in their absence.</font></b></span>")


	access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_mechanicus, access_change_ids, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_mechanicus, access_change_ids, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library,access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)

	outfit_type = /decl/hierarchy/outfit/job/hop
*/
/datum/job/servant
	title = "Servant"
	department_flag = COM
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Governor and Heir"
	selection_color = "#6220a0"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_security, access_guard_common,
			            access_medical, access_mechanicus, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_guard_common,
			            access_medical, access_mechanicus, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/servant
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 7 // guard are 7-8.
	semi_rifle_skill = 7
	sniper_skill = 6
	shotgun_skill = 7
	lmg_skill = 6
	smg_skill = 7
	cultist_chance = 15

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(13,17), rand(13,18), rand(13,19), rand(13,16)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(6,8),rand(6,8),rand(3,6),4,rand(3,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
			/mob/living/carbon/human/proc/servantclass,)
		to_chat(H, "<span class='notice'><b><font size=3>You are a servant in direct service to the Governorship, having been in service to their family for generations. They own yoH. Change that. If you want.</font></b></span>")


/mob/living/carbon/human/proc/hire(var/mob/living/carbon/human/M in view(src))
	set category = "Mercenary"
	set name = "Hire Mercenary"
	set desc = "Finally! Some recognition!"
	if(!client)
		to_chat(src, "<span class='notice'>Thats not a person.</span>")
		return

	var/list/options = list(
		"Hire on",
		"Cancel",
		)

	var/theoptions = input("Would you like to hire [M]?", "Hiring Menu") as null|anything in options
	if (isnull(theoptions))																	//You chose poorly
		return
	if(!Adjacent(M))																			//How close are we?
		to_chat(src, "<span class='notice'>Get a little closer.</span>")
		return

	switch(theoptions)
		if ("Cancel")
			return	//do nothing

		if ("Hire on")
			for(var/obj/item/card/id/W in M.contents)
				M.unEquip(W)
				visible_message(("<span class='alert'>[src] snatches [W] and tosses it on the ground.</span>"))

			var/obj/item/card/id/dog_tag/guardsman/W = new
			W.access = list(access_security, access_guard_common, access_village,)
			W.assignment = "Mercenary"
			W.registered_name = M.real_name
			W.update_label()
			M.equip_to_slot_or_del(W, slot_wear_id)
			M.regenerate_icons()
			M.mind.special_role = "Mercenary"
			src.mind.special_role = "Mercenary"
			M.warfare_faction = IMPERIUM
			M.AddInfectionImages()
			src.AddInfectionImages()
			visible_message("<span class='alert'>[src] slaps a new ID onto [M].</span>")
			src.say("Welcome to my service.")
		else
			return

// TDM OPFOR bad xeno, removed for now
/*
/datum/job/mercenary/watchman
	title = "Xeno Combatant"
	department_flag = SRV
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 30
	spawn_positions = 30
	supervisors = "Cult Leader and Sgt."
	selection_color = "#414397"
	latejoin_at_spawnpoints = TRUE
	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()




	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(11,16), rand(11,17), rand(11,17), rand (8,14))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.stat = UNCONSCIOUS
		H.sleeping = 500
		H.verbs += list(
			/mob/living/carbon/human/proc/mercenaryclass,
		)

*/