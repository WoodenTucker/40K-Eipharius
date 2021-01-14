/datum/job/penitent
	title = "Penitent"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Holy Inquisition"
	selection_color = "#515151"
	access = list(access_hydroponics,)
	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/penitent

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.add_skills(rand(10,16))
		H.fully_replace_character_name("Penitent [H.real_name]")
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Penitent. Once a daemon worshipper your life changed when the Inquisition came knocking. Years of torture and re-education have left your mind and body shattered. You drift from world to world, simply hoping to get by another day </font></b></span>")
		if(announced)
			H.say("Forgive me, God-Emperor!")




//loadouts below here
/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Penitent")
	uniform = /obj/item/clothing/under/rank/penitent
	suit = /obj/item/clothing/suit/raggedrobe
	id_type = /obj/item/card/id/pilgrim/penitent
	pda_type = /obj/item/device/pda/penitent
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/plebhood
	l_ear = null
	r_ear = null