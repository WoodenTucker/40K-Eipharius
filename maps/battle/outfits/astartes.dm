/*All of this will need to be redone/re-pointed to once we have actual sprites to use - wel
Begin Warhammer loadouts
*/

/decl/hierarchy/outfit/job/astarte
	name = OUTFIT_JOB_NAME("Ultramarine Tactical Marine")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ultramarine
	back = /obj/item/storage/backpack/satchel/astartes/ultramarine
	belt = null
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/ultramarine
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/projectile/smurfbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/astarte/ravenguard
	name = OUTFIT_JOB_NAME("Ravenguard Tactical Marine")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/ravenguard
	belt = null
	shoes = /obj/item/clothing/shoes/astarte/boots/raven
	head = /obj/item/clothing/head/helmet/astartes/ravenguard
	mask = null
	suit_store = /obj/item/gun/projectile/ravenbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen

/decl/hierarchy/outfit/job/astarte/salamander
	name = OUTFIT_JOB_NAME("Salamander Tactical Marine")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/salamander
	back = /obj/item/storage/backpack/satchel/astartes/salamander
	belt = null
	shoes = /obj/item/clothing/shoes/astarte/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/salamander
	suit_store = /obj/item/gun/projectile/sallybolter

/decl/hierarchy/outfit/job/astarte/ultramarine/captain
	name = OUTFIT_JOB_NAME("Ultramarine Company Captain")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/ultramarine/captain
	back = /obj/item/storage/backpack/satchel/astartes/ultramarine
	belt = /obj/item/melee/pcsword
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/captain/ultramarine
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/projectile/smurfbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astarte/ravenguard/captain
	name = OUTFIT_JOB_NAME("Ravenguard Company Captain")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/captain/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/ravenguard
	belt = /obj/item/melee/pcsword
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/raven
	head = /obj/item/clothing/head/helmet/astartes/captain/ravenguard
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/projectile/ravenbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astarte/salamander/captain
	name = OUTFIT_JOB_NAME("Salamander Company Captain")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/captain/salamander
	back = /obj/item/storage/backpack/satchel/astartes/salamander
	belt = /obj/item/melee/pcsword
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/captain/salamander
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/grenade/frag/shell
	suit_store = /obj/item/gun/projectile/sallybolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
	)

/decl/hierarchy/outfit/job/astarte/ultramarine/apothecracy
	name = OUTFIT_JOB_NAME("Ultramarine Apothecracy")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/ultramarine
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor/apoc
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/accessory/storage/black_vest = 1
	)

/decl/hierarchy/outfit/job/astarte/ravenguard/apothecracy
	name = OUTFIT_JOB_NAME("Ravenguard Apothecracy")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/ravenguard
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/raven
	head = /obj/item/clothing/head/helmet/astartes/apothecary/ravenguard
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor/apoc
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/accessory/storage/black_vest = 1
	)

/decl/hierarchy/outfit/job/astarte/salamander/apothecracy
	name = OUTFIT_JOB_NAME("Salamander Apothecracy")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/apothecary/salamander
	back = /obj/item/storage/backpack/satchel/astartes/apothecary
	belt = /obj/item/storage/belt/medical/full
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/apothecary
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor/apoc
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/ammo_magazine/bolt_pistol_magazine
	suit_store = /obj/item/gun/projectile/bolter_pistol/astarte
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/melee/pcsword = 1,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/accessory/storage/black_vest = 1
	)

/decl/hierarchy/outfit/job/astarte/ultramarine/tech
	name = OUTFIT_JOB_NAME("Ultramarine Tech-Marine")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/ultramarine
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/smurfs
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/smurfbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/accessory/storage/black_vest = 1
	)

/decl/hierarchy/outfit/job/astarte/ravenguard/tech
	name = OUTFIT_JOB_NAME("Ravenguard Tech-Marine")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/ravenguard
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/suit/armor/astartes/ravenguard
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/ravenbolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/accessory/storage/black_vest = 1
	)

/decl/hierarchy/outfit/job/astarte/salamander/tech
	name = OUTFIT_JOB_NAME("Salamander Tech-Marine")
	uniform = /obj/item/clothing/under/astarte/bodysuit
	suit = /obj/item/clothing/suit/armor/astartes/techmarine/salamander
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/techpack
	belt = /obj/item/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/astarte/boots/sallys
	head = /obj/item/clothing/head/helmet/astartes/techmarine
	mask = null
	glasses = /obj/item/clothing/glasses/astarte/visor
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/sallybolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/sandwich = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,
	/obj/item/clothing/accessory/storage/black_vest = 1
	)
