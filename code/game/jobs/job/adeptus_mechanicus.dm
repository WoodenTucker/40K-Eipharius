/datum/job/magos
	title = "Magos Dominus"
	department = "Adeptus Mechanicus"
	head_position = 1
	department_flag = ENG
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 0
	spawn_positions = 0
	open_when_dead = 0
	supervisors = "The Adeptus Mechanicus and the Omnissiah."
	selection_color = "#FF3A3A"
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
	cultist_chance = 4
	ideal_character_age = 70 // most magi are old as fuck, just imagine what it takes to be a robotics nerdexpert in the cult mechanicus
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer
	access = list(access_mechanicus, access_magosd, access_guard_common, access_medical, access_all_personal_lockers)
	minimal_access = list(access_mechanicus, access_magosd, access_guard_common, access_medical, access_all_personal_lockers)



	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Magos [current_name]")
		H.add_stats(rand(16,19), rand(16,19), rand(18,20), rand(20,30)) //Magos are pretty strong due to their modifications, their mods also make them able to endure much more than normal humans
		H.add_skills(rand(9,10),rand(7,10),rand(7,10),rand(10,11),rand(7,10)) //melee, ranged, med, eng, surgery
		H.warfare_faction = IMPERIUM
		H.set_trait(new/datum/trait/death_tolerant()) //although Noble, he has no nose and is a psychopath, no reason he should be vomiting around
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.witchblood()
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos Dominus, you are a specialist in all forms of technology. You are the highest ranking member of the Adeptus Mechanicus on the outpost, your duty is to ensure all machine spirits remain happy and willing to work. Use your talents and the skills of your tech priests to further the goals of the Mechanicus. Praise the Omnissiah!</font></b></span>")
		H.bladder = -INFINITY
		H.adjustStaminaLoss(-INFINITY)
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		H.vice = null //off for now
		H.say(":e The crude biomass they call a temple will eventually fail... and they will beg our kind to save them. But we are already saved. For the machine is immortal.")




