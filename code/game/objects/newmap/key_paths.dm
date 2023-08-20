/*

This file contains most of the door, keys and access stuff for the new map.

Many individual rooms were added so actually you could own a place to store your stuff rather than being a vagabond 24/7 (IS12 storage system is pain)
also cause most of the items are set with such a weight it's utterly suffering to even try and edit the size of over 400+ items.

To prevent metagaming, some keys will be

*/


/*////////////////////////////

ACCESS RELATED STUFF HERE

*/////////////////////////////


// HAB 1 - Small Hab south of the tavern, has 11 rooms.

/var/const/access_hab1_1 = 701
/datum/access/hab1_1
	id = access_hab1_1
	desc = "Hab 1 - Room 1"

/var/const/access_hab1_2 = 702
/datum/access/hab1_2
	id = access_hab1_2
	desc = "Hab 1 - Room 2"

/var/const/access_hab1_3 = 703
/datum/access/hab1_3
	id = access_hab1_3
	desc = "Hab Room 3"

/var/const/access_hab1_4 = 704
/datum/access/hab1_4
	id = access_hab1_4
	desc = "Hab 1 - Room 4"

/var/const/access_hab1_5 = 705
/datum/access/hab1_5
	id = access_hab1_5
	desc = "Hab 1 - Room 5"

/var/const/access_hab1_6 = 706
/datum/access/hab1_6
	id = access_hab1_6
	desc = "Hab 1 - Room 6"

/var/const/access_hab1_7 = 707
/datum/access/hab1_7
	id = access_hab1_7
	desc = "Hab 1 - Room 7"

/var/const/access_hab1_8 = 708
/datum/access/hab1_8
	id = access_hab1_8
	desc = "Hab 1 - Room 8"

/var/const/access_hab1_9 = 709
/datum/access/hab1_9
	id = access_hab1_9
	desc = "Hab 1 - Room 9"

/var/const/access_hab1_10 = 710
/datum/access/hab1_10
	id = access_hab1_10
	desc = "Hab 1 - Room 10"

/var/const/access_hab1_11 = 711
/datum/access/hab1_11
	id = access_hab1_11
	desc = "Hab 1 - Room 11"

// HAB 2 - Hab south of the first hab, has 9 rooms, more wealthy and middle class,

/var/const/access_hab2_1 = 712
/datum/access/hab2_1
	id = access_hab2_1
	desc = "Hab 2 - Room 1"

/var/const/access_hab2_2 = 713
/datum/access/hab2_2
	id = access_hab2_2
	desc = "Hab 2 - Room 2"

/var/const/access_hab2_3 = 714
/datum/access/hab2_3
	id = access_hab2_3
	desc = "Hab 2 - Room 3"

/var/const/access_hab2_4 = 715
/datum/access/hab2_4
	id = access_hab2_4
	desc = "Hab 2 - Room 4"

/var/const/access_hab2_5 = 716
/datum/access/hab2_5
	id = access_hab2_5
	desc = "Hab 2 - Room 5"

/var/const/access_hab2_6 = 717
/datum/access/hab2_6
	id = access_hab2_6
	desc = "Hab 2 - Room 6"

/var/const/access_hab2_7 = 718
/datum/access/hab2_7
	id = access_hab2_7
	desc = "Hab 2 - Room 7"

/var/const/access_hab2_8 = 719
/datum/access/hab2_8
	id = access_hab2_8
	desc = "Hab 2 - Room 8"

/var/const/access_hab2_9 = 720
/datum/access/hab2_9
	id = access_hab2_9
	desc = "Hab 2 - Room 9"

// INN - 10 Rooms, 1 Expensive one for Nobles, they're called 'Tavern' to make things more clear from the OG tavern keys

/var/const/access_tavroom1 = 555
/datum/access/tavroom1
	id = access_tavroom1
	desc = "Inn Room 1"

/var/const/access_tavroom2 = 556
/datum/access/tavroom2
	id = access_tavroom2
	desc = "Inn Room 2"

/var/const/access_tavroom3 = 557
/datum/access/tavroom3
	id = access_tavroom3
	desc = "Inn Room 3"

/var/const/access_tavroom4 = 558
/datum/access/tavroom4
	id = access_tavroom4
	desc = "Inn Room 4"

/var/const/access_tavroom5 = 559
/datum/access/tavroom5
	id = access_tavroom5
	desc = "Inn Room 5"

