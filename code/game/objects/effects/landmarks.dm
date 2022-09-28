/obj/effect/landmark
	name = "landmark"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
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
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
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


//Command//
/obj/effect/landmark/start/captain
	name = "Rouge Trader"
/obj/effect/landmark/start/hop
	name = "Seneschal"
/obj/effect/landmark/start/hos
	name = "Commissar"
/obj/effect/landmark/start/rd
	name = "Research Director"
/obj/effect/landmark/start/chief_engineer
	name = "Magos Dominus"
/obj/effect/landmark/start/cmo
	name = "Almoness Advance"
/obj/effect/landmark/start/inquisitor
	name = "Inquisitor"
/obj/effect/landmark/start/envoy
	name = "Astartes Envoy"

//Science//
/obj/effect/landmark/start/geneticist
	name = "Magos Biologis"
/obj/effect/landmark/start/scientist
	name = "Tenchotrainee"
/obj/effect/landmark/start/xenobiologist
	name = "Magos Xenologist"
/obj/effect/landmark/start/roboticist
	name = "Cybernetica Acolyte"

//Medical//
/obj/effect/landmark/start/medical_doctor
	name = "Medicae"
/obj/effect/landmark/start/chemist
	name = "Chemist"
/obj/effect/landmark/start/paramedic
	name = "Paramedic"

//Security//

/obj/effect/landmark/start/detective
	name = "Inspector"
/obj/effect/landmark/start/warden
	name = "Sergeant"
/obj/effect/landmark/start/enforcer
	name = "Enforcer"
/obj/effect/landmark/start/ig
	name = "Imperial Guardsman"

//Engineering//

/obj/effect/landmark/start/engineer
	name = "Tech Priest Enginseer"

//Supply//

/obj/effect/landmark/start/cargo
	name = "Munitorum Menial"
/obj/effect/landmark/start/qm
	name = "Munitorum Tribunus"
/obj/effect/landmark/start/shaft_miner
	name = "Munitorum Explorator"

//Service//
/obj/effect/landmark/start/botanic
	name = "Farmer"
/obj/effect/landmark/start/bartender
	name = "Bar Servitor"
/obj/effect/landmark/start/chef
	name = "Cook"
/obj/effect/landmark/start/chaplain
	name = "Chaplain"
/obj/effect/landmark/start/janitor
	name = "Janitor Servitor"
/obj/effect/landmark/start/librarian
	name = "Record Keeper"

//Pilgrims//
/obj/effect/landmark/start/assistant
	name = "Assistant"



//Warhammer stuff
/obj/effect/landmark/JoinLate
	name = "JoinLate"

/// LOOT SPAWNERS HERE
/// BEGINNING OF LOOT SPAWNERS
/// Be careful. Make sure to search up all items related to what you are spawning and make it possible for it's ammo to spawn as well.

/obj/random/loot/guardgear
	name = "Guard Gear"
	desc = "This is a loot spawner that spawns combat accessories."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/guardgear/spawn_choices()
	return list(/obj/item/clothing/accessory/holster/waist = 2,
				/obj/item/clothing/accessory/holster/hip = 2,
				/obj/item/storage/belt/warfare = 1,
				/obj/item/clothing/accessory/storage/torso/armor = 2,
				/obj/item/clothing/accessory/storage/webbing = 8,
				/obj/item/clothing/accessory/legguards/ballistic = 6,
				/obj/item/clothing/accessory/legguards/ablative = 4,
				/obj/item/clothing/accessory/armguards/ablative = 4,
				/obj/item/clothing/accessory/armguards/ballistic = 6,
				/obj/item/clothing/accessory/armguards/riot = 6,
				/obj/item/clothing/glasses/cadiangoggles/elite = 1,
				/obj/item/clothing/accessory/legguards/riot = 6)

/obj/random/loot/guardarmor
	name = "Special Guard Armor" // After manor update we delete this.
	desc = "This is a loot spawner that spawns special imperial guardsmen armor and no more then 2-3 should be on the map."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/guardarmor/spawn_choices()
	return list(/obj/item/clothing/suit/armor/flak/heavy = 2,
				/obj/item/clothing/suit/armor/guardsman/carapace =1,
				/obj/item/clothing/suit/armor/krieger/grenadier = 1)

