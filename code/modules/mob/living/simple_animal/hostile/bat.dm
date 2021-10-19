/mob/living/simple_animal/hostile/scarybat
	name = "swarm"
	desc = "A swarm of disgusting flesh eating insects."
	icon = 'icons/mob/animal.dmi'
	icon_state = "swarm"
	icon_living = "swarm"
	icon_dead = "lizard_dead"
	icon_gib = "lizard_dead"
	speak_chance = 0
	turns_per_move = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	speed = 0
	maxHealth = 50
	health = 50

	harm_intent_damage = 8
	melee_damage_lower = 2
	melee_damage_upper = 8
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'

	min_gas = null
	max_gas = null
	minbodytemp = 0

	environment_smash = 1

	faction = "scarybat"
	var/mob/living/owner

/mob/living/simple_animal/hostile/scarybat/New(loc, mob/living/L as mob)
	..()
	if(istype(L))
		owner = L

/mob/living/simple_animal/hostile/scarybat/FindTarget()
	. = ..()
	if(.)
		emote("flutters towards [.]")

/mob/living/simple_animal/hostile/scarybat/Found(var/atom/A)//This is here as a potential override to pick a specific target if available
	if(istype(A) && A == owner)
		return 0
	return ..()

/mob/living/simple_animal/hostile/scarybat/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Stun(1)
			L.visible_message("<span class='danger'>\the [src] scares \the [L]!</span>")

/mob/living/simple_animal/hostile/scarybat/cult
	faction = "cult"
	supernatural = 1

/mob/living/simple_animal/hostile/scarybat/cult/cultify()
	return
