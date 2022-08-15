#define DEFAULT_DROP_TIME 5 SECONDS

/datum/cargo_entry
	var/name // Name is displayed to user when spawning it, and using UI. Override.
	var/cost = 0
	var/item_path // What spawns when you purchase
	var/special = FALSE // Unique behaviour. Such as altering the map, but not spawning any specific item.
	var/category

/datum/cargo_entry/proc/purchase(var/obj/machinery/computer/planetarytrade/terminal)

	if(terminal.busy) //stops spam buying
		terminal.visible_message("<b>[terminal]</b> flashes an <span style='color:red'>error</span>, \"Busy.\"")
		return FALSE

	if(!terminal.drop_pads)
		terminal.visible_message("<b>[terminal]</b> flashes an <span style='color:red'>error</span>, \"Drop pads not found.\"")
		return FALSE

	if(terminal.balance < (cost + round(cost * GLOB.tax_rate)))
		terminal.visible_message("<b>[terminal]</b> flashes a <span style='color:red'>warning</span>, \"Your balance is too low..\"")
		return FALSE

	terminal.visible_message("<b>[terminal]</b> flashes a <span style='color:blue'>notice</span>, \"Your order has been confirmed. ETA: [DEFAULT_DROP_TIME / 10] Seconds.\"")
	terminal.balance -= (cost + round(cost * GLOB.tax_rate)) //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
	GLOB.thrones += round(cost * GLOB.tax_rate)
	terminal.busy = TRUE
	playsound(terminal, 'sound/effects/beam.ogg', 50, 0, -1)
	addtimer(CALLBACK(src, .proc/drop_purchase, terminal), DEFAULT_DROP_TIME)
	return TRUE

/datum/cargo_entry/proc/drop_purchase(var/obj/machinery/computer/planetarytrade/terminal)
	var/obj/effect/landmark/cargospawn/T = pick(terminal.drop_pads) //where dey spawning
	var/atom/dropping
	if(!special)
		dropping = new item_path(T.loc) //what they spawning
		dropping.visible_message("[dropping] falls onto the drop pad.")
		on_purchase(terminal, dropping)
	else
		special_purchase(terminal)
	terminal.busy = FALSE

/datum/cargo_entry/proc/on_purchase(var/obj/machinery/computer/planetarytrade/terminal, var/product) // Override for things that need to be done post-spawn. Like adding ammo.
	return

/datum/cargo_entry/proc/special_purchase(var/obj/machinery/computer/planetarytrade/terminal) // Ovveride for special items
	return

/datum/cargo_entry/medical
	category = "Medical"

/datum/cargo_entry/melee
	category = "Melee"

/datum/cargo_entry/weapon
	category = "Weapons"

/datum/cargo_entry/food
	category = "Foods"

/datum/cargo_entry/resource
	category = "Supplies"

/datum/cargo_entry/tool
	category = "Tools"

/datum/cargo_entry/misc
	category = "Misc"

/datum/cargo_entry/armor
	category = "Armours"

/datum/cargo_entry/bmarket
	category = "Black Market"

/datum/cargo_entry/misc/vatboy
	name = "Vat-Grown Human"
	cost = 80
	item_path = /obj/structure/closet/crate/vatgrownboy

/datum/cargo_entry/medical/ifak
	name = "Ifak Kit"
	cost = 10
	item_path = /obj/item/storage/box/ifak

/datum/cargo_entry/medical/akit
	name = "Advanced First-Aid Kit"
	cost = 19
	item_path = /obj/item/storage/firstaid/adv

/datum/cargo_entry/medical/mbelt
	name = "Medical Belt"
	cost = 30
	item_path = /obj/item/storage/belt/medical/full

/datum/cargo_entry/medical/ckit
	name = "Combat First-Aid Kit"
	cost = 40
	item_path = /obj/item/storage/firstaid/combat

/datum/cargo_entry/medical/skit
	name = "Surgery Kit"
	cost = 25
	item_path = /obj/item/storage/firstaid/surgery

/datum/cargo_entry/medical/ac
	name = "Ateopoine"
	cost = 28
	item_path = /obj/structure/closet/crate/ateopoine

/datum/cargo_entry/food/meat
	name = "Meat Crate"
	cost = 50
	item_path = /obj/structure/closet/crate/meat

/datum/cargo_entry/misc/smokes
	name = "Cigarette Crate"
	cost = 10
	item_path = /obj/item/storage/fancy/cigarettes/dromedaryco

