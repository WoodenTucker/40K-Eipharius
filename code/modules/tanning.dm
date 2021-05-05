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

/obj/item/tannedhuman/attackby(var/obj/item/O, var/mob/living/carbon/human/user)
	if (!(istype(O, /obj/item/material/sword/skinning_knife)))
		to_chat(user, "<span class='warning'>[O] is the wrong kind of knife...</span>")
		return
	else if(istype(O, /obj/item/material/sword/skinning_knife))
		playsound(usr, 'sound/effects/carvemask.ogg', 80, 0, -1)
		(do_after(user,30,src))
		to_chat(user, "[user] lets their hand guide their blade across the [O]. Within a few moments, they have a new mask, a new face... Trace of rouge... Face of beast... Faces...")
		qdel(src)
		new /obj/item/clothing/mask/masquerade(user.loc)
		return