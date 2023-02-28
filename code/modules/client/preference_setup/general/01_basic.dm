datum/preferences
	var/real_name						//our character's name
	var/alternate_names[6]				//Alternate Names for Ogryns, Xenos, and people who use the incorrect gendered preset for Astartes or Sororitas.
	var/be_random_name = 0				//whether we are a random name every round
	var/gender = MALE					//gender of character (well duh)
	var/age = 30						//age of character
	var/spawnpoint = "Default" 			//where this character will spawn (0-2).
	var/metadata = ""
	var/religion = "None"

/datum/category_item/player_setup_item/general/basic
	name = "Basic"
	sort_order = 1

/datum/category_item/player_setup_item/general/basic/load_character(var/savefile/S)
	S["real_name"]				>> pref.real_name
	S["alternate_names"]		>> pref.alternate_names
	S["name_is_always_random"]	>> pref.be_random_name
	S["gender"]					>> pref.gender
	S["age"]					>> pref.age
	S["spawnpoint"]				>> pref.spawnpoint
	S["OOC_Notes"]				>> pref.metadata
	S["religion"]				>> pref.religion
	sanitize_character()

/datum/category_item/player_setup_item/general/basic/save_character(var/savefile/S)
	S["real_name"]				<< pref.real_name
	S["alternate_names"]		<< pref.alternate_names
	S["name_is_always_random"]	<< pref.be_random_name
	S["gender"]					<< pref.gender
	S["age"]					<< pref.age
	S["spawnpoint"]				<< pref.spawnpoint
	S["OOC_Notes"]				<< pref.metadata
	S["religion"]				<< pref.religion

/datum/category_item/player_setup_item/general/basic/sanitize_character()
	var/datum/species/S = all_species[pref.species ? pref.species : SPECIES_HUMAN]
	if(!S) S = all_species[SPECIES_HUMAN]
	pref.age                = sanitize_integer(pref.age, S.min_age, S.max_age, initial(pref.age))
	pref.gender             = sanitize_inlist(pref.gender, S.genders, pick(S.genders))
	pref.real_name          = sanitize_name(pref.real_name, pref.species)
	if(!pref.real_name)
		pref.real_name      = random_name(pref.gender, pref.species)
	if(!pref.alternate_names[1])
		pref.alternate_names[1] = random_ogryn_name()
	if(!pref.alternate_names[2])
		if(pref.gender == FEMALE)
			pref.alternate_names[2] = pref.real_name
		else
			pref.alternate_names[2] = random_name(FEMALE, pref.species)
	if(!pref.alternate_names[3])
		if(pref.gender == MALE)
			pref.alternate_names[3] = pref.real_name
		else
			pref.alternate_names[3] = random_name(MALE, pref.species)
	if(!pref.alternate_names[4])
		pref.alternate_names[4] = random_ork_name(pref.gender)
	if(!pref.alternate_names[5])
		pref.alternate_names[5] = random_kroot_name(pref.gender)
	if(!pref.alternate_names[6])
		pref.alternate_names[6] = random_taufw_name(pref.gender)
	pref.spawnpoint         = sanitize_inlist(pref.spawnpoint, spawntypes(), initial(pref.spawnpoint))
	pref.be_random_name     = sanitize_integer(pref.be_random_name, 0, 1, initial(pref.be_random_name))


/datum/category_item/player_setup_item/general/basic/content(mob/user)
	. = list()


	if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
		for(var/mob/new_player/P in GLOB.player_list)
			if(P.mind.key == user.key)
				if(!P.client || !P.ready)
					. += "<p style='position: absolute;right: 50px;bottom: 50px;'><a onfocus='this.blur()' href='byond://?src=\ref[user];ready=1' class='inactive'>You are not ready.</a></p>"
				else
					. += "<p style='position: absolute;right: 50px;bottom: 50px;'><a onfocus='this.blur()' href='byond://?src=\ref[user];ready=0' class='active'><b>You are ready.</b></a></p>"
	else
		. += "<p style='position: absolute;right: 50px; bottom: 50px;'><a onfocus='this.blur()' href='byond://?src=\ref[user];late_join=1' class='active'><b>Join the Game!</a></p>"

	. += "<b>Name:</b> "
	. += "<a onfocus ='this.blur()' href='?src=\ref[src];rename=1'><b>[pref.real_name]</b></a> <a onfocus ='this.blur()' href='?src=\ref[src];random_name=1'>&reg;</a><br>"
	. += "<a onfocus ='this.blur()' href='?src=\ref[src];alternate_name_selection=1'><b>Alternate Role Names</b></a><br>"
	. += "<b>Gender:</b> <a onfocus ='this.blur()' href='?src=\ref[src];gender=1'><b>[gender2text(pref.gender)]</b></a><br>"
	. += "<b>Age:</b> <a onfocus ='this.blur()' href='?src=\ref[src];age=1'>[pref.age]</a><br>"
	if(GLOB.using_map.map_lore)
		. += "<b>Map Objective:</b><br>"
		. += "[GLOB.using_map.map_lore]<br>"//Put the map lore here if there is any.

	if(user.client.holder)//it's user not usr Bombany.
		. += "<p style='position: absolute;right: 50px; bottom: 30px;'><a onfocus='this.blur()' href='byond://?src=\ref[user];observe=1' class='active'><b>Observe()</a></p>"
	. = jointext(.,null)

