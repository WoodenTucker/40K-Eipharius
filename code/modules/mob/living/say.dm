var/list/department_radio_keys = list(
	  ":r" = "right ear",	".r" = "right ear",
	  ":l" = "left ear",	".l" = "left ear",
	  ":i" = "Inquisition",	".i" = "Inquisition",
	  ":h" = "department",	".h" = "department",
	  ":+" = "special",		".+" = "special", //activate radio-specific special functions
	  ":c" = "Command",		".c" = "Command",
	  ":n" = "Ecclesiarchy",".n" = "Ecclesiarchy",
	  ":m" = "Medical",		".m" = "Medical",
	  ":e" = "Mechanicus", ".e" = "Mechanicus",
	  ":s" = "Security",	".s" = "Security",
	  ":w" = "whisper",		".w" = "whisper",
	  ":t" = "Mercenary",	".t" = "Mercenary",
	  ":x" = "Tyranids",		".x" = "Tyranids",
	  ":u" = "Magistratum",		".u" = "Magistratum",
	  ":v" = "Guardsmen",		".v" = "Guardsmen",
	  ":d" = "Delta",	".d" = "Delta",
	  ":p" = "AI Private",	".p" = "AI Private",
	  ":z" = "Entertainment",".z" = "Entertainment",
	  ":y" = "Exploration",	".y" = "Exploration",
	  ":b" = "Blue", 		".b" = "Blue",
	  ";" = "Imperial", 		".;" = "Imperial",
	  ":a" = "Alpha", 		".a" = "Alpha",
	  ":g" = "Bravo", 		".g" = "Bravo",
	  ":o" = "Charlie",		".o" = "Charlie",
	  ":d" = "Delta", 		".d" = "Delta",
	  ":f" = "Blue Alpha", ".f" = "Blue Alpha",
	  ":i" = "Inquisition", ".i" = "Inquisition",
	  ":j" = "Blue Charlie",".j" = "Blue Charlie",
	  ":k" = "Blue Delta", ".k" = "Blue Delta",

	  ":R" = "right ear",	".R" = "right ear",
	  ":L" = "left ear",	".L" = "left ear",
	  ":I" = "Inquisition",	".I" = "Inquisition",
	  ":H" = "department",	".H" = "department",
	  ":C" = "Command",		".C" = "Command",
	  ":N" = "Ecclesiarchy",".N" = "Ecclesiarchy",
	  ":M" = "Medical",		".M" = "Medical",
	  ":E" = "Mechanicus",	".E" = "Mechanicus",
	  ":S" = "Security",	".S" = "Security",
	  ":W" = "whisper",		".W" = "whisper",
	  ":T" = "Mercenary",	".T" = "Mercenary",
	  ":X" = "Tyranids",		".X" = "Tyranids",
	  ":U" = "Magistratum",		".U" = "Magistratum",
	  ":V" = "Guardsmen",		".V" = "Guardsmen",
	  ":D" = "Delta",	".D" = "Delta",
	  ":P" = "AI Private",	".P" = "AI Private",
	  ":Z" = "Entertainment",".Z" = "Entertainment",
	  ":Y" = "Exploration",		".Y" = "Exploration",

	  //kinda localization -- rastaf0
	  //same keys as above, but on russian keyboard layout. This file uses cp1251 as encoding.
	  ":ê" = "right ear",	".ê" = "right ear",
	  ":ä" = "left ear",	".ä" = "left ear",
	  ":ø" = "Inquisition",	".ø" = "Inquisition",
	  ":ð" = "department",	".ð" = "department",
	  ":ñ" = "Command",		".ñ" = "Command",
	  ":ò" = "Ecclesiarchy",".ò" = "Ecclesiarchy",
	  ":ü" = "Medical",		".ü" = "Medical",
	  ":ó" = "Mechanicus",	".ó" = "Mechanicus",
	  ":û" = "Security",	".û" = "Security",
	  ":ö" = "whisper",		".ö" = "whisper",
	  ":å" = "Mercenary",	".å" = "Mercenary",
	  ":é" = "Magistratum",		".é" = "Magistratum",
)


var/list/channel_to_radio_key = new
proc/get_radio_key_from_channel(var/channel)
	var/key = channel_to_radio_key[channel]
	if(!key)
		for(var/radio_key in department_radio_keys)
			if(department_radio_keys[radio_key] == channel)
				key = radio_key
				break
		if(!key)
			key = ""
		channel_to_radio_key[channel] = key

	return key

