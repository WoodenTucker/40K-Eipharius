#define REQUIRED_CAPTURED_ZONES 5 //You gotta hold all four trenches and mid in order to enter the enemies zone.
#define REQUIRED_TRENCH_ZONES 3 //Hold

GLOBAL_LIST_EMPTY(blue_captured_zones) //= list()
GLOBAL_LIST_EMPTY(red_captured_zones) // = list()

GLOBAL_LIST_EMPTY(mortar_areas) // = list()


/area/constructionsite
	name = "\improper Construction Site"
	icon_state = "storage"

/area/maintenance/fsmaint2
	name = "\improper Fore Starboard Maintenance - 2"
	icon_state = "fsmaint"

/area/medical/surgery
	name = "\improper Operating Theatre"
	icon_state = "surgery"

/area/warp_engine
	name = "Warp Storm Engine"
	icon_state = "yellow"
	requires_power = TRUE

/area/warfare
	music = 'sound/music/trench_bgm.ogg'
	dynamic_lighting = TRUE
	requires_power = FALSE

/area/warfare/battlefield
	name = "\improper Battlefield"
	var/captured = null
	turf_initializer = /decl/turf_initializer/oldfare
	var/can_pre_enter = FALSE

/area/warfare/battlefield/trench_section//So they can cross atop their trench section.
	can_pre_enter = TRUE

/area/warfare/battlefield/trench_section/underground//So it doesn't spawn random shit underground.
	forced_ambience = null
	turf_initializer = null


/area/warfare/battlefield/trench_section/underground/Entered(mob/living/L, area/A)
	. = ..()
	if(istype(L) && !istype(A, /area/warfare/battlefield))
		L.clear_fullscreen("fog")
		L.clear_fullscreen("ash")
		L.clear_fullscreen("fallout")

/area/warfare/battlefield/no_mans_land
	name = "\improper No Man\'s Land"

	New()
		..()
		GLOB.mortar_areas += src

/area/warfare/battlefield/Entered(mob/living/L,  atom/A)
	. = ..()
	if(istype(L) && !istype(A, /area/warfare/battlefield))//Doesn't work but this does stop the lag.
		L.overlay_fullscreen("fog", /obj/screen/fullscreen/fog)
		L.overlay_fullscreen("fallout", /obj/screen/fullscreen/fallout)
		L.overlay_fullscreen("ash", /obj/screen/fullscreen/storm)

/area/warfare/battlefield/Exited(mob/living/L, area/A)
	. = ..()
	if(istype(L) && !istype(A, /area/warfare/battlefield))
		L.clear_fullscreen("fog")
		L.clear_fullscreen("ash")
		L.clear_fullscreen("fallout")

/area/warfare/battlefield/capture_point
	name = "\improper Capture Point"
	icon_state = "storage"
	turf_initializer = null
	var/red_capture_points = 0
	var/blue_capture_points = 0
	var/list/blues = list()
	var/list/reds = list()

/area/warfare/battlefield/capture_point/New()
	..()
	START_PROCESSING(SSprocessing, src)

/area/warfare/battlefield/capture_point/Entered(atom/A)
	. = ..()
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		if(H.warfare_faction != captured)
			to_chat(H, "Now capturing [src]!")
		else
			to_chat(H, "Now defending [src]!")

