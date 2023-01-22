//**HERESY**//

/obj/structure/forge/tzeentch
	name = "forge"
	desc = "An heretical forge used to create !"
	icon = 'icons/obj/cult.dmi'
	icon_state = "forge"
	coalfed = -1

/obj/item/device/lasercutter/tzeentch
	name = "Suspiscious Laser Cutter"
	desc = "Am laser cutter created with technoheretical methods, this one seems to be more advanced than normal."

/obj/item/device/holyoils/goop
	name = "Weird Oils"
	desc = "An bottle of oil, it appears to be moving on it's own."
	icon = 'icons/cadia-sprites/migrated2/items.dmi'
	icon_state = "ointment"
	item_state = "ointment"

/obj/item/device/holyoils/goop/attack(mob/living/carbon/C, mob/living/carbon/human/user)
	if(istype(C))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("<span class='notice'>[C] is lathered in the disgusting oils of tzeentch by [user]. It looks incredibly awkward!</span>")
	..()

/obj/item/device/tome/tzeentch
	name = "Recipe Book"
	desc = "A book full of blueprints and crafting recipes with the cover of a recipe book, the blueprints were written in human blood and seem to be somehow moving, you also find a blue autochisel in the last page of the book, it has no power connector."
	icon = 'icons/obj/library.dmi'
	icon_state = "cooked_book"


/obj/item/clothing/gloves/thick/tzeentch
	name = "work gloves"
	desc = "A pair of black gloves, upon closer inspection you notice small modifications to the gloves and some kind of modified lasercutter attached to the gloves, theres also a weird bottle inside of the glove."
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 30, bomb = 20, bio = 0, rad = 60)
	icon_state = "black"
	item_state = "bgloves"
	unacidable = 1
	var/can_toggle = 1
	var/is_toggled = 1

/obj/item/clothing/gloves/thick/tzeentch/verb/togglecutter()
	set name = "Activate laser cutter"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You activate and extend out the laser cutter.")
		usr.put_in_hands(new /obj/item/device/lasercutter(usr))
		src.is_toggled = 2

/obj/item/clothing/gloves/thick/tzeentch/verb/toggleoil()
	set name = "Eject Oil Bottle"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
		return
		src.is_toggled = 1
	else
		to_chat(usr,"You flap around with your glove until you remove a small bottle from a hidden compartment.")
		usr.put_in_hands(new /obj/item/device/holyoils/goop(usr))
		src.is_toggled = 2


/obj/item/melee/baton/heresy
	name = "Tainted Knife"
	desc = "A disgustingly tainted knife enchanted by the god of pleasure and pain, slaanesh, just by holding it you can feel severe pain on your fingers."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slaanesh_dagger"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 15
	agonyforce = 80 //stronger than a nighstick, but not blatantly OP of fucking course.
	force_wielded = 20
	block_chance = 20
	w_class = ITEM_SIZE_SMALL
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	weapon_speed_delay = 5
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"


/obj/item/melee/sword/chaosknife
	name = "chaos knife"
	desc = "A knife made of bones and corruption."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "chaos_knife"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 20
	force_wielded = 25
	armor_penetration = 15
	block_chance = 20
	sales_price = 39
	weapon_speed_delay = 5
	w_class = ITEM_SIZE_SMALL
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"


/obj/item/melee/sword/hellblade
	name = "hellblade sword"
	desc = "A sword forged with corruption and souls of the raged."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hellblade"
	item_state = "sabre"
	attack_verb = list("stabbed", "chopped", "cut", "sliced", "burned")
	force = 35
	force_wielded = 40
	sharp = 1
	block_chance = 45
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 200
	weapon_speed_delay = 7

/obj/item/melee/sword/zombie_claw
	name = "Zombie Claw"
	desc = "The fingernails are gone and the bone is protruding from the tip of the finger, a sickly bile coats the hand."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "zombo_clawl"
	item_state = "fuckingnothing"
	item_flags = ITEM_FLAG_NODROP
	attack_verb = list("slashed")
	force = 21
	force_wielded = 24
	armor_penetration = 15
	block_chance = 20
	sales_price = 39
	weapon_speed_delay = 5

/obj/item/melee/sword/zombie_clawl/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/melee/sword/zombie_claw/zombie_clawr
	name = "Zombie Clawr"
	desc = "The fingernails are gone and the bone is protruding from the tip of the finger, a sickly bile coats the hand."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "zombo_clawr"

/obj/item/melee/sword/zombie_claw/zombie_clawr/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)


//Cornite
/obj/item/melee/chain/pcsword/khorneaxe
	name = "Khornate Chainaxe"
	desc = "The Chainaxe of the Blood God's chosen mortal men and Astartes alike. It looks excellent for killing, maiming, and perhaps even burning. It doesn't look very good for blocking, good thing you're only gonna attack with it."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "chainaxe"
	item_state = "kchainaxe"
	wielded_icon ="kchainaxe"
	str_requirement = 13
	force = 50 // blood for the blood god. its strong,  but the shit block chance makes it balanced
	force_wielded = 70
	armor_penetration = 60
	block_chance = 5
	sharp = TRUE
	w_class = ITEM_SIZE_HUGE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
	weapon_speed_delay = 9
	sales_price = 35
	edge = 1

