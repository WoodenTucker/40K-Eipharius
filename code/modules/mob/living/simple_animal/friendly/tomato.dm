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

/mob/living/simple_animal/daemonhost
	name = "Daemon Host"
	real_name = "Daemon Host" 
	desc = "It's a horrifyingly enormous daemon host..."
	icon = 'icons/mob/Demon.dmi'
	icon_state = "herald"
	icon_living = "herald"
	icon_dead = "herald_dead"
	speak_chance = 0
	turns_per_move = 5
	maxHealth = 600
	health = 600
	response_help  = "caresses"
	response_disarm = "slams"
	response_harm   = "rends"
	harm_intent_damage = 80
	melee_damage_upper = 100
	melee_damage_lower = 70
	attacktext = "torn"