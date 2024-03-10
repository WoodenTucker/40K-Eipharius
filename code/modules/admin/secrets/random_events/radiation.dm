/**********
* Radiation *
**********/
/datum/admin_secret_item/random_event/radiation_storm
	name = "Rad-Storm"

/datum/admin_secret_item/random_event/radiation_storm/can_execute(var/mob/user)
	if(!(ticker && ticker.mode))
		return 0

	return ..()

/datum/admin_secret_item/random_event/radiation_storm/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	feedback_inc("admin_secrets_fun_used",1)
	feedback_add_details("admin_secrets_fun_used","Radiation")
	log_and_message_admins("Launched Rad-Storm")
	if(choice == "Yes")
	/datum/event/mortar/announce()
	wait(30)
	/datum/event/radiation_storm/start()
	wait(50)
	/datum/event/radiation_storm/end()