/var/const/access_tavroom6 = 560
/datum/access/tavroom6
	id = access_tavroom6
	desc = "Inn Room 6"

/var/const/access_tavroom7 = 561
/datum/access/tavroom7
	id = access_tavroom7
	desc = "Inn Room 7"

/var/const/access_tavroom8 = 562
/datum/access/tavroom8
	id = access_tavroom8
	desc = "Inn Room 8"

/var/const/access_tavroom9 = 563
/datum/access/tavroom9
	id = access_tavroom9
	desc = "Inn Room 9"

/var/const/access_tavroom10 = 564
/datum/access/tavroom10
	id = access_tavroom10
	desc = "Inn Room 10"

/var/const/access_tavroom11 = 565
/datum/access/tavroom11
	id = access_tavroom11
	desc = "Luxurious Inn Room"


// IMPERIAL DISTRICT - Houses for Imperial Citizen players, 7 houses

/var/const/access_imphouse_1 = 721
/datum/access/access_imphouse_1
	id = access_imphouse_1
	desc = "Imperial House 1"

/var/const/access_imphouse_2 = 722
/datum/access/access_imphouse_2
	id = access_imphouse_2
	desc = "Imperial House 2"

/var/const/access_imphouse_3 = 723
/datum/access/access_imphouse_3
	id = access_imphouse_3
	desc = "Imperial House 3"

/var/const/access_imphouse_4 = 724
/datum/access/access_imphouse_4
	id = access_imphouse_4
	desc = "Imperial House 4"

/var/const/access_imphouse_5 = 725
/datum/access/access_imphouse_5
	id = access_imphouse_5
	desc = "Imperial House 5"

/var/const/access_imphouse_6 = 726
/datum/access/access_imphouse_6
	id = access_imphouse_6
	desc = "Imperial House 6"

/var/const/access_imphouse_7 = 727
/datum/access/access_imphouse_7
	id = access_imphouse_7
	desc = "Imperial House 7"

// MANOR EXTRA ROOMS // If the Governor wants to hire special people, they can reside on this rooms.

/var/const/access_manor_guest1 = 728
/datum/access/access_manor_guest1
	id = access_manor_guest1
	desc = "Manor Guest Room 1#"

/var/const/access_manor_guest2 = 729
/datum/access/access_manor_guest2
	id = access_manor_guest2
	desc = "Manor Guest Room 2#"

/var/const/access_manor_guest3 = 730
/datum/access/access_manor_guest3
	id = access_manor_guest3
	desc = "Manor Guest Room 3#"

/var/const/access_manor_guest4 = 731
/datum/access/access_manor_guest4
	id = access_manor_guest4
	desc = "Manor Guest Room 4#"

// MISC

/var/const/access_kasrkin = 732 // This is so they dont literally rush their quarters and take the good gun when there's none spawned
/datum/access/access_kasrkin
	id = access_kasrkin
	desc = "Kasrkin Quarters"

/var/const/access_prison = 1984
/datum/access/access_prison
	id = access_prison
	desc = "Cell Key"

// DUNGEON

/*////////////////////////////

KEYS HERE

*/////////////////////////////

/obj/item/card/id/key/super/newmap
	name = "Test Key"
	desc = "A test key, guhh ????!!"
	access = list(access_tavroom2)

// HAB 1 KEYS

/obj/item/card/id/key/super/newmap/hab1
	name = "Hab 1 - Room 1 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_1)

/obj/item/card/id/key/super/newmap/hab1/room2
	name = "Hab 1 - Room 2 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_2)

/obj/item/card/id/key/super/newmap/hab1/room3
	name = "Hab 1 - Room 3 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_3)

/obj/item/card/id/key/super/newmap/hab1/room4
	name = "Hab 1 - Room 4 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_4)

/obj/item/card/id/key/super/newmap/hab1/room5
	name = "Hab 1 - Room 5 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_5)

/obj/item/card/id/key/super/newmap/hab1/room6
	name = "Hab 1 - Room 6 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_6)

/obj/item/card/id/key/super/newmap/hab1/room7
	name = "Hab 1 - Room 7 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_7)

	/obj/item/card/id/key/super/newmap/hab1/room8
	name = "Hab 1 - Room 8 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_8)

/obj/item/card/id/key/super/newmap/hab1/room9
	name = "Hab 1 - Room 9 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_9)

