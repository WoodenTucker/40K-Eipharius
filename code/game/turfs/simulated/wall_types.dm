/turf/simulated/wall/r_wall
	icon_state = "rgeneric"
	walltype = "rwall"
	icon_state = "rwall0"
	//mineral = "reinforced_m"
/turf/simulated/wall/r_wall/New(var/newloc)
	..(newloc) //3strong
/turf/simulated/wall/ocp_wall
	icon_state = "rgeneric"

/turf/simulated/wall/concrete
	name = "concrete wall"
	desc = "An old concrete wall. For when metal just isn't good enough."
	icon_state = "concrete0"
	walltype = "concrete"
	mineral = "rust"
	integrity = 1000 //Tough bois

/turf/simulated/wall/concrete/strong
	desc = "Looks much stronger than a paper sheet."
	integrity = 2000

/turf/simulated/wall/concrete/strong/chapel
	name = "monastic stone wall"
	desc = "Ornate stone packed together in a gothic fashion with various holy scribbles etching the framework. It looks extremely tough."
	integrity = 2000

/turf/simulated/wall/rust
	desc = "An old rusty wall. It's definitely seen better days."
	icon_state = "rust0"
	walltype = "rust"
	mineral = "rust"
	integrity = 500

/turf/simulated/wall/r_wall/containment
	desc = "A strong containment wall. Used to \"contain\" things"
	icon_state = "containment0"
	walltype = "containment"
	mineral = "containment"
	integrity = 2000

/turf/simulated/wall/ocp_wall/New(var/newloc)
	..(newloc)

/turf/simulated/wall/cult
	icon_state = "cult"
	walltype = "cult"
	integrity = 1000

/turf/simulated/wall/cult/New(var/newloc, var/reinforce = 0)
	..(newloc,)

/turf/simulated/wall/cult/reinf/New(var/newloc)
	..(newloc)

/turf/simulated/wall/cult/dismantle_wall()
	cult.remove_cultiness(CULTINESS_PER_TURF)
	..()

/turf/unsimulated/wall/cult
	name = "cult wall"
	desc = "Hideous images dance beneath the surface."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "cult"

/*GAVNO!!!/
/turf/simulated/wall/iron/New(var/newloc)
	..(newloc)
/turf/simulated/wall/uranium/New(var/newloc)
	..(newloc)
/turf/simulated/wall/diamond/New(var/newloc)
	..(newloc)
/turf/simulated/wall/gold/New(var/newloc)
	..(newloc)
/turf/simulated/wall/silver/New(var/newloc)
	..(newloc)
/turf/simulated/wall/phoron/New(var/newloc)
	..(newloc)
/turf/simulated/wall/sandstone/New(var/newloc)
	..(newloc)
/turf/simulated/wall/wood/New(var/newloc)
	..(newloc)
/turf/simulated/wall/ironphoron/New(var/newloc)
	..(newloc)
/turf/simulated/wall/golddiamond/New(var/newloc)
	..(newloc)
/turf/simulated/wall/silvergold/New(var/newloc)
	..(newloc)
/turf/simulated/wall/sandstonediamond/New(var/newloc)
	..(newloc)
*/

// Kind of wondering if this is going to bite me in the butt.
/turf/simulated/wall/voxshuttle/New(var/newloc)
	..(newloc)
/turf/simulated/wall/voxshuttle/attackby()
	return
/turf/simulated/wall/titanium/New(var/newloc)
	..(newloc)

/turf/simulated/wall/alium
	icon_state = "jaggy"
	floor_type = /turf/simulated/floor/fixed/alium

/turf/simulated/wall/alium/New(var/newloc)
	..(newloc)

/turf/simulated/wall/alium/ex_act(severity)
	if(prob(explosion_resistance))
		return
	..()

/turf/simulated/wall/stone
	icon_state = "stone0"
	walltype = "stone"
	integrity = 1000

/turf/simulated/wall/wood
	icon_state = "wood0"
	walltype = "wood"
	integrity = 300

/turf/simulated/wall/scrap
	icon_state = "scrap0"
	walltype = "scrap"
	integrity = 500

/turf/simulated/wall/wooden
	name = "wood wall"
	desc = "An old wooden wall. For when metal is just too much work."
	icon = 'icons/turf/wooden3.dmi'
	icon_state = "wall"
	walltype = "wood"
	mineral = "wood"
	integrity = 400 //Tough bois

/turf/simulated/wall/snowcave
	name = "snowy cave wall"
	desc = "An ancient cave wall covered in snow."
	icon_state = "snow0"
	walltype = "snow"
	mineral = "stone"
	integrity = 2000 //Tough bois

/turf/simulated/wall/grim
	name = "grim wall"
	desc = "A grim looking metal wall"
	icon_state = "grim0"
	walltype = "grim"
	integrity = 1500 //Tough bois

/turf/simulated/wall/techno
	name = "techno wall"
	desc = "A techno looking metal wall"
	icon_state = "techno0"
	walltype = "techno"
	integrity = 2000 //Tough bois