/area/warfare/battlefield/capture_point/Process()
	for(var/mob/living/carbon/human/H in src)
		if(!istype(H))
			continue

		if(H.warfare_faction == BLUE_TEAM)
			if(H.stat == CONSCIOUS)//If they're dead or unconcious then don't add them.
				blues |= H
			else if(H.stat > 0)//If they die or pass out remove them.
				blues -= H
			else if(!H.client)//No client, then remove them.
				blues -= H

		//Same for red team.
		else if(H.warfare_faction == RED_TEAM )
			if(H.stat == CONSCIOUS)
				reds |= H
			else if(H.stat > 0)
				reds -= H
			else if(!H.client)
				reds -= H

	if(blues.len > reds.len)//More of the blue team than red team is in the area.
		if(blue_capture_points < config.trench_capture_points)
			blue_capture_points++//Increase the points until it's captured.
		if(red_capture_points > 0)
			red_capture_points--
	else if(blues.len < reds.len)//Opposite here.
		if(red_capture_points < config.trench_capture_points)
			red_capture_points++
		if(blue_capture_points > 0)
			blue_capture_points--

	if(blue_capture_points == (config.trench_capture_points/2) && (captured != BLUE_TEAM))//Announce when we're halfway done.
		to_world("<big>[uppertext("[BLUE_TEAM] are 50% done capturing the [src]")]</big>")

	if(red_capture_points == (config.trench_capture_points/2) && (captured != RED_TEAM))
		to_world("<big>[uppertext("[RED_TEAM] are 50% done capturing the [src]")]</big>")

	if(blue_capture_points >= config.trench_capture_points && (captured != BLUE_TEAM))//If we've already captured it we don't want to capture it again.
		to_world("<big>[uppertext("[BLUE_TEAM] HAVE CAPTURED THE [src]")]!</big>")
		captured = BLUE_TEAM
		GLOB.blue_captured_zones |= src//Add it to our list.
		GLOB.red_captured_zones -= src//Remove it from theirs.
		blue_capture_points = 0//Reset it back to 0.
		red_capture_points = 0//For both sides.
		sound_to(world, 'sound/effects/capture.ogg')

	else if(red_capture_points >= config.trench_capture_points && (captured != RED_TEAM))
		to_world("<big>[uppertext("[RED_TEAM] HAVE CAPTURED THE [src]")]!</big>")
		captured = RED_TEAM
		GLOB.red_captured_zones |= src
		GLOB.blue_captured_zones -= src
		blue_capture_points = 0
		red_capture_points = 0
		sound_to(world, 'sound/effects/capture.ogg')

/area/warfare/battlefield/capture_point/Exit(mob/living/L)
	. = ..()
	if(ishuman(L))
		if(L in blues)
			blues -= L
		else if(L in reds)
			reds -= L

/area/warfare/battlefield/capture_point/mid
	name = "Middle Bunker"
	icon_state = "start"

/area/warfare/battlefield/capture_point/red
	icon_state = "red"
	captured = RED_TEAM

	New()//They start out having these by default.
		..()
		GLOB.red_captured_zones |= src

/area/warfare/battlefield/capture_point/red/Enter(atom/movable/AM)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(H.warfare_faction == BLUE_TEAM && (GLOB.blue_captured_zones.len < REQUIRED_TRENCH_ZONES))
			to_chat(H, "<big>WE DO NOT CONTROL THE MIDDLE BUNKER!</big>")
			return FALSE
	return TRUE

/area/warfare/battlefield/capture_point/red/one
	name = "First South Trench"

/area/warfare/battlefield/capture_point/red/two
	name = "Second South Trench"

/area/warfare/battlefield/capture_point/blue
	icon_state = "blue"
	captured = BLUE_TEAM

	New()
		..()
		GLOB.blue_captured_zones |= src

/area/warfare/battlefield/capture_point/blue/Enter(atom/movable/AM)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(H.warfare_faction == RED_TEAM && (GLOB.red_captured_zones.len < REQUIRED_TRENCH_ZONES))
			to_chat(H, "<big>WE DO NOT CONTROL THE MIDDLE BUNKER!</big>")
			return FALSE
	return TRUE

/area/warfare/battlefield/capture_point/blue/one
	name = "First North Trench"

/area/warfare/battlefield/capture_point/blue/two
	name = "Second North Trench"

//If it's not time for war then you can't exit your starting trench.
/area/warfare/battlefield/Enter(atom/movable/mover as mob|obj, atom/forget as mob|obj|turf|area)
	if(!iswarfare())
		return TRUE
	if(ishuman(mover))
		var/mob/living/carbon/human/H = mover

		if(can_pre_enter)//You can always enter these areas.
			return TRUE

		if(locate(/obj/item/device/boombox) in H)//Locate the boombox.
			to_chat(H, "I can't bring this with me onto the battlefield. Wouldn't want to lose it.")//No you fucking don't.
			return //Keep that boombox at base asshole.

		if(locate(/obj/item/storage) in H)//Gotta check storage as well.
			var/obj/item/storage/S = locate() in H
			if(locate(/obj/item/device/boombox) in S)
				to_chat(H, "I can't bring this with me onto the battlefield. Wouldn't want to lose it.")
				return

		if(!SSwarfare.battle_time && captured != H.warfare_faction)//So people can enter their own trenches.
			to_chat(H, "<big>I am not ready to die yet!</big>")
			return FALSE

	if(istype(mover, /obj/item/device/boombox))//No boomboxes in no man's land please.
		return

	return TRUE

/area/warfare/homebase
	name = "\improper Base"
	icon_state = "start"
	requires_power = FALSE

