/obj/machinery/door/unpowered
	autoclose = 0
	var/locked = 0

/obj/machinery/door/unpowered/Bumped(atom/AM)
	if(src.locked)
		return
	..()
	return

/obj/machinery/door/unpowered/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/melee/energy/blade))	return
	if(src.locked)	return
	..()
	return

/obj/machinery/door/unpowered/emag_act()
	return -1

/obj/machinery/door/unpowered/shuttle
	icon = 'icons/turf/shuttle.dmi'
	name = "door"
	icon_state = "door1"
	opacity = 1
	density = 1

/obj/machinery/door/unpowered/inn
	name = "inn door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0

/obj/machinery/door/unpowered/inn/interior
	name = "interior inn door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_bar)

/obj/machinery/door/unpowered/inn/magistratum
	name = "Magistratum door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_brig)

/obj/machinery/door/unpowered/inn/vault
	name = "Interior Vault"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_treasury)


/obj/machinery/door/unpowered/inn/krootdoor
	name = "kroot room door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_kroot)

/obj/machinery/door/unpowered/inn/groxpen
	name = "grox pen"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_grox)


/obj/machinery/door/unpowered/inn/room1
	name = "room 1"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_inn1) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/inn/room2
	name = "room 2"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_inn2) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/inn/room3
	name = "room 3"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_inn3) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/administratum
	name = "Administratum Door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_administratum) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/cargo
	name = "Munitorum Door"
	icon = 'icons/obj/doors/door_cave.dmi'
	icon_state = "door1"
	autoclose = 1
	normalspeed = 0
	req_access = list(access_cargo) //so innkeeper always can get in if needed