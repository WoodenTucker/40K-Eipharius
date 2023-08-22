/mob/living/simple_animal/hostile/syndicate
	name = "Traitor Guardsman" // They're not very smart and aren't sprited well. Shoots kantrael laser projectiles and stabs with bayonet up close.
	desc = "Battle worn and exhausted, they stare right through you."
	icon_state = "traitorguard1"
	icon_living = "traitorguard1"
	icon_dead = "traitorguard1_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 35
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 3 // Their speed is low to prevent them from charging into melee range immediately.
	stop_automated_movement_when_pulled = 0
	maxHealth = 250
	health = 250
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
	faction = "Chaos"
	status_flags = CANPUSH

	ranged = 1
	rapid = 1
	projectilesound = 'sound/weapons/lasgun.ogg'
	projectiletype = /obj/item/projectile/beam

///////////////Sword and shield////////////
/*
/mob/living/simple_animal/hostile/syndicate/ranged //
	ranged = 1
	rapid = 1
	icon_state = "traitorguard"
	icon_living = "traitorguard"
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/rifle/a556

/mob/living/simple_animal/hostile/syndicate/ranged/New()
	..()
	switch(rand(1,3))
		if(1)
			icon_state = "traitorguard1"
			icon_living = "traitorguard1"
			icon_dead = "traitorguard1_dead"
			rapid = 0
			maxHealth = 340
			health = 340
			projectilesound = "brifle"
			projectiletype = /obj/item/projectile/bullet/rifle/a762/brifle
		if(2)
			icon_state = "traitorguard2"
			icon_living = "traitorguard2"
			icon_dead = "traitorguard2_dead"
			rapid = 1
			maxHealth = 290
			health = 290
			projectilesound = 'sound/weapons/gunshot/lasgun.ogg'
			projectiletype = /obj/item/projectile/energy/las/lasgun/overcharge
		if(3)
			icon_state = "traitorguard3"
			icon_living = "traitorguard3"
			icon_dead = "traitorguard3_dead"
			rapid = 1
			maxHealth = 250
			health = 250
			projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'
			projectiletype = /obj/item/projectile/bullet/pistol
*/
/mob/living/simple_animal/hostile/syndicate/ranged/space // Same as above but more HP.
	icon_state = "traitorguard2"
	icon_living = "traitorguard2"
	icon_dead = "traitorguard2_dead"
	name = "Veteran Traitor Guardsmen"
	maxHealth = 340
	health = 340
	speed = 2

/mob/living/simple_animal/hostile/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon = 'icons/mob/critter.dmi'
	icon_state = "viscerator_attack"
	icon_living = "viscerator_attack"
	pass_flags = PASS_FLAG_TABLE
	health = 75
	maxHealth = 75
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

/mob/living/simple_animal/hostile/syndicate/ranged/space/cpt // Like the Veteran but with different icon
	icon_state = "traitorcpt_khorne"
	icon = 'icons/map_project/creatures.dmi'
	icon_living = "traitorcpt_khorne"
	icon_dead = "traitorguardcpt_dead"
	name = "Traitor Capitan"
	desc = "A traitor capitan, this one seems to have been gifted by the ruinous powers, making him stronger than the rest."
	maxHealth = 550
	health = 550
	speed = 1