/area/warfare/homebase/red
	name = "\improper Red Base"
	icon_state = "security"

/area/warfare/homebase/red/Enter(atom/movable/AM)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(H.warfare_faction == BLUE_TEAM && (GLOB.blue_captured_zones.len < REQUIRED_CAPTURED_ZONES))//No spawn camping till you take the required zones bitch.
			to_chat(H, "<big>WE DO NOT CONTROL THE TRENCHES!</big>")
			return FALSE
	return TRUE


/area/warfare/homebase/blue
	name = "\improper Blue Base"
	icon_state = "showroom"

/area/warfare/homebase/blue/Enter(atom/movable/AM)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(H.warfare_faction == RED_TEAM && (GLOB.red_captured_zones.len < REQUIRED_CAPTURED_ZONES))
			to_chat(H, "<big>WE DO NOT CONTROL THE TRENCHES!</big>")
			return FALSE
	return TRUE

/area/warfare/farawayhome
	name = "\improper Far Away"
	icon_state = "start"

/area/warfare/farawayhome/Enter(atom/movable/mover as mob|obj, atom/forget as mob|obj|turf|area)
	if(!iswarfare())
		return TRUE
	if(ishuman(mover))
		var/mob/living/carbon/human/H = mover
		to_chat(H, "<big>I CANNOT DISOBEY ORDERS!</big>")
	return FALSE


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

/area/cadiaoutpost/gma/underground
	name = "Underground"
	icon_state = "unexplored"
	requires_power = 0
	dynamic_lighting = 1

/area/cadiaoutpost/gma/inquisitoracolyte
	name = "Inquisitorial Acolyte Vessel ''Simiel''"
	icon_state = "red"
	requires_power = 0 //is a separate ship presumably has its own power source

//Outpost Areas
/area/cadiaoutpost/oa/arrivals
	name = "Arrivals"
	icon_state = "cryo"
//////////////////////////////////////
////////////Hallways//////////////////
//////////////////////////////////////

/area/cadiaoutpost/oa/bridge/hallway
	name = "Bridge Hallway"
	icon_state = "blueold"

/area/cadiaoutpost/oa/departures
	name = "Departures"
	icon_state = "escape"

/area/cadiaoutpost/oa/hallway
	name = "Hallway"
	icon_state = "yellow"

/area/cadiaoutpost/oa/hallway/northern
	name = "Northern Hallway"
	icon_state = "halln"

/area/cadiaoutpost/oa/hallway/eastern
	name = "Eastern Hallway"
	icon_state = "halle"

/area/cadiaoutpost/oa/hallway/southern
	name = "Southern Hallway"
	icon_state = "halls"

/area/cadiaoutpost/oa/hallway/western
	name = "Western Hallway"
	icon_state = "hallw"

/area/cadiaoutpost/oa/hallway/centralhall
	name = "Inner Hallway"
	icon_state = "hallC1"

//////////////////////////////////////
//////////Security////////////////////
//////////////////////////////////////
/area/cadiaoutpost/oa/security
	name = "Security"
	icon_state = "security"

/area/cadiaoutpost/oa/security/armory
	name = "Armory"
	icon_state = "armory"

/area/cadiaoutpost/oa/security/barracks
	name = "Barracks"
	icon_state = "barracks"

/area/cadiaoutpost/oa/security/brig
	name = "Brig"
	icon_state = "brig"

/area/cadiaoutpost/oa/security/prison
	name = "Prison"
	icon_state = "sec_prison"

/area/cadiaoutpost/oa/security/detective
	name = "detective"
	icon_state = "detective"

/area/cadiaoutpost/oa/security/warden
	name = "Warden"
	icon_state = "warden"

/area/cadiaoutpost/oa/security/customs
	name = "customs"
	icon_state = "customs"

/area/cadiaoutpost/oa/security/firing_range
	name = "Firing Range"
	icon_state = "firingrange"

/area/cadiaoutpost/oa/security/execution
	name = "Execution"
	icon_state = "execution_room"

/area/cadiaoutpost/oa/security/execution/education
	name = "Prisoner Education"
	icon_state = "execution_room"

/area/cadiaoutpost/oa/security/execution/transfer
	name = ""
	icon_state = "sec_processing"

//////////////////////////////////////////
///////////////Head's Offices/////////////
//////////////////////////////////////////

/area/cadiaoutpost/oa/bridge/offices/roguetrader
	name = "Rogue Trader's Office"
	icon_state = "captain"

