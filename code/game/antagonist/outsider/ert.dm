var/datum/antagonist/ert/ert

/datum/antagonist/ert
	id = MODE_ERT
	role_text = "Emergency Responder"
	role_text_plural = "Emergency Responders"
	welcome_text = "As member of the Emergency Response Team, you answer only to your leader and Segmentum Command."
	antag_text = "You are an <b>anti</b> antagonist! Within the rules, \
		try to save the installation and its inhabitants from the ongoing crisis. \
		Try to make sure other players have <i>fun</i>! If you are confused or at a loss, always adminhelp, \
		and before taking extreme actions, please try to also contact the administration! \
		Think through your actions and make the roleplay immersive! <b>Please remember all \
		rules aside from those without explicit exceptions apply to the ERT.</b>"
	leader_welcome_text = "You shouldn't see this"
	landmark_id = "Emergency Response Team"
	id_type = /obj/item/card/id/centcom/ERT

	flags = ANTAG_OVERRIDE_JOB | ANTAG_HAS_LEADER | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED
	antaghud_indicator = "hudloyalist"

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 7
	show_objectives_on_creation = 0 //we are not antagonists, we do not need the antagonist shpiel/objectives
	landmark_id = "Emergency Response Team"

/datum/antagonist/ert/create_default(var/mob/source)
	var/mob/living/carbon/human/M = ..()
	if(istype(M)) M.age = rand(25,45)
	M.add_stats(rand(18,20), rand(16,18), rand(17,20), rand (14,16)) //strength, dexterity, endurance, intelligence
	M.add_skills(rand(15,19),rand(15,18),rand(8,10),rand(8,10),rand(7,9)) //melee, ranged, med, eng, surgery

/datum/antagonist/ert/New()
	..()
	leader_welcome_text = "As leader of the Emergency Response Team, you answer only to [GLOB.using_map.boss_name], and have authority to override the Planetary Governor where it is necessary to achieve your mission goals. It is recommended that you attempt to cooperate with the Planetary Governor where possible, however."
	ert = src

/datum/antagonist/ert/greet(var/datum/mind/player)
	if(!..())
		return
	to_chat(player.current, "The Emergency Response Team works for Segmentum Command; your job is to protect [GLOB.using_map.company_name]'s ass-ets. There is a code red alert on [station_name()], you are tasked to go and fix the problem.")
	to_chat(player.current, "You should first gear up and discuss a plan with your team. More members may be joining, don't move out before you're ready.")

/datum/antagonist/ert/equip(var/mob/living/carbon/human/player)

	//Special radio setup

	player.equip_to_slot_or_del(new /obj/item/clothing/under/rank/principalagent(src), slot_w_uniform)
    //player.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/greypa(src), slot_wear_suit)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/cadian(src), slot_shoes)
	player.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/swat(src), slot_gloves)
	//player.equip_to_slot_or_del(new /obj/item/clothing/glasses/cadian(src), slot_glasses)
	player.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/hos(src), slot_l_ear)
	//player.equip_to_slot_or_del(new /obj/item/device/radio/headset/red_team(src), slot_r_ear)
	player.equip_to_slot_or_del(new /obj/item/storage/box/ifak(src), slot_l_store)
	player.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/half/cadianrespirator(src), slot_wear_mask)
	//player.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/scion(src), slot_head)
	player.equip_to_slot_or_del(new /obj/item/gun/energy/las/hotshot(src), slot_s_store)
	player.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare(src), slot_back)
	player.equip_to_slot_or_del(new /obj/item/reagent_containers/food/drinks/canteen(src), slot_in_backpack)
	player.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/warfare/rat(src), slot_in_backpack)
	player.equip_to_slot_or_del(new /obj/item/device/flashlight/lantern(src), slot_in_backpack)

	create_id(role_text, player)
	return 1