/obj/item/card/id/key/super/newmap/hab1/room10
	name = "Hab 1 - Room 10 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_10)

/obj/item/card/id/key/super/newmap/hab1/room11
	name = "Hab 1 - Room 11 Key"
	desc = "A key for one of the Hab apartaments. Designed for the poor and for the poor."
	access = list(access_hab1_11)


// HAB 2 KEYS

/obj/item/card/id/key/super/newmap/hab2
	name = "Hab 2 - Room 1 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_1)

/obj/item/card/id/key/super/newmap/hab2/room2
	name = "Hab 2 - Room 2 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_2)

/obj/item/card/id/key/super/newmap/hab2/room3
	name = "Hab 2 - Room 3 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_3)

/obj/item/card/id/key/super/newmap/hab2/room4
	name = "Hab 2 - Room 4 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_4)

/obj/item/card/id/key/super/newmap/hab2/room5
	name = "Hab 2 - Room 5 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_5)

/obj/item/card/id/key/super/newmap/hab2/room6
	name = "Hab 2 - Room 6 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_6)

/obj/item/card/id/key/super/newmap/hab2/room7
	name = "Hab 2 - Room 7 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_7)

/obj/item/card/id/key/super/newmap/hab2/room8
	name = "Hab 2 - Room 8 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_8)

/obj/item/card/id/key/super/newmap/hab2/room9
	name = "Hab 2 - Room 9 Key"
	desc = "A key for one of the Hab apartaments. Designed for more wealthy citizens, but you're just there to loot them aint you."
	access = list(access_hab2_9)

// INN KEYS

/obj/item/card/id/key/super/inn/newmap
	name = "Inn Room 1 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom1)

/obj/item/card/id/key/super/inn/newmap/private_room1
	name = "Inn Room 2 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom2)

/obj/item/card/id/key/super/inn/newmap/private_room2
	name = "Inn Room 3 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom3)

/obj/item/card/id/key/super/inn/newmap/private_room3
	name = "Inn Room Key 4"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom4)

/obj/item/card/id/key/super/inn/newmap/private_room4
	name = "Inn Room 5 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom5)

/obj/item/card/id/key/super/inn/newmap/private_room5
	name = "Inn Room 6 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom6)

/obj/item/card/id/key/super/inn/newmap/private_room6
	name = "Inn Room 7 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom7)

/obj/item/card/id/key/super/inn/newmap/private_room7
	name = "Inn Room 8 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom8)

/obj/item/card/id/key/super/inn/newmap/private_room8
	name = "Inn Room 9 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom9)

/obj/item/card/id/key/super/inn/newmap/private_room9
	name = "Inn Room 10 Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn."
	access = list(access_tavroom10)

/obj/item/card/id/key/super/inn/newmap/private_room10
	name = "Luxury Room Key"
	desc = "A Key used to open one of the many rentable rooms of the Inn. This is for high esteemed clients or nobles."
	access = list(access_tavroom11)

// MANOR KEYS

/obj/item/card/id/key/super/newmap/manor
	name = "Guest Room 1 Key"
	desc = "A key for one of the guest rooms of the governor's manor, very lucky you."
	access = list(access_manor_guest1)

/obj/item/card/id/key/super/newmap/manor/room2
	name = "Guest Room 2 Key"
	desc = "A key for one of the guest rooms of the governor's manor, very lucky you."
	access = list(access_manor_guest2)

/obj/item/card/id/key/super/newmap/manor/room3
	name = "Guest Room 3 Key"
	desc = "A key for one of the guest rooms of the governor's manor, very lucky you."
	access = list(access_manor_guest3)

/obj/item/card/id/key/super/newmap/manor/room4
	name = "Guest Room 4 Key"
	desc = "A key for one of the guest rooms of the governor's manor, very lucky you."
	access = list(access_manor_guest4)


// IMPERIAL HOUSE KEYS

/obj/item/card/id/key/super/newmap/imphouse
	name = "Imperial House Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_1)

/obj/item/card/id/key/super/newmap/imphouse/house2
	name = "Imperial House 2 Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_2)

/obj/item/card/id/key/super/newmap/imphouse/house3
	name = "Imperial House 3 Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_3)

/obj/item/card/id/key/super/newmap/imphouse/house4
	name = "Imperial House 4 Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_4)

