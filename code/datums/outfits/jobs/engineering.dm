/decl/hierarchy/outfit/job/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	shoes = /obj/item/clothing/shoes/technoboots
	//pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/engineering/chief_engineer
	name = OUTFIT_JOB_NAME("Magos")
	head = /obj/item/clothing/head/hardhat/techpriest/magos
	mask = /obj/item/clothing/mask/gas/techpriest/magos
	belt = /obj/item/storage/belt/utility/full
	suit = /obj/item/clothing/suit/storage/hazardvest/magos
	uniform = /obj/item/clothing/under/rank/chief_engineer
	l_ear = /obj/item/device/radio/headset/red_team
	gloves = /obj/item/clothing/gloves/thick/techpriest
	id_type = /obj/item/card/id/engineering/head
	pda_type = null
	pda_slot = null
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/magos
	backpack_contents = list(/obj/item/stack/thrones/five = 1,
		/obj/item/stack/thrones2/five = 1,
		/obj/item/stack/thrones3/five = 1,)

/decl/hierarchy/outfit/job/engineering/engineer
	name = OUTFIT_JOB_NAME("Tech Priest")
	head = /obj/item/clothing/head/hardhat/techpriest
	mask = /obj/item/clothing/mask/gas/techpriest
	l_ear = /obj/item/device/radio/headset/red_team
	neck = /obj/item/reagent_containers/food/drinks/canteen
	uniform = /obj/item/clothing/under/rank/engineer
	suit = /obj/item/clothing/suit/storage/hazardvest/magos/techpriest
	gloves = /obj/item/clothing/gloves/thick/techpriest
	belt = /obj/item/storage/belt/utility/full
	id_type = /obj/item/card/id/engineering
	pda_type = null
	pda_slot = null
	back = /obj/item/storage/backpack/satchel/warfare/techpriest
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones = 1,
		/obj/item/stack/thrones2 = 1,
		/obj/item/stack/thrones3/five = 1,
)

/decl/hierarchy/outfit/job/engineering/engineer/void
	name = OUTFIT_JOB_NAME("Engineer - Voidsuit")
	head = /obj/item/clothing/head/helmet/space/void/engineering
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/engineering
/*
/decl/hierarchy/outfit/job/engineering/atmos
	name = OUTFIT_JOB_NAME("Atmospheric technician")
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
	belt = /obj/item/storage/belt/utility/atmostech
	id_type = /obj/item/card/id/engineering/atmos
	pda_type = /obj/item/device/pda/atmos
*/