/datum/cargo_entry/armor/gasmask
	name = "Gas Mask"
	cost = 5
	item_path = /obj/item/clothing/mask/gas/security

/datum/cargo_entry/armor/webbing
	name = "Webbing"
	cost = 5
	item_path = /obj/item/clothing/accessory/storage/webbing

/datum/cargo_entry/armor/holster
	name = "Holster"
	cost = 15
	item_path = /obj/item/clothing/accessory/holster/waist

/datum/cargo_entry/armor/armorcoat
	name = "Armored Coat"
	cost = 34
	item_path = /obj/item/clothing/suit/armor/militia

/datum/cargo_entry/armor/armorcoat
	name = "Armored Cloak"
	cost = 37
	item_path = /obj/item/clothing/suit/cloak

/datum/cargo_entry/armor/armorcoat
	name = "Explorator Armor"
	cost = 41
	item_path = /obj/item/clothing/suit/armor/explorer

/datum/cargo_entry/armor/voidsuit
	name = "Void Suit"
	cost = 45
	item_path = /obj/item/clothing/suit/space/void/engineering/salvage

/datum/cargo_entry/armor/voidsuit
	name = "Void Suit Helmet"
	cost = 15
	item_path = /obj/item/clothing/head/helmet/space/void/engineering/salvage

/datum/cargo_entry/armor/voidsuit
	name = "Armored Void Suit"
	cost = 95
	item_path = /obj/item/clothing/suit/space/void/engineering/salvage

/datum/cargo_entry/armor/voidsuit
	name = "Armored Void Suit Helmet"
	cost = 65
	item_path = /obj/item/clothing/head/helmet/space/void/engineering/alt

/datum/cargo_entry/armor/helmet
	name = "Guard Flak Helmet"
	cost = 15
	item_path = /obj/item/clothing/head/helmet/guardhelmet

/datum/cargo_entry/armor/garmor
	name = "Guard Flak Armor"
	cost = 50
	item_path = /obj/item/clothing/suit/armor/guardsman

/datum/cargo_entry/armor/mercflak
	name = "Mercenary Flak Armor"
	cost = 45
	item_path = /obj/item/clothing/suit/armor/guardsman/mercenary

/datum/cargo_entry/armor/cara
	name = "Guard Carapace Armor"
	cost = 110
	item_path = /obj/item/clothing/suit/armor/guardsman/carapace

/datum/cargo_entry/armor/mercspace
	name = "Mercenary Carapace Armor"
	cost = 100
	item_path = /obj/item/clothing/suit/armor/guardsman/mercenary/carapace

/datum/cargo_entry/armor/heavycombatarmor
	name = "Heavy Combat Armor"
	cost = 115
	item_path = /obj/item/clothing/suit/storage/vest/merc

/datum/cargo_entry/armor/belt
	name = "Ammo Belt"
	cost = 5
	item_path = /obj/item/storage/belt/warfare

/datum/cargo_entry/armor/nvg
	name = "Night Vision Visor"
	cost = 50
	item_path = /obj/item/clothing/glasses/night

/datum/cargo_entry/armor/val
	name = "Valhallan Equipment Crate"
	cost = 45
	item_path = /obj/structure/closet/crate/valhallan

/datum/cargo_entry/armor/krieg
	name = "Krieg Equipment Crate"
	cost = 45
	item_path = /obj/structure/closet/crate/krieg

/datum/cargo_entry/armor/excr
	name = "Extended Operations Crate"
	cost = 70
	item_path = /obj/structure/closet/crate/operations

/datum/cargo_entry/melee/baton
	name = "Riot Shield"
	cost = 25
	item_path = /obj/item/shield/riot

/datum/cargo_entry/melee/baton
	name = "Heavy Baton"
	cost = 10
	item_path = /obj/item/melee/baton

/datum/cargo_entry/melee/ckniferare
	name = "Rare Combat Knife"
	cost = 25
	item_path = /obj/item/material/sword/combat_knife/rare

/datum/cargo_entry/melee/ckniferare
	name = "Catachan Knife"
	cost = 110
	item_path = /obj/item/material/sword/combat_knife/catachan

/datum/cargo_entry/melee/machete
	name = "Machete"
	cost = 15
	item_path = /obj/item/material/sword/machete

/datum/cargo_entry/melee/ironsword
	name = "Iron Sword"
	cost = 49
	item_path = /obj/item/toy/katana

/datum/cargo_entry/melee/saber
	name = "Masterwork Saber"
	cost = 50
	item_path = /obj/item/material/sword/sabre

