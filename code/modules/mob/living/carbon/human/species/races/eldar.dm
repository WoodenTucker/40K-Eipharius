/*
Eldar
this shit is just the barebones of the race im going to add the verbs later
*/

/datum/species/eldar
    name = SPECIES_ELDAR
    default_language = LANGUAGE_ELDAR
    language = LANGUAGE_ELDAR
    name_language = LANGUAGE_ELDAR
    icobase = 'icons/mob/human_races/r_def_eldar.dmi'
    deform = 'icons/mob/human_races/r_def_eldar.dmi'
    damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
    blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
    additional_langs = LANGUAGE_LOW_GOTHIC
    grab_type = GRAB_TAKEDOWN
    total_health = 250
    slowdown = -0.50
    gluttonous = GLUT_TINY
    sexybits_location = BP_GROIN
	inherent_verbs = list(/mob/living/carbon/human/eldar/proc/giveeldarstats)

/datum/species/eldar/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//eldar don't get beards.
		H.f_style = "Shaved"
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
/mob/living/carbon/human
	var/new_eldar = SPECIES_ELDAR

/mob/living/carbon/human/eldar/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_eldar)

/mob/living/carbon/human/eldar
	var/isempty = 0
	var/iseating = 0

/datum/species/eldar/corsair
    name = SPECIES_ELDAR
    default_language = LANGUAGE_ELDAR
    language = LANGUAGE_ELDAR
    name_language = LANGUAGE_ELDAR

/datum/species/eldar/corsair/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//eldar don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>Your a mercenary hired by the Lord Trader. Obey whatever instructions they have.</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human/eldar/corsair/Initialize()
	. = ..()
	fully_replace_character_name(random_eldar_name(src.gender))
	warfare_faction = TAU
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/corsair)
	outfit.equip(src)

/mob/living/carbon/human/eldar/proc/giveeldarstats() //WIP, adding in Guardian, Ranger, and Corsair stuff.
	set name = "Recall your training."
	set category = "Eldar"
	set desc = "Gives Eldar stats."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/eldarclass = input("Select a Class","Class Selection") as null|anything in list("Guardian")
	switch(eldarclass)
		if("Guardian")
			equip_to_slot_or_del(new /obj/item/clothing/under/syndicate/combat, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/blacksun, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/rt, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/eldar, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/eldar, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/projectile/eldar/scatapult, slot_s_store)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/eldar, slot_head)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/catapult_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/catapult_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/catapult_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/gun/projectile/eldar/spistol, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/spistol_magazine, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/accessory/holster, slot_in_backpack)
			visible_message("[name] meditates for a moment.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(18,19),rand(20,25),rand(18,19),18) //gives stats str, dext, end, int
			src.add_skills(rand(6,9),rand(9,11),rand(5,7),rand(6,8),rand(3,6)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.bladder = -INFINITY
			src.bowels = -INFINITY 
			src.thirst = INFINITY
			src.nutrition = INFINITY
			src.verbs -= /mob/living/carbon/human/eldar/proc/giveeldarstats //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/W = new
			W.icon_state = "tagred"
			W.assignment = "Eldar Guardian"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

	switch(eldarclass)
		if("Eldar Ranger")
			equip_to_slot_or_del(new /obj/item/clothing/under/syndicate/combat, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/blacksun, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/rt, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/eldar/ranger, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/eldar/ranger, slot_shoes)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun/longlas/eldar, slot_s_store)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat/combat/warfare, slot_gloves)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/eldar/ranger, slot_head)
			visible_message("[name] whizzes and beeps as they run startup diagnostics. All systems green.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(19,21),rand(21,25),rand(18,19),18) //gives stats str, dext, end, int //stronger and faster than most skitarii, also more endurant than normal humans.
			src.add_skills(rand(9,10),rand(12,18),rand(5,6),rand(6,8),rand(3,6)) //melee, ranged, med, eng, surgery //Melee focused only. will redo when PDWs are added.
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.bladder = -INFINITY
			src.bowels = -INFINITY
			src.thirst = INFINITY
			src.nutrition = INFINITY
			src.vice = null //off for now
			src.verbs -= /mob/living/carbon/human/eldar/proc/giveeldarstats //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/W = new
			W.icon_state = "tagred"
			W.assignment = "Eldar Ranger"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
