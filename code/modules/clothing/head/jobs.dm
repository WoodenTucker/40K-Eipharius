
//Bartender
/obj/item/clothing/head/chefhat
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"


//Magistrate
/obj/item/clothing/head/crown
	name = "commandant's hat of authority"
	icon_state = "redoffcap"
	item_state = "redoffcap"
	desc = "It's good being Commandant."
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD
	unacidable = TRUE //Do NOT want to lose this randomly.

//Captain
/obj/item/clothing/head/caphat
	name = "captain's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

//HOP
/obj/item/clothing/head/caphat/hop
	name = "crew resource's hat"
	desc = "A stylish hat that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"

//Chaplain
/obj/item/clothing/head/chaplain_hood
	name = "chaplain's hood"
	desc = "It's hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Chaplain
/obj/item/clothing/head/nun_hood
	name = "nun hood"
	desc = "Maximum piety in this star system."
	icon_state = "nun_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Medical
/obj/item/clothing/head/surgery
	name = "surgical cap"
	desc = "A cap surgeons wear during operations. Keeps their hair from tickling your internal organs."
	icon_state = "surgcap"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/surgery/purple
	name = "purple surgical cap"
	color = "#7a1b3f"

/obj/item/clothing/head/surgery/blue
	name = "blue surgical cap"
	color = "#4891e1"

/obj/item/clothing/head/surgery/green
	name = "green surgical cap"
	color = "#255a3e"

/obj/item/clothing/head/surgery/black
	name = "black surgical cap"
	color = "#242424"

/obj/item/clothing/head/surgery/navyblue
	name = "navy blue surgical cap"
	color = "#1f3a69"

/obj/item/clothing/head/surgery/lilac
	name = "lilac surgical cap"
	color = "#c8a2c8"

/obj/item/clothing/head/surgery/teal
	name = "teal surgical cap"
	color = "#008080"

/obj/item/clothing/head/surgery/heliodor
	name = "heliodor surgical cap"
	color = "#aad539"

//Berets
/obj/item/clothing/head/beret
	name = "beret"
	desc = "A beret, an artists favorite headwear."
	icon_state = "beret"
	body_parts_covered = 0

/obj/item/clothing/head/beret/sec
	name = "corporate security beret"
	desc = "A beret with the security insignia emblazoned on it. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_red"

/obj/item/clothing/head/beret/sec/navy/officer
	name = "corporate security officer beret"
	desc = "A navy blue beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_officer"

/obj/item/clothing/head/beret/sec/navy/hos
	name = "corporate security commander beret"
	desc = "A navy blue beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_hos"

/obj/item/clothing/head/beret/sec/navy/warden
	name = "corporate security warden beret"
	desc = "A navy blue beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy_warden"

/obj/item/clothing/head/beret/sec/corporate/officer
	name = "corporate security officer beret"
	desc = "A corporate black beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_officer"

/obj/item/clothing/head/beret/sec/corporate/hos
	name = "corporate security commander beret"
	desc = "A corporate black beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_hos"

/obj/item/clothing/head/beret/sec/corporate/warden
	name = "corporate security warden beret"
	desc = "A corporate black beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	icon_state = "beret_corporate_warden"

/obj/item/clothing/head/beret/engineering
	name = "corporate engineering beret"
	desc = "A beret with the engineering insignia emblazoned on it. For engineers that are more inclined towards style than safety."
	icon_state = "beret_orange"

/obj/item/clothing/head/beret/purple
	name = "purple beret"
	desc = "A stylish, if purple, beret. For personnel that are more inclined towards style than safety."
	icon_state = "beret_purple"

/obj/item/clothing/head/beret/centcom/officer
	name = "asset protection beret"
	desc = "A navy blue beret adorned with the crest of corporate asset protection. For asset protection agents that are more inclined towards style than safety."
	icon_state = "beret_corporate_navy"

/obj/item/clothing/head/beret/centcom/captain
	name = "asset protection command beret"
	desc = "A white beret adorned with the crest of corporate asset protection. For asset protection leaders that are more inclined towards style than safety."
	icon_state = "beret_corporate_white"

/obj/item/clothing/head/beret/deathsquad
	name = "heavy asset protection beret"
	desc = "An armored red beret adorned with the crest of corporate asset protection. Doesn't sacrifice style or safety."
	icon_state = "beret_red"
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 20, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/head/beret/guard
	name = "corporate security beret"
	desc = "A white beret adorned with the crest of NanoTrasen. For security guards that are more inclined towards style than safety."
	icon_state = "beret_corporate_whitered"

/obj/item/clothing/head/beret/plaincolor
	name = "beret"
	desc = "A simple, solid color beret. This one has no emblems or insignia on it."
	icon_state = "beret_white"

// NEW HELMETS
/obj/item/clothing/head/helmet/salvage
	name = "Reinforced Salvage Helmet"
	desc = "An old salvage helmet reinforced with metal plates."
	icon_state = "eva_rig"
	item_state = "eva_rig"
	armor = list(melee = 35, bullet = 35, laser = 25, energy = 30, bomb = 20, bio = 10, rad = 20)

/obj/item/clothing/head/helmet/mining
	name = "Reinforced Mining Helmet"
	desc = "A reinforced mining helmet designed to protect the face from blunt force trauma - particularly from falling rock and debris."
	icon_state = "rig0-ancient"
	item_state = "rig0-ancient"
	armor = list(melee = 40, bullet = 35, laser = 30, energy = 30, bomb = 30, bio = 10, rad = 30)

// Astra Militarum Stuff

/obj/item/clothing/head/helmet/guardhelmet/marshal
	name = "Marshal's Helmet"
	desc = "The Marshal's Helmet, an upgraded version of the standard Patrol helmet, are issued to local planetary marshall's both to show rank and for intimidation, It is painted in black with red markings."
	icon_state = "deathsquad"
	item_state = "deathsquad"
	armor = list(melee = 44, bullet = 55, laser = 45, energy = 35, bomb = 35, bio = 50, rad = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/enforcer
	name = "Magistratum Enforcer Helmet"
	desc = "The Enforcer Helmet, based on the Cadian-pattern helmet, are issued to local planetary enforcers against criminals of the Imperium, It is painted in a dark blue colour."
	icon_state = "Jhelm2"
	item_state = "Jhelm2"
	armor = list(melee = 38, bullet = 40, laser = 40, energy = 35, bomb = 10, bio = 10, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/patrol
	name = "Enforcer Cap"
	desc = "A patrol cap worn by Messina Enforcers."
	icon_state = "enforcerhat"
	item_state = "enforcerhat"
	armor = list(melee = 35, bullet = 38, laser = 38, energy = 30, bomb = 25, bio = 25, rad = 10) // Lucky Hat.
	siemens_coefficient = 0.6
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/mordian
	name = "Mordian Cap"
	desc = "A patrol cap worn by Mordian Iron Guardsman."
	icon_state = "enforcerhat"
	item_state = "enforcerhat"
	armor = list(melee = 30, bullet = 40, laser = 40, energy = 30, bomb = 25, bio = 25, rad = 10) // Lucky Hat.
	siemens_coefficient = 0.6
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator
	name = "Magistratum Arbitrator Helmet"
	desc = "The Arbitrator Helmet, an upgraded version of the standard Patrol helmet, are issued to local planetary enforcer Arbitrator's both to show rank and for intimidation, It is painted in a dark blue colour."
	icon_state = "Jhelm2"
	item_state = "Jhelm2"
	armor = list(melee = 38, bullet = 54, laser = 42, energy = 35, bomb = 20, bio = 50, rad = 50)

//blood pact here for now
/obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator/bloodpact1
	name = "Chosen Combat Helmet"
	desc = "Armored helmet of the ruinous powers."
	icon_state = "vraks2"
	item_state = "vraks2"
	armor = list(melee = 38, bullet = 44, laser = 39, energy = 35, bomb = 20, bio = 50, rad = 50)

/obj/item/clothing/head/helmet/guardhelmet/enforcer/arbitrator/bloodpact2
	name = "Chosen Combat Helmet"
	desc = "Armored helmet of a chaos cultist."
	icon_state = "vraks3"
	item_state = "vraks3"
	armor = list(melee = 38, bullet = 44, laser = 39, energy = 35, bomb = 20, bio = 50, rad = 50)

/obj/item/clothing/head/helmet/guardhelmet
	name = "Cadian Pattern Flak Helmet"
	desc = "The most common pattern within in the Atra Militarum, Found throughout Imperial Space, The Cadian Flak Helmet are cheap and easy to produce, at the cost of being nothing but a glorified bucket. This one has the Imperial Aquila engraved on it's forehead."
	icon_state = "guard"
	item_state = "guard"
	armor = list(melee = 30, bullet = 39, laser = 35, energy = 35, bomb = 30, bio = 10, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/mechanicus
	name = "Mechanicus Flak Helmet"
	armor = list(melee = 36, bullet = 41, laser = 31, energy = 45, bomb = 40, bio = 10, rad = 20)

/obj/item/clothing/head/helmet/guardhelmet/carapace
	name = "Carapace Helmet"
	desc = "A tough carapace helmet."
	armor = list(melee = 40, bullet = 45, laser = 35, energy = 35, bomb = 30, bio = 10, rad = 10)

/obj/item/clothing/head/helmet/medicae
	name = "Cadian Pattern Medicae Flak Helmet"
	desc = "The most common pattern within in the Atra Militarum, Found throughout Imperial Space, The Cadian Flak Helmet are cheap and easy to produce, at the cost of being nothing but a glorified bucket. This one has the red Cross Emblem engraved on it forehead."
	icon_state = "medicae"
	item_state = "medicae"

/obj/item/clothing/head/helmet/whiteshield
	name = "Cadian Pattern Whiteshield Flak Helmet"
	desc = "The most common pattern within in the Atra Militarum, Found throughout Imperial Space, The Cadian Flak Helmet are cheap and easy to produce, at the cost of being nothing but a glorified bucket. This one has the white stripe painted on it, marking it's owner as a Cadian Whiteshield."
	icon_state = "wshield"
	item_state = "wshield"
	armor = list(melee = 30, bullet = 35, laser = 25, energy = 35, bomb = 30, bio = 0, rad = 10)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/guardhelmet/sargecap
	name = "Cadian Pattern Sergeant's Cap"
	desc = "Often mistaken for a soft cap, this variation features armor that comes down to protect the face, as well as a vox piece to slide over your ear. Perfect for Senior Enlisted."
	icon_state = "sarge_cap"
	item_state = "sarge_cap"

/obj/item/clothing/head/helmet/krieghelmet
	name = "Krieg Mark IX Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production."
	icon_state = "krieghelm"
	item_state = "krieghelm"
	armor = list(melee = 32, bullet = 34, laser = 37, energy = 35, bomb = 32, bio = 80, rad = 80)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/krieghelmet/sgt
	name = "Krieg Watchmaster Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production."
	icon_state = "WatchHelm"
	item_state = "WatchHelm"
	armor = list(melee = 37, bullet = 42, laser = 42, energy = 35, bomb = 32, bio = 80, rad = 80)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/krieghelmet/grenadier
	name = "Krieg Mark IX/G Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production. This one has a decorated ceramite plate layered on top."
	icon_state = "grenhelm"
	item_state = "grenhelm"
	armor = list(melee = 42, bullet = 55, laser = 46, energy = 35, bomb = 42, bio = 80, rad = 80)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/head/helmet/krieghelmet/medicae
	name = "Krieg Mark IX/M Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production. This one has the red markings of a Combat Medicae."
	icon_state = "mkrieghelm"
	item_state = "mkrieghelm"

/obj/item/clothing/head/valushanka
	name = "Valhallan Ushanka"
	desc = "The Ushanka worn by Valhallan Regiment, smells of piss, amasec and sweat. You shouldn't touches it if you're not Valhallan."
	icon_state = "valshanka2"
	var/icon_state_up = "valshanka"
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 35, bullet = 38, laser = 38, energy = 35, bomb = 30, bio = 0, rad = 30)

/obj/item/clothing/head/valushanka/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_up
		to_chat(user, "You raise the ear flaps on the ushanka.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You lower the ear flaps on the ushanka.")

/obj/item/clothing/head/valushanka/medicae
	name = "Valhallan Medicae Ushanka"
	desc = "The Ushanka worn by Valhallan Regiment, smells of piss, amasec and sweat. You shouldn't touches it if you're not Valhallan. This one bears the red markings of a Combat Medicae."
	icon_state = "mvalshanka2"
	icon_state_up = "mvalshanka"

/obj/item/clothing/head/valushanka/medicae/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_up
		to_chat(user, "You raise the ear flaps on the ushanka.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You lower the ear flaps on the ushanka.")

/obj/item/clothing/head/catachan
	name = "Catachan Headband"
	desc = "Catachan Regiment refuses to acknowledge any sort of protection in favour of their mentality and physical capabilties, Thus. The iconic red headband go with them anywhere they go.. But does it protects them from Bolters or lasguns? No."
	icon_state = "Catachan_Headband"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 50, bullet = 35, laser = 35, energy = 35, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/catachan/medicae
	name = "Catachan Medicae Headband"
	desc = "Catachan Regiment refuses to acknowledge any sort of protection in favour of their mentality and physical capabilties, Thus. The iconic red headband go with them anywhere they go.. But does it protects them from Bolters or lasguns? No. This headband is worn by a Catachan Medicae."
	icon_state = "mCatachan_Headband"

/obj/item/clothing/head/commissar
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Imperial Guard Commissar, Striking dreads to the lowly Guardsmen and the ever-watching heretics."
	icon_state = "Commissar4Hat"
	item_state = "Commissar4Hat"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/commissar/krieg
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Imperial Guard Commissar, Striking dreads to the lowly Guardsmen and the ever-watching heretics."
	icon_state = "KriegissarHat"
	item_state = "KriegissarHat"
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/commissar/catachan
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Imperial Guard Commissar, Striking dreads to the lowly Guardsmen and the ever-watching heretics."
	icon_state = "CataCommissarHat"
	item_state = "CataCommissarHat"
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 15, bomb = 10, bio = 0, rad = 0)

// Administratum Stuff

/obj/item/clothing/head/commissar/adept
	name = "Adept's Cap"
	desc = "This cap belongs to a member of the Administratum."
	icon_state = "captain_hat"
	item_state = "captain_hat"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

// The Civilian Stuff

/obj/item/clothing/head/plebhood
	name = "pleb hood"
	desc = "A disgusting hood covering a disgusting head"
	icon_state = "plebhood"
	item_state = "plebhood"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/bardhat
	name = "bard's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "bardhat"
	item_state = "bardhat"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/admemehat
	name = "admin's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "admeme"
	item_state = "admeme"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/musichat
	name = "bard's hat"
	desc = "A fairly nice leather hat with a feather tucked into it."
	icon_state = "obard"
	item_state = "obard"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/smokingcap
	name = "smoking cap"
	desc = "A fancy smoking cap with golden tassle."
	icon_state = "smokingc"
	item_state = "smokingc"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/pillbox
	name = "pillbox hat"
	desc = "A proper smerd hat"
	icon_state = "pillbox"
	item_state = "pillbox"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/bighat
	name = "a big hat"
	desc = "A large, imposing hat."
	icon_state = "bighat"
	item_state = "bighat"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/spookyhood
	name = "a spooky hood"
	desc = "A menacing hood"
	icon_state = "keeper"
	item_state = "keeper"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 5, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/prac_cap
	name = "practioner cap"
	desc = "Wouldn't want your hair to get messy now would we."
	icon_state = "prac_cap"
	item_state = "prac_cap"
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/ushanka2
	name = "ushanka"
	desc = "A proper hat for one willing to brave the tundra."
	icon_state = "ushanka"
	item_state = "ushanka"
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/scum
	name = "pimp hat"
	desc = "Pretty fly for a space guy."
	icon_state = "scum"
	item_state = "scum"

/obj/item/clothing/head/bountyhead
	name = "bounty hunter\'s helm"
	desc = "A well worn and dented helm."
	icon_state = "skullopen"
	item_state = "skullopen"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = BLOCKHAIR
	armor = list(melee = 35, bullet = 35, laser = 30, energy = 15, bomb = 10, bio = 10, rad = 15)

/obj/item/clothing/head/senturban
	name = "ornate turban"
	desc = "A turban woven from the finest of fabrics, plucked from the very depths of whatever vault your Trader may or may not have robbed. Fit for a king, or in this case a Seneschal."
	icon_state = "senturban"
	item_state = "senturban"
	cold_protection = HEAD
	flags_inv = BLOCKHEADHAIR

// Servitor Stuff

/obj/item/clothing/head/servitorhead
	name = "a servitor skull"
	desc = "A bone white skull littered with wiring and augments."
	icon_state = "servitor_helmet"
	item_state = "servitor_helmet"
	canremove = 0
	armor = list(melee = 55, bullet = 55, laser = 50, energy = 15, bomb = 10, bio = 10, rad = 15)

/obj/item/clothing/head/servitorhead/janitor
	icon_state = "servitor_helmet2"
	item_state = "servitor_helmet2"

// The Governor Stuff

/obj/item/clothing/head/rt
	name = "rogue trader's cap"
	desc = "A fanciful hat fitting a wealthy Rogue Trader."
	icon_state = "fancyhat"
	item_state = "fancyhat"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 15, bomb = 10, bio = 0, rad = 0)
	sales_price = 10

/obj/item/clothing/head/rtpimp
	name = "rogue trader's big cap"
	desc = "A fanciful hat fitting a wealthy Rogue Trader."
	icon_state = "rtpimp"
	item_state = "bighat"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 15, bomb = 10, bio = 0, rad = 0)
	sales_price = 10

/obj/item/clothing/head/caphat/formal
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"

/obj/item/clothing/head/caphat/cap
	name = "rogue trader's hat"
	desc = "The wonderfully fancy hat of a wealthy Rogue Trader."
	icon_state = "capcap"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 15, bomb = 10, bio = 0, rad = 0)
	sales_price = 10

/obj/item/clothing/head/tradertricorn
	name = "fanciful tricorn"
	desc = " A fanciful, slightly armored, tricorn sold to the Rogue Trader by a back-alley xeno on Ithaka. Legend says it was worn by the Chapter Master of the Iron Snakes before he lost it in a battle with an ancient kraretyer, or perhaps that was just a sales pitch."
	icon_state = "tradertricorn"
	item_state = "tradertricorn"
	cold_protection = HEAD
	armor = list(melee = 20, bullet = 25, laser = 25,energy = 15)
	sales_price = 15

// The Senechal Stuff

/obj/item/clothing/head/seneschal
	name = "seneschal's cap"
	desc = "This hat is the mark of the right-hand of a Rogue Trader. He handles business while the Trader is otherwise occupied."
	icon_state = "chaperon"
	item_state = "chaperon"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 15, bomb = 10, bio = 0, rad = 0)
	sales_price = 10

// Inquisition Stuff

/obj/item/clothing/head/cerberus
	name = "Hound Helm"
	desc = "A helmet for the Inquisition's hunting hound."
	icon_state = "cerberus"
	item_state = "cerberus"

/obj/item/clothing/head/inqhelm
	name = "Inquisition Acolyte Helmet"
	desc = "An helmet issued to members of an Inquisitor's Retinue. Likely newly recruited ones."
	icon_state = "inq_helm"
	item_state = "inq_helm"
	armor = list(melee = 40, bullet = 40, laser = 35, energy = 20, bomb = 30, bio = 10, rad = 10)
	siemens_coefficient = 0.9
	sales_price = 0

/obj/item/clothing/head/inqhelm/rare
	name = "Inquisition Shrouded Helmet"
	desc = "An helmet issued to members of the Inquisition. General all rounder in defence."
	icon_state = "ihhelmet"
	item_state = "ihhelmet"
	armor = list(melee = 40, bullet = 45, laser = 40, energy = 20, bomb = 30, bio = 10, rad = 10)
	siemens_coefficient = 0.9
	sales_price = 0

/obj/item/clothing/head/inqhelm/stealth
	name = "Inquisition Stealth Helmet"
	desc = "An helmet issued to members of the Vindicare Temple. Poor melee defence."
	icon_state = "stealth_rig_sealed"
	item_state = "stealth_rig_sealed"
	armor = list(melee = 30, bullet = 50, laser = 50, energy = 20, bomb = 30, bio = 10, rad = 10)
	siemens_coefficient = 0.9
	sales_price = 0

/obj/item/clothing/head/ordohereticus
 	name = "Inquisition Holy Hat"
 	desc = "An hat issued to Ordo Hereticus Inquisitor's. Don't expect it to deflect a sword."
 	icon_state = "hereticushat"
 	item_state = "hereticushat"
 	cold_protection = HEAD
 	armor = list (melee = 35, bullet = 50, laser = 45, energy = 30, bomb = 40, bio = 20, rad = 20)
 	sales_price = 0

// Ministorum and soroitas

/obj/item/clothing/head/helmet/sisterofbattle
	name = "Order of the Sacred Rose Power Helmet"
	desc = "An helmet issued to the Battle Sister of the Adepta Sororitas Militant Wing, This one bears the Sigil of the Order of The Sacred Rose, If you looks closely, you can see it's omits holy power, making you feels safer and secure.</i>"
	icon_state = "sister"
	item_state = "sister"
	armor = list(melee = 65, bullet = 65, laser = 55, energy = 40, bomb = 40, bio = 0, rad = 40)
	sales_price = 20

/obj/item/clothing/head/helmet/sisterofbattle/repentia
	name = "Cowl of the Repentia"
	desc = "The gloomy cowl of a penitent sister of battle. It is covered in faded bloodstains and worn at the edges. This one has a purity seal and the mark of the Holy Inquisition."
	icon_state = "repentia_hood"
	item_state = "repentia_hood"
	armor = list(melee = 45, bullet = 35, laser = 35, energy = 40, bomb = 40, bio = 0, rad = 40)
	flags_inv = HIDEMASK|HIDEEARS|BLOCKHAIR
	sales_price = 20

/obj/item/clothing/head/helmet/sisterofbattle/mlsister
	name = "Order of Our Martyred Lady Power Helmet"
	desc = "An helmet issued to the Sisters of Battle. This one bears the Sigil of the Order of Our Martyred Lady. Somehow you can feel His influence radiating from it, warm like sunshine.</i>"
	icon_state = "mlsister"
	item_state = "mlsister"
	armor = list(melee = 65, bullet = 65, laser = 55, energy = 40, bomb = 40, bio = 0, rad = 40)
	sales_price = 20

/obj/item/clothing/head/helmet/sisterofbattle/brsister
	name = "Order of the Bloody Rose Power Helmet"
	desc = "A power armor helmet belonging to a sister of battle. This one is marked with the colors of the Order of the Bloody Rose.</i>"
	icon_state = "brsister"
	item_state = "brsister"
	armor = list(melee = 65, bullet = 65, laser = 55, energy = 40, bomb = 40, bio = 0, rad = 40)
	sales_price = 20

/obj/item/clothing/head/preacher
	name = "Preacher's Crown"
	desc = "The loud and proud crown of a Preacher of the ecclesiarchy. Try not to get lynched by the person wearing this by holy fervour!"
	icon_state = "preacherhat"
	item_state = "preacherhat"
	armor = list(melee = 30, bullet = 20, laser = 15, energy = 15, bomb = 10, bio = 0, rad = 0)
	sales_price = 1

// cultists, pilgrims ect

/obj/item/clothing/head/heretichood
	name = "cultist hood"
	desc = "A filth hood rag"
	icon_state = "hood1"
	item_state = "hood1"
	armor = list(melee = 35, bullet = 33, laser = 35, energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/heretichood/alt
	icon_state = "hood2"
	item_state = "hood2"

/obj/item/clothing/head/heretichood/alt2
	icon_state = "hood3"
	item_state = "hood3"

/obj/item/clothing/head/helmet/culthelm
	name = "Scrap helmet"
	desc = "Helmet made of some metal scrap in cheap forge"
	icon_state = "vraks1"
	icon_state = "vraks1"
	armor = list(melee = 30, bullet = 35, laser = 45, energy = 35, bomb = 30, bio = 0, rad = 10)
	flags_inv = HIDEEARS|BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/helmet/culthelm/alt
	icon_state = "vraks2"
	icon_state = "vraks2"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|EYES

/obj/item/clothing/head/helmet/culthelm/alt2
	icon_state = "vraks3"
	icon_state = "vraks3"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/helmet/culthelm/gas
	name = "renegade militia mask"
	desc = "Protects the head somewhat but the filter seems to be broken in the mask. Don't storm the trenches without it!"
	icon_state = "renegade_militia_mask"
	item_state = "renegade_militia_mask"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|EYES|HEAD
	w_class = ITEM_SIZE_NORMAL

/obj/item/clothing/head/servicesgt
 	name = "Cadian Sergeant's Service Cap"
 	desc = "A Cadian issue sergeant's service cap."
 	icon_state = "sgt_cap"
 	item_state = "sgt_cap"
 	cold_protection = HEAD
 	sales_price = 8

/obj/item/clothing/head/serviceguard
 	name = "Cadian Guard Service Cap"
 	desc = "An enlisted Cadian service cap"
 	icon_state = "guard_cap"
 	item_state = "guard_cap"
 	cold_protection = HEAD
 	sales_price = 5
/obj/item/clothing/head/helmet/prince
	name = "Prince's Helm"
	desc = "The Exquisite Helm of the Border Prince"
	icon_state = "prince"
	item_state = "prince"
	armor = list(melee = 55, bullet = 55, laser = 35, energy = 40, bomb = 40, bio = 0, rad = 40)
	flags_inv = HIDEMASK|HIDEEARS|BLOCKHAIR
	sales_price = 10
