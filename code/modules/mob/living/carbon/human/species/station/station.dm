/datum/species/human
	name = SPECIES_HUMAN
	name_plural = "Humans"
	primitive_form = "Monkey"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Solar System, and over the last five centuries has spread colonies across a wide swathe of space. They hold a wide range of forms and creeds."
	num_alternate_languages = 2
	secondary_langs = list(LANGUAGE_SOL_COMMON)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18 //no underage people
	max_age = 130
	gluttonous = GLUT_TINY
	slowdown = 0 //SHOULD fix it
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

	teeth_type = /obj/item/stack/teeth/human //Teeth
	sexybits_location = BP_GROIN

/datum/species/human/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_HUMAN

/datum/species/human/sanitize_name(var/name)
	var/sanitized_name = sanitizeName(name)

	var/firstspace = findtext(sanitized_name, " ")
	if(!firstspace)	//we need a surname
		sanitized_name += " [pick(GLOB.last_names)]"

	return sanitized_name

/datum/species/human/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return

	if(H.get_shock() && H.shock_stage < 40 && prob(3))
		H.emote(pick("moan","groan"))

	if(H.shock_stage > 10 && prob(3))
		H.emote(pick("cry","whimper"))

	if(H.shock_stage >= 40 && prob(3))
		H.emote("scream")

	if(!H.restrained() && H.lying && H.shock_stage >= 60 && prob(3))
		H.custom_emote("thrashes in agony")

	if(!H.restrained() && H.shock_stage < 40 && prob(3))
		var/maxdam = 0
		var/obj/item/organ/external/damaged_organ = null
		for(var/obj/item/organ/external/E in H.organs)
			if(!E.can_feel_pain()) continue
			var/dam = E.get_damage()
			// make the choice of the organ depend on damage,
			// but also sometimes use one of the less damaged ones
			if(dam > maxdam && (maxdam == 0 || prob(50)) )
				damaged_organ = E
				maxdam = dam
		var/datum/gender/T = gender_datums[H.get_gender()]
		if(damaged_organ)
			if(damaged_organ.status & ORGAN_BLEEDING)
				H.custom_emote("clutches [T.his] [damaged_organ.name], trying to stop the blood.")
			else if(damaged_organ.status & ORGAN_BROKEN)
				H.custom_emote("holds [T.his] [damaged_organ.name] carefully.")
			else if(damaged_organ.burn_dam > damaged_organ.brute_dam && damaged_organ.organ_tag != BP_HEAD)
				H.custom_emote("blows on [T.his] [damaged_organ.name] carefully.")
			else
				H.custom_emote("rubs [T.his] [damaged_organ.name] carefully.")

		for(var/obj/item/organ/I in H.internal_organs)
			if((I.status & ORGAN_DEAD) || I.robotic >= ORGAN_ROBOT) continue
			if(I.damage > 2) if(prob(2))
				var/obj/item/organ/external/parent = H.get_organ(I.parent_organ)
				H.custom_emote("clutches [T.his] [parent.name]!")

/datum/species/human/get_ssd(var/mob/living/carbon/human/H)
	if(H.stat == CONSCIOUS)
		return "staring blankly, not reacting to your presence"
	return ..()


/datum/species/human/skinless
	name = "Skinless"
	name_plural = "Skinless"
	icobase = 'icons/mob/human_races/subhuman.dmi'
	deform = 'icons/mob/human_races/subhuman.dmi'
	appearance_flags = 0
	spawn_flags = SPECIES_IS_RESTRICTED
	species_flags = SPECIES_FLAG_NO_PAIN

/datum/species/human/skinless/get_ssd(var/mob/living/carbon/human/H)
	return

/datum/species/human/lackey
	name = "Lackey"
	name_plural = "Lackeys"
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/human/scout
	name = SPECIES_SCOUT
	name_plural = "Astartes Scouts"
	primitive_form = SPECIES_HUMAN
	brute_mod =      0.8                    // 80% brute damage
	burn_mod =       0.8                  //  80% burn damage
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
	blurb = "The Space Marines or Adeptus Astartes are foremost amongst the defenders of Humanity, the greatest of the Emperor of Mankind's Warriors. They are barely human at all, but superhuman; having been made superior in all respects to a normal man by a harsh regime of genetic modification, psycho-conditioning and rigorous training. Untouched by disease and can take a wound that could kill a normal human instantly. Using ancient power armor that can augment their abilities and wielding the best weapons known to man."
	min_age = 16
	max_age = 18
	blood_volume = 450 // how much blood an Astartes has
	slowdown = -0.25 //Increased move speed
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 250 // a normal human has 200 brain health, Sstartes have 250 //P.S this is brain health
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_A_SKIN_TONE
	strength = STR_HIGH
	genders = list(MALE)

	spawn_flags = null
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON
	inherent_verbs = list()

	radiation_mod = 0.85
//gives assfartes the astartes aura
	base_auras = list(
		/obj/aura/regenerating/human/astartes
		)

/datum/species/human/scout/handle_post_spawn(var/mob/living/carbon/human/scout/H)
	. = ..()
	H.age = rand(min_age,max_age)
	to_chat(H, "<big><span class='warning'>You are the one of His angels! Act like it!</span></big>")

/mob/living/carbon/human/scout
	gender = MALE

/mob/living/carbon/human/scout/New(var/new_loc,var/new_astartes_scout = SPECIES_SCOUT)
	. = ..()
	src.rejuvenate()
	src.job = "Astartes Scout"