/obj/item/card/id/key/super/newmap/imphouse/house5
	name = "Imperial House 5 Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_5)

/obj/item/card/id/key/super/newmap/imphouse/house6
	name = "Imperial House 6 Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_6)

/obj/item/card/id/key/super/newmap/imphouse/house7
	name = "Imperial House 7 Key"
	desc = "A key for one of the Noble District houses, only for the Imperium's richest and finest."
	access = list(access_imphouse_7)

// MISC KEYS

/obj/item/card/id/key/super/kasrkin
	name = "Kasrkin Quarters Key"
	desc = "A Key used to open the Kasrkin Quarters."
	access = list(access_kasrkin)

/obj/item/card/id/key/middle/jail
	name = "jail key"
	desc = "The key to keep criminals, drunk idiots and dangerous idiots inside of their cells. Opens most cell doors, make sure not to lose it."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "jail"
	access = list(access_prison)

/*////////////////////////////

DOORS HERE

*/////////////////////////////

/obj/machinery/door/unpowered/newmap
	name = "Hive City door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	req_access = list(access_inn1) //so innkeeper always can get in if needed

///// HAB 1 /////

/obj/machinery/door/unpowered/newmap/hab1
	name = "Hab 1 - Room 1"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	req_access = list(access_hab1_1)
	maxhealth = 800

/obj/machinery/door/unpowered/newmap/hab1/room2
	name = "Hab 1 - Room 2"
	maxhealth = 800
	req_access = list(access_hab1_2)

/obj/machinery/door/unpowered/newmap/hab1/room3
	name = "Hab 1 - Room 3"
	maxhealth = 800
	req_access = list(access_hab1_3)

/obj/machinery/door/unpowered/newmap/hab1/room4
	name = "Hab 1 - Room 4"
	maxhealth = 800
	req_access = list(access_hab1_4)

/obj/machinery/door/unpowered/newmap/hab1/room5
	name = "Hab 1 - Room 5"
	maxhealth = 800
	req_access = list(access_hab1_5)

/obj/machinery/door/unpowered/newmap/hab1/room6
	name = "Hab 1 - Room 6"
	maxhealth = 800
	req_access = list(access_hab1_6)

/obj/machinery/door/unpowered/newmap/hab1/room7
	name = "Hab 1 - Room 7"
	maxhealth = 800
	req_access = list(access_hab1_7)

/obj/machinery/door/unpowered/newmap/hab1/room8
	name = "Hab 1 - Room 8"
	maxhealth = 800
	req_access = list(access_hab1_8)

/obj/machinery/door/unpowered/newmap/hab1/room9
	name = "Hab 1 - Room 9"
	maxhealth = 800
	req_access = list(access_hab1_9)

/obj/machinery/door/unpowered/newmap/hab1/room10
	name = "Hab 1 - Room 10"
	maxhealth = 800
	req_access = list(access_hab1_10)

/obj/machinery/door/unpowered/newmap/hab1/room11
	name = "Hab 1 - Room 11"
	maxhealth = 800
	req_access = list(access_hab1_11)

/////  HAB 2 /////

/obj/machinery/door/unpowered/newmap/hab2
	name = "Hab 2 - Room 1"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	req_access = list(access_tavroom1)
	maxhealth = 900

/obj/machinery/door/unpowered/newmap/hab2/room2
	name = "Hab 2 - Room 2"
	maxhealth = 800
	req_access = list(access_hab1_2)

/obj/machinery/door/unpowered/newmap/hab2/room3
	name = "Hab 2 - Room 3"
	maxhealth = 800
	req_access = list(access_hab1_3)

/obj/machinery/door/unpowered/newmap/hab2/room4
	name = "Hab 2 - Room 4"
	maxhealth = 800
	req_access = list(access_hab1_4)

/obj/machinery/door/unpowered/newmap/hab2/room5
	name = "Hab 2 - Room 5"
	maxhealth = 800
	req_access = list(access_hab1_5)

/obj/machinery/door/unpowered/newmap/hab2/room6
	name = "Hab 2 - Room 6"
	maxhealth = 800
	req_access = list(access_hab1_6)

/obj/machinery/door/unpowered/newmap/hab2/room7
	name = "Hab 2 - Room 7"
	maxhealth = 800
	req_access = list(access_hab1_7)

/obj/machinery/door/unpowered/newmap/hab2/room8
	name = "Hab 2 - Room 8"
	maxhealth = 800
	req_access = list(access_hab1_8)

