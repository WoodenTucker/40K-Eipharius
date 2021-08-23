///////////Shuttles\\\\\\\\\\\

/datum/shuttle/autodock/ferry/inquisition
	name = "Inquisition"
	warmup_time = 10
	waypoint_station = "inquisition_start"
	waypoint_offsite = "inquisition_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/inquisition

/obj/effect/shuttle_landmark/ferry/inquisition_end
	name = "Space"
	landmark_tag = "inquisition_end"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/ferry/inquisition_start
	name = "Planet"
	landmark_tag = "inquisition_start"
	base_area = /area/cadiaoutpost/oa/theforest
	base_turf = /turf/simulated/floor/snow

/obj/machinery/computer/shuttle_control/ferry/inquisition
	name = "Shuttle Control Console"
	shuttle_tag = "Inquisition"