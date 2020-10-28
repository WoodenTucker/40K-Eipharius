/datum/job/guardsman
	title = "Imperial Guardsman"
	total_positions = 100
	social_class = SOCIAL_CLASS_MIN
	outfit_type = /decl/hierarchy/outfit/job/guardsman //will need to be replaced eventually - wel
	selection_color = "#b27676"
	department_flag = SEC
	auto_rifle_skill = 10 //This is leftover from coldfare, but we could go back to that one day so better not to mess with it.
	semi_rifle_skill = 10
	sniper_skill = 3
	shotgun_skill = 6
	lmg_skill = 3
	smg_skill = 3

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(12,17), rand(10,16), rand(8,12))
		SSwarfare.red.team += H
		if(can_be_in_squad)
			H.assign_random_squad(IMPERIUM)
		H.fully_replace_character_name("Pvt. [H.real_name]")
		H.assign_random_quirk()
		if(announced)
			H.say(";Guardsman reporting for duty!")

/datum/job/ig/sergeant
	title = "Sergeant"
	total_positions = 2
	social_class = SOCIAL_CLASS_MED
	outfit_type = /decl/hierarchy/outfit/job/redsoldier/sgt
	can_be_in_squad = FALSE //They have snowflake shit for squads.
	department_flag = SEC

	auto_rifle_skill = 10
	semi_rifle_skill = 10
	shotgun_skill = 10

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.verbs += /mob/living/carbon/human/proc/morale_boost
		H.assign_squad_leader(IMPERIUM)
		H.fully_replace_character_name("Sgt. [current_name]")
		H.say(";[title] reporting for duty!")

/datum/job/ig/commissar
	title = "Commissar"
	total_positions = 1
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_HIGH
	outfit_type = /decl/hierarchy/outfit/job/ig/commissar
	can_be_in_squad = FALSE
	sniper_skill = 10
	open_when_dead = FALSE
	department_flag = SEC

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Commissar [current_name]")
		H.say(";[title] reporting for duty!")
		H.get_idcard()?.access = get_all_accesses()
		var/obj/O = H.get_equipped_item(slot_s_store)
		if(O)
			qdel(O)
		H.verbs += list(
			/mob/living/carbon/human/proc/help_me,
			/mob/living/carbon/human/proc/retreat,
			/mob/living/carbon/human/proc/announce,
			/mob/living/carbon/human/proc/give_order,
			/mob/living/carbon/human/proc/check_reinforcements
		)

/datum/job/ig/enforcer
	title = "Civitas Enforcer"
	total_positions = 3
	social_class = SOCIAL_CLASS_MED
	outfit_type = /decl/hierarchy/outfit/job/redsoldier/sentry
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 3
	shotgun_skill = 8
	lmg_skill = 10
	smg_skill = 3
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC

	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Enforcer [current_name]")
		H.add_stats(18, rand(10,16), rand(15,18))
		H.say(";Arbites reporting for duty!")

/datum/job/ig/impguard
	title = "Adeptus Arbites"
	total_positions = 1
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



/*All of this will need to be redone/re-pointed to once we have actual sprites to use - wel
Begin Warhammer loadouts
*/

/decl/hierarchy/outfit/job/guardsman
	name = OUTFIT_JOB_NAME("Imperial Guardsman")
	head = /obj/item/clothing/head/helmet/guardhelmet
	uniform = /obj/item/clothing/under/color/brown
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/storage/box/ifak // /obj/item/stack/medical/bruise_pack
	suit = /obj/item/clothing/suit/armor/guardsman
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	pda_type = null
	id_type = /obj/item/card/id/dog_tag/guardsman
	l_hand = /obj/item/gun/energy/las/lasgun
	backpack_contents = list(/obj/item/cell/lasgun = 2)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/ig/commissar
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/armor/commissar
	head = /obj/item/clothing/head/commissar
	l_ear = /obj/item/device/radio/headset/heads/hos
	belt = /obj/item/gun/projectile/bolter_pistol
	r_pocket = /obj/item/device/binoculars
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/warfare
	backpack_contents = list(/obj/item/ammo_magazine/bolt_pistol_magazine = 2, /obj/item/grenade/smokebomb = 1)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/decl/hierarchy/outfit/job/redsoldier/sgt
	suit_store = /obj/item/gun/projectile/automatic/m22/warmonger
	head = /obj/item/clothing/head/helmet/redhelmet/leader
	r_pocket = /obj/item/ammo_magazine/c45rifle/akarabiner

/decl/hierarchy/outfit/job/redsoldier/sgt/equip()
	if(prob(25))
		suit_store = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/bayonet
		r_pocket = /obj/item/ammo_box/rifle
		backpack_contents = list(/obj/item/grenade/smokebomb = 1, /obj/item/device/binoculars = 1)
		belt = null
	else
		suit_store = /obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle/rsc
		r_pocket =  /obj/item/ammo_magazine/a762/rsc
		backpack_contents = list(/obj/item/grenade/smokebomb = 1, /obj/item/device/binoculars = 1)
		belt = /obj/item/storage/belt/armageddon

	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/torch/self_lit = 1, /obj/item/ammo_box/flares = 1)
	..()


/decl/hierarchy/outfit/job/redsoldier/engineer
	r_pocket = /obj/item/ammo_magazine/mc9mmt/machinepistol
	l_pocket = /obj/item/wirecutters
	suit_store = /obj/item/gun/projectile/automatic/machinepistol/wooden
	back = /obj/item/storage/backpack/warfare
	backpack_contents = list(/obj/item/stack/barbwire = 1, /obj/item/shovel = 1, /obj/item/defensive_barrier = 4, /obj/item/storage/box/ifak = 1)

