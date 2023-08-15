/obj/item/ammo_magazine/a357
	name = "speed loader (.357)"
	desc = "A speed loader for revolvers."
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/a357/ap
	name = "AP speed loader (.357)"
	desc = "An armor piercing speed loader for revolvers."
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357/ap
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/a357/ms
	name = "MS speed loader (.357)"
	desc = "A man stopper speed loader for revolvers."
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357/ms
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/a357/kp
	name = "KP speed loader (.357)"
	desc = "A kraken penetrator speed loader for revolvers."
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357/kp
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c50
	name = "speed loader (.50)"
	desc = "A speed loader for revolvers."
	icon_state = "38"
	caliber = ".50"
	ammo_type = /obj/item/ammo_casing/a50
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c50/ap
	name = "AP speed loader (.50)"
	desc = "An armor piercing speed loader for revolvers."
	icon_state = "38"
	caliber = ".50"
	ammo_type = /obj/item/ammo_casing/a50/ap
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c50/ms
	name = "MS speed loader (.50)"
	desc = "A manstopper speed loader for revolvers."
	icon_state = "38"
	caliber = ".50"
	ammo_type = /obj/item/ammo_casing/a50/ms
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c50/kp
	name = "KP speed loader (.50)"
	desc = "A kraken penetrator speed loader for revolvers."
	icon_state = "38"
	caliber = ".50"
	ammo_type = /obj/item/ammo_casing/a50/kp
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c38
	name = "speed loader (.38)"
	desc = "A speed loader for revolvers."
	icon_state = "38"
	caliber = "38"
	matter = list(DEFAULT_WALL_MATERIAL = 360)
	ammo_type = /obj/item/ammo_casing/c38
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c38/rubber
	name = "speed loader (.38, rubber)"
	icon_state = "R38"
	ammo_type = /obj/item/ammo_casing/c38/rubber

/obj/item/ammo_magazine/c44
	name = "speed loader (.44 magnum)"
	desc = "A speed loader for revolvers."
	icon_state = "38"
	ammo_type = /obj/item/ammo_casing/c44
	matter = list(DEFAULT_WALL_MATERIAL = 450)
	caliber = ".44"
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c44/ap
	name = "AP speed loader (.44 magnum)"
	desc = "An AP speed loader for revolvers."
	ammo_type = /obj/item/ammo_casing/c44/ap

/obj/item/ammo_magazine/c44/ms
	name = "MS speed loader (.44 magnum)"
	desc = "An MS speed loader for revolvers."
	ammo_type = /obj/item/ammo_casing/c44/ms

/obj/item/ammo_magazine/c44/kp
	name = "KP speed loader (.44 magnum)"
	desc = "An KP speed loader for revolvers."
	ammo_type = /obj/item/ammo_casing/c44/kp

/obj/item/ammo_magazine/c44/rubber
	name = "speed loader (.44 magnum, rubber)"
	icon_state = "R38"
	ammo_type = /obj/item/ammo_casing/c44/rubber

/obj/item/ammo_magazine/mc9mm
	name = "magazine (9mm)"
	icon_state = "mag9mm"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 12
	multiple_sprites = 1

/obj/item/ammo_magazine/mc9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc9mm/ap
	name = "AP magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_magazine/mc9mm/ms
	name = "MS magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/ms

/obj/item/ammo_magazine/mc9mm/kp
	name = "KP magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/kp

/obj/item/ammo_magazine/smgmc9mm
	name = "SMG magazine (9mm)"
	icon_state = "9mmSMG"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/mc9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/box/c9mm
	name = "ammunition box (9mm)"
	icon_state = "9mm"
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 30

/obj/item/ammo_magazine/box/c9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc9mmt/machinepistol
	name = "9mm SMG magazine"
	desc = "Holds 30 bullets. That should be enough for all of ya."
	icon_state = "machinepistol"
	max_ammo = 30

/obj/item/ammo_magazine/mc45mm
	name = "magazine (.45)"
	icon_state = "45-10"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	caliber = ".45"
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/mc45mm/ms
	name = "MS magazine (.45)"
	desc = "A manstopper .45 magazine."
	ammo_type = /obj/item/ammo_casing/c45/ms

/obj/item/ammo_magazine/mc45mm/kp
	name = "KP magazine (.45)"
	desc = "A kraken penetrator .45 magazine."
	ammo_type = /obj/item/ammo_casing/c45/kp

