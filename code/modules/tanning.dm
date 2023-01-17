/* .----------------.  .----------------.  .-----------------. .-----------------. .----------------.  .-----------------. .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  _________   | || |      __      | || | ____  _____  | || | ____  _____  | || |     _____    | || | ____  _____  | || |    ______    | |
| | |  _   _  |  | || |     /  \     | || ||_   \|_   _| | || ||_   \|_   _| | || |    |_   _|   | || ||_   \|_   _| | || |  .' ___  |   | |
| | |_/ | | \_|  | || |    / /\ \    | || |  |   \ | |   | || |  |   \ | |   | || |      | |     | || |  |   \ | |   | || | / .'   \_|   | |
| |     | |      | || |   / ____ \   | || |  | |\ \| |   | || |  | |\ \| |   | || |      | |     | || |  | |\ \| |   | || | | |    ____  | |
| |    _| |_     | || | _/ /    \ \_ | || | _| |_\   |_  | || | _| |_\   |_  | || |     _| |_    | || | _| |_\   |_  | || | \ `.___]  _| | |
| |   |_____|    | || ||____|  |____|| || ||_____|\____| | || ||_____|\____| | || |    |_____|   | || ||_____|\____| | || |  `._____.'   | |
| |              | || |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'*/


/obj/structure/statue/tanningrack
	name = "tanning rack"
	desc = "A wooden rack used to tan leather and hide."
	icon = 'icons/obj/tanning.dmi'
	icon_state = "tan_rack"
	var/tanning = 0

/obj/item/humanskin
	name = "human skin"
	desc = "Still moist and covered in blood, a chunk of flesh."
	icon = 'icons/obj/tanning.dmi'
	icon_state = "human_skin"
	item_state = "human_skin"
	w_class = ITEM_SIZE_SMALL

/obj/item/tannedhuman
	name = "tanned human skin"
	desc = "Dried out and ready to be worked with, surprisingly resilient and waterproof."
	icon = 'icons/obj/tanning.dmi'
	icon_state = "hide"
	item_state = "hide"
	w_class = ITEM_SIZE_SMALL




/obj/structure/statue/tanningrack/attackby(var/obj/item/O, var/mob/living/carbon/human/user)
	if (!(istype(O, /obj/item/humanskin)))
		to_chat(user, "<span class='warning'>[O] can't be tanned!</span>")
		return 1
	if(src.tanning == 1)
		to_chat(user, "<span class='warning'>There is already something tanning!</span>")
		return
	else if(istype(O, /obj/item/humanskin))
		add_fingerprint(user)
		add_fibers(user)
		to_chat(user, "[user] pulls the skin taut and stretches it across the rack, preparing for it for its transformation into hide.")
		src.icon_state = "tanning"
		src.update_icon()
		qdel(O)
		src.tanning = 1
		sleep(900)
		to_chat(user, "The [O] begins to dry, all moisture is slowly sucked from the skin as it begins to harden...")
		src.icon_state = "tanned"
		src.update_icon()
		sleep(900)
		to_chat(user, "The [O] finishes tanning and seemingly unhooks itself from the rack, falling to the floor...")
		new /obj/item/tannedhuman(src.loc)
		src.icon_state = "tan_rack"
		src.update_icon()
		src.tanning = 0
		return
	else if((O.sharp) || istype(O, /obj/item/material/knife/butch) || istype(O, /obj/item/melee/sword))//what items can cut down trees
		visible_message("<span='bnotice'[user] begins to cut apart \the [src]!</span>" )
		playsound(src, 'sound/weapons/pierce.ogg', 100, FALSE)
		if(do_after(user, 110, src))
			qdel(src)

/obj/item/tannedhuman/attackby(var/obj/item/O, var/mob/living/carbon/human/user)
	if(istype(O, /obj/item/melee/sword/skinning_knife))
		playsound(usr, 'sound/effects/carvemask.ogg', 80, 0, -1)
		(do_after(user,40,src))
		to_chat(user, "[user] lets their hand guide their blade across the [O]. Within a few moments, they have a new mask, a new face... Trace of rouge... Face of beast... Faces...")
		qdel(src)
		new /obj/item/clothing/mask/masquerade(user.loc)
		return
	var/datum/heretic_deity/deity = GODBYPLAYER(user)
	if(deity.name != "slaanesh")
		to_chat(user, "Nothing happens...")
		return
	else if(istype(O, /obj/item/stack/material/cloth))
		to_chat(user, "The skin and cloth seem to come to life, wriggling and binding together, slowly the pulsing mass begins to take shape into a pair of lavish clothes!")
		if(user.gender == MALE)
			new /obj/item/clothing/suit/armor/slanclothing/maleslan(user.loc)
			qdel(O)
			return
		else if(user.gender == FEMALE)
			new /obj/item/clothing/suit/armor/slanclothing/femaleslan(user.loc)
			qdel(O)
			return
	else if(istype(O, /obj/item/organ/external/arm))
		to_chat(user, "The skin wraps itself around the bloody arm, it slithers up and down, stretching itself to a size one would think impossible. Slowly through some dark magic the pair form a gruesome lash!")
		new /obj/item/melee/whip/lashoftorment(user.loc)
		qdel(O)
		return
