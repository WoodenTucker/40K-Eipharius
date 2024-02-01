/obj/item/monster_manual
	name = "Warped Tome"
	desc = "An Arcane Tome describing many rituals"
	icon = 'icons/obj/library.dmi'
	icon_state = "bookHacking"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/uses = 1
	var/temp = null
	var/list/monster = list(/mob/living/simple_animal/familiar/pet/cat,
							/mob/living/simple_animal/familiar/pet/mouse,
							/mob/living/simple_animal/familiar/carcinus,
							/mob/living/simple_animal/familiar/horror,
							/mob/living/simple_animal/familiar/minor_amaros,
							/mob/living/simple_animal/familiar/pike
							)
	var/list/monster_info = list(   "It is well known that the blackest of cats make good familiars.",
									"Mice are full of mischief and magic. A simple animal, yes, but an excellent spy",
									"One of many fragments from the original Carcinus Daemon, it is said their shells are near impenetrable and their claws as sharp as knives.",
									"A Daemon of Rot and Eldrich Magic, it is made from the repurposed flesh of a Poxwalker",
									"A small daemon known for its healing powers and pacifist ways... perhaps more then meets the eye.",
									"A warpchanged Predator, known to hunt their prey in the Warp even after death."
									)

/obj/item/monster_manual/attack_self(mob/user as mob)
	user.set_machine(src)
	interact(user)

/obj/item/monster_manual/interact(mob/user as mob)
	var/dat
	if(temp)
		dat = "[temp]<br><a href='byond://?src=\ref[src];temp=1'>Return</a>"
	else
		dat = "<center><h3>Monster Manual</h3>You have [uses] uses left.</center>"
		for(var/i=1;i<=monster_info.len;i++)
			var/mob/M = monster[i]
			var/name = capitalize(initial(M.name))
			dat += "<BR><a href='byond://?src=\ref[src];path=\ref[monster[i]]'>[name]</a> - [monster_info[i]]</BR>"
	user << browse(dat,"window=monstermanual")
	onclose(user,"monstermanual")

/obj/item/monster_manual/OnTopic(user, href_list, state)
	if(href_list["temp"])
		temp = null
		. = TOPIC_REFRESH
	else if(href_list["path"])
		if(uses == 0)
			to_chat(user, "This book is out of uses.")
			return TOPIC_HANDLED

		var/mob/living/simple_animal/familiar/F = new path(get_turf(src))
		temp = "You have attempted summoning \the [F]"
		spawn(600)
			if(F)
				if(!F.ckey || !F.client)
					F.visible_message("With no soul to keep \the [F] linked to this plane, it fades away.")
					qdel(F)
				else
					F.faction = usr.faction
					F.add_spell(new /spell/contract/return_master(usr), "const_spell_ready")
					to_chat(F, "<span class='notice'>You are a familiar.</span>")
					to_chat(F, "<b>You have been summoned by the cultist [usr] to assist in all matters magical and not.</b>")
					to_chat(F, "<b>Do their bidding and help them with their goals.</b>")
					uses--
		. = TOPIC_REFRESH

	if(. == TOPIC_REFRESH)
		interact(user)


