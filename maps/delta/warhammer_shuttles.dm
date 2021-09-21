///////////Shuttles/////////

/datum/shuttle/autodock/ferry/inquisition
	name = "Inquisition"
	warmup_time = 10
	waypoint_station = "inquisition_start"
	waypoint_offsite = "inquisition_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/inquisition

/obj/effect/shuttle_landmark/ferry/inquisition_end
	name = "Planet"
	landmark_tag = "inquisition_end"
	base_area = /area/cadiaoutpost/oa/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/ferry/inquisition_start
	name = "Moon"
	landmark_tag = "inquisition_start"
	base_area = /area/inqmoon
	base_turf = /turf/simulated/floor/plating/reinforced

/obj/machinery/computer/shuttle_control/ferry/inquisition
	name = "Shuttle Control Console"
	shuttle_tag = "Inquisition"