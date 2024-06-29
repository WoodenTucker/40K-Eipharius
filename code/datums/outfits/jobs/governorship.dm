/decl/hierarchy/outfit/job/governor
	name = OUTFIT_JOB_NAME("Planetary Governor")
	head = /obj/item/clothing/head/rt
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/governor
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/roguetrader
	belt = /obj/item/gun/energy/las/laspistol/lord
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/heads/gov
	shoes = /obj/item/clothing/shoes/jackboots/noble
	r_pocket = /obj/item/storage/box/coin
	id_type = /obj/item/card/id/gold
	pda_type = null
	pda_slot = null
	backpack_contents = list(
	/obj/item/storage/box/ids = 1,
	/obj/item/stack/thrones2/twenty = 1,
	/obj/item/stack/thrones3/twenty = 1,
	/obj/item/paper/administratum/vermillion = 1,
	/obj/item/paper/administratum/weapon5 = 1,
	/obj/item/pen = 1,
	/obj/item/reagent_containers/food/snacks/bigbiteburger
)

/decl/hierarchy/outfit/job/governor/post_equip(var/mob/living/carbon/human/H)
	..()
	if(H.age>49)
		// Since we can have something other than the default uniform at this
		// point, check if we can actually attach the medal
		var/obj/item/clothing/uniform = H.w_uniform
		if(uniform)
			var/obj/item/clothing/accessory/medal/gold/medal = new()
			if(uniform.can_attach_accessory(medal))
				uniform.attach_accessory(null, medal)
			else
				qdel(medal)

/decl/hierarchy/outfit/job/heir
	name = OUTFIT_JOB_NAME("Heir")
	uniform = /obj/item/clothing/under/rank/consort/adept
	head = /obj/item/clothing/head/commissar/adept
	suit = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/heads/hop
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/toy/katana/strong
	shoes = /obj/item/clothing/shoes/jackboots/noble
	r_pocket = /obj/item/storage/box/coin
	id_type = /obj/item/card/id/gold
	pda_type = null
	pda_slot = null
	backpack_contents = list(
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/paper/administratum/omega = 1,
	/obj/item/paper/administratum/weapon4 = 1,
	/obj/item/pen = 1,
	/obj/item/stack/thrones3/twenty = 1,
	 )

//Royal Guard
/decl/hierarchy/outfit/job/royalguard
	name = OUTFIT_JOB_NAME("Royal Guard")
	uniform = /obj/item/clothing/under/cadian_uniform
	back = /obj/item/storage/backpack/satchel/heavy
	belt = /obj/item/device/flashlight/lantern
	gloves = /obj/item/clothing/gloves/royalguard
	glasses = /obj/item/clothing/glasses/cadiangoggles/elite
	shoes = /obj/item/clothing/shoes/jackboots/noble
	suit = /obj/item/clothing/suit/armor/royalguard
	head = /obj/item/clothing/head/helmet/royalguard
	mask = /obj/item/clothing/mask/gas/half/cadianrespirator
	glasses = null
	id = /obj/item/card/id/dog_tag/guardsman
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = /obj/item/device/radio/headset/heads/hop
	l_pocket = /obj/item/storage/box/ifak
	r_pocket = /obj/item/clothing/gloves/combat/cadian
	r_hand = /obj/item/storage/box/coin
	suit_store = /obj/item/gun/projectile/thrower
	backpack_contents = list(
	/obj/item/stack/thrones2 = 3,
	/obj/item/storage/box/sniperammo/apds/bos = 2,
	/obj/item/clothing/accessory/holster/waist = 1,
	/obj/item/gun/projectile/talon/renegade = 1,
	/obj/item/ammo_magazine/mc45mm/ap = 1,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/paper/administratum/omega = 1,
	/obj/item/paper/administratum/weapon4 = 1,
	/obj/item/pen = 1,
	/obj/item/device/whistle = 1
	)


/*
/decl/hierarchy/outfit/job/hop
	name = OUTFIT_JOB_NAME("Seneschal")
	uniform = /obj/item/clothing/under/rank/seneschal
	suit = /obj/item/clothing/suit/storage/senkhalat
	head = /obj/item/clothing/head/senturban
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/heads/hop
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/gun/projectile/talon
	shoes = /obj/item/clothing/shoes/jackboots/noble
	id_type = /obj/item/card/id/gold
	pda_type = null
	pda_slot = null
	backpack_contents = list(

	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones/five = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/twenty = 1,
	 )*/
