/obj/item/grenade/anti_photon
	desc = "A TaU device that removes light for some seconds."
	name = "photon disruption grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "tau"
	item_state = "emp"
	det_time = 40
	origin_tech = list(TECH_BLUESPACE = 3, TECH_MATERIAL = 3)

/obj/item/grenade/anti_photon/detonate()
	playsound(src.loc, 'sound/effects/phasein.ogg', 50, 1, 5)
	set_light(10, -10, "#ffffff")

	var/extra_delay = rand(0,90)

	spawn(extra_delay)
		spawn(200)
			if(prob(10+extra_delay))
				set_light(10, 10, "#[num2hex(rand(64,255))][num2hex(rand(64,255))][num2hex(rand(64,255))]")
		spawn(210)
			..()
			playsound(src.loc, 'sound/effects/bang.ogg', 50, 1, 5)
			qdel(src)