/mob/living/proc/binarycheck()

	if (istype(src, /mob/living/silicon/pai))
		return

	if (!ishuman(src))
		return

	var/mob/living/carbon/human/H = src
	if (H.l_ear || H.r_ear)
		var/obj/item/device/radio/headset/dongle
		if(istype(H.l_ear,/obj/item/device/radio/headset))
			dongle = H.l_ear
		else
			dongle = H.r_ear
		if(!istype(dongle)) return
		if(dongle.translate_binary) return 1

/mob/living/proc/get_default_language()
	return default_language

/mob/proc/is_muzzled()
	return istype(wear_mask, /obj/item/clothing/mask/muzzle)

//Takes a list of the form list(message, verb, whispering) and modifies it as needed
//Returns 1 if a speech problem was applied, 0 otherwise
/mob/living/proc/handle_speech_problems(var/list/message_data)
	var/message = html_decode(message_data[1])
	var/verb = message_data[2]
	var/mob/living/carbon/human/ogryn = src

	. = 0

	if((HULK in mutations) && health >= 25 && length(message))
		message = "[uppertext(message)]!!!"
		verb = pick("yells","roars","hollers")
		message_data[3] = 0
		. = 1
	if(ogryn.species.name == "Ogryn" && length(message))
		message = ogrynSpeech(uppertext(message))
		verb = pick("yells","roars","hollers")
		. = 1
	if(slurring)
		message = slur(message)
		verb = pick("slobbers","slurs")
		. = 1

	if(lisp)
		message = lisp(message, lisp)
		. = 1

	if(stuttering)
		message = NewStutter(message)//stutter
		verb = pick("stammers","stutters")
		. = 1

	message_data[1] = message
	message_data[2] = verb

/mob/living/proc/handle_message_mode(message_mode, message, verb, speaking, used_radios, alt_name)
	if(message_mode == "intercom")
		for(var/obj/item/device/radio/intercom/I in view(1, null))
			I.talk_into(src, message, verb, speaking)
			used_radios += I
	return 0

/mob/living/proc/handle_speech_sound()
	var/list/returns[2]
	returns[1] = null
	returns[2] = null
	return returns

/mob/living/proc/get_speech_ending(verb, var/ending)
	if(ending=="!")
		return pick("exclaims","shouts","yells")
	if(ending=="?")
		return "asks"
	return verb

