/*All of this will need to be redone/re-pointed to once we have actual sprites to use - wel
Begin Warhammer loadouts
*/
/* template for new chapters - leadontaste
/decl/hierarchy/outfit/job/astartes
	name = OUTFIT_JOB_NAME("Astartes Envoy")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = /obj/item/storage/box/ifak
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	shoes = null
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
*/

/decl/hierarchy/outfit/job/astartes
	name = OUTFIT_JOB_NAME("Blood Angel Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/bloodangel
	back = /obj/item/storage/backpack/satchel/astartes/bloodangel
	belt = null
	shoes = /obj/item/clothing/shoes/astartes/boots/bloodangel
	head = /obj/item/clothing/head/helmet/astartes/bloodangel
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_ear = /obj/item/device/radio/headset/red_team
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bangbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/astartes/bangapoth
	name = OUTFIT_JOB_NAME("Blood Angel Sanguinary Priest")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/bloodangel
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	shoes = /obj/item/clothing/shoes/astartes/boots/bloodangel
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor/apoth
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/bangtech
	name = OUTFIT_JOB_NAME("Blood Angel Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/bloodangel
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/astartes/boots/bloodangel
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bangbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/ravenguard
	name = OUTFIT_JOB_NAME("Ravenguard Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/ravenguard
	belt = null
	shoes = /obj/item/clothing/shoes/astartes/boots/raven
	head = /obj/item/clothing/head/helmet/astartes/ravenguard
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	suit_store = /obj/item/gun/projectile/ravenbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen

/decl/hierarchy/outfit/job/astartes/ravenguard/captain
	name = OUTFIT_JOB_NAME("Ravenguard Company Captain")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/captain/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/ravenguard
	belt = /obj/item/melee/pcsword
	shoes = /obj/item/clothing/shoes/astartes/boots/raven
	head = /obj/item/clothing/head/helmet/astartes/captain/ravenguard
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/ravenbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/ravapoth
	name = OUTFIT_JOB_NAME("Ravenguard Apothecary")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	shoes = /obj/item/clothing/shoes/astartes/boots/raven
	head = /obj/item/clothing/head/helmet/astartes/apothecary/ravenguard
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor/apoth
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/raventech
	name = OUTFIT_JOB_NAME("Ravenguard Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/ravenguard
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/suit/armor/astartes/ravenguard
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/ravenbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/salamander
	name = OUTFIT_JOB_NAME("Salamander Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/salamander
	back = /obj/item/storage/backpack/satchel/astartes/salamander
	belt = null
	shoes = /obj/item/clothing/shoes/astartes/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/salamander
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	suit_store = /obj/item/gun/projectile/sallybolter

/decl/hierarchy/outfit/job/astartes/salamander/captain
	name = OUTFIT_JOB_NAME("Salamander Company Captain")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/captain/salamander
	back = /obj/item/storage/backpack/satchel/astartes/salamander
	belt = /obj/item/melee/pcsword
	shoes = /obj/item/clothing/shoes/astartes/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/captain/salamander
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/sallybolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/salapoth
	name = OUTFIT_JOB_NAME("Salamander Apothecary")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/salamander
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	shoes = /obj/item/clothing/shoes/astartes/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor/apoth
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	)

/decl/hierarchy/outfit/job/astartes/saltech
	name = OUTFIT_JOB_NAME("Salamander Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/salamander
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/astartes/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/sallybolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	)

/decl/hierarchy/outfit/job/astartes/ultramarine
	name = OUTFIT_JOB_NAME("Ultramarine Tactical Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ultramarine
	back = /obj/item/storage/backpack/satchel/astartes/ultramarine
	belt = null
	shoes = /obj/item/clothing/shoes/astartes/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/ultramarine
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/smurfbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/astartes/ultramarine/captain
	name = OUTFIT_JOB_NAME("Ultramarine Company Captain")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ultramarine/captain
	back = /obj/item/storage/backpack/satchel/astartes/ultramarine
	belt = /obj/item/melee/pcsword
	shoes = /obj/item/clothing/shoes/astartes/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/captain/ultramarine
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/smurfbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/ultrapoth
	name = OUTFIT_JOB_NAME("Ultramarine Apothecary")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/ultramarine
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	shoes = /obj/item/clothing/shoes/astartes/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor/apoth
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astartes/ultratech
	name = OUTFIT_JOB_NAME("Ultramarine Tech-Marine")
	uniform = /obj/item/clothing/under/astartes/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/ultramarine
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/astartes/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astartes/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/smurfbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)