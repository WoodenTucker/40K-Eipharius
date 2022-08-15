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

/datum/cargo_entry/medical/ifak
	name = "Ifak Kit"
	cost = 8
	item_path = /obj/item/storage/box/ifak

/datum/cargo_entry/medical/akit
	name = "Advanced First-Aid Kit"
	cost = 15
	item_path = /obj/item/storage/firstaid/adv

/datum/cargo_entry/medical/skit
	name = "Surgery Kit"
	cost = 25
	item_path = /obj/item/storage/firstaid/surgery

/datum/cargo_entry/medical/ac
	name = "Ateopoine"
	cost = 25
	item_path = /obj/structure/closet/crate/ateopoine

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
	cost = 30
	name = "/obj/item/reagent_containers/food/drinks/bottle/caddis/extra"

/datum/cargo_entry/food/ea2
	name = "Caddis Golden Tokay"
	cost = 45
	item_path = /obj/item/reagent_containers/food/drinks/bottle/caddis/elite
/datum/cargo_entry/food/ea3
	name = "Caddis Catalina Malvasia"
	cost = 60
	item_path = /obj/item/reagent_containers/food/drinks/bottle/caddis/supreme

/datum/cargo_entry/medical/mbelt
	name = "Medical Belt"
	cost = 20
	item_path = /obj/item/storage/belt/medical/full

/datum/cargo_entry/medical/ckit
	name = "Combat First-Aid Kit"
	cost = 25
	item_path = /obj/item/storage/firstaid/combat

/datum/cargo_entry/weapon/fragg
	name = "Fragmentation Grenade"
	cost = 15
	item_path = /obj/item/grenade/frag/warfare

/datum/cargo_entry/weapon/incing
	name = "Incinedary Grenade"
	cost = 20
	item_path = /obj/item/grenade/fire

/datum/cargo_entry/resource/silver
	name = "10 Silver"
	cost = 100
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
	cost = 100
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
	cost = 25
	item_path = /obj/item/stack/material/steel/fifty

/datum/cargo_entry/resource/bwire
	name = "Barbed Wire"
	cost = 15
	item_path = /obj/item/stack/barbwire

/datum/cargo_entry/tool/shovel
	name = "Shovel"
	cost = 5
	item_path = /obj/item/shovel

/datum/cargo_entry/weapon/saber
	name = "Saber"
	cost = 15
	item_path = /obj/item/material/sword/commissword/sabre

/datum/cargo_entry/food/meat
	name = "Meat Crate"
	cost = 50
	item_path = /obj/structure/closet/crate/meat

/datum/cargo_entry/misc/smokes
	name = "Cigarette Crate"
	cost = 10
	item_path = /obj/item/storage/fancy/cigarettes/dromedaryco

/datum/cargo_entry/weapon/shellbox
	name = "Shotgun Shell Box"
	cost = 5
	item_path = /obj/item/ammo_box/shotgun

/datum/cargo_entry/weapon/riflemag
	name = "Rifle Magazine"
	cost = 5
	item_path = /obj/item/ammo_magazine/brifle

/datum/cargo_entry/weapon/boltermag
	name = "Bolter Magazine"
	cost = 5
	item_path = /obj/item/ammo_magazine/bolt_pistol_magazine

/datum/cargo_entry/weapon/bolter
	name = "Bolter"
	cost = 50
	item_path = /obj/item/gun/projectile/bolter_pistol

/datum/cargo_entry/armor/gasmask
	name = "Gas Mask"
	cost = 5
	item_path = /obj/item/clothing/mask/gas/security

/datum/cargo_entry/armor/helmet
	name = "Flak Helmet"
	cost = 10
	item_path = /obj/item/clothing/head/helmet/guardhelmet

/datum/cargo_entry/armor/garmor
	name = "Flak Armor"
	cost = 30
	item_path = /obj/item/clothing/suit/armor/guardsman

/datum/cargo_entry/armor/nvg
	name = "Night Vision Visor"
	cost = 35
	item_path = /obj/item/clothing/glasses/night

/datum/cargo_entry/armor/val
	name = "Valhallan Equipment Crate"
	cost = 45
	item_path = /obj/structure/closet/crate/valhallan

/datum/cargo_entry/armor/krieg
	name = "Krieg Equipment Crate"
	cost = 45
	item_path = /obj/structure/closet/crate/krieg

/datum/cargo_entry/armor/excr //???
	name = "Extended Operations Crate"
	cost = 70
	item_path = /obj/structure/closet/crate/operations

