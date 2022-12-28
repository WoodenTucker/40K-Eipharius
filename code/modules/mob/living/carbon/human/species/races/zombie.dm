/datum/species/human/zombie
	name = SPECIES_ZOMBIE
	name_plural = "Zombies"
	icobase = 'Add relevant one here'
	deform = 'Add relevant one here'
	damage_mask = 'Add relevant one here'
	blood_mask = 'Add relevant one here'
	language = LANGUAGE_GALCOM
	min_age = 1 //Irrelevant, but might be used later
	max_age = 8000
	total_health = 300 //Tough plague zombies
	mob_size = MOB_MEDIUM
	strength = STR_VHIGH
	teeth_type = /obj/item/stack/teeth/human
	sexybits_location = BP_GROIN
	var/pain_power = 0 //Zombies, no pain.
	inherent_verbs = list(
	/mob/living/carbon/human/zombie/verb/convert)
	slowdown = 2
	unarmed_types = list(
		/datum/unarmed_attack/rendingclaws,
		/datum/unarmed_attack/rendingclaws,
		)

	has_fine_manipulation = 0
	siemens_coefficient = 0
	gluttonous = GLUT_ANYTHING
	stomach_capacity = MOB_MEDIUM
	darksight = 20

	brute_mod = 1.1// Pretty fragile.
	burn_mod = 1.8 // FIRE BURNS

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_PAIN
	appearance_flags = HAS_EYE_COLOR | HAS_SKIN_COLOR

	blood_color = "#05ee05"

	gibbed_anim = "gibbed-a"
	dusted_anim = "dust-a"
	death_message = "lets out a waning guttural screech, blood bubbling from its maw."
	death_sound = 'sound/voice/hiss6.ogg'

	speech_chance = 100

	breath_type = null
	poison_type = null

	vision_flags = SEE_SELF|SEE_MOBS

/datum/species/human/zombie/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for nidders
	if(H.f_style)//They're a walking corpse
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>I have seen Grandfather's light! I must serve the cultists of Nurgle, and convert corpses. (Check your Zombie tab.)</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()
