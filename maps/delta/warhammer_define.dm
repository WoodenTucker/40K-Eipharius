
/datum/map/warhammer
	name = "Eipharius"
	full_name = "Eipharius"
	path = "warhammer"
	station_name  = "Greater Messia"
	station_short = "Eipharius"
	dock_name     = "Eipharius"
	boss_name     = "Command"
	boss_short    = "SC"
	company_name  = "Imperium of Man"
	company_short = "Imperium"
	system_name = "Helican Subsector"

	lobby_icon = 'maps/delta/fullscreen.dmi'
	lobby_screens = list("lobby1","lobby2","lobby3","lobby4")

	station_levels = list(1,2,3,4,5,6,7,8)
	contact_levels = list(1,2,3,4,5,6,7,8)
	player_levels = list(1,2,3,4,5,6,7,8)

	allowed_spawns = list("Arrivals Shuttle")
	base_turf_by_z = list("1" = /turf/simulated/floor/dirty, "2" = /turf/simulated/floor/dirty, "3" = /turf/simulated/floor/dirty,"4" = /turf/simulated/floor/dirty)
	shuttle_docked_message = "The slipstream has been opened."
	shuttle_leaving_dock = "The slipstream is closing."
	shuttle_called_message = "A requested slipstream is being opened."
	shuttle_recall_message = "The slipstream opening has been aborted"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"
	map_lore = "Welcome to Messia, an ice world on the fringes of Imperial Space. Gravitic storms rage relentlessly, and cosmic collisions have scarred the land. The rogue star's chaotic dance with Pymbyle Minor adds to the pervasive sense of instability. The city of Messina is a twisted monument to opulence and power, reclaimed from grotesque ruins by the Lord Governor and their wealthy benefactors. Its ancient structures, once forged by war, are now adorned with decadent excess, masking the corruption that festers beneath the surface."



//Overriding event containers to remove random events.
/datum/event_container/mundane
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,5),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Carp",/datum/event/carp_migration,5),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None2",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None3",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None4",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None5",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None6",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None7",/datum/event/no_event,25)
		)

/datum/event_container/moderate
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,10),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None2",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None3",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None3",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None4",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None5",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None6",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None7",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Gravity",/datum/event/gravity,10)
	)

/datum/event_container/major
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,25),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Carp",/datum/event/carp_migration,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None2",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None3",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None3",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None4",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None5",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None6",/datum/event/no_event,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "None7",/datum/event/no_event,25)
	)