/obj/item/ammo_magazine/mc45mm/ap
	name = "AP magazine (.45)"
	desc = "An armor piercing .45 magazine."
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_magazine/mc45mm/empty
	initial_ammo = 0
	icon_state = "45-0"

/obj/item/ammo_magazine/mc9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a762
	name = "magazine (7.62mm)"
	icon_state = "rsc"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "a762"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 20 //if we lived in a world where normal mags had 30 rounds, this would be a 20 round mag
	multiple_sprites = 1

/obj/item/ammo_magazine/a762/ap
	name = "AP magazine (7.62mm)"
	ammo_type = /obj/item/ammo_casing/a762/ap

/obj/item/ammo_magazine/a762/ms
	name = "MS magazine (7.62mm)"
	ammo_type = /obj/item/ammo_casing/a762/ms

/obj/item/ammo_magazine/a762/kp
	name = "KP magazine (7.62mm)"
	ammo_type = /obj/item/ammo_casing/a762/kp

/obj/item/ammo_magazine/a762/empty
	initial_ammo = 0

/obj/item/ammo_magazine/box/a556
	name = "magazine box (5.56mm)"
	icon_state = "hmg"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "a556"
	matter = list(DEFAULT_WALL_MATERIAL = 4500)
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/box/a556/empty
	initial_ammo = 0

/obj/item/ammo_magazine/box/a556/mg08
	name = "LMG mag"
	icon_state = "hmg"

/obj/item/ammo_magazine/box/a556/mg08/ms
	name = "MS LMG mag"
	icon_state = "hmg"
	ammo_type = /obj/item/ammo_casing/a556/ms

/obj/item/ammo_magazine/box/a556/mg08/kp
	name = "KP LMG mag"
	icon_state = "hmg"
	ammo_type = /obj/item/ammo_casing/a556/kp

/obj/item/ammo_magazine/c556
	name = "magazine (5.56mm)"
	icon_state = "5556"
	mag_type = MAGAZINE
	caliber = "a556"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/c556/ap
	name = "AP magazine (5.56mm)"
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_magazine/c556/kp
	name = "KP magazine (5.56mm)"
	ammo_type = /obj/item/ammo_casing/a556/kp

/obj/item/ammo_magazine/c556/ms
	name = "MS magazine (5.56mm)"
	ammo_type = /obj/item/ammo_casing/a556/ms

/obj/item/ammo_magazine/caps
	name = "speed loader (caps)"
	desc = "A cheap plastic speed loader for some kind of revolver."
	icon_state = "T38"
	caliber = "caps"
	color = "#ff0000"
	ammo_type = /obj/item/ammo_casing/cap
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/flamer
	name = "flamer fuel tank"
	desc = "Put it in your flamer and roast those you don't like."
	icon_state = "flamer"
	caliber = "flamer"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/flamer
	max_ammo = 20
	multiple_sprites = FALSE

/obj/item/ammo_magazine/flamer/attack_self(mob/user) //Don't empty ur ammo
	return

/obj/item/ammo_magazine/bolt_pistol_magazine
	name = "Boltpistol Magazine"
	icon_state = "boltyp"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/boltpistol
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/bolt_pistol_magazine/empty
	initial_ammo = 0

/obj/item/ammo_magazine/bolt_rifle_magazine
	name = "Bolter Magazine"
	icon_state = "bolty"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/bolter
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/bolt_rifle_magazine/empty
	initial_ammo = 0

/obj/item/ammo_magazine/bolt_rifle_magazine/sister
	name = "Godwyn-De'az Pattern Bolter Rifle Magazine"
	ammo_type = /obj/item/ammo_casing/bolter

/* ork mags */

/obj/item/ammo_magazine/ork/slugga
	name = "slugga magazine"
	desc = "ALL DA LI'L PISTALS USE DIS ONE YA GIT!"
	icon_state = "slugga"
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/ork
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/ork/slugga/empty
	initial_ammo = 0

/obj/item/ammo_magazine/ork/shoota
	name = "shoota magazine"
	desc = "DIS ONE'S FOR DA BIG UN SHOOTAS WITH DA ROIFLE BOOLETS!"
	icon_state = "shoota"
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/ork/shoota
	max_ammo = 75
	multiple_sprites = 1

/obj/item/ammo_magazine/ork/shoota/empty
	initial_ammo = 0


