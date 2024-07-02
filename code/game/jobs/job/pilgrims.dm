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
	cultist_chance = 80


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(1,2), rand(1,2), rand(1,2), rand (1,2)) //no stats when spawning so they are FORCED to select class first
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.voice_in_head(pick(GLOB.lone_thoughts))
		H.stat = UNCONSCIOUS
		H.sleeping = 500
		to_chat(H, "<span class='notice'><b><font size=3>You are a Pilgrim. You left your home with little in search of more. Rumors of a holy site drew you to this planet, Messina. and now life is in your hands. <br> <span class = 'badmood'> + Go to your pilgrim tab and select your fate. + </span> </font></b></span>")
		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
			/mob/living/carbon/human/proc/ideology,
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
	latejoin_at_spawnpoints = FALSE
	announced = FALSE
	cultist_chance = 50


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.voice_in_head(pick(GLOB.lone_thoughts))
		H.get_idcard()?.access = list(access_village) // so they open all 211
		to_chat(H, "<span class='notice'><b><font size=3>You are an Imperial Citizen local to the planet of Messina or at have been living in-system for long enough to become trusted among the locals here. <br> <span class = 'badmood'> + Go to your citizen tab and select your fate. + </span> </font></b></span>")

		H.verbs += list(
			/mob/living/carbon/human/proc/citizenclass,
			/mob/living/carbon/human/proc/ideology,
		)


//mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)
/mob/living/carbon/human/proc/ideology()
	set name = "Select your ideology"
	set category = "CHOOSE YOUR FATE"
	set desc = "Choose your character's ideology."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/ideology,) //removes verb
	var/fates = list("OTHER","Puritan - Amalathian","Puritan - Ardentite","Puritan - Monodominant","Radical - Istvaanian","Radical - Oblationist","Radical - Cognitae","Radical - Recongrigator","Radical - Xanthite",)


	var/classchoice = input("Choose your ideology", "Available ideologies") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)

		if("OTHER")
			to_chat(U,"<span class='danger'><b><font size=4>CUSTOM IDEOLOGY</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Your beliefs and faith are unique to your character, specific to a unique story not commonly found amongst mankind. Following either an extreme heretical, xenos or puritan ideology such as the ways of Chaos Undivided or the Cult Mechanicus.</font></b></span>")
		if("Puritan - Amalathian")
			to_chat(U,"<span class='danger'><b><font size=4>THE AMALATHIAN</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>The Amalathians believe that the Emperor has a grand plan and that it is unfolding as it should. They are therefore concerned with maintaining the status quo and react vehemently against change. They are less concerned about the threat of mutation, witchery and the like, and more active in ensuring there is harmony within the vast Imperial organizations, that any rivalries and discord are dealt with and kept to a minimum. It is the code of the Amalathian that strength is achieved through unity, and politicking and change will serve only to destabilize the Imperium. Noted amongst the many allies of the Amalathian are the Adeptus Arbites and local security forces. The mandate of such organizations being the upholding of Imperial law and order thus maintaining the status quo and, in the eyes of the Amalathian, the strength inherent in the Imperium and the Emperor's design for it. The ideologies of Istvaanism and Recongregation being polar opposites, they are considered the ultimate enemies of the Amalathian.</font></b></span>")
		if("Puritan - Ardentite")
			to_chat(U,"<span class='danger'><b><font size=4>THE ARDENTITE</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Ardentites are centered around the concept of the Emperor Incarnate but instead of believing in a single Divine Avatar, the Ardentities feel that the power of the God-Emperor is manifest either through the entirety of Mankind itself. Many feel that as Humanity evolves into becoming a psychic race, which is evidenced by the gradual rise in mutation and rise of psychic abilities, that the ultimate aim of the Emperor is to protect Mankind in this vulnerable state by disseminating his power throughout Humanity.</font></b></span>")
		if("Puritan - Monodominant")
			to_chat(U,"<span class='danger'><b><font size=4>THE MONODOMINANT</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Monodominants are an extremist faction known for their uncompromising prosecution of perceived enemies of the Imperium. As their name implies, they are of the firm belief that the Imperium, and only the Imperium, should be allowed to exist. They are zealous supporters of the concept of manifest destiny, and believe that this is only achievable by the extermination of all threats and impurities. Xenos, witchcraft, heresy, blasphemy, mutation and civil disobedience are crimes punishable by death in the eyes of a Monodominant and those accused of such crimes can expect no reprieve. They see the Imperium's war as a racial struggle of survival, and hope to kill enough aliens, mutants, psykers, and other 'inhuman' beings that natural selection will be allowed to take its course and Humanity will rise to the position of ultimate power.</font></b></span>")
		if("Radical - Istvaanian")
			to_chat(U,"<span class='danger'><b><font size=4>THE ISTVAANIAN</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>To adherents of this ideology, conflict is desirable to further progress through strife. It holds that mankind has made its greatest achievements after periods of conflict, such as the Horus Heresy, or Age of Apostasy. It is the place of the Istvaanians to strengthen mankind through adversity, and so follow a 'survival of the fittest' doctrine. The philosophy is named after the Isstvan III virus-bombings that initiated the Horus Heresy. A secretive group of Istvaanians took on the name Elucidium to hide the true nature of the activities. The chief concern of Istvaanians is engendering and managing vital conflict. Though all conflict of any type interests them, raw warfare on a massive scale is what concerns them the most. The Istvaanians hold Sebastian Thor in particularly high regard, for his sweeping reforms were made possible only due to the bloodshed of the Age of Apostasy. Istvaanians' interventions are always a matter of judgement and wisdom, as above all they wish to strengthen the Imperium, not destroy it. It is those who are perceived as weak in their eyes that are the most likely to be subjected to their attentions.</font></b></span>")
		if("Radical - Oblationist")
			to_chat(U,"<span class='danger'><b><font size=4>THE OBLATIONIST</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Oblationists believe that the Warp, the xenos and the unclean are utterly damning and those who utilise them must face the ultimate sanction. Yet they also believe their use is necessary to overcome mankind's enemies. Therefore the righteous must sacrifice themselves and embrace damnation in order for humanity to survive. They hold an intolerance of all other radical factions in a manner similar to the most Puritanical factions, believing that only they have the right to battle against the great enemy. For it is their duty and honour to embrace the sins of the warp on behalf of all mankind.</font></b></span>")
		if("Radical - Cognitae")
			to_chat(U,"<span class='danger'><b><font size=4>THE COGNITAE</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>The goal of the Cognitae is to 'liberate' Humanity from what it sees as the dogmatic oppression of the Imperium, using the powers of Chaos to achieve this. According to Inquisitor Gideon Ravenor, the Cognitae's aim was to develop, 'by means psychic, eugenic and noetic,' a generation of individuals who would work to further the aims of Chaos in the Scarus Sector. The Cognitae operates a network of 'academies' which engage in psychic training, eugenics, cloning, and forbidden sciences. The Cognitae is associated with the mysterious King in Yellow, though if he controls them or they control him is unclear.</font></b></span>")
		if("Radical - Recongrigator")
			to_chat(U,"<span class='danger'><b><font size=4>THE RECONGREGATOR</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Recongregationists hold that the Imperium, after millennia, has become decadent and corrupt. To remedy this, Recongregators consider that the Imperium should be rebuilt, lest it stagnate further and collapse under the pressure of countless threats from both without and within. The main issue within the Recongregators themselves is if this change to the Imperium should be sudden or gradual. They often help anti-Imperial sects and covens, even altering the cult's philosophies to match their own if possible. They are not above extreme action when necessary.</font></b></span>")
		if("Radical - Xanthite")
			to_chat(U,"<span class='danger'><b><font size=4>THE XANTHITE</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Xanthites do not advocate giving in to Chaos, bur rather wish to capture its essence and turn it to useful rather than destructive purposes. In the same way the Imperium uses the Warp for travel, Xanthites believe that other facets of Chaos can be controlled and tamed to benefit mankind. Thus these agents of radical heresy investigate all aspects of the Warp and Chaos often spending lifetimes in search of heretical knowledge, imbuing its power into themselves whenever possible. Xanthites have even been known to establish their own Chaos Cults, using the sect to unravel ancient mysteries and lore. Most though a Xanthite is a member of the artisan or noble classes of Imperial Society obsessed wiht forbidden lore.</font></b></span>")

/*
Pilgrim Fate System
*/

//mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)
/mob/living/carbon/human/proc/penitentclass()
	set name = "Select your class"
	set category = "CHOOSE YOUR FATE"
	set desc = "Choose your new profession on this strange world."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,) //removes verb
	var/fates = list("Mercenary","Scum","Nomad","Messian Tribal","Witch Hunter",)


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates

 //10 is base stat, below 12 is child stat, childs are supposed to be somewhere between 6-14 in stats.
 //skills are between 1-5 for roles that have little to no reason to know something, 5-10 if they are able to naturally learn those skills, 5 is baseline,
	switch(classchoice)

		if("Messian Tribal")
			U.add_skills(rand(5,8),rand(4,6),rand(3,6),rand(2,6),rand(2,6)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/glass_jar(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			new /obj/item/device/radio/headset/headset_service(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc)
			new /obj/item/paper/administratum(src.loc)
			new /obj/item/pen(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent, slot_wear_id)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,) //removes verb
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
			if(prob(15))
				to_chat(U,"<span class='danger'><b><font size=4>THE VENATOR</font></b></span>")
				to_chat(U,"<span class='goodmood'><b><font size=3>You have had glimpses of the future, in these waking dreams you see yourself fighting against a terrible foe. A dark and hideous creature, this day will come soon. Train and prepare yourself for this fight, track down the great beasts of the land. You are not hunted. You are the hunter. </font></b></span>")
				U.add_stats(rand(18,19), rand(14,16), rand(12,18), rand (12,14))
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/clothing/suit/armor/exile(src.loc)
				new /obj/item/melee/sword/machete/chopper/heavy/slayer(src.loc) 
				
			else if(prob(15))
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
			else if(prob(35))
				to_chat(U,"<span class='danger'><b><font size=4>THE HUNTER</font></b></span>")
				to_chat(U,"<span class='goodmood'>You once were a traveller and a explorer, born with an innate gift for pathfinding among the Messian folk of the greater region. With the arrival of the Imperial Dogs came the shackling, forced servitude to a cruel governor and now you spend your days killing beasts to feed the fat nobles of the Imperium.</font></b></span>")
				U.add_stats(rand(12,16), rand(14,17), rand(15,16), rand (12,16))
				if(prob(40))
					new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/glory(src.loc)
				else
					new /obj/item/gun/projectile/thrower(src.loc)
					new /obj/item/storage/box/sniperammo/apds/bos(src.loc)
					new /obj/item/storage/box/sniperammo/apds/bos(src.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful/ms(src.loc)
				new /obj/item/ammo_magazine/handful/brifle_handful(src.loc)
				new /obj/item/clothing/suit/sherpa(src.loc)
				new /obj/item/reagent_containers/food/snacks/threebread(src.loc)
			else // Add a fate that is high chance, you are a target of a bounty and give them clothing that cannot be removed which is a criminal marker. Criminal Barcode. Penitent Markings. Penitent Tattoo.
				to_chat(U,"<span class='danger'><b><font size=4>THE TRIBAL</font></b></span>")
				U.add_stats(rand(14,17), rand(14,17), rand(12,18), rand (12,14))
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/melee/trench_axe/bspear/hunter(src.loc) 
				new /obj/item/clothing/suit/armor/leather(src.loc)
				to_chat(U,"<span class='goodmood'><b><font size=3>You are a local hunter and tribal from one of the many wandering tribes of Messina, you've only recently learned of Low Gothic and are adjusting to imperial rule.. </font></b></span>")
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
			else
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
				new /obj/item/paper/administratum/weapon4(src.loc)
				new /obj/item/pen(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
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
				new /obj/item/paper/administratum/weapon3(src.loc)
				new /obj/item/pen(src.loc)
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
				new /obj/item/paper/administratum/weapon3(src.loc)
				new /obj/item/pen(src.loc)
				if(prob(25))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
		if("Witch Hunter")
			U.add_skills(rand(7,10),rand(8,10),rand(3,6),rand(2,4),rand(2,6)) //melee, ranged, med, eng, surgery
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/device/flashlight/lantern(src.loc) 
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc)
			new /obj/item/clothing/accessory/holster/hip(src.loc)
			new /obj/item/gun/energy/las/laspistol(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/key/grand/monastary, slot_wear_id)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U,"<span class='danger'><b><font size=4>THE WITCH HUNTER</font></b></span>")
			to_chat(U,"<span class='goodmood'>You are a Witch Hunter -- a unique subset of the Bounty Hunter Guild attached to the Chamber Militant, working both as Servant to the Ecclesiarchy and a 'bounty hunter' that the Ecclesiarchy can rely upon without tainting their own hands.</font></b></span>")
			U.add_stats(rand(16,17), rand(14,16), rand(14,16), rand (10,12)) //veteran mercenary
			new /obj/item/melee/sword/cane(src.loc)
			new /obj/item/clothing/head/helmet/witch(src.loc)
			new /obj/item/clothing/suit/armor/witch(src.loc)
			new /obj/item/device/radio/headset/headset_sci(src.loc)
			new /obj/item/paper/administratum/weapon4(src.loc)
			new /obj/item/pen(src.loc)
			new /obj/item/paper/administratum/theta(src.loc)
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
			if(prob(25))
				to_chat(U,"<span class='danger'><b><font size=4>THE PALADIN</font></b></span>")
				to_chat(U,"<span class='goodmood'>A holy warrior of your chosen god, you work on behalf of the Ecclesiarchy(or the cult) as a slayer of the heretical and unfaithful. Face against the dark and protect your flock... for a price.</font></b></span>")
				U.add_stats(rand(16,18), rand(14,16), rand(16,18), rand (10,12)) //veteran mercenary
				new /obj/item/melee/trench_axe/glaive/adamantine(src.loc)
				new /obj/item/clothing/suit/armor/brigandine(src.loc)
				new /obj/item/clothing/head/helmet/hero(src.loc)
				new /obj/item/paper/administratum/weapon3(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
				new /obj/item/pen(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
				if(prob(45))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
			else if(prob(10))
				to_chat(U,"<span class='danger'><b><font size=4>THE OPERATIVE</font></b></span>")
				to_chat(U,"<span class='goodmood'>You are an operative sent here by your benefactors, mysterious patrons from worlds away to do work that may unlock the final steps to their ultimate plan((A-Help with your idea or even ask for a mission if you can't think of anything.))</font></b></span>")
				U.add_stats(rand(13,17), rand(14,17), rand(14,17), rand (10,12)) //veteran mercenary
				new /obj/item/gun/projectile/talon/renegade(src.loc)
				new /obj/item/stack/thrones3/twenty(src.loc)
				new /obj/item/plastique(src.loc)
				new /obj/item/grenade/spawnergrenade/manhacks(src.loc)
				new /obj/item/ammo_casing/c45/ap(src.loc)
				new /obj/item/ammo_casing/c45/ap(src.loc)
				new /obj/item/paper/administratum/weapon4(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
				new /obj/item/pen(src.loc)
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
				to_chat(U,"<span class='goodmood'>A vicious bounty hunter traveling from system to system in search of their next payday, you live luxuriously only for moments before being plunged back into poverty. Hitching a ride to Messina with the last of your thrones, you gamble on the hope of finding work out here.(A-Help if nobody is hiring bounty hunters for a bounty target+pay)</font></b></span>")
				U.add_stats(rand(13,17), rand(14,17), rand(14,17), rand (12,15)) //veteran mercenary
				new /obj/item/gun/projectile/revolver/mateba(src.loc)
				new /obj/item/ammo_magazine/c50(src.loc)
				new /obj/item/ammo_magazine/c50(src.loc)
				new /obj/item/paper/administratum/weapon4(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
				new /obj/item/pen(src.loc)
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
				if(prob(15))
					new /obj/item/device/radio/headset/red_team(src.loc)
					new /obj/item/card/id/key/middle/jail(src.loc)
				if(prob(3))
					new /obj/item/device/radio/headset/headset_sci(src.loc)
					new /obj/item/card/id/key/grand/monastary(src.loc)


/mob/living/carbon/human/proc/citizenclass()
	set name = "Select your class"
	set category = "CHOOSE YOUR FATE"
	set desc = "Remember who you are..."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,) //removes verb
	var/fates = list("Mysterious Citizen","PDF","Miner","Fate Touched","Disgraced Noble","Honour Guard")


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
				new /obj/item/paper/administratum/weapon3(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
				new /obj/item/pen(src.loc)
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
			new /obj/item/paper/administratum/weapon4(src.loc)
			new /obj/item/pen(src.loc)
			to_chat(U,"<span class='danger'><b><font size=4>THE BROKEBACK MINER</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>A veteran of many digsites you travelled the galaxy looking for work.</font></b></span>")
			U.stat = CONSCIOUS
			U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,)
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Honour Guard")
			U.add_stats(rand(15,17), rand(14,17), rand(14,16), rand (13,15)) //
			U.add_skills(rand(6,8),rand(6,8),rand(4,6),rand(5,6),rand(2,6)) //melee, ranged, med, eng, surgery
			new /obj/item/clothing/gloves/thick(src.loc)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/victorian, slot_w_uniform)
			new /obj/item/device/radio/headset/red_team(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc) 
			new /obj/item/clothing/shoes/jackboots/noble(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/key/grand/monastary, slot_wear_id)
			new /obj/item/stack/thrones/five(src.loc)
			new /obj/item/clothing/head/helmet/hevhelm/palace(src.loc)
			new /obj/item/clothing/suit/armor/brigandine/palace(src.loc)
			new /obj/item/melee/trench_axe/glaive/adamantine(src.loc)
			new /obj/item/paper/administratum/weapon3(src.loc)
			new /obj/item/pen(src.loc)
			new /obj/item/paper/administratum/theta(src.loc)
			to_chat(U,"<span class='danger'><b><font size=4>THE PROTECTORATE</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Skilled in the arts of blade and gun lore, you are one of the rare individuals selected by EITHER; The Ecclesiarchy or House Sondar(Your Choice) to protect them from the heretic, the alien and worst of all -- the human. Find the Steward/Commissar or Governor for your assignment...</font></b></span>")
			U.stat = CONSCIOUS
			U.verbs -= list(/mob/living/carbon/human/proc/citizenclass,)
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("PDF")
			U.add_stats(rand(14,17), rand(12,17), rand(12,17), rand (12,14)) //
			U.add_skills(rand(5,7),rand(6,8),rand(3,3),rand(4,5),rand(2,2)) //melee, ranged, med, eng, surgery
			new /obj/item/clothing/gloves/thick(src.loc)
			new /obj/item/clothing/mask/gas/half/cadianrespirator(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/cadian_uniform, slot_w_uniform)
			new /obj/item/storage/backpack/satchel/warfare(src.loc)
			if(prob(15))
				new /obj/item/clothing/suit/armor/whiteshield/pdf(src.loc)
				new /obj/item/clothing/head/helmet/whiteshield/pdf(src.loc)
				new /obj/item/gun/projectile/automatic/heavystubber(src.loc)
			if(prob(45))
				new /obj/item/clothing/suit/armor/whiteshield/pdf/medic(src.loc)
				new /obj/item/storage/belt/medical/full(src.loc)
				new /obj/item/clothing/head/helmet/whiteshield/pdf/medic(src.loc)
			else
				new /obj/item/clothing/suit/armor/whiteshield/pdf/spec(src.loc)
				new /obj/item/clothing/head/helmet/whiteshield/pdf/spec(src.loc)
				new /obj/item/cell/plasma(src.loc)
			new /obj/item/clothing/shoes/jackboots/cadian(src.loc)
			new /obj/item/device/flashlight/lantern(src.loc)
			new /obj/item/paper/administratum/weapon3(src.loc)
			new /obj/item/paper/administratum/theta(src.loc)
			new /obj/item/pen(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/dog_tag/guardsman, slot_wear_id)
			new /obj/item/device/radio/headset/red_team(src.loc)
			new /obj/item/cell/lasgun(src.loc)
			new /obj/item/cell/lasgun(src.loc)
			to_chat(U,"<span class='danger'><b><font size=4>THE ROOKIE</font></b></span>")
			to_chat(U,"<span class='goodmood'><b><font size=3>Recently enlisted into the Messian PDF, you have yet to be assigned to a unit... still time to run from the Commissar while you can.</font></b></span>")
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
				new /obj/item/paper/administratum/weapon4(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
				new /obj/item/pen(src.loc)
				var/datum/heretic_deity/deity = GOD(U.client.prefs.cult)
					deity.add_cultist(U)
			else if(prob(40))
				to_chat(U,"<span class='danger'><b><font size=4>THE MERCHANT</font></b></span>")
				to_chat(U,"<span class='goodmood'>Guided by your lust for thrones you smelled opportunity on this newly founded world. You have connectoins to the local gangs and trade guilds, find allies to further your interests in Messina.</font></b></span>")
				U.add_stats(rand(14,15), rand(14,15), rand(15,17), rand (15,16))
				new /obj/item/clothing/suit/armor/vest/leather/tailcoat(src.loc)
				new /obj/item/stack/thrones/five(src.loc) 
				new /obj/item/stack/thrones2/ten(src.loc) 
				new /obj/item/stack/thrones3/twenty(src.loc) 
				new /obj/item/paper/administratum/weapon4(src.loc)
				new /obj/item/paper/administratum/theta(src.loc)
				new /obj/item/pen(src.loc)
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
				new /obj/item/paper/administratum/weapon3(src.loc)
				new /obj/item/pen(src.loc)
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
			if(prob(10))
				to_chat(U,"<span class='danger'><b><font size=4>THE SORCERER</font></b></span>")
				to_chat(U,"<span class='goodmood'>You're a foul sorcerer of chaos magics -- unless you aren't. In which case you're a crackpot. Or are you? Who knows. Best hide your robes unless you want to be shot to pieces though...</font></b></span>")
				U.add_stats(rand(15,16), rand(14,16), rand(14,18), rand (12,16)) //
				new /obj/item/clothing/suit/armor/knighthosp(src.loc)
				new /obj/item/clothing/head/helmet/hauberk(src.loc)
				new /obj/item/reagent_containers/food/snacks/warfare/rat(src.loc)
				new /obj/item/device/radio/headset/headset_sci(src.loc)
				if(prob(25))
					new /obj/item/device/radio/headset/blue_team/all(src.loc)
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
				new /obj/item/paper/administratum/weapon4(src.loc)
				new /obj/item/pen(src.loc)

/datum/job/underboss  //Shrewd businessman
	title = "Tavern Keeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //he's important to the pilgrims, but not to anyone else
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "HOUSE GOLIATH"
	selection_color = "#530606"
	access = list(access_bar, access_ganger)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/underboss
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 35
	species_role = "Ogryn"

	equip(var/mob/living/carbon/human/H)
	//theres gonna be some redundencies here but I do not careeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(20,30), rand(15,18), rand(15,18), rand (2,5)) //ogryn are stronger than astartes or smh i don't remember
		H.add_skills(rand(10,13),1,1,1,1) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.verbs += list(
			/mob/living/carbon/human/proc/ideology,
		)
		to_chat(H, "<span class='notice'><b><font size=3>You're an up-and-coming entrepreneur on Messina -- the wisest most big brain Ogryn bonehead that ever lived. You were sent here by House Goliath from Necromunda who supplies most of the sub-sector through the cold-trade, and the Militarum with cheap manufactured autoguns who give it by the freight-load to private armies in the frontier. Goliath expects big things from you, so you best get to grinding Oggy... </font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>You're an up-and-coming entrepreneur on Messina -- the wisest most big brain Ogryn bonehead that ever lived. You were sent here by House Goliath from Necromunda who supplies most of the sub-sector through the cold-trade, and the Militarum with cheap manufactured autoguns who give it by the freight-load to private armies in the frontier. Goliath expects big things from you, so you best get to grinding Oggy... </font></b></span>")

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

/datum/job/noble
	title = "Vane Noble"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	open_when_dead = 0
	announced = FALSE
	supervisors = "House Vane."
	selection_color = "#315dd4"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MAX
	announced = 0
	access = list(225,247,access_village,access_daemon)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/noble
	latejoin_at_spawnpoints = TRUE
	cultist_chance = 35

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.get_idcard()?.access = list(225,247,access_village,access_daemon)
		H.fully_replace_character_name("[current_name] Vane")
		H.verbs += list(
			/mob/living/carbon/human/proc/ideology,
		)
		H.add_stats(rand(14,17), rand(14,17), rand(14,17), rand(12,16)) 
		H.add_skills(rand(7,11),rand(7,11),rand(2,8),6,rand(2,8)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.set_trait(new/datum/trait/death_tolerant())
		H.assign_random_quirk()
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a loyal crew member to the Lord Captain and the head of the Vane dynasty, your noble title being granted by a letter of marque given to you by the Lord Trader inducting you into House Vane. You served directly to the Lord Captain years before they settled on Messina and helped the Lord Militant conquer the fringe, now your blade is dulled and you no longer find yourself serving on a voidship but instead in this accursed city of Messina.. </font></b></span>")


/datum/job/pathfinder
	title = "Pathfinder"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Your own morality and ethics."
	selection_color = "#848484"
	access = list(253)
	minimal_access = list(253)
	outfit_type = /decl/hierarchy/outfit/job/administrator
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 100

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.get_idcard()?.access = list(253)
		H.add_stats(rand(15,17), rand(16,17), rand(10,13), rand (16,18)) //strong stats due to their... interesting fame of being cult leaders
		H.add_skills(rand(7,9),rand(7,10),rand(4,6),4,rand(6,8)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.set_trait(new/datum/trait/death_tolerant())
		H.assign_random_quirk()
		H.verbs += list(
			/mob/living/carbon/human/proc/ideology,
		)
		to_chat(H, "<span class='notice'><b><font size=3>Having arrived recently from the spires of Necromunda. You, a former courtier, sought to establish something of a collection here with your remaining wealth. For whatever reason the dark, insidious and terrible aspects of this planet intrigued you enough to abandon your world and seek out... Messina.</font></b></span>")

/datum/job/villagemedicae
	title = "Biologis Medicae"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 3
	spawn_positions = 3
	open_when_dead = 0
	supervisors = "The Magos Biologis."
	selection_color = "#848484"
	access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/medicae
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 45

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(13,16), rand(14,17), rand(16,18), rand (18,22)) //strong stats due to their... interesting fame of being cult leaders
		H.add_skills(rand(6,9),rand(6,10),rand(8,10),4,rand(8,10)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.set_trait(new/datum/trait/death_tolerant())
		H.assign_random_quirk()
		H.voice_in_head(pick(GLOB.lone_thoughts))
		H.verbs += list(
			/mob/living/carbon/human/proc/ideology,
		)
		to_chat(H, "<span class='notice'><b><font size=3>An experienced medicae from your homeworld, you are one of many who booked passage to Messina in the hopes of building industries of medicine on a new world. You serve directly under the Magos Biologis who commands over the medicae of this world.</font></b></span>")


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
	l_ear = /obj/item/device/radio/headset/headset_eng //Meant to be with the Mechanicus now.
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
	l_ear = /obj/item/device/radio/headset/ert2
	r_pocket = /obj/item/storage/box/coin
	l_pocket = /obj/item/device/flashlight/lantern
	belt = /obj/item/gun/projectile/revolver/villiers
	id_type = /obj/item/card/id/pilgrim/penitent
	pda_slot = null
	backpack_contents = list(
	/obj/item/ammo_magazine/a357 = 2,
	/obj/item/pen = 1,
	/obj/item/paper/administratum/weapon4 = 1,
	/obj/item/pen = 1,
	/obj/item/stack/thrones2 = 1,
	)

/decl/hierarchy/outfit/job/underboss
	name = OUTFIT_JOB_NAME("Underboss")
	uniform = /obj/item/clothing/under/ogryn/jumpsuit
	head = /obj/item/clothing/head/ogryn
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare/ogryn
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/ogryn/bouncer
	l_ear = /obj/item/device/radio/headset/ert2
	r_ear = null
	l_pocket = /obj/item/device/flashlight/lantern
	pda_slot = null
	id_type = null
	r_pocket = /obj/item/storage/box/coin
	suit_store = null
	l_hand = /obj/item/melee/sword/machete/chopper/heavy/adamantine
	r_hand = /obj/item/gun/projectile/ork/automatic/shoota/big
	backpack_contents = list(
	/obj/item/card/id/pilgrim/penitent/keeper = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
	/obj/item/pen = 1,
	/obj/item/paper/administratum/weapon4 = 1,

	)

/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/waiter
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	l_ear = /obj/item/device/radio/headset/ert
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
	/obj/item/pen = 1,
	/obj/item/paper/administratum/weapon4 = 1,
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
	head = /obj/item/clothing/head/ogryn
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare/ogryn
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
	r_hand = /obj/item/gun/projectile/bolter_pistol
	backpack_contents = list(
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1,

	)

/decl/hierarchy/outfit/job/bouncer
	name = OUTFIT_JOB_NAME("Bouncer")
	uniform = /obj/item/clothing/under/ogryn/jumpsuit
	head = /obj/item/clothing/head/ogryn
	shoes = /obj/item/clothing/shoes/jackboots/ogryn
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare/ogryn
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/armor/ogryn/bouncer
	id_type = /obj/item/card/id/pilgrim/innkeeper
	r_pocket = /obj/item/storage/box/coin
	pda_type = /obj/item/device/pda/penitent
	l_ear = /obj/item/device/radio/headset/ert2
	r_ear = null
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	l_hand = /obj/item/melee/trench_axe/bardiche
	r_hand = /obj/item/shield/riot/metal
	suit_store = /obj/item/gun/projectile/ork/automatic/shoota/big
	backpack_contents = list(
	/obj/item/card/id/pilgrim/penitent/keeper = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
	/obj/item/pen = 1,
	/obj/item/paper/administratum/weapon4 = 1,

	)

/decl/hierarchy/outfit/job/scavenger
	name = OUTFIT_JOB_NAME("Scavenger")
	uniform = /obj/item/clothing/under/color/brown
	suit = /obj/item/clothing/suit/armor/hauberk
	head = /obj/item/clothing/head/helmet/hauberk
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = null
	l_ear = /obj/item/device/radio/headset/ert2
	r_ear = null
	id_type = null
	r_pocket = /obj/item/storage/box/coin
	gloves = null
	glasses = /obj/item/clothing/glasses/science/rat
	pda_slot = null
	l_hand = /obj/item/shield/riot/metal
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/headset_service
	belt = /obj/item/device/flashlight/lantern
	r_pocket = /obj/item/storage/box/coin
	r_hand = /obj/item/melee/trench_axe/bspear/hunter

/datum/job/scavenger
    title = "Scavenger"
    department_flag = PIL
    social_class = SOCIAL_CLASS_MIN //these boys are gross
    total_positions = 4
    spawn_positions = 4
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
        H.add_stats(rand(14,15), rand(18,20), rand(14,16), rand (13,16))
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
			/mob/living/carbon/human/proc/ideology,
		)

/datum/job/gangboy
	title = "Tavern Ganger"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //better off than your average gross pilgrim
	total_positions = 2
	spawn_positions = 2
	open_when_dead = 0
	supervisors = "The Tavern Keeper and House Goliath"
	selection_color = "#530606"
	access = list(access_village, access_ganger, access_bar)
	outfit_type = /decl/hierarchy/outfit/job/ganger
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 35

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM

		..()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.set_trait(new/datum/trait/death_tolerant())
		H.stat = UNCONSCIOUS
		H.assign_random_quirk()
		H.verbs += list(
			/mob/living/carbon/human/proc/gangerclass,
			/mob/living/carbon/human/proc/ideology,
		)
		to_chat(H, "<span class='notice'><b><font size=3>You're a ganger raised up in the factorums of Necromunda -- loyal completely to House Goliath as one of the best and brightest of the lot. You work for the Tavern Keeper, one of the heaviest hitters on Messina and are tasked with running the tavern alongside any other shady businesses you can keep afloat. For now the bosses don't want war with the Enforcers, so try to avoid making a mess. Like they say in Necromunda -- don't kill shit where you eat'.</font></b></span>")


/mob/living/carbon/human/proc/gangerclass()
	set name = "Select your class"
	set category = "CHOOSE YOUR FATE"
	set desc = "Choose your ganger archtype."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return

	var/mob/living/carbon/human/U = src
	U.verbs -= list(/mob/living/carbon/human/proc/gangerclass,)
	var/fates = list("Bruiser","Assassin", "Rogue Doc",)


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
			new /obj/item/device/radio/headset/ert(src.loc) 
			new /obj/item/storage/backpack/satchel/warfare(src.loc) 
			new /obj/item/melee/classic_baton/trench_club(src.loc)
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent/keeper, slot_wear_id)  
			new /obj/item/stack/thrones3/twenty(src.loc) 
			to_chat(U,"<span class='goodmood'>You're the muscle of the gang. Extract protection money and protect your fellow gang members.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/gangerclass,)
			U.stat = CONSCIOUS
			U.sleeping = 0
			to_chat(U, "<span class='goodmood'>+ You awaken from your slumber... +</span>\n")
		if("Assassin")
			U.add_stats(rand(14,17), rand(15,17), rand(14,16), rand (14,16)) //ex criminal, not fed very well, but random stats
			U.add_skills(rand(5,6),rand(9,11),rand(2,4),rand(5,10),rand(2,4)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_store_or_drop(new /obj/item/clothing/under/rank/penitent, slot_w_uniform)
			new /obj/item/clothing/shoes/jackboots/pilgrim_boots(src.loc) 
			new /obj/item/clothing/suit/storage/vest/tactical(src.loc) 
			new /obj/item/device/radio/headset/ert(src.loc) 
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent/keeper, slot_wear_id) 
			new /obj/item/gun/projectile/automatic/machinepistol(src.loc) 
			new /obj/item/ammo_magazine/mc9mmt/machinepistol(src.loc) 
			new /obj/item/ammo_magazine/mc9mmt/machinepistol(src.loc)
			to_chat(U, "<span class='goodmood'><b><font size=3>You're the assassin, the shadow of the gang. Take out any who oppose you.</font></b></span>")
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
			new /obj/item/device/radio/headset/ert(src.loc) 
			equip_to_slot_or_store_or_drop(new /obj/item/card/id/pilgrim/penitent/keeper, slot_wear_id) 
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
	total_positions = 0
	spawn_positions = 0
	supervisors = "The Underboss"
	selection_color = "#530606"
	outfit_type = /decl/hierarchy/outfit/job/bouncer
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	cultist_chance = 0 // grog like emperorah :) // bouncer should only be cultist if the innkeeper is. as they would get easily indoctrinated by their dad/boss
	species_role = "Ogryn"
	access = list(access_village, access_ganger,access_bar)

	equip(var/mob/living/carbon/human/H)
	//theres gonna be some redundencies here but I do not careeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(20,30), rand(15,18), rand(15,18), rand (2,5)) //ogryn are stronger than astartes or smh i don't remember
		H.add_skills(rand(10,13),1,1,1,1) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		to_chat(H, "<span class='notice'><b><font size=3>You're the biggest, baddest muscle on Messina. Protect the Underboss and his buddy the ROGUE TRADER!</font></b></span>")



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
