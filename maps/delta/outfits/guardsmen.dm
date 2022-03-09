/*All of this will need to be redone/re-pointed to once we have actual sprites to use - wel
Begin Warhammer loadouts
*/

/decl/hierarchy/outfit/job/guardsman
	name = OUTFIT_JOB_NAME("Cadian Guardsman")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/guardsman
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/energy/las/lasgun
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/guardsman/krieg
	name = OUTFIT_JOB_NAME("Krieg Guardsman")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/krieger
	back = /obj/item/storage/backpack/satchel/krieger
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	glasses = null
	suit_store = list(/obj/item/gun/energy/las/lasgun/luscius,
	/obj/item/cell/lasgun = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel = 1
	)

/decl/hierarchy/outfit/job/guardsman/catachan
	name = OUTFIT_JOB_NAME("Catachan Fighter")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/CatachanVest
	head = /obj/item/clothing/head/catachan
	mask = null
	glasses = null
	suit_store = /obj/item/gun/energy/las/lasgun/tinkered/lascarbine

/decl/hierarchy/outfit/job/guardsman/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Guardsman")
	uniform = /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallanarmor
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null

/// Sergeant

/decl/hierarchy/outfit/job/sergeant
	name = OUTFIT_JOB_NAME("Cadian Sergeant")
	uniform = /obj/item/clothing/under/cadian_uniform
	suit = /obj/item/clothing/suit/armor/cadiansgt
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/mercycs
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = null
	suit_store = /obj/item/gun/projectile/automatic/stubber
	neck = /obj/item/reagent_containers/food/drinks/canteen
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08 = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1
	)

	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/sergeant/krieg
	name = OUTFIT_JOB_NAME("Krieg Watchmaster")
	uniform = /obj/item/clothing/under/rank/krieg_uniform
	suit = /obj/item/clothing/suit/armor/kriegsgt
	back = /obj/item/storage/backpack/satchel/krieger
	gloves = /obj/item/clothing/gloves/combat/krieg
	shoes = /obj/item/clothing/shoes/jackboots/krieg
	head = /obj/item/clothing/head/helmet/krieghelmet
	mask = /obj/item/clothing/mask/gas/krieg
	backpack_contents = list(
	/obj/item/ammo_magazine/box/a556/mg08 = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	/obj/item/shovel = 1
	)

/decl/hierarchy/outfit/job/sergeant/catachan
	name = OUTFIT_JOB_NAME("Catachan Sergeant")
	uniform = /obj/item/clothing/under/casual_pants/catachan
	suit = /obj/item/clothing/suit/armor/catachansgt
	head = /obj/item/clothing/head/catachan
	mask = null
	glasses = null

/decl/hierarchy/outfit/job/sergeant/valhallan
	name = OUTFIT_JOB_NAME("Valhallan Sergeant")
	uniform =  /obj/item/clothing/under/rank/valhallan_uniform
	suit = /obj/item/clothing/suit/armor/valhallasgt
	head = /obj/item/clothing/head/valushanka
	mask = null
	glasses = null

/// Enforcer

/decl/hierarchy/outfit/job/ig/enforcer
	name = OUTFIT_JOB_NAME("Magistratum Enforcer")
	uniform = /obj/item/clothing/under/color/brown
	suit = /obj/item/clothing/suit/armor/enforcer
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/melee/baton/loaded
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	l_ear = /obj/item/device/radio/headset/red_team/delta
	backpack_contents = list(
	/obj/item/ammo_box/shotgun = 2,
	/obj/item/handcuffs = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/// Commissar

/decl/hierarchy/outfit/job/ig/commissar
	name = OUTFIT_JOB_NAME("Commissar")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/commissar
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/material/sword/commissword
	gloves = /obj/item/clothing/gloves/combat/cadian
	shoes = /obj/item/clothing/shoes/commissar
	head = /obj/item/clothing/head/commissar
	mask = null
	glasses = null
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/device/binoculars
	suit_store = /obj/item/gun/projectile/bolter_pistol
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 2,
	/obj/item/grenade/smokebomb = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	pda_slot = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/commissar/krieg
	name = OUTFIT_JOB_NAME("Commissar")
	uniform =  /obj/item/clothing/under/rank/krieg_uniform/commissar
	suit = /obj/item/clothing/suit/armor/commissar/krieg
	head = /obj/item/clothing/head/commissar/krieg
	mask = /obj/item/clothing/mask/gas/commissar
	glasses = null

/decl/hierarchy/outfit/job/ig/commissar/catachan
	name = OUTFIT_JOB_NAME("Commissar")
	uniform =  /obj/item/clothing/under/rank/catachancommissar
	suit = /obj/item/clothing/suit/armor/commissar/catachan
	belt = /obj/item/melee/pcsword
	shoes = /obj/item/clothing/shoes/jackboots/cadian
	head = /obj/item/clothing/head/commissar/catachan
	mask = null
	glasses = null
