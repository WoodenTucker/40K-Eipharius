// Tables of the new map

/obj/structure/table/rack
	name = "rack"
	desc = "Different from the Middle Ages version."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

	material = DEFAULT_TABLE_MATERIAL

/obj/structure/table/rack/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put

/obj/structure/table/rack/Initialize()
	auto_align()
	. = ..()

/obj/structure/table/rack/update_connections()
	return

/obj/structure/table/rack/update_desc()
	return

/obj/structure/table/rack/update_icon()
	return

/obj/structure/table/rack/can_connect()
	return FALSE

/obj/structure/table/rack/holorack/dismantle(obj/item/wrench/W, mob/user)
	to_chat(user, "<span class='warning'>You cannot dismantle \the [src].</span>")
	return

/obj/structure/table/rack/bograck
	name = "strange rack"
	desc ="Must be the color."
	icon = 'icons/obj/objects.dmi'
	icon_state = "bograck"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/dark
	color = COLOR_GRAY40

/obj/structure/table/rack/shelf
	name = "shelf"
	desc = "You can put things on it, actually."
	icon = 'icons/obj/objects.dmi'
	icon_state = "shelf"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/graf
	name = "table"
	desc = "Fart on it I dare you."
	icon = 'icons/obj/objects.dmi'
	icon_state = "fancy"
	can_plate = 1
	can_reinforce = 1
	flipped = 0

/obj/structure/table/graf/Initialize()
	auto_align()
	. = ..()

/obj/structure/table/graf/update_connections()
	return

/obj/structure/table/graf/update_desc()
	return

/obj/structure/table/graf/update_icon()
	return

/obj/structure/table/graf/dirty_table
    icon_state = "wooden"

/obj/structure/table/graf/rusty_table
    icon_state = "table1"

/obj/structure/table/graf/polished_steel
    icon_state = "table2"

/obj/structure/table/graf/rich_table
    icon_state = "table3"

/obj/structure/table/graf/old_table
    icon_state = "table4"
    
/obj/structure/table/graf/polished_table
    icon_state = "table5"
    
/obj/structure/table/graf/butcher_table
    icon_state = "table7"
    
/obj/structure/table/graf/big_wood_table
    icon_state = "bigtable"
    
/obj/structure/table/graf/pagan
    icon_state = "pagan_altar"
    
/obj/structure/table/graf/shrine
    icon_state = "minorshrine"
    
/obj/structure/table/graf/wood_office_table
    icon_state = "minorshrine"
    
/obj/structure/table/graf/reinf_table
    icon_state = "reinf_table2"