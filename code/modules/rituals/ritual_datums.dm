//My first go around at a spoken word ritual system somewhat similar to YE OLDE LIFEWEB - wel
//Refer to say code and ritual filter to see how we are arriving here
//This is just for storing future rituals and their requirements, actual handling will be elsewhere in this very folder!



/datum/ritual
	var/name = "Default Ritual"
	var/description = "Default Ritual"
	var/announced = FALSE //upon completion is this announced somehow?
	var/min_ritualists = 1 //How many people need to utter the response phrase? (Ritual leader automatically added to this count)
	var/location_specific = FALSE //Does this ritual need to be performed in a specific area
	var/area/ritual_area = /area/cadiaoutpost/oa/shuttle/transit //If above is true, ensure you put a new area
	var/response_required = FALSE // do we actually need a response?
	var/response_phrase = "Default Response" //What are people supposed to chant for this ritual? Set above to true
	var/correct_responses = 0
	var/ritual_active = TRUE //Just leave this at the default unless you have a good reason, its used to allow message collection
	var/min_chants = 0 //How many times must the phrase be uttered before our ritual is complete? Set response req to true
	var/timeout = 30 SECONDS //How long should a ritual take to end? Pass/fail is evaluated at the end of this timer
	var/timer_id //timer id for deletion if needed
	var/ritualists[0] //associative array that contains our ritualists
	var/fail_result = /mob/proc/defaultRitualFail //replace these, they are just refs to functions to run upon failure/success
	var/success_result = /mob/proc/defaultRitualSuccess
	var/additional_req_check = null //Intended to be another function reference, if chanting isn't enough to finish the job i.e. must have cut hands or something
	var/list/allowed_jobs =	list() //If you put a job in this list, it will be required to start a ritual, if left empty, anyone can perform it.




//Begin actual rituals

//idk this is kind of a meme ritual, tweak it as needed
/datum/ritual/preserve_us
	name = "Preservation Ritual"
	description = "Sanctifys the Cathedral, thwarting access to any non-believers."
	min_ritualists = 5
	timeout = 40 SECONDS
	location_specific = TRUE
	ritual_area = /area/cadiaoutpost/oa/service/chapel //Must be performed in the chapel
	response_required = TRUE
	response_phrase = "Emperor keep us"
	min_chants = 15 //requires at least 4 additional ritualist and the response phrase must be uttered 15 times
	allowed_jobs = list(/datum/job/deacon, /datum/job/sistersuperior)
	success_result = /proc/preservationSuccess
	fail_result = /proc/preservationFail

//Exorcist inspired inquisition ritual
/datum/ritual/invoke_the_saints
	name = "Invoke the Saints"
	description = "Calls upon the names of the Imperial Saints to draw out the daemonic."
	min_ritualists = 1
	timeout = 40 SECONDS
	location_specific = FALSE
	response_required = TRUE
	allowed_jobs = list(/datum/job/deacon, /datum/job/acolyte, /datum/job/inquisitor)
	response_phrase = "saint\\s+\\w+\\s+defend\\s+us" //regex that searches for saint, defend and us to be used with any name ie. Saint Celestine defend us!
	min_chants = 10 //requires at least 1 additional ritualist and the phrase must be uttered 3 times by non-ritual leader
	additional_req_check = /mob/proc/invoke_check
	success_result = /mob/proc/invokeSuccess
	fail_result = /mob/proc/invokeFail