/area/cadiaoutpost/oa/bridge/offices/seneschal
	name = "Seneschal's Office"
	icon_state = "hop"

/area/cadiaoutpost/oa/bridge/offices/commissar
	name = "Commissar's Office"
	icon_state = "hos"

/area/cadiaoutpost/oa/bridge/offices/magoserrant
	name = "Magos Errant's Office"
	icon_state = "rd"

/area/cadiaoutpost/oa/bridge/offices/magosexplorator
	name = "Magos Explorator's Office"
	icon_state = "ce"

/area/cadiaoutpost/oa/bridge/offices/sisterhospitaller
	name = "Sister Hospitaller's Office"
	icon_state = "cmo"

////////////////////////
////////Misc (temp)/////
////////////////////////
/area/cadiaoutpost/oa/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/cadiaoutpost/oa/bridge/vault
	name = "Vault"
	icon_state = "nuke_storage"

/area/cadiaoutpost/oa/bridge/meetingroom
	name = "Meeting Room"
	icon_state = "blue"

/area/cadiaoutpost/oa/caves
	name = "Caves"
	icon_state = "cave"
	music = 'sound/music/caves.ogg'

/////////////////////////////////////////
////////////////Engineering/////////////
////////////////////////////////////////
/area/cadiaoutpost/oa/engineering
	name = "Machinamentum"
	icon_state = "engineering"

/area/cadiaoutpost/oa/engineering/engine
	name = "Sacrarium Machina"
	icon_state = "engine"

/area/cadiaoutpost/oa/engineering/engistorage
	name = "Engineering Storage"
	icon_state = "engineering_storage"

/area/cadiaoutpost/oa/engineering/engineeringfoyer
	name = "Engineering Foyer"
	icon_state = "engineering_foyer"

/area/cadiaoutpost/oa/engineering/engine/enginewaste
	name = "Engine Waste"
	icon_state = "engine_waste"

/area/cadiaoutpost/oa/engineering/engine/enginesmes
	name = "Engine Smes"
	icon_state = "engine_smes"

/area/cadiaoutpost/oa/engineering/engineeringbreak
	name = "Engineering Breakroom"
	icon_state = "engineering_break"

/area/cadiaoutpost/oa/engineering/atmospherics
	name = "Atmospherics"
	icon_state = "atmos"

/area/cadiaoutpost/oa/engineering/atmospherics/atmosmonitoring
	name = "Atmos Monitoring"
	icon_state = "atmos_monitoring"

/area/cadiaoutpost/oa/engineering/atmospherics/atmosstorage
	name = "Atmos Storage"
	icon_state = "atmos_storage"

/area/cadiaoutpost/oa/engineering/Gravity
	name = "Gravity Generator"
	icon_state = "gravgen"

/area/cadiaoutpost/oa/engineering/drone
	name = "Drone Zone"
	icon_state = "drone_fab"

/area/cadiaoutpost/oa/engineering/solars
	name = "Solars"
	icon_state = "solars"
//////////////////////////////////////
//////////////Medical////////////////
/////////////////////////////////////
/area/cadiaoutpost/oa/medicae
	name = "Medicae"
	icon_state = "medbay"
	dynamic_lighting = 1
	requires_power = 0

/area/cadiaoutpost/oa/medicae/storage
	name = "Medicae Storage"
	icon_state = "medbay2"

/area/cadiaoutpost/oa/medicae/virology
	name = "Praetorium Aegrotatio"
	icon_state = "virology"

/area/cadiaoutpost/oa/medicae/chem
	name = "Chemistry"
	icon_state = "chem"

/area/cadiaoutpost/oa/medicae/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/cadiaoutpost/oa/medicae/morgue
	name = "Morgue"
	icon_state = "morgue"

/area/cadiaoutpost/oa/medicae/patients
	name = "patients"
	icon_state = "patients"

/area/cadiaoutpost/oa/medicae/patients/room_a
	name = "patients A"
	icon_state = "patients"

/area/cadiaoutpost/oa/medicae/patients/room_b
	name = "patients B"
	icon_state = "patients"

/area/cadiaoutpost/oa/medicae/patients/room_c
	name = "patients C"
	icon_state = "patients"

/area/cadiaoutpost/oa/medicae/patients/room_d
	name = "patients D"
	icon_state = "patients"

/area/cadiaoutpost/oa/medicae/patients/room_e
	name = "patients E"
	icon_state = "patients"

