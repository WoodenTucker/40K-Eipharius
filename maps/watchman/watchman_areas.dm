/area/constructionsite
	name = "\improper Construction Site"
	icon_state = "storage"
	requires_power = FALSE

/area/maintenance/fsmaint2
	name = "\improper Fore Starboard Maintenance - 2"
	icon_state = "fsmaint"
	requires_power = FALSE

/area/medical/surgery
	name = "\improper Operating Theatre"
	icon_state = "surgery"
	requires_power = FALSE

/area/warp_engine
	name = "Warp Storm Engine"
	icon_state = "yellow"
	requires_power = TRUE

/area/warfare
	music = 'sound/music/trench_bgm.ogg'
	dynamic_lighting = TRUE
	requires_power = FALSE

//Cadia Stuff

//Table of contents
//General map Areas
//Hallways
//Outpost Areas
//Security
//Head's Offices
//Engineering
//Medical
//Research
//Service
//Supply
//Maintenance
//Public Crew rooms
//Tcommsat
//Storage
//Antagonists
//Shuttle
//
//


/*
Area basic template

/area/cadiaoupost/oa/
	name = ""
	icon_state = ""

*/


//General Map Areas
/area/cadiaoutpost/gma/air
	name = "Air"
	icon_state = "blue"
	music = 'sound/newmusic/General_Ambient2.ogg'
	requires_power = TRUE

/area/cadiaoutpost/gma/underground
	name = "Underground"
	icon_state = "unexplored"
	requires_power = TRUE
	dynamic_lighting = 1


/area/cadiaoutpost/oa/engineering
	name = "Machinamentum"
	icon_state = "engineering"
	music = 'sound/newmusic/Outpost1.ogg'
	requires_power = FALSE

/area/cadiaoutpost/oa/bridge/hallway
	name = "Spire Hallway"
	icon_state = "blueold"
	requires_power = TRUE
	music = 'sound/newmusic/Outpost1.ogg'

/area/cadiaoutpost/oa/hallway/centralhall // guard
	name = "Inner Hallway"
	icon_state = "hallC1"
	requires_power = FALSE
	music = 'sound/newmusic/Outpost1.ogg'


	name = "Medicae"
	icon_state = "medbay"
	music = 'sound/newmusic/Outpost1.ogg'
	dynamic_lighting = 1
	requires_power = FALSE

/area/cadiaoutpost/oa/medicae/storage
	name = "Medicae Storage"
	icon_state = "medbay2"
	music = 'sound/newmusic/Outpost1.ogg'
	requires_power = FALSE


/area/cadiaoutpost/oa/farm
	name = "Farm"
	icon_state = "farm"
	music = 'sound/newmusic/General_Ambient2.ogg'
	requires_power = TRUE
	dynamic_lighting = 1

/area/cadiaoutpost/oa/caves
	name = "Caves" // Regular caves - little to no danger. Soft ambience.
	icon_state = "cave"
	music = 'sound/newmusic/General_Ambient2.ogg'

/area/cadiaoutpost/oa/caves/dark
	name = "Caves Dark" // Powered areas of the city.
	icon_state = "cave"
	music = 'sound/newmusic/Caves_Dark.ogg'
	requires_power = FALSE

/area/cadiaoutpost/oa/caves/undercity
	name = "Caves Undercity" // Undercity ambience.
	icon_state = "cave"
	music = 'sound/newmusic/Caves_Dark.ogg'

/area/cadiaoutpost/oa/caves/terror
	name = "Caves Terror" // Do not use this area unless you know what it's for.
	icon_state = "cave"
	music = 'sound/newmusic/Caves_Dark.ogg'

/area/cadiaoutpost/oa/village
	name = "Village"
	icon_state = "village"
	music = 'sound/newmusic/General_Ambient2.ogg'
	requires_power = FALSE
	dynamic_lighting = 1

/area/cadiaoutpost/oa/villageinside
	name = "Inside Village"
	icon_state = "village"
	music = 'sound/newmusic/General_Ambient2.ogg'
	requires_power = FALSE
	dynamic_lighting = 1



	name = "The Forest"
	icon_state = "forest"
	requires_power = TRUE
	dynamic_lighting = 1
	music = 'sound/newmusic/General_Ambient2.ogg'

/area/cadiaoutpost/oa/magistratumpost
	name = "Forward Magistratum Post"
	icon_state = "forwardpost"
	requires_power = FALSE
	dynamic_lighting = 1
	music = 'sound/newmusic/Outpost1.ogg'