//-----SPECIAL BOLTER MAGS-----
/obj/item/ammo_magazine/bolt_pistol_magazine/ms
	name = "Metal Storm Boltpistol Magazine"
	icon_state = "boltyp"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/boltpistol/ms
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/bolt_pistol_magazine/ms/empty
	initial_ammo = 0

/obj/item/ammo_magazine/bolt_rifle_magazine/ms
	name = "Metal Storm Bolter Magazine"
	icon_state = "bolty"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/bolter/ms
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/bolt_rifle_magazine/ms/empty
	initial_ammo = 0

/obj/item/ammo_magazine/bolt_pistol_magazine/kp
	name = "Kraken Penetrator Boltpistol Magazine"
	icon_state = "boltyp"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/boltpistol/kp
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/bolt_pistol_magazine/kp/empty
	initial_ammo = 0

/obj/item/ammo_magazine/bolt_rifle_magazine/kp
	name = "Kraken Penetrator Bolter Magazine"
	icon_state = "bolty"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".75"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/bolter/kp
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/bolt_rifle_magazine/kp/empty
	initial_ammo = 0


/obj/item/ammo_magazine/melta
	name = "Melta Canister"
	icon_state = "flamer"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "melta"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/melta
	max_ammo = 60
	multiple_sprites = 0

/obj/item/ammo_magazine/melta/empty
	initial_ammo = 0

/obj/item/ammo_magazine/catapult_magazine
	name = "Shuriken Catapult Magazine"
	icon_state = "ersatz"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shuriken
	matter = list(DEFAULT_WALL_MATERIAL = 1500)
	caliber = "shuriken"
	max_ammo = 1000
	multiple_sprites = 0

/obj/item/ammo_magazine/spistol_magazine
	name = "Shuriken Pistol Magazine"
	icon_state = "ersatz"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shuriken/pistol
	matter = list(DEFAULT_WALL_MATERIAL = 1500)
	caliber = "shuriken"
	max_ammo = 60
	multiple_sprites = 0

/obj/item/ammo_magazine/galvanic
	name = "galvanic rifle loader"
	desc = "An ancient design for loading galvanic rifles."
	icon_state = "T38"
	caliber = "galvanic"
	matter = list(DEFAULT_WALL_MATERIAL = 360)
	ammo_type = /obj/item/ammo_casing/galvanic
	mag_type = MAGAZINE
	max_ammo = 7
	multiple_sprites = 1


/obj/item/ammo_magazine/galvanic/fire
	name = "galvanic rifle incendiary loader"
	desc = "An ancient design for loading galvanic rifles. This one seems to have incendiary rounds loaded."
	ammo_type = /obj/item/ammo_casing/galvanic/fire

/obj/item/ammo_magazine/galvanic/emp
	name = "galvanic rifle EMP loader"
	desc = "An ancient design for loading galvanic rifles. This one seems to have emp rounds loaded."
	ammo_type = /obj/item/ammo_casing/galvanic/emp

/obj/item/ammo_magazine/galvanic/airburst
	name = "galvanic rifle airburst loader"
	desc = "An ancient design for loading galvanic rifles. This one seems to have airburst rounds loaded."
	ammo_type = /obj/item/ammo_casing/galvanic/airburst

/obj/item/ammo_magazine/galvanic/pain
	name = "galvanic rifle stun loader"
	desc = "An ancient design for loading galvanic rifles. This one seems to have stun rounds loaded."
	ammo_type = /obj/item/ammo_casing/galvanic/pain

/obj/item/ammo_magazine/radcarbine
	name = "Radcarbine Magazine"
	icon_state = "LMG-mag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "rad"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/radcarbine
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/radcarbine/radpistol
	name = "Radpistol Magazine"
	icon_state = "mg08"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "rad"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/radcarbine/radpistol
	max_ammo = 10
	multiple_sprites = 0
/*
/obj/item/ammo_magazine/exitus
	name = "Exitus Rifle Magazine"
	icon_state = "tinyersatz"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "exitus"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/exitus
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/exitus/toxin
	name = "Exitus Rifle Hellfire Toxin Magazine"
	icon_state = "tinyersatz"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "exitus"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/exitus/toxin
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/exitus/fire
	name = "Exitus Rifle Incendiary Magazine"
	icon_state = "tinyersatz"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "exitus"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/exitus/fire
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/exitus/explosive
	name = "Exitus Rifle Explosive Round Magazine"
	icon_state = "tinyersatz"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "exitus"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/exitus/explosive
	max_ammo = 5
	multiple_sprites = 1

*/
