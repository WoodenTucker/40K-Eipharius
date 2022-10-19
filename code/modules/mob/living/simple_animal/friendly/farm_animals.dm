//goat
/mob/living/simple_animal/hostile/retaliate/goat
	name = "goat"
	desc = "Not known for their pleasant disposition."
	icon_state = "goat"
	icon_living = "goat"
	icon_dead = "goat_dead"
	speak = list("EHEHEHEHEH","eh?")
	speak_emote = list("brays")
	emote_hear = list("brays")
	emote_see = list("shakes its head", "stamps a foot", "glares around")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/food/snacks/meat/goat
	meat_amount = 4
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	faction = "goat"
	attacktext = "kicked"
	health = 40
	melee_damage_lower = 1
	melee_damage_upper = 5
	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/datum/reagents/udder = null
	var/food_type = /obj/item/reagent_containers/food/snacks/grown
	var/is_calf = 0
	var/has_calf = 0
	var/young_type = null

/mob/living/simple_animal/hostile/retaliate/goat/New()
	udder = new(50, src)
	..()

/mob/living/simple_animal/hostile/retaliate/goat/Destroy()
	QDEL_NULL(udder)
	. = ..()

/mob/living/simple_animal/hostile/retaliate/goat/Life()
	. = ..()
	if(.)
		//chance to go crazy and start wacking stuff
		if(!enemies.len && prob(1))
			Retaliate()

		if(enemies.len && prob(10))
			enemies = list()
			LoseTarget()
			src.visible_message("<span class='notice'>[src] calms down.</span>")

		if(stat == CONSCIOUS)
			if((prob(3) && has_calf))
				has_calf++
			if(has_calf > 10)
				has_calf = 0
				visible_message("<span class='notice'>[src] gives birth to a calf.</span>")
				new young_type(get_turf(src))

			if(is_calf)
				if((prob(3)))
					is_calf = 0
					udder = new()
					if (name == "grox calf")
						name = "grox"
					else
						name = "goat"
					visible_message("<span class='notice'>[src] has fully grown.</span>")
			else
				udder.add_reagent(/datum/reagent/drink/milk, rand(5, 10))

		if(locate(/obj/effect/vine) in loc)
			var/obj/effect/vine/SV = locate() in loc
			if(prob(60))
				src.visible_message("<span class='notice'>[src] eats the plants.</span>")
				SV.die_off(1)
				if(locate(/obj/machinery/portable_atmospherics/hydroponics/soil/invisible) in loc)
					var/obj/machinery/portable_atmospherics/hydroponics/soil/invisible/SP = locate() in loc
					qdel(SP)
			else if(prob(20))
				src.visible_message("<span class='notice'>[src] chews on the plants.</span>")
			return

		if(!pulledby)
			var/obj/effect/vine/food
			food = locate(/obj/effect/vine) in oview(5,loc)
			if(food)
				var/step = get_step_to(src, food, 0)
				Move(step)

/mob/living/simple_animal/hostile/retaliate/goat/Retaliate()
	..()
	if(stat == CONSCIOUS)
		visible_message("<span class='warning'>[src] gets an evil-looking gleam in their eye.</span>")

