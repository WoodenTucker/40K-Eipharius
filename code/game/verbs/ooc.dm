/client/verb/ooc(message as text)
	set name = "OOC"
	set category = "OOC"

	sanitize_and_communicate(/decl/communication_channel/ooc, src, message)

/client/verb/looc(message as text)
	set name = "LOOC"
	set desc = "Local OOC, seen only by those in view. Remember: Just because you see someone that doesn't mean they see you."
	set category = "OOC"

	sanitize_and_communicate(/decl/communication_channel/ooc/looc, src, message)

/mob/living/verb/toggleMusic()
	set name = "Toggle Music"
	set desc = "Allows you to toggle ambient music."
	set category = "OOC"

	if(src.music_on == 1)
		src.music_on = 0
		to_chat(src, "Ambient music disabled.")
		src.change_current_ambience(null)
	else
		src.music_on = 1
		to_chat(src, "Ambient music enabled.")


/client/verb/playedTime()
	set name = "View Played Time"
	set desc = "See how long you've played!"
	set category = "OOC"

	establish_db_connection()
	if(!dbcon.IsConnected())
		to_chat(src, "DB connection failed! Tell an admeme!")
		return

	var/DBQuery/query = dbcon.NewQuery("SELECT time_living FROM playtime_history WHERE ckey='[src.ckey]'")
	query.Execute()
	while(query.NextRow())
		var/playedTime = query.item[1]
		playedTime = text2num(playedTime)
		playedTime = playedTime/60
		to_chat(src, "[playedTime] hours played")
		break