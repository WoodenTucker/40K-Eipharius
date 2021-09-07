/decl/hierarchy/outfit/job/medical
	hierarchy_type = /decl/hierarchy/outfit/job/medical
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/device/pda/medical
	//pda_slot = slot_l_store

/decl/hierarchy/outfit/job/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/cmo
	name = OUTFIT_JOB_NAME("Sister Superior")
	l_ear  = /obj/item/device/radio/headset/red_team/medicae
	uniform = /obj/item/clothing/under/rank/medical
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/storage/sistersuperiorsuit
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/white
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/full
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/card/id/medical/head
	head = /obj/item/clothing/head/hospitallerhelm
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones/five = 1,
		/obj/item/stack/thrones2/five = 1,
		/obj/item/stack/thrones3/five = 1,)

/decl/hierarchy/outfit/job/medical/doctor
	name = OUTFIT_JOB_NAME("Sister Hospitellar")
	uniform = /obj/item/clothing/under/rank/medical
	l_ear  = /obj/item/device/radio/headset/red_team
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/storage/sistersuit
	back = /obj/item/storage/backpack/satchel/warfare
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/full
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/card/id/medical
	head = /obj/item/clothing/head/hospitallerhelm
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones = 1,
		/obj/item/stack/thrones2 = 1,
		/obj/item/stack/thrones3/five = 1,)

/decl/hierarchy/outfit/job/medical/chemist
	name = OUTFIT_JOB_NAME("Alchemist")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/alchemist
	id_type = /obj/item/card/id/medical/chemist
	pda_type = /obj/item/device/pda/chemist
	belt = /obj/item/storage/belt/medical/alchemist
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones = 1,
		/obj/item/stack/thrones2 = 1,
		/obj/item/stack/thrones3/five = 1,)

/decl/hierarchy/outfit/job/medical/geneticist
	name = OUTFIT_JOB_NAME("Genetor")
	uniform = /obj/item/clothing/under/rank/geneticist
	suit = /obj/item/clothing/suit/storage/hooded/genetor
	r_pocket = /obj/item/device/flashlight/pen
	id_type = /obj/item/card/id/medical/geneticist
	pda_type = /obj/item/device/pda/geneticist
	belt = /obj/item/storage/belt/medical/alchemist
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/biologis
	backpack_contents = list(
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
	belt = /obj/item/storage/belt/medical/full
	head = /obj/item/clothing/head/helmet/medicae
	r_pocket = /obj/item/storage/box/ifak
	l_pocket = /obj/item/cell/lasgun
	id_type = /obj/item/card/id/medical/paramedic
	l_ear = null
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
