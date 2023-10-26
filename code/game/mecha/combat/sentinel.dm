// Smaller mech that is more for support than actual combat.

/obj/mecha/combat/sentinel
	desc = "Where tanks and other imperial vehicle, the sentinel can go, used often as a recon and support vehicle by the Imperial guard."
	name = "Sentinel"
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "sentinel2"
	initial_icon = "sentinel2"
	step_in = 3.5 // Quick entrace
	health = 300
	deflect_chance = 25
	internal_damage_threshold = 250
	damage_absorption = list("brute"=0.5,"fire"=0.7,"bullet"=0.5,"laser"=0.8,"energy"=0.1,"bomb"=0.1)
	max_temperature = 30000
	infra_luminosity = 8
	force = 25
	var/defence = 5
	var/def_boost = 25
	wreckage = /obj/effect/decal/mecha_wreckage/sentinel
	cell = new /obj/item/cell/hyper
	opacity = 0 // So you can see what's behind you & other players.

// Sentinel Equipment

/obj/mecha/combat/sentinel/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/lascannon
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	ME.attach(src)
	return

/obj/mecha/combat/sentinel/relaymove(mob/user,direction)
	if(defence)
		if(world.time - last_message > 20)
			src.occupant_message("<font color='red'>Unable to move while in defence mode</font>")
			last_message = world.time
		return 0
	. = ..()
	return

/obj/mecha/combat/sentinel/verb/defence_mode()
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


/obj/mecha/combat/sentinel/get_stats_part()
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

/obj/mecha/combat/sentinel/Topic(href, href_list)
	..()
	if (href_list["toggle_defence_mode"])
		src.defence_mode()
	return

/obj/mecha/combat/sentinel/Destroy()
	occupant.gib()
	. = ..()

// Wreckage

/obj/effect/decal/mecha_wreckage/sentinel
	name = "sentinel wreckage"
	icon = 'icons/cadia-sprites/migrated/alienqueen.dmi'
	icon_state = "sentdestroyed"