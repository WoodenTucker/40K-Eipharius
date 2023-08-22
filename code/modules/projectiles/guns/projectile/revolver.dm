/obj/item/gun/projectile/revolver
	name = "test revolver"
	desc = "test revolver that shouldnt be in game. ahelp and put in a bug report on discord if you see this!"
	icon_state = "cptrevolver"
	item_state = "crevolver"
	caliber = "357"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	accuracy = 0.5
	fire_delay= 3
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	sales_price = 5

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

// 357 revolva

/obj/item/gun/projectile/revolver/detective/boscelot
	name = "Boscelot Revolver"
	desc = "A cheap revolver, copying the designs from Boscelot. Chambered in .38 and constantly asking the user why they didn't get a more powerful caliber."
	icon_state = "snubby"
	max_shells = 6
	caliber = "38"
	accuracy = 0.7
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
	accuracy = 0.6 //not the best craftsmanship
	fire_delay= 3
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'

/obj/item/gun/projectile/revolver/messina
	name = "Messina Pattern Stub Revolver"
	desc = "A simple stub revolver made locally on the planet from sheet metal, it isn't exactly accurate... Chambered in .357."
	icon_state = "snubby"
	item_state = "crevolver"
	caliber = "357"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 15
	accuracy = 0.4 //not the best craftsmanship
	fire_delay= 10
	ammo_type = /obj/item/ammo_casing/a357

/obj/item/gun/projectile/revolver/mateba
	name = "Mateba Slug Revolver"
	desc = "The mateba revolver is commonly used by law enforcement and gangers, what it lacks in accuracy it makes up for in sheer firepower."
	icon_state = "mateba"
	caliber = ".50"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/a50
	sales_price = 10
	accuracy = 0.1
	fire_delay= 3

/obj/item/gun/projectile/revolver/villiers
	name = "Villiers Pattern Auto-Revolver"
	desc = "This Villiers is as high quality as the rest of them. Their standard burst fire qualities somehow being fit unto a revolver chambered in .357!"
	icon_state = "slug_revolver"
	item_state = "crevolver"
	caliber = "357"
	handle_casings = CYCLE_CASINGS
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	force = 20
	accuracy = 0.5
	fire_delay= 6
	burst = 2
	ammo_type = /obj/item/ammo_casing/a357
	sales_price = 5

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
	accuracy = 0.3
	fire_delay= 2.8
	ammo_type = /obj/item/ammo_casing/c44
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	sales_price = 8

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
	accuracy = 0.4
	fire_delay= 2.7
	ammo_type = /obj/item/ammo_casing/c44
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
	sales_price = 7

/obj/item/gun/projectile/slugrevolver/penitent
	name = "eight thousander"
	desc = "A custom built .44 slug revolver capable of holding up to 8 shells, it's incredibly heavy in the hand."
	max_shells = 8
	force = 15
	accuracy = 0.8
	fire_delay= 2.4
