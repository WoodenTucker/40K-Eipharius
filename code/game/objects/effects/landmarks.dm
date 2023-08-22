/obj/effect/landmark
	name = "landmark"
	icon = 'icons/effects/random_spawners.dmi'
	icon_state = "mobspawn"
	anchored = 1.0
	unacidable = 1
	simulated = 0
	invisibility = 101
	var/delete_me = 0
	var/krootselected = 0

/obj/effect/landmark/New()
	..()
	tag = "landmark*[name]"

	//TODO clean up this mess
	switch(name)			//some of these are probably obsolete
		if("monkey")
			GLOB.monkeystart += loc
			delete_me = 1
			return
		if("start")
			GLOB.newplayer_start += loc
			delete_me = 1
			return
		if("JoinLate")
			GLOB.latejoin += loc
			delete_me = 1
			return
		if("JoinLateGateway")
			GLOB.latejoin_gateway += loc
			delete_me = 1
			return
		if("JoinLateCryo")
			GLOB.latejoin_cryo += loc
			delete_me = 1
			return
		if("JoinLateCyborg")
			GLOB.latejoin_cyborg += loc
			delete_me = 1
			return
		if("prisonwarp")
			GLOB.prisonwarp += loc
			delete_me = 1
			return
		if("tdome1")
			GLOB.tdome1 += loc
		if("tdome2")
			GLOB.tdome2 += loc
		if("tdomeadmin")
			GLOB.tdomeadmin += loc
		if("tdomeobserve")
			GLOB.tdomeobserve += loc
		if("prisonsecuritywarp")
			GLOB.prisonsecuritywarp += loc
			delete_me = 1
			return
		if("endgame_exit")
			endgame_safespawns += loc
			delete_me = 1
			return
		if("bluespacerift")
			endgame_exits += loc
			delete_me = 1
			return

	landmarks_list += src
	return 1

/obj/effect/landmark/proc/delete()
	delete_me = 1

/obj/effect/landmark/Initialize()
	. = ..()
	if(delete_me)
		return INITIALIZE_HINT_QDEL

/obj/effect/landmark/Destroy()
	landmarks_list -= src
	return ..()

/obj/effect/landmark/start
	name = "start"
	icon = 'icons/effects/random_spawners.dmi'
	icon_state = "ricehat"
	anchored = 1.0
	invisibility = 101

/obj/effect/landmark/start/New()
	..()
	tag = "start*[name]"
	return 1


/* Table of Contents
	Command
	Science
	Medical
	Security
	Engineering
	Supply
	Service
	pilgrims

Template:

/obj/effect/landmark/start/
	name = ""
*/

// Governorship //

/obj/effect/landmark/start/governor
	name = "Planetary Governor"
	icon_state = "governors"
/obj/effect/landmark/start/governor/heir
	name = "Heir"
/obj/effect/landmark/start/governor/servant
	name = "Servant"

// Inquisition and Enforcers

/obj/effect/landmark/start/inqmagi
	name = "Interrogator"
	icon_state = "magis"

/obj/effect/landmark/start/inqmagi/inquisitor
	name = "Inquisitor"

/obj/effect/landmark/start/inqmagi/arbitrator
	name = "Arbitrator"

/obj/effect/landmark/start/inqmagi/enforcer
	name = "Enforcer"

/obj/effect/landmark/start/inqmagi/enforcercadet
	name = "Enforcer Cadet"


// Imperial Guard/ Astra Militarum//

/obj/effect/landmark/start/imperialguard
	name = "Sergeant"
	icon_state = "guards"

/obj/effect/landmark/start/imperialguard/commissar
	name = "Commissar"
	icon_state = "guards"

/obj/effect/landmark/start/imperialguard/sniper
	name = "Imperial Guard Sniper"

/obj/effect/landmark/start/imperialguard/specialist
	name = "Imperial Guard Specialist"

/obj/effect/landmark/start/imperialguard/medicae
	name = "Combat Medicae"

/obj/effect/landmark/start/imperialguard/guard
	name = "Imperial Guardsman"

/obj/effect/landmark/start/imperialguard/bullgryn
	name = "Bullgryn"

/obj/effect/landmark/start/imperialguard/recruit
	name = "Imperial Guard Recruit"


//Trader Retinue //
/obj/effect/landmark/start/roguetrader
	name = "Rogue Trader"
	icon_state = "rts"
/obj/effect/landmark/start/roguetrader/xenomerc
	name = "Xeno Mercenary"


// Adeptus Mechanicus //

/obj/effect/landmark/start/mechanicus
	name = "Magos Explorator"
	icon_state = "mechs"

/obj/effect/landmark/start/mechanicus/biologis
	name = "Magos Biologis"

/obj/effect/landmark/start/mechanicus/techpriest
	name = "Tech Priest Enginseer"

/obj/effect/landmark/start/mechanicus/techmenial
	name = "Tech Menial"

// Ministorum //

/obj/effect/landmark/start/ministorum
	name = "Confessor"
	icon_state = "churchs"

