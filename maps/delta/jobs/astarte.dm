/datum/job/envoy
	title = "Astartes Envoy"
	total_positions = 1
	spawn_positions = 1
	head_position = 0
	supervisors = "The Rogue Trader and your Chapter Master"
	social_class = SOCIAL_CLASS_MAX
	outfit_type = /decl/hierarchy/outfit/job/astarte
	alt_titles = list(
		"Salamander Tactical Marine" = /decl/hierarchy/outfit/job/astarte/ravenguard,
		"Ravenguard Tactical Marine" = /decl/hierarchy/outfit/job/astarte/salamander,
		"Ultramarine Company Captain" = /decl/hierarchy/outfit/job/astarte/ultramarine/captain,
		"Salamander Company Captain" = /decl/hierarchy/outfit/job/astarte/ravenguard/captain,
		"Ravenguard Company Captain" = /decl/hierarchy/outfit/job/astarte/salamander/captain,
		"Ultramarine Apothecary" = /decl/hierarchy/outfit/job/astarte/ultramarine/apothecracy,
		"Salamander Apothecary" = /decl/hierarchy/outfit/job/astarte/ravenguard/apothecracy,
		"Ravenguard Apothecary" = /decl/hierarchy/outfit/job/astarte/salamander/apothecracy,
		"Ultramarine Tech-Marine" = /decl/hierarchy/outfit/job/astarte/ultramarine/tech,
		"Salamander Tech-Marine" = /decl/hierarchy/outfit/job/astarte/ravenguard/tech,
		"Ravenguard Tech-Marine" = /decl/hierarchy/outfit/job/astarte/salamander/tech
		)
	selection_color = "#344FAA"
	department_flag = SEC|COM
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	auto_rifle_skill = 10 //astartes are masters of all weaponry
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	melee_skill = 10
	ranged_skill = 10
	medical_skill = 5
	engineering_skill = 0
	surgery_skill = 1
	req_admin_notify = 1
	open_when_dead = 0
	latejoin_at_spawnpoints = 1
	announced = 0
	species_role = "Astartes"
	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Brother [current_name]")
		H.add_stats(40, rand(25,30), rand(25,30), rand(20,30)) //genuinely no idea what to make their stats
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Space Marine, hired to guard the Rogue Trader and further the goals of the Imperium. You are a beacon of Mankind's greatness, your behavior should reflect this always. Guardsmen revere you and will defer to your judgement, make sure it is sound.</font></b></span>")
		H.gender = MALE
		H.bladder = 0 //should make jimmy space marines not have to shit/piss
		H.bowels = 0
		H.verbs += /mob/living/carbon/human/proc/chapterselection
		H.adjustStaminaLoss(-INFINITY) //astardes have basically infinite fight in them
		H.health = 500
		H.maxHealth = 500
/decl/hierarchy/outfit/job/envoy //will eventually code this to randomize to different chapters
	name = OUTFIT_JOB_NAME("Astartes Envoy")
	uniform = /obj/item/clothing/under/color/black
	l_ear = /obj/item/device/radio/headset/red_team
	l_pocket = null
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/dog_tag/guardsman
	shoes = null
	backpack_contents = null //for now
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
/datum/job/envoy/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)
