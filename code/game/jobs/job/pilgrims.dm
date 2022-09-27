/datum/job/penitent //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Pilgrim"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = INFINITY //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = INFINITY
	supervisors = "The God Emperor."
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 100


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.stat = UNCONSCIOUS
		H.sleeping = 500
		to_chat(H, "<span class='notice'><b><font size=3>You are a Pilgrim. You left your home with little in search of more. Rumors of a holy site drew you to this planet and now life is in your hands. <br> <span class = 'badmood'> + Go to your pilgrim tab and select your fate. + </span> </font></b></span>")
		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)


/*
Pilgrim Fate System
*/

//yeah this might be the most retarded way of doing it but it works - plz no bully Matt

//mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)
/mob/living/carbon/human/proc/penitentclass()
	set name = "Select your class"
	set category = "Pilgrim"
	set desc = "Choose your new profession on this strange world."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	src.verbs -= list(/mob/living/carbon/human/proc/penitentclass)

	var/mob/living/carbon/human/U = src
	var/fates = list("Merchant","Mercenary","Penitent","Sherpa","Musician","Disgraced Medicae","Stalker","Scum","Miner", "Private Investigator", "Cleric")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Sherpa")
			U.add_stats(rand(13,14), rand(12,14), rand(12,14), rand (10,12)) //
			U.add_skills(rand(6,8),rand(6,8),rand(2,4),rand(3,4),rand(2,3)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/suit/sherpa, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/ushanka2, slot_head)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/glory, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful/ms, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful/ms, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'>Your home world was destroyed in an Ork waaaaaagh, you managed to escape before the planet was destroyed. On your home world, you were a navigator, born with an innate gift for pathfinding.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Penitent")
			U.add_stats(rand(15,16), rand(13,15), rand(10,14), rand (10,12)) //
			U.add_skills(rand(7,9),rand(6,8),rand(2,4),rand(2,3),rand(1,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/penitent, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/suit/raggedrobe, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/plebhood, slot_head)
			equip_to_slot_or_del(new /obj/item/gun/projectile/mervex, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sci, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/a357, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/a357, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U, "<span class='notice'><b><font size=3>You are a penitent, forced to tour the galaxy and toil until death in hopes of one day redeeming yourself. In your youth, you were an unknowing daemon-worshipper. Years of torment and re-education by the Inquisition allowed you this one chance at redemption. Labour endlessly in His name.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Mercenary")
			U.add_stats(rand(13,16), rand(11,15), rand(10,14), rand (10,12)) //veteran hunter
			U.add_skills(rand(6,8),rand(2,7),rand(3,6),rand(2,4),rand(1,3)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hauberk, slot_wear_suit)
			else if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/opvest, slot_wear_suit)
			else if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/suit/armor/breastplate, slot_wear_suit)
			else if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hauberk, slot_wear_suit)
			else
				equip_to_slot_or_del(new /obj/item/clothing/suit/armor/bountyhunter2, slot_wear_suit)
			if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/head/helmet/sentryhelm, slot_head)
			else if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/head/helmet/siege, slot_head)
			else if(prob(25))
				equip_to_slot_or_del(new /obj/item/clothing/head/helmet/newopen, slot_head)
			else
				equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hero, slot_head)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/laspistol/militarum/lucius, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/handcuffs, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>Brought to this planet in search of work, in your youth you were a Sergeant in the Astra Militarum, you've spent the rest of your adulthood as a member of the Imperium's Bounty Hunter guild. Years of experience and hunting have hardened you and made you a force to be reckoned with.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Private Investigator")
			U.add_stats(rand(13,14), rand(12,14), rand(12,14), rand (10,12)) //
			U.add_skills(rand(6,8),rand(6,8),rand(2,4),rand(3,4),rand(2,3)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/under/det/black, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/tduster, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/head/det, slot_head )
			equip_to_slot_or_del(new /obj/item/gun/projectile/necros, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/forensics/sample_kit/powder, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/c44, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/forensics/sample_kit, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/flame/lighter, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>Sick of the quiet life on your Agri-World, you took a ticket to colonize a new planet. In your youth, you trained to be an Arbite Investigator before dropping out of the Schola..</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Merchant")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (10,15)) //
			U.add_skills(rand(6,8),rand(4,8),rand(1,6),rand(1,6),rand(1,6)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/head/that, slot_head)
			if(prob(60))
				equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian/blred, slot_w_uniform)
			else
				equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian/redbl, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/leather/tailcoat, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/stack/thrones/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots, slot_shoes)
			to_chat(U,"<span class='notice'>Guided by your lust for thrones you smelled opportunity on this newly founded world. Work with the village and the outpost to organize trade and enrich yourself.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Musician")
			U.add_stats(rand(8,15), rand(8,16), rand(10,14), rand (12,16)) //
			U.add_skills(rand(6,8),rand(4,8),rand(1,6),rand(1,6),rand(1,6)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/device/violin, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/musician, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/musichat, slot_head)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/stack/thrones/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)

			to_chat(U,"<span class='notice'><b><font size=3>A wandering bard you find yourself moving from tavern to tavern entertaining the masses for a few thrones at a time. This planet will surely be no different. </font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Cleric")
			U.add_stats(rand(8,15), rand(8,16), rand(10,14), rand (12,16)) //
			U.add_skills(rand(6,8),rand(4,8),rand(1,6),rand(1,6),rand(1,6)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/chaplain, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/suit/leathercoat, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sci, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/book/manual, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)

			to_chat(U,"<span class='notice'><b><font size=3>You are an extremely low-ranking member of the Adeptus Ministorum. You do not reside within the Monasterium, and you must preach to the citizens of Messina. </font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Miner")
			U.add_stats(rand(13,16), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(6,8),rand(4,7),rand(3,3),rand(5,6),rand(2,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick, slot_gloves)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hard_had, slot_head)
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/storage/newore, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/satchel_eng, slot_back)
			equip_to_slot_or_del(new /obj/item/pickaxe/newpick, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/miner, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sci, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/card/id/ring/disgracedmedicae, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>A veteran of many digsites you travelled the galaxy looking for work.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Stalker")
			U.add_stats(rand(12,15), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(6,8),rand(5,8),rand(1,2),rand(3,4),rand(2,3)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/storage/belt/stalker, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/material/knife/butch, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/clothing/suit/chokha, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/head/pillbox, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>Ever in search of new game to hunt, you travelled to this new world in search of trophy and meat.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Scum")
			U.add_stats(rand(13,14), rand(13,15), rand(10,14), rand (10,12)) //
			U.add_skills(rand(6,8),rand(5,7),rand(3,5),rand(2,3),rand(3,5)) //melee, ranged, med, eng, surgery
			if(prob(50))
				equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			else if(prob(50))
				equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian/blred, slot_w_uniform)
			else
				equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian/redbl, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/scum, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/scum, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/zoom, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_service, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/flame/lighter/zippo, slot_l_store)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>Always on the run, always moving from scheme to scheme you once again find yourself on a new world. You'll do whatever it takes for a throne or two. Scamming, gambling, drug dealing. You are the scum of the Imperium but you wouldn't have it any other way.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Disgraced Medicae")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (11,15)) //
			U.add_skills(rand(6,8),rand(1,6),rand(7,9),rand(1,2),rand(6,9)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/prac_mask, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/suit/prac_arpon, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/prac_gloves, slot_gloves)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sci, slot_l_ear)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/prac_boots, slot_shoes)
			to_chat(U,"<span class='notice'><b><font size=3>A few too many slips and you found yourself stripped of your medical license but not the knowledge you gained for years of schooling and practice. Set up shop on this new world and hope no one asks to see your credentials.</font></b></span>")
			var/obj/item/card/id/ring/disgracedmedicae/W = new
			W.icon_state = "medicae_ring"
			W.assignment = "Medicae"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")