/datum/cargo_entry/melee/saber2
	name = "Officer's Saber"
	cost = 55
	item_path = /obj/item/material/sword/commissword/sabre

/datum/cargo_entry/melee/noblesword
	name = "Noble Sword"
	cost = 60
	item_path = /obj/item/toy/katana/strong

/datum/cargo_entry/melee/mercy
	name = "Mercy Chainsword"
	cost = 84
	item_path = /obj/item/melee/chain/mercycs

/datum/cargo_entry/melee/drusian
	name = "Drusian Chainsword"
	cost = 90
	item_path = /obj/item/melee/chain/inqcs

/datum/cargo_entry/melee/powersword
	name = "Power Blade"
	cost = 120
	item_path = /obj/item/melee/energy/powersword

/datum/cargo_entry/weapon/lasgun
	name = "Kantrael Lasgun"
	cost = 70
	item_path = /obj/item/gun/energy/las/lasgun

/datum/cargo_entry/weapon/mlasgun
	name = "Masterwork Kantrael Lasgun"
	cost = 85
	item_path = /obj/item/gun/energy/las/lasgun/rare

/datum/cargo_entry/weapon/lasguntinker
	name = "Tinkered Kantrael Lasgun"
	cost = 80
	item_path = /obj/item/gun/energy/las/lasgun/tinkered

/datum/cargo_entry/weapon/luclas
	name = "Lucius Lasgun"
	cost = 80
	item_path = /obj/item/gun/energy/las/lasgun/lucius

/datum/cargo_entry/weapon/luclastinker
	name = "Tinkered Lucius Lasgun"
	cost = 90
	item_path = /obj/item/gun/energy/las/lasgun/lucius/tinkered

/datum/cargo_entry/weapon/catbine
	name = "Catachan Carbine"
	cost = 90
	item_path = /obj/item/gun/energy/las/lasgun/catachan

/datum/cargo_entry/weapon/catbinetinker
	name = "Tinkered Catachan Carbine"
	cost = 100
	item_path = /obj/item/gun/energy/las/lasgun/tinkered/catachan

/datum/cargo_entry/weapon/longlas
	name = "M35 Longlas"
	cost = 170
	item_path = /obj/item/gun/energy/las/lasgun/longlas

/datum/cargo_entry/weapon/hotshot
	name = "Ryza Pattern Hot-Shot Lasgun"
	cost = 240
	item_path = /obj/item/gun/energy/las/hotshot

/datum/cargo_entry/weapon/stubrifle
	name = "Stub Rifle"
	cost = 33
	item_path = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty

/datum/cargo_entry/weapon/stubriflescoped
	name = "Scoped Stub Rifle"
	cost = 39
	item_path = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter

/datum/cargo_entry/weapon/leverrifle
	name = "Lever Stub Rifle"
	cost = 36
	item_path = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester

/datum/cargo_entry/weapon/triangong
	name = "Triangong Stub Rifle"
	cost = 41
	item_path = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered

/datum/cargo_entry/weapon/sniperrifle
	name = "Lp338 Sniper Rifle"
	cost = 73
	item_path = /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338

/datum/cargo_entry/weapon/sniperrifle
	name = "Heavy Sniper Rifle"
	cost = 99
	item_path = /obj/item/gun/projectile/heavysniper

/datum/cargo_entry/weapon/shotgun
	name = "Voxlegis Shotgun"
	cost = 37
	item_path = /obj/item/gun/projectile/shotgun/pump/shitty

/datum/cargo_entry/weapon/shotgunsawn
	name = "Sawn-off Shotgun"
	cost = 33
	item_path = /obj/item/gun/projectile/shotgun/pump/shitty/sawn

/datum/cargo_entry/weapon/shotgunmagrave
	name = "Belle Magrave Shotgun"
	cost = 43
	item_path = /obj/item/gun/projectile/shotgun/pump/shitty/magrave

/datum/cargo_entry/weapon/mk22
	name = "Mk22 Autogun"
	cost = 41
	item_path = /obj/item/gun/projectile/automatic/machinepistol

/datum/cargo_entry/weapon/a80
	name = "Nachtwey Autogun"
	cost = 53
	item_path = /obj/item/gun/projectile/automatic/machinepistol/a80

/datum/cargo_entry/weapon/stubbervilliers
	name = "Villiers Heavy Stubber"
	cost = 54
	item_path = /obj/item/gun/projectile/automatic/stubber/villiers

