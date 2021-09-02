// Rubber Boots

/obj/item/clothing/shoes/galoshes
	desc = "Rubber boots"
	name = "galoshes"
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	item_flags = ITEM_FLAG_NOSLIP
	can_hold_knife = 1
	species_restricted = null
/obj/item/clothing/shoes/galoshes/Initialize()
	. = ..()
	slowdown_per_slot[slot_shoes] = 1

// Jackboot

/obj/item/clothing/shoes/jackboots
	name = "Combat Boots"
	desc = "Tall synthleather boots with an artificial shine."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = 3
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)
	siemens_coefficient = 0.7
	can_hold_knife = 1
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	var/obj/item/material/sword/combat_knife/knife = null
/obj/item/clothing/shoes/jackboots/New()
	..()
	knife = new
	update_icon()
/obj/item/clothing/shoes/jackboots/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/material/sword/combat_knife))
		if(knife)//We've already got a knife in there, no need for another.
			return
		user.drop_from_inventory(I)
		I.forceMove(src)
		knife = I
		update_icon()
		playsound(src, 'sound/items/holster_knife.ogg', 50, 0, -1)
/obj/item/clothing/shoes/jackboots/attack_hand(mob/living/user)
	if(knife)
		user.put_in_active_hand(knife)
		knife = null
		update_icon()
		return
	..()
/obj/item/clothing/shoes/jackboots/update_icon()
	..()//I am aware this breaks the blood overlay, however I'm not particularly worried about that. We can fix that later. - Matt
	var/image/I = image('icons/obj/clothing/accessory_overlays.dmi', "bootknife_0")
	if(knife)
		I = image('icons/obj/clothing/accessory_overlays.dmi', "bootknife_1")

	overlays += I

// Furry Stuff

/obj/item/clothing/shoes/jackboots/unathi
	name = "toe-less jackboots"
	desc = "Modified pair of jackboots, particularly comfortable for those species whose toes hold claws."
	item_state = "digiboots"
	icon_state = "digiboots"
	species_restricted = null

/obj/item/clothing/shoes/workboots/toeless
	name = "toe-less workboots"
	desc = "A pair of toeless work boots designed for use in industrial settings. Modified for species whose toes have claws."
	icon_state = "workbootstoeless"
	species_restricted = null

// Pilgrim Stuff

/obj/item/clothing/shoes/workboots
	name = "techno-boots"
	desc = "Cybernetic legs scurry the Tech-priest where he is needed."
	icon_state = "techpriest"
	item_state = "techpriest"
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7
	can_hold_knife = 1

/obj/item/clothing/shoes/commandboots
	name = "boots of command"
	desc = "Expensive leather boots that demand respect."
	icon_state = "hopboots"
	item_state = "hopboots"
	species_restricted = null
/obj/item/clothing/shoes/vigilante
	name = "shining shoes"
	desc = "A shined pair of shoes"
	icon_state = "vigilante_boots"
	item_state = "vigilante_boots"
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7
	can_hold_knife = 1

/obj/item/clothing/shoes/prac_boots
	name = "practioner boots"
	desc = "Squish."
	icon_state = "prac_boots"
	item_state = "prac_boots"

// Tau

/obj/item/clothing/shoes/krootfeet //walking sounds only play with shoes and I was losing my mind not having them
	name = "kroot feet"
	desc = "The spindly webbed feet of a Kroot"
	icon_state = "krootboot"
	item_state = "krootboot"
	canremove = 0

// Genestealer

/obj/item/clothing/shoes/genestealerfeet //walking sounds only play with shoes and I was losing my mind not having them
	name = "tyranid feet"
	desc = "The skittering feet of a Tyranid Genestealer"
	icon_state = "gsfeet"
	item_state = "gsfeet"
	canremove = 0

// Ork

/obj/item/clothing/shoes/orkboots //walking sounds only play with shoes and I was losing my mind not having them
	name = "ork boots"
	desc = "da stompas"
	icon_state = "ork_boots"
	item_state = "ork_boots"

// Astra Militarum Stuff

/obj/item/clothing/shoes/jackboots/cadian
	name = "Mars Pattern Combat Boots"
	desc = "Astra Militarum's common combat boots, found worn by most Imperial Agencies and Astra Militarum."
	icon_state = "jackboots"
	item_state = "jackboots"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 10, bio = 0, rad = 0)
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/jackboots/krieg
	name = "Krieg Pattern Combat Boots"
	desc = "The Krieg Regiment, unlike most of the Astra Militarum, prefer their less protective but more mobile boots over the standard Mars Pattern used by the Munitorium."
	icon_state = "kriegboots"
	item_state = "kriegboots"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 10, bio = 0, rad = 0)
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/commissar
	name = "boots of the commissar"
	desc = "Knee high riding boots of an officer of the Officio Prefectus."
	icon_state = "comm_boots"
	item_state = "comm_boots"
	species_restricted = null

// Astarte Stuff

