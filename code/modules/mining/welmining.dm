//Mining is kinda broken and I don't feel like figuring it out so I'm gunna make my own shittier version here

/turf/unsimulated/miningtime //wall piece
	name = "rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock"
	initial_gas = list("oxygen" = MOLES_O2STANDARD, "nitrogen" = MOLES_N2STANDARD)
	opacity = 1
	density = 1
	blocks_air = 0
	temperature = T20C
	var/integrity = 100


/turf/unsimulated/miningtime/attackby(var/obj/item/pickaxe/O, var/mob/living/carbon/human/user)
	if (!(istype(O, /obj/item/pickaxe)))
		to_chat(user, "This thing will never break through rock!")
		return
	if(src.integrity > 0)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("[user] hits the rock wall with [O]!")
		src.integrity -= rand(20,60)
		user.adjustStaminaLoss(5)
		playsound(src, 'sound/items/pickaxe3.ogg', 100, 1, 1)
		return
	else if(istype(O,/obj/item/pickaxe))
		if(prob(69))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O]!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/smallrock(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
		if(prob(10))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O], revealing coal!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/coalore(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
			return
		if(prob(8))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O], revealing copper!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/copperore(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
			return
		if(prob(6))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O], revealing iron!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/ironore(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
			return
		if(prob(4))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O], revealing silver!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/silverore(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
			return
		if(prob(2))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O], revealing gold!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/goldore(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
			return
		if(prob(1))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
			visible_message("The wall crumbles under [O], revealing adamantium!")
			user.adjustStaminaLoss(5)
			new /obj/item/newore/adamantiumore(src)
			new /turf/simulated/floor/stone(src)
			qdel(src)
			return