/mob/living/simple_animal/hostile/retaliate/goat/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/reagent_containers/glass/G = O
	if(stat == CONSCIOUS && istype(G) && G.is_open_container())
		user.visible_message("<span class='notice'>[user] milks [src] using \the [O].</span>")
		var/transfered = udder.trans_type_to(G, /datum/reagent/drink/milk, rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			to_chat(user, "<span class='warning'>\The [O] is full.</span>")
		if(!transfered)
			to_chat(user, "<span class='warning'>The udder is dry. Wait a bit longer...</span>")
	else if(stat == CONSCIOUS && istype(O, food_type))
		if(is_calf)
			visible_message("<span class='notice'>[src] adorably chews the [O].</span>")
			qdel(O)
		if(!has_calf && !is_calf)
			has_calf = 1
			visible_message("<span class='notice'>[src] hungrily consumes the [O].</span>")
			qdel(O)
		else
			visible_message("<span class='notice'>[src] absently munches the [O].</span>")
			qdel(O)
	else
		..()

/mob/living/simple_animal/hostile/retaliate/goat/grox
	name = "grox"
	desc = "Not known for their pleasant disposition."
	icon = 'icons/mob/livestock.dmi'
	icon_state = "grox"
	icon_living = "grox"
	icon_dead = "lobotomized_grox"
	speak = list("EHEHEHEHEH","eh?")
	speak_emote = list("brays")
	emote_hear = list("brays")
	emote_see = list("shakes its head", "stamps a foot", "glares around")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/food/snacks/meat/grox
	meat_amount = 4
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "charges"
	faction = "grox"
	attacktext = "kicked"
	health = 250
	melee_damage_lower = 1
	melee_damage_upper = 5
	min_gas = null
	max_gas = null
	minbodytemp = 0
	young_type = /mob/living/simple_animal/hostile/retaliate/goat/grox/calf

/mob/living/simple_animal/hostile/retaliate/goat/grox/calf
	name = "grox calf"
	is_calf = 1

/mob/living/simple_animal/hostile/retaliate/goat/grox/calf/Initialize()
	. = ..()
	mob_size = 15
	update_icon()

/mob/living/simple_animal/hostile/retaliate/goat/grox/feral
	name = "feral grox"
	desc = "If you thought the domestic grox were angry, just wait until you meet this guy!"
	health = 400
	icon = 'icons/mob/livestock.dmi'
	icon_state = "feral_grox"
	icon_living = "feral_grox"

//this is the king of goats. he is very powerful, which is why he is the king
/mob/living/simple_animal/hostile/retaliate/goat/king
	name = "king of goats"
	desc = "The oldest and wisest of goats; king of his race, peerless in dignity and power. His golden fleece radiates nobility."
	icon_state = "king_goat"
	icon_living = "king_goat"
	icon_dead = "goat_dead"
	speak_emote = list("brays in a booming voice")
	emote_hear = list("brays in a booming voice")
	emote_see = list("stamps a mighty foot, shaking the surroundings")
	meat_amount = 12
	response_help  = "placates"
	response_harm   = "assaults"
	faction = "goat"
	attacktext = "brutalized"
	turns_per_move = 10
	health = 500
	maxHealth = 500
	melee_damage_lower = 35
	melee_damage_upper = 55
	mob_size = MOB_LARGE
	min_gas = null
	max_gas = null
	minbodytemp = 0

/mob/living/simple_animal/hostile/retaliate/goat/king/Retaliate()
	..()
	if(stat == CONSCIOUS)
		visible_message("<span class='warning'>[src] bellows indignantly, with a judgemental gleam in their eye.</span>")

/mob/living/simple_animal/hostile/retaliate/goat/king/death()
	..()
	visible_message("<span class='warning'>\The [src] shrieks as the seal on their power breaks and his wool peels off!</span>")
	new /obj/item/towel/fleece(src.loc)

//cow
/mob/living/simple_animal/cow
	name = "cow"
	desc = "Known for their milk, just don't tip them over."
	icon_state = "cow"
	icon_living = "cow"
	icon_dead = "cow_dead"
	icon_gib = "cow_gib"
	speak = list("moo?","moo","MOOOOOO")
	speak_emote = list("moos","moos hauntingly")
	emote_hear = list("brays")
	emote_see = list("shakes its head")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/food/snacks/meat/beef
	meat_amount = 6
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 50
	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/datum/reagents/udder = null

/mob/living/simple_animal/cow/New()
	udder = new(50)
	udder.my_atom = src
	..()

/mob/living/simple_animal/cow/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/reagent_containers/glass/G = O
	if(stat == CONSCIOUS && istype(G) && G.is_open_container())
		user.visible_message("<span class='notice'>[user] milks [src] using \the [O].</span>")
		var/transfered = udder.trans_type_to(G, /datum/reagent/drink/milk, rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			to_chat(user, "<span class='warning'>\The [O] is full.</span>")
		if(!transfered)
			to_chat(user, "<span class='warning'>The udder is dry. Wait a bit longer...</span>")
	else
		..()

/mob/living/simple_animal/cow/Life()
	. = ..()
	if(stat == CONSCIOUS)
		if(udder && prob(5))
			udder.add_reagent(/datum/reagent/drink/milk, rand(5, 10))

/mob/living/simple_animal/cow/attack_hand(mob/living/carbon/M as mob)
	if(!stat && M.a_intent == I_DISARM && icon_state != icon_dead)
		M.visible_message("<span class='warning'>[M] tips over [src].</span>","<span class='notice'>You tip over [src].</span>")
		Weaken(30)
		icon_state = icon_dead
		spawn(rand(20,50))
			if(!stat && M)
				icon_state = icon_living
				var/list/responses = list(	"[src] looks at you imploringly.",
											"[src] looks at you pleadingly",
											"[src] looks at you with a resigned expression.",
											"[src] seems resigned to its fate.")
				to_chat(M, pick(responses))
	else
		..()

/mob/living/simple_animal/chick
	name = "\improper chick"
	desc = "Adorable! They make such a racket though."
	icon_state = "chick"
	icon_living = "chick"
	icon_dead = "chick_dead"
	icon_gib = "chick_gib"
	speak = list("Cherp.","Cherp?","Chirrup.","Cheep!")
	speak_emote = list("cheeps")
	emote_hear = list("cheeps")
	emote_see = list("pecks at the ground","flaps its tiny wings")
	speak_chance = 2
	turns_per_move = 2
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken
	meat_amount = 1
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 1
	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/amount_grown = 0
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GRILLE
	mob_size = MOB_MINISCULE

/mob/living/simple_animal/chick/New()
	..()
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)

/mob/living/simple_animal/chick/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			new /mob/living/simple_animal/chicken(src.loc)
			qdel(src)

var/const/MAX_CHICKENS = 50
var/global/chicken_count = 0

/mob/living/simple_animal/chicken
	name = "\improper chicken"
	desc = "Hopefully the eggs are good this season."
	icon_state = "chicken"
	icon_living = "chicken"
	icon_dead = "chicken_dead"
	speak = list("Cluck!","BWAAAAARK BWAK BWAK BWAK!","Bwaak bwak.")
	speak_emote = list("clucks","croons")
	emote_hear = list("clucks")
	emote_see = list("pecks at the ground","flaps its wings viciously")
	speak_chance = 2
	turns_per_move = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken
	meat_amount = 2
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	min_gas = null
	max_gas = null
	minbodytemp = 0
	health = 10
	var/eggsleft = 0
	var/body_color
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_SMALL

/mob/living/simple_animal/chicken/New()
	..()
	if(!body_color)
		body_color = pick( list("brown","black","white") )
	icon_state = "chicken_[body_color]"
	icon_living = "chicken_[body_color]"
	icon_dead = "chicken_[body_color]_dead"
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)
	chicken_count += 1