/obj/effect/landmark/start/ministorum/sistersuperior
	name = "Sister Superior"

/obj/effect/landmark/start/ministorum/hospitaller
	name = "Sister Hospitaller"

/obj/effect/landmark/start/ministorum/novice
	name = "Novice"

/obj/effect/landmark/start/ministorum/preacher
	name = "Preacher"

// Village scum //

/obj/effect/landmark/start/village
	name = "Pilgrim"
	icon_state = "pilgrims"

/obj/effect/landmark/start/village/innkeeper
	name = "Innkeeper"

/obj/effect/landmark/start/village/bouncer
	name = "Bouncer"

/obj/effect/landmark/start/village/ganger
	name = "Ganger"

/obj/effect/landmark/start/village/pathfinder
	name = "Pathfinder"

// Removed Content due to low pop. Just admin spawn them yeeeeeesh.//
/obj/effect/landmark/start/admin
	name = "Inquisitor"
	icon_state = "adminroles"

/obj/effect/landmark/start/admin/dominus
	name = "Magos Dominus"
/obj/effect/landmark/start/admin/astartes
	name = "Astartes Envoy"

// Special Roles, ERT and stuff //

/obj/effect/landmark/start/ert
	name = "Emergency Response Team"
	icon_state = "adminroles"

// watchman tdm culties //
/obj/effect/landmark/start/watchman
	name = "Cultist Sergeant"
	icon_state = "watchmens"

/obj/effect/landmark/start/watchman/guardsman
	name = "Cultist Guardsman"

/obj/effect/landmark/start/watchman/specialist
	name = "Cultist Specialist"



//Warhammer stuff
/obj/effect/landmark/JoinLate
	name = "JoinLate"
	icon_state = "latejoins"

/// LOOT SPAWNERS HERE
/// BEGINNING OF LOOT SPAWNERS
/// Be careful. Make sure to search up all items related to what you are spawning and make it possible for it's ammo to spawn as well.

/obj/random/loot/guardgear
	name = "Armor accessories"
	desc = "This is a loot spawner that spawns combat accessories."
	icon_state = "armoraccessory"

/obj/random/loot/guardgear/spawn_choices()
	return list(/obj/item/clothing/accessory/holster/waist = 6,
				/obj/item/clothing/accessory/holster/hip = 6,
				/obj/item/clothing/accessory/storage/torso/armor = 4,
				/obj/item/clothing/accessory/storage/webbing = 12,
				/obj/item/clothing/accessory/legguards/ballistic = 6,
				/obj/item/clothing/accessory/legguards/ablative = 4,
				/obj/item/clothing/accessory/armguards/ablative = 4,
				/obj/item/clothing/accessory/armguards/ballistic = 6,
				/obj/item/clothing/accessory/armguards/riot = 6,
				/obj/item/clothing/glasses/cadiangoggles/elite = 2,
				/obj/item/clothing/head/helmet/guardhelmet/carapace = 1,
				/obj/item/clothing/accessory/legguards/riot = 6)

/obj/random/loot/lightmelee
	name = "Light Melee"
	desc = "This is a weapon loot spawner with a high chance of spawning common light melee weapons."
	icon_state = "lightmelee"

/obj/random/loot/lightmelee/spawn_choices()
	return list(/obj/item/melee/sword/combat_knife = 2,
				/obj/item/melee/telebaton = 1,
				/obj/item/melee/sword/combat_knife/rare = 1,
				/obj/item/melee/sword/combat_knife/glaive = 1,
				/obj/item/melee/sword/combat_knife/bowie = 1,
				/obj/item/melee/sword/machete = 1)

/obj/random/loot/heavymelee
	name = "Heavy Melee"
	desc = "This is a weapon loot spawner with a high chance of spawning common heavy melee weapons."
	icon_state = "heavymelee"

/obj/random/loot/heavymelee/spawn_choices()
	return list(/obj/item/melee/trench_axe = 13,
				/obj/item/melee/classic_baton/trench_club = 8,
				/obj/item/melee/trench_axe/bardiche = 6,
				/obj/item/melee/sword/broadsword = 6,
				/obj/item/melee/trench_axe/glaive = 6,
				/obj/item/melee/trench_axe/bardiche = 6,
				/obj/item/melee/trench_axe/lance = 4,
				/obj/item/melee/trench_axe/bspear = 6,
				/obj/item/shield/riot = 2,
				/obj/item/shield/riot/metal = 1,
				/obj/item/melee/sword/sabre = 4)


/obj/random/loot/tech1
	name = "LOW TECH SPAWNER"
	desc = "spawns low tech"
	icon_state = "armoraccessory"

