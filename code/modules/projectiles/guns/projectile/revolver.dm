/obj/item/gun/projectile/revolver
	name = "test revolver"
	desc = "test revolver that shouldnt be in game. ahelp and put in a bug report on discord if you see this!"
	icon_state = "cptrevolver"
	item_state = "crevolver"
	caliber = "357"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	accuracy = -1
	fire_delay= 3
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	sales_price = 15

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

/obj/item/gun/projectile/revolver/messina
	name = "Messina Pattern Stub Revolver"
	desc = "A simple stub revolver made locally on the planet from sheet metal, it isn't exactly accurate... Chambered in .357."
	icon_state = "snubby"
	item_state = "crevolver"
	caliber = "357"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 15
	accuracy = -2.5 //not the best craftsmanship
	fire_delay= 10
	ammo_type = /obj/item/ammo_casing/a357

/obj/item/gun/projectile/revolver/villiers
	name = "Villiers Pattern Stub Revolver"
	desc = "This Villiers is as high quality as the rest of them. Their standard burst fire qualities somehow being fit unto a revolver chambered in .357!"
	icon_state = "slug_revolver"
	item_state = "crevolver"
	caliber = "357"
	handle_casings = CYCLE_CASINGS
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	force = 20
	accuracy = 0.5
	fire_delay= 14
	burst = 2
	ammo_type = /obj/item/ammo_casing/a357
	sales_price = 25

// .44 revolvers



/obj/item/gun/projectile/revolver/boscelot
	name = "Boscelot Pattern Stub Revolver"
	desc = "A common type of stub revolver on the frontier worlds. Chambered in .44"
	icon_state = "cptrevolver"
	item_state = "crevolver"
	caliber = ".44"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	force = 15
	accuracy = -0.5
	fire_delay= 10
	sales_price = 15
	ammo_type = /obj/item/ammo_casing/c44

/obj/item/gun/projectile/revolver/agripinaa
	name = "Agripinaa Pattern 'Necros' Revolver"
	desc = "The Necros is a heavy revolver chambered in .44 made by the heavy duty Agripinaa forge world. It is highly accurate but slow firing, at least it ejects casings by itself."
	icon_state = "necros"
	item_state = "crevolver"
	caliber = ".44"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	handle_casings = EJECT_CASINGS
	max_shells = 6
	force = 20
	accuracy = 2
	fire_delay = 12
	ammo_type = /obj/item/ammo_casing/c44
	sales_price = 25



