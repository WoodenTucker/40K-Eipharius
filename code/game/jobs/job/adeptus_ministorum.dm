//Due to how large this one is it gets its own file. Sister of Battle and all her stuff including items, excluding weapons those are in mattguns.dm, is also located here.

//Confessor

/datum/job/chaplain
	title = "Ministorum Confessor"
	department = "Ministorum"
	department_flag = CIV|COM
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Missionarus Galaxia and the Ecclesiarchy"
	selection_color = "#FCFBFA"
	access = list(access_heads, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels, access_sob)
	minimal_access = list(access_heads, access_morgue, access_chapel_office, access_crematorium, access_sob)
	announced = FALSE
//	alt_titles = list("Counselor")
	outfit_type = /decl/hierarchy/outfit/job/chaplain
	auto_rifle_skill = 2
	semi_rifle_skill = 2
	sniper_skill = 2
	shotgun_skill = 2
	lmg_skill = 2
	smg_skill = 2
	melee_skill = 4
	ranged_skill = 2
	medical_skill = 5
	engineering_skill = 0
	surgery_skill = 3


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Confessor [current_name]")
		H.add_stats(rand(10,13), rand(10,13), rand(10,12), rand(12,16)) //frail and holy
		H.get_idcard()?.access = list(access_heads, access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_sob,)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a Confessor-Millitant attached to the Rogue Trader through the Missionarus Galaxia. You are one of the Ecclesiarchy's fearsome zealot preachers, your oratory skills can stir entire crowds and cause them to turn on one another, exposing eachother's darkest secrets. You often work on worlds where faith is lacking, and people are rebellious. It is your job to preach to the flock and indoctrinate new individuals into it, protect the chapel, and ensure the relics in your reliquary remain safe and untouched by the unworthly.</font></b></span>")

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
/obj/item/melee/whip/censer/attackby(var/obj/item/material/sword/O, var/mob/user)
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

/datum/job/sisterofbattle
	title = "Battle Sister"
	department = "Ministorum"
	department_flag = CIV
	total_positions = 0
	spawn_positions = 0
	open_when_dead = 0
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Adepta Sororitas and the Ministorum Confessor"
	selection_color = "#FCFBFA"
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sisterofbattle
	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9
	melee_skill = 7
	ranged_skill = 9
	medical_skill = 4
	engineering_skill = 0
	surgery_skill = 1
	req_admin_notify = 1

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister Elohiem [current_name]")
		H.set_trait(new/datum/trait/death_tolerant)
		H.set_quirk(new/datum/quirk/dead_inside) // the only thing the sisters of the orders millitant feel is the god emperor's light.
		H.add_stats(rand(18,22), rand(18,22), rand(18,22), rand(18,22))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.f_style = "shaved"
		to_chat(H, "<span class='notice'><b><font size=3>You are a Sister of Battle belonging to the Order of the Sacred Rose, marked as Elohiem. Half warrior, half preacher, you have willingly spilt blood in the Emperor's name and are one of His most devout and evangelical Sisters. You have been tasked with defending holy Ecclesiarchal relics and the Ecclesiarchy attached to them. Your main goal is to defend the chapel, the three holy relics inside, and the priest, EVERYTHING ELSE IS SECONDARY. Roleplay is required and will be scrutinized by everyone, including staff.</font></b></span>")


//outfit

/decl/hierarchy/outfit/job/sisterofbattle
	name = OUTFIT_JOB_NAME("Sister of Battle")
	head = /obj/item/clothing/head/helmet/sisterofbattle
	l_ear = /obj/item/device/radio/headset/red_team
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/sisterofbattle
	gloves = /obj/item/clothing/gloves/sisterofbattle
	shoes = /obj/item/clothing/shoes/sisterofbattle
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/gun/projectile/sisterbolter
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/ammo_magazine/bolt_rifle_magazine/sister = 3,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/stack/thrones/ten = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/ten = 2,
	)

// Orders Hospitaller

// Almoness Advance

/datum/job/cmo
	title = "Almoness Advance"
	head_position = 1
	department = list("Ministorum", "Medical")
	department_flag = COM|MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Orders Hospitaller"
	selection_color = "#633d63"
	req_admin_notify = 1
	economic_modifier = 10
	open_when_dead = FALSE
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 6
	ranged_skill = 5
	medical_skill = 10
	engineering_skill = 1
	surgery_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister Hospitaller [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(11,15), rand(11,15), rand(11,15), rand(12,16))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.f_style = "shaved"
		H.h_style = "Bob"

		to_chat(H, "<span class='notice'><b><font size=3>You are the pinnacle of medical knowledge within the Ordos Hospitaller, organize your sisters and ensure they are doing their duty to both the Lord Trader and the Codex Sororitas. Sanctify and heal this unholy land of it's festering heretical past... in the name of your Emperor.</font></b></span>")

// Hospitaller Advance

/datum/job/doctor
	title = "Curia Advance"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 3
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Almoness Advance and the Orders Hospitaller"
	selection_color = "#967096"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = TRUE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_maint_tunnels, access_sob)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_maint_tunnels, access_sob)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 5
	ranged_skill = 4
	medical_skill = 8
	engineering_skill = 0
	surgery_skill = 8

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(10,14), rand(10,14), rand(10,14), rand(12,15))
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.warfare_faction = IMPERIUM
		H.f_style = "shaved"
		H.h_style = "Bob"
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are a junior sister of the Ordos Hospitaller, serving under the Sister Hospitaller to maintain the health and divinity of the garrison.</font></b></span>")

//Hospitaller

/datum/job/chemist
	title = "Hospitaller Advance"
	department = "Medical"
	department_flag = MED
	social_class = SOCIAL_CLASS_MED
	minimal_player_age = 7
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Sister Hospitaller"
	selection_color = "#967096"
	economic_modifier = 5
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics,access_maint_tunnels)
	minimal_access = list(access_medical, access_medical_equip, access_chemistry,access_maint_tunnels,)
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 4
	ranged_skill = 4
	medical_skill = 8
	engineering_skill = 1
	surgery_skill = 7

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,13), rand(9,13), rand(9,13), rand(10,13))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You mix and concoct the numerous decoctions, medicines and salves so beloved by the Ordos Hospitaller.</font></b></span>")
