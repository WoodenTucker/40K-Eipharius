/datum/job/penitent //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Pilgrim"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 15 //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = 15
	supervisors = "The God Emperor of Mankind"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 50


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(1,2), rand(1,2), rand(1,2), rand (1,2)) //no stats when spawning so they are FORCED to select class first
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.stat = UNCONSCIOUS
		H.sleeping = 500
		to_chat(H, "<span class='notice'><b><font size=3>You are a Pilgrim. You left your home with little in search of more. Rumors of a holy site drew you to this planet, Eipharius. and now life is in your hands. <br> <span class = 'badmood'> + Go to your pilgrim tab and select your fate. + </span> </font></b></span>")
		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)

/datum/job/citizen //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Imperial Citizen"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //these boys are less gross
	total_positions = 10 //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = 10
	supervisors = "The God Emperor of Mankind"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 20


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.get_idcard()?.access = list(access_village) // so they open all 211
		to_chat(H, "<span class='notice'><b><font size=3>You are an Imperial Citizen local to the planet of Eipharius or at have been living in-system for long enough to become trusted among the locals here. <br> <span class = 'badmood'> + Go to your citizen tab and select your fate. + </span> </font></b></span>")

		H.verbs += list(
			/mob/living/carbon/human/proc/citizenclass,
		)


