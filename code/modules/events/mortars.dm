/datum/event/mortar
	announceWhen = 0
	startWhen	= 30
	endWhen = 150

/datum/event/mortar/setup()
	endWhen = 150

/datum/event/mortar/announce()
	command_announcement.Announce("PDF Outposts are reporting incoming indirect fire from Heretical forces. All citizens should take cover within a secure building.")


/datum/event/mortar/end()
	command_announcement.Announce("PDF Outposts are reporting that the fire has ceased. You may exit your buildings, but are advised to take care.")

/datum/event/mortar/start()
	to_chat(world, uppertext("<font size=5><b>INCOMING!!</b></font>"))


/datum/event/mortar/tick()
	var/mortar_type = pick("frag", "fire", "arty")
	for(var/i = 1, i<4, i++)
	sound_to(world, 'sound/effects/arty_distant.ogg')
	sleep(30)

	switch(mortar_type)
		if("frag")
			sleep(10)
			sound_to(world, 'sound/weapons/new_artillery_incoming01.ogg')
			sleep(2)
			for(var/i = 1, i<21, i++)//No man's land is a big area so drop a lot of shells.
				var/turf/T = pick(get_area_turfs(/area/cadiaoutpost/new_hive/hive_city))

				drop_mortar(T, mortar_type)
				sleep(10)

/*		if("gas")
			sleep(10)
			sound_to(world, 'sound/weapons/new_artillery_incoming02.ogg')
			sleep(2)
			for(var/i = 1, i<3, i++)//Only do this three times to reduce lag.
				var/turf/T = pick(get_area_turfs(/area/cadiaoutpost/new_hive/hive_city))

				drop_mortar(T, mortar_type)
				sleep(10)*/

		if("fire")
			sleep(10)
			sound_to(world, 'sound/weapons/new_artillery_incoming03.ogg')
			sleep(2)
			for(var/i = 1, i<15, i++)//5 fire shells, going hot!
				var/turf/T = pick(get_area_turfs(/area/cadiaoutpost/new_hive/hive_city))

				drop_mortar(T, mortar_type)
				sleep(10)

		if("arty")
			sleep(10)
			sound_to(world, 'sound/weapons/new_artillery_incoming04.ogg')
			sleep(2)
			for(var/i = 1, i<12, i++)
				var/turf/T = pick(get_area_turfs(/area/cadiaoutpost/new_hive/hive_city))

				drop_mortar(T, mortar_type)
				sleep(10)
