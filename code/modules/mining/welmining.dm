/turf/simulated/miningtime //wall piece
	name = "rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock"
	initial_gas = null
	opacity = 1
	density = 1
	blocks_air = 1
	temperature = T0C
	var/integrity = 100


/turf/simulated/miningtime/attackby(var/obj/item/pickaxe/O, var/mob/user)
	if(!O)
		to_chat(user, "This thing will never break through rock!")
		return
	if(src.integrity > 0)
		visible_message("[user] hits the rock wall with their [O]!")
		src.integrity -= rand(20,60)
		return
	else if(istype(O,/obj/item/pickaxe))
		if(prob(80))
			visible_message("The wall crumbles under your [O]!")

