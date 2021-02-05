/datum/job/penitent //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Pilgrim"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 6 //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = 6
	supervisors = "The Holy Inquisition"
	selection_color = "#515151"
	access = list(access_hydroponics,)
	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Pilgrim. You left your home with little in search of more. Rumors of a holy site drew you to this planet and now life is in your hands. Go to your pilgrim tab and select your fate. </font></b></span>")



		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)
/*
Pilgrim Fate System
*/

//yeah this might be the most retarded way of doing it but it works - plz no bully Matt

/mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)
	set name = "Select your class"
	set category = "Pilgrim"
	set desc = "Choose your new profession on this strange world."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	var/fates = list() //lists all possible fates
	fates += pick("Merchant","Bounty Hunter","Penitent",) //adds a fate randomly to essentially give rng pick
	fates += pick("Sherpa","Musician","Disgraced Medicae",) //adds a fate randomly to essentially give rng pick
	fates += pick("Miner","Stalker","Scum") //adds a fate randomly to essentially give rng pick

	M.mind.store_memory("[fates]") //should stop people from closing client and rerolling fates

	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Sherpa")
			equip_to_slot_or_del(new /obj/item/clothing/suit/innapron, slot_wear_suit)
			to_chat(U,"<span class='notice'>Your home world was destroyed in an Ork waaaaaagh, you managed to escape before the planet was destroyed. On your home world, you were a navigator, born with an innate gift for pathfinding. Now you guide lost Pilgrims to and from for a few thrones each.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Penitent")
			equip_to_slot_or_del(new /obj/item/clothing/suit/raggedrobe, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/plebhood, slot_head)
			to_chat(U, "<span class='notice'><b><font size=3>You are a penitent, forced to tour the galaxy and toil until death in hopes of one day redeeming yourself. In your youth, you were an unknowing daemon-worshipper. Years of torment and re-education by the Inquisition allowed you this one chance at redemption. Labour endlessly in His name.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Bounty Hunter")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (8,12)) //veteran hunter
			U.add_skills(rand(5,8),rand(5,8),rand(1,3),0,0)
			to_chat(U,"<span class='notice'><b><font size=3>Brought to this planet in search of work, in your youth you were a Sergeant in the Astra Militarum, you've spent the rest of your adulthood as a member of the Imperium's Bounty Hunter guild. Years of experience and hunting have hardened you and made you a force to be reckoned with. Work with the local Magistratum to hunt down wanted criminals or offer your services to the Rogue Trader.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Merchant")
			equip_to_slot_or_del(new /obj/item/clothing/suit/innapron, slot_wear_suit)
			to_chat(U,"<span class='notice'>Guided by your lust for thrones you smelled opportunity on this newly founded world. Work with the village and the outpost to organize trade between the two.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Musician")
			equip_to_slot_or_del(new /obj/item/device/violin, slot_l_hand)

			to_chat(U,"<span class='notice'><b><font size=3>A wandering bard you find yourself moving from tavern to tavern entertaining the masses for a few thrones at a time. This planet will surely be no different. </font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Disgraced Medicae")
			U.add_skills(0,0,rand(5,9),0,rand(5,9))
			to_chat(U,"<span class='notice'><b><font size=3>A few too many slips and you found yourself stripped of your medical license but not the knowledge you gained for years of schooling and practice. Set up shop on this new world and hope no one asks to see your credentials.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Miner")
			U.add_stats(rand(10,13),rand(8,12),rand(10,12),8)
			to_chat(U,"<span class='notice'><b><font size=3>A veteran of many digsites you travelled the galaxy looking for work. When you heard the Adeptus Mechanicus set up shop here, you knew they would ever be hungry for ore and the services you could provide.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Stalker")
			U.add_skills(rand(1,3),rand(5,8),0,0,0)
			to_chat(U,"<span class='notice'><b><font size=3>Ever in search of new game to hunt, you travelled to this new world in search of trophy and meat. Use your skills as a hunter to track down and kill fauna, sell your meats for thrones and become rich!</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Scum")
			to_chat(U,"<span class='notice'><b><font size=3>Always on the run, always moving from scheme to scheme you once again find yourself on a new world. You'll do whatever it takes for a throne or two. Scamming, gambling, drug dealing. You are the scum of the Imperium but you wouldn't have it any other way.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)




/datum/job/innkeeper  //so that the inn always has someone working
	title = "Innkeeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //better off than your average gross pilgrim
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Money"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_bar) //TODO, figure out access stuff for them
	outfit_type = /decl/hierarchy/outfit/job/innkeeper
	latejoin_at_spawnpoints = TRUE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You landed on this outpost some time ago, with the savings you had, you opened an inn hoping to grow your wealth serving the various pilgrims and travelers. Trade with gatherers and the outpost to always stay stocked so that no paying customer will be without food and drink. You have a full kitchen, alcohol and small farm to grow what you need. </font></b></span>")


//loadouts below here
/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Pilgrim")
	uniform = /obj/item/clothing/under/rank/penitent
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/innapron
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/bardhat
	backpack_contents = list(/obj/item/thrones/bundle/t50=1) //they have some money for trade
	l_ear = null
	r_ear = null
	shoes = /obj/item/clothing/shoes/vigilante