/obj/random/loot/tech1/spawn_choices()
	return list(/obj/item/rnd/eng3 = 12,
				/obj/item/rnd/eng5 = 8,
				/obj/item/rnd/eng8 = 4,
				/obj/item/rnd/combat3 = 14,
				/obj/item/rnd/combat5 = 10,
				/obj/item/rnd/combat8 = 5,
				/obj/item/reagent_containers/food/snacks/poo = 6,
				/obj/item/rnd/power3 = 10,
				/obj/item/rnd/power5 = 6,
				/obj/item/rnd/power8 = 3,
				/obj/item/reagent_containers/food/snacks/poo = 6,
				/obj/item/rnd/biospace3 = 10,
				/obj/item/rnd/biospace5 = 6,
				/obj/item/rnd/biospace8 = 3,
				/obj/item/reagent_containers/food/snacks/poo = 6,
				/obj/item/rnd/eng10 = 1)

/obj/random/loot/tech2
	name = "HIGH TECH SPAWNER"
	desc = "spawn high tech"
	icon_state = "armoraccessory"

/obj/random/loot/tech2/spawn_choices()
	return list(/obj/item/rnd/eng3 = 12,
				/obj/item/rnd/eng5 = 8,
				/obj/item/rnd/eng8 = 5,
				/obj/item/rnd/combat3 = 14,
				/obj/item/rnd/combat5 = 10,
				/obj/item/rnd/combat8 = 7,
				/obj/item/rnd/combat10 = 2,
				/obj/item/rnd/power3 = 10,
				/obj/item/rnd/power5 = 6,
				/obj/item/rnd/power8 = 3,
				/obj/item/rnd/power10 = 1,
				/obj/item/rnd/biospace3 = 10,
				/obj/item/rnd/biospace5 = 6,
				/obj/item/rnd/biospace8 = 3,
				/obj/item/rnd/biospace10 = 1,
				/obj/item/rnd/illegal3 = 12,
				/obj/item/rnd/illegal5 = 8,
				/obj/item/rnd/illegal8 = 4,
				/obj/item/rnd/illegal10 = 2,
				/obj/item/rnd/eng10 = 1)

/obj/random/loot/meleespawner
	name = "Random Melee Spawner"
	desc = "Spawns light and heavy melee.."
	icon_state = "revolver"

/obj/random/loot/meleespawner/spawn_choices()
	return list(/obj/item/melee/sword/combat_knife = 1,
				/obj/item/melee/sword/combat_knife/rare = 2,
				/obj/item/melee/sword/combat_knife/bowie = 3,
				/obj/item/melee/sword/combat_knife/glaive = 1,
				/obj/item/melee/trench_axe = 13,
				/obj/item/melee/classic_baton/trench_club = 5,
				/obj/item/melee/telebaton = 3,
				/obj/item/melee/trench_axe/glaive = 3,
				/obj/item/melee/trench_axe/glaive/adamantine = 1,
				/obj/item/melee/trench_axe/bardiche = 3,
				/obj/item/melee/trench_axe/lance = 2,
				/obj/item/melee/trench_axe/lance/adamantine = 1,
				/obj/item/melee/trench_axe/bspear = 6,
				/obj/item/melee/sword/cutro = 10,
				/obj/item/melee/sword/cutro/adamantine = 1,
				/obj/item/melee/sword/broadsword = 6,
				/obj/item/melee/sword/broadsword/adamantine = 1,
				/obj/item/melee/sword/machete = 6,
				/obj/item/melee/sword/machete/chopper = 5,
				/obj/item/toy/katana = 6,
				/obj/item/toy/katana/strong = 2,
				/obj/item/shield/riot = 2,
				/obj/item/melee/chain/inqcs = 1,
				/obj/item/melee/chain/pcsword/eviscerator = 1,
				/obj/item/melee/sword/sabre = 4)

/obj/random/loot/sidearmammo // old no use
	name = "Sidearm Ammo"
	desc = "This is an ammo spawner that spawns ammo for sidearms" // sidearms are pistols and pdws (smgs)
	icon_state = "sidearmammo"

/obj/random/loot/sidearmammo/spawn_choices()
	return list(/obj/item/ammo_magazine/c50 = 2,
				/obj/item/ammo_magazine/a357 = 4,
				/obj/item/ammo_magazine/c38 = 1,
				/obj/item/ammo_magazine/c44 = 3,
				/obj/item/cell/lasgun = 4,
				/obj/item/cell/lasgun/small = 2,
				/obj/item/ammo_magazine/mc45mm = 6,
				/obj/item/ammo_box/shotgun = 1,
				/obj/item/ammo_magazine/bolt_pistol_magazine = 1)

/obj/random/loot/sidearms
	name = "Sidearms"
	desc = "This is a weapon loot spawner with a high chance of spawning common sidearms"
	icon_state = "sidearm"

/obj/random/loot/sidearms/spawn_choices()
	return list(
				/obj/item/gun/energy/las/laspistol = 4,
				/obj/item/gun/energy/las/laspistol/shitty = 5,
				/obj/item/gun/energy/las/laspistol/accatran = 1,
				/obj/item/gun/energy/las/laspistol/militarum/lucius = 2,
				/obj/item/gun/energy/las/laspistol/militarum = 2,
				/obj/item/gun/projectile/talon/renegade = 1,
				/obj/item/gun/projectile/revolver/mateba = 1,
				/obj/item/gun/projectile/revolver/villiers = 1,
				/obj/item/gun/projectile/necros = 1,
				/obj/item/gun/projectile/slugrevolver = 1,
				/obj/item/gun/projectile/pistol/pewter = 3,
				/obj/item/gun/projectile/pistol/kieji = 3,
				/obj/item/gun/projectile/pistol/kieji/snub = 3,
				/obj/item/gun/projectile/pistol/villiers = 3,
				/obj/item/gun/projectile/bolter_pistol = 1)

