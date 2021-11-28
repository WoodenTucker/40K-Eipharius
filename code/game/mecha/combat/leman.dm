/obj/mecha/combat/leman
        desc = "A medium tank used by Astra Militarum. Sturdy and trustful."
        name = "Leman Russ"
        icon_state = "leman"
        initial_icon = "leman"
        step_in = 2.5
        health = 800
        deflect_chance = 45
        damage_absorption = list("brute"=0.5,"fire"=1,"bullet"=0.5,"laser"=0.7,"energy"=0.9,"bomb"=0.75)
        max_temperature = 30000
        infra_luminosity = 8
        force = 65
        overload_coeff = 0.75
        wreckage = /obj/effect/decal/mecha_wreckage/leman
        max_equip = 5
        step_energy_drain = 2.5


/obj/mecha/combat/leman/New()
        ..()
        var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/tank_cannon
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/autocannon
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster
        ME.attach(src)
        ME = new /obj/item/mecha_parts/mecha_equipment/generator
        ME.attach(src)
        return


/obj/mecha/combat/leman/add_cell()
        cell = new /obj/item/cell/hyper(src)


/obj/mecha/combat/leman/verb/overload()
        set category = "Exosuit Interface"
        set name = "Toggle Ramming Speed"
        set src = usr.loc
        set popup_menu = 0
        if(usr!=src.occupant)
                return
        if(overload)
                overload = 0
                step_in = initial(step_in)
                step_energy_drain = initial(step_energy_drain)
                src.occupant_message("<font color='blue'>You disable ramming mode.</font>")
src.log_message("Ramming speed disabled. Techpriests surely will be unhappy if they know what you've done...")
        else
                overload = 1
                step_in = min(1, round(step_in/2))
                step_energy_drain = step_energy_drain*overload_coeff
                src.occupant_message("<font color='red'>You enable ramming mode.</font>")
        src.log_message("Switching to ramming speed? May Omnissiah have mercy on you for this...")
        return


/obj/mecha/combat/leman/do_move(direction)
        if(!..()) return
        if(overload)
                health--
                if(health < initial(health) - initial(health)/3)
                        overload = 0
                        step_in = initial(step_in)
                        step_energy_drain = initial(step_energy_drain)
                        src.occupant_message("<font color='red'>Hull damage threshold exceeded. Engaging emergency brakes.</font>")
        return


/obj/mecha/combat/leman/get_stats_part()
        var/output = ..()
        output += "<b>Ramming speed: [overload?"on":"off"]</b>"
        return output


/obj/mecha/combat/leman/get_commands()
        var/output = {"<div class='wr'>
                                                <div class='header'>Special</div>
                                                <div class='links'>
                                                <a href='?src=\ref[src];toggle_ramming_speed=1'>Toggle ramming mode</a>
                                                </div>
                                                </div>
                                                "}
        output += ..()
        return output


/obj/mecha/combat/leman/Topic(href, href_list)
        ..()
        if (href_list["toggle_ramming_speed"])
                src.overload()
        return