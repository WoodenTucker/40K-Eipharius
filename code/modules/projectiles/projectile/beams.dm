/obj/item/projectile/beam
	name = "laser"
	icon_state = "laser"
	fire_sound='sound/weapons/gunshot/lasgun2.ogg'
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	// pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GLASS | PASS_FLAG_GRILLE // Removing pass flags because only AI mobs use beam weapons now.
	damage = 20
	armor_penetration = 20
	damage_type = BURN
	sharp = 1 //concentrated burns
	check_armour = "laser"
	eyeblur = 4
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact

/obj/item/projectile/beam/practice
	name = "laser"
	icon_state = "laser"
	fire_sound = 'sound/weapons/Taser.ogg'
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GLASS | PASS_FLAG_GRILLE
	damage = 2
	damage_type = BURN
	check_armour = "laser"
	eyeblur = 2

/obj/item/projectile/beam/incendiary_laser
	name = "volkite laser blast"
	icon_state = "beam_incen"
	fire_sound='sound/weapons/gunshot/lasgun2.ogg'
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage = 70
	agony = 8
	eyeblur = 8
	sharp = FALSE
	armor_penetration = 40

	muzzle_type = /obj/effect/projectile/incen/muzzle
	tracer_type = /obj/effect/projectile/incen/tracer
	impact_type = /obj/effect/projectile/incen/impact

/obj/item/projectile/beam/incendiary_laser/on_hit(atom/target, blocked = 0)
	..()
	if(isliving(target))
		var/mob/living/L = target
		L.adjust_fire_stacks(rand(2,4))
		if(L.fire_stacks >= 3)
			L.IgniteMob()


/obj/item/projectile/beam/smalllaser
	damage = 25

/obj/item/projectile/beam/midlaser
	damage = 50
	armor_penetration = 20

/obj/item/projectile/beam/heavylaser
	name = "heavy laser"
	icon_state = "heavylaser"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	damage = 60
	armor_penetration = 30

	muzzle_type = /obj/effect/projectile/laser/heavy/muzzle
	tracer_type = /obj/effect/projectile/laser/heavy/tracer
	impact_type = /obj/effect/projectile/laser/heavy/impact

/obj/item/projectile/beam/plasmabeam
	name = "plasma beam"
	icon_state = "heavylaser"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	damage = 200
	armor_penetration = 40

	muzzle_type = /obj/effect/projectile/laser/heavy/muzzle
	tracer_type = /obj/effect/projectile/laser/heavy/tracer
	impact_type = /obj/effect/projectile/laser/heavy/impact

/obj/item/projectile/beam/pulse/bogani
	name = "pulsar"
	icon_state = "bogb"
	fire_sound='sound/weapons/blaster.ogg'
	damage = 30

	//muzzle_type = /obj/effect/projectile/laser/bogani/muzzle
	tracer_type = /obj/effect/projectile/laser/bogani/tracer
	impact_type = /obj/effect/projectile/laser/bogani/impact

/obj/item/projectile/beam/emitter
	name = "emitter beam"
	icon_state = "emitter"
	fire_sound = 'sound/weapons/emitter.ogg'
	damage = 0 // The actual damage is computed in /code/modules/power/singularity/emitter.dm

	muzzle_type = /obj/effect/projectile/laser/emitter/muzzle
	tracer_type = /obj/effect/projectile/laser/emitter/tracer
	impact_type = /obj/effect/projectile/laser/emitter/impact

/obj/item/projectile/beam/lastertag/blue
	name = "lasertag beam"
	icon_state = "bluelaser"
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GLASS | PASS_FLAG_GRILLE
	damage = 0
	no_attack_log = 1
	damage_type = BURN
	check_armour = "laser"

	muzzle_type = /obj/effect/projectile/laser/blue/muzzle
	tracer_type = /obj/effect/projectile/laser/blue/tracer
	impact_type = /obj/effect/projectile/laser/blue/impact

/obj/item/projectile/beam/lastertag/blue/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		if(istype(M.wear_suit, /obj/item/clothing/suit/redtag))
			M.Weaken(5)
	return 1

/obj/item/projectile/beam/lastertag/red
	name = "lasertag beam"
	icon_state = "laser"
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GLASS | PASS_FLAG_GRILLE
	damage = 0
	no_attack_log = 1
	damage_type = BURN
	check_armour = "laser"

/obj/item/projectile/beam/lastertag/red/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		if(istype(M.wear_suit, /obj/item/clothing/suit/bluetag))
			M.Weaken(5)
	return 1

/obj/item/projectile/beam/lastertag/omni//A laser tag bolt that stuns EVERYONE
	name = "lasertag beam"
	icon_state = "omnilaser"
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GLASS | PASS_FLAG_GRILLE
	damage = 0
	damage_type = BURN
	check_armour = "laser"

	muzzle_type = /obj/effect/projectile/laser/omni/muzzle
	tracer_type = /obj/effect/projectile/laser/omni/tracer
	impact_type = /obj/effect/projectile/laser/omni/impact

/obj/item/projectile/beam/lastertag/omni/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		if((istype(M.wear_suit, /obj/item/clothing/suit/bluetag))||(istype(M.wear_suit, /obj/item/clothing/suit/redtag)))
			M.Weaken(5)
	return 1

/obj/item/projectile/beam/sniper
	name = "sniper beam"
	icon_state = "xray"
	fire_sound = 'sound/weapons/marauder.ogg'
	damage = 50
	armor_penetration = 40
	stun = 3
	weaken = 3
	stutter = 3

	muzzle_type = /obj/effect/projectile/laser/xray/muzzle
	tracer_type = /obj/effect/projectile/laser/xray/tracer
	impact_type = /obj/effect/projectile/laser/xray/impact

/obj/item/projectile/beam/stun
	name = "stun beam"
	icon_state = "stun"
	fire_sound = 'sound/weapons/Taser.ogg'
	check_armour = "energy"
	sharp = 0 //not a laser
	agony = 40
	damage_type = STUN

	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact

/obj/item/projectile/beam/stun/heavy
	name = "heavy stun beam"
	agony = 60

/obj/item/projectile/beam/stun/shock
	name = "shock beam"
	damage_type = ELECTROCUTE
	damage = 10
	agony  = 5
	fire_sound='sound/weapons/pulse.ogg'

/obj/item/projectile/beam/stun/shock/heavy
	name = "heavy shock beam"
	damage = 20
	agony  = 10

/obj/item/projectile/beam/lascannon
	name = "lascannon beam"
	icon_state = "heavylaser"
	fire_sound='sound/weapons/lasercannonfire.ogg'
	damage = 400
	armor_penetration = 40
	penetrating = 100
	muzzle_type = /obj/effect/projectile/laser/heavy/muzzle
	tracer_type = /obj/effect/projectile/laser/heavy/tracer
	impact_type = /obj/effect/projectile/laser/heavy/impact

/obj/item/projectile/beam/multilas
	name = "multilas beam"
	damage = 30