/obj/random/loot/randomammo1
	name = "Random Ammo"
	desc = "This is a random ammo spawner of projectile weaponry."
	icon_state = "randomammo"

/obj/random/loot/randomammo1/spawn_choices()
	return list(
		/obj/item/ammo_magazine/c556 = 6,
		/obj/item/ammo_box/shotgun = 4,
		/obj/item/ammo_magazine/smgmc9mm = 2,
		/obj/item/ammo_box/shotgun/slug = 3,
		/obj/item/storage/box/sniperammo = 1,
		/obj/item/ammo_magazine/handful/brifle_handful = 3,
		/obj/item/ammo_magazine/handful/brifle_handful/ms = 2,
		/obj/item/ammo_magazine/handful/brifle_handful/ap = 1,
		/obj/item/ammo_magazine/a762 = 3,
		/obj/item/ammo_magazine/box/a556/mg08 = 3
		)

/obj/random/loot/randomammosidearm
	name = "Random Sidearm Ammo"
	desc = "This is a random ammo spawner of projectile weaponry."
	icon_state = "randomammo"

/obj/random/loot/randomammosidearm/spawn_choices()
	return list(
		/obj/item/ammo_magazine/mc45mm = 9,
		/obj/item/ammo_magazine/a357 = 6,
		/obj/item/ammo_magazine/handful/a50 = 3,
		/obj/item/ammo_magazine/bolt_pistol_magazine = 1,
		/obj/item/cell/lasgun/hotshot = 1,
		/obj/item/cell/lasgun = 3,
		/obj/item/ammo_magazine/c44 = 5
		)

/obj/random/loot/randomlasammo
	name = "Random Lasgun Ammo"
	desc = "This is a random ammo spawner for energy weapons."
	icon_state = "randomammo"

/obj/random/loot/randomlasammo/spawn_choices()
	return list(
		/obj/item/cell/lasgun/small = 10,
		/obj/item/cell/lasgun/hotshot = 3,
		/obj/item/cell/plasma = 1,
		/obj/item/cell/lasgun = 20
		)

/obj/random/loot/badweapon
	name = "Bad Weapon Spawner 1" // This spawner creates projectile weapons
	desc = "This is a weapon loot spawner that spawns mostly low quality weapons."
	icon_state = "badranged"

/obj/random/loot/badweapon/spawn_choices()
	return list(
		/obj/item/gun/projectile/shotgun/pump/boltaction = 4,
		/obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter = 2,
		/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered = 2,
		/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester = 2,
		/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/glory = 1,
		/obj/item/gun/projectile/shotgun/pump/voxlegis = 4,
		/obj/item/gun/projectile/shotgun/pump/shitty/sawn = 2,
		/obj/item/gun/projectile/shotgun/pump/shitty/magrave = 2,
		/obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle = 1,
		/obj/item/gun/projectile/automatic/m22/combatrifle = 2,
		/obj/item/gun/projectile/automatic/heavystubber = 1,
		/obj/item/gun/projectile/automatic/heavystubber/villiers = 1,
		/obj/item/gun/projectile/automatic/machinepistol = 4,
		/obj/item/gun/projectile/automatic/machinepistol/a80 = 3,
		/obj/item/gun/projectile/automatic/autogrim = 2,
		/obj/item/gun/projectile/automatic/autogrim/krieg = 1,
		/obj/item/gun/projectile/automatic/agripinaaii = 1,
		/obj/item/gun/projectile/automatic/messina = 1,
		/obj/item/gun/projectile/thrower = 4
	)


/obj/random/loot/badweaponlas
	name = "Bad Weapon Spawner Las" // This spawner creates las weapons
	desc = "This is a weapon loot spawner that spawns mostly low quality weapons."
	icon_state = "badranged"

/obj/random/loot/badweaponlas/spawn_choices()
	return list(
		/obj/item/gun/energy/las/laspistol/shitty = 9,
		/obj/item/gun/energy/las/lasgun/shitty = 7,
		/obj/item/gun/energy/las/laspistol = 5,
		/obj/item/gun/energy/las/laspistol/militarum = 3,
		/obj/item/gun/energy/las/laspistol/militarum/lucius = 2,
		/obj/item/gun/energy/las/lasgun/lucius = 3,
		/obj/item/gun/energy/las/lasgun/catachan = 1,
		/obj/item/gun/energy/las/lasgun/accatran = 1,
		/obj/item/gun/energy/las/lasgun = 4
	)

/obj/random/loot/goodweapon
	name = "Good Weapon Spawner" // plasma, bolter, fancy lasguns
	desc = "This is a weapon loot spawner that spawns mostly high quality weapons."
	icon_state = "goodranged"

