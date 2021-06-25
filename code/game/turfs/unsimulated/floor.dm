/turf/unsimulated/floor
	name = "floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "Floor3"

/turf/unsimulated/floor/bluespace //non-doomsday version of bluespace for transit and wizden
	name = "\improper bluespace"
	icon = 'icons/turf/space.dmi'
	icon_state = "bluespace"
	desc = "Looks like infinity."

/turf/unsimulated/mask
	name = "mask"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/unsimulated/floor/rescue_base
	icon_state = "asteroidfloor"

/turf/unsimulated/floor/shuttle_ceiling
	icon_state = "reinforced"

/turf/unsimulated/floor/slipstream //these are my ghetto drop pods
	name = "slipstream"
	icon = 'icons/turf/space.dmi'
	icon_state = "bluespace"
	thermal_conductivity = 1.6
	heat_capacity = 1000
	temperature = 265


/turf/unsimulated/floor/slipstream/Entered(atom/movable/AM)		//ITS A TRAP!
	..()

	if(istype(AM, /obj/effect))									//We don't want no effects
		return

	if(istype(AM, /atom/movable))								//Wait what is this?
		if(isliving(AM))										//Is it alive?
			fall(AM)										//Seeya later!

	else
		return

/turf/unsimulated/floor/slipstream/proc/fall(mob/living/M as mob, mob/user as mob)
	M.loc = get_turf(locate("landmark*dropsite")) 			//SEEYA LATER!


/turf/unsimulated/floor/slipstream/ex_act(severity)
	return

/turf/unsimulated/floor/ert //these are my ghetto drop pods
	name = "slipstream"
	icon = 'icons/turf/space.dmi'
	icon_state = "bluespace"
	thermal_conductivity = 1.6
	heat_capacity = 1000
	temperature = 265


/turf/unsimulated/floor/ert/Entered(atom/movable/AM)		//ITS A TRAP!
	..()

	if(istype(AM, /obj/effect))									//We don't want no effects
		return

	if(istype(AM, /atom/movable))								//Wait what is this?
		if(isliving(AM))										//Is it alive?
			fall(AM)										//Seeya later!

	else
		return

/turf/unsimulated/floor/ert/proc/fall(mob/living/M as mob, mob/user as mob)
	M.loc = get_turf(locate("landmark*ertdropsite"))


/turf/unsimulated/floor/ert/ex_act(severity)