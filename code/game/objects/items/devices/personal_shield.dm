/obj/item/device/personal_shield
	name = "personal shield"
	desc = "Truely a life-saver: this device protects its user from being hit by objects moving very, very fast, though only for a few shots."
	icon = 'icons/obj/device.dmi'
	icon_state = "batterer"
	var/uses = 60
	var/obj/aura/personal_shield/device/shield

/obj/item/device/personal_shield/attack_self(var/mob/living/user)
	if(uses)
		shield = new(user,src)
	else
		QDEL_NULL(shield)

/obj/item/device/personal_shield/Move()
	QDEL_NULL(shield)
	return ..()

/obj/item/device/personal_shield/forceMove()
	QDEL_NULL(shield)
	return ..()

/obj/item/device/personal_shield/proc/take_charge()
	if(!--uses)
		QDEL_NULL(shield)
		to_chat(loc,"<span class='danger'>\The [src] begins to spark as it breaks!</span>")
		update_icon()
		return

/obj/item/device/personal_shield/update_icon()
	if(uses)
		icon_state = "batterer"
	else
		icon_state = "battererburnt"

/obj/item/device/personal_shield/Destroy()
	QDEL_NULL(shield)
	return ..()

/obj/item/rosarius/broken 
	name = "ecclesiarchal rosarius"
	desc = "A handheld amulet which incorporates a powerful force field generator. A rare and highly prized piece of technology and an icon of the Imperial Creed, being near such an ancient and powerful thing brings great joy to those who are faithful. This one looks particularly old and non-functional."
	icon = 'icons/obj/device.dmi'
	icon_state = "rosarius"
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/rosarius
	name = "ecclesiarchal rosarius"
	desc = "A handheld amulet which incorporates a powerful force field generator. A rare and highly prized piece of technology and an icon of the Imperial Creed, being near such an ancient and powerful thing brings great joy to those who are faithful. Can be worn around the neck."
	icon = 'icons/obj/device.dmi'
	icon_state = "rosarius"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_TIE

/obj/item/clothing/rosarius/Initialize()
	. = ..()


/obj/item/clothing/rosarius/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile))
		if(shield_count >= 0)
			var/obj/item/projectile/P = damage_source
			//var/reflectchance = 100 //Defined here, for if you want to make it have X percent chance of blocking the shot,
			var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
			spark_system.set_up(5, 0, user.loc)
			spark_system.start()
			playsound(user.loc, "sparks", 50, 1)
			user.visible_message("<span class='danger'>[user]'s Rosarius deflects [attack_text] in a shower of sparks!</span>")
			shield_count -= 1
			START_PROCESSING(SSobj, src)
			del(P)
		else
			user.visible_message("<span class='warning'>[user]'s Rosarius overloads!</span>")
			user.update_inv_wear_suit()
		return 1
	return 0


/obj/item/clothing/rosarius/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/rosarius/Process()
	if(shield_count < 3) //Set this to whatever you want the max number of charges to be.
		sleep(60) //Timer in between recharge.
		shield_count += 1
		playsound(loc, 'sound/effects/compbeep1.ogg', 50, TRUE)
	if(shield_count  == 3) //Whatever the max charge is, this plays the sound.
		playsound(loc, 'sound/machines/ding.ogg', 50, TRUE)
		STOP_PROCESSING(SSobj, src)
		if(ishuman(loc))
			var/mob/living/carbon/human/C = loc
			C.update_inv_wear_suit()



/obj/item/clothing/accessory/displacer
	name = "displacer field"
	desc = "A small device designed to teleport users out of the way of incoming attacks. Highly unpredictable, can be attached to clothing."
	icon = 'icons/obj/device.dmi'
	icon_state = "batterer"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_TIE
	var/active = 0.0

/obj/item/clothing/accessory/displacer/New()
	..()

/obj/item/clothing/accessory/displacer/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(80))
		user.visible_message("<span class='danger'>The displacer flings [user] clear of the attack!</span>")
		var/list/turfs = new/list()
		for(var/turf/T in orange(9, user))
			if(istype(T,/turf/space)) continue
			if(T.density) continue
			if(T.x>world.maxx-9 || T.x<9)	continue
			if(T.y>world.maxy-9 || T.y<9)	continue
			turfs += T
		if(!turfs.len) turfs += pick(/turf in orange(9))
		var/turf/picked = pick(turfs)
		if(!isturf(picked)) return
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, "sparks", 50, 1)
		user.loc = picked
		return PROJECTILE_FORCE_MISS
	return 0

/obj/item/clothing/accessory/displacer/attack_self(mob/user as mob)
	src.active = !( src.active )
	if (src.active)
		to_chat(user, "<span class='notice'>The displacer field is now active.</span>")
	else
		to_chat(user, "<span class='notice'>The displacer field is now inactive.</span>")
		src.add_fingerprint(user)
	return

/*/obj/item/clothing/accessory/displacer/emp_act(mob/user, severity)
	active = 0
	to_chat(user, "<span class='danger'>The displacer field malfunctions, throwing you carelessly through the Warp!.</span>")
	spark_system.set_up(5, 0, user.loc)
	spark_system.start()
	playsound(user.loc, "sparks", 50, 1)
	user.loc = picked
	user.apply_effect(20, EYE_BLUR)
	user.apply_effect(20, WEAKEN)
	user.apply_damage(60, PAIN, def_zone, blocked)
	..()*/ //WIP