/area/cadiaoutpost/oa/medicae/genetics
	name = "Genetics"
	icon_state = "genetics"

/area/cadiaoutpost/oa/medicae/genetics/cloning
	name = "Cloning"
	icon_state = "cloning"

/area/cadiaoutpost/oa/medicae/cryo
	name = "Cryo"
	icon_state = "cryo"

/area/cadiaoutpost/oa/medicae/medicaebreak
	name = "Medicae Breakroom"
	icon_state = "medbay_break"


//////////////////////////////////////////
////////////////Research//////////////////
/////////////////////////////////////////
/area/cadiaoutpost/oa/research
	name = "Biocogitatum"
	icon_state = "research"

/area/cadiaoutpost/oa/research/robotics
	name = "Cybersmithy"
	icon_state = "robotics"

/area/cadiaoutpost/oa/research/xenobiology
	name = "Sanctum Biologis"
	icon_state = "green"

/area/cadiaoutpost/oa/research/toxins
	name = "Toxins"
	icon_state = "toxins"

/area/cadiaoutpost/oa/research/toxins/toxinlab
	name = "toxin lab"
	icon_state = "toxlab"

/area/cadiaoutpost/oa/research/toxins/toxintest
	name = "Toxin Test"
	icon_state = "toxtest"

/area/cadiaoutpost/oa/research/toxins/toxinstorage
	name = "Toxin Storage"
	icon_state = "toxstorage"

/////////////////////////////////////
/////////////Service/////////////////
/////////////////////////////////////

/area/cadiaoutpost/oa/service
	name = "service"
	icon_state = "grey"

/area/cadiaoutpost/oa/service/bar
	name = "The Maltese Falcon"
	icon_state = "bar"

/area/cadiaoutpost/oa/service/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/cadiaoutpost/oa/service/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/cadiaoutpost/oa/service/chapel
	name = "Chapel"
	icon_state = "chapel"
	music = 'sound/music/monastary.ogg'
/area/cadiaoutpost/oa/service/chapel/chapeloffice
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/cadiaoutpost/oa/service/janitor
	name = "Janitor"
	icon_state = "janitor"

/area/cadiaoutpost/oa/service/theatre
	name = "Theatre"
	icon_state = "theatre"

/area/cadiaoutpost/oa/service/library
	name = "Library"
	icon_state = "library"

/area/cadiaoutpost/oa/service/library/lounge
	name = "Lounge"
	icon_state = "library"

/area/cadiaoutpost/oa/service/kitchen/cafeteria
	name = "cafeteria"
	icon_state = "cafeteria"

/area/cadiaoutpost/oa/service/lawoffice
	name = "Law Office"
	icon_state = "law"

/area/cadiaoutpost/oa/service/inn
	name = "Village Inn"
	icon_state = "inn"
	music = 'sound/music/inn.ogg'
	dynamic_lighting = 1
	requires_power = 0

/////////////////////////////////////////
//////////////////Supply////////////////
////////////////////////////////////////
/area/cadiaoutpost/oa/supply
	name = "Supply"
	icon_state = "brown"

/area/cadiaoutpost/oa/supply/cargo
	name = "Cargo"
	icon_state = "cargo"

/area/cadiaoutpost/oa/supply/cargo/quartoffice
	name = "Quartermaster office"
	icon_state = "quartoffice"

/area/cadiaoutpost/oa/supply/cargo/warehouse
	name = "Warehouse"
	icon_state = "warehouse"

/area/cadiaoutpost/oa/supply/cargo/office
	name = "Cargo Office"
	icon_state = "cargo_office"

/area/cadiaoutpost/oa/supply/cargo/mailroom
	name = "Mail Room"
	icon_state = "mailroom"

/area/cadiaoutpost/oa/supply/cargo/lobby
	name = "Cargo Lobby"
	icon_state = "cargo_lobby"

/area/cadiaoutpost/oa/supply/cargo/cargobreak
	name = "Cargo Breakroom"
	icon_state = "cargo_break"

/area/cadiaoutpost/oa/supply/disposal
	name = "Disposal"
	icon_state = "disposal"

/area/cadiaoutpost/oa/supply/mining
	name = "Mining"
	icon_state = "mining"

/area/cadiaoutpost/oa/supply/mining/eva
	name = "Mining Eva"
	icon_state = "mining_eva"

/area/cadiaoutpost/oa/supply/mining/miningliving
	name = "mining Living"
	icon_state = "mining_living"

