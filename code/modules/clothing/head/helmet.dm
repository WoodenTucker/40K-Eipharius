/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Reinforced headgear. Protects the head from impacts."
	icon_state = "helmet"
	drop_sound = 'sound/items/helm_drop.ogg'
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	//restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 25, bomb = 30, bio = 0, rad = 10)
	sales_price = 0
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	var/engraved = FALSE


/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user)
	..()
	if(istype(I, /obj/item/melee/sword/combat_knife))
		if(engraved)
			return
		to_chat(user, "You begin to engrave something on your helmet.")
		var/to_engrave = sanitize(input(user, "What would you like to engrave?", "Engraving") as null|text)
		if(to_engrave)
			to_chat(user, "You engrave your helmet with: \"[to_engrave]\"")
			desc += " Engraved on the helmet is: <b>\"[to_engrave]\"</b>"
			engraved = TRUE
			return
		return




/obj/item/clothing/head/helmet/nt
	name = "\improper corporate security helmet"
	desc = "A helmet with 'CORPORATE SECURITY' printed on the back in red lettering."
	icon_state = "helmet_nt"

/obj/item/clothing/head/helmet/pcrc
	name = "\improper PCRC helmet"
	desc = "A helmet with 'PRIVATE SECURITY' printed on the back in cyan lettering."
	icon_state = "helmet_pcrc"

/obj/item/clothing/head/helmet/nt/guard
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/nt)

/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "A tan helmet made from advanced ceramic. Comfortable and robust."
	icon_state = "helmet_tac"
	armor = list(melee = 30, bullet = 30, laser = 20, energy = 25, bomb = 30, bio = 0, rad = 10)
	siemens_coefficient = 0.6
	sales_price = 8

/obj/item/clothing/head/helmet/preacher
	name = "tactical helmet"
	desc = "A tan helmet made from advanced ceramic. Comfortable and robust."
	icon_state = "helmet_tac"
	armor = list(melee = 30, bullet = 30, laser = 20, energy = 25, bomb = 30, bio = 0, rad = 10)
	siemens_coefficient = 0.6
	sales_price = 8

/obj/item/clothing/head/helmet/merc
	name = "combat helmet"
	desc = "A heavily reinforced helmet painted with red markings. Feels like it could take a lot of punishment."
	icon_state = "helmet_merc"
	armor = list(melee = 40, bullet = 45, laser = 25, energy = 35, bomb = 30, bio = 0, rad = 10)
	siemens_coefficient = 0.5
	sales_price = 15

/obj/item/clothing/head/helmet/barney_helmet
	name = "security helmet"
	icon_state = "helmet_barney"
	armor = list(melee = 40, bullet = 40, laser = 10, energy = 35, bomb = 30, bio =0, rad = 10)
	sales_price = 10


/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "helmet_riot"
	valid_accessory_slots = null
	body_parts_covered = HEAD|FACE|EYES //face shield
	armor = list(melee = 62, bullet = 40, laser = 60, energy = 15, bomb = 40, bio = 12, rad = 20)
	siemens_coefficient = 0.7
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/helmet/riot/attack_self(mob/user as mob)
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]_up"
		to_chat(user, "You raise the visor on the [src].")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You lower the visor on the [src].")
	update_clothing_icon()

/obj/item/clothing/head/helmet/ablative
	name = "ablative helmet"
	desc = "A helmet made from advanced materials which protects against concentrated energy weapons."
	icon_state = "helmet_reflect"
	valid_accessory_slots = null
	armor = list(melee = 5, bullet = 5, laser = 62, energy = 50, bomb = 5, bio = 2, rad = 0)
	siemens_coefficient = 0
	sales_price = 25