/mob/living/say(var/message, var/datum/language/speaking = null, var/verb="says", var/alt_name="", whispering)
	if(client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (Muted).</span>")
			return

	if(stat)
		if(stat == 2)
			return say_dead(message)
		return

	if(GLOB.in_character_filter.len) //&& !forced)
		if(findtext(message, config.ic_filter_regex))
			// let's try to be a bit more informative!
			var/warning_message = "<span class='warning'>Bro you just tried to say cringe! You're going to loose subscriber! Check the server rules!</br>The bolded terms are disallowed: &quot;"
			var/list/words = splittext(message, " ")
			var/cringe = ""
			for (var/word in words)
				if (findtext(word, config.ic_filter_regex))
					warning_message = "[warning_message]<b>[word]</b> "
					cringe += "/<b>[word]</b>"
					//Del(client) //if it ever gets too bad im turning this on
				else
					warning_message = "[warning_message][word] "


			warning_message = trim(warning_message)
			to_chat(src, "[warning_message]&quot;</span>")
			log_and_message_admins("[src] just tried to say cringe: [cringe]", src)
			return

	//if there are phrases this runs
	if(GLOB.ritual_filter.len)
	//searches the say for a ritual phrase
		if(findtext(message, config.ritual_filter_regex))
			find_and_begin_ritual(message, src) //sends our message to begin ritual procs and who is our leader

			//you can remove this log if it gets annoying, its useful for debugging early stages
			log_and_message_admins("[src] said a ritual phrase: [message]", src)



	var/prefix = copytext(message,1,2)
	if(prefix == get_prefix_key(/decl/prefix/custom_emote))
		return emote(copytext(message,2))
	if(prefix == get_prefix_key(/decl/prefix/visible_emote))
		return custom_emote(1, copytext(message,2))

	//parse the radio code and consume it
	var/message_mode = parse_message_mode(message, "headset")
	if (message_mode)
		if (message_mode == "headset")
			message = copytext(message,2)	//it would be really nice if the parse procs could do this for us.
		else
			message = copytext(message,3)

	message = trim_left(message)

	//parse the language code and consume it
	if(!speaking)
		speaking = parse_language(message)
		if(speaking)
			message = copytext(message,2+length(speaking.key))
		else
			speaking = get_default_language()

	// This is broadcast to all mobs with the language,
	// irrespective of distance or anything else.
	if(speaking && (speaking.flags & HIVEMIND))
		speaking.broadcast(src,trim(message))
		return 1

	if (speaking)
		if(whispering)
			verb = speaking.whisper_verb ? speaking.whisper_verb : speaking.speech_verb
		else
			verb = say_quote(message, speaking)

	message = trim_left(message)

	if(!(speaking && (speaking.flags & NO_STUTTER)))
		var/list/message_data = list(message, verb, 0)
		if(handle_speech_problems(message_data))
			message = message_data[1]
			verb = message_data[2]

	if(!message || message == "")
		return 0

	var/list/obj/item/used_radios = new
	if(handle_message_mode(message_mode, message, verb, speaking, used_radios, alt_name))
		return 1

	var/list/handle_v = handle_speech_sound()
	var/sound/speech_sound = handle_v[1]
	var/sound_vol = handle_v[2]

	var/italics = 0
	var/message_range = world.view

	if(whispering)
		italics = 1
		message_range = 1

	//speaking into radios
	if(used_radios.len)
		italics = 1
		message_range = 1
		if(speaking)
			message_range = speaking.get_talkinto_msg_range(message)
		var/msg
		if(!speaking || !(speaking.flags & NO_TALK_MSG))
			msg = "<span class='notice'>\The [src] talks into \the [used_radios[1]]</span>"
		for(var/mob/living/M in hearers(5, src))
			if((M != src) && msg)
				M.show_message(msg)
			if (speech_sound)
				sound_vol *= 0.5

	var/list/listening = list()
	var/list/listening_obj = list()
	var/turf/T = get_turf(src)

	//handle nonverbal and sign languages here
	if (speaking)
		if (speaking.flags & NONVERBAL)
			if (prob(30))
				src.custom_emote(1, "[pick(speaking.signlang_verb)].")

		if (speaking.flags & SIGNLANG)
			log_say("[name]/[key] : SIGN: [message]")
			return say_signlang(message, pick(speaking.signlang_verb), speaking)

	if(T)
		//make sure the air can transmit speech - speaker's side
		var/datum/gas_mixture/environment = T.return_air()
		var/pressure = (environment)? environment.return_pressure() : 0
		if(pressure < SOUND_MINIMUM_PRESSURE)
			message_range = 1

		if (pressure < ONE_ATMOSPHERE*0.4) //sound distortion pressure, to help clue people in that the air is thin, even if it isn't a vacuum yet
			italics = 1
			sound_vol *= 0.5 //muffle the sound a bit, so it's like we're actually talking through contact

		get_mobs_and_objs_in_view_fast(T, message_range, listening, listening_obj, /datum/client_preference/ghost_ears)


	var/speech_bubble_test = say_test(message)
	var/image/speech_bubble = image('icons/mob/talk.dmi',src,"h[speech_bubble_test]")

	// VOREStation Port - Attempt Multi-Z Talking
	var/mob/above = src.shadow
	while(!QDELETED(above))
		var/turf/ST = get_turf(above)
		if(ST)

			get_mobs_and_objs_in_view_fast(ST, world.view, listening, listening_obj, /datum/client_preference/ghost_ears)
			var/image/z_speech_bubble = image('icons/mob/talk.dmi', above, "h[speech_bubble_test]")
			spawn(30) qdel(z_speech_bubble)
		above = above.shadow

	// VOREStation Port End

	var/list/speech_bubble_recipients = list()
	for(var/mob/M in listening)
		if(M)
			M.hear_say(message, verb, speaking, alt_name, italics, src, speech_sound, sound_vol)
			if(M.client)
				speech_bubble_recipients += M.client

	INVOKE_ASYNC(GLOBAL_PROC, .proc/animate_speechbubble, speech_bubble, speech_bubble_recipients, 30)

	for(var/obj/O in listening_obj)
		spawn(0)
			if(O) //It's possible that it could be deleted in the meantime.
				O.hear_talk(src, message, verb, speaking)

	if(whispering)
		var/eavesdroping_range = 5
		var/list/eavesdroping = list()
		var/list/eavesdroping_obj = list()
		get_mobs_and_objs_in_view_fast(T, eavesdroping_range, eavesdroping, eavesdroping_obj)
		eavesdroping -= listening
		eavesdroping_obj -= listening_obj
		for(var/mob/M in eavesdroping)
			if(M)
				show_image(M, speech_bubble)
				M.hear_say(stars(message), verb, speaking, alt_name, italics, src, speech_sound, sound_vol)

		for(var/obj/O in eavesdroping)
			spawn(0)
				if(O) //It's possible that it could be deleted in the meantime.
					O.hear_talk(src, stars(message), verb, speaking)


	if(whispering)
		log_whisper("[name]/[key] : [message]")

	else
		log_say("[name]/[key] : [message]")

		/*
		//Uncomment these if you wish speech to have blip sfx.
		var/list/temp_message = splittext(message, " ") //List each word in the message.

		for(var/i = 0, i < temp_message.len, i++)
			sleep(1)
			playsound(src, "sound/voice/speech/sfx-blip[gender].wav", 20)
		*/

		if(!whispering)
			var/ending = copytext(message, length(message))
			var/sound_key = "m"
			var/sound_end = ""//Blank string by default
			if(gender == FEMALE)
				sound_key = "f"
			if(gender == NEUTER)
				sound_key = "n"
			if(ending=="?")
				sound_end = "_ask"
			if(ending=="!")
				sound_end = "_exclaim"
			playsound(src, "sound/voice/human/[sound_key]speak[sound_end].ogg", 100)//Play the talking sound.

	var/new_message = message//Need a copy of the original message here.

	//Adds punctuation automatically.
	var/ending = copytext(new_message, -1)
	if(!(ending in PUNCTUATION))
		new_message = "[new_message]."

	new_message = replacetext(new_message, "nya", "GLORY TO SLAANESH")//heresy
	new_message = replacetext(new_message, "nigga", "homie")//heresy
	new_message = replacetext(new_message, "nyah", "GLORY TO TZEENTCH")//illuded heresy
	new_message = replacetext(new_message, "nigger", "GLORY TO KHORNE")//illuded heresy
	new_message = replacetext(new_message, "faggot", "Heretic")//illuded heresy
	new_message = replacetext(new_message, "fag", "Gay")//illuded heresy
	new_message = replacetext(new_message, " i ", " I ")//FUCKING USE CAPITAL LETTERS JAMES YOU FUCK!
	new_message = replacetext(new_message, " ive ", " I've ")//I'M SO FUCKING SICK OF SEEING IVE YOU FUCKS
	new_message = replacetext(new_message, " im ", " I'm ")//AND IM TOO! STOP THAT YOU FUCKS!
	new_message = replacetext(new_message, " jesus ", " Emperor ")//STOP USING FUCKING U YOU SICK FUCKS!
	new_message = replacetext(new_message, " christ ", " God-Emperor Of Mankind ")//STOP USING FUCKING U YOU SICK FUCKS!
	new_message = replacetext(new_message, "Afaik", "Army First Aid Kit")//i know that this is wrong but fuck you
	new_message = replacetext(new_message, "lol", "*laugh")//heresy
	new_message = replacetext(new_message, "kek", "*laugh")//heresy
	new_message = replacetext(new_message, "lmao", "*laugh")//heresy
	new_message = replacetext(new_message, "lmfao", "*laugh")//heresy
	new_message = replacetext(new_message, "omg", "Oh my Emperor")//heresy
	new_message = replacetext(new_message, "tbh", "to be honest")//heresy
	new_message = replacetext(new_message, "cbt", "cock and ball torture")//heresy
	new_message = replacetext(new_message, "idk", "I don't know")//heresy
	new_message = replacetext(new_message, "dont", "don't")//heresy
	new_message = replacetext(new_message, "tfw", "That feeling when")//heresy
	new_message = replacetext(new_message, "mfw", "My face when")//heresy
	new_message = replacetext(new_message, "iirc", "if i remember correctly")//heresy

	INVOKE_ASYNC(src, /atom/movable/proc/animate_chat, new_message, speaking, italics, speech_bubble_recipients, 40)

	return 1

/proc/animate_speechbubble(image/I, list/show_to, duration)
	set waitfor = FALSE
	var/matrix/M = matrix()
	M.Scale(0,0)
	I.transform = M
	I.alpha = 0
	for(var/client/C in show_to)
		C.images += I
	animate(I, transform = 0, alpha = 255, time = 5, easing = ELASTIC_EASING)
	sleep(duration-5)
	animate(I, alpha = 0, time = 5, easing = EASE_IN)
	sleep(5)
	for(var/client/C in show_to)
		C.images -= I

/mob/living/proc/say_signlang(var/message, var/verb="gestures", var/datum/language/language)
	for (var/mob/O in viewers(src, null))
		O.hear_signlang(message, verb, language, src)
	return 1

/obj/effect/speech_bubble
	var/mob/parent

/mob/living/proc/GetVoice()
	return name