/obj/random/loot/guardhelmet
	name = "Guard Helmet" // After manor update we delete this.
	desc = "This is a loot spawner that spawns imperial guardsmen armor."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/guardhelmet/spawn_choices()
	return list(/obj/item/clothing/head/helmet/guardhelmet = 3,
				/obj/item/clothing/head/helmet = 2,
				/obj/item/clothing/head/valushanka = 2,
				/obj/item/clothing/head/helmet/krieghelmet = 1,
				/obj/item/clothing/mask/gas/krieg = 1,
				/obj/item/clothing/head/helmet/riot = 1)

/obj/random/loot/lightmelee
	name = "Light Melee"
	desc = "This is a weapon loot spawner with a high chance of spawning common light melee weapons."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/lightmelee/spawn_choices()
	return list(/obj/item/material/sword/combat_knife = 2,
				/obj/item/material/sword/combat_knife/rare = 3,
				/obj/item/material/sword/combat_knife/glaive = 1,
				/obj/item/material/sword/combat_knife/bowie = 1,
				/obj/item/melee/telebaton = 1,
				/obj/item/material/sword/machete = 1)

/obj/random/loot/heavymelee
	name = "Heavy Melee"
	desc = "This is a weapon loot spawner with a high chance of spawning common heavy melee weapons."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/heavymelee/spawn_choices()
	return list(/obj/item/melee/trench_axe = 13,
				/obj/item/material/sword/cane = 4,
				/obj/item/melee/classic_baton/trench_club = 8,
				/obj/item/melee/telebaton = 12,
				/obj/item/melee/trench_axe/glaive/adamantine = 1,
				/obj/item/melee/trench_axe/lance/adamantine = 1,
				/obj/item/material/sword/cutro/adamantine = 1,
				/obj/item/material/sword/broadsword/adamantine = 1,
				/obj/item/melee/trench_axe/glaive = 6,
				/obj/item/melee/trench_axe/bardiche = 6,
				/obj/item/melee/trench_axe/lance = 4,
				/obj/item/melee/trench_axe/bspear = 12,
				/obj/item/material/sword/cutro = 10,
				/obj/item/material/sword/broadsword = 6,
				/obj/item/material/sword/machete = 16,
				/obj/item/material/sword/machete/chopper = 10,
				/obj/item/material/sword/machete/chopper/heavy = 6,
				/obj/item/toy/katana = 6,
				/obj/item/toy/katana/strong = 2,
				/obj/item/shield/riot = 2,
				/obj/item/shield/riot/metal = 1,
				/obj/item/material/sword/sabre = 4)

/obj/random/loot/meleespawner
	name = "Random Melee Spawner"
	desc = "Spawns light and heavy melee.."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/meleespawner/spawn_choices()
	return list(/obj/item/material/sword/combat_knife = 1,
				/obj/item/material/sword/combat_knife/rare = 2,
				/obj/item/material/sword/combat_knife/bowie = 3,
				/obj/item/material/sword/combat_knife/glaive = 1,
				/obj/item/melee/trench_axe = 13,
				/obj/item/material/sword/cane = 4,
				/obj/item/melee/classic_baton/trench_club = 8,
				/obj/item/melee/telebaton = 12,
				/obj/item/melee/trench_axe/glaive = 6,
				/obj/item/melee/trench_axe/bardiche = 6,
				/obj/item/melee/trench_axe/lance = 4,
				/obj/item/melee/trench_axe/bspear = 12,
				/obj/item/material/sword/cutro = 10,
				/obj/item/material/sword/broadsword = 6,
				/obj/item/material/sword/machete = 16,
				/obj/item/material/sword/machete/chopper = 10,
				/obj/item/toy/katana = 6,
				/obj/item/toy/katana/strong = 2,
				/obj/item/shield/riot = 2,
				/obj/item/melee/chain/inqcs = 1,
				/obj/item/melee/chain/pcsword/eviscerator = 1,
				/obj/item/material/sword/sabre = 4)

/obj/random/loot/lightstubber
	name = "Light Stubber" // After manor update we delete this.
	desc = "This is a weapon loot spawner with a high chance of spawning common light stubbers."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/lightstubber/spawn_choices()
	return list(/obj/item/gun/projectile/shotgun/pump/shitty/sawn = 3,
				/obj/item/gun/projectile/automatic/machinepistol = 9,
				/obj/item/gun/projectile/automatic/machinepistol/a80 = 8,
				/obj/item/gun/projectile/warfare/kieji = 3,
				/obj/item/gun/projectile/talon/renegade = 1,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty = 8,
				/obj/item/gun/projectile/shotgun/pump/shitty = 9,
				/obj/item/gun/projectile/shotgun/pump/shitty/magrave = 3,
				/obj/item/gun/projectile/shotgun/pump = 3,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered = 4,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester = 5,
				/obj/item/gun/projectile/bolter_pistol = 1)

