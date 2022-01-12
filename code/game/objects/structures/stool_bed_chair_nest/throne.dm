//The throne has many functions so it gets its own file.

/obj/structure/bed/chair/throne
	name = "\the Commandant's throne"
	desc = "Fit for a king... or a uh... commandant"
	base_icon = "throne"
	icon_state = "throne"
	var/datum/announcement/decree/magistrate_decree = new
	var/announcement_cooldown = FALSE

/obj/structure/bed/chair/throne/rotate()//Can't rotate it.
	return

/obj/structure/bed/chair/throne/attackby(obj/item/W as obj, mob/user as mob)//Can't deconstruct it.
	return

/*
//Like an announcement only exclusively for Magistrates.
/obj/structure/bed/chair/throne/verb/decree()
	set name = "Make A Decree"
	set category = "Throne"
	set src in view(0)

	if(!ishuman(usr))
		return

	var/mob/living/carbon/human/user = usr

	if(user.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_RESTRAINED|INCAPACITATION_KNOCKOUT))
		return

	if(!user.is_wearing_writ())
		to_chat(user, "You cannot make decrees without your golden writ.")
		return

	if(announcement_cooldown)
		to_chat(user, "It is too soon to make another decree.")
		return

	var/announcement = sanitize(input(user, "What would you like to announce?", "Announcement")as null|text)
	if(!announcement)
		return
	to_chat(world, "<h1><span class='red_team'>Rogue Trader's New Decree: <br> [announcement]</span></h1>")

	sound_to(world, 'sound/effects/klaxon_alarm.ogg')
	announcement_cooldown = TRUE
	spawn(600)//One minute cooldown
		announcement_cooldown = FALSE

//Banishing someone from the land.
/obj/structure/bed/chair/throne/verb/banish()
	set name = "Banish A Subject"
	set category = "Throne"
	set src in view(0)

	if(!ishuman(usr))
		return

	var/mob/living/carbon/human/user = usr

	if(user.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_RESTRAINED|INCAPACITATION_KNOCKOUT))
		return

	if(!user.is_wearing_writ())
		to_chat(user, "You require your golden writ for this.")
		return

	if(announcement_cooldown)
		to_chat(user, "It is too soon to do this again.")
		return

	var/input = sanitize(input(user, "Input a subject to banish. THIS CANNOT BE UNDONE!", "Banish") as null|text)
	if(!input)
		return

	banish(input)
	to_chat(world, "<h1><span class='red_team'>Rogue Trader has banished: <br> [input] from their lands!</span></h1>")
	sound_to(world, 'sound/effects/klaxon_alarm.ogg')
	announcement_cooldown = TRUE
	spawn(600)
		announcement_cooldown = FALSE

//Declaring someone you want fucking dead!
/obj/structure/bed/chair/throne/verb/great_hunt()
	set name = "Declare A Great Hunt"
	set category = "Throne"
	set src in view(0)

	if(!ishuman(usr))
		return

	var/mob/living/carbon/human/user = usr

	if(user.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_RESTRAINED|INCAPACITATION_KNOCKOUT))
		return

	if(!user.is_wearing_writ())
		to_chat(user, "You require your golden writ for this.")
		return

	if(announcement_cooldown)
		to_chat(user, "It is too soon to do this again.")
		return

	var/input = sanitize(input(user, "Who shall we declare a great hunt on? THIS CANNOT BE UNDONE!", "Great Hunt") as null|text)
	if(!input)
		return
	to_chat(world, "<h1><span class='red_team'>Rogue Trader: <br>A great hunt has been declared on [input]! All loyal men must participate until [input] is dead!</h1>")
	sound_to(world, 'sound/effects/klaxon_alarm.ogg')
	announcement_cooldown = TRUE
	spawn(600)
		announcement_cooldown = FALSE

//Declaring someone you want only captured.
/obj/structure/bed/chair/throne/verb/captured()
	set name = "Declare A Criminal To Be Captured"
	set category = "Throne"
	set src in view(0)

	if(!ishuman(usr))
		return

	var/mob/living/carbon/human/user = usr

	if(user.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_RESTRAINED|INCAPACITATION_KNOCKOUT))
		return

	if(!user.is_wearing_writ())
		to_chat(user, "You require your golden writ for this.")
		return

	if(announcement_cooldown)
		to_chat(user, "It is too soon to do this again.")
		return

	var/input = sanitize(input(user, "Who is to be captured? THIS CANNOT BE UNDONE!", "Capture a Criminal") as null|text)
	if(!input)
		return

	to_chat(world, "<h1><span class='red_team'>Rogue Trader: <br>[input] is a criminal to be captured alive!</h1>")
	sound_to(world, 'sound/effects/klaxon_alarm.ogg')
	announcement_cooldown = TRUE
	spawn(600)
		announcement_cooldown = FALSE

/proc/banish(var/name)
	if(!name)
		return
	for(var/A in GLOB.human_mob_list)//Typless loops are quicker.
		var/mob/living/carbon/human/H = A
		if(H.real_name == name)
			H.banished = TRUE


/mob/living/proc/is_wearing_writ()
	var/obj/O = get_equipped_item(slot_id)
	if(istype(O, /obj/item/card/id/gold))
		return TRUE

*\ WIP, going to make it into a working mechanic for RT sometime.