/datum/cargo_entry/misc/miningcr
	name = "Miner Equipment Crate"
	cost = 80
	item_path = /obj/structure/closet/crate/miner

/datum/cargo_entry/weapon/lasgun
	name = "Kantrael Lasgun"
	cost = 25
	item_path = /obj/item/gun/energy/las/lasgun

/datum/cargo_entry/weapon/laspistol
	name = "Laspistol"
	cost = 15
	item_path = /obj/item/gun/energy/las/laspistol

/datum/cargo_entry/weapon/grim //???
	name = "GRIM Autogun"
	cost = 25
	item_path = /obj/item/gun/projectile/automatic/autogrim

/datum/cargo_entry/weapon/grimammo
	name = "GRIM Autogun Magazine"
	cost = 5
	item_path = /obj/item/ammo_magazine/autogrim

/datum/cargo_entry/weapon/smg
	name = "Autogun Magazine"
	cost = 4
	item_path = /obj/item/ammo_magazine/mc9mmt/machinepistol

/datum/cargo_entry/weapon/stubber
	name = "Stubber"
	cost = 25
	item_path = /obj/item/gun/projectile/automatic/stubber

/datum/cargo_entry/weapon/stubberammo //???
	name = "Auto Stubber Magazine"
	cost = 7
	item_path = /obj/item/ammo_magazine/box/a556/mg08

/datum/cargo_entry/weapon/krak
	name = "Krak"
	cost = 20
	item_path = /obj/item/grenade/frag/high_yield/krak

/datum/cargo_entry/misc/vatboy
	name = "Vat-Grown Human"
	cost = 80
	item_path = /obj/structure/closet/crate/vatgrownboy

/datum/cargo_entry/tool/lighter
	name = "Zippo Lighter"
	cost = 3
	item_path = /obj/item/flame/lighter/zippo

/datum/cargo_entry/misc/miningcrate
	name = "Mining Crate"
	cost = 15
	item_path = /obj/structure/closet/crate/miningcrate

/datum/cargo_entry/misc/landmine
	name = "Landmine"
	cost = 35
	item_path = /obj/item/landmine

/datum/cargo_entry/armor/cara
	name = "Guard Carapace Armor"
	cost = 70
	item_path = /obj/item/clothing/suit/armor/guardsman/carapace

/datum/cargo_entry/armor/mercspace
	name = "Mercenary Carapace Armor"
	cost = 75
	item_path = /obj/item/clothing/suit/armor/guardsman/mercenary/carapace

/datum/cargo_entry/armor/cara
	name = "Carapace Vest"
	cost = 50
	item_path = /obj/item/clothing/accessory/storage/torso/armor

/datum/cargo_entry/armor/belt
	name = "Ammo Belt"
	cost = 5
	item_path = /obj/item/storage/belt/warfare

/datum/cargo_entry/weapon/reng
	name = "Renegade Pistol"
	cost = 40
	item_path = /obj/item/gun/projectile/talon/renegade

/datum/cargo_entry/weapon/a80
	name = "A80 Autogun"
	cost = 40
	item_path = /obj/item/gun/projectile/automatic/machinepistol/a80

/datum/cargo_entry/weapon/renpistol
	name = "Kieji Pistol"
	cost = 30
	item_path = /obj/item/gun/projectile/warfare/kieji

/datum/cargo_entry/weapon/necvolver
	name = "Slug Revolver"
	cost = 45
	item_path = /obj/item/gun/projectile/necros

/datum/cargo_entry/weapon/revolverammo
	name = "Revolver Ammo"
	cost = 5
	item_path = /obj/item/ammo_magazine/c44

/datum/cargo_entry/weapon/luclas
	name = "Lucius Lasgun"
	cost = 50
	item_path = /obj/item/gun/energy/las/lasgun/lucius

/datum/cargo_entry/weapon/catbine
	name = "Catachan Carbine"
	cost = 55
	item_path = /obj/item/gun/energy/las/lasgun/catachan

/datum/cargo_entry/weapon/recshell
	name = "Recoiless Shell Box"
	cost = 4
	item_path = /obj/item/ammo_casing/heat_shell

/datum/cargo_entry/weapon/msword
	name = "Mercy Chainsword"
	cost = 75
	item_path = /obj/item/ammo_casing/heat_shell ///obj/item/melee/chain/mercycs

#undef DEFAULT_DROP_TIME