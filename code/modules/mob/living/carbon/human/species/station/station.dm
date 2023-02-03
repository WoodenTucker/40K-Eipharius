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
	blood_volume = 450 // how much blood a retardes has
	slowdown = -0.25 //Increased move speed
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 250 // a normal human has 200 brain health, retardes have 250 //P.S this is brain health
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
