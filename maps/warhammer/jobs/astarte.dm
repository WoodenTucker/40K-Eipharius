/datum/job/envoy
	title = "Astartes Envoy"
	total_positions = 1
	supervisors = "The Rogue Trader and your Chapter Master"
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/guardsman //will need to be replaced eventually - wel
	selection_color = "#270092"
	department_flag = SEC|COM
	auto_rifle_skill = 10 //astartes are masters of all weaponry
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10



/decl/hierarchy/outfit/job/guardsman //suits don't work yuet, not showing properly
	name = OUTFIT_JOB_NAME("Astartes Envoy")
	head = /obj/item/clothing/head/helmet/ravenhelm
	glasses = /obj/item/clothing/glasses/night
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/device/radio/headset/heads/hos
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	suit = /obj/item/clothing/suit/armor/ravenguard
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	l_hand = /obj/item/gun/energy/las/lasgun
	backpack_contents = list(/obj/item/cell/lasgun = 2)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR