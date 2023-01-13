/material/proc/get_recipes()
	if(!recipes)
		generate_recipes()
	return recipes

/material/proc/generate_recipes()
	recipes = list()

	// If is_brittle() returns true, these are only good for a single strike.
	recipes += new/datum/stack_recipe("[display_name] ashtray", /obj/item/material/ashtray, 2, one_per_turf = 1, on_floor = 1, supplied_material = "[name]")
	recipes += new/datum/stack_recipe("[display_name] spoon", /obj/item/material/kitchen/utensil/spoon/plastic, 1, on_floor = 1, supplied_material = "[name]")
	recipes += new/datum/stack_recipe("[display_name] ring", /obj/item/clothing/ring/material, 1, on_floor = 1, supplied_material = "[name]")

	if(integrity>50)
		recipes += new/datum/stack_recipe("[display_name] chair", /obj/structure/bed/chair, one_per_turf = 1, on_floor = 1, supplied_material = "[name]") //NOTE: the wood material has it's own special chair recipe

	if(integrity>=50)
		recipes += new/datum/stack_recipe("[display_name] door", /obj/machinery/door/unpowered/simple, 10, time = 50, one_per_turf = 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] barricade", /obj/structure/barricade, 5, time = 50, one_per_turf = 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] stool", /obj/item/stool, one_per_turf = 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] bar stool", /obj/item/stool/bar, one_per_turf = 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] bed", /obj/structure/bed, 2, one_per_turf = 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] lock",/obj/item/material/lock_construct, 1, time = 20, one_per_turf = 0, on_floor = 1, supplied_material = "[name]")

	if(hardness>50)
		recipes += new/datum/stack_recipe("[display_name] fork", /obj/item/material/kitchen/utensil/fork/plastic, 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] knife", /obj/item/material/kitchen/utensil/knife/plastic, 1, on_floor = 1, supplied_material = "[name]")
		recipes += new/datum/stack_recipe("[display_name] blade", /obj/item/material/butterflyblade, 6, time = 20, one_per_turf = 0, on_floor = 1, supplied_material = "[name]")

