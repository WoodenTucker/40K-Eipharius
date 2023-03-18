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
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_LARGE
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
	if(istype(O,/obj/item/gun/energy/las/lasgun)) // tinker soon
		to_chat(user, "<span class='warning'>[O] has already been upgraded!</span>")
		return 1
	else if (!(istype(O, /obj/item/gun/energy/las/lasgun)))
		to_chat(user, "<span class='warning'>[O] cannot be upgraded!</span>")
		return 1
	else if(prob(25))
		qdel(O)
		new /obj/item/gun/energy/las/lasgun (get_turf(src)) // tinker soon
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
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_LARGE
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

/obj/item/device/lube
	name = "Ingot Lube"
	desc = "Lubricant to properly deal with ingot crafting as a finisher."
	icon = 'icons/obj/items/lube.dmi'
	icon_state = "lube"
	item_state = "lube"
	w_class = ITEM_SIZE_LARGE

/obj/item/device/autochisel
	name = "Auto-Chisel"
	desc = "A sacred relic from centuries past, this silver chisel does all the work for the Tech Priest."
	icon = 'icons/obj/items/auto_chisel.dmi'
	icon_state = "auto_chisel"
	item_state = "auto_chisel"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_LARGE
	var/constructionsystem = 0
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/device/autochisel/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/device/chisel
	name = "Chisel"
	desc = "An old item since mankind's first dawned days on Terra. You feel you could begin to craft anything from an ingot using this. At least the basic ingots that is."
	icon = 'icons/obj/items/chisel.dmi'
	icon_state = "chisel"
	item_state = "chisel"
	w_class = ITEM_SIZE_LARGE

/obj/item/device/lasercutter
	name = "Laser Cutter"
	desc = "\"Take care with that! We have not fully ascertained its function, and the ticking is accelerating.\" - Technographer Adar Millez."
	icon = 'icons/obj/items/laser_cutter.dmi'
	icon_state = "laser_cutter"
	item_state = "laser_cutter"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_LARGE
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

/obj/item/device/hammer //lasercutter
	name = "Hammer"
	desc = "For any loyal citizen of the Imperium's ingot shaping."
	icon = 'icons/obj/items/hammer.dmi'
	icon_state = "hammer"
	item_state = "hammer"
	slot_flags = null
	w_class = ITEM_SIZE_LARGE
	var/constructionsystem = 0



/obj/item/melee/omnissiah_axe
	name = "Omnissiah`s axe"
	desc = "The Blessed Power Axe of any respectable techpriest, these arent very common here... Its decorated with holy symbols of the Adeptus Mechanicus"
	icon = 'icons/obj/items/oma.dmi'
	icon_state = "Whistle_InHand_R"
	item_state = "Whistle_InHand"
	wielded_icon = "Whistle_InHand_W"
	block_chance = 20 //20 block chance, same block chance, force and pen as brutal chainsword but harder to get
	force = 50
	force_wielded = 60
	armor_penetration = 65 //high penetration due to it being a power axe, weaker than power sword due to moderate block chance.
	sharp = TRUE
	edge = TRUE
//	obj_flags = OBJ_FLAG_CONDUCTIBLE //me on my way to get shocked after flinging a power axe at a power wire cause it somehow is conductible
	w_class = ITEM_SIZE_LARGE //makes it actually fast and pretty usable, magi ALWAYS carry it around, no reason for it to weight anything.
	weapon_speed_delay = 12
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
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_LARGE
	var/constructionsystem = 0
	attack_verb = list("singed", "charred", "burned", "sizzled", "cooked",)

