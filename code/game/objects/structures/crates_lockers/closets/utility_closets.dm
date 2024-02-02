/* Utility Closets
 * Contains:
 *		Emergency Closet
 *		Fire Closet
 *		Tool Closet
 *		Radiation Closet
 *		Bombsuit Closet
 *		Hydrant
 *		First Aid
 *		Excavation Closet
 */

/*
 * Emergency Closet
 */
/obj/structure/closet/hive
	name = "fancy cabinet"
	desc = "To store rich and fancy things on it."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "fancyc_closed"
	icon_opened = "fancyc_open"
	icon_closed = "fancyc_closed"

/obj/structure/closet/hive/fancy
	name = "fancy wardrobe"
	desc = "Store your exotic and unique clothes here."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "fancycloset_closed"
	icon_opened = "fancycloset_open"
	icon_closed = "fancycloset_closed"

/obj/structure/closet/hive/luxury
	name = "luxurious cabinet"
	desc = "To keep things such as gold bars, exotic drugs and weapons, now in style."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "luxuryc_closed"
	icon_opened = "luxuryc_open"
	icon_closed = "luxuryc_closed"

/obj/structure/closet/hive/wood
	name = "wooden closet"
	desc = "Although a bit old, it can still store things with no problem."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "woode_closed"
	icon_opened = "woode_open"
	icon_closed = "woode_closed"

/obj/structure/closet/hive/narnia
	name = "polished wood closet"
	desc = "Store your fuzzy clothes here, or hope you end in a fantasy world when you enter on it, which wont happen."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "narnia_closed"
	icon_opened = "narnia_open"
	icon_closed = "narnia_closed"

/obj/structure/closet/hive/iron_c
	name = "iron cabinet"
	desc = "A somewhat rusty iron cabinet."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "iron_cabinet_closed"
	icon_opened = "iron_cabinet_open"
	icon_closed = "iron_cabinet_closed"

/obj/structure/closet/hive/darkwood
	name = "darkwood cabinet"
	desc = "A darkwood cabinet."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "dark_cabinet_closed"
	icon_opened = "dark_cabinet_open"
	icon_closed = "dark_cabinet_closed"

/obj/structure/closet/hive/metal
	name = "metal locker"
	desc = "A metal locker, seems to be a bit old."
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "metal_locker_closed"
	icon_opened = "metal_locker_open"
	icon_closed = "metal_locker_closed"

/obj/structure/closet/emcloset
	name = "emergency closet"
	desc = "It's a storage unit for emergency breathmasks and o2 tanks."
	icon_state = "emergency"
	icon_closed = "emergency"
	icon_opened = "emergencyopen"

/obj/structure/closet/emcloset/New()
	..()

	switch (pickweight(list("small" = 50, "aid" = 25, "tank" = 10, "large" = 5, "both" = 10)))
		if ("small")
			new /obj/item/tank/emergency/oxygen(src)
			new /obj/item/tank/emergency/oxygen(src)
			new /obj/item/clothing/mask/breath(src)
			new /obj/item/clothing/mask/breath(src)
			new /obj/item/clothing/suit/space/emergency(src)
			new /obj/item/clothing/head/helmet/space/emergency(src)
		if ("aid")
			new /obj/item/tank/emergency/oxygen(src)
			new /obj/item/storage/toolbox/emergency(src)
			new /obj/item/clothing/mask/breath(src)
			new /obj/item/storage/firstaid/o2(src)
			new /obj/item/clothing/suit/space/emergency(src)
			new /obj/item/clothing/head/helmet/space/emergency(src)
		if ("tank")
			new /obj/item/tank/emergency/oxygen/engi(src)
			new /obj/item/tank/emergency/oxygen/engi(src)
			new /obj/item/clothing/mask/gas/half(src)
			new /obj/item/clothing/mask/gas/half(src)
		if ("large")
			new /obj/item/tank/emergency/oxygen/double(src)
			new /obj/item/tank/emergency/oxygen/double(src)
			new /obj/item/clothing/mask/gas(src)
			new /obj/item/clothing/mask/gas(src)
		if ("both")
			new /obj/item/storage/toolbox/emergency(src)
			new /obj/item/tank/emergency/oxygen/engi(src)
			new /obj/item/tank/emergency/oxygen/engi(src)
			new /obj/item/clothing/mask/gas/half(src)
			new /obj/item/clothing/mask/gas/half(src)
			new /obj/item/storage/firstaid/o2(src)
			new /obj/item/clothing/suit/space/emergency(src)
			new /obj/item/clothing/suit/space/emergency(src)
			new /obj/item/clothing/head/helmet/space/emergency(src)
			new /obj/item/clothing/head/helmet/space/emergency(src)

/obj/structure/closet/emcloset/legacy/New()
	..()
	new /obj/item/tank/oxygen(src)
	new /obj/item/clothing/mask/gas(src)

