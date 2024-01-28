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

/obj/aura/radiant_aura/psyker/Destroy()
	to_chat(user, "<span class='warning'>Your protective aura dissipates, leaving you feeling cold and unsafe.</span>")
	return ..()

/obj/aura/radiant_aura/psyker/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
			user.visible_message("<span class='warning'>\The [P] refracts, bending into \the [user]'s aura.</span>")
			del(P)

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

/obj/aura/radiant_aura/psyker/ultimate/Destroy()
	to_chat(user, "<span class='warning'>Your protective aura dissipates, leaving you feeling cold and unsafe.</span>")
	return ..()

/obj/aura/radiant_aura/psyker/ultimate/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		user.visible_message("<span class='warning'>\The [P] vanishes against the [user]'s aura.</span>")
		del(P)
