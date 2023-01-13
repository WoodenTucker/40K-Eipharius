//Due to how large this one is it gets its own file. Sister of Battle and all her stuff including items, excluding weapons those are in mattguns.dm, is also located here.

//Confessor

/datum/job/confessor
	title = "Confessor"
	department = "Ministorum"
	department_flag = MED
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "The Missionarus Galaxia and the Ecclesiarchy"
	selection_color = "#FCFBFA"
	access = list(access_heads, access_advchapel)
	minimal_access = list(access_heads, access_advchapel)
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/confessor
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 6
	cultist_chance = 50 // wrong kind of imperial truth



	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Confessor [current_name]")
		H.add_stats(rand(9,12), rand(9,12), rand(9,12), rand(14,18)) //frail and holy
		H.add_skills(rand(5,10),rand(5,6),rand(5,7),3,rand(4,7)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_heads, access_security, access_guard_common, access_all_personal_lockers, access_village, access_advchapel,)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.say(":n [title] reporting for duty!")
		to_chat(H, "<span class='notice'><b><font size=3>You are the Ecclesiarch Confessor and the leader of Eipharius' Monastary. In charge of the Sisters and any other fanatical members. Lead sermons in the Emperor’s name. Ensure the proper rites are being observed. Your rites. Feel free to get a little heretical. You’re just interpreting the Truth in a different way. </font></b></span>")

	equip(var/mob/living/carbon/human/H, var/alt_title, var/ask_questions = TRUE)
		. = ..()
		if(!.)
			return
		if(!ask_questions)
			return

		var/obj/item/storage/bible/B = locate(/obj/item/storage/bible) in H
		if(!B)
			return

		spawn(0)
			var/religion_name = "the Imperial Cult"
			var/new_religion = sanitize(input(H, "You are a holy priest of the Ministorum. To change your religion would be heresy and would surely lead to a swift death.", "Name change", religion_name), MAX_NAME_LEN)

			if (!new_religion)
				new_religion = religion_name
			switch(lowertext(new_religion))
				if("imperium")
					B.SetName("Uplifting Primer")
				else
					B.SetName("The Holy Book of [new_religion]")
			feedback_set_details("religion_name","[new_religion]")

		spawn(1)
			var/deity_name = "The God Emperor of Mankind"
			var/new_deity = sanitize(input(H, "Would you like to change your deity? Default is the Emperor", "Name change", deity_name), MAX_NAME_LEN)

			if ((length(new_deity) == 0) || (new_deity == "The God Emperor of Mankind") )
				new_deity = deity_name
			B.deity_name = new_deity

			var/accepted = 0
			var/outoftime = 0
			spawn(200) // 20 seconds to choose
				outoftime = 1
			var/new_book_style = "Bible"

			while(!accepted)
				if(!B) break // prevents possible runtime errors
				new_book_style = input(H,"Which bible style would you like?") in list("Bible", "Koran", "Scrapbook", "Creeper", "White Bible", "Holy Light", "Athiest", "Tome", "The King in Yellow", "Ithaqua", "Scientology", "the bible melts", "Necronomicon")
				switch(new_book_style)
					if("Koran")
						B.icon_state = "koran"
						B.item_state = "koran"
					if("Scrapbook")
						B.icon_state = "scrapbook"
						B.item_state = "scrapbook"
					if("Creeper")
						B.icon_state = "creeper"
						B.item_state = "syringe_kit"
					if("White Bible")
						B.icon_state = "white"
						B.item_state = "syringe_kit"
					if("Holy Light")
						B.icon_state = "holylight"
						B.item_state = "syringe_kit"
					if("Athiest")
						B.icon_state = "athiest"
						B.item_state = "syringe_kit"
					if("Tome")
						B.icon_state = "tome"
						B.item_state = "syringe_kit"
					if("The King in Yellow")
						B.icon_state = "kingyellow"
						B.item_state = "kingyellow"
					if("Ithaqua")
						B.icon_state = "ithaqua"
						B.item_state = "ithaqua"
					if("Scientology")
						B.icon_state = "scientology"
						B.item_state = "scientology"
					if("the bible melts")
						B.icon_state = "melted"
						B.item_state = "melted"
					if("Necronomicon")
						B.icon_state = "necronomicon"
						B.item_state = "necronomicon"
					else
						B.icon_state = "bible"
						B.item_state = "bible"

				H.update_inv_l_hand() // so that it updates the bible's item_state in his hand

				switch(input(H,"Look at your bible - is this what you want?") in list("Yes","No"))
					if("Yes")
						accepted = 1
					if("No")
						if(outoftime)
							to_chat(H, "Welp, out of time, buddy. You're stuck. Next time choose faster.")
							accepted = 1

			if(ticker)
				ticker.Bible_icon_state = B.icon_state
				ticker.Bible_item_state = B.item_state
				ticker.Bible_name = B.name
				ticker.Bible_deity_name = B.deity_name
			feedback_set_details("religion_deity","[new_deity]")
			feedback_set_details("religion_book","[new_book_style]")
		return 1