/datum/cargo_entry/weapon/stubbervraks
	name = "Vraks Heavy Stubber"
	cost = 60
	item_path = /obj/item/gun/projectile/automatic/stubber

/datum/cargo_entry/weapon/lockebolter
	name = "Locke Bolter"
	cost = 230
	item_path = /obj/item/gun/projectile/lockebolter

/datum/cargo_entry/weapon/plasmapistol
	name = "Plasma Pistol"
	cost = 99
	item_path = /obj/item/gun/energy/pulse/plasma/pistol

/datum/cargo_entry/weapon/plasmarifle
	name = "Plasma Rifle"
	cost = 179
	item_path = /obj/item/gun/energy/pulse/plasma/rifle

/datum/cargo_entry/weapon/meltarifle
	name = "Melta Rifle"
	cost = 239
	item_path = /obj/item/gun/projectile/meltagun

/datum/cargo_entry/weapon/flamer
	name = "Hand Flamer"
	cost = 100
	item_path = /obj/item/gun/projectile/automatic/flamer/handflamer

/datum/cargo_entry/weapon/cadlaspistol
	name = "Cadian Laspistol"
	cost = 53
	item_path = /obj/item/gun/energy/las/laspistol/militarum

/datum/cargo_entry/weapon/luclaspistol
	name = "Lucius Laspistol"
	cost = 59
	item_path = /obj/item/gun/energy/las/laspistol/militarum/lucius

/datum/cargo_entry/weapon/vilpistol
	name = "Villiers Pistol"
	cost = 31
	item_path = /obj/item/gun/projectile/warfare

/datum/cargo_entry/weapon/renpistol
	name = "Kieji Pistol"
	cost = 39
	item_path = /obj/item/gun/projectile/warfare/kieji

/datum/cargo_entry/weapon/mervexrevolver
	name = "Mervex Revolver"
	cost = 47
	item_path = /obj/item/gun/projectile/mervex

/datum/cargo_entry/weapon/necrevolver
	name = "Necros Revolver"
	cost = 49
	item_path = /obj/item/gun/projectile/necros

/datum/cargo_entry/weapon/slugrevolver
	name = "Masterwork Revolver"
	cost = 55
	item_path = /obj/item/gun/projectile/necros

/datum/cargo_entry/weapon/mateba
	name = "Mateba Revolver"
	cost = 65
	item_path = /obj/item/gun/projectile/revolver/mateba

/datum/cargo_entry/weapon/reng
	name = "Renegade Pistol"
	cost = 51
	item_path = /obj/item/gun/projectile/talon/renegade

/datum/cargo_entry/weapon/bolterpistol
	name = "Bolter Pistol"
	cost = 58
	item_path = /obj/item/gun/projectile/bolter_pistol

/datum/cargo_entry/weapon/bolterpistoldrusian
	name = "Upgraded Bolter Pistol"
	cost = 78
	item_path = /obj/item/gun/projectile/bolter_pistol/inquis

/datum/cargo_entry/weapon/smg
	name = "Autogun Magazine"
	cost = 5
	item_path = /obj/item/ammo_magazine/mc9mmt/machinepistol

/datum/cargo_entry/weapon/stubberammo //???
	name = "Auto Stubber Magazine"
	cost = 9
	item_path = /obj/item/ammo_magazine/box/a556/mg08

/datum/cargo_entry/weapon/shellbox
	name = "Shotgun Shell Box"
	cost = 5
	item_path = /obj/item/ammo_box/shotgun

/datum/cargo_entry/weapon/slugbox
	name = "Shotgun Slug Box"
	cost = 8
	item_path = /obj/item/ammo_magazine/box/shotgun/slug

/datum/cargo_entry/weapon/riflemag
	name = "Rifle Handful"
	cost = 3
	item_path = /obj/item/ammo_magazine/handful/brifle_handful

/datum/cargo_entry/weapon/riflemag
	name = "Rifle Magazine"
	cost = 4
	item_path = /obj/item/ammo_magazine/brifle

/datum/cargo_entry/weapon/meltamag
	name = "Melta Ammo"
	cost = 12
	item_path = /obj/item/ammo_magazine/melta

/datum/cargo_entry/weapon/heavysnipammo
	name = "Heavy Sniper Ammo"
	cost = 12
	item_path = /obj/item/storage/box/sniperammo