/datum/job/engineer
	title = "Tech Priest Enginseer"
	department = "Engineering"
	department_flag = ENG
	social_class = SOCIAL_CLASS_MED
	total_positions = 2
	spawn_positions = 2
	supervisors = "You obey the Biologis and Explorator"
	selection_color = "#FF3A3A"
	economic_modifier = 5
	minimal_player_age = 7
	open_when_dead = 0
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	access = list(access_mechanicus, access_village, access_guard_common, access_medical, access_all_personal_lockers)
	minimal_access = list(access_mechanicus, access_village, access_medical, access_all_personal_lockers)
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 7
	cultist_chance = 7

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Tech-Priest [current_name]")
		H.set_trait(new/datum/trait/death_tolerant()) //no nose + psycho
		H.add_stats(rand(12,15), rand(11,14), rand(11,15), rand(14,20))
		H.add_skills(rand(6,8),rand(4,8),rand(5,6),rand(7,10),rand(5,7)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.witchblood()
		H.adjustStaminaLoss(-INFINITY)
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		H.vice = null //off for now
		H.say(":e OMVISS1@H &(47*TECHNICA)B(ADMECH)... transponder signal active.")
		to_chat(H, "<span class='notice'><b><font size=3>You are a Enginseer resting within a Forge Temple of the Mechanicus constructed by the AdMech. Learn from the Explorator and Biologis. Craft blessed machine spirits in the forge. Teach the Tech Menials the basics. Lead Skitarii if needed.</font></b></span>")

/datum/job/techmenial
	title = "Tech Menial"
	department = "Engineering"
	department_flag = ENG
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "You obey the Biologis and Explorator, as well as the Tech Priests."
	selection_color = "#FF3A3A"
	economic_modifier = 5
	minimal_player_age = 7
	open_when_dead = 0
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	access = list(access_mechanicus, access_village, access_guard_common, access_medical, access_all_personal_lockers)
	minimal_access = list(access_mechanicus, access_village, access_medical, access_all_personal_lockers)
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 6
	cultist_chance = 11

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Tech-Menial [current_name]")
		H.set_trait(new/datum/trait/death_tolerant()) //no nose + psycho
		H.add_stats(rand(11,14), rand(11,13), rand(11,14), rand(12,17)) // worse than tech priest
		H.add_skills(rand(4,6),rand(3,6),rand(4,5),rand(6,8),rand(4,6)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		H.vice = null //off for now
		H.witchblood()
		H.say(":e I aspire to the unity of the blessed machine. I crave the strength and certainty of steel...")
		H.adjustStaminaLoss(-INFINITY) // they aren't cyborg'd enough to not need to drink. The flesh is weak.
		to_chat(H, "<span class='notice'><b><font size=3> (NEW PLAYER ROLE) You are a Tech-Menial, and you have been blessed with the privilege of serving within a Forge Temple of the Admech. You are inexperienced and learning. Ensure to learn much.</font></b></span>")

// Biologis

// Magos

/datum/job/biologis
	title = "Magos Biologis"
	department = "Engineering"
	department_flag = ENG
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	open_when_dead = 0
	supervisors = "the Adeptus Mechanicus and the Omnissiah."
	selection_color = "#d82424"
	economic_modifier = 7
	req_admin_notify = 1
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_mechanicus, access_village, access_guard_common, access_medical, access_RC_announce, access_ai_upload, 56, access_heads, access_all_personal_lockers)
	minimal_access = list(access_mechanicus, access_village, access_guard_common, access_medical, access_RC_announce, access_ai_upload, 56, access_heads, access_all_personal_lockers)
	outfit_type = /decl/hierarchy/outfit/job/medical/biologis
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 8 //sometimes this motherfucker has to get his research material by himself
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 7
	cultist_chance = 8

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Biologis [current_name]")
		H.set_trait(new/datum/trait/death_tolerant()) //They literally open up dead bodies of xenos and humans alike, why would they be disgusted of organs and blood?
		H.add_stats(rand(13,18), rand(13,18), rand(20,24), rand(20,30)) //just as modified as the magos, if not more.
		H.add_skills(rand(9,13),rand(7,10),rand(9,11),rand(9,10),rand(10,12)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.witchblood()
		H.adjustStaminaLoss(-INFINITY)
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		H.get_idcard()?.access = list(access_mechanicus, access_heads, access_village, access_guard_common, access_medical, access_RC_announce, access_ai_upload, access_all_personal_lockers) // this may be unneeded or bloat for mechanicus, needs testing
		H.vice = null //off for now
		H.say(":e The crude biomass they call a temple will eventually fail... and they will beg our kind to save them. But we are already saved. For the machine is immortal.")
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos Biologis, resting within a Forge Temple of the Mechanicus constructed by the AdMech. You are an expert on xenos and biological research, your primary duty is to oversee the construction of Skitarii. You have equal power alongside the Explorator. Ensure the Menials and Techpriests are properly trained in your craft.</font></b></span>")


/datum/job/explorer
	title = "Magos Explorator"
	department = "Science"
	department_flag = SCI|ENG
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	open_when_dead = 0
	supervisors = "the Adeptus Mechanicus and the Omnissiah."
	selection_color = "#d82424"
	req_admin_notify = 1
	economic_modifier = 7
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_mechanicus, access_village, access_guard_common, access_medical, access_RC_announce, access_ai_upload, 56, access_heads, access_all_personal_lockers)
	minimal_access = list(access_mechanicus, access_village, access_guard_common, access_medical, access_RC_announce, access_ai_upload, 56, access_heads, access_all_personal_lockers)
	outfit_type = /decl/hierarchy/outfit/job/science/explorator
	auto_rifle_skill = 8 //Explorator for you.
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 6

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Explorator [current_name]")
		H.set_trait(new/datum/trait/death_tolerant()) //They literally open up dead bodies of xenos and humans alike, why would they be disgusted of organs and blood?
		H.add_stats(rand(15,18), rand(15,18), rand(18,20), rand(20,30)) //just as modified as the magos, if not more.
		H.add_skills(rand(8,11),rand(9,11),rand(8,10),rand(9,10),rand(8,10)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_MECHANICUS)
		H.warfare_faction = IMPERIUM

		H.witchblood()
		H.adjustStaminaLoss(-INFINITY)
		H.bladder = -INFINITY
		H.bowels = -INFINITY //he's too heavily modified to require things like a toilet
		H.thirst = INFINITY
		H.nutrition = INFINITY //he is sustained by the Omnissiah, he requires neither food nor drink
		H.vice = null //off for now
		H.say(":e Memory cache integrity at 87%... Motive force appeased. Security apparatis functional. Non organics uncorrupted. Temple - status?")
		H.get_idcard()?.access = list(access_mechanicus, access_heads, access_village, access_guard_common, access_medical, access_RC_announce, access_ai_upload, access_all_personal_lockers) // this may be unneeded or bloat for mechanicus, needs testing
		to_chat(H, "<span class='notice'><b><font size=3>You are the Magos Explorator, resting within a Forge Temple of the Mechanicus constructed by the AdMech. Your primary duty is to explore the planet and locate relics and research items. You have equal power alongside the Biologis. Ensure the Menials and Techpriests are properly trained in your craft.</font></b></span>")


//Skitarii
/decl/hierarchy/outfit/job/skitarii
	uniform = /obj/item/clothing/under/rank/skitarii
	suit = /obj/item/clothing/suit/storage/hooded/skitarii
	shoes = /obj/item/clothing/shoes/jackboots/skitshoes
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/headset_eng
	belt = /obj/item/device/flashlight/lantern
	suit_store = /obj/item/gun/projectile // give them galv back soon
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/warfare/rat = 1, /obj/item/ammo_magazine/galvanic = 4,)

/decl/hierarchy/outfit/job/skitarii/basic
	uniform = /obj/item/clothing/under/rank/skitarii
	suit = null
	shoes = null
	neck = null
	back = null
	l_ear = null
	belt = null
	suit_store = null
	l_pocket = null
	id = null
	id_slot = null


