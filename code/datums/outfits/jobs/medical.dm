/decl/hierarchy/outfit/job/medical
	hierarchy_type = /decl/hierarchy/outfit/job/medical
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/device/pda/medical
	//pda_slot = slot_l_store

/decl/hierarchy/outfit/job/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/cmo
	name = OUTFIT_JOB_NAME("Abbess")
	l_ear  = /obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/medical
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle/mlsister
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/firstaid/adv
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	glasses = /obj/item/clothing/glasses/hud/health
	belt = /obj/item/storage/belt/medical/apothecary
	r_pocket = /obj/item/device/flashlight/lantern
	id_type = null
	head = /obj/item/clothing/head/hospitallerhelm
	r_pocket = /obj/item/storage/box/coin
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
		/obj/item/stack/thrones/five = 1,
		/obj/item/stack/thrones2/five = 1,
		/obj/item/stack/thrones3/five = 1,)

/decl/hierarchy/outfit/job/medical/doctor
	name = OUTFIT_JOB_NAME("Sister Hospitallar")
	uniform = /obj/item/clothing/under/rank/medical
	l_ear  = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/storage/sistersuperiorsuit
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/health
	l_hand = /obj/item/storage/firstaid/adv
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	belt = /obj/item/storage/belt/medical/full
	r_pocket = /obj/item/device/flashlight/lantern
	id_type = /obj/item/card/id/medical
	head = /obj/item/clothing/head/hospitallerhelm
	r_pocket = /obj/item/storage/box/coin
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/ammo_magazine/bolt_pistol_magazine = 1,
		/obj/item/stack/thrones2/five = 1,
		/obj/item/stack/thrones3/five = 1,)
/* // sisterhood chemist
/decl/hierarchy/outfit/job/medical/chemist
	name = OUTFIT_JOB_NAME("Alchemist")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/alchemist
	id_type = /obj/item/card/id/medical/chemist
	pda_type = /obj/item/device/pda/chemist
	belt = /obj/item/storage/belt/medical/alchemist
	neck = /obj/item/reagent_containers/food/drinks/canteen
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/headset_sci
	r_ear = null
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones = 1,
		/obj/item/stack/thrones2 = 1,
		/obj/item/stack/thrones3/five = 1,)
*/
// biologis

/decl/hierarchy/outfit/job/medical/biologis
	name = OUTFIT_JOB_NAME("Biologis")
	uniform = /obj/item/clothing/under/rank/geneticist
	suit = /obj/item/clothing/suit/storage/hooded/genetor
	mask = /obj/item/clothing/mask/gas/techpriest
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/card/id/engineering/head
	pda_type = /obj/item/device/pda/geneticist
	belt = /obj/item/storage/belt/medical/apothecary
	neck = /obj/item/reagent_containers/food/drinks/canteen
	gloves = /obj/item/clothing/gloves/thick/techpriest
	glasses = /obj/item/clothing/glasses/science/magos
	shoes = /obj/item/clothing/shoes/jackboots/techpriest
	l_ear = /obj/item/device/radio/headset/headset_eng
	l_hand = /decl/hierarchy/supply_pack/security/forensics
	r_pocket = /obj/item/storage/box/coin
	r_ear = null
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/biologis
	backpack_contents = list(
		/obj/item/gun/energy/pulse/plasma/pistol/mechanicus = 1,
		/obj/item/stack/thrones = 1,
		/obj/item/stack/thrones2 = 1,
		/obj/item/stack/thrones3/five = 1,
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,)

/decl/hierarchy/outfit/job/medical/paramedic
	name = OUTFIT_JOB_NAME("combat medicae")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/medicae
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	glasses = /obj/item/clothing/glasses/hud/health
	belt = /obj/item/storage/belt/medical/full
	head = /obj/item/clothing/head/helmet/medicae
	r_pocket = /obj/item/storage/box/ifak
	l_pocket = /obj/item/cell/lasgun
	id_type = /obj/item/card/id/medical/paramedic
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	backpack_contents = list(
	/obj/item/cell/lasgun = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/clothing/mask/gas/half/cadianrespirator = 1,
	/obj/item/clothing/glasses/cadiangoggles = 1,
	)
	suit_store = /obj/item/gun/energy/las/lasgun
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
