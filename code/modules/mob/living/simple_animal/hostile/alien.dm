/mob/living/simple_animal/hostile/alien
	name = "tyranid gaunt"
	desc = "Hiss!"
	icon = 'icons/mob/alien.dmi'
	icon_state = "alienh_running"
	icon_living = "alienh_running"
	icon_dead = "alienh_dead"
	icon_gib = "syndicate_gib"
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 2
	resistance = 2
	meat_type = /obj/item/reagent_containers/food/snacks/xenomeat
	maxHealth = 500
	health = 500
	harm_intent_damage = 55
	melee_damage_lower = 55
	melee_damage_upper = 55
	attacktext = "slashed"
	a_intent = I_HURT
	attack_sound = 'sound/weapons/bladeslice.ogg'
	min_gas = null
	max_gas = null
	unsuitable_atoms_damage = 15
	faction = "alien"
	environment_smash = 2
	status_flags = CANPUSH
	minbodytemp = 0
	heat_damage_per_tick = 20
	move_to_delay = 3


/mob/living/simple_animal/hostile/alien/drone
	name = "tyranid gaunt"
	icon_state = "aliend_running"
	icon_living = "aliend_running"
	icon_dead = "aliend_dead"
	health = 400
	melee_damage_lower = 45
	melee_damage_upper = 45

/mob/living/simple_animal/hostile/alien/drone/ux
	name = "unidentified xeno"
	desc = "An unidentified xeno. It looks as though it was killed with a bolter shot to the cranium, perfect for study."
	health = 0
	maxHealth = 0


/mob/living/simple_animal/hostile/alien/sentinel
	name = "tyranid termagaunt"
	icon_state = "aliens_running"
	icon_living = "aliens_running"
	icon_dead = "aliens_dead"
	health = 400
	melee_damage_lower = 45
	melee_damage_upper = 45
	ranged = 1
	projectiletype = /obj/item/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'


/mob/living/simple_animal/hostile/alien/queen
	name = "tyranid lictor"
	icon_state = "alienq_running"
	icon_living = "alienq_running"
	icon_dead = "alienq_dead"
	health = 1150
	maxHealth = 1150
	melee_damage_lower = 85
	melee_damage_upper = 85
	ranged = 1
	move_to_delay = 2
	projectiletype = /obj/item/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'
	rapid = 1
	status_flags = 0

/mob/living/simple_animal/hostile/alien/queen/large
	name = "tyranid carnifex"
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "queen_s"
	icon_living = "queen_s"
	icon_dead = "queen_dead"
	move_to_delay = 4
	maxHealth = 2500
	health = 2500

/obj/item/projectile/neurotox
	damage = 30
	icon_state = "toxin"

/mob/living/simple_animal/hostile/alien/death(gibbed, deathmessage, show_dead_message)
	..(gibbed, deathmessage = "lets out a waning guttural screech, green blood bubbling from its maw...", show_dead_message)
	playsound(src, 'sound/voice/hiss6.ogg', 100, 1)