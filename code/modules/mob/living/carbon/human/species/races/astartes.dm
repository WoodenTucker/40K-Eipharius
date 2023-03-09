/*
Astartes
*/

//adminspawning these in still doesn't work, need to be rejuvenated

/datum/species/human/astartes
	name = SPECIES_ASTARTES
	name_plural = "Astartes"
	primitive_form = SPECIES_HUMAN
	brute_mod =      0.8                    //
	burn_mod =       0.8                  //
	unarmed_types = list(/datum/unarmed_attack/stomp/astartes, /datum/unarmed_attack/kick/astartes, /datum/unarmed_attack/punch/astartes, /datum/unarmed_attack/bite/astartes)
	blurb = "The Space Marines or Adeptus Astartes are foremost amongst the defenders of Humanity, the greatest of the Emperor of Mankind's Warriors. They are barely human at all, but superhuman; having been made superior in all respects to a normal man by a harsh regime of genetic modification, psycho-conditioning and rigorous training. Untouched by disease and can take a wound that could kill a normal human instantly. Using ancient power armor that can augment their abilities and wielding the best weapons known to man."
	min_age = 25
	max_age = 500
	icon_template = 'icons/mob/human_races/r_template_tall.dmi'
	icobase = 'icons/mob/human_races/r_astartes.dmi'
	deform = 'icons/mob/human_races/r_astartes.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	eye_icon_location = 'icons/mob/astartes_face.dmi'
	blood_volume = 620 // how much blood an Astartes has
	slowdown = -0.1 //Increased move speed
	eye_icon = "eyes_s"
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 350 // a normal human has 200 brain health, Astartes have 350 //P.S this is brain health
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_A_SKIN_TONE
	mob_size = MOB_LARGE
	strength = STR_VHIGH //Duplicate definition here.
	var/pain_power = 20
	genders = list(MALE)
	teeth_type = /obj/item/stack/teeth/human //Teeth
	//sexybits_location = BP_GROIN //dude, they have no balls - they actually do, it's old myth since they have libido being put down to the rock bottom
	species_flags = SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_SLIP
	inherent_verbs = list(
	/mob/living/carbon/human/astartes/proc/chapterselect,
	/mob/living/carbon/human/proc/astachaos,
	/mob/living/carbon/human/proc/astacharge,
	/mob/living/carbon/human/proc/astacrush,
	/mob/living/carbon/human/proc/astadamage,
	/mob/living/carbon/human/proc/astadiescum,
	/mob/living/carbon/human/proc/astaeatboltgun,
	/mob/living/carbon/human/proc/astafaithshield,
	/mob/living/carbon/human/proc/astafallback,
	/mob/living/carbon/human/proc/astaforglory,
	/mob/living/carbon/human/proc/astagrenades,
	/mob/living/carbon/human/proc/astakill,
	/mob/living/carbon/human/proc/astanonestopus,
	/mob/living/carbon/human/proc/astaourwrath,
	/mob/living/carbon/human/proc/astaready,
	/mob/living/carbon/human/proc/astatoglory,
	/mob/living/carbon/human/proc/astaxenos
	)
	radiation_mod = 0.7


	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/unbreakable/astartes),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unbreakable/astartes),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unbreakable/astartes),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/unbreakable/astartes),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/unbreakable/astartes),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/unbreakable/astartes),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/unbreakable/astartes),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/unbreakable/astartes),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/unbreakable/astartes),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/unbreakable/astartes),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/unbreakable/astartes)
		)

//gives them the astartes aura
	base_auras = list(
		/obj/aura/regenerating/human/astartes
		)