/decl/hierarchy/outfit/job/redsoldier/engineer/equip()
	if(prob(1))//Rare engineer spawn
		suit_store = /obj/item/gun/projectile/automatic/autoshotty
		r_pocket = /obj/item/shovel
		belt = /obj/item/storage/belt/autoshotty
		backpack_contents = list(/obj/item/stack/barbwire = 1, /obj/item/defensive_barrier = 3, /obj/item/storage/box/ifak = 1, /obj/item/grenade/smokebomb = 1)
	else if(prob(50))
		suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
		r_pocket = /obj/item/ammo_box/shotgun
		belt = /obj/item/shovel
		backpack_contents = list(/obj/item/stack/barbwire = 1, /obj/item/defensive_barrier = 3, /obj/item/storage/box/ifak = 1, /obj/item/grenade/smokebomb = 1)
	else
		suit_store = /obj/item/gun/projectile/automatic/machinepistol
		r_pocket = /obj/item/shovel
		belt = /obj/item/storage/belt/warfare
		backpack_contents = list(/obj/item/stack/barbwire = 1, /obj/item/defensive_barrier = 3, /obj/item/storage/box/ifak = 1, /obj/item/grenade/smokebomb = 1)

	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/ammo_box/flares = 1, /obj/item/torch/self_lit = 1)
	..()


/decl/hierarchy/outfit/job/redsoldier/sentry
	l_ear = /obj/item/device/radio/headset/red_team/all
	suit = /obj/item/clothing/suit/armor/sentry/red
	head = /obj/item/clothing/head/helmet/sentryhelm/red
	belt = /obj/item/melee/trench_axe
	suit_store = /obj/item/gun/projectile/automatic/mg08
	backpack_contents = list(/obj/item/ammo_magazine/box/a556/mg08 = 3, /obj/item/grenade/smokebomb = 1)

/decl/hierarchy/outfit/job/redsoldier/sentry/equip()
	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/ammo_box/flares = 1, /obj/item/torch/self_lit = 1)
	..()

/decl/hierarchy/outfit/job/redsoldier/flamer
	l_ear = /obj/item/device/radio/headset/red_team/all
	suit = /obj/item/clothing/suit/fire/red
	head = /obj/item/clothing/head/helmet/redhelmet/fire
	belt = /obj/item/gun/projectile/automatic/flamer
	suit_store = /obj/item/melee/trench_axe
	r_pocket = /obj/item/grenade/fire
	backpack_contents = list(/obj/item/ammo_magazine/flamer = 4, /obj/item/grenade/smokebomb = 1)

/decl/hierarchy/outfit/job/redsoldier/sniper
	l_ear = /obj/item/device/radio/headset/red_team/all
	suit = /obj/item/clothing/suit/armor/redcoat/sniper
	head = /obj/item/clothing/head/helmet/redhelmet/sniper
	suit_store = /obj/item/gun/projectile/heavysniper
	belt = /obj/item/gun/projectile/revolver //Backup weapon.
	r_pocket = /obj/item/ammo_box/ptsd
	backpack_contents = list(/obj/item/grenade/smokebomb = 1)

/decl/hierarchy/outfit/job/redsoldier/sniper/equip()
	if(prob(50))
		belt = /obj/item/gun/projectile/warfare
	else
		belt = /obj/item/gun/projectile/revolver
	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/ammo_box/flares = 1, /obj/item/torch/self_lit = 1)
	..()

/decl/hierarchy/outfit/job/redsoldier/medic
	belt = /obj/item/storage/belt/medical/full
	r_pocket = /obj/item/ammo_magazine/c45rifle/akarabiner
	l_pocket = /obj/item/stack/medical/bruise_pack
	suit_store = /obj/item/gun/projectile/automatic/m22/warmonger
	gloves = /obj/item/clothing/gloves/latex
	head = /obj/item/clothing/head/helmet/redhelmet/medic

/decl/hierarchy/outfit/job/redsoldier/medic/equip()
	if(prob(50))
		suit_store = /obj/item/gun/projectile/automatic/m22/warmonger
		r_pocket = /obj/item/ammo_magazine/c45rifle/akarabiner
		backpack_contents = list( /obj/item/ammo_magazine/c45rifle/akarabiner = 3, /obj/item/grenade/smokebomb = 1)

	else
		suit_store = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty
		r_pocket = /obj/item/ammo_box/rifle
		backpack_contents = list(/obj/item/grenade/smokebomb = 1)
	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/ammo_box/flares = 1, /obj/item/torch/self_lit = 1)
	..()

/decl/hierarchy/outfit/job/redsoldier/leader/equip()
	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/ammo_box/flares = 1 , /obj/item/torch/self_lit = 1)
	..()

/decl/hierarchy/outfit/job/redsoldier/scout
	suit = /obj/item/clothing/suit/child_coat/red
	l_ear = /obj/item/device/radio/headset/red_team/all
	uniform = /obj/item/clothing/under/child_jumpsuit/warfare/red
	shoes = /obj/item/clothing/shoes/child_shoes
	gloves = null
	r_pocket = /obj/item/device/binoculars
	backpack_contents = list(/obj/item/grenade/smokebomb = 1)

/decl/hierarchy/outfit/job/redsoldier/scout/equip()
	if(aspect_chosen(/datum/aspect/nightfare))
		backpack_contents += list(/obj/item/ammo_box/flares = 1 , /obj/item/torch/self_lit = 1)
	..()