/obj/item/clothing/head/helmet/ballistic
	name = "ballistic helmet"
	desc = "A helmet with reinforced flak plating to protect against ballistic projectiles."
	icon_state = "helmet_bulletproof"
	valid_accessory_slots = null
	armor = list(melee = 35, bullet = 40, laser = 30, energy = 5, bomb = 30, bio = 5, rad = 5)
	siemens_coefficient = 0.7

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "They're often used by highly trained Swat Members."
	icon_state = "helmet_merc"
	armor = list(melee = 50, bullet = 58, laser = 10,energy = 25, bomb = 50, bio = 10, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	sales_price = 25

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	valid_accessory_slots = null
	armor = list(melee = 50, bullet = 50, laser = 50,energy = 10, bomb = 25, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	valid_accessory_slots = null
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE
	siemens_coefficient = 1

/*
/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "An armored helmet capable of being fitted with a multitude of attachments."
	icon_state = "swathelm"
	valid_accessory_slots = null
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/helmet.dmi'
		)

	armor = list(melee = 50, bullet = 50, laser = 50,energy = 35, bomb = 10, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
*/

/obj/item/clothing/head/helmet/augment
	name = "Augment Array"
	desc = "A helmet with optical and cranial augments coupled to it."
	icon_state = "v62"
	valid_accessory_slots = null
	armor = list(melee = 20, bullet = 20, laser = 20,energy = 20, bomb = 20, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	body_parts_covered = HEAD|EYES|BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/flak
	name = "flak helmet"
	desc = "A solid helmet made from several layers of ablative and impact-resistant materials. A good helmet to wear if you're not looking to catch a skull-full of shrapnel."
	icon_state = "guard"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 0, rad = 10)
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/scion
	name = "scion helmet"
	desc = "A solid helmet made from several layers of ablative and impact-resistant materials. A good helmet to wear if you're not looking to catch a skull-full of shrapnel."
	icon_state = "helmetNVG"
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 35, bio = 0, rad = 10)
	siemens_coefficient = 0.6
	sales_price = 25

/obj/item/clothing/head/helmet/kasrkin
	name = "kasrkin helmet"
	desc = "A carapace helmet belonging to the elite stormtroopers of the Kasrkin. Cadia may not be intact, but your brain will when in combat with this on."
	icon_state = "kasrkinhelmetb"
	armor = list(melee = 40, bullet = 45, laser = 45, energy = 35, bomb = 50, bio = 0, rad = 10)
	siemens_coefficient = 0.6
	sales_price = 25

/obj/item/clothing/head/helmet/genestealer
	name = "tyranid scale hide"
	desc = "The hide of a Tyranid Genestealer"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 15, bomb = 20, bio = 100, rad = 100)
	icon_state = "gsfeet"
	item_state = "gsfeet"
	canremove = 0
	unacidable = 1
	species_restricted = list(SPECIES_TYRANID)

/obj/item/clothing/head/helmet/sentryhelm
	name = "Sentry Helmet"
	desc = "Used for taking blows to the noggin without getting hurt."
	armor = list(melee = 55, bullet = 58, laser = 58, energy = 40, bomb = 50, bio = 5, rad = 5)//proteck ya neck
	str_requirement = 18

// Ork

/obj/item/clothing/head/helmet/orkhelmet
	name = "Metal Ork Helmet"
	desc = "A genioos mekboy 'ad da bright idea of gluin' spikey bits on sum scrap and 'ammering it a tad. Now ya can 'ear it as a helm! Lookz gud against em boolets."
	icon_state = "ork_helm"
	item_state = "ork_helm"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 25, bio = 0, rad = 0)
	siemens_coefficient = 1
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 10

