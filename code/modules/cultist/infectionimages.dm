/mob/living/carbon/human/proc/AddInfectionImages() //yoinked and reworked for ayylmaos
	if(client)
		var/datum/heretic_deity/deity = GODBYPLAYER(src)
		for(var/mob/living/carbon/human/member in deity.members)
			client.images += image('icons/mob/chaoshud.dmi', loc = member, icon_state = deity.status_icon_state)
	return


/mob/living/carbon/human/Login() //so they can get it on login if they dc or somethin
	..()
	AddInfectionImages()
	return

