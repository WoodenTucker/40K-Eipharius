/**********
* Mortars *
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

	var/choice = input(user, "Are you certain? This cannot be cancelled, make sure not to spam it.") in list("Yes", "No")

	feedback_inc("admin_secrets_fun_used",1)
	feedback_add_details("admin_secrets_fun_used","Mortars")
	log_and_message_admins("Launched Mortar Fire")
	if(choice == "Yes")
		call(/datum/event/mortar/announce)()
		sleep(30)
		call(/datum/event/mortar/start)()
		sleep(120)
		call(/datum/event/mortar/end)()
