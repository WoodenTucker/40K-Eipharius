///////////Shuttles//////////

/datum/shuttle/autodock/ferry/inquisition
	name = "Inquisition"
	warmup_time = 10
	waypoint_station = "inquisition_start"
	waypoint_offsite = "inquisition_end"
	ceiling_type = /turf/simulated/floor/reinforced
	shuttle_area = /area/cadiaoutpost/oa/shuttle/inquisition

/obj/effect/shuttle_landmark/ferry/inquisition_start
	name = "Planet"
	landmark_tag = "inquisition_start"
	base_area = /area/cadiaoutpost/oa/city
	base_turf = /turf/simulated/floor/snow

/obj/effect/shuttle_landmark/ferry/inquisition_end
	name = "Inquisitorial Ship"
	landmark_tag = "inquisition_end"
	base_area = /area/inqmoon
	base_turf = /turf/simulated/floor

/obj/machinery/computer/shuttle_control/ferry/inquisition
	name = "Shuttle Control Console"
	shuttle_tag = "Inquisition"

/datum/shuttle/autodock/multi/monorail
	name = "Monorail"
	warmup_time = 9
	destination_tags = list(
        "nav_cadia",
        "nav_village",
        "nav_mechanicus"
        )
	shuttle_area = /area/cadiaoutpost/oa/shuttle/monorail
	current_location = "nav_cadia"

	/obj/effect/shuttle_landmark/multi/monorail_cadia
		name = "Cadia"
		landmark_tag = "nav_cadia"
		base_area = /area/cadiaoutpost/oa/shiptest
		base_turf = /turf/simulated/floor

	/obj/effect/shuttle_landmark/multi/monorail_village
		name = "Village"
		landmark_tag = "nav_village"
		base_area = /area/cadiaoutpost/oa/shiptest
		base_turf = /turf/simulated/floor
	
	/obj/effect/shuttle_landmark/multi/monorail_mechanicus
		name = "Village"
		landmark_tag = "nav_mechanicus"
		base_area = /area/cadiaoutpost/oa/shiptest
		base_turf = /turf/simulated/floor

	/obj/machinery/computer/shuttle_control/multi/monorail
		name = "Monorail Control Console"
		shuttle_tag = "Monorail"

/datum/shuttle/autodock/ferry/evacshuttle
	name = "Evacshuttle"
	warmup_time = 10
	waypoint_station = "evacshuttle_start"
	waypoint_offsite = "evacshuttle_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/evacshuttle

	/obj/effect/shuttle_landmark/ferry/evacshuttle_start
		name = "Rogue Traders Mothership"
		landmark_tag = "evacshuttle_start"
		base_area = /area/cadiaoutpost/oa/rtship
		base_turf = /turf/simulated/floor

	/obj/effect/shuttle_landmark/ferry/evacshuttle_end
		name = "Cadia"
		landmark_tag = "evacshuttle_end"
		base_area = /area/cadiaoutpost/oa/theforest
		base_turf = /turf/simulated/floor/snow

	/obj/machinery/computer/shuttle_control/ferry/evacshuttle
		name = "Evacshuttle Control Console"
		shuttle_tag = "Evacshuttle"

/datum/shuttle/autodock/ferry/mechrail
	name = "Mechanicus Monorail"
	warmup_time = 9
	waypoint_station = "mechrail_start"
	waypoint_offsite = "mechrail_end"
	shuttle_area = /area/cadiaoutpost/oa/shuttle/mechrail

	/obj/effect/shuttle_landmark/ferry/mechrail_start
		name = "Cadia"
		landmark_tag = "mechrail_start"
		base_area = /area/cadiaoutpost/oa/shiptest
		base_turf = /turf/simulated/floor

	/obj/effect/shuttle_landmark/ferry/mechrail_end
		name = "Mechanicus Outpost"
		landmark_tag = "mechrail_end"
		base_area = /area/cadiaoutpost/oa/shiptest
		base_turf = /turf/simulated/floor

	/obj/machinery/computer/shuttle_control/ferry/mechrail
		name = "Mechanicus Monorail Control Console"
		shuttle_tag = "Mechanicus Monorail"