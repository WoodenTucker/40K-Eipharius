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
	desc = "The wrench of Saint Allen. For he did stand before the gathering and declare \"No longer shall I struggle with pliers. Instead I shall create a new tool, specific for this bolt. Brothers, here I call upon you! Throw down your screwdrivers and follow me!\". -Exert, The Phillips heresy."
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
		visible_message("[O] is nimbly upgraded by skilled servant of the Omnissiah.")
	else
		playsound(loc, 'sound/items/Ratchet.ogg', 50, 1)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("[user] tinkers with the [O]...")

/obj/item/device/allenwrench/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/device/holyoils
	name = "Holy Oils"
	desc = "\"By your power you protect me, By my care I protect you, With sacred oil I appease you, Be quiet, good spirits, And accept my benediction.\" - Adeptus Mechanicus, The Chant of Reassurance."
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
		visible_message("<span class='notice'>[C] is gently lathered in the holy oils of the Adeptus Mechanicus by [user]. The Machine Spirits will surely smile upon them now!</span>")
	..()

/obj/item/device/holyoils/attack_self(usr)
	to_chat(usr,"<span class='warning'>You feel more nubile as you breathe the holy incenses in! Praise the Omnissiah!</span>")

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
	desc = "\"Take care with that! We have not fully ascertained its function, and the ticking is accelerating.\" - Technographer Adar Millez."
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

/obj/item/melee/omnissiah_axe
	name = "Omnissiah`s axe"
	desc = "Blessed axe of Magos Dominus, decorated with holy symbols of the Adeptus Mechanicus"
	icon = 'icons/obj/items/OmmisianAxe.dmi'
	icon_state = "Whistle_InHand_R"
	item_state = "Whistle_InHand_R"
	wielded_icon = "Whistle_InHand_R_W"
	force = 45
	block_chance = 65
	sharp = TRUE
	edge = TRUE
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_HUGE
	weapon_speed_delay = 7
	sales_price = 0

/obj/item/melee/omnissiah_axe/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)
	

//Biologis toys go below here---------------------------------------------------------------------------------
/obj/item/device/neuraladapter
	name = "Neural Adapter"
	desc = "\"This holy tool aids a biologis in bending the neurons to his will. Sometimes.\" - Biologis Malar Viten "
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

/obj/item/device/neuraladapter/attack(mob/living/simple_animal/vatgrown/B, mob/living/carbon/human/skitarii/C, mob/living/carbon/human/user)
	if(istype(B))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("<span class='notice'>The base of [C]'s skull is suddenly pierced with the neural adapter by [user], getting their mind programmed and indoctrinated!</span>")
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		playsound(src, 'sound/effects/adapter.ogg', 100, 1, 1)
		visible_message("<span class='notice'>The base of [C]'s skull is suddenly pierced with the neural adapter by [user], performing neural stimulation procedure! It will help skitarii to awake faster, but not sure.</span>")
		C.request_player() // https://www.youtube.com/watch?v=dnHQn_mpDpk
	else
		return
	..()

/obj/item/device/neuraladapter/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


//Robot stuff


/obj/item/melee/mounted_psword
	name = "Power Blade"
	desc = "A retractable power weapon affixed to the hands"
	icon = 'icons/obj/guardpower_gear_32xOBJ.dmi'
	icon_state = "powersword"
	item_state = "powersword"
	wielded_icon = "powersword"
	force = 40
	block_chance = 80
	sharp = TRUE
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_HUGE
	weapon_speed_delay = 7


/obj/item/melee/mounted_psword/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/gun/projectile/automatic/flamer/mounted
	name = "Mounted Heavy Flamer"
	desc = "An incredibly dangerous flamethrower used often in infiltration or siege operations."
	icon_state = "flamer"
	item_state = "flamer"
	wielded_item_state = "flamer-wielded"
	caliber = "flamer"
	one_hand_penalty = 0
	str_requirement = 0 //Special mounted weapon
	fire_sound = 'sound/effects/fire01.ogg'
	casingsound = null//No eject sound for you.
	firemodes = list()
	accuracy = 0
	automatic = 1
	fire_delay = 8
	move_delay = 5
	burst=1
	magazine_type = /obj/item/ammo_magazine/flamer
	allowed_magazines = /obj/item/ammo_magazine/flamer
	can_jam = FALSE


/obj/item/gun/projectile/automatic/flamer/mounted/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)




/obj/item/gun/energy/bolter_mounted_heavy
	str_requirement = 0 //Mounted weapon
	w_class = ITEM_SIZE_HUGE
	force = 30
	one_hand_penalty = 0 //Mounted weapon
	name = "Mounted Heavy Bolter"
	desc = "A specialised mounted heavy bolter, designed for use on combat platforms."
	icon_state = "ultrabolter"
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	wielded_item_state = "autoshotty" // Do not remove this. We do not have any sprites for Bolters on-mob beyond this, it is perfect. 
	fire_delay = 2
	burst = 1
	move_delay = 3
	automatic = 1
	firemodes = list()
	accuracy = 2
	max_shots = 60
	projectile_type = /obj/item/projectile/bullet/bolt/kp
	origin_tech = null
	self_recharge = 1
	charge_meter = 0
	charge_cost = 20


/obj/item/gun/energy/bolter_mounted_heavy/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

