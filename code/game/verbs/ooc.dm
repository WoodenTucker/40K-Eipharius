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
