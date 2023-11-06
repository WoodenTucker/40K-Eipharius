///////////Shuttles/////////

/datum/shuttle/autodock/ferry/inquisition
	name = "Inquisition"
	warmup_time = 20
	waypoint_station = "inquisition_start"
	waypoint_offsite = "inquisition_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/inquisition

/obj/effect/shuttle_landmark/ferry/inquisition_end
	name = "Black Ship Simiel's Hanger"
	landmark_tag = "inquisition_end"
	base_area = /area/cadiaoutpost/oa/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/inquisition_start
	name = "Messina Landing Pad"
	landmark_tag = "inquisition_start"
	base_area = /area/inqmoon
	base_turf = /turf/simulated/floor/plating/reinforced

/obj/machinery/computer/shuttle_control/ferry/inquisition
	name = "Shuttle Control Console"
	shuttle_tag = "Inquisition"

//
/datum/shuttle/autodock/ferry/roguet
	name = "roguet"
	warmup_time = 20
	waypoint_station = "roguet_start"
	waypoint_offsite = "roguet_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/roguet

/obj/effect/shuttle_landmark/ferry/roguet_end
	name = "landing pad"
	landmark_tag = "roguet_end"
	base_area = /area/cadiaoutpost/rtship2
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/roguet_start
	name = "roguet ship"
	landmark_tag = "roguet_start"
	base_area = /area/cadiaoutpost/rtship1
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/roguet
	name = "Shuttle Control Console"
	shuttle_tag = "roguet"
//
/datum/shuttle/autodock/ferry/mechiferry
	name = "mechiferry"
	warmup_time = 10
	waypoint_station = "mechiferry_start"
	waypoint_offsite = "mechiferry_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/mechiferry

/obj/effect/shuttle_landmark/ferry/mechiferry_end
	name = "landing pad"
	landmark_tag = "mechiferry_end"
	base_area = /area/cadiaoutpost/mechiferry2
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/mechiferry_start
	name = "mechiferry"
	landmark_tag = "mechiferry_start"
	base_area = /area/cadiaoutpost/mechiferry1
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/mechiferry
	name = "Shuttle Control Console"
	shuttle_tag = "mechiferry"
//

/datum/shuttle/autodock/ferry/governor
	name = "governor"
	warmup_time = 20
	waypoint_station = "governor_start"
	waypoint_offsite = "governor_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/governor

/obj/effect/shuttle_landmark/ferry/governor_end
	name = "landing pad"
	landmark_tag = "governor_end"
	base_area = /area/cadiaoutpost/govship1
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/governor_start
	name = "governor ship"
	landmark_tag = "governor_start"
	base_area = /area/cadiaoutpost/govship2
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/governor
	name = "Shuttle Control Console"
	shuttle_tag = "governor"

/datum/shuttle/autodock/ferry/magos
	name = "magos"
	warmup_time = 10
	waypoint_station = "magos_start"
	waypoint_offsite = "magos_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/magos

/obj/effect/shuttle_landmark/ferry/magos_end
	name = "landing pad"
	landmark_tag = "magos_end"
	base_area = /area/cadiaoutpost/magosship1
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/magos_start
	name = "magos ship"
	landmark_tag = "magos_start"
	base_area = /area/cadiaoutpost/magosship2
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/magos
	name = "Shuttle Control Console"
	shuttle_tag = "magos"

/datum/shuttle/autodock/ferry/bloodpact
	name = "Bloodpact"
	warmup_time = 20
	waypoint_station = "bloodpact_start"
	waypoint_offsite = "bloodpact_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/inquisitionpact

/obj/effect/shuttle_landmark/ferry/bloodpact_end
	name = "Messina Blood Pact Hanger"
	landmark_tag = "bloodpact_end"
	base_area = /area/cadiaoutpost/oa/hangarpact2
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/bloodpact_start
	name = "Derelict Blood Pact Station"
	landmark_tag = "bloodpact_start"
	base_area = /area/cadiaoutpost/oa/hangarpact2
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/bloodpact
	name = "Shuttle Control Console"
	shuttle_tag = "Bloodpact"

// toasters
/datum/shuttle/autodock/ferry/mechanicus
	name = "mechanicus"
	warmup_time = 10
	waypoint_station = "mechanicus_start"
	waypoint_offsite = "mechanicus_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/mechanicus

/obj/effect/shuttle_landmark/ferry/mechanicus_end
	name = "Messina Mechanicus Hanger"
	landmark_tag = "mechanicus_end"
	base_area = /area/cadiaoutpost/oa/hangarmech
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/mechanicus_start
	name = "The Soul of Reason Hanger"
	landmark_tag = "mechanicus_start"
	base_area = /area/cadiaoutpost/oa/hangarmech
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/mechanicus
	name = "Shuttle Control Console"
	shuttle_tag = "mechanicus"






/datum/shuttle/autodock/ferry/tau
	name = "tau1"
	warmup_time = 20
	waypoint_station = "tau_start"
	waypoint_offsite = "tau_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/tau1

/obj/effect/shuttle_landmark/ferry/tau_end
	name = "Tau Messina Landing Pad"
	landmark_tag = "tau_end"
	base_area = /area/cadiaoutpost/oa/shuttle/tau2
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/tau_start
	name = "Tau Cruiser Hanger"
	landmark_tag = "tau_start"
	base_area = /area/cadiaoutpost/oa/shuttle/tau2
	base_turf = /turf/simulated/floor/plating

/obj/machinery/computer/shuttle_control/ferry/tau
	name = "Tau Ship Console"
	shuttle_tag = "tau1"

/datum/shuttle/autodock/ferry/cargo
	name = "Cargo1"
	warmup_time = 20
	waypoint_station = "cargo_start"
	waypoint_offsite = "cargo_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/cargo1

/obj/effect/shuttle_landmark/ferry/cargo_end
	name = "PlanetCargo"
	landmark_tag = "cargo_end"
	base_area = /area/cadiaoutpost/oa/shuttle/cargo2
	base_turf = /turf/simulated/floor/tiled/dark

/obj/effect/shuttle_landmark/ferry/cargo_start
	name = "MoonCargo"
	landmark_tag = "cargo_start"
	base_area = /area/cadiaoutpost/oa/shuttle/cargo2
	base_turf = /turf/simulated/floor/tiled/dark

/obj/machinery/computer/shuttle_control/ferry/cargo
	name = "Cargo Elevator Console"
	shuttle_tag = "Cargo1"






/datum/shuttle/autodock/ferry/aquila
	name = "Rogue Trader's Aquila Lander"
	warmup_time = 15
	waypoint_station = "aquila_castle"
	waypoint_offsite = "aquila_village"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/aquila

/obj/effect/shuttle_landmark/ferry/aquila_castle
	name = "Rogue Trader's Castle"
	landmark_tag = "aquila_castle"
	base_area = /area/cadiaoutpost/oa/theforest
	base_turf = /turf/simulated/floor/snow

/obj/effect/shuttle_landmark/ferry/aquila_village
	name = "Rogue Trader's Castle"
	landmark_tag = "aquila_village"
	base_area = /area/cadiaoutpost/oa/theforest
	base_turf = /turf/simulated/floor/snow

/obj/machinery/computer/shuttle_control/ferry/aquila
	name = "Aquila Lander Control Console"
	shuttle_tag = "Rogue Trader's Aquila Lander"