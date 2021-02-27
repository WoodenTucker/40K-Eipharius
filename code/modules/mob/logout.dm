/mob/Logout()
	SSnanoui.user_logout(src) // this is used to clean up (remove) this user's Nano UIs
	SStgui && SStgui.on_logout(src)
	GLOB.player_list -= src
	log_access("Logout: [key_name(src)]")
	hide_client_images()
	..()

	my_client = null
	return 1