/obj/item/device/neuraladapter/attack(mob/living/simple_animal/vatgrown/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("<span class='notice'>The base of [C]'s skull is suddenly pierced with the neural adapter by [user], getting their mind programmed and indoctrinated!</span>")
	..()

obj/item/device/neuraladapter/attack(mob/living/carbon/human/skitarii/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		playsound(src, 'sound/effects/adapter.ogg', 100, 1, 1)
		visible_message("<span class='notice'>[user] stimulates [C]'s brain,  It will probably help them to to wake up faster.</span>")
		C.request_player()
	..()

/obj/item/device/neuraladapter/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


//Robot stuff and narthecium shit

/obj/item/clothing/gloves/thick/narthecium/apot
	name = "Apothecary's Narthecium"
	desc = "A giant surgical combi-tool with multiple different tools, it clearly wasnt made for a normal human."
	armor = list(melee = 80, bullet = 40, laser = 20, energy = 30, bomb = 70, bio = 100, rad = 100)
	icon = 'icons/obj/guardpower_gear_32xOBJ.dmi'
	icon_state = "hypogauntlet" //gloves.dmi
	item_state = "sister" //hands.dmi

/obj/item/clothing/gloves/thick/narthecium/apot/verb/togglenarthecium()
	set name = "Activate Narthecium"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You activate the chainsaw on your narthecium, getting ready to cut through armor and bone.")
		usr.put_in_hands(new /obj/item/melee/chain/pcsword/narthecium/apot(usr))
		src.is_toggled = 2

/obj/item/clothing/gloves/thick/narthecium/apot/verb/toggledefib()
	set name = "Pull out Electro-Paddles"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out your electro paddles and get ready to shock!")
		usr.put_in_hands(new /obj/item/shockpaddles/narthecium(usr))
		src.is_toggled = 2

/obj/item/shockpaddles/narthecium
	name = "narthecium electro-paddles"
	desc = "A pair of advanced electro-paddles powered by a promethium generator, it's shocks are so strong that they could probably pierce a astartes ribcage without causing too much damage"
	chargecost = 0
	combat = 1
	safety = 0 //if you can zap people with the paddles on harm mode
	chargetime = (0 SECONDS)
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	cooldowntime = (4 SECONDS)

/obj/item/shockpaddles/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/melee/chain/pcsword/narthecium/apot
	name = "Apothecary's Narthecium"
	desc = "The standard issued narthecium of the apothecaries, powered by a internal promethium generator."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pcsword"
	item_state = "pcsword"
	wielded_icon = "pcsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 20
	force = 50
	force_wielded = 60
	armor_penetration = 60
	block_chance = 45 //apothecary nartheciums can be used for blocking better, due to being essentially a extension of the apothecaries body and being insanely armored.

/obj/item/melee/chain/pcsword/narthecium/apot/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/clothing/gloves/thick/narthecium
	name = "Sister Hospitaller's Narthecium"
	desc = "A pair of white, augmented gloves, these have several modifications on them."
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 30, bomb = 20, bio = 0, rad = 60)
	icon_state = "sister" //gloves.dmi
	item_state = "sister" //hands.dmi
	var/can_toggle = 1
	var/is_toggled = 1

/obj/item/clothing/gloves/thick/narthecium/verb/togglesaw()
	set name = "Pull out integrated saw"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You grab a small perfurating device from your gloves.")
		usr.put_in_hands(new /obj/item/circular_saw/narthecium(usr))
		src.is_toggled = 2

/obj/item/circular_saw/narthecium
	name = "Intergrated bone saw"
	desc = "A small yet incredibly sharp saw made for heavy duty cutting."
/obj/item/circular_saw/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)



/obj/item/clothing/gloves/thick/narthecium/verb/togglemusclefixer()
	set name = "Activate FixOvein"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You call upon the machine spirit of the narthecium to give you it's integrated fixovein supply.")
		usr.put_in_hands(new /obj/item/FixOVein/narthecium(usr))
		src.is_toggled = 2


/obj/item/FixOVein/narthecium
	name = "Intergrated FixOVein"
	desc = "A small yet incredibly powerful regenerative device, able to regenerate small fragile tissue, however, its pretty slow at it, so most people still prefer the suture."
/obj/item/FixOVein/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/clothing/gloves/thick/narthecium/verb/togglebonefixer()
	set name = "Activate Bone Gel"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You pressing the bonegel dispenser button on your narthecium, before noticing it doesn't work, instead, it opens a small hole with a bone gel thingy.")
		usr.put_in_hands(new /obj/item/bonegel/narthecium(usr))
		src.is_toggled = 2


