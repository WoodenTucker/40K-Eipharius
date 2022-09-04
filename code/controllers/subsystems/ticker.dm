SUBSYSTEM_DEF(ticker)
	name = "Ticker"
	wait = 2 SECONDS
	init_order = INIT_ORDER_TICKER

	flags = SS_NO_TICK_CHECK | SS_KEEP_TIMING

	var/gametime_offset = 432000 //Deciseconds to add to world.time for station time.
	var/station_time_rate_multiplier = 12 //factor of station time progressal vs real time.
	var/round_start_time = 0

/datum/controller/subsystem/ticker/Initialize()
	to_world("<span class='info'><B>The game will start soon!</B></span>")
	round_start_time = world.time
	gametime_offset = rand(0, 23) HOURS

/datum/controller/subsystem/ticker/Initialize(start_timeofday)
	if (!ticker)
		ticker = new

	spawn
		ticker.pregame()

/datum/controller/subsystem/ticker/fire()
	ticker.process()

/world/proc/has_round_started()
	return (ticker && ticker.current_state >= GAME_STATE_PLAYING)