/obj/random/loot/goodweapon/spawn_choices()
	return list(
				/obj/item/gun/projectile/boltrifle/lockebolter = 1,
				/obj/item/gun/projectile/bolter_pistol/inquis = 1,
				/obj/item/gun/energy/pulse/plasma/rifle = 1,
				/obj/item/gun/energy/pulse/plasma/pistol = 3,
				/obj/item/gun/energy/las/hotshot = 2,
				/obj/item/gun/projectile/meltagun = 1,
				/obj/item/gun/energy/las/lasgun/longlas = 2,
				/obj/item/gun/energy/las/lasgun/longlas/krieg = 2,
				/obj/item/gun/projectile/heavysniper = 2
				)

/obj/random/loot/randomarmor
	name = "Random Armor"
	desc = "This is a loot spawner that spawns pilgrim and pilgrim+ level armor"
	icon_state = "randomarmor"

/obj/random/loot/randomarmor/spawn_choices()
	return list(/obj/item/clothing/suit/armor/militia = 1,
				/obj/item/clothing/suit/cloak = 1,
				/obj/item/clothing/suit/armor/brigandine = 1,
//				/obj/item/clothing/suit/armor/slaverobe = 1,
				/obj/item/clothing/suit/armor/templar = 1,
				/obj/item/clothing/suit/armor/hauberk = 1,
				/obj/item/clothing/suit/armor/trinet = 1,
				/obj/item/clothing/suit/armor/heavyflaksuit = 1,
				/obj/item/clothing/suit/armor/breastplate = 1,
				/obj/item/clothing/suit/armor/sniper = 1,
				/obj/item/clothing/suit/armor/cuirass = 1,
				/obj/item/clothing/suit/armor/salvage = 1,
				/obj/item/clothing/suit/armor/guardsman/mercenary = 1,
				/obj/item/clothing/suit/armor/slanclothing/maleslan = 1,
//				/obj/item/clothing/suit/armor/necromundaflak1 = 1,
//				/obj/item/clothing/suit/armor/necromundacarapace1 = 1,
				/obj/item/clothing/suit/armor/ranger3 = 1,
				/obj/item/clothing/suit/armor/ranger2 = 1,
				/obj/item/clothing/head/helmet/salvage = 1,
				/obj/item/clothing/head/helmet/mining = 1,
				/obj/item/clothing/suit/armor/heavyflaksuit = 1,
				/obj/item/clothing/suit/armor/heavyduster = 1,
//				/obj/item/clothing/suit/armor/goliath2 = 1,
//				/obj/item/clothing/suit/armor/flak1 = 1,
//				/obj/item/clothing/suit/armor/flak2 = 1,
				/obj/item/clothing/suit/armor/scum2 = 1,
				/obj/item/clothing/suit/armor/leather = 1,
				/obj/item/clothing/suit/armor/hjacket = 1,
				/obj/item/clothing/suit/armor/hjacket2 = 1,
				/obj/item/clothing/suit/armor/slumcoat = 1,
				/obj/item/clothing/suit/armor/towntrench = 1,
				/obj/item/clothing/suit/armor/tduster = 1,
				/obj/item/clothing/suit/armor/bonearmor = 1,
				/obj/item/clothing/suit/armor/carapaceduster = 1,
				/obj/item/clothing/suit/armor/armoredtrench = 1)

/obj/random/loot/randomsupply
	name = "Random Supply"
	desc = "This is a loot spawner that spawns supplies like medicine, food and materials."
	icon_state = "randomsupply"

/obj/random/loot/randomsupply/spawn_choices()
	return list(/obj/item/storage/box/ifak = 4,
				/obj/item/storage/firstaid/adv = 1,
				/obj/item/storage/firstaid/surgery = 1,
				/obj/item/storage/belt/medical/full = 1,
				/obj/item/reagent_containers/hypospray/autoinjector/revive = 4,
				/obj/item/stack/barbwire = 3,
				/obj/random/canned_food = 1,
				/obj/item/flame/lighter/zippo = 1,
				/obj/item/device/flashlight/lantern = 1,
				/obj/item/storage/pill_bottle/happy = 1,
				/obj/item/stack/material/silver/ten = 1,
				/obj/item/stack/material/glass/fifty = 1,
				/obj/item/stack/material/steel/fifty = 2)

/obj/random/loot/randomitemcaves // make this a grenade spawn?
	name = "Random Item Caves"
	desc = "This is a loot spawner that spawns random items."
	icon_state = "randompilgrim"

/obj/random/loot/randomitemcaves/spawn_choices()
	return list(/obj/item/shovel = 2,
				/obj/item/clothing/glasses/night = 3,
				/obj/item/pickaxe = 2,
				/obj/item/storage/firstaid/combat = 1,
				/obj/item/storage/firstaid/surgery = 1,
				/obj/item/reagent_containers/hypospray/autoinjector/revive = 2,
				/obj/item/clothing/accessory/holster/waist = 3,
				/obj/item/clothing/accessory/storage/webbing = 4,
				/obj/item/stack/thrones2/ten = 1,
				/obj/item/grenade/frag/high_yield/homemade = 3,
				/obj/item/grenade/frag = 1,
				/obj/item/grenade/frag/high_yield/krak = 1)