/obj/item/clothing/head/helmet/orkhelmet/leather
	name = "Boy's Letha Helmet"
	desc = "Da most cam-. Comma-. Cahm-. A LOT OF BOYS HAVE DIS HERE LEATHA 'ELMET IN DA WAAAAGH!"
	icon_state = "orkhelmet"
	item_state = "orkhelmet"
	cold_protection = HEAD
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 0)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/horns
	name = "Spiky Leatha helmet"
	desc = "Da normal leather 'elmet, but a git's gon' and glue'd some spikey horns on it! What a mad lad innit? More melee protektion, it just makez sense!"
	icon_state = "orkhelmethorns"
	item_state = "orkhelmethorns"
	cold_protection = HEAD
	armor = list(melee = 30, bullet = 15, laser = 20, energy = 10, bomb = 30, bio = 0, rad = 0)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/sight
	name = "Flashgitz Sighta"
	desc = "Da sights of a Flashgitz, or even a Loota. Ya reckon dat bit of glass will deflect dem lasers, givin' added protektion."
	icon_state = "orkhelmetsight"
	item_state = "orkhelmetsight"
	cold_protection = HEAD
	armor = list(melee = 20, bullet = 20, laser = 15, energy = 20, bomb = 20, bio = 0, rad = 0)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/fur
	name = "Grenadir Fur 'Elmet"
	desc = "Keeps da bombas away from ya noggin. 'Elps against bombs, dunno bout shrapnel, mate."
	icon_state = "orkhelmetfur"
	item_state = "orkhelmetfur"
	cold_protection = HEAD
	armor = list(melee = 25, bullet = 20, laser = 20, energy = 30, bomb = 60, bio = 0, rad = 0)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/orkhelmet/knot
	name = "Orky Hair Knot"
	desc = "ZOGGING GORK AND MORK. 'ET SOMETIN BETTA ON YA 'EAD, YA CHEAPSKATE!"
	icon_state = "orkknot"
	item_state = "orkknot"
	cold_protection = HEAD
	armor = list(melee = 15, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE



// Tau

/obj/item/clothing/head/helmet/fw
	name = "fire warrior Helmet"
	desc = "A advanced helmet produced for Tau Fire Caste Warriors, made out of...acceptable quality ceramite."
	icon_state = "fwhelm"
	item_state = "fwhelm"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 35, bomb = 35, bio = 100, rad = 100)
	siemens_coefficient = 0.6
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 30

/obj/item/clothing/head/helmet/scout
	name = "fire warrior scout helmet"
	desc = "A advanced helmet produced for Tau Fire Caste Sharpshooters, its made out of some pretty lightweight ceramite and some bits of steel, its probably able to take a few shots before becoming useless."
	icon_state = "scout"
	item_state = "scout"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 25, bomb = 40, bio = 100, rad = 100)
	siemens_coefficient = 0.6
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 35
// Eldar

/obj/item/clothing/head/helmet/eldar
  name = "Guardian Mesh Helmet"
  desc = "A ancient helmet. It looks like it's made from Thermoplas in a scale like pattern."
  icon_state = "eldhelmet"
  item_state = "eldhelmet"
  armor = list(melee = 45, bullet = 45, laser = 70, energy = 70, bomb = 15, bio = 50, rad = 0) //thermoplas and etc
  body_parts_covered = HEAD
  cold_protection = HEAD
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/corsair
  name = "Eldar Corsair Helmet"
  desc = "The dark and shadowy helmet of a voidscarred Corsair."
  icon_state = "aeldar_mask"
  item_state = "aeldar_mask"
  armor = list(melee = 45, bullet = 45, laser = 70, energy = 70, bomb = 15, bio = 50, rad = 0) //thermoplas and etc
  body_parts_covered = HEAD
  cold_protection = HEAD
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
 // Dark Eldar

/obj/item/clothing/head/helmet/darkeldar
  name = "Ghostplate Helmet"
  desc = "A ancient helmet. It looks like it's made from hardened resin in a thin-scale like pattern."
  icon_state = "deldhelmet"
  item_state = "deldhelmet"
  armor = list(melee = 45, bullet = 50, laser = 40, energy = 45, bomb = 15, bio = 40, rad = 0)
  body_parts_covered = HEAD
  cold_protection = HEAD
  min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

// NEW HELMETS