/obj/item/clothing/shoes/astarte/boots
	name = "Astarte Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine."
	icon_state = "rg_lib"
	item_state = "rg_lib"
	str_requirement = 25
	canremove = 0
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 50, rad = 50)
	cold_protection = FEET|LEGS
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	var/obj/item/material/sword/combat_knife/knife = null
/obj/item/clothing/shoes/astarte/boots/New()
	..()
	knife = new
	update_icon()
/obj/item/clothing/shoes/astarte/boots/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/material/sword/combat_knife))
		if(knife)//We've already got a knife in there, no need for another.
			return
		user.drop_from_inventory(I)
		I.forceMove(src)
		knife = I
		update_icon()
		playsound(src, 'sound/items/holster_knife.ogg', 50, 0, -1)
/obj/item/clothing/shoes/astarte/boots/attack_hand(mob/living/user)
	if(knife)
		user.put_in_active_hand(knife)
		knife = null
		update_icon()
		return
	..()
/obj/item/clothing/shoes/astarte/boots/smurfs
	name = "Astarte Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in XIIIth Chapter Ultramarines's colour scheme."
	icon_state = "umboots"
	item_state = "umboots"

/obj/item/clothing/shoes/astarte/boots/bloodraven
	name = "Astarte Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in Chapter Blood Ravens's colour scheme."
	icon_state = "brboots"
	item_state = "brboots"

/obj/item/clothing/shoes/astarte/boots/sallys
	name = "Astarte Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in XVIIIth Chapter Salamanders's colour scheme."
	icon_state = "sl_boots"
	item_state = "sl_boots"

/obj/item/clothing/shoes/astarte/boots/raven
	name = "Astarte Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in XIXth Chapter Raven Guard's colour scheme."
	icon_state = "rg_lib"
	item_state = "rg_lib"

/obj/item/clothing/shoes/skitshoes //walking sounds only play with shoes and I was losing my mind not having them
	name = "Skitarii feet"
	desc = "Augmented for speed and power"
	icon_state = "skitshoes"
	item_state = "skitshoes"
	siemens_coefficient = 1
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 20, bio = 0, rad = 0)
	canremove = 0

/obj/item/clothing/shoes/technoboots
	name = "Mars Pattern Advanced Boots"
	desc = "Forged by the finest alloys in the Galaxy, designed for the Adeptus Mechanicus Tech-Priest and Adepts, Resilent against most known firearms."
	icon_state = "techpriest"
	item_state = "techpriest"
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 1
	can_hold_knife = 1

// Sororitas

/obj/item/clothing/shoes/sisterelohiem
	name = "Order of the Sacred Rose Power Boots"
	desc = "A pair of Power Boots issued to the Battle Sisters of the Order Of The Sacred Rose of the Adepta Sororitas.</i>"
	icon_state = "sister"
	item_state = "sister"
	canremove = 0
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	species_restricted = list(SPECIES_HUMAN)

//Eldar Stuff

/obj/item/clothing/shoes/eldar
  name = "Guardian Mesh Boots"
  desc = "A ancient set of boots. It looks like it's made out of thermoplas in a scale like pattern. It has extra cushion to protect the wearers feet."
  icon_state = "eldboots"
  item_state = "eldboots"
  armor = list(melee = 35, bullet = 50, laser = 45, energy = 45, bomb = 15, bio = 40, rad = 0)
  cold_protection = FEET|LEGS
  min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
  //Dark Eldar Stuff

/obj/item/clothing/shoes/darkeldar
  name = "Ghostplate Boots"
  desc = "A ancient set of boots. It looks like it's made out of hardened resin in a thin-scale like pattern. It has extra cushion to protect the wearers feet."
  icon_state = "deldboots"
  item_state = "deldboots"
  armor = list(melee = 35, bullet = 50, laser = 45, energy = 45, bomb = 15, bio = 40, rad = 0)
  cold_protection = FEET|LEGS
  min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE


//Inquisition Stuff

/obj/item/clothing/shoes/hereticusboots
	name = "Ordo Hereticus Shoes"
	desc = "Tall plasteel boots with black paint."
	icon_state = "inqshoes"
	item_state = "inqshoes"
	force = 3
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 50, bio = 0, rad = 0)
	siemens_coefficient = 0.7
	can_hold_knife = 1
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	var/obj/item/material/sword/combat_knife/knife = null
/obj/item/clothing/shoes/hereticusboots/New()
	..()
	knife = new
	update_icon()
/obj/item/clothing/shoes/hereticusboots/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/material/sword/combat_knife))
		if(knife)//We've already got a knife in there, no need for another.
			return
		user.drop_from_inventory(I)
		I.forceMove(src)
		knife = I
		update_icon()
		playsound(src, 'sound/items/holster_knife.ogg', 50, 0, -1)
/obj/item/clothing/shoes/hereticusboots/attack_hand(mob/living/user)
	if(knife)
		user.put_in_active_hand(knife)
		knife = null
		update_icon()
		return
	..()
