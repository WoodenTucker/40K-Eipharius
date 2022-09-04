/datum/species/human/skitarii
	name = "Skitarii"
	name_plural = "Skitarii"
	blurb = "The Mechanicus' loyal soldiers."
	total_health = 400 //made to be recovered even if they get severely injured
	min_age = 18
	max_age = 80
	icobase = 'icons/mob/human_races/r_human.dmi'
	deform = 'icons/mob/human_races/r_def_human.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	pixel_offset_y = -4
	strength = STR_HIGH
	radiation_mod = 0.01
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON
	slowdown = -0.30
	inherent_verbs = list(
	/mob/living/carbon/human/skitarii/proc/giveskitstats,
		)
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch
		)

/mob/living/carbon/human/skitarii
	gender = MALE

/datum/species/human/skitarii/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age doesn't quite matter I suppose
	if(H.f_style)//BALD
		H.f_style = "Shaved"
	if(H.h_style)//SHAVED
		H.h_style = "Bald"
	to_chat(H, "<big><span class='warning'>You are a servant of the Adeptus Mechanicus! Don't forget it!</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human/proc/isSkitarii()//Used to tell if someone is a skit boy, can be used for possible jobs later down the line, stole from children
	if(species?.name == "Skitarii")
		return 1
	else
		return 0

/mob/living/carbon/human/skitarii/Initialize()
	. = ..()
	set_species("Skitarii")
	fully_replace_character_name(random_skitarii_name(src.gender))
	warfare_faction = IMPERIUM
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/skitarii/basic)
	outfit.equip(src)
	offer_mob()
	hand = 0//Make sure one of their hands is active.
	isburied = 1

/mob/living/carbon/human/skitarii/proc/request_player() //reqs the player
	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(O.client)
			question(O.client)

/mob/living/carbon/human/skitarii/proc/question(var/client/C) //asks the questions
	if(!C)
		return FALSE
	var/response = alert(C, "A Skitarii unit has been manufactured and needs a player. Are you interested?", "Skitarii", "Yes", "No",)
	if(!C || ckey)
		return FALSE
	if(response == "Yes")
		transfer_personality(C)
		src.warfare_faction = IMPERIUM
		return TRUE
	return FALSE

/mob/living/carbon/human/skitarii/proc/transfer_personality(var/client/candidate) //puts the guy in the place

	if(!candidate)
		return

	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "syndicate"

/mob/living/carbon/human/skitarii/proc/giveskitstats()
	set name = "Run startup diagnostics"
	set category = "Skitarii"
	set desc = "Gives Skitarii stats."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/skitclass = input("Select a Class","Class Selection") as null|anything in list("Skitarii Ranger", "Ruststalker", "Vanguard")
	switch(skitclass)
		if("Skitarii Ranger")
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hooded/skitarii, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/blacksun/skitarii, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/techpriest, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/skitshoes, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/galvanic/rifle, slot_s_store)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/galvanic, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/galvanic, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/galvanic, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/galvanic, slot_in_backpack)
			visible_message("[name] whizzes and beeps as they run startup diagnostics. All systems green.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(18,22),rand(18,22),rand(18,22),14) //gives stats str, dext, end, int
			src.add_skills(rand(9,11),rand(9,11),rand(5,7),rand(6,8),rand(3,6)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_MECHANICUS) //secondary language
			src.bladder = -INFINITY
			src.bowels = -INFINITY //he's too heavily modified to require things like a toilet
			src.thirst = INFINITY
			src.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
			src.verbs -= /mob/living/carbon/human/skitarii/proc/giveskitstats //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/skitarii/W = new
			W.icon_state = "tagred"
			W.assignment = "Skitarii Ranger"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

	switch(skitclass)
		if("Ruststalker")
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hooded/ruststalker, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/blacksun/skitarii, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/ruststalker, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/skitshoes/ruststalker, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)

			visible_message("[name] whizzes and beeps as they run startup diagnostics. All systems green.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(22,26),rand(22,26),rand(22,26),14) //gives stats str, dext, end, int //Melee focused guys.
			src.add_skills(rand(17,19),rand(5,6),rand(5,6),rand(6,8),rand(3,6)) //melee, ranged, med, eng, surgery //Melee focused.
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_MECHANICUS) //secondary language
			src.bladder = -INFINITY
			src.bowels = -INFINITY //he's too heavily modified to require things like a toilet
			src.thirst = INFINITY
			src.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
			src.vice = null //off for now
			src.verbs += /mob/living/carbon/human/proc/active_camo //Gives them a camo ability.
			src.verbs -= /mob/living/carbon/human/skitarii/proc/giveskitstats //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

	src.warfare_language_shit(LANGUAGE_MECHANICUS) //secondary language
	remove_verb(src, /mob/living/carbon/human/skitarii/proc/giveskitstats) //removes verb at the end so they can't spam it for whatever reason
	client?.color = null
			var/obj/item/card/id/dog_tag/skitarii/W = new
			W.icon_state = "tagred"
			W.assignment = "Skitarii Ruststalker"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

	switch(skitclass)
		if("Vanguard")
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/vanguard, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/blacksun/skitarii, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/techpriest, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/skitshoes/vanguard, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/radcarbine, slot_s_store)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/radcarbine/radpistol, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)
			equip_to_slot_or_del(new /obj/item/clothing/head/vanhelm, slot_head)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/radcarbine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/radcarbine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/radcarbine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/radcarbine/radpistol, slot_in_backpack)
			visible_message("[name] whizzes and beeps as they run startup diagnostics. All systems green.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(22,24),rand(22,24),rand(24,28),14) //gives stats str, dext, end, int //Durable as hell.
			src.add_skills(rand(11,12),rand(12,14),rand(5,6),rand(6,8),rand(3,6)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_MECHANICUS) //secondary language
			src.bladder = -INFINITY
			src.bowels = -INFINITY //he's too heavily modified to require things like a toilet
			src.thirst = INFINITY
			src.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
			src.vice = null //off for now
			src.verbs -= /mob/living/carbon/human/skitarii/proc/giveskitstats //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/skitarii/W = new
			W.icon_state = "tagred"
			W.assignment = "Skitarii Vanguard"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
