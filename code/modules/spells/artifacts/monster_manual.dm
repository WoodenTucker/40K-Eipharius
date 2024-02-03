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
	var/list/monster = list(/mob/living/simple_animal/familiar/carcinus,
							/mob/living/simple_animal/familiar/horror,
							/mob/living/simple_animal/familiar/minor_amaros,
							/mob/living/simple_animal/familiar/pike
							)
	var/list/monster_info = list(   "One of many fragments from the Carcinus Daemon, it is said their shells are near impenetrable and their claws as sharp as knives.",
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


