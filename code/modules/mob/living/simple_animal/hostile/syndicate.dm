/mob/living/simple_animal/hostile/syndicate
	name = "Traitor Guardsman" // They're not very smart and aren't sprited well. Shoots kantrael laser projectiles and stabs with bayonet up close.
	desc = "Battle worn and exhausted, they stare right through you."
	icon_state = "traitorguard"
	icon_living = "traitorguard"
	icon_dead = "traitorguard_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 3 // Their speed is low to prevent them from charging into melee range immediately.
	stop_automated_movement_when_pulled = 0
	maxHealth = 170
	health = 170
	harm_intent_damage = 5
	melee_damage_lower = 20
	melee_damage_upper = 30
	wander = 1
	see_in_dark = 6
	attacktext = "stabbed"
	a_intent = I_HURT
	// var/corpse = /obj/effect/landmark/corpse/syndicate
	// var/weapon1
	// var/weapon2
	unsuitable_atoms_damage = 15
	environment_smash = 1
	faction = "chaos"
	status_flags = CANPUSH

	ranged = 1
	rapid = 1
	projectilesound = 'sound/weapons/lasgun.ogg'
	projectiletype = /obj/item/projectile/beam

///////////////Sword and shield////////////

/mob/living/simple_animal/hostile/syndicate/ranged // 
	ranged = 1
	rapid = 1
	icon_state = "traitorguard"
	icon_living = "traitorguard"
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/rifle/a556

/mob/living/simple_animal/hostile/syndicate/ranged/space // Same as above but more HP.
	icon_state = "traitorguard"
	icon_living = "traitorguard"
	name = "Veteran Traitor Guardsmen"
	maxHealth = 240
	health = 240
	speed = 2

/mob/living/simple_animal/hostile/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon = 'icons/mob/critter.dmi'
	icon_state = "viscerator_attack"
	icon_living = "viscerator_attack"
	pass_flags = PASS_FLAG_TABLE
	health = 15
	maxHealth = 15
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "cut"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = "syndicate"
	min_gas = null
	max_gas = null
	minbodytemp = 0

/mob/living/simple_animal/hostile/viscerator/death(gibbed, deathmessage, show_dead_message)
	..(null,"is smashed into pieces!", show_dead_message)
	qdel(src)