/datum/species/human/astartes/handle_post_spawn(var/mob/living/carbon/human/astartes/H)
	. = ..()
	H.age = rand(min_age,max_age)//Astartes ages are all over.
	to_chat(H, "<big><span class='warning'>You are one of His angels! Act like it!</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
//	H.rejuvenate()
//	H.job = "Astartes Envoy"
//	return ..()

///mob/living/carbon/human
//	var/new_astartes = SPECIES_ASTARTES

/mob/living/carbon/human/astartes
	gender = MALE

/mob/living/carbon/human/astartes/New(var/new_loc,var/new_astartes = SPECIES_ASTARTES)
	. = ..()
	src.rejuvenate()
	src.job = "Astartes Envoy"


/mob/living/carbon/human/astartes/Initialize()
	. = ..()
	src.rejuvenate()

/mob/living/carbon/human/astartes/proc/chapterselect()
	set name = "Remember your Chapter!"
	set category = "Setup"
	set desc = "Gives Astartes Chapter."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/astarteschapter = input("Select a Chapter","Chapter Selection") as null|anything in list("Ultramarine", "Salamander", "Blood Angel", "Raven Guard")
	switch(astarteschapter)
		if("Ultramarine")
			src.verbs -= /mob/living/carbon/human/astartes/proc/chapterselect
			src.verbs += /mob/living/carbon/human/astartes/proc/astartesequipu
			client?.color = null

	switch(astarteschapter)
		if("Salamander")
			src.verbs -= /mob/living/carbon/human/astartes/proc/chapterselect
			src.verbs += /mob/living/carbon/human/astartes/proc/astartesequips
			client?.color = null

	switch(astarteschapter)
		if("Blood Angel")
			src.verbs -= /mob/living/carbon/human/astartes/proc/chapterselect
			src.verbs += /mob/living/carbon/human/astartes/proc/astartesequipba
			client?.color = null

	switch(astarteschapter)
		if("Raven Guard")
			src.verbs -= /mob/living/carbon/human/astartes/proc/chapterselect
			src.verbs += /mob/living/carbon/human/astartes/proc/astartesequiprg
			client?.color = null

//Ultramarines

/mob/living/carbon/human/astartes/proc/astartesequipu()
	set name = "Retrieve your Equipment!"
	set category = "Setup"
	set desc = "Gives Astartes Equipment."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/astartesu = input("Select a Class","Class Selection") as null|anything in list("Tactical Marine", "Apothecary", "Techmarine", "Sergeant")
	switch(astartesu)
		if("Tactical Marine")
			fully_replace_character_name("Brother [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ultramarine)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Ultramarines, sons of Guilliman, creator of the Codex Astartes.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(12,14),rand(12,14),rand(5,7),rand(5,6),rand(3,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipu

	switch(astartesu)
		if("Apothecary")
			fully_replace_character_name("Apothecary [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ultrapoth)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Ultramarines, sons of Guilliman, creator of the Codex Astartes.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(12,18),rand(5,6),rand(12,16)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipu

	switch(astartesu)
		if("Techmarine")
			fully_replace_character_name("Techmarine [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ultratech)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Ultramarines, sons of Guilliman, creator of the Codex Astartes.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(5,7),rand(12,16),rand(4,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipu

	switch(astartesu)
		if("Sergeant")
			fully_replace_character_name("Brother-Sergeant [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ultramarine/sergeant)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Ultramarines, sons of Guilliman, creator of the Codex Astartes.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(16,18),rand(16,18),rand(8,10),rand(6,8),rand(6,8)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipu

//Salamanders

/mob/living/carbon/human/astartes/proc/astartesequips()
	set name = "Retrieve your Equipment!"
	set category = "Setup"
	set desc = "Gives Astartes Equipment."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/astartess = input("Select a Class","Class Selection") as null|anything in list("Tactical Marine", "Apothecary", "Techmarine", "Sergeant")
	switch(astartess)
		if("Tactical Marine")
			fully_replace_character_name("Brother [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/salamander)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Salamanders, sons of Vulkan, the Perpetual Primarch.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(12,14),rand(12,14),rand(5,7),rand(5,6),rand(3,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequips

	switch(astartess)
		if("Apothecary")
			fully_replace_character_name("Apothecary [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/salapoth)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Salamanders, sons of Vulkan, the Perpetual Primarch.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(12,18),rand(5,6),rand(12,16)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequips

	switch(astartess)
		if("Techmarine")
			fully_replace_character_name("Techmarine [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/saltech)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Salamanders, sons of Vulkan, the Perpetual Primarch.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(5,7),rand(12,16),rand(4,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequips

	switch(astartess)
		if("Sergeant")
			fully_replace_character_name("Brother-Sergeant [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/salamander/sergeant)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Salamanders, sons of Vulkan, the Perpetual Primarch.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(16,18),rand(16,18),rand(8,10),rand(6,8),rand(6,8)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequips

//Blood Angels

/mob/living/carbon/human/astartes/proc/astartesequipba()
	set name = "Retrieve your Equipment!"
	set category = "Setup"
	set desc = "Gives Astartes Equipment."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/astartesba = input("Select a Class","Class Selection") as null|anything in list("Tactical Marine", "Sanguinary Priest", "Techmarine")
	switch(astartesba)
		if("Tactical Marine")
			fully_replace_character_name("Brother [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Blood Angels, sons of Sanguinius, betrayed by Horus during the Heresy.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(12,14),rand(12,14),rand(5,7),rand(5,6),rand(3,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipba

	switch(astartesba)
		if("Sanguinary Priest")
			fully_replace_character_name("Apothecary [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/bangapoth)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Blood Angels, sons of Sanguinius, betrayed by Horus during the Heresy.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(12,18),rand(5,6),rand(12,16)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipba

	switch(astartesba)
		if("Techmarine")
			fully_replace_character_name("Techmarine [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/bangtech)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your chapter is The Blood Angels, sons of Sanguinius, betrayed by Horus during the Heresy.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(5,7),rand(12,16),rand(4,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequipba

//Raven Guard

/mob/living/carbon/human/astartes/proc/astartesequiprg()
	set name = "Retrieve your Equipment!"
	set category = "Setup"
	set desc = "Gives Astartes Equipment."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/astartesrg = input("Select a Class","Class Selection") as null|anything in list("Tactical Marine", "Apothecary", "Techmarine", "Sergeant")
	switch(astartesrg)
		if("Tactical Marine")
			fully_replace_character_name("Brother [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ravenguard)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. c</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(12,14),rand(12,14),rand(5,7),rand(5,6),rand(3,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequiprg

	switch(astartesrg)
		if("Apothecary")
			fully_replace_character_name("Apothecary [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ravapoth)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your Chapter is the Raven Guard, sons of Corvus Corax, and one of the victims of the Istvaan V Dropsite massacre.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(12,18),rand(5,6),rand(12,16)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequiprg

	switch(astartesrg)
		if("Techmarine")
			fully_replace_character_name("Techmarine [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/raventech)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your Chapter is the Raven Guard, sons of Corvus Corax, and one of the victims of the Istvaan V Dropsite massacre.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(10,12),rand(10,12),rand(5,7),rand(12,16),rand(4,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequiprg

	switch(astartesrg)
		if("Sergeant")
			fully_replace_character_name("Brother-Sergeant [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/astartes/ravenguard/Sergeant)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>Forged by the God Emperor for grim purpose, you are charged to cleanse the mutant, the heretic - the alien. A morte perpetua, domine, libra nos. That thou wouldst bring them only death, that thou shouldst spare none. Even in the face of death, you shall not submit. Your Chapter is the Raven Guard, sons of Corvus Corax, and one of the victims of the Istvaan V Dropsite massacre.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.h_style = "Bald"
			src.bladder = -INFINITY
			src.bowels = -INFINITY //integrated shitter
			src.adjustStaminaLoss(-INFINITY) //astartes have basically infinite fight in them
			src.vice = null //off for now
			src.add_stats(32, 28, 24, 22) //gives stats str, dext, end, int
			src.add_skills(rand(16,18),rand(16,18),rand(8,10),rand(6,8),rand(6,8)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/astartes/proc/astartesequiprg



/obj/item/organ/external/chest/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1

/obj/item/organ/external/groin/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 0
	encased = "lower ribcage"

/obj/item/organ/external/arm/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	gibbable = TRUE

/obj/item/organ/external/arm/right/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	gibbable = TRUE

/obj/item/organ/external/leg/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	gibbable = TRUE

/obj/item/organ/external/leg/right/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	gibbable = TRUE

/obj/item/organ/external/foot/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	can_stand = 1
	gibbable = TRUE

/obj/item/organ/external/foot/right/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	can_stand = 1
	gibbable = TRUE

/obj/item/organ/external/hand/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	can_grasp = 1
	gibbable = TRUE

/obj/item/organ/external/hand/right/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	can_grasp = 1
	gibbable = TRUE

/obj/item/organ/external/head/unbreakable/astartes
	dislocated = -1
	arterial_bleed_severity = 0.1
	cannot_break = 1
	gibbable = TRUE