/mob/living/simple_animal/chicken/death(gibbed, deathmessage, show_dead_message)
	..(gibbed, deathmessage, show_dead_message)
	chicken_count -= 1

/mob/living/simple_animal/chicken/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/reagent_containers/food/snacks/grown/G = O
		if(G.seed && G.seed.kitchen_tag == "wheat")
			if(!stat && eggsleft < 8)
				user.visible_message("<span class='notice'>[user] feeds [O] to [name]! It clucks happily.</span>","<span class='notice'>You feed [O] to [name]! It clucks happily.</span>")
				user.drop_item()
				qdel(O)
				eggsleft += rand(1, 4)
			else
				to_chat(user, "<span class='notice'>[name] doesn't seem hungry!</span>")
		else
			to_chat(user, "[name] doesn't seem interested in that.")
	else
		..()

/mob/living/simple_animal/chicken/Life()
	. =..()
	if(!.)
		return
	if(!stat && prob(3) && eggsleft > 0)
		visible_message("[src] [pick("lays an egg.","squats down and croons.","begins making a huge racket.","begins clucking raucously.")]")
		eggsleft--
		var/obj/item/reagent_containers/food/snacks/egg/E = new(get_turf(src))
		E.pixel_x = rand(-6,6)
		E.pixel_y = rand(-6,6)
		if(chicken_count < MAX_CHICKENS && prob(10))
			E.amount_grown = 1
			START_PROCESSING(SSobj, E)

/obj/item/reagent_containers/food/snacks/egg
	var/amount_grown = 0

/obj/item/reagent_containers/food/snacks/egg/Destroy()
	if(amount_grown)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/reagent_containers/food/snacks/egg/Process()
	if(isturf(loc))
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			visible_message("[src] hatches with a quiet cracking sound.")
			new /mob/living/simple_animal/chick(get_turf(src))
			STOP_PROCESSING(SSobj, src)
			qdel(src)
	else
		return PROCESS_KILL