/obj/random/loot/randomitemtown
	name = "Random Item Pilgrim"
	desc = "This is a loot spawner that spawns random items that will be useful for any pilgrim."
	icon_state = "randompilgrim"

/obj/random/loot/randomitemtown/spawn_choices()
	return list(/obj/item/device/binoculars = 2,
				/obj/item/storage/box/ifak = 3,
				/obj/item/storage/firstaid/adv = 1,
				/obj/item/clothing/suit/armor/militia = 2,
				/obj/item/melee/sword/combat_knife = 1,
				/obj/item/melee/trench_axe = 1,
				/obj/item/stack/thrones2/ten = 2,
				/obj/item/clothing/accessory/holster/waist = 3,
				/obj/item/clothing/accessory/storage/webbing = 5,
				/obj/item/storage/belt/utility/full = 2,
				/obj/item/clothing/accessory/legguards = 2,
				/obj/item/clothing/accessory/armguards/ballistic = 2,
				/obj/item/grenade/frag/high_yield/homemade = 1)



/obj/random/exploration
	name = "random exploration loot"
	desc = "Low grade loot that is often around 50-100 thrones worth."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "giftpaper"

/obj/random/exploration/spawn_choices()
	return list(/obj/item/exploration_loot = 3,
				/obj/item/exploration_loot/cloth_roll = 4,
				/obj/item/exploration_loot/sealed_enve = 2,
				/obj/item/exploration_loot/chem_package = 2,
			    /obj/item/exploration_loot/package = 3,
				/obj/item/exploration_loot/case = 2,
				/obj/item/exploration_loot/odd_book = 2,
				/obj/item/exploration_loot/guard_diary = 1,
				/obj/item/exploration_loot/shiny_gem = 1,
				/obj/item/exploration_loot/map = 1,
                /obj/item/exploration_loot/spicecase = 1,
                /obj/item/exploration_loot/lootbox = 1,
                /obj/item/exploration_loot/imperial_book = 1)

/obj/random/exploration/high
	name = "random high quality exploration loot"
	desc = "High grade loot that is often around 100-250 thrones worth."
	icon = 'icons/map_project/fluff_items.dmi'
	icon_state = "zrbite"

/obj/random/exploration/high/spawn_choices()
	return list(/obj/item/exploration_loot/map = 3,
			    /obj/item/exploration_loot/drugs = 3,
				/obj/item/exploration_loot/elerium = 1,
				/obj/item/exploration_loot/guard_diary = 2,
				/obj/item/exploration_loot/bm_file = 1,
				/obj/item/exploration_loot/shiny_gem = 2,
				/obj/item/exploration_loot/zrbite = 1,
				/obj/item/exploration_loot/elerium = 1,
				/obj/item/exploration_loot/elerium_ingot = 0.7,
				/obj/item/exploration_loot/zrbite_ingot = 0.7,
                /obj/item/exploration_loot/artiaxe = 0.5,
                /obj/item/exploration_loot/goldbar = 0.5)








/// THIS IS THE END OF LOOT SPAWNERS. TO DO: Tech, Xenos Spawners.

// MOB AND ANIMAL SPAWNERS

// CHAOS BEASTIES
// Zygotes = Slow acid zombies. Only idiots get killed by these.
// Bloodletter = Khorne Demon / Blood Legion Commander. Very high damage and decent HP. Friendly to cultists.
// Bubbling Mass = Big fat daemon. High HP and damage. Slow.
// Flesh Beast = Medium daemon. Average HP and damage.

