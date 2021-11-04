//Kroot
/decl/hierarchy/outfit/job/kroot
	uniform = /obj/item/clothing/under/rank/kroot
	shoes = /obj/item/clothing/shoes/krootfeet
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare/kroot
	l_ear = /obj/item/device/radio/headset/blue_team/all
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/ammo_magazine/kroot = 2,)


//Tau
/decl/hierarchy/outfit/job/tau
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/jackboots
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/blue_team/all
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null

//Genestealer
/decl/hierarchy/outfit/job/genestealer //really just for walking sounds
	uniform = null
	shoes = /obj/item/clothing/shoes/genestealerfeet
	neck = null
	back = null
	l_ear = /obj/item/device/radio/headset/hivemind
	belt = null
	l_pocket = null
	id = null
	id_slot = null
	pda_slot = null

//Ork
/decl/hierarchy/outfit/job/ork
	shoes = /obj/item/clothing/shoes/orkboots
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare/kroot
	l_ear = /obj/item/device/radio/headset/blue_team/all
	belt = /obj/item/device/flashlight/lantern
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/ammo_magazine/ork/shoota = 2, /obj/item/melee/classic_baton/trench_club = 1,)

/decl/hierarchy/outfit/job/ork/equip()
	if(prob(50))
		uniform = /obj/item/clothing/under/rank/ork
		suit = /obj/item/clothing/suit/armor/orkarmor
		l_pocket = /obj/item/storage/box/ifak
		head = /obj/item/clothing/head/helmet/orkhelmet
	else if(25)
		uniform = /obj/item/clothing/under/rank/ork/three
		suit = /obj/item/clothing/suit/armor/orkarmor/two
		head = /obj/item/clothing/head/helmet/orkhelmet/three
		l_pocket = /obj/item/storage/box/ifak
	else if(25)
		uniform = /obj/item/clothing/under/rank/ork/two
		suit = /obj/item/clothing/suit/armor/orkarmor/two
		head = /obj/item/clothing/head/helmet/orkhelmet/two
		l_pocket = /obj/item/storage/box/ifak
	..()