/obj/item/melee/whip/censer
	name = "imperial censer"
	desc = "A golden censer leaking pure smelling incense. Used by the Ecclesiarchy for blessings."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "censer"
	item_state = "censer"
	w_class = ITEM_SIZE_SMALL

//this blesses humans, pretty straight forward
/obj/item/melee/whip/censer/attack(mob/living/carbon/M as mob, mob/living/carbon/human/user as mob) //very quick and simple blessing system, using attack incase I ever wanna make the censer need to be filled with stuff
	if (istype(M, /mob/living/carbon/human))
		if(M.isblessed == 1) //check this first
			to_chat(user, "<span class='warning'>[M] has already been blessed!</span>")
			return 1
		else
			M.STAT_LEVEL(dex) += 1
			M.STAT_LEVEL(str) += 1
			M.isblessed = 1
			visible_message("[M] inhales the holy incense and is blessed!")


//this blesses guns
/obj/item/melee/whip/censer/attackby(var/obj/item/gun/O, var/mob/user)
	if(O.isblessed == 1)
		to_chat(user, "<span class='warning'>[O] has already been blessed!</span>")
		return 1
	else
		O.name = "blessed [O.name]"
		O.accuracy += 1
		O.armor_penetration += 1
		O.isblessed = 1
		playsound(src, 'sound/voice/blessing.ogg', 70, 0, 1)
		visible_message("[O] is bathed in righteous incense as the Confessor chants a short litany, you can sense a change in the weapon just by touching it.")

//this blesses swords
/obj/item/melee/whip/censer/attackby(var/obj/item/melee/sword/O, var/mob/user)
	if(O.isblessed == 1)
		to_chat(user, "<span class='warning'>[O] has already been blessed!</span>")
		return 1
	else
		O.name = "blessed [O.name]"
		O.sharpness += 5
		O.block_chance += 5
		O.isblessed = 1
		playsound(src, 'sound/voice/blessing.ogg', 70, 0, 1)
		visible_message("[O] is bathed in righteous incense as the Confessor chants a short litany, you can sense a change in the weapon just by touching it.")



// Adepta Sororitas

// Battle Sister

/datum/job/sistersuperior
	title = "Sister Superior" // titles and landmarks need change
	department = "Ministorum"
	department_flag = MED
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "The Confessor and the Adeptas Sororitas"
	selection_color = "#FCFBFA"
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sisterofbattle
	alt_titles = list(
	"Order of the Bloody Rose" = /decl/hierarchy/outfit/job/sisterofbattle/brsister,
	"Order of Our Martyred Lady" = /decl/hierarchy/outfit/job/sisterofbattle/mlsister,
		)
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10
	cultist_chance = 1

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister Superior [current_name]")
		H.set_trait(new/datum/trait/death_tolerant)
		H.set_quirk(new/datum/quirk/dead_inside) // the only thing the sisters of the orders millitant feel is the god emperor's light.
		H.add_stats(rand(18,22), rand(18,20), rand(18,20), 13)
		H.add_skills(rand(9,13),rand(9,13),rand(6,8),rand(3,7),rand(4,7)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_heads, access_security, access_guard_common, access_magi, access_all_personal_lockers, access_advchapel)
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.f_style = "shaved"
		H.verbs += list(
		/mob/living/carbon/human/proc/sobemperorgivesstrenght,
		/mob/living/carbon/human/proc/sobnotforsakeme,
		/mob/living/carbon/human/proc/sobpraise,
		/mob/living/carbon/human/proc/sobsororitas,
		/mob/living/carbon/human/proc/sobfearthesister,
		/mob/living/carbon/human/proc/sobfeelwrath,
		/mob/living/carbon/human/proc/sobfoesapproach,
		/mob/living/carbon/human/proc/sobnomercy,
		/mob/living/carbon/human/proc/sobretreat,
		/mob/living/carbon/human/proc/sobtakingfire,
		/mob/living/carbon/human/proc/sobweservants,
		/mob/living/carbon/human/proc/sobtheemperor)
		H.verbs -= list(/mob/living/carbon/human/verb/emoteemperorprotects)
		H.say(":n [title] reporting for duty!")
		to_chat(H, "<span class='notice'><b><font size=3>You are the Sister Superior assigned to the Monastary, responsible for the military matters of the Monastary. Yet most importantly, training the Novices Militant in the art of war.  </font></b></span>")

