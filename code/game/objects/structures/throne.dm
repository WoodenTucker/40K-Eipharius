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