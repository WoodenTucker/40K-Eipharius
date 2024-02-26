
/datum/species/lateparty/guardsmen
	name = SPECIES_GUARDSMEN
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "A soldier of the Imperial Guard, or Astra Militarum, the primary fighting force of Humanity."
	min_age = 18 //no underage people
	max_age = 80
	gluttonous = GLUT_TINY
	slowdown = -0.1 //slightly fitter than than usual people.
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR
	inherent_verbs = list(
	/mob/living/carbon/human/guardsman/proc/regimentselect,
	/mob/living/carbon/human/proc/igattack,
	/mob/living/carbon/human/proc/igcanthold,
	/mob/living/carbon/human/proc/igcharge,
	/mob/living/carbon/human/proc/igholdline,
	/mob/living/carbon/human/proc/iginhisname,
	/mob/living/carbon/human/proc/igregroup,
	/mob/living/carbon/human/proc/igretreat,
	/mob/living/carbon/human/proc/igrunforlifes,
	/mob/living/carbon/human/proc/igyessir)

/datum/species/lateparty/guardsmen/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)
	if(H.f_style)
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>I need to remember my Regiment! (Check the Guardsman tab)</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	H.regimentselect()
	return ..()

/mob/living/carbon/human/guardsman/proc/regimentselect()
	set name = "Select your Regiment"
	set category = "Setup"
	set desc = "Sets up regiment."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/regiment = input("Select a Class","Class Selection") as null|anything in list("Valhallan", "Cadian", "Krieg", "Catachan")
	switch(regiment)
		if("Valhallan")
			fully_replace_character_name("Valhallan Guardsman [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/guardsman/valhallan)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>You are a Guardsman, one of countless trillions. Your purpose is to serve the Imperium of Mankind. Obey your senior officer, and slay the heretic, xeno, and mutant.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.add_stats(rand(15,18), rand(15,18), rand(15,18), rand (12,16))) //gives stats str, dext, end, int
			src.add_skills(rand(6,10),rand(6,10),rand(3,6),rand(4,6),rand(1,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/guardsman/proc/regimentselect

		if("Cadian")
			fully_replace_character_name("Cadian Guardsman [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/guardsman)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>You are a Guardsman, one of countless trillions. Your purpose is to serve the Imperium of Mankind. Obey your senior officer, and slay the heretic, xeno, and mutant.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.add_stats(rand(15,18), rand(15,18), rand(15,18), rand (12,16)) //gives stats str, dext, end, int
			src.add_skills(rand(6,10),rand(6,10),rand(3,6),rand(4,6),rand(1,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/guardsman/proc/regimentselect

		if("Krieg")
			fully_replace_character_name("Krieg Guardsman [rand(1,100000)]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/guardsman/krieg)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.set_quirk(new/datum/quirk/brave())
			src.implant_loyalty(src)
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>You are a Guardsman, one of countless trillions. Your purpose is to serve the Imperium of Mankind. Obey your senior officer, and slay the heretic, xeno, and mutant.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.add_stats(rand(15,18), rand(15,18), rand(15,18), rand (12,16)) //gives stats str, dext, end, int
			src.add_skills(rand(6,10),rand(6,10),rand(3,6),rand(4,6),rand(1,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/guardsman/proc/regimentselect

		if("Catachan")
			fully_replace_character_name("Catachan Guardsman [real_name]")
			warfare_faction = IMPERIUM
			var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/guardsman/catachan)
			outfit.equip(src)
			src.set_trait(new/datum/trait/death_tolerant())
			src.get_idcard()?.access = get_all_accesses()
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
			src.warfare_faction = IMPERIUM
			to_chat(src, "<span class='notice'><b><font size=3>You are a Guardsman, one of countless trillions. Your purpose is to serve the Imperium of Mankind. Obey your senior officer, and slay the heretic, xeno, and mutant.</font></b></span>")
			src.gender = MALE
			src.f_style = "shaved"
			src.add_stats(rand(15,18), rand(15,18), rand(15,18), rand (12,16)) //gives stats str, dext, end, int
			src.add_skills(rand(6,10),rand(6,10),rand(3,6),rand(4,6),rand(1,6)) //melee, ranged, med, eng, surgery
			src.verbs -= /mob/living/carbon/human/guardsman/proc/regimentselect
