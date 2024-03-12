
/datum/map/warhammer
	name = "Warhammer"
	full_name = "Warhammer 40k"
	path = "warhammer"
	station_name  = "The Spirit of Cadia"
	station_short = "Cadia"
	dock_name     = "Cadia"
	boss_name     = "Segmentum Command"
	boss_short    = "SC"
	company_name  = "Segmentum Ultima"
	company_short = "SU"
	system_name = "Helican Subsector"

	lobby_icon = 'maps/warhammer/fullscreen.dmi'
	lobby_screens = list("lobby1","lobby2","lobby3","lobby4","lobby5", "lobby6")

	station_levels = list(1,2,3,4)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)

	allowed_spawns = list("Arrivals Shuttle")
	base_turf_by_z = list("1" = /turf/simulated/floor/dirty, "2" = /turf/simulated/floor/dirty, "3" = /turf/simulated/floor/dirty,"4" = /turf/simulated/floor/dirty)
	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"
	map_lore = "A Rogue Trader has established this outpost to further the reach of the Imperium of Man. We have been stationed here for the past few months without incident, though the guardsmen have begun to worry following the arrival of the black ship 'Simiel' Inquisitorial Agents. Time will tell what this means, the Agents themselves are cryptic and do not associate with us. Some of my fellow Guardsmen have been disappearing, though when asked about, our Commissar simply refers to them as cowards."



//Overriding event containers to remove random events.
/datum/event_container/mundane
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Carp",/datum/event/carp_migration,25)
		)

/datum/event_container/moderate
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,50),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,50)
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Gravity",/datum/event/gravity,50)
	)

/datum/event_container/major
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,75),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars",/datum/event/mortar,75),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Carp",/datum/event/carp_migration,75),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Zombies",/datum/event/zombies,75)
	)