/obj/item/clothing/head/helmet/soul
	name = "Seolite Helmet"
	desc = "A xenos helmet from the seolite forgemasters, remarkbly resistant to thermal damage."
	icon_state = "soul"
	item_state = "soul"
	armor = list(melee = 30, bullet = 30, laser = 48, energy = 35, bomb = 50, bio = 100, rad = 50)
	sales_price = 11

/obj/item/clothing/head/helmet/seolhelm
	name = "Seolite Power Helmet"
	desc = "A xenos power helmet from the seolite forgemasters, remarkbly resistant to thermal damage."
	icon_state = "seolhelm"
	item_state = "seolhelm"
	armor = list(melee = 40, bullet = 40, laser = 68, energy = 35, bomb = 50, bio = 100, rad = 50)
	sales_price = 20

/obj/item/clothing/head/helmet/hauberk
	name = "Chainmail Hood"
	desc = "A chainmail hood for your noggin."
	icon_state = "hauberkhood"
	item_state = "hauberkhood"
	armor = list(melee = 44, bullet = 10, laser = 25, energy = 35, bomb = 10, bio = 20, rad = 10)
	sales_price = 4

/obj/item/clothing/head/helmet/hevhelm
	name = "Heavy Metal Helm"
	desc = "A heavy metal helmet for your noggin."
	icon_state = "hevhelm"
	item_state = "hevhelm"
	armor = list(melee = 58, bullet = 20, laser = 35, energy = 35, bomb = 30, bio = 50, rad = 30)
	sales_price = 7

/obj/item/clothing/head/helmet/sheriff
	name = "Dandy Cowboy Hat"
	desc = "A rootin tootin cowboy hat for your skootin' shootin!"
	icon_state = "sheriffhat"
	item_state = "sheriffhat"
	armor = list(melee = 10, bullet = 35, laser = 10, energy = 35, bomb = 10, bio = 0, rad = 10)
	sales_price = 4

/obj/item/clothing/head/helmet/marinehelm
	name = "Necromunda Helm"
	desc = "A tough iron helmet used by the Necromundan Gangers."
	icon_state = "marinehelm"
	item_state = "marinehelm"
	armor = list(melee = 38, bullet = 30, laser = 34, energy = 35, bomb = 20, bio = 10, rad = 10)
	sales_price = 5

/obj/item/clothing/head/helmet/foxhelm
	name = "Armored Hood"
	desc = "A sneaky hood with overlaying ceramic plate inserts, entirely impractical but also very cool."
	icon_state = "foxhelm"
	item_state = "foxhelm"
	armor = list(melee = 38, bullet = 38, laser = 38, energy = 35, bomb = 10, bio = 40, rad = 30)
	sales_price = 7

/obj/item/clothing/head/helmet/lightpahelm
	name = "Van Saar Power Helmet"
	desc = "A power helmet manufactured by the House of Van Saar, the quality despite it's status as technical power armor is quite poor."
	icon_state = "lightpahelm"
	item_state = "lightpahelm"
	armor = list(melee = 48, bullet = 48, laser = 48, energy = 35, bomb = 50, bio = 50, rad = 30)
	sales_price = 15

/obj/item/clothing/head/helmet/berserkerhelm
	name = "Berserker Power Helmet"
	desc = "A power helmet manufactured manufactured by unknown smiths of ruinous origin, it radiates with incredible energy and a wrath that infests your very soul."
	icon_state = "berserkerhelm"
	item_state = "berserkerhelm"
	armor = list(melee = 60, bullet = 40, laser = 50, energy = 45, bomb = 60, bio = 60, rad = 40)
	sales_price = 20

/obj/item/clothing/head/helmet/reconhood
	name = "Mysterious Hood"
	desc = "Spooky."
	icon_state = "reconhood"
	item_state = "reconhood"
	armor = list(melee = 34, bullet = 24, laser = 24, energy = 35, bomb = 10, bio = 30, rad = 20)
	sales_price = 4

