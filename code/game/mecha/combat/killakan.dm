/obj/mecha/combat/killakan
	desc = "A Killa Kan with DUAL DAKKA?! ZOGGIN' WAAAAAAAAAAAAAAAAAGH"
	name = "Blood Axe Killa Kan"
	icon_state = "killakan"
	initial_icon = "killakan"
	step_in = 3
	health = 1600 // smol mech
	deflect_chance = 25
	damage_absorption = list("brute"=1.4,"fire"=1,"bullet"=1.4,"laser"=1.4,"energy"=0.9,"bomb"=0.75)
	max_temperature = 30000
	infra_luminosity = 8
	force = 30
	var/defence = 0
	var/def_boost = 15
	wreckage = /obj/effect/decal/mecha_wreckage/killakan

/* intended loadout
/obj/mecha/combat/killakan/New()
	..()
	weapons += new /datum/design/item/mecha/weapon/laser(src)
	weapons += new /datum/design/item/mecha/drill(src)
	selected_weapon = weapons[1]
	return
*/

/obj/mecha/combat/killakan/relaymove(mob/user,direction)
	if(defence)
		if(world.time - last_message > 20)
			src.occupant_message("<font color='red'>Unable to move while in defence mode</font>")
			last_message = world.time
		return 0
	. = ..()
	return


/obj/mecha/combat/killakan/verb/defence_mode()
	set category = "Exosuit Interface"
	set name = "Toggle defence mode"
	set src = usr.loc
	set popup_menu = 0
	if(usr!=src.occupant)
		return
	defence = !defence
	if(defence)
		deflect_chance += def_boost
		src.occupant_message("<font color='blue'>You enable [src] defence mode.</font>")
	else
		deflect_chance -= def_boost
		src.occupant_message("<font color='red'>You disable [src] defence mode.</font>")
	src.log_message("Toggled defence mode.")
	return


/obj/mecha/combat/killakan/get_stats_part()
	var/output = ..()
	output += "<b>Defence mode: [defence?"on":"off"]</b>"
	return output

/obj/mecha/combat/killakan/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_defence_mode=1'>Toggle defence mode</a>
						</div>
						</div>
						"}
	output += ..()
	return output

/obj/mecha/combat/killakan/Topic(href, href_list)
	..()
	if (href_list["toggle_defence_mode"])
		src.defence_mode()
	return
