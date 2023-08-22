obj/structure/closet/crate
	name = "crate"
	desc = "A rectangular steel crate."
	icon = 'icons/obj/storage.dmi'
	icon_state = "cgold"
	icon_opened = "cgoldopen"
	icon_closed = "cgold"
	open_sound = 'sound/effects/locker_open.ogg'
	close_sound = 'sound/effects/locker_close.ogg'
	atom_flags = ATOM_FLAG_CLIMBABLE
	setup = 0

	storage_types = CLOSET_STORAGE_ITEMS

	var/points_per_crate = 5
	var/rigged = 0

/obj/structure/closet/crate/open()
	if((atom_flags & ATOM_FLAG_OPEN_CONTAINER) && !opened && can_open())
		object_shaken()
	. = ..()
	if(.)
		if(rigged)
			visible_message("<span class='danger'>There are wires attached to the lid of [src]...</span>")
			for(var/obj/item/device/assembly_holder/H in src)
				H.process_activation(usr)
			for(var/obj/item/device/assembly/A in src)
				A.activate()

/obj/structure/closet/crate/examine(mob/user)
	..()
	if(rigged && opened)
		var/list/devices = list()
		for(var/obj/item/device/assembly_holder/H in src)
			devices += H
		for(var/obj/item/device/assembly/A in src)
			devices += A
		to_chat(user,"There are some wires attached to the lid, connected to [english_list(devices)].")