/datum/job/hospitaller
	title = "Sister Hospitaller"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 22
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Deacon and the Adeptas Sororitas"
	selection_color = "#FCFBFA"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = FALSE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_heads,
			access_abbess, access_RC_announce,
			access_keycard_auth, access_guard_common, access_village, access_advchapel)
	minimal_access = list(access_medical, access_heads,
			access_abbess, access_RC_announce,
			access_keycard_auth, access_guard_common, access_village, access_advchapel)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Hospitaller [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(12,15), rand(12,15), rand(10,14), rand(16,18))
		H.add_skills(rand(6,8),rand(3,7),rand(8,10),rand(3,5),rand(8,10)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_medical, access_village, access_abbess)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.say(":n [title] reporting for duty!")
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.warfare_faction = IMPERIUM
		H.f_style = "shaved"
		H.h_style = "Bob"

		to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>You are a sister of the Ordos Hospitaller, serving under The Confessor to maintain the health and divinity of the township. Ensure the Novice Hospitallers of your Chapel are properly trained in the medical field.</font></b></span>")


/datum/job/novice
	title = "Novice"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 14
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Confessor, Sister Superior and Hospitaller"
	selection_color = "#FCFBFA"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = FALSE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_advchapel, access_medical, access_village)
	minimal_access = list(access_advchapel, access_medical, access_village)
	outfit_type = /decl/hierarchy/outfit/job/novice
	alt_titles = list(
		"Novice Hospitaller" = /decl/hierarchy/outfit/job/novice,
		"Novice Militant" = /decl/hierarchy/outfit/job/militant,
	)
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Novice [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,17), rand(14,17), rand(10,14), rand(16,18))
		H.add_skills(rand(6,9),rand(5,9),rand(6,8),rand(2,4),rand(6,8)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_medical, access_village)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.f_style = "shaved"
		H.h_style = "Bob"

		to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3> (NEW PLAYER ROLE) Soon you will begin your training with the sisters of the Ordos. The Sister Superior teaches militants, while the Sister Hospitaller teaches the medical arts. Learn well and obey. Stick to your starting armor.</font></b></span>")

/datum/job/preacher
	title = "Preacher"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 20
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Confessor"
	selection_color = "#FCFBFA"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = FALSE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_advchapel, access_medical, access_village)
	minimal_access = list(access_advchapel, access_medical, access_village)
	outfit_type = /decl/hierarchy/outfit/job/preacher
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 50 // preaching the word of... lorgar

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Preacher [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,17), rand(14,17), rand(10,14), rand(11,14))
		H.add_skills(rand(8,11),rand(5,9),rand(6,8),rand(2,4),rand(1,4)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_medical, access_village)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM

		to_chat(H, "<span class='notice'><b><font size=3>http://is12wiki.xyz/index.php/Guide_to_Medicine</font></b></span>")
		to_chat(H, "<span class='notice'><b><font size=3>You are the Preacher. You are apart of the Imperial Cult, yet still not apart of the proper priesthood like the Confessor is. It is your job to spread the Truth to this new colony and it's ignorant masses, as well as guiding the already faithful.</font></b></span>")


