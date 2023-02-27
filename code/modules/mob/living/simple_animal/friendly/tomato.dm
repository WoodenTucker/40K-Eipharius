/mob/living/simple_animal/tomato
	name = "tomato"
	desc = "It's a horrifyingly enormous beef tomato, and it's packing extra beef!"
	icon_state = "tomato"
	icon_living = "tomato"
	icon_dead = "tomato_dead"
	speak_chance = 0
	turns_per_move = 5
	maxHealth = 15
	health = 15
	meat_type = /obj/item/reagent_containers/food/snacks/tomatomeat
	response_help  = "prods"
	response_disarm = "pushes aside"
	response_harm   = "smacks"
	harm_intent_damage = 5
	melee_damage_upper = 15
	melee_damage_lower = 10
	attacktext = "mauled"

/mob/living/simple_animal/playerdaemonhost
	name = "Daemon Host"
	real_name = "Daemon Host" 
	desc = "It's a horrifyingly enormous daemon host..."
	icon = 'icons/mob/Demon.dmi'
	icon_state = "herald"
	icon_living = "herald"
	icon_dead = "herald_dead"
	speak_chance = 0
	turns_per_move = 5
	maxHealth = 1500
	health = 1500
	response_help  = "caresses"
	response_disarm = "slams"
	response_harm   = "rends"
	harm_intent_damage = 100
	melee_damage_upper = 120
	melee_damage_lower = 90
	attacktext = "torn"
	faction = "Nurgle"

	speed = 1.5

/mob/living/simple_animal/playerzombie
	name = "Plague Beast"
	real_name = "Plague Beast"
	desc = "This violent mass of flesh and meat scatters toward you." 
	icon = 'icons/mob/Demon.dmi'
	icon_state = "plague"
	icon_living = "plague"
	icon_dead = "plague_dead"
	speak_chance = 0
	maxHealth = 560
	health = 560
	turns_per_move = 5
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "bites"
	see_in_dark = 6
	harm_intent_damage = 60
	melee_damage_upper = 70
	melee_damage_lower = 50
	faction = "Nurgle"

	speed = 1.5