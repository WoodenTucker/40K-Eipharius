//angry hungry bird boys


/datum/species/kroot
	name = "Kroot"
	name_plural = "Kroot"
	secondary_langs = list(LANGUAGE_TAU)
	damage_mask = 'icons/mob/human_races/masks/dam_mask_child.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_child.dmi'
	blurb = "The Kroot are a vassal species to the Tau Empire. Rather bitey. Basically carnivorous space chickens who look like a cross between Native Americans, the dreadlocked aliens from Predator, and ancient Terran terror birds, with a bit of D&D's Aarakocora thrown in. They steal genetic traits of things they eat, and work for people who aren't the Tau. Which means they are cool. "
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ANYTHING
	total_health = 250
	mob_size = MOB_MEDIUM
	strength = STR_MEDIUM
	inherent_verbs = list()


/mob/living/carbon/human/kroot

	name = "Kroot"
	desc = "Tall, lanky and hungry."
	icon = 'icons/mob/kroot.dmi'
	icon_state = "kroot"
	pass_flags = PASS_FLAG_TABLE
	health = 150
	maxHealth = 150
	mob_size = 4
	languages = LANGUAGE_TAU

	var/adult_form
	var/dead_icon
	var/time_of_birth
	var/language
	var/death_msg = "lets out a waning guttural screech, green blood bubbling from its maw."
	var/can_namepick_as_adult = 0
	var/adult_name
	var/instance_num

/mob/living/carbon/human/kroot/New()

	time_of_birth = world.time

	verbs += /mob/living/proc/hide

	instance_num = rand(1, 1000)
	name = "[initial(name)] ([instance_num])"
	real_name = name
	regenerate_icons()

	if(language)
		add_language(language)

	gender = NEUTER

	..()