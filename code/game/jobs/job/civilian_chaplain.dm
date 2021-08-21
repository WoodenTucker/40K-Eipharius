//Due to how large this one is it gets its own file. Sister of Battle Guard and all her stuff including items, excluding weapons those are in mattguns.dm, is also located here.
/datum/job/chaplain
	title = "Ministorum Confessor"
	department = "Civilian"
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


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Confessor [current_name]")
		H.add_stats(rand(10,13), rand(8,13), rand(8,11), rand(12,16)) //frail and holy
		H.get_idcard()?.access = list(access_heads, access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_sob,)
		H.add_skills(rand(2,4),rand(1,2),0,0,0)
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

/* start of the sister section */

//job

/datum/job/sisterelohiem
	title = "Sister Elohiem"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Adepta Sororitas"
	selection_color = "#FCFBFA"
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sisterelohiem
	auto_rifle_skill = 10 // idk how these skills work but imperial guards have 10 and sisters are better trained than the average guard so they get 10.
	semi_rifle_skill = 10
	sniper_skill = 6
	shotgun_skill = 9
	lmg_skill = 10
	smg_skill = 10
	melee_skill = 10
	ranged_skill = 10
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
		H.add_stats(35, rand(20,25), rand(20,25), rand(15,25)) // 5 down from astartes. they're strong women and literally believe so much in the god emperor's protection and strength that it becomes reality.
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.f_style = "shaved"
		H.h_style = "Tight Shaved Mohawk"
		to_chat(H, "<span class='notice'><b><font size=3>You are a Sister of Battle belonging to the Order of the Sacred Rose, marked as Elohiem. Half warrior, half preacher, you have willingly spilt blood in the Emperor's name and are one of His most devout and evangelical Sisters. You have been tasked with defending holy Ecclesiarchal relics and the Ecclesiarchy attached to them. Your main goal is to defend the chapel, the three holy relics inside, and the priest, EVERYTHING ELSE IS SECONDARY. Roleplay is required and will be scrutinized by everyone, including staff.</font></b></span>")


//outfit

/decl/hierarchy/outfit/job/sisterelohiem
	name = OUTFIT_JOB_NAME("Sister Elohiem")
	head = /obj/item/clothing/head/helmet/sisterelohiem
	l_ear = /obj/item/device/radio/headset/red_team
	neck = /obj/item/reagent_containers/food/drinks/canteen
	suit = /obj/item/clothing/suit/sisterelohiem
	uniform = /obj/item/clothing/under/guard/uniform/sisterelohiem
	back = /obj/item/storage/backpack/satchel/warfare/sisterelohiem
	gloves = /obj/item/clothing/gloves/sisterelohiem
	shoes = /obj/item/clothing/shoes/sisterelohiem
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	l_hand = /obj/item/gun/projectile/sisterbolter
	r_hand = /obj/item/gun/projectile/bolter_pistol/sisterelohiem
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare = 1,
	/obj/item/ammo_magazine/bolt_rifle_magazine/sister = 3,
	/obj/item/ammo_magazine/bolt_pistol_magazine = 3,
	/obj/item/stack/thrones/ten = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/ten = 2,
	)

// clothing.
// sororitas war gear based on the wiki page. it is power armor so it is strong, but it isn't as strong as astarte's power armor because sisters lack the black carapace, stats have been balanced around that.

/*obj/item/clothing/head/helmet/sisterelohiem
	name = "Order of the Sacred Rose Helm"
	desc = "A helmet branded with Imperium sigils and holy writs belonging to an Adepta Sororitas power armor set. It is styled in the colors of the Order of the Sacred Rose. <i>Many claim they wish to destroy their enemies. If this were true, most would be compelled to destroy themselves.</i>"
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 50, bomb = 60, bio = 90, rad = 90)
	species_restricted = list(SPECIES_ORK)*/

/obj/item/clothing/suit/sisterelohiem
	name = "Order of the Sacred Rose Chestpiece"
	desc = "A blessed chestpiece belonging to an Adepta Sororitas power armor set. It is styled in the colors of the Order of the Sacred Rose. <i>There is only duty and blood. There are only deeds and words. There is only the service to the God-Emperor, and the price that demands from each Sister can only be known by Him.</i>"
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 50, bomb = 60, bio = 90, rad = 90)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	canremove = 0 // they're specially fitted to that sister's body and can only be removed under certain circumstances. also to prevent abuse
	species_restricted = list(SPECIES_HUMAN) // prevents orks from gibbing the limbs of the sister and then wearing her gear wtf.

/obj/item/storage/backpack/satchel/warfare/sisterelohiem
	name = "Order of the Sacred Rose Powerpack"
	desc = "A sanctified powerpack belonging to an Adepta Sororitas power armor set. It is styled in the colors of the Order of the Sacred Rose. <i>When the people forget their duty they are no longer human and become something less than beasts. They have no place in the bosom of humanity nor in the heart of the Emperor. Let them die and be forgotten</i>"
	icon_state = "sister"
	max_storage_space = DEFAULT_BACKPACK_STORAGE
	canremove = 0

/obj/item/clothing/under/guard/uniform/sisterelohiem
	name = "Adepta Sororitas Bodysuit"
	desc = "A bodysuit made with pious fabric covered in purity seals. It is worn beneath a suit of power armor, to ensure a comfortable fit. <i>The absence of faith is the mark of the weak, the absence of faith is the mark of the heretic, the absence of faith is the mark of damnation.</i>"
	canremove = 0
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/gloves/sisterelohiem
	name = "Order of the Sacred Rose Gauntlets"
	desc = "Gauntlets covered in holy writing and iconography, belonging to an Adepta Soroitas power armor set. They are styled in the colors of the Order of the Sacred Rose. <i>By bolter shell, flamer burst and melta blast, the mutant, the heretic and the traitor alike are cleansed of their sin of existence. So has it been for five millennia, so shall it be unto the end of time.</i>"
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 50, bomb = 60, bio = 90, rad = 90)
	canremove = 0
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/shoes/sisterelohiem
	name = "Order of the Sacred Rose Boots"
	desc = "A pair of boots immersed in Imperium scripture belonging to an Adepta Sororitas power armor set. They are styled in the colors of the Order of the Sacred Rose. <i>Heretics crave the cleansing fire of absolution. They need not fear, for we shall deliver it to them.</i>"
	icon_state = "sister"
	item_state = "sister"
	can_hold_knife = 1
	canremove = 0
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 50, bomb = 60, bio = 90, rad = 90)
	species_restricted = list(SPECIES_HUMAN)

//ammo

/obj/item/ammo_magazine/bolt_rifle_magazine/sister
	name = "godwyn-de'az pattern bolter rifle magazine"
	ammo_type = /obj/item/ammo_casing/bolter/sister

/obj/item/projectile/bullet/bolt/sister
	damage = 70 // sisters aren't as strong as an astartes so their bolts pack less of a punch yet they're still deadly.

/obj/item/ammo_casing/bolter/sister
	projectile_type = /obj/item/projectile/bullet/bolt/sister