/obj/item/melee/sword/demon
	name = "demon sword"
	desc = "A sword possessed by an entity of the warp. Once used by a great noble of imperium before it was corrupted. How far it has fallen..."
	icon_state = "Scorpion_CS"
	item_state = "Scorpion_CS"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 17
	force = 50
	force_wielded = 70 //warpsword
	armor_penetration = 90
	block_chance = 50 //may the warp guide your hand
	sharpness = TRUE
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 10
	sales_price = 300


//Slaneshy

/obj/item/melee/sword/slaanesh
	name = "slaanesh sword"
	desc = "A sword made of corruption."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slaanesh_sword"
	item_state = "sabre"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 33
	force_wielded = 36
	sharp = 1
	block_chance = 40
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 90
	weapon_speed_delay = 7






/obj/item/melee/sword/skinning_knife
	name = "ritual knife"
	desc = "A visitor from the warp..."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "artknife"
	item_state = "artknife"//"knife"
	attack_verb = list("slashed")
	force = 24
	force_wielded = 27
	block_chance = 20
	sales_price = 30
	weapon_speed_delay = 5
	w_class = ITEM_SIZE_SMALL
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"
	var/skinning = 0

/obj/item/melee/sword/skinning_knife/attack(mob/living/carbon/C as mob, mob/living/user as mob)
	if(C.skinned == 1)
		to_chat(usr, "The flesh has already been stripped away from this one...")
		return
	if(src.skinning == 1)
		to_chat(usr, "You are already skinning this one.")
		return
	if(C.stat != DEAD)
		to_chat(usr, "No... I can't... [C] is still alive...")
		return
	if(user.a_intent == I_HELP)
		to_chat(usr, "I'm not helping him... I need to harm him!")
		return
	if(user.a_intent == I_HURT && (C.stat = DEAD))
		usr.visible_message("\The [usr] gingerly slides the blade beneath the skin of [C]. Hungrily chasing the next rush of pleasure [usr] sloppily rends a chunk of flesh from the corpse.",\
			"You cut away [C]'s flesh with \the [src]!",\
			"<font color='#800080'>You hear a cackle, first a deep, masculine voice followed by a much softer, feminine tone.</font>")
		playsound(usr, 'sound/effects/SkinningA.ogg', 80, 0, -1)
		src.skinning = 1
		(do_after(user,40,src))
		C.skinned = 1
		src.skinning = 0
		new /obj/item/humanskin(C.loc)
		return
	else
		..()
/*
/obj/item/melee/sword/skinning_knife/pickup(var/mob/living/carbon/human/user)
	if(user.lust < 3 )
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the [src]. It would be wise to be rid of this quickly.</span>")
		user.make_dizzy(220)
		user.vomit()
		playsound(usr, 'sound/effects/whispers1.ogg', 100, 0, -1)*/



/obj/item/melee/sword/slehdagger
	name = "slaanesh dagger"
	desc = "A exotic dagger used for pleasure."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slaanesh_dagger"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 21
	force_wielded = 24
	armor_penetration = 15
	block_chance = 20
	sales_price = 39
	weapon_speed_delay = 5
	w_class = ITEM_SIZE_SMALL
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"





// TODO: "Cursed" items, with special abilities and attributes. Currently used for items that increase favor with certain gods.
/datum/component/heretic_item
	var/name
	var/deity

/datum/component/heretic_item/favor
	var/favor_amt

/datum/component/heretic_item/favor/eaten

/datum/component/heretic_item/favor/eaten/Initialize(deity, favor_amt)
	src.favor_amt = favor_amt
	src.deity = deity
	return ..()

/datum/component/heretic_item/favor/proc/pre_check(var/mob/living/carbon/human/user)
	var/datum/heretic_deity/diety = GODBYPLAYER(user)
	if(diety && diety.name != src.deity)
		return FALSE
	return TRUE

/datum/component/heretic_item/favor/eaten/RegisterWithParent()
	RegisterSignal(parent, COMSIG_FOOD_EATEN, .proc/on_eaten)

/datum/component/heretic_item/favor/eaten/proc/on_eaten(atom/source, var/mob/living/carbon/human/user)
	if(pre_check(user))
		SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, favor_amt)

/datum/component/heretic_item/favor/used/RegisterWithParent()
	RegisterSignal(parent, COMSIG_FOOD_EATEN, .proc/on_used)

/datum/component/heretic_item/favor/used/proc/on_used(atom/source, var/mob/living/carbon/human/user)
	if(pre_check(user))
		SEND_SIGNAL(user, COMSIG_CULT_ADD_FAVOR, favor_amt)

