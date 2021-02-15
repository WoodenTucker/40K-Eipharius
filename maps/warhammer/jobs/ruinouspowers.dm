/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Khorne////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/khorne(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Khorne"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot call upon Khorne while restrained!")	//user is tied up
		return
	if(decay > 0)
		to_chat(M, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(M, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(M, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(M.rage)
		if(0)
			if(istype(M.l_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.l_hand)
				to_chat(M, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. You have taken the first step on the path of the Blood God. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				M.update_inv_l_hand()
				M.rage++
			else if(istype(M.r_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.r_hand)
				to_chat(M, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. You have taken the first step on the path of the Blood God. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				M.update_inv_r_hand()
				M.rage++
			else
				to_chat(M, "You need a certain type of meat... Something filled with rage and a lust for bloodshed.")
				return
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Nurgle////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/nurgle(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Nurgle"
	set desc = "In the embrace of great Nurgle, I am no longer afraid."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot call upon Nurgle while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(M, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(M, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(M, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return



/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Slaanesh//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/slaanesh(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Slaanesh"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(rage > 0)
		to_chat(M, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(M, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(M, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return



/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Tzeentch//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/tzeentch(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Tzeentch"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot call upon Nurgle while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(M, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(M, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(M, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return