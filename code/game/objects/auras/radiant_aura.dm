/obj/aura/radiant_aura
	name = "radiant aura"
	icon = 'icons/effects/effects.dmi'
	icon_state = "fire_goon"
	plane = OBJ_PLANE
	layer = ABOVE_WINDOW_LAYER

/obj/aura/radiant_aura/New()
	..()
	to_chat(user,"<span class='notice'>A bubble of light appears around you, exuding protection and warmth.</span>")
	set_light(6,6, "#e09d37")

/obj/aura/radiant_aura/Destroy()
	to_chat(user, "<span class='warning'>Your protective aura dissipates, leaving you feeling cold and unsafe.</span>")
	return ..()

/obj/aura/radiant_aura/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(P.check_armour == "laser")
		user.visible_message("<span class='warning'>\The [P] refracts, bending into \the [user]'s aura.</span>")
		return AURA_FALSE
	return 0

/obj/aura/radiant_aura/psyker
	name = "psyker radiant aura"
	icon = 'icons/effects/effects.dmi'
	icon_state = "at_shield"
	plane = OBJ_PLANE
	layer = ABOVE_WINDOW_LAYER

/obj/aura/radiant_aura/psyker/New()
	..()
	to_chat(user,"<span class='notice'>A bubble of light appears around you, exuding protection and warmth.</span>")
	set_light(6,6, "#e09d37")
	user.shielded_energy = 1

/obj/aura/radiant_aura/psyker/Destroy()
	to_chat(user, "<span class='warning'>Your protective aura dissipates, leaving you feeling cold and unsafe.</span>")
	user.shielded_energy = 0
	return ..()

/*/obj/aura/radiant_aura/psyker/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, "sparks", 50, 1)
		START_PROCESSING(SSobj, src)
		user.visible_message("<span class='warning'>\The [P] refracts, bending into \the [user]'s aura.</span>")
		del(P)*/

/obj/aura/radiant_aura/psyker/ultimate
	name = "psyker radiant aura"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield"
	plane = OBJ_PLANE
	layer = ABOVE_WINDOW_LAYER

/obj/aura/radiant_aura/psyker/ultimate/New()
	..()
	to_chat(user,"<span class='notice'>A bubble of light appears around you, exuding protection and warmth.</span>")
	set_light(6,6, "#e09d37")
	user.shielded_energy = 1
	user.shielded_projectile = 1

/obj/aura/radiant_aura/psyker/ultimate/Destroy()
	to_chat(user, "<span class='warning'>Your protective aura dissipates, leaving you feeling cold and unsafe.</span>")
	user.shielded_energy = 1
	user.shielded_projectile = 1
	return ..()

/*/obj/aura/radiant_aura/psyker/ultimate/bullet_act(var/obj/item/projectile/P, var/def_zone)
	user.visible_message("<span class='warning'>\The [P] vanishes against the [user]'s aura.</span>")
	var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
	spark_system.set_up(5, 0, user.loc)
	spark_system.start()
	playsound(user.loc, "sparks", 50, 1)
	START_PROCESSING(SSobj, src)
	del(P)*/
