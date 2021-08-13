
/obj/effect/golemrune
	anchored = 1
	desc = "a strange rune used to create golems. It glows when spirits are nearby."
	name = "rune"
	icon = 'icons/obj/rune.dmi'
	icon_state = "golem"
	unacidable = 1
	plane = ABOVE_TURF_PLANE
	layer = RUNE_LAYER

/obj/effect/golemrune/Initialize()
	..()
	START_PROCESSING(SSobj, src)

/obj/effect/golemrune/Process()
	var/mob/observer/ghost/ghost
	for(var/mob/observer/ghost/O in src.loc)
		if(!O.client)	continue
		if(O.mind && O.mind.current && O.mind.current.stat != DEAD)	continue
		ghost = O
		break
	if(ghost)
		icon_state = "golem2"
	else
		icon_state = "golem"

/obj/effect/golemrune/attack_hand(mob/living/user as mob)
	var/mob/observer/ghost/ghost
	for(var/mob/observer/ghost/O in src.loc)
		if(!O.client)	continue
		if(O.mind && O.mind.current && O.mind.current.stat != DEAD)	continue
		ghost = O
		break
	if(!ghost)
		to_chat(user, "The rune fizzles uselessly. There is no spirit nearby.")
		return
	var/mob/living/carbon/human/G = new(src.loc)
	G.set_species("Golem")
	G.key = ghost.key
	to_chat(G, "You are an adamantine golem. You move slowly, but are highly resistant to heat and cold as well as blunt trauma. Serve [user], and assist them in completing their goals at any cost.")
	qdel(src)


/obj/effect/golemrune/proc/announce_to_ghosts()
	for(var/mob/observer/ghost/G in GLOB.player_list)
		if(G.client)
			var/area/A = get_area(src)
			if(A)
				to_chat(G, "Golem rune created in [A.name].")