/area/cadiaoutpost/oa/supply/mining/explored
	name = "Mining Explored"
	icon_state = "explored"

/area/cadiaoutpost/oa/supply/mining/unexplored
	name = "Mining Unexplored"
	icon_state = "unexplored"

/area/cadiaoutpost/oa/supply/mining/miningproduction
	name = "Mining Production"
	icon_state = "mining_production"

/area/cadiaoutpost/oa/supply/mining/office
	name = "Mining Office"
	icon_state = "mining_office"

/area/cadiaoutpost/oa/supply/mining/miningbreak
	name = "Mining Breakroom"
	icon_state = "mining_break"

/area/cadiaoutpost/oa/farm
	name = "Farm"
	icon_state = "farm"
	requires_power = 0
	dynamic_lighting = 1

/area/cadiaoutpost/oa/groxpen
	name = "groxpen"
	icon_state = "farm"
	requires_power = 0
	dynamic_lighting = 1

/area/cadiaoutpost/oa/tradefloor
	name = "Trade Floor"
	icon_state = "tradefloor"
	requires_power = 0
////////////////////////////////////////
//////////Maintenance//////////////////
//////////////////////////////////////
/area/cadiaoutpost/oa/maintenance
	name = "Maintenance"
	icon_state = "maintenance"
	requires_power = 0

/area/cadiaoutpost/oa/maintenance/south
	name = "south"
	icon_state = "southmaint"

/area/cadiaoutpost/oa/maintenance/south/second
	name = "south Secondary"
	icon_state = "southmaint2"

/area/cadiaoutpost/oa/maintenance/central
	name = "Central"
	icon_state = "maintcentral"

/area/cadiaoutpost/oa/maintenance/central/second
	name = "Central Secondary"
	icon_state = "maintcentral2"

/area/cadiaoutpost/oa/maintenance/department
	name = "Department"
	icon_state = "maint_department"

/area/cadiaoutpost/oa/maintenance/department/bridge
	name = "Bridge Maintenance"
	icon_state = "maint_bridge"

/area/cadiaoutpost/oa/maintenance/department/supply
	name = "Supply"
	icon_state = "brown"

/area/cadiaoutpost/oa/maintenance/department/supply/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/cadiaoutpost/oa/maintenance/department/service/chapel
	name = "Chapel Maintenance"
	icon_state = "maint_chapel"

/area/cadiaoutpost/oa/maintenance/department/service/chapel/monastery
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/cadiaoutpost/oa/maintenance/department/crewquarters
	name = "Crew Quarters Maintenance"
	icon_state = "maint_crew"

/area/cadiaoutpost/oa/maintenance/department/service/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/cadiaoutpost/oa/maintenance/department/crewquarters/dorms
	name = "Dorms Maintenance"
	icon_state = "maint_dorms"

/area/cadiaoutpost/oa/maintenance/department/engineering
	name = "engineering Maintenance"
	icon_state = "maint_engineering"

/area/cadiaoutpost/oa/maintenance/department/engineering/electrical
	name = "Electrical Maintenance"
	icon_state = "maint_electrical"

/area/cadiaoutpost/oa/maintenance/department/engineering/engine
	name = "Engine Maintenance"
	icon_state = "maint_engine"

/area/cadiaoutpost/oa/maintenance/department/engineering/atmos
	name = "Atmos Maintenance"
	icon_state = "maint_atmos"

/area/cadiaoutpost/oa/maintenance/department/engineering/engine/turbine
	name = "Turbine Maintenance"
	icon_state = "maint_turbine"

/area/cadiaoutpost/oa/maintenance/department/eva
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/cadiaoutpost/oa/maintenance/department/medical
	name = "Medical Maintenance"
	icon_state = "maint_medbay"

/area/cadiaoutpost/oa/maintenance/department/medical/morgue
	name = "Morgue Maintenance"
	icon_state = "maint_morgue"

/area/cadiaoutpost/oa/maintenance/department/science
	name = "Science Maintenance"
	icon_state = "maint_sci"

/area/cadiaoutpost/oa/maintenance/department/science/xenobiology
	name = "Xenobiology Maintenance"
	icon_state = "maint_xenobio"

/area/cadiaoutpost/oa/maintenance/department/security
	name = "Security Maintenance"
	icon_state = "maint_sec"

/area/cadiaoutpost/oa/maintenance/department/security/brig
	name = "Brig Maintenance"
	icon_state = "maint_brig"

