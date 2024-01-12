/obj/mecha/combat/deffdread
	desc = "Da beeg, shooty an stompy Deff Dread. Mork (or Gork) wuld be proud!"
	name = "Deff Dread"
	icon_state = "deffdreadba"
	initial_icon = "deffdreadba"
	step_in = 6 // slower than dreadnought by a bit
	health = 2500
	deflect_chance = 55
	internal_damage_threshold = 150
	damage_absorption = list("brute"=0.6,"fire"=0.7,"bullet"=0.6,"laser"=0.6,"energy"=0.1,"bomb"=0.1) // no idea what to make these, make this shittier than dreadnought though
	max_temperature = 30000
	infra_luminosity = 8
	force = 50
	var/defence = 25
	var/def_boost = 15
	wreckage = /obj/effect/decal/mecha_wreckage/deffdread

/* not sure what loadout yet
/obj/mecha/combat/durand/New()
	..()
	weapons += new /datum/mecha_weapon/ballistic/lmg(src)
	weapons += new /datum/mecha_weapon/ballistic/scattershot(src)
	selected_weapon = weapons[1]
	return
*/

/obj/mecha/combat/deffdread/relaymove(mob/user,direction)
	if(defence)
		if(world.time - last_message > 20)
			src.occupant_message("<font color='red'>Unable to move while in defence mode</font>")
			last_message = world.time
		return 0
	. = ..()
	return


/obj/mecha/combat/deffdread/verb/defence_mode()
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


/obj/mecha/combat/deffdread/get_stats_part()
	var/output = ..()
	output += "<b>Defence mode: [defence?"on":"off"]</b>"
	return output

/obj/mecha/combat/deffdread/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_defence_mode=1'>Toggle defence mode</a>
						</div>
						</div>
						"}
	output += ..()
	return output

/obj/mecha/combat/deffdread/Topic(href, href_list)
	..()
	if (href_list["toggle_defence_mode"])
		src.defence_mode()
	return