/obj/item/bonegel/narthecium
	name = "Bone Gel Dispenser"
	desc = "A dispenser linked to a small tube in the gloves, you don't know how, but it seems to have infinite juice, also, the bone dispenser is duct taped to the tube."
/obj/item/bonegel/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/clothing/gloves/thick/narthecium/verb/togglebonesetter()
	set name = "Activate Bone Setter"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You activate the integrated bone setting features of the narthecium, its painful and dizzying for a moment, but you feel more concentrated as a bone setter is seemingly materialized in your hands.")
		usr.put_in_hands(new /obj/item/bonesetter/narthecium(usr))
		src.is_toggled = 2


/obj/item/bonesetter/narthecium
	name = "Intergrated Bone Setter"
	desc = "A integrated bone setter with the stability and precision of a servo skull, works well for setting bones and stuff!"
/obj/item/bonesetter/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/clothing/gloves/thick/narthecium/verb/togglescalpelly()
	set name = "Activate Scalpel"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You grab the duct taped scalpel on the narthecium.")
		usr.put_in_hands(new /obj/item/scalpel/narthecium(usr))
		src.is_toggled = 2

/obj/item/scalpel/narthecium
	name = "Duct Taped Scalpel"
	desc = "You aren't sure who, but someone ductaped a scalpel to these gloves, its worse for proper medicine than the IMS, although more accurate."
/obj/item/scalpel/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/clothing/gloves/thick/narthecium/verb/togglecauterey()
	set name = "Activate Cautery"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You activate and pull out a servo cautery from the holy narthecium.")
		usr.put_in_hands(new /obj/item/cautery/narthecium(usr))
		src.is_toggled = 2

/obj/item/cautery/narthecium
	name = "Servo-Cautery"
	desc = "A red cautery which seems to be faster at closing wounds than normal cauteries, but maybe you just feel that way because its red?"
/obj/item/cautery/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/clothing/gloves/thick/narthecium/verb/togglebloodstopper()
	set name = "Activate Servo Hemostat"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out servo hemostats from your narthecium and prepare to activate them.")
		usr.put_in_hands(new /obj/item/hemostat/narthecium(usr))
		src.is_toggled = 2

/obj/item/hemostat/narthecium
	name = "Servo-Hemostat"
	desc = "Hm, this hemostat holds some bleeding closed just like a normal hemostat, But! it holds the bleeding FOR you! sparing some of your energy of your oh so delicate surgeon hands."
/obj/item/hemostat/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/clothing/gloves/thick/narthecium/verb/togglefleshpeeler()
	set name = "Activate Duct Tape Retractor"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You SEIZE the retractor on your narthecium from it's duct tape restraints.")
		usr.put_in_hands(new /obj/item/retractor/narthecium(usr))
		src.is_toggled = 2

/obj/item/retractor/narthecium
	name = "Duct Taped Retractor"
	desc = "Again, why is this duct taped to such a wonderous piece of tech if the IMS already exists?"
/obj/item/retractor/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)



/obj/item/clothing/gloves/thick/narthecium/verb/togglefleshdestroyer()
	set name = "Activate Blessed IMS"
	set category = "Narthecium"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You activate the integrated incision management systems from your gloves, preparing them to start a incision.")
		usr.put_in_hands(new /obj/item/scalpel/manager/narthecium(usr))
		src.is_toggled = 2

/obj/item/scalpel/manager/narthecium
	name = "Integrated Incision Management System"
	desc = "A beatiful piece of tech made with the strongest holy oils of mars and some of the most holy incenses of the ecclesiarchy! Or so they have told you."
/obj/item/scalpel/manager/narthecium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)