/obj/random/loot/lightstubberammo
	name = "Light Stubber Ammo" // After manor update we delete this.
	desc = "This is an ammo spawner that spawns ammo for light stubbers."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"

/obj/random/loot/lightstubberammo/spawn_choices()
	return list(/obj/item/ammo_box/shotgun = 7,
				/obj/item/ammo_magazine/box/shotgun/slug = 3,
				/obj/item/ammo_magazine/box/shotgun/bean = 1,
				/obj/item/ammo_box/rifle = 8,
				/obj/item/ammo_magazine/c45m/warfare = 3,
				/obj/item/ammo_magazine/mc9mmt/machinepistol = 9,
				/obj/item/ammo_magazine/mc9mmt/machinepistol = 8,
				/obj/item/ammo_magazine/bolt_pistol_magazine = 1)

/obj/random/loot/sidearmammo
	name = "Sidearm Ammo"
	desc = "This is an ammo spawner that spawns ammo for light stubbers."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"

/obj/random/loot/sidearmammo/spawn_choices()
	return list(/obj/item/ammo_magazine/a357 = 4,
				/obj/item/ammo_magazine/a357 = 4,
				/obj/item/ammo_magazine/c45m/warfare = 8,
				/obj/item/ammo_magazine/c45m/warfare = 6,
				/obj/item/cell/lasgun = 8,
				/obj/item/ammo_magazine/c44 = 5,
				/obj/item/ammo_box/shotgun = 3,
				/obj/item/ammo_magazine/bolt_pistol_magazine = 1)

/obj/random/loot/sidearms
	name = "Sidearms"
	desc = "This is a weapon loot spawner with a high chance of spawning common sidearms and accessories."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/sidearms/spawn_choices()
	return list(/obj/item/gun/projectile/shotgun/pump/shitty/sawn = 5,
				/obj/item/gun/projectile/warfare = 9,
				/obj/item/gun/projectile/warfare/kieji = 7,
				/obj/item/gun/energy/las/laspistol = 7,
				/obj/item/gun/projectile/mervex = 4,
				/obj/item/gun/projectile/necros = 3,
				/obj/item/gun/projectile/slugrevolver = 2,
				/obj/item/gun/projectile/talon/renegade = 1,
				/obj/item/gun/projectile/bolter_pistol = 1)

/obj/random/loot/lightlasgun
	name = "Light Lasgun" // After manor update we delete this.
	desc = "This is a weapon loot spawner with a high chance of spawning common light lasguns."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/lightlasgun/spawn_choices()
	return list(/obj/item/gun/energy/las/lasgun = 12,
				/obj/item/gun/energy/las/lasgun/rare = 6,
				/obj/item/gun/energy/las/lasgun/lucius = 9,
				/obj/item/gun/energy/las/lasgun/lucius/tinkered = 4,
				/obj/item/gun/energy/las/laspistol/militarum = 3,
				/obj/item/gun/energy/las/lasgun/tinkered = 2,
				/obj/item/gun/energy/las/lasgun/catachan = 4,
				/obj/item/gun/energy/las/lasgun/tinkered/catachan = 2)

/obj/random/loot/lasgunammo
	name = "Lasgun Ammo" 
	desc = "This is an ammo spawner that spawns ammo for lasguns."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"

/obj/random/loot/lasgunammo/spawn_choices()
	return list(/obj/item/cell/lasgun = 12,
				/obj/item/cell/lasgun/hotshot = 1)

/obj/random/loot/heavystubberammo
	name = "Heavy Stubber Ammo" // After manor update we delete this.
	desc = "This is an ammo spawner that spawns ammo for heavy stubbers."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"

/obj/random/loot/heavystubberammo/spawn_choices()
	return list(/obj/item/ammo_magazine/box/a556/mg08 = 10,
				/obj/item/ammo_magazine/box/a556/mg08 = 5)