/material/steel/generate_recipes()
	..()
	recipes += new/datum/stack_recipe_list("office chairs",list( \
		new/datum/stack_recipe("dark office chair", /obj/structure/bed/chair/office/dark, 5, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("light office chair", /obj/structure/bed/chair/office/light, 5, one_per_turf = 1, on_floor = 1) \
		))
	recipes += new/datum/stack_recipe_list("comfy chairs", list( \
		new/datum/stack_recipe("beige comfy chair", /obj/structure/bed/chair/comfy/beige, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("black comfy chair", /obj/structure/bed/chair/comfy/black, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("brown comfy chair", /obj/structure/bed/chair/comfy/brown, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("lime comfy chair", /obj/structure/bed/chair/comfy/lime, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("teal comfy chair", /obj/structure/bed/chair/comfy/teal, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("red comfy chair", /obj/structure/bed/chair/comfy/red, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("blue comfy chair", /obj/structure/bed/chair/comfy/blue, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("purple comfy chair", /obj/structure/bed/chair/comfy/purp, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("green comfy chair", /obj/structure/bed/chair/comfy/green, 2, one_per_turf = 1, on_floor = 1), \
		))
	recipes += new/datum/stack_recipe("table frame", /obj/structure/table, 1, time = 10, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("rack", /obj/structure/table/rack, 1, time = 5, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("closet", /obj/structure/closet, 2, time = 15, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("canister", /obj/machinery/portable_atmospherics/canister, 10, time = 15, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("cannon frame", /obj/item/cannonframe, 10, time = 15, one_per_turf = 0, on_floor = 0)
	recipes += new/datum/stack_recipe("floor tile", /obj/item/stack/tile/floor, 1, 4, 20)
	recipes += new/datum/stack_recipe("metal rod", /obj/item/stack/rods, 1, 2, 60)
	recipes += new/datum/stack_recipe("corpse starch empty can", /obj/item/trash/warfare_can/rat, 1)
	recipes += new/datum/stack_recipe("computer frame", /obj/structure/computerframe, 5, time = 25, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("wall girders", /obj/structure/girder, 2, time = 50, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("machine frame", /obj/machinery/constructable_frame/machine_frame, 5, time = 25, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("turret frame", /obj/machinery/porta_turret_construct, 5, time = 25, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe_list("airlock assemblies", list( \
		new/datum/stack_recipe("standard airlock assembly", /obj/structure/door_assembly, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("command airlock assembly", /obj/structure/door_assembly/door_assembly_com, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("sol airlock assembly", /obj/structure/door_assembly/door_assembly_sol, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("security airlock assembly", /obj/structure/door_assembly/door_assembly_sec, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("engineering airlock assembly", /obj/structure/door_assembly/door_assembly_eng, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("mining airlock assembly", /obj/structure/door_assembly/door_assembly_min, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("atmospherics airlock assembly", /obj/structure/door_assembly/door_assembly_atmo, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("research airlock assembly", /obj/structure/door_assembly/door_assembly_research, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("medical airlock assembly", /obj/structure/door_assembly/door_assembly_med, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("maintenance airlock assembly", /obj/structure/door_assembly/door_assembly_mai, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("external airlock assembly", /obj/structure/door_assembly/door_assembly_ext, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("freezer airlock assembly", /obj/structure/door_assembly/door_assembly_fre, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("airtight hatch assembly", /obj/structure/door_assembly/door_assembly_hatch, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("maintenance hatch assembly", /obj/structure/door_assembly/door_assembly_mhatch, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("high security airlock assembly", /obj/structure/door_assembly/door_assembly_highsecurity, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("emergency shutter", /obj/structure/firedoor_assembly, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		))
	recipes += new/datum/stack_recipe_list("wide airlock assemblies", list( \
		new/datum/stack_recipe("wide imperial airlock assembly", /obj/structure/door_assembly/multi_tile/imperium, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("wide maintenance airlock assembly", /obj/structure/door_assembly/multi_tile/maintenance, 4, time = 50, one_per_turf = 1, on_floor = 1), \
		))

	recipes += new/datum/stack_recipe("grenade casing", /obj/item/grenade/chem_grenade, 1)
	recipes += new/datum/stack_recipe("light fixture frame", /obj/item/frame/light, 2)
	recipes += new/datum/stack_recipe("small light fixture frame", /obj/item/frame/light/small, 1)
	recipes += new/datum/stack_recipe("apc frame", /obj/item/frame/apc, 2)
	recipes += new/datum/stack_recipe("air alarm frame", /obj/item/frame/air_alarm, 2)
	recipes += new/datum/stack_recipe("fire alarm frame", /obj/item/frame/fire_alarm, 2)

	recipes += new/datum/stack_recipe_list("modular computer frames", list( \
		new/datum/stack_recipe("modular console frame", /obj/item/modular_computer/console, 20),\
		new/datum/stack_recipe("modular telescreen frame", /obj/item/modular_computer/telescreen, 10),\
		new/datum/stack_recipe("modular laptop frame", /obj/item/modular_computer/laptop, 10),\
		new/datum/stack_recipe("modular tablet frame", /obj/item/modular_computer/tablet, 5),\
	))
/material/plasteel/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("AI core", /obj/structure/AIcore, 4, time = 50, one_per_turf = 1)
	recipes += new/datum/stack_recipe("Metal crate", /obj/structure/closet/crate, 10, time = 50, one_per_turf = 1)
	recipes += new/datum/stack_recipe("knife grip", /obj/item/material/butterflyhandle, 4, time = 20, one_per_turf = 0, on_floor = 1, supplied_material = "[name]")
	recipes += new/datum/stack_recipe("dark floor tile", /obj/item/stack/tile/floor_dark, 1, 4, 20)

/material/stone/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("planting bed", /obj/machinery/portable_atmospherics/hydroponics/soil, 3, time = 10, one_per_turf = 1, on_floor = 1)

/material/plastic/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("plastic crate", /obj/structure/closet/crate/plastic, 10, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("plastic bag", /obj/item/storage/bag/plasticbag, 3, on_floor = 1)
	recipes += new/datum/stack_recipe("blood pack", /obj/item/reagent_containers/ivbag, 4, on_floor = 0)
	recipes += new/datum/stack_recipe("reagent dispenser cartridge (large)", /obj/item/reagent_containers/chem_disp_cartridge,        5, on_floor=0) // 500u
	recipes += new/datum/stack_recipe("reagent dispenser cartridge (med)",   /obj/item/reagent_containers/chem_disp_cartridge/medium, 3, on_floor=0) // 250u
	recipes += new/datum/stack_recipe("reagent dispenser cartridge (small)", /obj/item/reagent_containers/chem_disp_cartridge/small,  1, on_floor=0) // 100u
	recipes += new/datum/stack_recipe("white floor tile", /obj/item/stack/tile/floor_white, 1, 4, 20)
	recipes += new/datum/stack_recipe("freezer floor tile", /obj/item/stack/tile/floor_freezer, 1, 4, 20)
	recipes += new/datum/stack_recipe("hazard cone", /obj/item/caution/cone, 1, on_floor = 1)


/material/wood/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("wooden sandals", /obj/item/clothing/shoes/sandal, 1)
	recipes += new/datum/stack_recipe("wood floor tile", /obj/item/stack/tile/wood, 1, 4, 20)
	recipes += new/datum/stack_recipe("wooden chair", /obj/structure/bed/chair/wood, 3, time = 10, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("fancy wooden chair", /obj/structure/bed/chair/wood/wings, 3, time = 10, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("crossbow frame", /obj/item/crossbowframe, 5, time = 25, one_per_turf = 0, on_floor = 0)
	recipes += new/datum/stack_recipe("coffin", /obj/structure/closet/coffin, 5, time = 15, one_per_turf = 1, on_floor = 1)
	recipes += new/datum/stack_recipe("book shelf", /obj/structure/bookcase, 5, time = 15, one_per_turf = 1, on_floor = 1)

/material/cardboard/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("box", /obj/item/storage/box)
	recipes += new/datum/stack_recipe("large box", /obj/item/storage/box/large, 2)
	recipes += new/datum/stack_recipe("donut box", /obj/item/storage/box/donut/empty)
	recipes += new/datum/stack_recipe("egg box", /obj/item/storage/fancy/egg_box/empty)
	recipes += new/datum/stack_recipe("light tubes box", /obj/item/storage/box/lights/tubes/empty)
	recipes += new/datum/stack_recipe("light bulbs box", /obj/item/storage/box/lights/bulbs/empty)
	recipes += new/datum/stack_recipe("mouse traps box", /obj/item/storage/box/mousetraps/empty)
	recipes += new/datum/stack_recipe("cardborg suit", /obj/item/clothing/suit/cardborg, 3)
	recipes += new/datum/stack_recipe("cardborg helmet", /obj/item/clothing/head/cardborg)
	recipes += new/datum/stack_recipe("pizza box", /obj/item/pizzabox)
	recipes += new/datum/stack_recipe_list("folders",list( \
		new/datum/stack_recipe("blue folder", /obj/item/folder/blue), \
		new/datum/stack_recipe("grey folder", /obj/item/folder), \
		new/datum/stack_recipe("red folder", /obj/item/folder/red), \
		new/datum/stack_recipe("white folder", /obj/item/folder/white), \
		new/datum/stack_recipe("yellow folder", /obj/item/folder/yellow), \
		))

/material/scrap/generate_recipes()
	..()
	recipes += new/datum/stack_recipe("Eavy Metal Helmet", /obj/item/clothing/head/helmet/orkhelmet, 15, 1, 1, 10)
	recipes += new/datum/stack_recipe("Flashgitz Helmet", /obj/item/clothing/head/helmet/orkhelmet/sight, 12, 1, 1, 10)
	recipes += new/datum/stack_recipe("Slugga Boy Helmet", /obj/item/clothing/head/helmet/orkhelmet/horns, 8, 1, 1, 10)
	recipes += new/datum/stack_recipe("Shoota Boy Helmet", /obj/item/clothing/head/helmet/orkhelmet/leather, 8, 1, 1, 10)
	recipes += new/datum/stack_recipe("Zoggin' Boy Top Knot", /obj/item/clothing/head/helmet/orkhelmet/knot, 4, 1, 1, 10)

	recipes += new/datum/stack_recipe("Eavy Metal Armor", /obj/item/clothing/suit/armor/orkarmor, 20, 1, 1, 10)
	recipes += new/datum/stack_recipe("Shoota Boy Armor", /obj/item/clothing/suit/armor/orkarmor/snazzy, 8, 1, 1, 10)
	recipes += new/datum/stack_recipe("Slugga Boy Armor", /obj/item/clothing/suit/armor/orkarmor/skullza, 8, 1, 1, 10)
	recipes += new/datum/stack_recipe("Zoggin' Boy Armor", /obj/item/clothing/suit/armor/orkarmor/zog, 4, 1, 1, 10)

	recipes += new/datum/stack_recipe("Power Klaw", /obj/item/storage/backpack/satchel/warfare/kroot/mek, 16, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Shoota", /obj/item/gun/projectile/ork, 8, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Bladed Shoota", /obj/item/gun/projectile, 10, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Kustom Shoota", /obj/item/gun/projectile, 12, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Big Shoota", /obj/item/gun/projectile, 14, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Furtha Shoota", /obj/item/gun/projectile, 16, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Shoota magazine", /obj/item/ammo_magazine/ork/shoota, 4, 1, 1, 0, on_floor = 1)
	recipes += new/datum/stack_recipe("Slugga", /obj/item/gun/projectile/ork/slugga, 5, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("Slugga magazine", /obj/item/ammo_magazine/ork/slugga, 3, 1, 1, 0, on_floor = 1)
	recipes += new/datum/stack_recipe("Pipe Grenade", /obj/item/grenade/frag/high_yield/homemade, 3, 1, 1, 0, on_floor = 1)
	recipes += new/datum/stack_recipe("Krak Grenade", /obj/item/grenade/frag/high_yield/krak, 8, 1, 1, 0, on_floor = 1)
	recipes += new/datum/stack_recipe("scrap mek-mace", /obj/item/material/mekmace, 4, 1, 1, 10)
	recipes += new/datum/stack_recipe("Steel Choppa", /obj/item/melee/sword/choppa, 8, 1, 1, 10)

	recipes += new/datum/stack_recipe("ork banner structure", /obj/structure/orkbanna, 5, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("scrap window", /obj/structure/window/orkwindow, 15, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("scrap door", /obj/machinery/door/orkdoor, 10, 1, 1, 20, on_floor = 1)
	recipes += new/datum/stack_recipe("scrap wall", /turf/simulated/wall/stone, 5, 1, 1, 20, on_floor = 1)


