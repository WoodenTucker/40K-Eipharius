/**********
* Gravity *
**********/
/datum/admin_secret_item/random_event/mortars
	name = "Heretic Mortar Barrage"

/datum/admin_secret_item/random_event/mortars/can_execute(var/mob/user)
	if(!(ticker && ticker.mode))
		return 0

	return ..()

/datum/admin_secret_item/random_event/mortars/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	feedback_inc("admin_secrets_fun_used",1)
	feedback_add_details("admin_secrets_fun_used","Mortars")
	log_and_message_admins("Launched Mortar Fire")
	if(choice == "Yes")
	/datum/event/mortar/announce()
	wait(30)
	/datum/event/mortar/start()
	wait(120)
	/datum/event/mortar/end()
