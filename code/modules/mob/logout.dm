/mob/Logout()
	var/mob/living/carbon/human/player = src
	sql_report_played_time(player)
	player.time_alive = 0 //When a player closes the client their played time is reported, their time_alive is set to 0 to prevent duping/gaming it in the DB -wel
	SSnanoui.user_logout(src) // this is used to clean up (remove) this user's Nano UIs
	SStgui && SStgui.on_logout(src)
	GLOB.player_list -= src
	log_access("Logout: [key_name(src)]")
	hide_client_images()
	..()

	my_client = null
	return 1