/datum/job/innkeeper  //so that the inn always has someone working
	title = "Innkeeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //better off than your average gross pilgrim
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Money"
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/innkeeper
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 50

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,14), rand(13,15), rand(9,12), rand (8,11)) 
		H.add_skills(rand(7,8),rand(7,9),rand(2,3),2,2) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You landed on this outpost some time ago, with the savings you had, you opened an inn hoping to grow your wealth serving the various pilgrims and travelers. Trade with gatherers and the outpost to always stay stocked so that no paying customer will be without food and drink. You have a full kitchen, alcohol and small farm to grow what you need. </font></b></span>")

/datum/job/pathfinder  
	title = "Pathfinder"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED 
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Yourself"
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/administrator
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 100

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(14,15), rand(13,16), rand(10,13), rand (9,12)) 
		H.add_skills(rand(7,9),rand(7,10),rand(4,6),4,6) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>Having arrived recently from the spires of Necromunda you a former courtier sought to establish something of a collection here with your remaining wealth. For whatever reason the dark, insidious and terrible aspects of this planet intrigued you enough to abandon your world and seek out... Eipharius.</font></b></span>")


//loadouts below here
/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Pilgrim")
	uniform = null//obj/item/clothing/under/rank/penitent
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = null//obj/item/clothing/shoes/prac_boots
	l_ear = null
	r_ear = null
	id_type = null
	gloves = null
	pda_slot = null

/decl/hierarchy/outfit/job/ganger
	name = OUTFIT_JOB_NAME("Ganger")
	uniform = /obj/item/clothing/under/rank/victorian/black
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/warfare
	mask = /obj/item/clothing/mask/bandana
//	belt = /obj/item/gun/projectile/warfare
	backpack_contents = list(
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/ammo_magazine/c45m/warfare = 1)

/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/rank/victorian/redbl
	suit = /obj/item/clothing/suit/innapron
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/bardhat
	l_ear = /obj/item/device/radio/headset/headset_service
	r_ear = null
	pda_slot = null
	shoes = /obj/item/clothing/shoes/vigilante
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 2,
	/obj/item/storage/box/beanbags = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
)


