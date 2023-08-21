/decl/hierarchy/outfit/job/science
	hierarchy_type = /decl/hierarchy/outfit/job/science
	l_ear = /obj/item/device/radio/headset/headset_sci
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/device/pda/science

/decl/hierarchy/outfit/job/science/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/science/rd
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/device/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/research_director
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/card/id/science/head
	pda_type = /obj/item/device/pda/heads/rd

/decl/hierarchy/outfit/job/science/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist
	id_type = /obj/item/card/id/science
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
/*
/decl/hierarchy/outfit/job/science/xenobiologist
	name = OUTFIT_JOB_NAME("Xenobiologist")
	uniform = /obj/item/clothing/under/rank/scientist
	id_type = /obj/item/card/id/science/xenobiologist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
*/
/decl/hierarchy/outfit/job/science/roboticist
	name = OUTFIT_JOB_NAME("Roboticist")
	uniform = /obj/item/clothing/under/rank/roboticist
	shoes = /obj/item/clothing/shoes/black
	belt = /obj/item/storage/belt/utility/full
	id_type = /obj/item/card/id/science/roboticist
	pda_slot = slot_r_store
	pda_type = /obj/item/device/pda/roboticist

/decl/hierarchy/outfit/job/science/roboticist/New()
	..()
	backpack_overrides.Cut()

/decl/hierarchy/outfit/job/science/explorator
	name = OUTFIT_JOB_NAME("Explorator")
	head = /obj/item/clothing/head/hardhat/techpriest/magos
	mask = /obj/item/clothing/mask/gas/techpriest/magos
	glasses = /obj/item/clothing/glasses/science/magos
	belt = /obj/item/storage/belt/utility/full
	suit = /obj/item/clothing/suit/storage/hazardvest/magos
	shoes = /obj/item/clothing/shoes/jackboots/technoboots
	uniform = /obj/item/clothing/under/rank/chief_engineer
	l_ear = /obj/item/device/radio/headset/heads/ce
	l_hand = /obj/item/gun/energy/phosphor
	gloves = /obj/item/clothing/gloves/thick/techpriest
	id_type = /obj/item/card/id/engineering/head
	pda_type = null
	pda_slot = null
	back = /obj/item/storage/backpack/satchel/warfare/techpriest/magos
	backpack_contents = list(/obj/item/stack/thrones/five = 1,
		/obj/item/stack/thrones2/five = 3,
		/obj/item/book/manual/ripley_build_and_repair = 1,
		/obj/item/book/manual/engineering_construction = 1,
		/obj/item/stack/thrones3/five = 1,)