/mob/living/simple_animal/vatgrown
	name = "Vat-grown human"
	desc = "Shipped from off-world and marked for experimentation, they have already been lobotomized."
	icon_state = "vatgrown"
	icon_living = "vatgrown"
	icon_dead = "vatgrown_dead"
	speak = list("...")
	speak_emote = list("mumbles")
	emote_hear = list("mumbles")
	emote_see = list("stares","drools")
	speak_chance = 0.5
	turns_per_move = 1
	meat_type = /obj/item/reagent_containers/food/snacks/meat/human
	meat_amount = 4
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 60
	min_gas = null
	max_gas = null
	minbodytemp = 0
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GRILLE
	mob_size = MOB_MEDIUM
	var/plating = 0
	var/adapted = 0
	var/eyes = 0
	var/robes = 0
	var/finished = 0

//Skitarii building
/mob/living/simple_animal/vatgrown/attackby(var/obj/item/O, var/mob/user)
	if(istype(O, /obj/item/device/neuraladapter))
		if(src.adapted == 1)
			visible_message("[src]'s brain has already been adapted to suit your needs. Move on!")
			return
		else
			src.adapted = 1
			visible_message("[user] slides the neural adapter down the ear canal. It wriggles past the tympanic membrane and attaches to the auditory nerve, directly feeding commands to the brain of the [src]. Now that the brain is prepared, we need to cover him in plating.")
			playsound(src, 'sound/effects/adapter.ogg', 100, 1, 1)
			return

	if(istype(O, /obj/item/skitariiplating))
		if(src.adapted == 0)
			visible_message("The [src] has not yet had their mind adapted, they will not tolerate you installing plating on them!")
			return
		else if(src.plating == 3)
			visible_message("The [src] is sufficiently armored. Move on to installing the eyes next.")
			return
		else
			src.plating += 1
			visible_message("The [user] installs plating across the [src]'s body.")
			playsound(src, 'sound/effects/plating.ogg', 80, 1, 1)
			qdel(O)
			return

	if(istype(O, /obj/item/newore/gems/ruby/cut))
		if(src.plating <= 2)
			visible_message("The [src] must be properly plated first!")
			return
		else if(src.eyes == 2)
			visible_message("The eyes have been upgraded, now for the final step. Clothing our new servant.")
			return
		else
			src.eyes += 1
			visible_message("[user] makes a few quick 'modifications' to the ruby before replacing the [src]'s eye with it.")
			playsound(src, 'sound/effects/geminsert.ogg', 80, 1, 1)
			qdel(O)
			return

	else if(istype(O, /obj/item/newore/gems/emerald/cut))
		if(src.plating <= 2)
			visible_message("The [src] must be properly plated first!")
			return
		else if(src.eyes == 2)
			visible_message("The eyes have been upgraded, now for the final step. Clothing our new servant.")
			return
		else
			src.eyes += 1
			visible_message("[user] makes a few quick 'modifications' to the emerald before replacing the [src]'s eye with it.")
			playsound(src, 'sound/effects/geminsert.ogg', 80, 1, 1)
			qdel(O)
			return

	else if(istype(O, /obj/item/newore/gems/sapphire/cut))
		if(src.plating <= 2)
			visible_message("The [src] must be properly plated first!")
			return
		else if(src.eyes == 2)
			visible_message("The eyes have been upgraded, now for the final step. Clothing our new servant.")
			return
		else
			src.eyes += 1
			visible_message("[user] makes a few quick 'modifications' to the sapphire before replacing the [src]'s eye with it.")
			playsound(src, 'sound/effects/geminsert.ogg', 80, 1, 1)
			qdel(O)
			return

	if(istype(O, /obj/item/stack/material/cloth))
		var/obj/item/stack/material/cloth/S = O
		if(src.eyes <= 1)
			visible_message("The [src] still needs its eyes upgraded!")
			return
		else if(src.finished == 1)
			visible_message("You have clothed the skitarii, now for the finishing touches. Douse your child in the holy oils!")
			return
		else
			if(S.amount <= 9)
				visible_message("You require at least 10 rolls of cloth to dress your skitarii!")
				return
			else
				src.finished = 1
				S.amount -= 10
				return

	if(isHolyoils(O))
		if(src.finished >= 1)
			playsound(src, 'sound/voice/blessing.ogg', 90, 1, 1)
			qdel(src)
			new /mob/living/carbon/human/skitarii(user.loc)
			return
		else
			visible_message("The servant must be clothed first!")
			return