/*
 * Fire Closet
 */
/obj/structure/closet/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon_state = "firecloset"
	icon_closed = "firecloset"
	icon_opened = "fireclosetopen"

/obj/structure/closet/firecloset/New()
	..()

	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/tank/oxygen/red(src)
	new /obj/item/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/obj/structure/closet/firecloset/full/New()
	..()

	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/tank/oxygen/red(src)
	new /obj/item/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/obj/structure/closet/firecloset/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened


/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	icon_state = "toolcloset"
	icon_closed = "toolcloset"
	icon_opened = "toolclosetopen"

/obj/structure/closet/toolcloset/New()
	..()
	if(prob(40))
		new /obj/item/clothing/suit/storage/hazardvest(src)
	if(prob(70))
		new /obj/item/device/flashlight(src)
	if(prob(70))
		new /obj/item/screwdriver(src)
	if(prob(70))
		new /obj/item/wrench(src)
	if(prob(70))
		new /obj/item/weldingtool(src)
	if(prob(70))
		new /obj/item/crowbar(src)
	if(prob(70))
		new /obj/item/wirecutters(src)
	if(prob(70))
		new /obj/item/device/t_scanner(src)
	if(prob(20))
		new /obj/item/storage/belt/utility(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(20))
		new /obj/item/device/multitool(src)
	if(prob(5))
		new /obj/item/clothing/gloves/insulated(src)
	if(prob(40))
		new /obj/item/clothing/head/hardhat(src)


/*
 * Radiation Closet
 */
/obj/structure/closet/radiation
	name = "radiation suit closet"
	desc = "It's a storage unit for rad-protective suits."
	icon_state = "radsuitcloset"
	icon_opened = "toolclosetopen"
	icon_closed = "radsuitcloset"

/obj/structure/closet/radiation/New()
	..()
	new /obj/item/clothing/suit/radiation(src)
	new /obj/item/clothing/head/radiation(src)
	new /obj/item/clothing/suit/radiation(src)
	new /obj/item/clothing/head/radiation(src)
	new /obj/item/device/geiger(src)
	new /obj/item/device/geiger(src)

/*
 * Bombsuit closet
 */
/obj/structure/closet/bombcloset
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	icon_state = "bombsuit"
	icon_closed = "bombsuit"
	icon_opened = "bombsuitopen"

/obj/structure/closet/bombcloset/New()
	..()
	new /obj/item/clothing/suit/bomb_suit( src )
	new /obj/item/clothing/under/color/black( src )
	new /obj/item/clothing/shoes/black( src )
	new /obj/item/clothing/head/bomb_hood( src )


/obj/structure/closet/bombclosetsecurity
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	icon_state = "bombsuitsec"
	icon_closed = "bombsuitsec"
	icon_opened = "bombsuitsecopen"

/obj/structure/closet/bombclosetsecurity/New()
	..()
	new /obj/item/clothing/suit/bomb_suit/security( src )
	new /obj/item/clothing/under/rank/security( src )
	new /obj/item/clothing/shoes/brown( src )
	new /obj/item/clothing/head/bomb_hood/security( src )

/*
 * Hydrant
 */
/obj/structure/closet/hydrant //wall mounted fire closet
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon_state = "hydrant"
	icon_closed = "hydrant"
	icon_opened = "hydrant_open"
	anchored = 1
	density = 0
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS
	setup = 0

/obj/structure/closet/hydrant/New()
	..()
	new /obj/item/inflatable/door(src)
	new /obj/item/inflatable/door(src)
	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/mask/gas/half(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/tank/oxygen/red(src)
	new /obj/item/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/*
 * First Aid
 */
/obj/structure/closet/medical_wall //wall mounted medical closet
	name = "first-aid closet"
	desc = "It's a wall-mounted storage unit for first aid supplies."
	icon_state = "medical_wall_first_aid"
	icon_closed = "medical_wall_first_aid"
	icon_opened = "medical_wall_first_aid_open"
	anchored = 1
	density = 0
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS
	setup = 0

/obj/structure/closet/medical_wall/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened

/obj/structure/closet/medical_wall/filled

/obj/structure/closet/medical_wall/filled/WillContain()
	return list(
		/obj/random/firstaid,
		/obj/random/medical/lite = 12)

/obj/structure/closet/shipping_wall
	name = "shipping supplies closet"
	desc = "It's a wall-mounted storage unit containing supplies for preparing shipments."
	icon_state = "shipping_wall"
	icon_closed = "shipping_wall"
	icon_opened = "shipping_wall_open"
	anchored = 1
	density = 0
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS
	setup = 0

/obj/structure/closet/shipping_wall/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened

/obj/structure/closet/shipping_wall/filled

/obj/structure/closet/shipping_wall/filled/WillContain()
	return list(
		/obj/item/stack/material/cardboard/ten,
		/obj/item/device/destTagger,
		/obj/item/packageWrap)