// sob outfits
/decl/hierarchy/outfit/job/sisterofbattle
	name = OUTFIT_JOB_NAME("Sister Superior")
	head = /obj/item/clothing/head/helmet/sisterofbattle
	l_ear = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle
	belt = /obj/item/melee/chain/mercycs
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/sisterofbattle
	gloves = /obj/item/clothing/gloves/sisterofbattle
	shoes = /obj/item/clothing/shoes/jackboots/sisterofbattle
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/gun/projectile/boltrifle/sisterbolter
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine/sister = 4,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/clothing/mask/gas/explorer = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones3/ten = 2
	)

/decl/hierarchy/outfit/job/sisterofbattle/repentia // unused atm
	name = OUTFIT_JOB_NAME("Sister Repentia")
	head = /obj/item/clothing/head/helmet/sisterofbattle/repentia
	l_ear = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle/repentia
	belt = /obj/item/melee/chain/mercycs
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle/repentia
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/jackboots/sisterofbattle/repentia
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/melee/chain/mercycs
	r_hand = /obj/item/gun/projectile/automatic/flamer
	backpack_contents = list(
	/obj/item/ammo_magazine/flamer = 3,
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/clothing/mask/gas/explorer = 1,
	/obj/item/device/flashlight/lantern = 1,
	)


/decl/hierarchy/outfit/job/sisterofbattle/mlsister
	name = OUTFIT_JOB_NAME("Order of Our Martyred Lady")
	head = /obj/item/clothing/head/helmet/sisterofbattle/mlsister
	l_ear = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle/mlsister
	belt = /obj/item/melee/chain/mercycs
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/sisterofbattle/mlsister
	gloves = /obj/item/clothing/gloves/sisterofbattle/mlsister
	shoes = /obj/item/clothing/shoes/jackboots/sisterofbattle/mlsister
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/gun/projectile/boltrifle/sisterbolter
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine/sister = 4,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/clothing/mask/gas/explorer = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones3/ten = 2
	)

/decl/hierarchy/outfit/job/sisterofbattle/brsister
	name = OUTFIT_JOB_NAME("Order of the Bloody Rose")
	head = /obj/item/clothing/head/helmet/sisterofbattle/brsister
	l_ear = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle/brsister
	belt = /obj/item/melee/chain/mercycs
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/sisterofbattle/brsister
	gloves = /obj/item/clothing/gloves/sisterofbattle/brsister
	shoes = /obj/item/clothing/shoes/jackboots/sisterofbattle/brsister
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/gun/projectile/boltrifle/sisterbolter
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine/sister = 4,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/clothing/mask/gas/explorer = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones3/ten = 2
	)

/decl/hierarchy/outfit/job/preacher
	name = OUTFIT_JOB_NAME("Preacher")
	head = /obj/item/clothing/head/preacher
	uniform = /obj/item/clothing/under/rank/chaplain
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/civilian/confessor
	pda_type = null
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/heads/cmo
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	belt = /obj/item/device/flashlight/lantern
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/preacher
	l_hand = /obj/item/staff/ministorumstaff
	r_hand = null
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/ten = 1
		)

/decl/hierarchy/outfit/job/militant
	name = OUTFIT_JOB_NAME("Novice Militant")
	head = /obj/item/clothing/head/hospitallerhelm
	l_ear = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle/training
	belt = /obj/item/melee/sword/broadsword
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/sisterofbattle
	gloves = /obj/item/clothing/gloves/sisterofbattle
	shoes = /obj/item/clothing/shoes/jackboots/sisterofbattle
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = null
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/device/flashlight/lantern = 1,
	)

/decl/hierarchy/outfit/job/novice
	name = OUTFIT_JOB_NAME("Novice Hospitaller")
	uniform = /obj/item/clothing/under/rank/medical
	l_ear  = /obj/item/device/radio/headset/headset_sci
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/storage/sistersuit
	back = /obj/item/storage/backpack/satchel/warfare
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/health
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/full
	r_pocket = /obj/item/device/flashlight/lantern
	id_type = /obj/item/card/id/medical
	head = /obj/item/clothing/head/hospitallerhelm
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones2 = 1,
		/obj/item/gun/energy/las/laspistol = 1,
		/obj/item/cell/lasgun = 1,
		/obj/item/stack/thrones3/five = 1,)