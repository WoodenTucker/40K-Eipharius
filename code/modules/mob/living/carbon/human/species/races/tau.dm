/datum/species/tau
	name = SPECIES_TAU
	name_plural = "Tau"
	secondary_langs = list(LANGUAGE_TAU)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/r_tau.dmi'
	deform = 'icons/mob/human_races/r_def_tau.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 150
	mob_size = MOB_MEDIUM
	strength = STR_MEDIUM
	sexybits_location = BP_GROIN
	inherent_verbs = list(
	/mob/living/carbon/human/tau/proc/tauclasses,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)

	blood_color = "#4c0377"

/datum/species/tau/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(20,35)//Random age for kiddos.
	if(H.f_style)//tau don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>For the Greater Good! Our warship has arrived in orbital range to convert this world to the greater good. We must first try diplomacy, see if a water caste awakes so that we can trade and convince the humans that we are not the true enemy. In time they may learn to convert to the Greater Good..</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
/mob/living/carbon/human
	var/new_tau = SPECIES_TAU

/mob/living/carbon/human/tau
	gender = MALE

/mob/living/carbon/human/tau/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_tau)

/mob/living/carbon/human/tau/Initialize()
	. = ..()
	fully_replace_character_name(random_taufw_name(src.gender))
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/tau)
	outfit.equip(src)
	isburied = 1

	hand = 0//Make sure one of their hands is active.


//this is extremely hacky and clown world but I cannot for the life of me find another way to do this. It adds all necessary stats, languages, items, w/e you want on a normal human mob
//I look forward to the day someone calls me retarded and finds a very easy way to do this during init - wel
//Adding the proc to the init will call it/run it, but it will not apply the stats as I'm guessing they're loaded after init somehow somewhere. I know stats are a datum

/mob/living/carbon/human/tau/proc/tauclasses()
	set name = "Remember your caste"
	set category = "Tau"
	set desc = "Various Tau classes and gives them stats"

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return


	var/castes = input("Select a caste","Caste Selection") as null|anything in list("Fire Warrior", "Water Caste Merchant", "Earth Caste Mechanic", "Kroot Hunter")
	switch(castes)
		if("Fire Warrior")
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/fwarmor, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/fw, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/pulse/pulserifle, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)
			equip_to_slot_or_del(new /obj/item/cell/pulserifle, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/pulserifle, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/energy/pulse/pulsepistol, slot_in_backpack)

			visible_message("[name] stretches their muscles after a long flight, feeling their strength and skill return to them.")
			src.add_stats(rand(10,12),rand(14,18),rand(12,15),10)
			src.add_skills(rand(4,9),rand(8,13),rand(0,3),0,0) //skills such as melee, ranged, med, eng and surg
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(TAU) //secondary language
			src.adjustStaminaLoss(-INFINITY)
			src.name = "Shas [name]"
			src.real_name = "Shas [real_name]"
			client?.color = null
			src.verbs -= /mob/living/carbon/human/tau/proc/tauclasses //removes verb at the end so they can't spam it for whatever reason
			var/obj/item/card/id/ring/tau/W = new
			W.icon_state = "tau"
			W.assignment = "Fire Warrior"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Water Caste Merchant")
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/pulse/pulsepistol, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/pulserifle, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/head/tautrader, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/suit/watercaste, slot_wear_suit)

			visible_message("[name] stretches their muscles after a long flight, feeling their strength and skill return to them.")
			src.add_stats(rand(6,8),rand(10,12),rand(12,13),15)
			src.add_skills(rand(3,6),rand(3,6),rand(0,3),3,3) //skills such as melee, ranged, med, eng and surg
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(TAU) //secondary language
			src.name = "Por [name]"
			src.real_name = "Por [real_name]"
			client?.color = null
			src.verbs -= /mob/living/carbon/human/tau/proc/tauclasses //removes verb at the end so they can't spam it for whatever reason
			var/obj/item/card/id/ring/tau/W = new
			W.icon_state = "tau"
			W.assignment = "Water Caste Merchant"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
			
		if("Earth Caste Mechanic")
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/pulse/pulsepistol, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/suit/earthcaste, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/belt/utility/full, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/welding/superior, slot_glasses)
			
			visible_message("[name] stretches their muscles after a long flight, feeling their strength and skill return to them.")
			src.add_stats(rand(7,9),rand(11,13),rand(13,16),12)
			src.add_skills(rand(3,6),rand(3,6),rand(5,8),6,6) //skills such as melee, ranged, med, eng and surg
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(TAU) //secondary language
			src.name = "Fio'La [name]"
			src.real_name = "Fio'La [real_name]"
			client?.color = null
			src.verbs -= /mob/living/carbon/human/tau/proc/tauclasses //removes verb at the end so they can't spam it for whatever reason
			var/obj/item/card/id/ring/tau/W = new
			W.icon_state = "tau"
			W.assignment = "Earth Caste Mechanic"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)


		if("Kroot Hunter")
			usr.loc = get_turf(locate("landmark*krootstart")) //where they spawning
			var/mob/living/carbon/human/kroot/new_character = new(usr.loc) // da mob
			new_character.key = usr.key //puts ghost in body with new key
			visible_message("You wake up after a long flight to find yourself in Imperial space. Go to your kroot tab and stretch your muscles.")
			src.verbs -= /mob/living/carbon/human/tau/proc/tauclasses //removes verb at the end so they can't spam it for whatever reason
			qdel(src)


