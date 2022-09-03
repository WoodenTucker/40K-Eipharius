//DEFINES
#define COAL                    /obj/item/newore/coalore
#define COPPER                  /obj/item/newore/copperore
#define IRON                    /obj/item/newore/ironore
#define URANIUM                 /obj/item/newore/uraniumore
#define SILVER                  /obj/item/newore/silverore
#define GOLD                    /obj/item/newore/goldore
#define COBOLT					/obj/item/newore/coboltore
#define DIAMANTINE				/obj/item/newore/diamantineore
#define PHORON                  /obj/item/newore/phoronore
#define KULTRINIUM	 			/obj/item/newore/kultriniumore
#define ADAMANTIUM              /obj/item/newore/adamantiumore



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
	var/obj/item/newore/ore_inside
	var/crumbling_message


/turf/unsimulated/miningtime/attackby(var/obj/item/pickaxe/O, var/mob/living/carbon/human/user)
	if (!(istype(O, /obj/item/pickaxe)))
		to_chat(user, "This thing will never break through rock!")
		return
	if(integrity > 0)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("[user] hits the rock wall with [O]!")
		integrity -= rand(20,60)
		user.adjustStaminaLoss(5)
		playsound(src, 'sound/items/pickaxe3.ogg', 100, 1, 1)
		return
	else if(istype(O,/obj/item/pickaxe))
		var/rock = FALSE
		if(prob(60))
			rock = TRUE
		var/ore_prob = rand(1, 100)
		switch(ore_prob)
			if(1 to 25)
				crumbling_message = "The wall crumbles under [O], revealing coal!"
				ore_inside = COAL
			if(26to 46)
				crumbling_message = "The wall crumbles under [O], revealing copper!"
				ore_inside = COPPER
			if(47 to  61)
				crumbling_message = "The wall crumbles under [O], revealing iron!"
				ore_inside = IRON
			if(62 to  65)
				crumbling_message = "The wall crumbles under [O], revealing uranium!"
				ore_inside = URANIUM
			if(66 to 75)
				crumbling_message = "The wall crumbles under [O], revealing silver!"
				ore_inside = SILVER
			if(76 to  79)
				crumbling_message = "The wall crumbles under [O], revealing gold!"
				ore_inside = GOLD
			if(80 to 81)
				crumbling_message = "The wall crumbles under [O], revealing promethium!"
				ore_inside = PHORON
			if(82 to 83)
				crumbling_message = "The wall crumbles under [O], revealing adamantium!"
				ore_inside = ADAMANTIUM
			if(84 to 87)
				crumbling_message = "The wall crumbles under [O], revealing cobolt!"
				ore_inside = COBOLT
			if(88 to 93)
				crumbling_message = "The wall crumbles under [O], revealing kultrinium!"
				ore_inside = KULTRINIUM
			if(94 to  98)
				crumbling_message = "The wall crumbles under [O], revealing diamantine!"
				ore_inside = DIAMANTINE
			if(99 to 100)
				crumbling_message = "The wall crumbles under [O], revealing.....nothing interesting."
				ore_inside = FALSE
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		playsound(src,'sound/items/pickaxe3.ogg', 100, 1, 1)
		visible_message(crumbling_message)
		user.adjustStaminaLoss(5)
		if(ore_inside)
			new ore_inside(src)
		if(rock)
			new /obj/item/newore/smallrock(src)
		new /turf/simulated/floor/stone(src)
		qdel(src)