/obj/machinery/door/unpowered/newmap/hab2/room9
	name = "Hab 2 - Room 9"
	maxhealth = 800
	req_access = list(access_hab1_9)


/////  INN /////


/obj/machinery/door/unpowered/newmap/inn
	name = "Room 1"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	req_access = list(access_tavroom1)
	maxhealth = 900

/obj/machinery/door/unpowered/newmap/inn/room2
	name = "Room 2"
	maxhealth = 800
	req_access = list(access_tavroom2)

/obj/machinery/door/unpowered/newmap/inn/room3
	name = "Room 3"
	maxhealth = 800
	req_access = list(access_tavroom3)

/obj/machinery/door/unpowered/newmap/inn/room4
	name = "Room 4"
	maxhealth = 800
	req_access = list(access_tavroom4)

/obj/machinery/door/unpowered/newmap/inn/room5
	name = "Room 5"
	maxhealth = 800
	req_access = list(access_tavroom5)

/obj/machinery/door/unpowered/newmap/inn/room6
	name = "Room 6"
	maxhealth = 800
	req_access = list(access_tavroom6)

/obj/machinery/door/unpowered/newmap/inn/room7
	name = "Room 7"
	maxhealth = 800
	req_access = list(access_tavroom7)

/obj/machinery/door/unpowered/newmap/inn/room8
	name = "Room 8"
	maxhealth = 800
	req_access = list(access_tavroom8)

/obj/machinery/door/unpowered/newmap/inn/room9
	name = "Room 9"
	maxhealth = 800
	req_access = list(access_tavroom9)

/obj/machinery/door/unpowered/newmap/inn/room10
	name = "Room 10"
	maxhealth = 800
	req_access = list(access_tavroom10)

/obj/machinery/door/unpowered/newmap/inn/luxury_room
	name = "Luxury Room"
	icon = 'icons/obj/doors/door_cave.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	maxhealth = 1500
	req_access = list(access_tavroom11)

///// MANOR DOORS /////

/obj/machinery/door/unpowered/newmap/manor
	name = "Guest Room 1"
	icon = 'icons/obj/doors/door_cave.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	maxhealth = 2000
	req_access = list(access_manor_guest1)

/obj/machinery/door/unpowered/newmap/manor/room2
	name = "Guest Room 2"
	maxhealth = 2000
	req_access = list(access_manor_guest2)

/obj/machinery/door/unpowered/newmap/manor/room3
	name = "Guest Room 3"
	maxhealth = 2000
	req_access = list(access_manor_guest3)

/obj/machinery/door/unpowered/newmap/manor/room4
	name = "Guest Room 4"
	maxhealth = 2000
	req_access = list(access_manor_guest4)

/////  IMPERIAL HOUSES   /////

/obj/machinery/door/unpowered/newmap/imperial_house
	name = "Imperial House"
	icon = 'icons/obj/doors/door_cave.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	maxhealth = 2000
	req_access = list(access_imphouse_1)

/obj/machinery/door/unpowered/newmap/imperial_house/house2
	name = "Imperial House 2"
	maxhealth = 2000
	req_access = list(access_imphouse_2)

/obj/machinery/door/unpowered/newmap/imperial_house/house3
	name = "Imperial House 3"
	maxhealth = 2000
	req_access = list(access_imphouse_3)

/obj/machinery/door/unpowered/newmap/imperial_house/house4
	name = "Imperial House 4"
	maxhealth = 2000
	req_access = list(access_imphouse_4)

/obj/machinery/door/unpowered/newmap/imperial_house/house5
	name = "Imperial House 5"
	maxhealth = 2000
	req_access = list(access_imphouse_5)

/obj/machinery/door/unpowered/newmap/imperial_house/house6
	name = "Imperial House 6"
	maxhealth = 2000
	req_access = list(access_imphouse_6)

/obj/machinery/door/unpowered/newmap/imperial_house/house7
	name = "Imperial House 7"
	maxhealth = 2000
	req_access = list(access_imphouse_7)

/////  MISC DOORS /////

/obj/machinery/door/unpowered/newmap/kasr_quarters
	name = "Kasrkin Quarters"
	icon = 'icons/obj/doors/door_cave.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 0
	maxhealth = 1500
	req_access = list(access_kasrkin)