/area/cadiaoutpost/oa/maintenance/department/security/prison
	name = "Prison Maintenance"
	icon_state = "maint_prison"

/area/cadiaoutpost/oa/maintenance/department/supply/cargo/mining
	name = "Mining Maintenance"
	icon_state = "maint_mining"

/area/cadiaoutpost/oa/maintenance/north
	name = "North"
	icon_state = "nmaint"

/area/cadiaoutpost/oa/maintenance/north/second
	name = "North Secondary"
	icon_state = "nmaint2"

/area/cadiaoutpost/oa/maintenance/west/northwest
	name = "Northwest"
	icon_state = "nwmaint"

/area/cadiaoutpost/oa/maintenance/west
	name = "West"
	icon_state = "wmaint"

/area/cadiaoutpost/oa/maintenance/west/southwest
	name = "Southwest"
	icon_state = "swmaint"

/area/cadiaoutpost/oa/maintenance/east
	name = "East"
	icon_state = "emaint"

/area/cadiaoutpost/oa/maintenance/east/northeast
	name = "Northeast"
	icon_state = "semaint"

/area/cadiaoutpost/oa/maintenance/east/southeast
	name = "Southeast"
	icon_state = "semaint"

//////////////////////////////////
///////Public Crew rooms/////////
//////////////////////////////////
/area/cadiaoutpost/oa/crew_quarters
	name = "Crew Quarters"
	icon_state = "crew_quarters"

/area/cadiaoutpost/oa/crew_quarters/dorms
	name = "Dormitory"
	icon_state = "Sleep"

/area/cadiaoutpost/oa/crew_quarters/fitness
	name = "Fitness"
	icon_state = "fitness"

/area/cadiaoutpost/oa/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/cadiaoutpost/oa/crew_quarters/lounge
	name = "Lounge"
	icon_state = "lounge"

/area/cadiaoutpost/oa/crew_quarters/toilet
	name = "Toilet"
	icon_state = "toilet"

/area/cadiaoutpost/oa/crew_quarters/cryopods
	name = "Cryopods"
	icon_state = "cryopods"

////////////////////////////////////
////////////Tcommsat////////////////
///////////////////////////////////

/area/cadiaoutpost/oa/Telecomms
	name = "Telecommunications"
	icon_state = "tcomsatcham"

/area/cadiaoutpost/oa/Telecomms/entrance
	name = "Telecomm Entrance"
	icon_state = "tcomsatentrance"

/area/cadiaoutpost/oa/Telecomms/lobby
	name = "Telecomm Lobby"
	icon_state = "tcomsatlob"

/area/cadiaoutpost/oa/Telecomms/Control
	name = "Control Room"
	icon_state = "tcomsatcomp"

/area/cadiaoutpost/oa/Telecomms/Server
	name = "Telecomms server room"
	icon_state = "tcomsatcham"

///////////////////////////
////////Storage////////////
//////////////////////////

/area/cadiaoutpost/oa/storage
	name = "Storage"
	icon_state = "storage"

/area/cadiaoutpost/oa/storage/primary
	name = "Primary Storage"
	icon_state = "primary_storage"

/area/cadiaoutpost/oa/storage/primary/auxiliary
	name = "Auxiliary Storage"
	icon_state = "aux_storage"

/area/cadiaoutpost/oa/storage/art
	name = "Art Storage"
	icon_state = "art_storage"

/area/cadiaoutpost/oa/storage/eva
	name = "EVA Storage"
	icon_state = "eva_storage"

/area/cadiaoutpost/oa/storage/tech
	name = "Tech Storage"
	icon_state = "tech_storage"

/area/cadiaoutpost/oa/storage/tech/secure
	name = "Secure Tech Storage"
	icon_state = "securetech_storage"

/area/cadiaoutpost/oa/storage/tcomm
	name = "Tcomm Storage"
	icon_state = "tecomm_storage"

/area/cadiaoutpost/oa/vault
	name = "Vault"
	icon_state = "vault"
	requires_power = 0

///////////////////////////
/////////Antagonists////////
////////////////////////////

/area/cadiaoutpost/oa/antagonist
	name = "Antagonist"
	icon_state = ""

/area/cadiaoutpost/oa/antagonist/syndicate
	name = ""
	icon_state = ""
/area/cadiaoutpost/oa/antagonist/syndicate/syndie_ship
	name = "Syndicate Ship"
	icon_state = "syndie-ship"