/obj/item/clothing/head/helmet/metalhelmet
	name = "Metal Helmet"
	desc = "A heavy metal helmet that protects you from slashes, stabs and the occassional lasburn."
	icon_state = "metalhelmet"
	item_state = "metalhelmet"
	armor = list(melee = 14, bullet = 14, laser = 14, energy = 10, bomb = 10, bio = 30, rad = 20)
	sales_price = 7

/obj/item/clothing/head/helmet/gangerhelm
	name = "Metal Helmet"
	desc = "A heavy metal ganger helmet that protects you from slashes, stabs and the occassional lasburn."
	icon_state = "raider_combat_helmet"
	item_state = "raider_combat_helmet"
	armor = list(melee = 12, bullet = 12, laser = 12, energy = 12, bomb = 12, bio = 30, rad = 20)
	sales_price = 8

/obj/item/clothing/head/helmet/knighthelm
	name = "Masterwork Helm"
	desc = "A heavy metal helmet that protects you from slashes, stabs and the occassional lasburn."
	icon_state = "knighthelm"
	item_state = "knighthelm"
	armor = list(melee = 20, bullet = 15, laser = 15, energy = 15, bomb = 15, bio = 30, rad = 20)
	sales_price = 9

/obj/item/clothing/head/helmet/dragon
	name = "Drake Helm"
	desc = "A heavy bone helmet forged from the carcass of a giant reptilian native to Samara."
	icon_state = "dragon"
	item_state = "dragon"
	armor = list(melee = 45, bullet = 25, laser = 25, energy = 35, bomb = 20, bio = 30, rad = 20)
	sales_price = 9

/obj/item/clothing/head/helmet/metalvisor
	name = "Metal Visor"
	desc = "A heavy metal visor for protecting your face."
	icon_state = "leglad"
	item_state = "leglad"
	armor = list(melee = 15, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 30, rad = 20)
	sales_price = 9

/obj/item/clothing/head/helmet/stalkerhelm
	name = "Stalker Helmet"
	desc = "An old combat helmet, custom fitted with a filtration mask and carapace exterior, the stalker who wore this knew their trade well."
	icon_state = "ranger_oldup"
	item_state = "ranger_oldup"
	armor = list(melee = 18, bullet = 18, laser = 18, energy = 20, bomb = 20, bio = 70, rad = 50)
	sales_price = 11

/obj/item/clothing/head/helmet/stalkerhelm2
	name = "Stalker Helmet"
	desc = "An old combat helmet, custom fitted with a filtration mask and carapace exterior, the stalker who wore this knew their trade well."
	icon_state = "ranger1"
	item_state = "ranger1"
	armor = list(melee = 18, bullet = 18, laser = 18, energy = 20, bomb = 20, bio = 70, rad = 50)
	sales_price = 11

/obj/item/clothing/head/helmet/heavyflak
	name = "Heavy Flak Helmet"
	desc = "An old flak helmet, custom fitted with a filtration mask and armored exterior."
	icon_state = "doom"
	item_state = "doom"
	armor = list(melee = 18, bullet = 18, laser = 18, energy = 15, bomb = 40, bio = 50, rad = 30)
	sales_price = 10

/obj/item/clothing/head/helmet/vindicare
	name = "Vindicare helmet"
	desc = "The menacing helm of a Vindicare."
	icon_state = "s-ninja"
	armor = list(melee = 15, bullet = 80, laser = 80, energy = 80, bomb = 30, bio = 100, rad = 10)//Bulletproof, because, well, sniper.
	siemens_coefficient = 0
	canremove = 0
	flags_inv = HIDEEARS|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/helmet/thallax
	name = "Vindicare helmet"
	desc = "The armoured helmet of a Thallax Warrior."
	icon_state = "vox-stealth"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 70, bomb = 70, bio = 100, rad = 100)
	siemens_coefficient = 0
	canremove = 0
	flags_inv = HIDEEARS|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