/*
Pilgrim Fate System
*/

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

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,) //removes verb
	var/fates = list("Mercenary","Scum","Nomad","Primitive")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)

		if("Primitive")
			U.add_skills(rand(5,8),rand(4,6),rand(3,6),rand(2,6),rand(2,6)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/glass_jar(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/clothing/head/helmet/hard_had(src.loc)
			new /obj/item/device/radio/headset/headset_service(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,) //removes verb
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(35))
				to_chat(U,"<span class='danger'><b><font size=4>THE VENATOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You have had glimpses of the future, in these waking dreams you see yourself fighting against a terrible foe. A dark and hideous creature, this day will come soon. Train and prepare yourself for this fight, track down the great beasts of the land. You are not hunted. You are the hunter. </font></b></span>")
				U.add_stats(rand(18,19), rand(14,16), rand(12,18), rand (12,14))
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/clothing/suit/armor/exile(src.loc)
				new /obj/item/melee/sword/machete/chopper/heavy/slayer(src.loc) 
				
			else if(prob(20))
				to_chat(U,"<span class='danger'><b><font size=4>THE MASTER</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You are the master of the sewer, ruler of sin, master of your own kingdom. Embrace the dark and grow evil in the deep dark. </font></b></span>")
				U.add_stats(rand(16,19), rand(16,19), rand(19,21), rand (14,16)) 
				U.add_skills(rand(5,8),rand(5,6),rand(5,6),rand(2,6),rand(5,6))
				new /obj/item/stack/thrones3/twenty(src.loc)
				new /obj/item/clothing/suit/armor/scum2(src.loc)
				new /obj/item/reagent_containers/food/snacks/threebread(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(2))
					new /obj/item/device/radio/headset/headset_eng(src.loc)
				if(prob(3))
					new /obj/item/device/radio/headset/red_team(src.loc)
				if(prob(5))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
				if(prob(5))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
			else // Add a fate that is high chance, you are a target of a bounty and give them clothing that cannot be removed which is a criminal marker. Criminal Barcode. Penitent Markings. Penitent Tattoo.
				to_chat(U,"<span class='danger'><b><font size=4>THE TRIBAL</font></b></span>")
				U.add_stats(rand(14,17), rand(14,17), rand(12,18), rand (12,14))
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/melee/trench_axe/bspear/hunter(src.loc) 
				new /obj/item/clothing/suit/armor/leather(src.loc)
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a local hunter and tribal from one of the many wandering tribes of Eipharius, you've only recently learned of Low Gothic and are adjusting to imperial rule.. </font></b></span>")
		if("Nomad")
			U.add_skills(rand(5,8),rand(7,9),rand(5,7),rand(1,3),rand(1,6)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			new /obj/item/clothing/head/ushanka2(src.loc)
			new /obj/item/device/radio/headset/headset_service(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc) 
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/storage/belt/stalker(src.loc) 
			new /obj/item/clothing/head/pillbox(src.loc) 
			new /obj/item/clothing/suit/chokha(src.loc) 
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE BEAST</font></b></span>")
				to_chat(U,"<span class='goodmood'>YOU ARE NOT MAN. YOU ARE BEAST MAN. GO OUT INTO WORLD AND DO BEAST THINGS.</font></b></span>")
				U.add_stats(rand(16,18), rand(12,16), rand(17,18), rand (12,14))
				new /obj/item/melee/trench_axe/bardiche/beast(src.loc)
				new /obj/item/reagent_containers/food/snacks/threebread(src.loc)
				new /obj/item/melee/sword/combat_knife/bowie(src.loc)
				new /obj/item/clothing/suit/armor/bonearmor(src.loc)
				new /obj/item/clothing/head/helmet/dragon(src.loc)
			else if(prob(35))
				to_chat(U,"<span class='danger'><b><font size=4>THE EXPLORER</font></b></span>")
				to_chat(U,"<span class='goodmood'>A skilled explorer of frontier worlds, you've plied your trade aiding the most unsensible of imperials and even xenos survive otherwise suicidal treks into alien worlds. Here you are once again, upon a xenos tainted world likely a few steps from your grave.</font></b></span>")
				U.add_stats(rand(14,18), rand(15,18), rand(16,17), rand (14,16))
				if(prob(30))
					new /obj/item/gun/energy/las/lasgun/shitty(src.loc)
				else if(prob(30))
					new /obj/item/gun/energy/pulse/pulsepistol(src.loc)
				else if(prob(10))
					new /obj/item/gun/energy/pulse/plasma/pistol/glock(src.loc)
				else
					new /obj/item/gun/energy/las/triplex(src.loc)
				new /obj/item/clothing/suit/armor/ranger2(src.loc)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE HUNTER</font></b></span>")
				to_chat(U,"<span class='goodmood'>You once were a traveller and a explorer, born with an innate gift for pathfinding and have worked in the past as a guide on your home planet.</font></b></span>")
				U.add_stats(rand(12,16), rand(14,17), rand(15,16), rand (12,16))
				if(prob(40))
					new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/glory(src.loc)
				else
					new /obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter(src.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful/ms(src.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful(src.loc)
				new /obj/item/clothing/suit/sherpa(src.loc)
				new /obj/item/reagent_containers/food/snacks/threebread(src.loc)
		if("Scum") // Pariah story. The magical 357
			 //ex criminal, not fed very well, but random stats
			U.add_skills(rand(5,10),rand(5,10),rand(5,10),rand(5,10),rand(5,10)) //melee, ranged, med, eng, surgery
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			new /obj/item/device/radio/headset/headset_sci(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/torch/self_lit(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(35))
				to_chat(U,"<span class='danger'><b><font size=4>THE OBSCURA DEALER</font></b></span>")
				to_chat(U,"<span class='goodmood'>You're a lowlife obscura dealer, with connections to the local gangs and heretical circles you make a nice living for yourself.</font></b></span>")
				U.add_stats(rand(13,16), rand(15,16), rand(12,16), rand (17,18))
				if(prob(50))
					equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
				else if(prob(50))
					new /obj/item/clothing/under/rank/victorian/blred(src.loc)
				else
					new /obj/item/clothing/under/rank/victorian/redbl(src.loc)
				new /obj/item/clothing/suit/scum(src.loc)
				new /obj/item/clothing/head/scum(src.loc)
				new /obj/item/storage/fancy/cigarettes/dromedaryco(src.loc)
				new /obj/item/storage/fancy/cigarettes/dromedaryco(src.loc)
				new /obj/item/storage/pill_bottle/happy(src.loc) 
				new /obj/item/storage/pill_bottle/happy(src.loc) 
				new /obj/item/storage/pill_bottle/zoom(src.loc) 
				new /obj/item/stack/thrones/five(src.loc)
				new /obj/item/device/flashlight/lantern(src.loc)
				new /obj/item/reagent_containers/food/snacks/threebread(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(5))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE PENITENT</font></b></span>")
				to_chat(U,"<span class='goodmood'>You are a penitent, after committing several horrible crimes to the imperium, you were arrested and imprisoned for years before being released by the church. As per your punishment you are marked and must take upon the burdens of others to ease your own...</font></b></span>")
				U.add_stats(rand(16,17), rand(16,17), rand(12,16), rand (10,15))
				new /obj/item/clothing/under/rank/penitent(src.loc)
				new /obj/item/gun/projectile/slugrevolver/penitent(src.loc)
				new /obj/item/ammo_magazine/c44(src.loc)
				new /obj/item/ammo_magazine/c44(src.loc)
				new /obj/item/clothing/suit/raggedrobe(src.loc)
				new /obj/item/clothing/head/plebhood(src.loc)
				if(prob(25))
					new /obj/item/device/radio/headset/headset_sci(src.loc)

		if("Mercenary")
			U.add_skills(rand(7,10),rand(8,10),rand(3,6),rand(2,4),rand(2,6)) //melee, ranged, med, eng, surgery
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/device/radio/headset/headset_service(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc) 
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE PALADIN</font></b></span>")
				to_chat(U,"<span class='goodmood'>A holy warrior of your chosen god, you work on behalf of the Ecclesiarchy(or the cult) as a slayer of the heretical and unfaithful. Face against the dark and protect your flock... for a price.</font></b></span>")
				U.add_stats(rand(16,18), rand(14,16), rand(16,18), rand (10,12)) //veteran mercenary
				new /obj/item/melee/trench_axe/glaive/adamantine(src.loc)
				new /obj/item/reagent_containers/food/snacks/threebread(src.loc)
				new /obj/item/clothing/suit/armor/brigandine(src.loc)
				new /obj/item/clothing/head/helmet/hero(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(45))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
			else if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE OPERATIVE</font></b></span>")
				to_chat(U,"<span class='goodmood'>You are an operative sent here by your benefactors, mysterious patrons from worlds away to do work that may unlock the final steps to their ultimate plan((A-Help with your idea or even ask for a mission if you can't think of anything.))</font></b></span>")
				U.add_stats(rand(13,17), rand(14,17), rand(14,17), rand (10,12)) //veteran mercenary
				new /obj/item/gun/projectile/talon/renegade(src.loc)
				new /obj/item/stack/thrones3/twenty(src.loc)
				new /obj/item/plastique(src.loc)
				new /obj/item/grenade/spawnergrenade/manhacks(src.loc)
				new /obj/item/ammo_casing/c45/ap(src.loc)
				new /obj/item/ammo_casing/c45/ap(src.loc)
				new /obj/item/clothing/suit/armor/armoredtrench(src.loc)
				if(prob(2))
					new /obj/item/device/radio/headset/headset_eng(src.loc)
				if(prob(2))
					new /obj/item/device/radio/headset/red_team(src.loc)
				if(prob(3))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
				if(prob(15))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE BOUNTY HUNTER</font></b></span>")
				to_chat(U,"<span class='goodmood'>A vicious bounty hunter traveling from system to system in search of their next payday, you live luxuriously only for moments before being plunged back into poverty. Hitching a ride to Eipharius with the last of your thrones, you gamble on the hope of finding work out here.(A-Help if nobody is hiring bounty hunters for a bounty target+pay)</font></b></span>")
				U.add_stats(rand(13,17), rand(14,17), rand(14,17), rand (12,15)) //veteran mercenary
				new /obj/item/gun/projectile/revolver/mateba(src.loc)
				new /obj/item/ammo_magazine/c50(src.loc)
				new /obj/item/ammo_magazine/c50(src.loc)
				if(prob(60))
					new /obj/item/clothing/suit/armor/bountyhunter2(src.loc)
					new /obj/item/clothing/head/bountyhead(src.loc)
				else if(prob(50))
					new /obj/item/clothing/suit/armor/carapace3(src.loc)
					new /obj/item/clothing/head/helmet/marinehelm(src.loc)
				else if(prob(30))
					new /obj/item/clothing/suit/armor/vanpa(src.loc)
				else
					new /obj/item/ammo_magazine/c50(src.loc)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				if(prob(15))
					new /obj/item/device/radio/headset/red_team(src.loc)
				if(prob(3))
					new /obj/item/device/radio/headset/headset_sci(src.loc)


/mob/living/carbon/human/proc/citizenclass()
	set name = "Select your class"
	set category = "Citizen"
	set desc = "Remember who you are..."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,) //removes verb
	var/fates = list("Mysterious Citizen","PDF","Miner","Fate Touched","Disgraced Noble")


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)

		if("Mysterious Citizen")
			U.add_skills(rand(7,10),rand(7,9),rand(2,4),rand(3,4),rand(2,3)) //melee, ranged, med, eng, surgery
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/device/radio/headset/headset_service(src.loc)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/device/flashlight/lantern(src.loc)
			U.stat = CONSCIOUS
			U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,)
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE VILLAIN</font></b></span>")
				to_chat(U,"<span class='goodmood'>You are a villain of Messina and your objective is the spread of fear -- the dead cannot feel terror so keep them alive if you can. Torture and torment -- but never allow an end to their suffering.</font></b></span>")
				U.add_stats(rand(14,15), rand(18,19), rand(18,21), rand (16,17)) 
				U.add_skills(rand(7,10),rand(7,9),rand(7,8),rand(3,4),rand(7,8)) //melee, ranged, med, eng, surgery
				new /obj/item/melee/sword/skinning_knife(src.loc)
				new /obj/item/storage/firstaid/surgery(src.loc)
				new /obj/item/clothing/mask/gas/prac_mask(src.loc)
				new /obj/item/clothing/suit/prac_arpon(src.loc)
				new /obj/item/clothing/gloves/prac_gloves(src.loc)
				new /obj/item/clothing/shoes/prac_boots(src.loc)
				new /obj/item/toothpuller(src.loc)
				equip_to_slot_or_store_or_drop(new /obj/item/card/id/ring/disgracedmedicae, slot_wear_id)
				equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				if(prob(5))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(1))
					new /obj/item/device/radio/headset/headset_eng(src.loc)
				if(prob(2))
					new /obj/item/device/radio/headset/red_team(src.loc)
				if(prob(3))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
			else if(prob(35))
				to_chat(U,"<span class='danger'><b><font size=4>THE THIEF</font></b></span>")
				to_chat(U,"<span class='goodmood'>You are a cunning thief and criminal, work alongside the Gangers to rake in the ultimate score.((Your clothes are chameleon items and can be turned into any disguise you desire))</font></b></span>")
				U.add_stats(rand(14,16), rand(14,16), rand(12,15), rand (15,17)) 
				new /obj/item/gun/projectile/talon/renegade(src.loc)
				if(prob(50))
					new /obj/item/device/batterer(src.loc)
				new /obj/item/clothing/suit/armor/slumcoat(src.loc)
				new /obj/item/storage/box/syndie_kit/imp_freedom(src.loc)
				new /obj/item/clothing/head/chameleon(src.loc)
				new /obj/item/clothing/under/chameleon(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(1))
					new /obj/item/device/radio/headset/headset_eng(src.loc)
				if(prob(5))
					new /obj/item/device/radio/headset/red_team(src.loc)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE INVESTIGATOR</font></b></span>")
				to_chat(U,"<span class='goodmood'>A private investigator working on behalf of the denizens of Messina, here you ply your trade and rub up against the horrors of imperial life. Every story, every death and tragedy -- decaying your soul into dust.</font></b></span>")
				U.add_stats(rand(14,16), rand(14,16), rand(12,15), rand (15,17)) 
				new /obj/item/gun/projectile/revolver/messina(src.loc)
				new /obj/item/ammo_magazine/a357/ms(src.loc)
				new /obj/item/ammo_magazine/a357/ms(src.loc)
				new /obj/item/storage/briefcase/crimekit(src.loc)
				new /obj/item/clothing/suit/armor/bountyhunter2(src.loc)
				new /obj/item/clothing/suit/armor/tduster(src.loc)
				new /obj/item/clothing/head/det(src.loc)
				new /obj/item/storage/fancy/cigarettes/dromedaryco(src.loc)
				new /obj/item/flame/lighter(src.loc)
				new /obj/item/clothing/under/det/black(src.loc)
		if("Miner")
			U.add_stats(rand(16,18), rand(14,16), rand(14,18), rand (12,14)) //
			U.add_skills(rand(6,8),rand(4,7),rand(3,6),rand(5,6),rand(2,6)) //melee, ranged, med, eng, surgery
			new /obj/item/clothing/gloves/thick(src.loc)
			new /obj/item/clothing/head/helmet/hard_had(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/storage/backpack/satchel/satchel_eng(src.loc)
			new /obj/item/pickaxe/newpick(src.loc)
			new /obj/item/clothing/suit/miner(src.loc)
			new /obj/item/clothing/shoes/prac_boots(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/ring/disgracedmedicae, slot_wear_id)
			new /obj/item/stack/thrones3/twenty(src.loc)
			new /obj/item/stack/thrones3/twenty(src.loc)
			to_chat(U,"<span class='danger'><b><font size=4>THE BROKEBACK MINER</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>A veteran of many digsites you travelled the galaxy looking for work.</font></b></span>")
			U.stat = CONSCIOUS
			U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,)
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("PDF")
			U.add_stats(rand(14,17), rand(12,17), rand(12,17), rand (12,14)) //
			U.add_skills(rand(5,7),rand(6,8),rand(3,3),rand(4,5),rand(2,2)) //melee, ranged, med, eng, surgery
			new /obj/item/clothing/gloves/thick(src.loc)
			new /obj/item/clothing/head/helmet/whiteshield(src.loc)
			new /obj/item/clothing/mask/gas/half/cadianrespirator(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
			new /obj/item/clothing/suit/armor/whiteshield(src.loc)
			new /obj/item/clothing/shoes/jackboots/cadian(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/dog_tag/guardsman, slot_wear_id)
			new /obj/item/device/radio/headset/red_team(src.loc)
			new /obj/item/cell/lasgun(src.loc)
			new /obj/item/cell/lasgun(src.loc)
			to_chat(U,"<span class='danger'><b><font size=4>THE ROOKIE</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Recently enlisted into the Messina PDF, you have yet to be assigned to a unit... still time to run from the Commissar while you can.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Disgraced Noble")
			U.add_skills(rand(6,8),rand(4,8),rand(2,8),rand(2,8),rand(2,8)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/device/radio/headset/headset_service(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE SORCERER</font></b></span>")
				to_chat(U,"<span class='goodmood'>You're a foul sorcerer of chaos magics -- unless you aren't. In which case you're a crackpot. Or are you? Who knows. Best hide your robes unless you want to be shot to pieces though...</font></b></span>")
				U.add_stats(rand(15,16), rand(14,16), rand(14,18), rand (12,16)) //
				new /obj/item/clothing/head/culthood/magus(src.loc)
				new /obj/item/clothing/suit/cultrobes/magusred(src.loc)
				if(prob(10))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
			else if(prob(60))
				to_chat(U,"<span class='danger'><b><font size=4>THE MERCHANT</font></b></span>")
				to_chat(U,"<span class='goodmood'>Guided by your lust for thrones you smelled opportunity on this newly founded world. You have connectoins to the local gangs and trade guilds, find allies to further your interests in Messina.</font></b></span>")
				U.add_stats(rand(14,15), rand(14,15), rand(15,17), rand (15,16))
				new /obj/item/clothing/suit/armor/vest/leather/tailcoat(src.loc)
				new /obj/item/stack/thrones/five(src.loc) 
				new /obj/item/stack/thrones2/ten(src.loc) 
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				if(prob(2))
					new /obj/item/device/radio/headset/headset_eng(src.loc)
				if(prob(2))
					new /obj/item/device/radio/headset/red_team(src.loc)
				if(prob(2))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE BARD</font></b></span>")
				to_chat(U,"<span class='goodmood'>A wandering bard you find yourself moving from tavern to tavern entertaining the masses for a few thrones at a time. This planet will surely be no different.</font></b></span>")
				U.add_stats(rand(15,16), rand(17,18), rand(14,16), rand (12,16)) //
				new /obj/item/stack/thrones/five(src.loc) 
				new /obj/item/stack/thrones2/ten(src.loc) 
				new /obj/item/stack/thrones3/twenty(src.loc)
				new /obj/item/clothing/suit/musician(src.loc)
				new /obj/item/clothing/head/musichat(src.loc)
				new /obj/item/instrument/guitar(src.loc)
				new /obj/item/device/violin(src.loc)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
		if("Fate Touched")
			U.add_stats(rand(16,17), rand(15,17), rand(10,16), rand (12,16)) 
			U.add_skills(rand(2,7),rand(5,7),rand(1,6),rand(1,6),rand(1,6)) //melee, ranged, med, eng, surgery
			new /obj/item/clothing/under/rank/chaplain(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/device/radio/headset/headset_sci(src.loc)
			new /obj/item/book/manual(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/device/flashlight/lantern(src.loc)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE SORCERER</font></b></span>")
				to_chat(U,"<span class='goodmood'>You're a foul sorcerer of chaos magics -- unless you aren't. In which case you're a crackpot. Or are you? Who knows. Best hide your robes unless you want to be shot to pieces though...</font></b></span>")
				U.add_stats(rand(15,16), rand(14,16), rand(14,18), rand (12,16)) //
				new /obj/item/clothing/head/culthood/magus(src.loc)
				new /obj/item/clothing/suit/cultrobes/magusred(src.loc)
				if(prob(10))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
			else
				to_chat(U,"<span class='danger'><b><font size=4>THE CLERIC</font></b></span>")
				to_chat(U,"<span class='goodmood'>Banish the heretic and redeem this world.</font></b></span>")
				U.add_stats(rand(14,15), rand(14,15), rand(15,17), rand (15,16))
				new /obj/item/clothing/suit/armor/knighthosp(src.loc)
				new /obj/item/melee/chain/inqcs(src.loc) 
				new /obj/item/clothing/head/helmet/hauberk(src.loc)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				new /obj/item/device/radio/headset/headset_sci(src.loc)

/datum/job/underboss  //Shrewd businessman
	title = "Underboss"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //he's important to the pilgrims, but not to anyone else
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "money"
	selection_color = "#530606"
	access = list(access_bar, access_ganger)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/underboss
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 100

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,19), rand(13,19), rand(12,19), rand (12,19))
		H.add_skills(rand(7,8),rand(7,9),rand(2,3),2,2) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You're an up-and-coming entrepreneur on Eipharius. After securing a hefty loan of 700 thrones from the local gang, you now own the local inn. You even had enough cash over to hire a loyal Ogryn to boot. The world is your oyster.. </font></b></span>")
/*
/datum/job/innkeeper
	title = "innkeeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "The Underboss"
	selection_color = "#530606"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/innkeeper
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 5

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(14,18), rand(8,11), rand(8,11), rand (12,18))
		H.add_skills(rand(4,6),rand(6,8),rand(4,5),3,5) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You're an innkeeper hired by the Underboss to keep his new, expensive establishment from collapsing. Sell alcohol, buy crops from the farmer to cook food, keep the place reasonably clean and be ready to duck once the intoxicated gun fights break out.</font></b></span>")
*/
/datum/job/pathfinder
	title = "Pathfinder"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 0
	spawn_positions = 0
	open_when_dead = 0
	supervisors = "Your own morality and ethics."
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
		H.add_stats(rand(15,17), rand(16,17), rand(10,13), rand (16,18)) //strong stats due to their... interesting fame of being cult leaders
		H.add_skills(rand(7,9),rand(7,10),rand(4,6),4,rand(6,8)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>Having arrived recently from the spires of Necromunda. You, a former courtier, sought to establish something of a collection here with your remaining wealth. For whatever reason the dark, insidious and terrible aspects of this planet intrigued you enough to abandon your world and seek out... Eipharius.</font></b></span>")

/datum/job/villagemedicae
	title = "Village Medicae"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 2
	spawn_positions = 2
	open_when_dead = 0
	supervisors = "Your own morality and ethics."
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/medicae
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 35

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,15), rand(14,17), rand(16,18), rand (18,22)) //strong stats due to their... interesting fame of being cult leaders
		H.add_skills(rand(6,8),rand(6,7),rand(8,10),4,rand(8,10)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>An experienced medicae from your homeworld, you are one of many who booked passage to Eipharius in the hopes of building industries of medicine on a new world.</font></b></span>")


//loadouts below here
/decl/hierarchy/outfit/job/medicae
	name = OUTFIT_JOB_NAME("Village Medicae")
	uniform = /obj/item/clothing/under/rank/victorian
	suit = /obj/item/clothing/suit/prac_arpon
	mask = /obj/item/clothing/mask/gas/prac_mask
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/prac_boots
	back = /obj/item/storage/backpack/satchel/warfare
	gloves = /obj/item/clothing/gloves/prac_gloves
	l_hand = /obj/item/storage/firstaid/adv
	l_ear = /obj/item/device/radio/headset/headset_sci
	l_pocket = /obj/item/device/flashlight/lantern
	r_hand = /obj/item/storage/box/coin
	belt = /obj/item/storage/belt/medical/full
	backpack_contents = list(
	/obj/item/card/id/ring/disgracedmedicae = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	)

/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Pilgrim")
	uniform = null//obj/item/clothing/under/rank/penitent
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = null//obj/item/clothing/shoes/prac_boots
	l_ear = null
	r_pocket = /obj/item/storage/box/coin
	r_ear = null
	id_type = /obj/item/card/id/pilgrim/penitent
	gloves = null
	pda_slot = null

/decl/hierarchy/outfit/job/ganger
	name = OUTFIT_JOB_NAME("Ganger")
	uniform = /obj/item/clothing/under/rank/victorian/black
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/warfare
	mask = null
	r_pocket = /obj/item/storage/box/coin
	l_pocket = /obj/item/device/flashlight/lantern
	belt = /obj/item/gun/projectile/revolver/villiers
	backpack_contents = list(
	/obj/item/ammo_magazine/a357 = 2,
	/obj/item/stack/thrones2 = 1,
	)

/decl/hierarchy/outfit/job/underboss
	name = OUTFIT_JOB_NAME("Underboss")
	uniform = /obj/item/clothing/under/suit_jacket/really_black
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/headset_service
	r_ear = null
	l_pocket = /obj/item/device/flashlight/lantern
	pda_slot = null
	id_type = null
	r_pocket = /obj/item/storage/box/coin
	shoes = /obj/item/clothing/shoes/dress
	suit_store = null
	backpack_contents = list(
	/obj/item/stack/thrones3/twenty = 1,
    )

/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/waiter
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/headset_service
	r_ear = null
	shoes = /obj/item/clothing/shoes/dress
	gloves = /obj/item/clothing/gloves/latex
	l_pocket = /obj/item/device/flashlight/lantern
	r_pocket = /obj/item/storage/box/coin
	pda_slot = null
	id_type = null
	suit_store = null
	backpack_contents = list(
	/obj/item/stack/thrones3/twenty = 1,
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
	r_pocket = /obj/item/storage/box/coin
	pda_slot = null
	backpack_contents = list(
	/obj/item/stack/thrones = 2,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,

	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


//Ogryn Bouncer

/decl/hierarchy/outfit/job/ogryn
	name = OUTFIT_JOB_NAME("Ogryn")
	uniform = /obj/item/clothing/under/ogryn/jumpsuit
	head = null
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/ogryn/bouncer
	pda_type = /obj/item/device/pda/penitent
	r_pocket = /obj/item/storage/box/coin
	l_ear = null
	r_ear = null
	l_pocket = /obj/item/device/flashlight/lantern
	belt = null
	pda_slot = null
	l_hand = /obj/item/melee/classic_baton/trench_club
	backpack_contents = list(
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,

	)

/decl/hierarchy/outfit/job/bouncer
	name = OUTFIT_JOB_NAME("Bouncer")
	uniform = /obj/item/clothing/under/ogryn/jumpsuit
	head = null
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/ogryn/bouncer
	id_type = /obj/item/card/id/pilgrim/innkeeper
	r_pocket = /obj/item/storage/box/coin
	pda_type = /obj/item/device/pda/penitent
	l_ear = null
	r_ear = null
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	l_hand = /obj/item/melee/classic_baton/trench_club
	backpack_contents = list(
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,

	)

/decl/hierarchy/outfit/job/scavenger
	name = OUTFIT_JOB_NAME("Scavenger")
	uniform = null
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = null
	l_ear = null
	r_ear = null
	id_type = null
	r_pocket = /obj/item/storage/box/coin
	gloves = null
	pda_slot = null
	l_hand = /obj/item/storage/toolbox/mechanical
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/headset_service
	belt = /obj/item/device/flashlight/lantern
	r_pocket = /obj/item/storage/box/coin

/datum/job/scavenger
    title = "Scavenger"
    department_flag = PIL
    social_class = SOCIAL_CLASS_MIN //these boys are gross
    total_positions = 1
    spawn_positions = 1
    supervisors = "You-yourself, don't listen-hear to man-things!"
    selection_color = "#848484"
    outfit_type = /decl/hierarchy/outfit/job/scavenger
    latejoin_at_spawnpoints = TRUE
    announced = FALSE
    cultist_chance = 0
    species_role = "Skaven"


    equip(var/mob/living/carbon/human/H)
        H.warfare_faction = IMPERIUM
        ..()
        H.add_stats(rand(14,15), rand(16,20), rand(13,16), rand (13,16))
        H.add_skills(rand(7,9),rand(9,16),rand(4,6),4,6) //melee, ranged, med, eng, surgery
        H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
        H.adjustStaminaLoss(-INFINITY)
        H.assign_random_quirk()
        to_chat(H, "<span class='notice'><b><font size=3>You-you are smarter than rest of pack-herd. You-you sneak on ship-transport to go on new world-planet.</font></b></span>")

/datum/job/penitent //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Pilgrim"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = INFINITY //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = INFINITY
	supervisors = "The God Emperor of Mankind"
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
	total_positions = 4
	spawn_positions = 4
	open_when_dead = 0
	supervisors = "yourself and your fellow gangers"
	selection_color = "#530606"
	access = list(access_village, access_ganger,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/ganger
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 5

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM

		..()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.stat = UNCONSCIOUS
		H.assign_random_quirk()
		H.verbs += list(
			/mob/living/carbon/human/proc/gangerclass,
		)
		to_chat(H, "<span class='notice'><b><font size=3>You left your previous world with a bounty on your head, and now you're in this shit hole with a few like-minded people. The Underboss owes you 700 thrones, see to it that the debt is repaid in full. Mug people, run gambling games, peddle drugs, harvest and sell organs. Get wealth, power and respect at any means necessary or die trying.</font></b></span>")


/mob/living/carbon/human/proc/gangerclass()
	set name = "Select your class"
	set category = "Ganger"
	set desc = "Choose your ganger archtype."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/gangerclass,)
	var/fates = list("Bruiser","Hitman", "Rogue Doc",)


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)
		if("Bruiser")
			U.add_stats(rand(14,18), rand(14,17), rand(17,19), rand (12,16))
			U.add_skills(rand(8,10),rand(5,6),rand(1,3),rand(2,6),rand(1,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc) 
			new /obj/item/clothing/suit/armor/goliathplate(src.loc) 
			new /obj/item/clothing/head/helmet/gangerhelm(src.loc) 
			new /obj/item/device/radio/headset/headset_service(src.loc) 
			new /obj/item/storage/backpack/satchel/warfare(src.loc) 
			new /obj/item/melee/classic_baton/trench_club(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)  
			new /obj/item/stack/thrones3/twenty(src.loc) 
			to_chat(U,"<span class='goodmood'>You're the muscle of the gang. Extract protection money and protect your fellow gang members.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/gangerclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Hitman")
			U.add_stats(rand(14,17), rand(15,17), rand(14,16), rand (14,16)) //ex criminal, not fed very well, but random stats
			U.add_skills(rand(5,6),rand(9,11),rand(2,4),rand(5,10),rand(2,4)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/penitent, slot_w_uniform)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc) 
			new /obj/item/clothing/suit/storage/vest/tactical(src.loc) 
			new /obj/item/device/radio/headset/headset_sci(src.loc) 
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id) 
			new /obj/item/gun/projectile/automatic/machinepistol(src.loc) 
			new /obj/item/ammo_magazine/c556(src.loc) 
			new /obj/item/ammo_magazine/c556(src.loc)
			to_chat(U, "<span class='goodmood'><b><font size=3>You're the hitman, the shadow of the gang. Take out any who oppose you.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/gangerclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Rogue Doc")
			U.add_stats(rand(15,17), rand(12,15), rand(12,15), rand (15,15))
			U.add_skills(rand(4,6),rand(4,6),rand(10,10),rand(9,10),rand(10,10)) //melee, ranged, med, eng, surgery
			new /obj/item/storage/backpack/satchel/warfare(src.loc) 
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/storage/belt/medical/full(src.loc)  
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc) 
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id) 
			new /obj/item/stack/thrones3/twenty(src.loc) 
			new /obj/item/stack/thrones3/twenty(src.loc) 
			new /obj/item/clothing/glasses/eyepatch/hud/medical(src.loc) 
			new /obj/item/storage/pill_bottle/happy(src.loc) 
			new /obj/item/storage/pill_bottle/happy(src.loc)
			to_chat(U,"<span class='goodmood'><b><font size=3>You're a step above the rest of the dealers when it comes to chemistry. Due to this, you were hired by a local gang after you caught their interest.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/gangerclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
/datum/job/bouncer
	title = "Bouncer"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Underboss"
	selection_color = "#530606"
	outfit_type = /decl/hierarchy/outfit/job/bouncer
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 0 // grog like emperorah :) // bouncer should only be cultist if the innkeeper is. as they would get easily indoctrinated by their dad/boss
	species_role = "Ogryn"


	equip(var/mob/living/carbon/human/H)
	//theres gonna be some redundencies here but I do not careeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(20,30), rand(15,18), rand(15,18), rand (2,5)) //ogryn are stronger than astartes or smh i don't remember
		H.add_skills(rand(10,13),1,1,1,1) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		to_chat(H, "<span class='notice'><b><font size=3>You're the biggest, baddest muscle on Eipharius. Protect the Underboss and his interests!</font></b></span>")



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
	pda_slot = null
	id_type = null
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 2,
	/obj/item/storage/box/beanbags = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
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
