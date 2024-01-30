/spell/hand
	var/min_range = 0
	var/list/compatible_targets = list(/atom)
	var/spell_delay = 5
	var/move_delay
	var/click_delay
	var/hand_state = "spell"
	var/show_message

/spell/hand/choose_targets(mob/user = usr)
	return list(user)

/spell/hand/cast_check(skipcharge = 0,mob/user = usr, var/list/targets)
	if(!..())
		return 0
	if(targets)
		for(var/target in targets)
			var/mob/M = target
			if(M.get_active_hand())
				to_chat(user, "<span class='warning'>You need an empty hand to cast this spell.</span>")
				return 0
	return 1

/spell/hand/cast(list/targets, mob/user)
	for(var/mob/M in targets)
		if(M.get_active_hand())
			to_chat(user, "<span class='warning'>You need an empty hand to cast this spell.</span>")
			return
		var/obj/item/magic_hand/H = new(src)
		if(!M.put_in_active_hand(H))
			qdel(H)
			return
	return 1

/spell/hand/proc/valid_target(var/atom/a,var/mob/user) //we use seperate procs for our target checking for the hand spells.
	var/distance = get_dist(a,user)
	if((min_range && distance < min_range) || (range && distance > range))
		return 0
	if(!is_type_in_list(a,compatible_targets))
		return 0
	return 1

/spell/hand/proc/cast_hand(var/atom/a,var/mob/user) //same for casting.
	return 1

/spell/hand/charges
	var/casts = 1
	var/max_casts = 1

/spell/hand/charges/cast(list/targets, mob/user)
	. = ..()
	if(.)
		casts = max_casts
		to_chat(user, "You ready the [name] spell ([casts]/[casts] charges).")

/spell/hand/charges/cast_hand()
	if(casts-- && ..())
		to_chat(holder, "<span class='notice'>The [name] spell has [casts] out of [max_casts] charges left</span>")
	return !!casts


/spell/hand/charges/lightning
	name = "Lightning Blast"
	desc = "Call forth a blast of ethereal lightning."

	spell_flags = 0
	charge_max = 600
	invocation = "opens their hand, which bursts into crackling lightning."
	invocation_type = SpI_EMOTE

	range = 7
	max_casts = 2
	compatible_targets = list(/atom)
	hud_state = "wiz_bshard"

/spell/hand/charges/lightning/cast_hand(var/atom/A,var/mob/user)
	var/obj/item/projectile/lightning/B = new(get_turf(user))
	B.firer = user
	B.launch_projectile(A, BP_CHEST)
	user.visible_message("<span class='danger'>\The [user] shoots out a crackling blast of lightning from their hand!</span>")
	return ..()

/obj/item/projectile/lightning
	name = "lightning"
	damage = 35
	check_armour = "energy"
	armor_penetration = 48
	icon_state = "laser_musket"
	damage_type = BURN