/obj/structure/closet/crate/attackby(obj/item/W as obj, mob/user as mob)
	if(opened)
		return ..()
	else if(istype(W, /obj/item/packageWrap))
		return
	else if(istype(W, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/C = W
		if(rigged)
			to_chat(user, "<span class='notice'>[src] is already rigged!</span>")
			return
		if (C.use(1))
			to_chat(user, "<span class='notice'>You rig [src].</span>")
			rigged = 1
			return
	else if(istype(W, /obj/item/device/assembly_holder) || istype(W, /obj/item/device/assembly))
		if(rigged)
			to_chat(user, "<span class='notice'>You attach [W] to [src].</span>")
			user.drop_item()
			W.forceMove(src)
			return
	else if(isWirecutter(W))
		if(rigged)
			to_chat(user, "<span class='notice'>You cut away the wiring.</span>")
			playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
			rigged = 0
			return
	else
		return ..()

/obj/structure/closet/crate/secure
	desc = "A secure crate."
	name = "Secure crate"
	icon_state = "dgold"
	icon_opened = "dgoldeopen"
	icon_closed = "dgold"
	var/redlight = "securecrater"
	var/greenlight = "securecrateg"
	var/sparks = "securecratesparks"
	var/emag = "securecrateemag"

	setup = CLOSET_HAS_LOCK
	locked = TRUE

/obj/structure/closet/crate/secure/Initialize()
	. = ..()
	update_icon()

/obj/structure/closet/crate/secure/update_icon()
	..()
	if(broken)
		overlays += emag
	else if(locked)
		overlays += redlight
	else
		overlays += greenlight

/obj/structure/closet/crate/plastic
	name = "plastic crate"
	desc = "A rectangular plastic crate."
	icon_state = "plasticcrate"
	icon_opened = "plasticcrateopen"
	icon_closed = "plasticcrate"
	points_per_crate = 1

/obj/structure/closet/crate/internals
	name = "internals crate"
	desc = "A internals crate."
	icon_state = "o2crate"
	icon_opened = "o2crateopen"
	icon_closed = "o2crate"

/obj/structure/closet/crate/internals/fuel
	name = "\improper Fuel tank crate"
	desc = "A fuel tank crate."

/obj/structure/closet/crate/internals/fuel/WillContain()
	return list(/obj/item/tank/hydrogen = 4)

/obj/structure/closet/crate/trashcart
	name = "trash cart"
	desc = "A heavy, metal trashcart with wheels."
	icon_state = "trashcart"
	icon_opened = "trashcartopen"
	icon_closed = "trashcart"

/obj/structure/closet/crate/medical
	name = "medical crate"
	desc = "A medical crate."
	icon_state = "ecrate"
	icon_opened = "ecrateopen"
	icon_closed = "ecrate"

/obj/structure/closet/crate/rcd
	name = "\improper RCD crate"
	desc = "A crate with rapid construction device."
	icon_state = "crate"
	icon_opened = "crateopen"
	icon_closed = "crate"

/obj/structure/closet/crate/rcd/WillContain()
	return list(
		/obj/item/rcd_ammo = 3,
		/obj/item/rcd
	)

/obj/structure/closet/crate/solar
	name = "solar pack crate"

/obj/structure/closet/crate/solar/WillContain()
	return list(
		/obj/item/solar_assembly = 14,
		/obj/item/circuitboard/solar_control,
		/obj/item/tracker_electronics,
		/obj/item/paper/solar
	)

/obj/structure/closet/crate/solar_assembly
	name = "solar assembly crate"

/obj/structure/closet/crate/solar_assembly/WillContain()
	return list(/obj/item/solar_assembly = 16)

/obj/structure/closet/crate/freezer
	name = "freezer"
	desc = "A freezer."
	icon_state = "freezer"
	icon_opened = "freezeropen"
	icon_closed = "freezer"
	var/target_temp = T0C - 40
	var/cooling_power = 40

	return_air()
		var/datum/gas_mixture/gas = (..())
		if(!gas)	return null
		var/datum/gas_mixture/newgas = new/datum/gas_mixture()
		newgas.copy_from(gas)
		if(newgas.temperature <= target_temp)	return

		if((newgas.temperature - cooling_power) > target_temp)
			newgas.temperature -= cooling_power
		else
			newgas.temperature = target_temp
		return newgas

/obj/structure/closet/crate/freezer/rations //Fpr use in the escape shuttle
	name = "emergency rations"
	desc = "A crate of emergency rations."


/obj/structure/closet/crate/freezer/rations/WillContain()
	return list(/obj/item/reagent_containers/food/snacks/liquidfood = 2)

/obj/structure/closet/crate/bin
	name = "large bin"
	desc = "A large bin."
	icon_state = "largebin"
	icon_opened = "largebinopen"
	icon_closed = "largebin"

/obj/structure/closet/crate/radiation
	name = "radioactive crate"
	desc = "A leadlined crate with a radiation sign on it."
	icon_state = "radiation"
	icon_opened = "radiationopen"
	icon_closed = "radiation"

/obj/structure/closet/crate/radiation_gear
	name = "radioactive gear crate"
	desc = "A crate with a radiation sign on it."
	icon_state = "radiation"
	icon_opened = "radiationopen"
	icon_closed = "radiation"

/obj/structure/closet/crate/radiation_gear/WillContain()
	return list(/obj/item/clothing/suit/radiation = 8)

/obj/structure/closet/crate/secure/weapon
	name = "weapons crate"
	desc = "A secure weapons crate."
	icon_state = "weaponcrate"
	icon_opened = "weaponcrateopen"
	icon_closed = "weaponcrate"

/obj/structure/closet/crate/secure/phoron
	name = "phoron crate"
	desc = "A secure phoron crate."
	icon_state = "phoroncrate"
	icon_opened = "phoroncrateopen"
	icon_closed = "phoroncrate"

/obj/structure/closet/crate/secure/gear
	name = "gear crate"
	desc = "A secure gear crate."
	icon_state = "secgearcrate"
	icon_opened = "secgearcrateopen"
	icon_closed = "secgearcrate"

/obj/structure/closet/crate/secure/hydrosec
	name = "secure hydroponics crate"
	desc = "A crate with a lock on it, painted in the scheme of botany and botanists."
	icon_state = "hydrosecurecrate"
	icon_opened = "hydrosecurecrateopen"
	icon_closed = "hydrosecurecrate"

/obj/structure/closet/crate/secure/bin
	name = "secure bin"
	desc = "A secure bin."
	icon_state = "largebins"
	icon_opened = "largebinsopen"
	icon_closed = "largebins"
	redlight = "largebinr"
	greenlight = "largebing"
	sparks = "largebinsparks"
	emag = "largebinemag"

/obj/structure/closet/crate/large
	name = "large crate"
	desc = "A hefty metal crate."
	icon = 'icons/obj/storage.dmi'
	icon_state = "ecrate"
	icon_opened = "ecrateopen"
	icon_closed = "ecrate"

	storage_capacity = 2 * MOB_LARGE
	storage_types = CLOSET_STORAGE_ITEMS|CLOSET_STORAGE_STRUCTURES

/obj/structure/closet/crate/large/hydroponics
	icon_state = "hydro_crate_large"
	icon_opened = "hydro_crate_large_open"
	icon_closed = "hydro_crate_large"

/obj/structure/closet/crate/secure/large
	name = "large crate"
	desc = "A hefty metal crate with an electronic locking system."
	icon = 'icons/obj/storage.dmi'
	icon_state = "ancientclosed"
	icon_opened = "ancientopen"
	icon_closed = "ancientclosed"
	redlight = "largemetalr"
	greenlight = "largemetalg"

	storage_capacity = 2 * MOB_LARGE
	storage_types = CLOSET_STORAGE_ITEMS|CLOSET_STORAGE_STRUCTURES

/obj/structure/closet/crate/secure/large/cargo
	name = "cargo crate"
	desc = "A hefty metal crate with an electronic locking system."
	icon = 'icons/obj/storage.dmi'
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/secure/large/phoron
	icon_state = "phoron_crate_large"
	icon_opened = "phoron_crate_large_open"
	icon_closed = "phoron_crate_large"

//fluff variant
/obj/structure/closet/crate/secure/large/reinforced
	desc = "A hefty, reinforced metal crate with an electronic locking system."
	icon_state = "ecrate"
	icon_opened = "ecrateopen"
	icon_closed = "ecrate"

/obj/structure/closet/crate/hydroponics
	name = "hydroponics crate"
	desc = "All you need to destroy those pesky weeds and pests."
	icon_state = "ecrate"
	icon_opened = "ecrateopen"
	icon_closed = "ecrate"

/obj/structure/closet/crate/hydroponics/prespawned/WillContain()
	return list(
		/obj/item/reagent_containers/spray/plantbgone = 2,
		/obj/item/material/minihoe = 2,
		/obj/item/storage/plants = 2,
		/obj/item/material/hatchet = 2,
		/obj/item/wirecutters/clippers = 2,
		/obj/item/device/analyzer/plant_analyzer = 2
	)

/obj/structure/closet/crate/secure/biohazard
	name = "biohazard cart"
	desc = "A heavy cart with extensive sealing. You shouldn't eat things you find in it."
	icon_state = "biohazard"
	icon_opened = "biohazardopen"
	icon_closed = "biohazard"
	open_sound = 'sound/items/Deconstruct.ogg'
	close_sound = 'sound/items/Deconstruct.ogg'
	req_access = list(access_xenobiology)
	storage_types = CLOSET_STORAGE_ITEMS|CLOSET_STORAGE_MOBS

/obj/structure/closet/crate/secure/biohazard/blanks/WillContain()
	return list(/mob/living/carbon/human/blank, /obj/item/usedcryobag)

/obj/structure/closet/crate/paper_refill
	name = "paper refill crate"
	desc = "A rectangular plastic crate, filled up with blank papers for refilling bins and printers. A bureaucrat's favorite."
	icon_state = "plasticcrate"
	icon_opened = "plasticcrateopen"
	icon_closed = "plasticcrate"

/obj/structure/closet/crate/paper_refill/WillContain()
	return list(/obj/item/paper = 30)

/obj/structure/closet/crate/uranium
	name = "fissibles crate"
	desc = "A crate with a radiation sign on it."
	icon_state = "radiation"
	icon_opened = "radiationopen"
	icon_closed = "radiation"

/obj/structure/closet/crate/uranium/WillContain()
	return list(/obj/item/stack/material/uranium/ten = 5)

/// THIS IS THE SPECIAL CRATE SECTION FOR MERCHANT CONSOLE ///

// NEED TO MAKE PILGRIM AND NON GUARD CRATES. PRIEST / MATERIAL - INCLUDE OTHER CRATES ABOVE/BELOW IN CARGO

/obj/structure/closet/crate/krieg
	name = "deaths krieg equipment"
	desc = "A hefty, reinforced metal crate with an electronic locking system."
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/krieg/New()
	new /obj/item/clothing/head/helmet/krieghelmet(src)
	new /obj/item/clothing/head/helmet/krieghelmet(src)
	new /obj/item/clothing/mask/gas/krieg(src)
	new /obj/item/clothing/mask/gas/krieg(src)
	new /obj/item/clothing/shoes/jackboots/krieg(src)
	new /obj/item/clothing/shoes/jackboots/krieg(src)
	new /obj/item/clothing/gloves/thick/swat/combat/krieg(src)
	new /obj/item/clothing/gloves/thick/swat/combat/krieg(src)
	new /obj/item/clothing/suit/armor/krieger(src)
	new /obj/item/clothing/suit/armor/krieger(src)
	new /obj/item/clothing/under/rank/krieg_uniform(src)
	new /obj/item/clothing/under/rank/krieg_uniform(src)

/obj/structure/closet/crate/ingotshaping
	name = "ingot shaping tools crate"
	desc = "A crate with primitive tools for ingots shaping"
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/ingotshaping/New()
	new /obj/item/device/hammer(src)
	new /obj/item/device/chisel(src)
	new /obj/item/device/lube(src)

/obj/structure/closet/crate/valhallan
	name = "valhallan equipment"
	desc = "A hefty, reinforced metal crate with an electronic locking system."
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/valhallan/New()
	new /obj/item/clothing/head/valushanka(src)
	new /obj/item/clothing/head/valushanka(src)
	new /obj/item/clothing/shoes/jackboots/cadian(src)
	new /obj/item/clothing/shoes/jackboots/cadian(src)
	new /obj/item/clothing/gloves/combat/cadian(src)
	new /obj/item/clothing/gloves/combat/cadian(src)
	new /obj/item/clothing/suit/armor/valhallanarmor(src)
	new /obj/item/clothing/suit/armor/valhallanarmor(src)
	new /obj/item/clothing/under/rank/valhallan_uniform(src)
	new /obj/item/clothing/under/rank/valhallan_uniform(src)

/obj/structure/closet/crate/operations
	name = "extended operations crate"
	desc = "A hefty, reinforced metal crate with an electronic locking system."
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/operations/New()
	new /obj/item/clothing/accessory/legguards(src)
	new /obj/item/clothing/accessory/armguards/ballistic(src)
	new /obj/item/clothing/accessory/holster/waist(src)
	new /obj/item/storage/box/ifak(src)
	new /obj/item/clothing/accessory/storage/webbing(src)
	new /obj/item/device/binoculars(src)
	new /obj/item/shovel(src)
	new /obj/item/warflare/blue(src)
	new /obj/item/warflare/blue(src)
	new /obj/item/warflare/blue(src)
	new /obj/item/stack/material/steel/fifty(src)
	new /obj/item/stack/barbwire(src)
	new /obj/item/clothing/mask/smokable/cigarette/cigar/havana(src)
	new /obj/item/clothing/mask/smokable/cigarette/cigar/havana(src)
	new /obj/item/clothing/mask/smokable/cigarette/cigar/havana(src)
	new /obj/item/flame/lighter/zippo(src)
	new /obj/random/canned_food(src)
	new /obj/random/canned_food(src)
	new /obj/random/canned_food(src)

/obj/structure/closet/crate/miner
	name = "mining equipment crate"
	desc = "A hefty, reinforced metal crate with an electronic locking system."
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/miner/New()
	new /obj/item/clothing/suit/armor/militia(src)
	new /obj/item/clothing/suit/armor/salvage(src)
	new /obj/item/storage/box/ifak(src)
	new /obj/item/storage/box/ifak(src)
	new /obj/item/shovel(src)
	new /obj/item/device/flashlight/lantern(src)
	new /obj/item/device/flashlight/lantern(src)
	new /obj/item/clothing/head/helmet/mining(src)
	new /obj/item/clothing/head/helmet/salvage(src)
	new /obj/item/pickaxe(src)
	new /obj/item/pickaxe(src)
	new /obj/item/grenade/frag/high_yield/homemade(src)
	new /obj/item/grenade/frag/high_yield/homemade(src)

/// END OF SPECIAL CRATE SECTION

/obj/structure/closet/crate/ateopoine
	name = "ateopoine crate"
	desc = "A crate with ateopoine in it!"
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/ateopoine/New()
	new /obj/item/reagent_containers/hypospray/autoinjector/revive(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/revive(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/revive(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/revive(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/revive(src)

/obj/structure/closet/crate/ateopoine/WillContain()
	return list(/obj/item/reagent_containers/hypospray/autoinjector/revive = 5)

/obj/structure/closet/crate/meat
	name = "meat crate"
	desc = "A crate with meat in it!"
	icon_state = "cargo1"
	icon_opened = "cargo0"
	icon_closed = "cargo1"

/obj/structure/closet/crate/meat/New()
	new /obj/item/reagent_containers/food/snacks/meat/rat_meat(src)
	new /obj/item/reagent_containers/food/snacks/meat/grox(src)
	new /obj/item/reagent_containers/food/snacks/meat/grox(src)
	new /obj/item/reagent_containers/food/snacks/meat/grox(src)
	new /obj/item/reagent_containers/food/snacks/meat/grox(src)

/obj/structure/closet/crate/miningcrate
	name = "mining crate"
	desc = "A crate with mining equipment inside!"
	icon_state = "crate"
	icon_opened = "crateopen"
	icon_closed = "crate"

/obj/structure/closet/crate/miningcrate/New()
	new /obj/item/pickaxe/newpick(src)
	new /obj/item/storage/newore(src)

/obj/structure/closet/crate/vatgrownboy
	name = "vat-grown human (MARKED FOR EXPERIMENTATION)"
	desc = "This coffin on wheels contains a vat-grown human marked for experimentation."
	icon_state = "miningcar"
	icon_opened = "miningcaropen"
	icon_closed = "miningcar"

/obj/structure/closet/crate/vatgrownboy/New()
	new /mob/living/simple_animal/vatgrown(src)
