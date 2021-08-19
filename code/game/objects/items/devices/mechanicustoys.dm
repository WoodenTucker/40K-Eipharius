/*
  __  __           _                 _
 |  \/  |         | |               (_)
 | \  / | ___  ___| |__   __ _ _ __  _  ___ _   _ ___
 | |\/| |/ _ \/ __| '_ \ / _` | '_ \| |/ __| | | / __|
 | |  | |  __/ (__| | | | (_| | | | | | (__| |_| \__ \
 |_|  |_|\___|\___|_| |_|\__,_|_| |_|_|\___|\__,_|___/

*/

/obj/item/device/allenwrench
	name = "Allen Wrench"
	desc = "The wrench of Saint Allen. For he did stand before the gathering and declare 'No longer shall I struggle with pliers. Instead I shall create a new tool specific for this bolt. Brothers! Throw down your screw drivers and follow me!'. -Exert, The Phillips heresy."
	icon = 'icons/obj/items/allenwrench.dmi'
	icon_state = "awrench"
	item_state = "awrench"
	item_flags = ITEM_FLAG_NODROP
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_HUGE
	var/constructionsystem = 0
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/device/allenwrench/attack(mob/living/carbon/C, mob/living/carbon/human/user)
	if(istype(C))
		visible_message("<span class='notice'>[C] is blessed in the name of Saint Allen.</span>")
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	..()

/obj/item/device/allenwrench/attack_self(usr)
	to_chat(usr,"<span class='warning'>You can feel it.. you can just feel genius.</span>")


/obj/item/device/allenwrench/attackby(var/obj/item/gun/energy/las/lasgun/O, var/mob/user) //lets tech goys modify lasguns to full auto
//	if(O.tinkered == 1)
	if(istype(O,/obj/item/gun/energy/las/lasgun/tinkered))
		to_chat(user, "<span class='warning'>[O] has already been upgraded!</span>")
		return 1
	else if (!(istype(O, /obj/item/gun/energy/las/lasgun)))
		to_chat(user, "<span class='warning'>[O] cannot be upgraded!</span>")
		return 1
	else if(prob(15))
		qdel(O)
		new /obj/item/gun/energy/las/lasgun/tinkered (get_turf(src))
		playsound(loc, 'sound/items/Ratchet.ogg', 70, 1)
		visible_message("[O] is nimbly upgraded by the skilled tech-priest.")
	else
		playsound(loc, 'sound/items/Ratchet.ogg', 50, 1)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("[user] tinkers with the [O]...")

/obj/item/device/allenwrench/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/device/holyoils
	name = "Holy Oils"
	desc = "With sacred oil I apprease you, Be quiet, good spirits, And accept my benediction."
	icon = 'icons/obj/items/incense.dmi'
	icon_state = "holyoils"
	item_state = "holyoils"
	item_flags = ITEM_FLAG_NODROP
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_HUGE
	var/constructionsystem = 0
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/device/holyoils/attack(mob/living/carbon/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("<span class='notice'>[C] is gently lathered in the holy oils of the adeptus mechanicus by [user]. The machine spirits will surely smile upon them now!</span>")
	..()

/obj/item/device/holyoils/attack_self(usr)
	to_chat(usr,"<span class='warning'>You feel more nubile!</span>")

/obj/item/device/holyoils/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/device/autochisel
	name = "Auto-Chisel"
	desc = "A sacred relic from centuries past, this silver chisel does all the work for the Tech Priest."
	icon = 'icons/obj/items/auto_chisel.dmi'
	icon_state = "auto_chisel"
	item_state = "auto_chisel"
	item_flags = ITEM_FLAG_NODROP
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_HUGE
	var/constructionsystem = 0
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/device/autochisel/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/device/lasercutter
	name = "Laser Cutter"
	desc = "Take care with that! We have not fully ascertained its function, and the ticking is accelerating. - Technographer Adar Millez "
	icon = 'icons/obj/items/laser_cutter.dmi'
	icon_state = "laser_cutter"
	item_state = "laser_cutter"
	item_flags = ITEM_FLAG_NODROP
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_HUGE
	var/constructionsystem = 0
	attack_verb = list("singed", "charred", "burned", "sizzled", "cooked",)

/obj/item/device/lasercutter/attack(mob/living/carbon/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("<span class='notice'>[C] is gingerly warmed with the laser cutter by [user]. Tingly!</span>")
	..()


/obj/item/device/lasercutter/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


//Biologis toys go below here---------------------------------------------------------------------------------
/obj/item/device/neuraladapter
	name = "Neural Adapter"
	desc = "This aids a biologis in bending the neurons to his will. Sometimes. - Biologis Malar Viten "
	icon = 'icons/obj/items/neural.dmi'
	icon_state = "neural"
	item_state = "neural"
	item_flags = ITEM_FLAG_NODROP
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_HUGE
	var/constructionsystem = 0
	attack_verb = list("singed", "charred", "burned", "sizzled", "cooked",)

/obj/item/device/neuraladapter/attack(mob/living/simple_animal/vatgrown/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("<span class='notice'>[C] is gingerly warmed with the laser cutter by [user]. Tingly!</span>")
	..()


/obj/item/device/neuraladapter/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)