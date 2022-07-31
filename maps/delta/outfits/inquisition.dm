/decl/hierarchy/outfit/job/acolyte
	name = OUTFIT_JOB_NAME("Interrogator")
	uniform = /obj/item/clothing/under/rank/principalagent
	suit = /obj/item/clothing/suit/armor/agent/caraspace
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/inqcs
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/inqhelm
	mask = /obj/item/clothing/mask/gas/security/agent
	glasses = null
	id = /obj/item/card/id/inquisition/principal_agent
	l_ear = /obj/item/device/radio/headset/inquisition
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/lockebolter
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/twenty = 1,
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/acolyte/malleus
	name = OUTFIT_JOB_NAME("Ordo Malleus Interrogator")
	suit = /obj/item/clothing/suit/armor/agent/coat

/decl/hierarchy/outfit/job/scion
	name = OUTFIT_JOB_NAME("Tempestus Scion")
	uniform = /obj/item/clothing/under/rank/principalagent
	suit = /obj/item/clothing/suit/armor/scion
	back = /obj/item/storage/backpack/satchel/warfare
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/scion
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/sniper
	id = /obj/item/card/id/inquisition/principal_agent
	l_ear = /obj/item/device/radio/headset/inquisition
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/hotshot
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	)

/decl/hierarchy/outfit/job/inquisitor
	name = OUTFIT_JOB_NAME("Inquisitor Of Ordo Hereticus")
	uniform = /obj/item/clothing/under/rank/principalagent
	suit = /obj/item/clothing/suit/armor/ordohereticus
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/inqcs
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	shoes = /obj/item/clothing/shoes/hereticusboots
	head = /obj/item/clothing/head/ordohereticus
	mask = null
	glasses = null
	id = /obj/item/card/id/inquisition/principal_agent
	l_ear = /obj/item/device/radio/headset/inquisition
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/twenty = 1
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/inquisitor/malleus
	name = OUTFIT_JOB_NAME("Inquisitor Of Ordo Malleus")
	suit = /obj/item/clothing/suit/storage/hooded/inquisitor
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = null
	suit_store = /obj/item/gun/projectile/lockebolter
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/twenty = 1
	)

//// TEMPLATE ///
//decl/hierarchy/outfit/job/guardsman
//  name = OUTFIT_JOB_NAME("Input Name")
//  uniform = null
//  suit = null
//  back = null
//  belt = null
//  gloves = null
//  shoes = null
//  head = null
//  mask = null
//	l_ear = null
//	r_ear = null
//  glasses = null
//	id = null
//  l_pocket = null
//	r_pocket = null
//  suit_store = null
//	r_hand = null
//	l_hand = null
//  neck = null
//  backpack_contents = list(
//  [ Item Path ] = 1,
//  )
