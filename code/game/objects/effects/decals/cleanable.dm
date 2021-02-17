/obj/effect/decal/cleanable
	var/list/random_icon_states
	var/decay = 0
	var/lust = 0
	var/rage = 0
	var/intrigue = 0

/obj/effect/decal/cleanable/clean_blood(var/ignore = 0)
	if(!ignore)
		qdel(src)
		return
	..()

/obj/effect/decal/cleanable/Initialize()
	if (random_icon_states && length(src.random_icon_states) > 0)
		src.icon_state = pick(src.random_icon_states)
	. = ..()