/obj/random/loot/heavystubber
	name = "Heavy Stubber" // After manor update we delete this.
	desc = "This is a weapon loot spawner with a high chance of spawning common heavy stubbers."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/heavystubber/spawn_choices()
	return list(/obj/item/gun/projectile/automatic/stubber = 25,
				/obj/item/gun/projectile/automatic/stubber/villiers = 15)

// DUNGEON & PILGRIM LOOT. These spawners are generally low quality and have wide selection making them ideal as generic loot.

/obj/random/loot/randomammo
	name = "Random Ammo"
	desc = "This is a true RNG spawner that spawns any kind of ammo."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"

/obj/random/loot/randomammo/spawn_choices()
	return list(/obj/item/ammo_magazine/mc9mmt/machinepistol = 10,
	            /obj/item/ammo_magazine/bolt_rifle_magazine = 1,
				/obj/item/ammo_box/rifle = 9,
				/obj/item/ammo_magazine/box/a556/mg08 = 10,
				/obj/item/ammo_box/shotgun = 13,
				/obj/item/ammo_magazine/box/shotgun/slug = 3,
				/obj/item/cell/lasgun = 8,
				/obj/item/ammo_magazine/c44 = 5,
				/obj/item/ammo_magazine/box/shotgun/bean = 1,
				/obj/item/ammo_magazine/c45m/warfare = 8,
				/obj/item/ammo_magazine/c45m/warfare = 6,
				/obj/item/ammo_magazine/mc9mmt/machinepistol = 8,
				/obj/item/ammo_magazine/a357 = 2,
				/obj/item/ammo_magazine/bolt_pistol_magazine = 2)


/obj/random/loot/badweapon
	name = "Bad Weapon Spawner" // This spawner has no chance of spawning powerful weapons.
	desc = "This is a weapon loot spawner with a high chance of spawning mostly low quality weapon."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/badweapon/spawn_choices()
	return list(/obj/item/gun/projectile/shotgun/pump/shitty/sawn = 1,
				/obj/item/gun/projectile/warfare = 4,
				/obj/item/gun/projectile/warfare/kieji = 3,
				/obj/item/gun/projectile/warfare/kieji2 = 2,
				/obj/item/gun/energy/las/lasgun = 3,
				/obj/item/gun/energy/las/lasgun/lucius = 2,
				/obj/item/gun/energy/las/lasgun/catachan = 2,
				/obj/item/gun/energy/las/laspistol/militarum/lucius = 2,
				/obj/item/gun/energy/las/laspistol/militarum = 6,
				/obj/item/gun/energy/las/laspistol = 5,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty = 6,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter = 4,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered = 3,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester = 4,
				/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/glory = 1,
				/obj/item/gun/projectile/shotgun/pump/shitty = 4,
				/obj/item/gun/projectile/automatic/stubber = 3, 
				/obj/item/gun/projectile/automatic/stubber/villiers = 2,
				/obj/item/gun/projectile/automatic/stubber/cognis = 1,
				/obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle = 1,
				/obj/item/gun/projectile/automatic/m22/combatrifle = 1,
				/obj/item/gun/projectile/automatic/machinepistol = 4,
				/obj/item/gun/projectile/automatic/machinepistol/a80 = 3,
				/obj/item/gun/projectile/automatic/messina = 3,
				/obj/item/gun/projectile/automatic/autogun = 1,
				/obj/item/gun/projectile/automatic/autogrim = 2,
				/obj/item/gun/projectile/automatic/autogrim/krieg = 1,
				/obj/item/gun/projectile/revolver/mateba = 1,
				/obj/item/gun/projectile/mervex = 4,
				/obj/item/gun/projectile/necros = 3,
				/obj/item/gun/projectile/talon/renegade = 1,
				/obj/item/gun/projectile/slugrevolver = 2)

/obj/random/loot/goodweapon
	name = "Good Weapon Spawner" // This spawner is similar to the above but has better quality spawns.
	desc = "This is a weapon loot spawner with a small chance of spawning mostly high quality weapons."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/loot/goodweapon/spawn_choices()
	return list(/obj/item/gun/energy/las/lasgun/lucius/tinkered = 4,
				/obj/item/gun/energy/las/lasgun/rare = 3,
				/obj/item/gun/energy/las/lasgun/tinkered/catachan = 4,
				/obj/item/gun/energy/las/lasgun/tinkered = 2,
				/obj/item/gun/energy/las/lasgun/longlas = 2,
				/obj/item/gun/energy/las/lasgun/longlas/krieg = 1,
				/obj/item/gun/projectile/slugrevolver = 1,
				/obj/item/gun/projectile/revolver/mateba = 2,
				/obj/item/gun/projectile/lockebolter = 2,
				/obj/item/gun/energy/pulse/plasma/rifle = 1,
				/obj/item/gun/energy/pulse/plasma/pistol = 2,
				/obj/item/gun/projectile/automatic/stubber = 8,
				/obj/item/gun/projectile/bolter_pistol = 6)

