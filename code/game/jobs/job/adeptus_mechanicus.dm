/datum/job/magos
	title = "Magos Dominus"
	department = "Adeptus Mechanicus"
	head_position = 1
	department_flag = ENG|COM|SCI
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Adeptus Mechanicus and the Omnissiah."
	selection_color = "#7f6e2c"
	req_admin_notify = 1
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	ideal_character_age = 70 // most magi are old as fuck, just imagine what it takes to be a robotics nerdexpert in the cult mechanicus
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer
	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors, access_robotics, access_medical, access_morgue,
						access_surgery, access_chemistry, access_virology, access_genetics,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload, access_research,)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload, access_robotics, access_research)




	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Magos [current_name]")
		H.add_stats(rand(14,16), rand(14,16), rand(15,18), rand(20,24)) //idk what to do with Magos xd
		H.add_skills(rand(6,10),rand(6,10),rand(6,7),rand(10,12),rand(7,9)) //melee, ranged, med, eng, surgery
		H.warfare_faction = IMPERIUM
		H.set_trait(new/datum/trait/death_tolerant()) //although Noble, he has no nose and is a psychopath, no reason he should be vomiting around
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos Dominus, you are a specialist in all forms of technology. You are the highest ranking member of the Adeptus Mechanicus on the outpost, your duty is to ensure all machine spirits remain happy and willing to work. Use your talents and the skills of your tech priests to further the goals of the Mechanicus. Praise the Omnissiah!</font></b></span>")
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		var/corruption = rand(1,7)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh,
				/mob/living/carbon/human/proc/tzeentch)




/datum/job/engineer
	title = "Tech Priest Enginseer"
	department = "Engineering"
	department_flag = ENG
	social_class = SOCIAL_CLASS_MED
	total_positions = 5
	spawn_positions = 5
	supervisors = "You obey the Magos Dominus and secondarily, the Magos Biologis"
	selection_color = "#B2A15F"
	economic_modifier = 5
	minimal_player_age = 7
	open_when_dead = 0
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_robotics, access_research)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_robotics, access_research)
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Tech-Priest [current_name]")
		H.set_trait(new/datum/trait/death_tolerant()) //no nose + psycho
		H.add_stats(rand(14,16), rand(14,16), rand(12,15), rand(14,16)) //idk what to do with Magos xd
		H.add_skills(rand(6,8),rand(4,8),rand(5,6),rand(7,10),rand(5,7)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		var/corruption = rand(1,5)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh,
				/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Enginseer, Obey your Magi and remember, your primary duty is to ensure that all machine spirits are pleased and secure technology.</font></b></span>")

// Biologis

// Magos

/datum/job/geneticist
	title = "Magos Biologis"
	department = "Medical"
	department_flag = SCI|ENG
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	open_when_dead = 0
	supervisors = "the Adeptus Mechanicus and the Omnissiah."
	selection_color = "#967096"
	economic_modifier = 7
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva, access_construction, access_sec_doors, access_robotics, access_medical, access_morgue,  access_surgery, access_chemistry, access_virology, access_genetics, access_RC_announce, access_tcomsat, access_ai_upload, access_research,)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva, access_construction, access_RC_announce, access_tcomsat, access_ai_upload, access_robotics, access_research,)
	outfit_type = /decl/hierarchy/outfit/job/medical/geneticist
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Biologis [current_name]")
		H.set_trait(new/datum/trait/death_tolerant()) //They literally open up dead bodies of xenos and humans alike, why would they be disgusted of organs and blood?
		H.add_stats(rand(14,16), rand(14,16), rand(10,13), rand(20,30))
		H.add_skills(rand(6,9),rand(4,7),rand(8,11),rand(7,10),rand(10,12)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		var/corruption = rand(1,5)
		switch(corruption)
			if(1)
				H.verbs += list(
				/mob/living/carbon/human/proc/khorne,
				/mob/living/carbon/human/proc/nurgle,
				/mob/living/carbon/human/proc/slaanesh,
				/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Magos Biologis, you are a expert on xenos and biological research, your primary duty is to oversee the construction of Skitarii, you are not forced to listen to the Magos Dominus, but be aware, he holds much more power in the outpost than you.</font></b></span>")


//Walker here, why the fuck does this even exist? all Genetors research aliens, thats like, their speciality, who added this in? im not going to remove it for now but, idk why its here.
// Magos Biologis Xenobiologist
/*
/datum/job/xenobiologist
	title = "Magos Xenologist"
	department = "Science"
	department_flag = SCI

	total_positions = 3
	spawn_positions = 2
	supervisors = "the Magos Dominus"
	selection_color = "#633d63"
	economic_modifier = 7
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_hydroponics)
	minimal_access = list(access_research, access_xenobiology, access_hydroponics)
//	alt_titles = list("Xenobotanist")
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/science/xenobiologist
*/



//Skitarii
/decl/hierarchy/outfit/job/skitarii
	uniform = /obj/item/clothing/under/rank/skitarii
	suit = /obj/item/clothing/suit/storage/hooded/skitarii
	shoes = /obj/item/clothing/shoes/skitshoes
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/red_team
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/warfare/rat = 1,)


/*
/datum/job/atmos
	title = "Atmospheric Technician"
	department = "Engineering"
	department_flag = ENG

	total_positions = 0
	spawn_positions = 0
	supervisors = "the Magos"
	selection_color = "#5b4d20"
	economic_modifier = 5
	minimal_player_age = 7
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage)
	outfit_type = /decl/hierarchy/outfit/job/engineering/atmos
*/ //we dont use atmos here
