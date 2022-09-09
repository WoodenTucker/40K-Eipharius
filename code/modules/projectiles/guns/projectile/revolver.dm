/obj/item/gun/projectile/revolver
	name = "revolver"
	desc = "The Lumoco Arms HE Colt is a choice revolver for when you need to put a hole in the other guy. Uses .357 ammo."
	icon_state = "cptrevolver"
	item_state = "crevolver"
	caliber = "357"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	accuracy = -2
	fire_delay= 3
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	sales_price = 30

/obj/item/gun/projectile/revolver/cpt
	name = "Captain's Special"
	desc = "The sort of weapon usually found on nobility, such as captains or commandants."
	icon_state = "cptrevolver"
	item_state = "crevolver"

/obj/item/gun/projectile/revolver/cpt/marshal
	name = "Law's Retribution"
	desc = "A modified revolver with a extended barrel and is chambered in shotgun shells. 'Lex et ordo' is engraved on the side."
	icon_state = "marshallrevolver"
	item_state = "crevolver"
	caliber = "shotgun"
	fire_delay= 2.7
	ammo_type = /obj/item/ammo_casing/shotgun
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'

/obj/item/gun/projectile/revolver/cpt/magistrate
	name = "Commandant's Special"

/obj/item/gun/projectile/revolver/cpt/inq
	name = "Lacquered Stub Revolver"
	desc = "A lacquered stub revolver with various intricate patterns and designs dotting the surface. It looks as though someone from nobility would possess this."

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

/obj/item/gun/projectile/revolver/mateba
	name = "mateba"
	desc = "The mateba revolver is commonly used by law enforcement and gangers, what it lacks in accuracy it makes up for in sheer firepower."
	icon_state = "mateba"
	caliber = ".50"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/a50
	sales_price = 40
	accuracy = -2.5
	fire_delay= 3

/obj/item/gun/projectile/revolver/detective
	name = "revolver"
	desc = "A cheap knock-off of a Smith & Wesson Model 10. Uses .38-Special rounds."
	icon_state = "detective"
	max_shells = 6
	caliber = "38"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/c38

/obj/item/gun/projectile/revolver/detective/verb/rename_gun()
	set name = "Name Gun"
	set category = "Object"
	set desc = "Click to rename your gun. If you're the detective."

	var/mob/M = usr
	if(!M.mind)	return 0
	if(!M.mind.assigned_role == "Detective")
		to_chat(M, "<span class='notice'>You don't feel cool enough to name this gun, chump.</span>")
		return 0

	var/input = sanitizeSafe(input("What do you want to name the gun?", ,""), MAX_NAME_LEN)

	if(src && input && !M.stat && in_range(M,src))
		SetName(input)
		to_chat(M, "You name the gun [input]. Say hello to your new friend.")
		return 1

/obj/item/gun/projectile/revolver/detective/boscelot
	name = "Boscelot Revolver"
	desc = "A cheap revolver, copying the designs from Boscelot. Chambered in .38 and constantly asking the user why they didn't get a more powerful caliber."
	icon_state = "snubby"
	max_shells = 6
	caliber = "38"
	accuracy = -3
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
	accuracy = -2 //not the best craftsmanship
	fire_delay= 3
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'

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
	accuracy = -2.5
	fire_delay= 2.8
	ammo_type = /obj/item/ammo_casing/c44
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	sales_price = 33

/obj/item/gun/projectile/slugrevolver
	name = "slug revolver"
	desc = "The slug revolver is a fine piece of masterwork made on many forge worlds. This one seems to be a older model. Uses .44 ammo."
	icon_state = "hunting_revolver"
	item_state = "crevolver"
	caliber = ".44"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 10
	accuracy = -2
	fire_delay= 2.7
	ammo_type = /obj/item/ammo_casing/c44
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	sales_price = 37

// Blade Runner pistol.
/obj/item/gun/projectile/revolver/deckard
	name = "Deckard .44"
	desc = "A custom-built revolver, based off the semi-popular Detective Special model."
	icon_state = "deckard-empty"
	ammo_type = /obj/item/ammo_magazine/c38/rubber

/obj/item/gun/projectile/revolver/deckard/emp
	ammo_type = /obj/item/ammo_casing/c38/emp

/obj/item/gun/projectile/revolver/deckard/update_icon()
	..()
	if(loaded.len)
		icon_state = "deckard-loaded"
	else
		icon_state = "deckard-empty"

/obj/item/gun/projectile/revolver/deckard/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		flick("deckard-reload",src)
	..()

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

/obj/item/gun/projectile/revolver/webley
	name = "service revolver"
	desc = "A rugged top break revolver based on the Webley Mk. VI model, with modern improvements. Uses .44 magnum rounds."
	icon_state = "webley"
	item_state = "webley"
	max_shells = 6
	caliber = ".44"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/c44