//Administrator
/decl/hierarchy/outfit/job/administrator
	name = OUTFIT_JOB_NAME("Administrator")
	uniform = /obj/item/clothing/under/rank/consort/adept
	head = /obj/item/clothing/head/commissar/adept
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/ring/administrator
	l_ear = /obj/item/device/radio/headset/headset_service
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	backpack_contents = list(
	/obj/item/stack/thrones = 2,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,

	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


//Ogryn Bouncer
/decl/hierarchy/outfit/job/bouncer
	name = OUTFIT_JOB_NAME("Bouncer")
	uniform = /obj/item/clothing/under/ogryn/jumpsuit
	head = null
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/ogryn
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	l_ear = null
	r_ear = null
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	l_hand = /obj/item/melee/classic_baton/trench_club
	backpack_contents = list(
	/obj/item/stack/thrones = 2,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,

	)

/datum/job/penitent //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Pilgrim"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = INFINITY //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = INFINITY
	supervisors = "The Holy Inquisition"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Pilgrim. You left your home with little in search of more. Rumors of a holy site drew you to this planet and now life is in your hands. <br> <span class = 'badmood'> + Go to your pilgrim tab and select your fate. + </span> </font></b></span>")


		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)

/datum/job/gangboy
	title = "Ganger"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //better off than your average gross pilgrim
	total_positions = 2
	spawn_positions = 2
	open_when_dead = 0
	supervisors = "Yourself"
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/ganger
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(15,17), rand(9,14), rand(13,15), rand (8,11)) //they suck and are supposed to suck
		H.add_skills(rand(7,9),rand(6,10),rand(2,4),1,rand(2,5)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.gangeq()
		to_chat(H, "<span class='notice'><b><font size=3>You were once a ganger from an off-world hive, after obtaining a sizable bounty on your head you used your savings to book passage off world and have arrived here to Eipharius. Despite how hard it was in the underhive, you get the feeling starting over on this shithole will be even worse.</font></b></span>")

/mob/living/carbon/human/proc/gangeq()
	if(prob(70))
		if(prob(50))
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/gangerhelm, slot_head)
		else
			switch(rand(1,4))
				if(1)
					equip_to_slot_or_del(new /obj/item/clothing/head/helmet/sentryhelm, slot_head)
				if(2)
					equip_to_slot_or_del(new /obj/item/clothing/head/helmet/siege, slot_head)
				if(3)
					equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hero, slot_head)
				if(4)
					equip_to_slot_or_del(new /obj/item/clothing/head/helmet/zealot, slot_head)
	switch(rand(1,4))
		if(1)
			equip_to_slot_or_del(new /obj/item/gun/projectile/warfare, slot_belt)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/c45m/warfare, slot_l_store)
		if(2)
			equip_to_slot_or_del(new /obj/item/gun/projectile/talon/renegade, slot_belt)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/c45m/warfare, slot_l_store)
		if(3)
			equip_to_slot_or_del(new /obj/item/gun/projectile/slugrevolver, slot_belt)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/c44, slot_l_store)
		if(4)
			equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/machinepistol, slot_s_store)

/datum/job/bouncer
	title = "Bouncer"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 1
	spawn_positions = 1
	supervisors = "The God Emperor and the Innkeeper"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/bouncer
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 50 //same as his father, the innkeeper
	species_role = "Ogryn"


	equip(var/mob/living/carbon/human/H)
	//theres gunna be some redundencies here but I do not careeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(19,22), rand(15,18), rand(15,18), rand (2,5)) //swole but retarded
		H.add_skills(rand(16,19),rand(10,12),1,1,1) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.fully_replace_character_name(random_ogryn_name())
		to_chat(H, "<span class='notice'><b><font size=3>You followed your best friend the innkeeper to this new world. Together, the two of you run the inn. He's the brains, you're the brawn.</font></b></span>")



/*
//loadouts below here
/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Pilgrim")
	uniform = /obj/item/clothing/under/rank/penitent
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/prac_boots
	l_ear = null
	r_ear = null
	id_type = null
	gloves = null
	pda_slot = null

/decl/hierarchy/outfit/job/ganger
	name = OUTFIT_JOB_NAME("Ganger")
	uniform = /obj/item/clothing/under/syndicate
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/prac_boots
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 2,
	/obj/item/storage/box/beanbags = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
)

/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/innapron
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/bardhat
	l_ear = /obj/item/device/radio/headset/headset_service
	r_ear = null
	pda_slot = null
	shoes = /obj/item/clothing/shoes/vigilante
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 2,
	/obj/item/storage/box/beanbags = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
)

//Administrator
/decl/hierarchy/outfit/job/administrator
	name = OUTFIT_JOB_NAME("Administrator")
	uniform = /obj/item/clothing/under/rank/consort/adept
	head = /obj/item/clothing/head/commissar/adept
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/ring/administrator
	l_ear = /obj/item/device/radio/headset/headset_service
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	backpack_contents = list(
	/obj/item/stack/thrones = 2,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,

	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
*/
