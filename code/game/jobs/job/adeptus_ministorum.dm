//Due to how large this one is it gets its own file. Sister of Battle and all her stuff including items, excluding weapons those are in mattguns.dm, is also located here.

//Confessor

/datum/job/chaplain
	title = "Deacon"
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
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4



	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Deacon [current_name]")
		H.add_stats(rand(10,14), rand(10,14), rand(10,14), rand(14,18)) //frail and holy
		H.add_skills(rand(8,10),rand(5,6),rand(5,7),3,rand(4,7)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_heads, access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_sob,)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		if(prob(20))
			H.verbs += list(
			/mob/living/carbon/human/proc/nurgle,
			/mob/living/carbon/human/proc/slaanesh,
			/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are the Ecclesiarch Deacon. You are one of the Imperial Cult's priesthood, your oratory skills can stir entire crowds of the faithful and turn a coward into a zealot. You often work on worlds where faith is lacking, and people are rebellious. It is your job to spread the Imperial Cult to this new colony and it's ignorant masses, bringing their backwards beliefs in line with the faith of the God Emperor, as well as guiding the already faithful.</font></b></span>")

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
	title = "Sister Of Battle"
	department = "Ministorum"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Adepta Sororitas and the Ministorum Confessor"
	selection_color = "#FCFBFA"
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sisterofbattle
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant)
		H.set_quirk(new/datum/quirk/dead_inside) // the only thing the sisters of the orders millitant feel is the god emperor's light.
		H.add_stats(rand(18,22), rand(18,22), rand(18,22), 16)
		H.add_skills(rand(8,9),rand(8,9),rand(6,8),rand(3,7),rand(4,7)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_heads, access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_sob,)
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.f_style = "shaved"
		if(prob(4))
			H.verbs += list(
			/mob/living/carbon/human/proc/nurgle,
			/mob/living/carbon/human/proc/slaanesh,
			/mob/living/carbon/human/proc/tzeentch)
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
		to_chat(H, "<span class='notice'><b><font size=3>You are a Sister of Battle belonging to the Order of the Sacred Rose assigned to the Monastary, you serve both the Inquisition and Ecclesiarchy directly, though whom you truly serve is that of The Emperor who stands above all.</font></b></span>")


//outfit

/decl/hierarchy/outfit/job/sisterofbattle
	name = OUTFIT_JOB_NAME("Sister of Battle")
	head = /obj/item/clothing/head/helmet/sisterofbattle
	l_ear = /obj/item/device/radio/headset/heads/cmo
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterofbattle
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/sisterofbattle
	gloves = /obj/item/clothing/gloves/sisterofbattle
	shoes = /obj/item/clothing/shoes/jackboots/sisterofbattle
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/gun/projectile/sisterbolter
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterofbattle
	backpack_contents = list(
	/obj/item/ammo_magazine/bolt_rifle_magazine/sister = 4,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/clothing/mask/gas/explorer = 1,
	/obj/item/device/flashlight/lantern = 1,
	/obj/item/stack/thrones3/ten = 2
	)

/decl/hierarchy/outfit/job/progena
	name = OUTFIT_JOB_NAME("Progena")
	uniform = /obj/item/clothing/under/rank/medical
	l_ear  = /obj/item/device/radio/headset/headset_sci
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	belt = /obj/item/storage/belt
	r_pocket = /obj/item/device/flashlight/lantern
	id_type = /obj/item/card/id/medical
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
		/obj/item/stack/thrones3/five = 1,)

// Orders Hospitaller

// Almoness Advance

/datum/job/cmo
	title = "Abbess"
	head_position = 1
	department = list("Ministorum", "Medical")
	department_flag = COM|MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Deacon and Inquisition"
	selection_color = "#633d63"
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

	minimal_player_age = 20
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo
	auto_rifle_skill = 10
	semi_rifle_skill = 10
	sniper_skill = 10
	shotgun_skill = 10
	lmg_skill = 10
	smg_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(15,17), rand(15,17), rand(15,17), rand(15,17))
		H.add_skills(rand(5,8),rand(5,7),rand(10,11),rand(3,5),rand(10,11)) //melee, ranged, med, eng, surgery
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.get_idcard()?.access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.f_style = "shaved"
		H.h_style = "Bob"
		if(prob(4))
			H.verbs += list(
			/mob/living/carbon/human/proc/nurgle,
			/mob/living/carbon/human/proc/slaanesh,
			/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are the pinnacle of knowledge and piety within The Monastery, organize your sisters and ensure they are doing their duty to both The Deacon and the Codex Sororitas. Ensure your pupils within the Schola are carefully selected for their roles in serving either the military or medical wings of the Sororitas.</font></b></span>")

// Hospitaller Advance

/datum/job/doctor
	title = "Sister Hospitaller"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 22
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Abbess or The Deacon"
	selection_color = "#967096"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = FALSE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_maint_tunnels, 211)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,17), rand(14,17), rand(10,14), rand(16,18))
		H.add_skills(rand(6,8),rand(3,7),rand(8,10),rand(3,5),rand(8,10)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_medical, access_medical_equip, access_morgue, access_chemistry, access_virology, access_surgery, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.warfare_faction = IMPERIUM
		H.f_style = "shaved"
		H.h_style = "Bob"
		if(prob(10))
			H.verbs += list(
			/mob/living/carbon/human/proc/nurgle,
			/mob/living/carbon/human/proc/slaanesh,
			/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are a senior sister of the Ordos Hospitaller, serving under The Deacon/Abbess to maintain the health and divinity of the township.</font></b></span>")


/datum/job/progena
	title = "Progena"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 14
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Abbess or The Deacon"
	selection_color = "#967096"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = FALSE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_maint_tunnels, 211)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/progena
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(14,17), rand(14,17), rand(10,14), rand(16,18))
		H.add_skills(rand(6,9),rand(5,9),rand(6,8),rand(2,4),rand(4,8)) //melee, ranged, med, eng, surgery
		H.get_idcard()?.access = list(access_medical, access_medical_equip, access_morgue, access_chemistry, access_virology, access_surgery, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		if(prob(20))
			H.verbs += list(
			/mob/living/carbon/human/proc/nurgle,
			/mob/living/carbon/human/proc/slaanesh,
			/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are a recent arrival to the Monastery Scholam... soon you will begin your training with the sisters of the Ordos and the monks of the Ecclesiarchy, you stand at a crossroads where in which your failures and triumphs shall decide who you will become for the rest of your days. Do as you are instructed, learn from your masters and serve the God Emperor of Mankind.</font></b></span>")

//Hospitaller

/datum/job/chemist
	title = "Hospitaller Advance" // Do not enable this ever. They spawn as an alchemist if you do.
	department = "Medical"
	department_flag = MED
	social_class = SOCIAL_CLASS_MED
	minimal_player_age = 7
	total_positions = 0 // Leave this off. This is borked role.
	spawn_positions = 0
	supervisors = "the Sister Hospitaller"
	selection_color = "#967096"
	economic_modifier = 5
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics,access_maint_tunnels)
	minimal_access = list(access_medical, access_medical_equip, access_chemistry,access_maint_tunnels,)
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(10,16), rand(10,16), rand(10,13), rand(10,16))
		H.add_skills(rand(6,9),rand(3,5),rand(6,7),rand(2,4),rand(6,7)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		if(prob(10))
			H.verbs += list(
			/mob/living/carbon/human/proc/nurgle,
			/mob/living/carbon/human/proc/slaanesh,
			/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You mix and concoct the numerous decoctions, medicines and salves so beloved by the Ordos Hospitaller.</font></b></span>")