/area/cadiaoutpost/oa/antagonist/syndicate/syndie_control
	name = "Syndicate Control"
	icon_state = "syndie-control"

/area/cadiaoutpost/oa/antagonist/syndicate/syndie_elite
	name = "Syndicate Elite"
	icon_state = "syndie-elite"

/area/cadiaoutpost/oa/antagonist/wizard
	name = "Wizards Den"
	icon_state = "yellow"

/area/cadiaoutpost/oa/antagonist/plague
	name = "Nurgle's Fetid Pool"
	icon_state = "sickly_green"

/area/cadiaoutpost/oa/antagonist/tyranid
	name = "Spore pod"
	icon_state = "tyranid_red"


////////////////////////////////
///////////Shuttle//////////////
///////////////////////////////

/area/cadiaoutpost/oa/shuttle
	name = "Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/arrival
	name = "Arrivals Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/assultpod
	name = "Assult Pod"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/custom
	name = "Custom Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/escape
	name = "Escape Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/labor
	name = "Labor Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/mining
	name = "Mining Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/mining/large
	name = "Large Mining Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/pirate
	name = "Pirate Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/pod_1
	name = "Escape Pod 1"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/pod_2
	name = "Escape Pod 2"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/pod_3
	name = "Escape Pod 3"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/pod_4
	name = "Escape Pod 4"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/supply
	name = "Supply Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate
	name = "Syndicate Shuttle"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate/airlock
	name = "Syndicate Infiltrator Airlock"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate/armory
	name = "Syndicate Infiltrator Armory"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate/bridge
	name = "Syndicate Infiltrator Bridge"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate/eva
	name = "Syndicate Infiltrator EVA"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate/hallway
	name = "Syndicate Infiltrator Hallway"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate/medical
	name = "Syndicate Infiltrator Medical"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/syndicate_scout
	name = "Syndicate Scout"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/transit
	name = "Hyperspace"
	icon_state = "shuttle"

/area/cadiaoutpost/oa/shuttle/transport
	name = "Transport Shuttle"
	icon_state = "shuttle"

//village
/area/cadiaoutpost/oa/village
	name = "Village"
	icon_state = "village"
	music = 'sound/music/village.ogg'
	requires_power = 0
	dynamic_lighting = 1

/area/cadiaoutpost/oa/gatehouse
	name = "Gatehouse"
	icon_state = "gatehouse"
	requires_power = 0
	dynamic_lighting = 1


//forest
/area/cadiaoutpost/oa/theforest
	name = "The Forest"
	icon_state = "forest"
	requires_power = 0
	dynamic_lighting = 1
	music = 'sound/ambience/forest.ogg'


/area/cadiaoutpost/oa/magistratumpost
	name = "Forward Magistratum Post"
	icon_state = "forwardpost"
	requires_power = 0
	dynamic_lighting = 1

/area/cadiaoutpost/oa/theforest/Entered(mob/living/L,  atom/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/theforest))//Doesn't work but this does stop the lag.
		L.overlay_fullscreen("snowfall_heavy_old", /obj/screen/fullscreen/snowstorm)

/area/cadiaoutpost/oa/theforest/Exited(mob/living/L, area/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/theforest))
		L.clear_fullscreen("snowfall_heavy_old")

/area/cadiaoutpost/oa/village/Entered(mob/living/L,  atom/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/village))//Doesn't work but this does stop the lag.
		L.overlay_fullscreen("snowfall_heavy_old", /obj/screen/fullscreen/snowstorm)

/area/cadiaoutpost/oa/village/Exited(mob/living/L, area/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/village))
		L.clear_fullscreen("snowfall_heavy_old")

/area/cadiaoutpost/oa/villageinside //just so snow doesn't come inside
	name = "Inside Village"
	icon_state = "village"
	music = 'sound/music/village.ogg'
	requires_power = 0
	dynamic_lighting = 1


/area/cadiaoutpost/oa/farm/Entered(mob/living/L,  atom/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/farm))//Doesn't work but this does stop the lag.
		L.overlay_fullscreen("snowfall_heavy_old", /obj/screen/fullscreen/snowstorm)

/area/cadiaoutpost/oa/farm/Exited(mob/living/L, area/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/farm))
		L.clear_fullscreen("snowfall_heavy_old")


//Various Faction ships
/area/cadiaoutpost/oa/tauship
	name = "Tau Ship"
	icon_state = "tauship"
	requires_power = 0
	dynamic_lighting = 1