/datum/category_item/player_setup_item/general/basic/OnTopic(var/href,var/list/href_list, var/mob/user)
	var/datum/species/S = all_species[pref.species]
	if(href_list["rename"])
		var/raw_name = input(user, "Choose your character's name:", "Character Name")  as text|null
		if (!isnull(raw_name) && CanUseTopic(user))
			var/new_name = sanitize_name(raw_name, pref.species)
			if(new_name)
				pref.real_name = new_name
				return TOPIC_REFRESH
			else
				to_chat(user, "<span class='warning'>Invalid name. Your name should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ' and .</span>")
				return TOPIC_NOACTION

	else if(href_list["random_name"])
		pref.real_name = random_name(pref.gender, pref.species)
		return TOPIC_REFRESH

	else if(href_list["always_random_name"])
		pref.be_random_name = !pref.be_random_name
		return TOPIC_REFRESH

	else if(href_list["alternate_name_selection"])
		var/alternate_name_menu_list[6]
		alternate_name_menu_list[1] = "Ogryn Name: [pref.alternate_names[1]]"
		alternate_name_menu_list[2] = "Sororita Name: [pref.alternate_names[2]]"
		alternate_name_menu_list[3] = "Astartes Name: [pref.alternate_names[3]]"
		alternate_name_menu_list[4] = "Ork Name: [pref.alternate_names[4]]"
		alternate_name_menu_list[5] = "Kroot Name: [pref.alternate_names[5]]"
		alternate_name_menu_list[6] = "T'au Name: [pref.alternate_names[6]]"
		var/choice = input(user, "Choose a name to edit.") as null|anything in alternate_name_menu_list
		if(choice)
			var/randomize = input(user, "Randomize name, or manually edit?") in list("Edit", "Randomize")
			if(randomize == "Edit")
				var/raw_name = input(user, "Choose your character's name:", "Character Name")  as text|null
				if (!isnull(raw_name))
					if(choice == alternate_name_menu_list[2] || choice == alternate_name_menu_list[3])
						raw_name = sanitize_name(raw_name, pref.species)
					if(length(raw_name) > 2 && length(raw_name) < MAX_NAME_LEN)
						pref.alternate_names[alternate_name_menu_list.Find(choice)] = raw_name
						to_chat(user,"Name changed to [raw_name].")
						return TOPIC_REFRESH
					else
						to_chat(user, "<span class='warning'>Invalid name. Your name should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ' and .</span>")
						return TOPIC_NOACTION
				return TOPIC_REFRESH
			else
				if(choice == alternate_name_menu_list[1])
					pref.alternate_names[1] = random_ogryn_name()
				else if(choice == alternate_name_menu_list[2])
					pref.alternate_names[2] = random_name(FEMALE, pref.species)
				else if(choice == alternate_name_menu_list[3])
					pref.alternate_names[3] = random_name(MALE, pref.species)
				else if(choice == alternate_name_menu_list[4])
					pref.alternate_names[4] = random_ork_name(pref.gender)
				else if(choice == alternate_name_menu_list[5])
					pref.alternate_names[5] = random_kroot_name(pref.gender)
				else if(choice == alternate_name_menu_list[6])
					pref.alternate_names[6] = random_taufw_name(pref.gender)
				to_chat(user,"Name changed to [pref.alternate_names[alternate_name_menu_list.Find(choice)]].")

	else if(href_list["gender"])
		var/new_gender
		if(pref.gender == MALE)
			new_gender = FEMALE
		else
			new_gender = MALE
		S = all_species[pref.species]
		pref.gender = new_gender
		if(!(pref.f_style in S.get_facial_hair_styles(pref.gender)))
			ResetFacialHair()
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["age"])
		var/new_age = input(user, "Choose your character's age:\n([S.min_age]-[S.max_age])", CHARACTER_PREFERENCE_INPUT_TITLE, pref.age) as num|null
		if(new_age && CanUseTopic(user))
			pref.age = max(min(round(text2num(new_age)), S.max_age), S.min_age)
			return TOPIC_REFRESH

	else if(href_list["spawnpoint"])
		var/list/spawnkeys = list()
		for(var/spawntype in spawntypes())
			spawnkeys += spawntype
		var/choice = input(user, "Where would you like to spawn when late-joining?") as null|anything in spawnkeys
		if(!choice || !spawntypes()[choice] || !CanUseTopic(user))	return TOPIC_NOACTION
		pref.spawnpoint = choice
		return TOPIC_REFRESH

	else if(href_list["metadata"])
		var/new_metadata = sanitize(input(user, "Enter any information you'd like others to see, such as Roleplay-preferences:", "Game Preference" , pref.metadata) as message|null)
		if(new_metadata && CanUseTopic(user))
			pref.metadata = new_metadata
			return TOPIC_REFRESH

	return ..()
