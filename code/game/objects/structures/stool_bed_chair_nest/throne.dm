//The throne has many functions so it gets its own file.

/obj/structure/bed/chair/throne
	name = "\the rogue throne"
	desc = "Fit for baron, count, or even duke. Surely fit for your sorry rear end."
	base_icon = "throne"
	icon_state = "throne"
	var/datum/announcement/decree/magistrate_decree = new
	var/announcement_cooldown = FALSE

/obj/structure/bed/chair/throne/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/throne/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return

/obj/structure/bed/chair/stool2
	name = "bar stool"
	desc = "Fit for a beggar."
	base_icon = "bar_black"
	icon_state = "bar_black"

/obj/structure/bed/chair/stool2/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/judge_throne
	name = "judge throne"
	desc = "We judge ourselves by what we feel capable of doing, while others judge us by what we have already done."
	base_icon = "judge"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "judge"

/obj/structure/bed/chair/judge_throne/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/judge_throne/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return


/obj/structure/bed/chair/stone_throne
	name = "stone throne"
	desc = "A throne carved from a big chunk of stone, it seems to have been masterfully crafted by the looks of the cuts around it."
	base_icon = "cave_throne"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "cave_throne"


/obj/structure/bed/chair/stone_throne/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/stone_throne/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return


/obj/structure/bed/chair/governor_throne
	name = "planetary Governor Throne"
	desc = "An expensive and serious looking chair to use on an office."
	base_icon = "comm"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "comm"

/obj/structure/bed/chair/governor_throne/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/governor_throne/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return


/obj/structure/bed/chair/ancient_throne
	name = "ancient throne"
	desc = "An old throne that seems to be made out of metal, how long it's been there is unknown."
	base_icon = "Chair"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "Chair"


/obj/structure/bed/chair/ancient_throne/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/ancient_throne/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return

/obj/structure/bed/chair/pew
	name = "pew"
	desc = "A pew, a bench of sorts that is used on religious sites, such as churches or shrines."
	base_icon = "pewchair_center"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "pewchair_center"


/obj/structure/bed/chair/pew/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/pew/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return

/obj/structure/bed/chair/torture
	name = "interrogation chair"
	desc = "You really dont want to be the one sitting here"
	base_icon = "torturechair"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "torturechair"


/obj/structure/bed/chair/torture/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/torture/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return

///// CHAIRS (The funny type)

/obj/structure/bed/chair/wood/simple
	name = "simple wood chair"
	desc = "A simple wooden chair."
	base_icon = "cave_wooden_chair"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "cave_wooden_chair"

/obj/structure/bed/chair/wood/fancy
	name = "fancy wood chair"
	desc = "An elegant and well crafted chair."
	base_icon = "wooden_chair"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "wooden_chair"

/obj/structure/bed/chair/wood/fancy/comfy1
	name = "expensive chair"
	desc = "A chair that was possibly done by imperial war orphans, the materials seem of very high quality though."
	base_icon = "comfychair_brown"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "comfychair_brown"

/obj/structure/bed/chair/wood/fancy/comfy2
	name = "antique chair"
	desc = "This chairs very old, possibly dating from 100-200 years old with the state of it, seems it's been mantained quite properly."
	base_icon = "comfychair2"
	icon = 'icons/map_project/furniture_and_decor.dmi'
	icon_state = "comfychair2"