/datum/cargo_entry/weapon/heavysnipammoap
	name = "Heavy Sniper Ammo(AP)"
	cost = 20
	item_path = /obj/item/storage/box/sniperammo/apds

/datum/cargo_entry/weapon/lp338mag
	name = "Lp338 Sniper Magazine"
	cost = 8
	item_path = /obj/item/ammo_magazine/lp338

/datum/cargo_entry/weapon/lp338needler
	name = "Lp338 Sniper Needler Magazine"
	cost = 15
	item_path = /obj/item/ammo_magazine/lp338/needler

/datum/cargo_entry/weapon/boltpistolmag
	name = "Bolt Pistol Magazine"
	cost = 10
	item_path = /obj/item/ammo_magazine/bolt_pistol_magazine

/datum/cargo_entry/weapon/boltpistolmagkp
	name = "Penetrator Bolt Pistol Magazine"
	cost = 20
	item_path = /obj/item/ammo_magazine/bolt_pistol_magazine/kp

/datum/cargo_entry/weapon/boltermag
	name = "Bolter Magazine"
	cost = 30
	item_path = /obj/item/ammo_magazine/bolt_rifle_magazine

/datum/cargo_entry/weapon/boltermagkp
	name = "Penetrator Bolter Magazine"
	cost = 50
	item_path = /obj/item/ammo_magazine/bolt_rifle_magazine/kp

/datum/cargo_entry/weapon/lasmag
	name = "Lasgun Power Pack"
	cost = 10
	item_path = /obj/item/cell/lasgun

/datum/cargo_entry/weapon/revolverammo
	name = ".357 Speedloader"
	cost = 5
	item_path = /obj/item/ammo_magazine/a357

/datum/cargo_entry/weapon/revolverammo
	name = ".44 Speedloader"
	cost = 5
	item_path = /obj/item/ammo_magazine/c44

/datum/cargo_entry/weapon/revolverammo
	name = ".50 Speedloader"
	cost = 5
	item_path = /obj/item/ammo_magazine/c50

/datum/cargo_entry/weapon/heatshell
	name = "Vraks Pattern Rocket"
	cost = 25
	item_path = /obj/item/ammo_casing/heat_shell

/datum/cargo_entry/weapon/fragg
	name = "Fragmentation Grenade"
	cost = 23
	item_path = /obj/item/grenade/frag/warfare

/datum/cargo_entry/weapon/incing
	name = "Incinedary Grenade"
	cost = 26
	item_path = /obj/item/grenade/fire

/datum/cargo_entry/weapon/krak
	name = "Krak"
	cost = 30
	item_path = /obj/item/grenade/frag/high_yield/krak

/datum/cargo_entry/misc/landmine
	name = "Landmine"
	cost = 33
	item_path = /obj/item/landmine

/datum/cargo_entry/misc/pexplosives
	name = "Plastic Explosives"
	cost = 25
	item_path = /obj/item/plastique

/datum/cargo_entry/tool/lighter
	name = "Zippo Lighter"
	cost = 3
	item_path = /obj/item/flame/lighter/zippo

/datum/cargo_entry/food/cheapamasec
	name = "Cheap Amasec"
	cost = 3
	item_path = /obj/item/reagent_containers/food/drinks/bottle/amasecpoor

/datum/cargo_entry/food/expenamasec
	name = "Expensive Amasec"
	cost = 8
	item_path = /obj/item/reagent_containers/food/drinks/bottle/amasecexpensive

/datum/cargo_entry/food/ea1
	name = "Caddis Mourning Collection"
	cost = 16
	name = /obj/item/reagent_containers/food/drinks/bottle/caddis/extra

/datum/cargo_entry/food/ea2
	name = "Caddis Golden Tokay"
	cost = 32
	item_path = /obj/item/reagent_containers/food/drinks/bottle/caddis/elite

/datum/cargo_entry/food/ea3
	name = "Caddis Catalina Malvasia"
	cost = 51
	item_path = /obj/item/reagent_containers/food/drinks/bottle/caddis/supreme

/datum/cargo_entry/resource/bwire
	name = "Barbed Wire"
	cost = 15
	item_path = /obj/item/stack/barbwire

/datum/cargo_entry/tool/shovel
	name = "Shovel"
	cost = 5
	item_path = /obj/item/shovel

/datum/cargo_entry/misc/miningcr
	name = "Miner Equipment Crate"
	cost = 70
	item_path = /obj/structure/closet/crate/miner

/datum/cargo_entry/misc/miningcrate
	name = "Mining Crate"
	cost = 15
	item_path = /obj/structure/closet/crate/miningcrate