/obj/random/loot/randomarmor
	name = "Random Armor"
	desc = "This is a loot spawner that spawns clothing, armor and gear."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/randomarmor/spawn_choices()
	return list(/obj/item/clothing/suit/armor/militia = 1,
				/obj/item/clothing/suit/cloak = 1,
				/obj/item/clothing/suit/armor/cuirass = 1,
				/obj/item/clothing/suit/armor/salvage = 1,
				/obj/item/clothing/suit/armor/guardsman/mercenary = 2,
				/obj/item/clothing/suit/armor/slanclothing/maleslan = 1,
				/obj/item/clothing/suit/armor/necromundaflak1 = 1,
				/obj/item/clothing/suit/armor/necromundacarapace1 = 1,
				/obj/item/clothing/suit/armor/ranger3 = 2,
				/obj/item/clothing/suit/armor/ranger2 = 2,
				/obj/item/clothing/head/helmet/salvage = 1,
				/obj/item/clothing/head/helmet/mining = 1,
				/obj/item/clothing/suit/armor/heavyflaksuit = 1,
				/obj/item/clothing/suit/armor/heavyduster = 1,
				/obj/item/clothing/suit/armor/flak1 = 1,
				/obj/item/clothing/suit/armor/flak2 = 1,
				/obj/item/clothing/suit/armor/scum2 = 1,
				/obj/item/clothing/suit/armor/leather = 1,
				/obj/item/clothing/suit/armor/hjacket = 1,
				/obj/item/clothing/suit/armor/hjacket2 = 1,
				/obj/item/clothing/suit/armor/slumcoat = 1,
				/obj/item/clothing/suit/armor/towntrench = 1,
				/obj/item/clothing/suit/armor/tduster = 1,
				/obj/item/clothing/suit/armor/armoredtrench = 1)

/obj/random/loot/randomsupply
	name = "Random Supply"
	desc = "This is a loot spawner that spawns supplies like medicine, food and materials."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

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

/obj/random/loot/randomitemcaves
	name = "Random Item Caves"
	desc = "This is a loot spawner that spawns random items."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/randomitemcaves/spawn_choices()
	return list(/obj/item/shovel = 2,
				/obj/item/clothing/glasses/night = 1,
				/obj/item/pickaxe = 2,
				/obj/item/storage/firstaid/combat = 1,
				/obj/item/storage/firstaid/surgery = 1,
				/obj/item/reagent_containers/hypospray/autoinjector/revive = 2,
				/obj/item/clothing/accessory/holster/waist = 3,
				/obj/item/clothing/accessory/storage/webbing = 4,
				/obj/item/stack/thrones2/ten = 1,
				/obj/item/grenade/frag/high_yield/homemade = 5,
				/obj/item/grenade/frag = 3,
				/obj/item/grenade/frag/high_yield/krak = 1)

/obj/random/loot/randomitemtown
	name = "Random Item Town"
	desc = "This is a loot spawner that spawns random items in town."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/randomitemtown/spawn_choices()
	return list(/obj/item/device/binoculars = 2,
				/obj/item/storage/box/ifak = 3,
				/obj/item/storage/firstaid/adv = 1,
				/obj/item/clothing/suit/armor/militia = 2,
				/obj/item/material/sword/combat_knife/rare = 4,
				/obj/item/melee/trench_axe = 1,
				/obj/item/stack/thrones2/ten = 1,
				/obj/item/clothing/accessory/holster/waist = 3,
				/obj/item/clothing/accessory/storage/webbing = 5,
				/obj/item/storage/belt/utility/full = 2,
				/obj/item/clothing/accessory/legguards = 3,
				/obj/item/clothing/accessory/armguards/ballistic = 2,
				/obj/item/grenade/frag/high_yield/homemade = 2)

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
	var/CHOICE = pick( /obj/item/clothing/head/pirate , /obj/item/clothing/mask/bandana/red)
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