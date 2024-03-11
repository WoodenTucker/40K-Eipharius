//This is for a "filler" event, when you want a probability of nothing happening.

/datum/event/no_event
	endWhen 		= 5
  
/datum/event/no_event/setup()
	endWhen = 5

/datum/event/no_event/announce()
	return

/datum/event/no_event/start()
	return

/datum/event/no_event/end()
	return
