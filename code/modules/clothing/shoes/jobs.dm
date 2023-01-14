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
	var/spawn_done = null //trying to do the thing for animation
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
		spawn_done = 1
		return
	..()
/obj/item/clothing/shoes/jackboots/update_icon()
	..()//I am aware this breaks the blood overlay, however I'm not particularly worried about that. We can fix that later. - Matt
	var/image/I = image('icons/obj/clothing/accessory_overlays.dmi', "bootknife_0")
	/*if(!knife && spawn_done)
		//B.flick ("knife_out", src)
		I = image('icons/obj/clothing/accessory_overlays.dmi', "bootknife_0")*/
	if(knife /*&& spawn_done*/)
		//B.flick ("knife_in", src)
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

// IMPERIAL SHOES



//ADEPTUS MECHANICUS SHIT
/obj/item/clothing/shoes/jackboots/skitshoes //walking sounds only play with shoes and I was losing my mind not having them
	name = "Skitarii feet"
	desc = "Augmented for speed and power"
	icon_state = "skitshoes"
	item_state = "skitshoes"
	siemens_coefficient = 1
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 20, bio = 0, rad = 80)
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP|ITEM_FLAG_NODROP
	canremove = FALSE

/obj/item/clothing/shoes/jackboots/skitshoes/ruststalker //walking sounds only play with shoes and I was losing my mind not having them
	name = "Ruststalker feet"
	desc = "Augmented for speed and power"
	icon_state = "skitshoes"
	item_state = "skitshoes"
	siemens_coefficient = 1
	armor = list(melee = 80, bullet = 30, laser = 30, energy = 50, bomb = 20, bio = 0, rad = 100) //Slightly changed defensive values.
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP|ITEM_FLAG_NODROP
	canremove = FALSE

/obj/item/clothing/shoes/jackboots/skitshoes/vanguard //walking sounds only play with shoes and I was losing my mind not having them
	name = "Vanguard feet"
	desc = "Augmented for speed and power"
	icon_state = "skitshoes"
	item_state = "skitshoes"
	siemens_coefficient = 1
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 60, bio = 0, rad = 160)//Heavily armoured, but very heavy.
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP|ITEM_FLAG_NODROP
	canremove = FALSE

/obj/item/clothing/shoes/jackboots/technoboots
	name = "Mars Pattern Advanced Boots"
	desc = "Forged by the finest alloys in the Galaxy, designed for the Adeptus Mechanicus Tech-Priest and Adepts, Resilent against most known firearms."
	icon_state = "techpriest"
	item_state = "techpriest"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 30, bomb = 20, bio = 0, rad = 60)
	siemens_coefficient = 1
	can_hold_knife = 1
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP|ITEM_FLAG_NODROP
	canremove = FALSE

/obj/item/clothing/shoes/jackboots/techpriest
	name = "techno-boots"
	desc = "Cybernetic legs scurry the Tech-priest where he is needed."
	icon_state = "techpriest"
	item_state = "techpriest"
	armor = list(melee = 40, bullet = 10, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7
	can_hold_knife = 1
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP|ITEM_FLAG_NODROP
	canremove = FALSE
//PILGRIM SHIT BELOW

/obj/item/clothing/shoes/vigilante
	name = "shining shoes"
	desc = "A shined pair of shoes"
	icon_state = "vigilante_boots"
	item_state = "vigilante_boots"
	armor = list(melee = 30, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7
	can_hold_knife = 1
	item_flags = ITEM_FLAG_NOSLIP
	
/obj/item/clothing/shoes/prac_boots
	name = "practioner boots"
	desc = "Squish."
	icon_state = "prac_boots"
	item_state = "prac_boots"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 100, rad = 20)

/obj/item/clothing/shoes/jackboots/pilgrim_boots
	name = "Pilgrim Boots"
	desc = "The black leather boots of a pilgrim, somehow they manage to both fit and don't fit on you, they feel comfortable, can hold a knife."
	icon_state = "prac_boots"
	item_state = "prac_boots"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 100, rad = 20)
	
	
//GUARDSMAN SHIT

/obj/item/clothing/shoes/jackboots/cadian
	name = "Mars Pattern Combat Boots"
	desc = "Astra Militarum's common combat boots, found worn by most Imperial Agencies and Astra Militarum."
	icon_state = "jackboots"
	item_state = "jackboots"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 5, bomb = 10, bio = 0, rad = 0)
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/jackboots/catachan
	name = "Mars Pattern Combat Boots"
	desc = "Astra Militarum's common combat boots, found worn by most Imperial Agencies and Astra Militarum."
	icon_state = "jackboots"
	item_state = "jackboots"
	armor = list(melee = 40, bullet = 20, laser = 30, energy = 5, bomb = 10, bio = 0, rad = 0)
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/jackboots/catachan/New()
	..()
	knife = new /obj/item/material/sword/combat_knife/catachan
	update_icon()

/obj/item/clothing/shoes/jackboots/krieg
	name = "Krieg Pattern Combat Boots"
	desc = "The Krieg Regiment, unlike most of the Astra Militarum, prefer their less protective but more mobile boots over the standard Mars Pattern used by the Munitorium."
	icon_state = "kriegboots"
	item_state = "kriegboots"
	armor = list(melee = 20, bullet = 30, laser = 40, energy = 30, bomb = 40, bio = 100, rad = 100)
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE


//Commissar shoes, not being currently used.
/obj/item/clothing/shoes/jackboots/commissar
	name = "commissar boots"
	desc = "Knee-high riding boots of an officer of the Officio Prefectus."
	icon_state = "comm_boots"
	item_state = "comm_boots"
	species_restricted = list(SPECIES_HUMAN)
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 30, bomb = 40, bio = 100, rad = 100)
	item_flags = ITEM_FLAG_NOSLIP
	
// Astartes Stuff

/obj/item/clothing/shoes/jackboots/astartes
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine."
	icon_state = "rg_lib"
	item_state = "rg_lib"
	str_requirement = 25
	canremove = 0
	unacidable = 1
	armor = list(melee = 90, bullet = 90, laser = 90, energy = 90, bomb = 90, bio = 50, rad = 50)
	cold_protection = FEET|LEGS
	item_flags = ITEM_FLAG_NOSLIP
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_ASTARTES)

/obj/item/clothing/shoes/jackboots/astartes/New()
	..()
	knife = new /obj/item/material/sword/combat_knife/catachan/giant
	update_icon()


/obj/item/clothing/shoes/jackboots/astartes/smurfs
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the 12th chapter, the Ultramarines."
	icon_state = "umboots"
	item_state = "umboots"

/obj/item/clothing/shoes/jackboots/astartes/bloodangel
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the 9th chapter, the Blood Angels."
	icon_state = "ba_boots"
	item_state = "ba_boots"

/obj/item/clothing/shoes/jackboots/astartes/sallys
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the 18th chapter, the Salamanders."
	icon_state = "sl_boots"
	item_state = "sl_boots"

/obj/item/clothing/shoes/jackboots/astartes/raven
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the 19th chapter, the Raven Guard."
	icon_state = "rg_lib"
	item_state = "rg_lib"


// Sororitas

/obj/item/clothing/shoes/jackboots/sisterofbattle
	name = "Order of the Sacred Rose Power Boots"
	desc = "A pair of Power Boots issued to the Sororitas-Militant of the Order Of The Sacred Rose of the Adepta Sororitas.</i>"
	icon_state = "sister"
	item_state = "sister"
	siemens_coefficient = 1
	can_hold_knife = 1
	canremove = 1
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/shoes/jackboots/sisterofbattle/repentia
	name = "Sandals of the Repentia"
	desc = "Worn sandals given Sisters Repentia</i>"
	icon_state = "roman"
	item_state = "roman"
	siemens_coefficient = 1
	can_hold_knife = 1
	canremove = 1
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/shoes/jackboots/sisterofbattle/mlsister
	name = "Order of Our Martyred Lady Power Boots"
	desc = "A pair of Power Boots issued to the sisters of the Order Of Our Martyred Lady of the Adepta Sororitas.</i>"
	icon_state = "mlsister"
	item_state = "mlsister"
	siemens_coefficient = 1
	can_hold_knife = 1
	canremove = 1
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/shoes/jackboots/sisterofbattle/brsister
	name = "Order of the Bloody Rose Power Boots"
	desc = "A pair of Power Boots issued to the sisters of the Order Of Our Martyred Lady of the Adepta Sororitas.</i>"
	icon_state = "brsister"
	item_state = "brsister"
	siemens_coefficient = 1
	can_hold_knife = 1
	canremove = 1
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 40, bio = 0, rad = 0)
	species_restricted = list(SPECIES_HUMAN)
	
//Inquisition Stuff

/obj/item/clothing/shoes/jackboots/inquisitor
	name = "Plasteel Reinforced Combat Boots"
	desc = "Tall plasteel boots with black paint."
	icon_state = "inqshoes"
	item_state = "inqshoes"
	force = 3
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 50, bio = 100, rad = 100)
	siemens_coefficient = 0.7
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	item_flags = ITEM_FLAG_NOSLIP

/obj/item/clothing/shoes/jackboots/inquisitor/acolyte
	name = "Reinforced Combat Boots"
	desc = "Reinforced Mars Pattern Combat Boots."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = 3
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 40, bomb = 25, bio = 70, rad = 70)
	siemens_coefficient = 0.7
	can_hold_knife = 1
	cold_protection = FEET
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	item_flags = ITEM_FLAG_NOSLIP

	
	
	
	

// YOU WILL ONLY FIND XENO MONSTERS FROM THIS POINT ONWARD! CODEBROTHER, DON'T DO IT!





// Tau

/obj/item/clothing/shoes/krootfeet //walking sounds only play with shoes and I was losing my mind not having them
	name = "kroot feet"
	desc = "The spindly webbed feet of a Kroot"
	icon_state = "krootboot"
	item_state = "krootboot"
	canremove = 0
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP
// Genestealer

/obj/item/clothing/shoes/genestealerfeet //walking sounds only play with shoes and I was losing my mind not having them
	name = "tyranid feet"
	desc = "The skittering feet of a Tyranid Genestealer."
	icon_state = "gsfeet"
	item_state = "gsfeet"
	canremove = 0
	unacidable = 1
	item_flags = ITEM_FLAG_NOSLIP
	species_restricted = list(SPECIES_TYRANID)
// Ork

/obj/item/clothing/shoes/orkboots //walking sounds only play with shoes and I was losing my mind not having them
	name = "ork boots"
	desc = "da stompas"
	icon_state = "ork_boots"
	item_state = "ork_boots"
	species_restricted = list(SPECIES_ORK)
	canremove = 0
//	item_flags = ITEM_FLAG_NOSLIP //walker here, add this if you don't like orks being goofy or funny or if you are a nerd


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

