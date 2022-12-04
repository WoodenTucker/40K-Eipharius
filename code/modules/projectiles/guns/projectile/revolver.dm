/obj/item/gun/projectile/revolver
	name = "revolver"
	desc = "The Lumoco Arms HE Colt is a choice revolver for when you need to put a hole in the other guy. Uses .357 ammo."
	icon_state = "cptrevolver"
	item_state = "crevolver"
	caliber = "357"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	accuracy = 1
	fire_delay= 3
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	sales_price = 22

/obj/item/gun/projectile/revolver/attack_self(mob/user)
	. = ..()
	unload_ammo(user, allow_dump=TRUE)

/obj/item/gun/projectile/revolver/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set category = "Object"

	chamber_offset = 0
	visible_message("<span class='warning'>\The [usr] spins the cylinder of \the [src]!</span>", \
	"<span class='notice'>You hear something metallic spin and click.</span>")
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/gun/projectile/revolver/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/gun/projectile/revolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()


/*
/obj/item/gun/projectile/revolver/mateba
	name = "mateba"
	desc = "The mateba revolver is commonly used by law enforcement and gangers, what it lacks in accuracy it makes up for in sheer firepower."
	icon_state = "mateba"
	caliber = ".50"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/a50
	sales_price = 35
	accuracy = 0
	fire_delay= 3
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'

/obj/item/gun/projectile/revolver/detective
	name = "revolver"
	desc = "A cheap knock-off of a Smith & Wesson Model 10. Uses .38-Special rounds."
	icon_state = "detective"
	max_shells = 6
	caliber = "38"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/c38

/obj/item/gun/projectile/revolver/detective/boscolet
	name = "Boscolet Revolver"
	desc = "A cheap revolver, copying the designs from Boscolet. Chambered in .38 and constantly asking the user why they didn't get a more powerful caliber."
	icon_state = "snubby"
	max_shells = 6
	caliber = "38"
	accuracy = 1
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/c38

/obj/item/gun/projectile/mervex
	name = "Mervex Revolver"
	desc = "The Mervex revolver is commonly used by pilgrims that like classy. Commonly found on many hive worlds. Uses .357 ammo."
	icon_state = "mervex"
	item_state = "crevolver"
	caliber = "357"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 15
	accuracy = 1 //not the best craftsmanship
	fire_delay= 2.6
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'

/obj/item/gun/projectile/necros
	name = "Necros Revolver"
	desc = "The Necros is a heavy revolver used commonly by merchants. Uses .44 magnum ammo."
	icon_state = "necros"
	item_state = "crevolver"
	caliber = ".44"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 20
	accuracy = 0.5
	fire_delay= 2.8
	ammo_type = /obj/item/ammo_casing/c44
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	sales_price = 25

/obj/item/gun/projectile/slugrevolver
	name = "Slug Revolver"
	desc = "The Slug Revolver is a fine piece of masterwork made on many forge worlds. This one seems to be a older model. Uses .44 ammo."
	icon_state = "hunting_revolver"
	item_state = "crevolver"
	caliber = ".44"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 20
	accuracy = 0.8
	fire_delay= 2.6
	ammo_type = /obj/item/ammo_casing/c44
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	sales_price = 30
	*/

/*
/obj/item/gun/projectile/revolver/capgun
	name = "cap gun"
	desc = "Looks almost like the real thing! Ages 8 and up."
	icon_state = "revolver-toy"
	item_state = "revolver"
	caliber = "caps"
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/cap

/obj/item/gun/projectile/revolver/capgun/attackby(obj/item/wirecutters/W, mob/user)
	if(!istype(W) || icon_state == "revolver")
		return ..()
	to_chat(user, "<span class='notice'>You snip off the toy markings off the [src].</span>")
	name = "revolver"
	icon_state = "revolver"
	desc += " Someone snipped off the barrel's toy mark. How dastardly."
	return 1
*/


/*
/obj/item/gun/projectile/revolver/deckard/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		flick("deckard-reload",src)
	..()
*/