/obj/item/projectile/lightning/on_hit(var/atom/movable/target, var/blocked = 0)
	if(..())
		if(istype(target, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = target
			H.flash_eyes()
			H.eye_blurry += 4
			H.Weaken(20)
			H.visible_message("<span class='danger'>Lightning crackles across \the [H]'s skin!</span>")

/obj/item/projectile/bullet/pellet/lightning
	name = "lightning spark"
	damage = 4
	check_armour = "energy"
	armor_penetration = 48


/obj/item/projectile/bullet/pellet/lightning/on_hit(var/atom/movable/target, var/blocked = 0)
	if(..())
		if(istype(target, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = target
			H.flash_eyes()
			H.eye_blurry += 1
			H.Weaken(5)
			H.visible_message("<span class='danger'>Lightning crackles across \the [H]'s skin!</span>")

/spell/hand/charges/firebolt
	name = "Fire Bolt"
	desc = "Call forth a blast of flame"

	spell_flags = 0
	charge_max = 600
	invocation = "opens their hand, which bursts into flames."
	invocation_type = SpI_EMOTE

	range = 9
	max_casts = 1
	compatible_targets = list(/atom)
	hud_state = "fireball"

/spell/hand/charges/firebolt/cast_hand(var/atom/A,var/mob/user)
	var/obj/item/projectile/firebolt/B = new(get_turf(user))
	B.firer = user
	B.launch_projectile(A, BP_CHEST)
	user.visible_message("<span class='danger'>\The [user] shoots out a sphere of flames from their hand!</span>")
	return ..()

/obj/item/projectile/firebolt
	name = "firebolt"
	damage = 50
	check_armour = "energy"
	armor_penetration = 48
	icon_state = "fireball"
	damage_type = BURN

/obj/item/projectile/firebolt/on_hit(var/atom/A, var/blocked = 0)
	explosion(A, 0, 1, 2, 2, 0)
	new /obj/flamer_fire(A.loc, 16, 12, "red", 2)

/spell/hand/charges/firebolt/strong
	name = "Enhanced Fire Bolt"
	desc = "Call forth a blast of hellish flame"

	spell_flags = 0
	charge_max = 600
	invocation = "opens their hand, which bursts into flames."
	invocation_type = SpI_EMOTE

	range = 9
	max_casts = 1
	compatible_targets = list(/atom)
	hud_state = "fireball"

/spell/hand/charges/firebolt/strong/cast_hand(var/atom/A,var/mob/user)
	var/obj/item/projectile/firebolt/strong/B = new(get_turf(user))
	B.firer = user
	B.launch_projectile(A, BP_CHEST)
	user.visible_message("<span class='danger'>\The [user] shoots out a powerful sphere of flames from their hand!</span>")
	return ..()

/obj/item/projectile/firebolt/strong
	name = "firebolt"
	damage = 75
	check_armour = "energy"
	armor_penetration = 55
	icon_state = "fireball"
	damage_type = BURN

/obj/item/projectile/firebolt/strong/on_hit(var/atom/A, var/blocked = 0)
	explosion(A, 1, 2, 3, 4, 5)
	new /obj/flamer_fire(A.loc, 16, 12, "red", 3)

/spell/hand/charges/firebolt/flame
	name = "Incendiary Fire Bolt"
	desc = "Sacrifice some of the detonation force for a wall of flames"

	spell_flags = 0
	charge_max = 600
	invocation = "opens their hand, which bursts into flames."
	invocation_type = SpI_EMOTE

	range = 9
	max_casts = 1
	compatible_targets = list(/atom)
	hud_state = "fireball"

/spell/hand/charges/firebolt/flame/cast_hand(var/atom/A,var/mob/user)
	var/obj/item/projectile/firebolt/flame/B = new(get_turf(user))
	B.firer = user
	B.launch_projectile(A, BP_CHEST)
	user.visible_message("<span class='danger'>\The [user] shoots out a wall of flames from their hand!</span>")
	return ..()

/obj/item/projectile/firebolt/flame
	name = "firebolt"
	damage = 30
	check_armour = "energy"
	armor_penetration = 48
	icon_state = "fireball"
	damage_type = BURN

/obj/item/projectile/firebolt/flame/on_hit(var/atom/A, var/blocked = 0)
	explosion(A, 0, 0, 1, 2, 3)
	new /obj/flamer_fire(A.loc, 16, 12, "red", 5)

/spell/hand/charges/flames
	name = "Warpfire Blast"
	desc = "Call forth a wave of Warp flame"

	spell_flags = 0
	charge_max = 600
	invocation = "opens their hand, which bursts into green fire."
	invocation_type = SpI_EMOTE

	range = 7
	max_casts = 1
	compatible_targets = list(/atom)
	hud_state = "wiz_bshard"

/spell/hand/charges/flames/cast_hand(var/atom/A,var/mob/user)
	var/obj/item/projectile/flamer/warp/B = new(get_turf(user))
	B.firer = user
	B.launch_projectile(A, BP_CHEST)
	user.visible_message("<span class='danger'>\The [user] unleashes a blast of warp fire!</span>")
	return ..()