/mob/living/carbon/human/scout/Initialize()
	. = ..()
	src.rejuvenate()

/datum/species/human/scion //This is a temporary thing, until the lateparty section is set up.
	name = SPECIES_SCION
	name_plural = "Tempestus Scions"
	primitive_form = SPECIES_HUMAN
	brute_mod =      0.9                    // 90% brute damage
	burn_mod =       0.9                  //  90% burn damage
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
	blurb = "Tempestus Scions, or as they are known in Low Gothic, Storm Troopers, are the elite special forces units of the Astra Militarum and the Inquisition, but officially belong to a subdivision of the Adeptus Administratum known as the Militarum Tempestus."
	min_age = 18
	max_age = 26
	blood_volume = 450
	slowdown = -0.25 //Increased move speed
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 250
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_A_SKIN_TONE
	strength = STR_HIGH
	genders = list(MALE)
	slowdown = -0.4 //Peak physical fitness.
	inherent_verbs = list(
	/mob/living/carbon/human/scion/proc/setupstart
		)
	spawn_flags = null
	species_flags = SPECIES_FLAG_NO_PAIN //Highly trained and indoctrinated, they have great pain tolerance.


/datum/species/human/scion/handle_post_spawn(var/mob/living/carbon/human/scion/H)
	. = ..()
	H.age = rand(min_age,max_age)
	to_chat(H, "<big><span class='warning'>You are a highly trained soldier of the Militarum Tempestus!</span></big>")

/mob/living/carbon/human/scion
	gender = MALE

/mob/living/carbon/human/scion/Initialize()
	. = ..()
	set_species("Tempestus Scion")
	warfare_faction = IMPERIUM
	offer_mob()

/mob/living/carbon/human/scion/proc/request_player() //reqs the player
	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(O.client)
			question(O.client)

/mob/living/carbon/human/scion/proc/question(var/client/C) //asks the questions
	if(!C)
		return FALSE
	var/response = alert(C, "A Tempestus Scion trooper needs a player. Are you interested?", "Tempestus Scion", "Yes", "No",)
	if(!C || ckey)
		return FALSE
	if(response == "Yes")
		transfer_personality(C)
		src.warfare_faction = IMPERIUM
		return TRUE
	return FALSE

/mob/living/carbon/human/scion/proc/transfer_personality(var/client/candidate) //puts the player in the mob.

	if(!candidate)
		return

	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "syndicate"

/mob/living/carbon/human/scion/proc/setupstart()
	set name = "Setup"
	set category = "Setup"
	set desc = "Gives your equipment and stats."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/tempclass = input("Select a Class","Class Selection") as null|anything in list("Tempestus Scion Trooper")
	switch(tempclass)
		if("Tempestus Scion Trooper")
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat/scion, slot_gloves)
			equip_to_slot_or_del(new /obj/item/clothing/under/guard/uniform/scion, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/scion, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/scion, slot_glasses)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/specops, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/security, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/scion, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/scion, slot_shoes)
			equip_to_slot_or_del(new /obj/item/melee/chain/inqcs, slot_s_store)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/tscion, slot_head)
			equip_to_slot_or_del(new /obj/item/grenade/frag/high_yield/krak, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/grenade/frag/high_yield/krak, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/grenade/frag, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/grenade/frag, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/box/ifak/advanced, slot_l_store)
			visible_message("[name] grabs their kit!")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(19,21),rand(19,21),rand(19,21),rand(19,21)) //gives stats str, dext, end, int
			src.add_skills(rand(19,21),rand(19,21),rand(16,18),rand(12,14),rand(12,14)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC) //secondary language
			src.bladder = -INFINITY
			src.bowels = -INFINITY 
			src.thirst = INFINITY
			src.nutrition = INFINITY 
			src.verbs -= /mob/living/carbon/human/scion/proc/setupstart //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/guardsman/W = new
			W.icon_state = "tagred"
			W.assignment = "Tempestus Scion"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

/datum/species/human/officer
	name = SPECIES_OFFICER
	name_plural = "Officers"
	primitive_form = SPECIES_HUMAN
	brute_mod =      0.8                    // 80% brute damage
	burn_mod =       0.8                  //  80% burn damage
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite
		)
	blurb = "A high-ranking Officer."
	min_age = 23
	max_age = 35
	blood_volume = 450 
	spawn_flags = null
	inherent_verbs = list(
	/mob/living/carbon/human/officer/proc/setupstartofficer
	)

/mob/living/carbon/human/officer/proc/setupstartofficer()
	set name = "Setup"
	set category = "Setup"
	set desc = "Gives your equipment and stats."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/officerclass = input("Select a Class","Class Selection") as null|anything in list("Colonel")
	switch(officerclass)
		if("Colonel")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/security/colonel)
			outfit.equip(src)
			src.add_stats(rand(19,21),rand(19,21),rand(19,21),rand(19,21)) //gives stats str, dext, end, int
			src.add_skills(rand(19,21),rand(19,21),rand(16,18),rand(12,14),rand(12,14)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC) //secondary language
			src.bladder = -INFINITY
			src.bowels = -INFINITY 
			src.thirst = INFINITY
			src.nutrition = INFINITY 
			src.verbs -= /mob/living/carbon/human/officer/proc/setupstartofficer //removes verb at the end so they can't spam it for whatever reason
