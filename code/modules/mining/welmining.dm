/turf/simulated/miningtime //wall piece
	name = "rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock"
	initial_gas = null
	opacity = 1
	density = 1
	blocks_air = 1
	temperature = T0C


/turf/simulated/miningtime/attackby(var/obj/item/pickaxe/O, var/mob/user)

	if(!O)
		to_chat(user, "This thing will never break through rock!")
		return
	else if(istype(O,/obj/item/pickaxe))
		if(prob(80))

