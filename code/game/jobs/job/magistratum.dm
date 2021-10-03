// Enforcers

/datum/job/enforcer
	title = "Magistratum Enforcer"
	supervisors = "The Commissar, the Rogue Trader, and the village Administrator"
	total_positions = 4
	spawn_positions = 4
	social_class = SOCIAL_CLASS_MED
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/ig/enforcer
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 3
	shotgun_skill = 8
	lmg_skill = 10
	smg_skill = 3
	melee_skill = 9
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_all_personal_lockers, access_maint_tunnels,)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,
			            )


	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Enforcer [current_name]")
		H.add_stats(rand(14,18), rand(10,14), rand(12,13), rand(10,13)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(6,10),rand(6,10))
		H.assign_random_quirk()
		H.witchblood()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels,)
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are a proud officer of the Magistratum, your duty is to uphold Imperial law on this planet amongst the civilians. You are not to meddle in Guard duties lest absolutely necessary, focus your effort on maintaining the peace/order in the shanty town north of the outpost.</font></b></span>")

/*/datum/job/arbites
	title = "Adeptus Arbites"
	total_positions = 2
	spawn_positions = 2
	social_class = SOCIAL_CLASS_MIN
	outfit_type = /decl/hierarchy/outfit/job/redsoldier/sentry
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 10
	smg_skill = 3
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Arbites [current_name]")
		H.add_stats(18, rand(10,16), rand(15,18))
		H.say(";Arbites reporting for duty!")
*/ //ill find a job for these guys one day
/*All of this will need to be redone/re-pointed to once we have actual sprites to use - wel
Begin Warhammer loadouts
*/

//Outfits

/decl/hierarchy/outfit/job/ig/enforcer
	name = OUTFIT_JOB_NAME("Magistratum Enforcer")
	head = /obj/item/clothing/head/helmet/guardhelmet/enforcer
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	suit = /obj/item/clothing/suit/armor/enforcer
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	belt = /obj/item/melee/baton/loaded
	id_type = /obj/item/card/id/dog_tag/guardsman
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team/delta
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	l_hand = /obj/item/device/flashlight/lantern
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/handcuffs = 2,
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
	)

	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR
