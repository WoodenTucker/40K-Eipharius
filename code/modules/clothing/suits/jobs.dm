/*
 * Job related
 */

//Botonist
/obj/item/clothing/suit/apron
	name = "apron"
	desc = "A basic blue apron."
	icon_state = "apron"
	item_state = "apron"
	blood_overlay_type = "armor"
	body_parts_covered = 0
	allowed = list (/obj/item/reagent_containers/spray/plantbgone,/obj/item/device/analyzer/plant_analyzer,/obj/item/seeds,/obj/item/reagent_containers/glass/bottle,/obj/item/material/minihoe)

/obj/item/clothing/suit/farmer
	name = "farmer's robes"
	desc = "A simple farmer's robe"
	icon_state = "undertaker"
	item_state = "undertaker"
	blood_overlay_type = "armor"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 0, bomb = 0, bio = 5, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	allowed = list (/obj/item/reagent_containers/spray/plantbgone,/obj/item/device/analyzer/plant_analyzer,/obj/item/seeds,/obj/item/reagent_containers/glass/bottle,/obj/item/material/minihoe)

//Magistrate
/obj/item/clothing/suit/robes
	name = "commandant's robes"
	desc = "Fit for a king... or a uh... Commandant."
	icon_state = "robes"
	item_state = "robes"
	body_parts_covered = UPPER_TORSO|ARMS

//Captain
/obj/item/clothing/suit/captunic
	name = "captain's parade tunic"
	desc = "Worn by a Captain to show their class."
	icon_state = "captunic"
	item_state = "captunic"
	body_parts_covered = UPPER_TORSO|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/captunic/capjacket
	name = "captain's uniform jacket"
	desc = "A less formal jacket for everyday captain use."
	icon_state = "capjacket"
	item_state = "capjacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = 0

//Chaplain
/obj/item/clothing/suit/chaplain_hoodie
	name = "Tech-Serf's Robes"
	desc = "Worn by menials in service of the Mechanicus; or aspirant priests."
	icon_state = "chaplain_hoodie"
	item_state = "chaplain_hoodie"
	body_parts_covered = UPPER_TORSO|ARMS

//Chaplain
/obj/item/clothing/suit/nun
	name = "nun robe"
	desc = "Maximum piety in this star system."
	icon_state = "nun"
	item_state = "nun"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT

//Chef
/obj/item/clothing/suit/chef
	name = "chef's apron"
	desc = "An apron used by a high class chef."
	icon_state = "chef"
	item_state = "chef"
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	allowed = list (/obj/item/material/knife)
	armor = list(melee = 20, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5) //DON'T remove the melee, its for the meme

/obj/item/clothing/suit/guardchef
	name = "imperial guard cook's apron"
	desc = "The dirty apron of a guard cook."
	armor = list(melee = 20, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5) //dont remove the melee, please
	icon_state = "bsapron"
	item_state = "bsapron"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	allowed = list (/obj/item/material/knife)

//Chef
/obj/item/clothing/suit/chef/classic
	name = "classic chef's apron"
	desc = "A basic, dull, white chef's apron."
	icon_state = "apronchef"
	item_state = "apronchef"
	blood_overlay_type = "armor"
	body_parts_covered = 0
	armor = list(melee = 20, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5) //please dont change this

//Security
/obj/item/clothing/suit/security/navyofficer
	name = "security officer's jacket"
	desc = "This jacket is for those special occasions when a security officer actually feels safe."
	icon_state = "officerbluejacket"
	item_state = "officerbluejacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/security/navywarden
	name = "warden's jacket"
	desc = "Perfectly suited for the warden that wants to leave an impression of style on those who visit the brig."
	icon_state = "wardenbluejacket"
	item_state = "wardenbluejacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/security/navyhos
	name = "Commissar's jacket"
	desc = "This piece of clothing was specifically designed for asserting superior authority."
	armor = list(melee = 25, bullet = 35, laser = 25, energy = 0, bomb = 10, bio = 5, rad = 5)
	icon_state = "hosbluejacket"
	item_state = "hosbluejacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

//Detective
/obj/item/clothing/suit/storage/det_trench
	name = "brown trenchcoat"
	desc = "A rugged canvas trenchcoat, designed and created by TX Fabrication Corp. The coat is externally impact resistant - perfect for your next act of autodefenestration!"
	icon_state = "detective"
	item_state = "detective"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	allowed = list(/obj/item/tank/emergency,/obj/item/device/flashlight,/obj/item/gun/energy,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs,/obj/item/storage/fancy/cigarettes,/obj/item/flame/lighter,/obj/item/device/taperecorder)
	armor = list(melee = 20, bullet = 20, laser = 5, energy = 5, bomb = 10, bio = 10, rad = 10)

/obj/item/clothing/suit/storage/det_trench/grey
	name = "grey trenchcoat"
	icon_state = "detective2"

//Forensics
/obj/item/clothing/suit/storage/forensics
	name = "jacket"
	desc = "A forensics technician jacket."
	item_state = "det_suit"
	body_parts_covered = UPPER_TORSO|ARMS
	allowed = list(/obj/item/tank/emergency,/obj/item/device/flashlight,/obj/item/gun/energy,/obj/item/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/handcuffs,/obj/item/device/taperecorder)
	armor = list(melee = 20, bullet = 20, laser = 5, energy = 5, bomb = 10, bio = 10, rad = 10)

/obj/item/clothing/suit/storage/forensics/red
	name = "red jacket"
	desc = "A red forensics technician jacket."
	icon_state = "forensics_red"

/obj/item/clothing/suit/storage/forensics/blue
	name = "blue jacket"
	desc = "A blue forensics technician jacket."
	icon_state = "forensics_blue"

//Engineering
/obj/item/clothing/suit/storage/hazardvest
	name = "hazard vest"
	desc = "A high-visibility vest used in work zones."
	icon_state = "hazard"
	item_state = "hazard"
	blood_overlay_type = "armor"
	allowed = list (/obj/item/device/analyzer, /obj/item/device/flashlight, /obj/item/device/multitool, /obj/item/device/pipe_painter, /obj/item/device/radio, /obj/item/device/t_scanner, \
	/obj/item/crowbar, /obj/item/screwdriver, /obj/item/weldingtool, /obj/item/wirecutters, /obj/item/wrench, /obj/item/tank/emergency, \
	/obj/item/clothing/mask/gas, /obj/item/taperoll/engineering)
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/hazardvest/blue
	name = "blue hazard vest"
	desc = "A high-visibility vest used in work zones. This one is blue!"
	icon_state = "hazard_b"

/obj/item/clothing/suit/storage/hazardvest/white
	name = "white hazard vest"
	desc = "A high-visibility vest used in work zones. This one has a red cross!"
	icon_state = "hazard_w"

/obj/item/clothing/suit/storage/hazardvest/green
	name = "green hazard vest"
	desc = "A high-visibility vest used in work zones. This one is green!"
	icon_state = "hazard_g"


/obj/item/clothing/suit/storage/hazardvest/magos
	name = "magos' robes"
	desc = "Plain robes with numerous mechanical appendages sticking out and wriggling about."
	icon_state = "magos"
	item_state = "magos"
	armor = list(melee = 50, bullet = 60, laser = 60, energy = 0, bomb = 60, bio = 100, rad = 100) //it is literal steel reinforced with plasteel... its not EASY to break
	canremove = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	unacidable = 1
	sales_price = 50


/obj/item/clothing/suit/storage/hazardvest/magos/techpriest
	name = "tech-priest's robes"
	desc = "Plain robes with numerous mechanical appendages sticking out and wriggling about."
	canremove = 0
	icon_state = "techpriest"
	item_state = "techpriest"
	armor = list(melee = 45, bullet = 45, laser = 50, energy = 0, bomb = 40, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 30

//Lawyer
/obj/item/clothing/suit/storage/toggle/suit
	name = "suit jacket"
	desc = "A snappy dress jacket."
	icon_state = "suitjacket_open"
	item_state = "suitjacket_open"
	icon_open = "suitjacket_open"
	icon_closed = "suitjacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/suit/blue
	name = "blue suit jacket"
	color = "#00326e"

/obj/item/clothing/suit/storage/toggle/suit/purple
	name = "purple suit jacket"
	color = "#6c316c"

/obj/item/clothing/suit/storage/toggle/suit/black
	name = "black suit jacket"
	color = "#1f1f1f"

//Medical
/obj/item/clothing/suit/storage/toggle/fr_jacket
	name = "first responder jacket"
	desc = "A high-visibility jacket worn by medical first responders."
	icon_state = "fr_jacket_open"
	item_state = "fr_jacket"
	icon_open = "fr_jacket_open"
	icon_closed = "fr_jacket"
	blood_overlay_type = "armor"
	allowed = list(/obj/item/stack/medical, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/hypospray, /obj/item/reagent_containers/syringe, \
	/obj/item/device/healthanalyzer, /obj/item/device/flashlight, /obj/item/device/radio, /obj/item/tank/emergency)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/fr_jacket/ems
	name = "\improper EMS jacket"
	desc = "A dark blue, martian-pattern, EMS jacket. It sports high-visibility reflective stripes and a star of life on the back."
	icon_state = "ems_jacket_closed"
	item_state = "ems_jacket_closed"
	icon_open = "ems_jacket_open"
	icon_closed = "ems_jacket_closed"

/obj/item/clothing/suit/surgicalapron
	name = "surgical apron"
	desc = "A sterile blue apron for performing surgery."
	icon_state = "surgical"
	item_state = "surgical"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	allowed = list(/obj/item/stack/medical, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/hypospray, /obj/item/reagent_containers/syringe, \
	/obj/item/device/healthanalyzer, /obj/item/device/flashlight, /obj/item/device/radio, /obj/item/tank/emergency,/obj/item/scalpel,/obj/item/retractor,/obj/item/hemostat, \
	/obj/item/cautery,/obj/item/bonegel,/obj/item/FixOVein)

/obj/item/clothing/suit/storage/doctor_vest
	name = "doctor\'s vest"
	desc = "A vest worn by doctors. Comes with pockets for bandages and the like."
	icon_state = "doctor_vest"
	item_state = "doctor_vest"
	blood_overlay_type = "armor"


/obj/item/clothing/suit/musician
	name = "musician's garb"
	desc = "A colorful yet somewhat tattered uniform."
	icon_state = "xomrobe"
	item_state = "xomrobe"
	armor = list(melee = 15, bullet = 15, laser = 10, energy = 0, bomb = 0, bio =10, rad = 0)
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/admin
	name = "administrator's garb"
	desc = "Elegant clothing for a wealthy administrator, this one seems to have a hidden carapace armor plate in it... the plate seems to be of a cheap quality..."
	icon_state = "robes"
	item_state = "robes_item"
	armor = list(melee = 35, bullet = 40, laser = 35, energy = 5, bomb = 10, bio = 10, rad = 10) //reinforced in case of a bombing
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/suit/merchant
	name = "trader's garb"
	desc = "Elegant clothing for a wealthy trader."
	icon_state = "male2"
	item_state = "male2"
	blood_overlay_type = "coat"
	armor = list(melee = 20, bullet = 20, laser = 10, energy = 0, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//Penitent
/obj/item/clothing/suit/raggedrobe
	name = "ragged robe"
	desc = "Stinking, torn robes"
	icon_state = "grosthrobe"
	item_state = "grosthrobe"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 0, bomb = 0, bio = 0, rad = 0)
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO

//innkeeper
/obj/item/clothing/suit/innapron
	name = "innkeeper's apron"
	desc = "An amasec and caff stained apron."
	icon_state = "mapron"
	item_state = "mapron"
	armor = list(melee = 20, bullet = 10, laser = 20, energy = 0, bomb = 0, bio = 0, rad = 0)
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//servitor robes

/obj/item/clothing/suit/servitor
	name = "servitor's robes"
	desc = "Shabby robes worn by a servitor unit."
	icon_state = "servitor_robe"
	item_state = "servitor_robe"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 0, bomb = 10, bio = 70, rad = 100) //ITS STEEL
	blood_overlay_type = "coat"
	canremove = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/servitor/janitor
	icon_state = "servitor_robe2"
	item_state = "servitor_robe2"
	armor = list(melee = 95, bullet = 95, laser = 95, energy = 0, bomb = 10, bio = 70, rad = 100) // it do be like that
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	canremove = 0

//ministorum priest
/obj/item/clothing/suit/ministorumrobes
	name = "ministorum robes"
	desc = "Gorgeous robes littered  with holy seals and writs. Smells faintly of incense. This one has been fitted with a special hidden armor plate for extra protection."
	icon_state = "ministorum_priest"
	item_state = "ministorum_priest"
	armor = list(melee = 25, bullet = 30, laser = 30, energy = 0, bomb = 10, bio = 5, rad = 5)
	body_parts_covered = UPPER_TORSO|ARMS|LEGS|LOWER_TORSO
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

//Undertaker
/obj/item/clothing/suit/child_coat
	name = "undertaker's coat"
	desc = "Fitted just for scavs."
	icon_state = "child_redcoat"
	armor = list(melee = 20, bullet = 60, laser = 60, energy = 0, bomb = 0, bio = 0, rad = 0) // too many kids getting shot. NO MOAR.
	can_be_worn_by_child = TRUE
	child_exclusive = TRUE

//Pilgrim clothes

/obj/item/clothing/suit/chokha
	name = "stalker's vest"
	desc = "A red hunters uniform"
	icon_state = "chokha"
	item_state = "chokha"
	armor = list(melee = 35, bullet = 35, laser = 25, energy = 0, bomb = 10, bio = 5, rad = 15) //hunter's suit
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/miner
	name = "miner's vest"
	desc = "A miner's vestaments"
	icon_state = "yminer"
	item_state = "yminer"
	armor = list(melee = 30, bullet = 20, laser = 15, energy = 0, bomb = 10, bio = 5, rad = 15)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/sherpa
	name = "sherpa's vest"
	desc = "A sherpa's vestaments"
	icon_state = "sherpa"
	item_state = "sherpa"
	armor = list(melee = 25, bullet = 25, laser = 15, energy = 0, bomb = 10, bio = 5, rad = 15)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/scum
	name = "shady jacket"
	desc = "A jacket that only the shadiest of characters would wear, this one has two light flak armor plates glued to it's internal pockets."
	icon_state = "scum"
	item_state = "scum"
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 0, bomb = 10, bio = 5, rad = 5)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/suit/prac_arpon
	name = "practioner robes"
	desc = "Worn by practioners and other surgoens."
	icon_state = "prac_robes"
	item_state = "prac_robes"
	armor = list(melee = 30, bullet = 30, laser = 15, energy = 0, bomb = 0, bio = 100, rad = 30)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/sistersuperiorsuit
	name = "sister hospitaller's suit"
	desc = "The holy garments marking the wearer as sister hospitaller"
	icon_state = "hospitaller"
	item_state = "hospitaller"
	armor = list(melee = 52, bullet = 62, laser = 58, energy = 45, bomb = 35, bio = 100, rad = 100)
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell,/obj/item/gun/energy/las/lasgun, /obj/item/storage/firstaid/adv) //i'll figure out what can go in here idk
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 40


/obj/item/clothing/suit/storage/sistersuit
	name = "sister discipulus's suit"
	desc = "The holy garments marking the wearer as a discipulus hospitaller"
	icon_state = "hospitallerold"
	item_state = "hospitallerold"
	armor = list(melee = 40, bullet = 40, laser = 30, energy = 25, bomb = 35, bio = 50, rad = 50)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 25

/obj/item/clothing/suit/storage/senkhalat
	name = "ornate khalat"
	desc = "The ornate khalat of the Steward. It is made from the finest fabrics this side of the galaxy and interwoven with real gold. Very fancy and well armored."
	icon_state = "senkhalat"
	item_state = "senkhalat"
	armor = list(melee = 42, bullet = 40, laser = 25, energy = 0, bomb = 50, bio = 15, rad = 15)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 40

/obj/item/clothing/suit/storage/traderpirate
	name = "rugged and regal trader coat"
	desc = "A rugged, regal, trader coat. It is dyed with the finest of dyes and made from durable and armored fabric. For when you need to plunder and pillage the galactic seas."
	icon_state = "traderpirate"
	item_state = "traderpirate"
	armor = list(melee = 45, bullet = 45, laser = 35, energy = 20, bomb = 40, bio = 15, rad = 15)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	sales_price = 30

/obj/item/clothing/suit/armor/vest/leather/tailcoat
	name = "tailcoat"
	desc = "A fancy tailcoat to make your suit seem even more lavish."
	icon_state = "tailcoat"
	item_state = "tailcoat"
	armor = list(MELEE = 20, BULLET = 20, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 0, FIRE = 20, ACID = 15)
//	pocket_storage_component_path = /datum/component/storage/concrete/pockets/tailcoat

/obj/item/clothing/suit/armor/vest/leather/tailcoat/ladycoat
	name = "lady coat"
	desc = "Fancy lady coat."
	icon = 'icons/mob/onmob/suit.dmi'
	icon_state = "tailcoatgirlblack"
	item_state = "tailcoatgirlblack"
	armor = list(MELEE = 15, BULLET = 10, LASER = 5, ENERGY = 5, BOMB = 15, BIO = 0, FIRE = 10, ACID = 5)

/obj/item/clothing/suit/armor/vest/leather/tailcoat/ladycoat/red
	icon_state = "tailcoatladiesred"
	item_state = "tailcoatladiesred"

/obj/item/clothing/suit/armor/vest/leather/tailcoat/black
	icon_state = "tailcoatb"
	item_state = "tailcoatb"

/obj/item/clothing/suit/armor/vest/leather/tailcoat/ladycoat/grey
	icon_state = "ladiesvictoriancoatg"
	item_state = "ladiesvictoriancoatg"
/*
/obj/item/clothing/suit/armor/vest/leather/tailcoat/ladiesvictoriancoat/black
	icon_state = "ladiesvictoriancoatb"
	item_state = "ladiesvictoriancoatb"
*/