/datum/cargo_entry/resource/silver
	name = "10 Silver"
	cost = 50
	item_path = /obj/item/stack/material/silver/ten

/datum/cargo_entry/resource/gold
	name = "10 Gold"
	cost = 100
	item_path = /obj/item/stack/material/gold/ten

/datum/cargo_entry/resource/diamond
	name = "10 Diamonds"
	cost = 200
	item_path = /obj/item/stack/material/diamond/ten

/datum/cargo_entry/resource/plasteel
	name = "10 Plasteel"
	cost = 50
	item_path = /obj/item/stack/material/plasteel/ten

/datum/cargo_entry/resource/phoron
	name = "10 Phoron"
	cost = 50
	item_path = /obj/item/stack/material/phoron/ten

/datum/cargo_entry/resource/cloth
	name = "50 Cloth"
	cost = 20
	item_path = /obj/item/stack/material/cloth/fifty

/datum/cargo_entry/resource/glass
	name = "50 Glass Sheets"
	cost = 10
	item_path = /obj/item/stack/material/glass/fifty

/datum/cargo_entry/resource/steel
	name = "50 Metal Sheets"
	cost = 15
	item_path = /obj/item/stack/material/steel/fifty

// BLACK MARKET ITEMS BELOW.

/datum/cargo_entry/bmarket/taupistol
	name = "T*u Pulse Pistol"
	cost = 89
	item_path = /obj/item/gun/energy/pulse/pulsepistol

/datum/cargo_entry/bmarket/taurifle
	name = "T*u Pulse Rifle"
	cost = 159
	item_path = /obj/item/gun/energy/pulse/pulserifle

/datum/cargo_entry/bmarket/krootrifle
	name = "Kr**t Rifle"
	cost = 99
	item_path = /obj/item/gun/projectile/shotgun/pump/boltaction/krootrifle

/datum/cargo_entry/bmarket/shoota
	name = "Ork Shoota"
	cost = 37
	item_path = /obj/item/gun/projectile/ork/automatic/shoota

/datum/cargo_entry/bmarket/ritualknife
	name = "Ritual Knife"
	cost = 59
	item_path = /obj/item/material/sword/skinning_knife

/datum/cargo_entry/bmarket/chaosknife
	name = "Ch**s Knife"
	cost = 55
	item_path = /obj/item/material/sword/chaosknife

/datum/cargo_entry/bmarket/slaaneshknife
	name = "Sla**sh Knife"
	cost = 56
	item_path = /obj/item/material/sword/chaosknife

/datum/cargo_entry/bmarket/slaaneshsword
	name = "Sla**sh Blade"
	cost = 140
	item_path = /obj/item/material/sword/slaanesh

/datum/cargo_entry/bmarket/hellblade
	name = "H*ll Blade"
	cost = 290
	item_path = /obj/item/material/sword/hellblade

/datum/cargo_entry/bmarket/hellblade
	name = "D**mon Blade"
	cost = 310
	item_path = /obj/item/material/sword/demon

/datum/cargo_entry/bmarket/magushelm
	name = "Magus Helm"
	cost = 40
	item_path = /obj/item/clothing/head/culthood/magus

/datum/cargo_entry/bmarket/magusrobes
	name = "Magus Robes"
	cost = 110
	item_path = /obj/item/clothing/suit/cultrobes/magusred

/datum/cargo_entry/bmarket/batterer
	name = "Xenos Metal Foam Grenade"
	cost = 31
	item_path = /obj/item/grenade/chem_grenade/metalfoam

/datum/cargo_entry/bmarket/batterer
	name = "Xenos Taser"
	cost = 79
	item_path = /obj/item/gun/energy/taser

/datum/cargo_entry/bmarket/freedomimplant
	name = "Freedom Implant Box"
	cost = 100
	item_path = /obj/item/storage/box/syndie_kit/imp_freedom

/datum/cargo_entry/bmarket/freedomimplant
	name = "Compression Implant Box"
	cost = 100
	item_path = /obj/item/storage/box/syndie_kit/imp_compress

/datum/cargo_entry/bmarket/freedomimplant
	name = "Explosive Implant Box"
	cost = 200
	item_path = /obj/item/storage/box/syndie_kit/imp_explosive

/datum/cargo_entry/bmarket/batterer
	name = "Mind Batterer"
	cost = 400
	item_path = /obj/item/device/batterer

#undef DEFAULT_DROP_TIME