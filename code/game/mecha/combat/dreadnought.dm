/obj/mecha/combat/dreadnought
	desc = "A Dreadnought is a massive war-machine piloted by an honoured Space Marine whose body has been ravaged in battle."
	name = "Dreadnought"
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "dread2old"
	initial_icon = "dread2old"
	step_in = 2
	health = 1250
	deflect_chance = 75
	internal_damage_threshold = 500
	damage_absorption = list("brute"=0.1,"fire"=1,"bullet"=0.2,"laser"=0.4,"energy"=0.1,"bomb"=0.1)
	max_temperature = 30000
	infra_luminosity = 8
	force = 60
	var/defence = 60
	var/def_boost = 15
	wreckage = /obj/effect/decal/mecha_wreckage
	cell = new /obj/item/cell/infinite

/*
/obj/mecha/combat/dreadnought/New()
	..()
	weapons += new /datum/mecha_weapon/ballistic/autocannon(src)
	weapons += new /datum/mecha_equipment/tool/hydraulic_clamp(src)
	selected_weapon = weapons[1]
	return
*/

/obj/mecha/combat/dreadnought/relaymove(mob/user,direction)
	if(defence)
		if(world.time - last_message > 20)
			src.occupant_message("<font color='red'>Unable to move while in defence mode</font>")
			last_message = world.time
		return 0
	. = ..()
	return

/obj/mecha/combat/dreadnought/verb/defence_mode()
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


/obj/mecha/combat/dreadnought/get_stats_part()
	var/output = ..()
	output += "<b>Defence mode: [defence?"on":"off"]</b>"
	return output

/obj/mecha/combat/durand/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_defence_mode=1'>Toggle defence mode</a>
						</div>
						</div>
						"}
	output += ..()
	return output

/obj/mecha/combat/dreadnought/Topic(href, href_list)
	..()
	if (href_list["toggle_defence_mode"])
		src.defence_mode()
	return

/obj/mecha/combat/dreadnought/Destroy()
	occupant.gib()
	. = ..()