/obj/item/melee/mounted_psword
	name = "Power Blade"
	desc = "A retractable power weapon affixed to the hands"
	icon = 'icons/obj/guardpower_gear_32xOBJ.dmi'
	icon_state = "powersword"
	item_state = "powersword"
	wielded_icon = "powersword"
	force = 40
	block_chance = 50
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
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	wielded_item_state = "autoshotty" // Do not remove this. We do not have any sprites for Bolters on-mob beyond this, it is perfect.
	fire_delay = 2
	burst = 1
	move_delay = 3
	automatic = 1
	firemodes = list()
	accuracy = 1
	max_shots = 60
	projectile_type = /obj/item/projectile/bullet/bolterrifle
	self_recharge = 1
	charge_meter = 0
	charge_cost = 20


/obj/item/gun/energy/bolter_mounted_heavy/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


//AUGMETIC WEAPONS

/obj/item/gun/energy/augmetic/las/light
	name = "Augmetic Las-striker"
	desc = "This self-recharging easily concealed augmetic weapon can provide a handy advantage in a firefight, but pays for convenience in terms of efficiency."
	icon_state = "laspistol"
	item_state = "laspistol"
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = 0
	move_delay = 0
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 600
	self_recharge = 1
	armor_penetration = 5
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "machinepistol-wielded" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/augmetic/las/light/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/augmetic/las/medium
	name = "Heavy Augmetic Las-striker"
	desc = "This high quality self-recharging easily concealed augmetic weapon can provide a handy advantage in a firefight, but pays for convenience in terms of efficiency. Reserved for the wealthy and important, this variant packs more of a punch, and is more efficient to boot."
	icon_state = "laspistol"
	item_state = "laspistol"
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = 0
	move_delay = 0
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/overcharge
	charge_cost = 300
	self_recharge = 1
	armor_penetration = 5
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "machinepistol-wielded" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/augmetic/las/medium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/augmetic/las/heavy
	name = "Augmetic Las-cannon"
	desc = "This incredibly advanced augmetic weapon is reserved only for the highest ranking in Imperial society."
	icon_state = "laspistol"
	item_state = "laspistol"
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = 0
	move_delay = 0
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/plasmabeam
	charge_cost = 3000
	self_recharge = 1
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "machinepistol-wielded" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/augmetic/las/heavy/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/augmetic/plasma/light
	name = "Augmetic Plasma Pistol"
	desc = "For when you need to kill something, and have a spare arm."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "ppistol"
	item_state = "pulse_carbine"
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = -2
	move_delay = 2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	charge_cost = 600
	self_recharge = 1
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "pulse_carbine" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/augmetic/plasma/light/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/augmetic/plasma/medium
	name = "Augmetic Plasma Rifle"
	desc = "Who but a maniac would use such a thing? Stand back!"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "prifle"
	item_state = "ionrifle"
	w_class = ITEM_SIZE_HUGE
	force = 8
	accuracy = -2
	move_delay = 2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmarifle
	charge_cost = 1500
	self_recharge = 1
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "pulse_carbine" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/augmetic/plasma/medium/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/augmetic/seolite/neurotoxin
	name = "Seolite Toxin Beamer"
	desc = "This mysterious device fires an incapacitating neurotoxin encased in an armour piercing energy field."
	icon_state = "retro"
	item_state = "retro"
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = 2
	move_delay = 2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/neurotoxin
	charge_cost = 600
	self_recharge = 1
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "pulse_carbine" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/augmetic/seolite/neurotoxin/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


/obj/item/gun/energy/thallax/lightning
	name = "Thallax Warrior Lightning Gun"
	desc = "A powerful weapon which fires beams of lightning at your foes!"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "hyperf"
	item_state = "hyperf"
	w_class = ITEM_SIZE_HUGE
	force = 45 //It's a big gun with a sword on it.
	sharp = 1
	edge = 1
	accuracy = 1
	move_delay = 2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/thallax/lightning
	charge_cost = 1500
	self_recharge = 1
	cell_type = /obj/item/cell/mecha
	ammoType = /obj/item/cell/mecha
	wielded_item_state = "pulse_carbine" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

/obj/item/gun/energy/thallax/lightning/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)