/obj/effect/landmark/animal/horde/New()
	if (prob(100)) // Difficulty: Impossible. Outpost level threat. Use this to populate very large areas. Never spawn in front of players.
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/fleshbeast(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/bloodletter(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/bloodletter(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/bubblingmass(src.loc)
	if (prob(100))
		new /obj/effect/decal/cleanable/blood/gibs/up(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/bloodletter1/New()
	if (prob(95)) // Difficulty: Very Hard. Squad level threat.
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/fleshbeast(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/bloodletter(src.loc)
	if (prob(100))
		new /obj/effect/decal/cleanable/blood/gibs/up(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/bloodletter2/New() // Difficulty: Very Hard. Squad level threat.
	if (prob(90))
		new /mob/living/simple_animal/hostile/smalldemon/bloodletter(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/bloodletter(src.loc)
	if (prob(100))
		new /obj/effect/decal/cleanable/blood/gibs/up(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/bubblingmass1/New() // Difficulty: Medium. Guard level threat.
	if (prob(95))
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/fleshbeast(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/bubblingmass(src.loc)
	if (prob(100))
		new /obj/effect/decal/cleanable/blood/gibs/up(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/zygote1/New() // Difficulty: Medium. Guard level threat.
	if (prob(80))
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
		new /mob/living/simple_animal/hostile/smalldemon/zygote(src.loc)
	if (prob(100))
		new /obj/effect/decal/cleanable/blood/gibs/up(src.loc)
	delete_me = 1

// TRAITOR GUARD
/obj/effect/landmark/animal/syndicate/New() // Difficulty: Medium. Guard level threat. They're not very smart and aren't sprited well. Shoots kantrael laser projectiles and stabs with bayonet up close.
	if (prob(90))
		new /mob/living/simple_animal/hostile/syndicate/ranged(src.loc)
		new /mob/living/simple_animal/hostile/syndicate/ranged(src.loc)
		new /mob/living/simple_animal/hostile/syndicate/ranged(src.loc) // Generic traitor guard sprites and low HP. Their speed is low to prevent them from charging into melee range immediately.
		new /mob/living/simple_animal/hostile/syndicate/ranged/space(src.loc) // This one is named Veteran Traitor Guard and has more HP.
	if (prob(100))
		new /obj/effect/decal/cleanable/blood/gibs/up(src.loc)
	delete_me = 1


/obj/effect/landmark/animal/rnghostilespawner
	icon_state = "ratspawn"

/obj/effect/landmark/animal/rnghostilespawner/New()
	if (prob(10))
		new /mob/living/simple_animal/hostile/bear(src.loc)
	if (prob(10))
		new /mob/living/simple_animal/hostile/shafra(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/rngdemonspawner/New()
	if (prob(15))
		new /mob/living/simple_animal/hostile/smalldemon(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/rngretaliatespawner
	icon_state = "ratspawn"


/obj/effect/landmark/animal/rngretaliatespawner/New()
	if (prob(20))
		new /mob/living/simple_animal/hostile/retaliate/rat(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/krootspawn/New()
	new /mob/living/carbon/human/kroot(src.loc)
	delete_me = 1

/obj/effect/landmark/animal/rngfriendlyfellowspawner/New()
	if(prob(15))
		new /mob/living/simple_animal/hostile/retaliate/goat(src.loc)
	if(prob(15))
		new /mob/living/simple_animal/cow(src.loc)
	if(prob(15))
		new /mob/living/simple_animal/chicken(src.loc)

//Costume spawner landmarks
/obj/effect/landmark/costume/New() //costume spawner, selects a random subclass and disappears

	var/list/options = typesof(/obj/effect/landmark/costume)
	var/PICK= options[rand(1,options.len)]
	new PICK(src.loc)
	delete_me = 1

//SUBCLASSES.  Spawn a bunch of items and disappear likewise
/obj/effect/landmark/costume/chameleon/New()
	new /obj/item/clothing/mask/chameleon(src.loc)
	new /obj/item/clothing/under/chameleon(src.loc)
	new /obj/item/clothing/glasses/chameleon(src.loc)
	new /obj/item/clothing/shoes/chameleon(src.loc)
	new /obj/item/clothing/gloves/chameleon(src.loc)
	new /obj/item/clothing/suit/chameleon(src.loc)
	new /obj/item/clothing/head/chameleon(src.loc)
	new /obj/item/storage/backpack/chameleon(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/gladiator/New()
	new /obj/item/clothing/under/gladiator(src.loc)
	new /obj/item/clothing/head/helmet/gladiator(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/madscientist/New()
	new /obj/item/clothing/under/gimmick/rank/captain/suit(src.loc)
	new /obj/item/clothing/head/flatcap(src.loc)
	new /obj/item/clothing/suit/storage/toggle/labcoat/mad(src.loc)
	new /obj/item/clothing/glasses/gglasses(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/elpresidente/New()
	new /obj/item/clothing/under/gimmick/rank/captain/suit(src.loc)
	new /obj/item/clothing/head/flatcap(src.loc)
	new /obj/item/clothing/mask/smokable/cigarette/cigar/havana(src.loc)
	new /obj/item/clothing/shoes/jackboots(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/nyangirl/New()
	new /obj/item/clothing/under/schoolgirl(src.loc)
	new /obj/item/clothing/head/kitty(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/maid/New()
	new /obj/item/clothing/under/blackskirt(src.loc)
	var/CHOICE = pick( /obj/item/clothing/head/beret , /obj/item/clothing/head/rabbitears )
	new CHOICE(src.loc)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/butler/New()
	new /obj/item/clothing/accessory/wcoat(src.loc)
	new /obj/item/clothing/under/suit_jacket(src.loc)
	new /obj/item/clothing/head/that(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/scratch/New()
	new /obj/item/clothing/gloves/white(src.loc)
	new /obj/item/clothing/shoes/white(src.loc)
	new /obj/item/clothing/under/scratch(src.loc)
	if (prob(30))
		new /obj/item/clothing/head/cueball(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/prig/New()
	new /obj/item/clothing/accessory/wcoat(src.loc)
	new /obj/item/clothing/glasses/monocle(src.loc)
	var/CHOICE= pick( /obj/item/clothing/head/bowler, /obj/item/clothing/head/that)
	new CHOICE(src.loc)
	new /obj/item/clothing/shoes/black(src.loc)
	new /obj/item/cane(src.loc)
	new /obj/item/clothing/under/sl_suit(src.loc)
	new /obj/item/clothing/mask/fakemoustache(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/plaguedoctor/New()
	new /obj/item/clothing/suit/bio_suit/plaguedoctorsuit(src.loc)
	new /obj/item/clothing/head/plaguedoctorhat(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/nightowl/New()
	new /obj/item/clothing/under/owl(src.loc)
	new /obj/item/clothing/mask/gas/owl_mask(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/waiter/New()
	new /obj/item/clothing/under/waiter(src.loc)
	var/CHOICE= pick( /obj/item/clothing/head/kitty, /obj/item/clothing/head/rabbitears)
	new CHOICE(src.loc)
	new /obj/item/clothing/suit/apron(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/pirate/New()
	new /obj/item/clothing/under/pirate(src.loc)
	new /obj/item/clothing/suit/pirate(src.loc)
	var/CHOICE = pick( /obj/item/clothing/head/pirate)
	new CHOICE(src.loc)
	new /obj/item/clothing/glasses/eyepatch(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/commie/New()
	new /obj/item/clothing/under/soviet(src.loc)
	new /obj/item/clothing/head/ushanka(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/imperium_monk/New()
	new /obj/item/clothing/suit/imperium_monk(src.loc)
	if (prob(25))
		new /obj/item/clothing/mask/gas/cyborg(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/holiday_priest/New()
	new /obj/item/clothing/suit/holidaypriest(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/marisawizard/fake/New()
	new /obj/item/clothing/head/wizard/marisa/fake(src.loc)
	new/obj/item/clothing/suit/wizrobe/marisa/fake(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/cutewitch/New()
	new /obj/item/clothing/under/sundress(src.loc)
	new /obj/item/clothing/head/witchwig(src.loc)
	new /obj/item/staff/broom(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/fakewizard/New()
	new /obj/item/clothing/suit/wizrobe/fake(src.loc)
	new /obj/item/clothing/head/wizard/fake(src.loc)
	new /obj/item/staff/(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/sexyclown/New()
	new /obj/item/clothing/mask/gas/sexyclown(src.loc)
	new /obj/item/clothing/under/sexyclown(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/sexymime/New()
	new /obj/item/clothing/mask/gas/sexymime(src.loc)
	new /obj/item/clothing/under/sexymime(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/savagehunter/New()
	new /obj/item/clothing/mask/spirit(src.loc)
	new /obj/item/clothing/under/savage_hunter(src.loc)
	delete_me = 1

/obj/effect/landmark/costume/savagehuntress/New()
	new /obj/item/clothing/mask/spirit(src.loc)
	new /obj/item/clothing/under/savage_hunter/female(src.loc)
	delete_me = 1

/obj/effect/landmark/tapes/New()
	if(prob(33))
		new /obj/item/device/cassette/tape1(src.loc)
	if(prob(33))
		new /obj/item/device/cassette/tape2(src.loc)
	if(prob(33))
		new /obj/item/device/cassette/tape3(src.loc)

/obj/effect/landmark/rngcavewalls/New()
	if(prob(75))
		new /turf/simulated/mineral/snowycave(src.loc)
/obj/effect/landmark/ruin
	var/datum/map_template/ruin/ruin_template

/obj/effect/landmark/ruin/New(loc, my_ruin_template)
	name = "ruin_[sequential_id(/obj/effect/landmark/ruin)]"
	..(loc)
	ruin_template = my_ruin_template
	GLOB.ruin_landmarks |= src

/obj/effect/landmark/ruin/Destroy()
	GLOB.ruin_landmarks -= src
	ruin_template = null
	. = ..()

/obj/effect/landmark/random_gen
	var/generation_width
	var/generation_height
	var/seed
	delete_me = TRUE

/obj/effect/landmark/random_gen/asteroid/Initialize()
	. = ..()

	var/min_x = 1
	var/min_y = 1
	var/max_x = world.maxx
	var/max_y = world.maxy

	if (generation_width)
		min_x = max(src.x, min_x)
		max_x = min(src.x + generation_width, max_x)
	if (generation_height)
		min_y = max(src.y, min_y)
		max_y = min(src.y + generation_height, max_y)

	new /datum/random_map/automata/cave_system(seed, min_x, min_y, src.z, max_x, max_y)
	new /datum/random_map/noise/ore(seed, min_x, min_y, src.z, max_x, max_y)

	GLOB.using_map.refresh_mining_turfs(src.z)

/obj/effect/landmark/cargospawn
	name = "cargospawn"

/obj/effect/landmark/reqspawn
	name = "reqspawn"

//this is about to be the hackiest thing I've ever done in  my entire life and I do not care
/obj/effect/landmark/runaway
	name = "evac1"
/obj/effect/landmark/evac/two
	name = "evac2"
/obj/effect/landmark/ertinsert
	name = "ert1"

/obj/effect/landmark/ertinsert/two
	name = "ert2"

/obj/effect/landmark/ert
	name = "ert"