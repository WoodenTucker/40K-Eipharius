//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank/bartender
	desc = "It looks like it could use some more flair."
	name = "bartender's uniform"
	icon_state = "ba_suit"
	item_state = "ba_suit"
	worn_state = "ba_suit"

//Magistrates uniform. //Not in alphabetical order
/obj/item/clothing/under/rank/magistrate
	name = "commandant\'s uniform"
	desc = "Regal as you can afford."
	icon_state = "magistrate"
	worn_state = "magistrate"

/obj/item/clothing/under/rank/consort
	name = "consort\'s uniform"
	desc = "Regal enough to be the partner of the Commandant."
	icon_state = "consort"
	worn_state = "consort"

/obj/item/clothing/under/rank/consort/adept
	name = "noble\'s uniform"
	desc = "A drab grey outfit fit for a self-important noble."
	icon_state = "consort"
	worn_state = "consort"


/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon_state = "captain"
	item_state = "b_suit"
	worn_state = "captain"

/obj/item/clothing/under/rank/roguetrader
	desc = "It's a distinguished jumpsuit with a marvelous sash denoting the rankings of \"The Imperium's Chosen Few\"."
	name = "rogue apparel"
	icon_state = "rtc"
	item_state = "rtc"
	worn_state = "rtc"

/obj/item/clothing/under/rank/cargo
	name = "mechanicus bondsman jumpsuit"
	desc = "It's a jumpsuit worn by a mechanicus bondsman, signifying their life oath to the guild."
	icon_state = "qm"
	item_state = "lb_suit"
	worn_state = "qm"
	canremove = 0
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/under/rank/cargotech
	name = "cargo technician's jumpsuit"
	desc = "Shooooorts! They're comfy and easy to wear!"
	icon_state = "cargotech"
	item_state = "lb_suit"
	worn_state = "cargo"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/under/rank/chaplain
	desc = "It's a black jumpsuit, often worn by religious folk."
	name = "chaplain's jumpsuit"
	icon_state = "chaplain"
	item_state = "bl_suit"
	worn_state = "chapblack"


/obj/item/clothing/under/rank/chef
	desc = "A white apron, issued to the chefs of the grim darkness of far future."
	name = "chef's uniform"
	icon_state = "chef"
	item_state = "w_suit"
	worn_state = "chef"


/obj/item/clothing/under/rank/clown
	name = "clown suit"
	desc = "<i>'HONK!'</i>"
	icon_state = "clown"
	item_state = "clown"
	worn_state = "clown"


/obj/item/clothing/under/rank/head_of_personnel
	desc = "A fancy jumpsuit worn by someone who works in the position of Seneschal, the right-hand of the Rogue Trader."
	name = "seneschal's jumpsuit"
	icon_state = "arbiter"
	item_state = "arbiter"
	worn_state = "arbiter"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/head_of_personnel_whimsy
	desc = "A blue jacket and red tie, with matching red cuffs! Snazzy. Wearing this makes you feel more important than your job title does."
	name = "Seneschal's suit"
	icon_state = "heir"
	item_state = "heir"
	worn_state = "heir"

/obj/item/clothing/under/rank/seneschal
	desc = "A fancy jumpsuit worn by someone who works in the position of Seneschal, the right-hand of the Rogue Trader."
	name = "seneschal's jumpsuit"
	icon_state = "arbiter"
	item_state = "arbiter"
	worn_state = "arbiter"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/hydroponics
	desc = "Standard-issue green-and-blue jumpsuit designed to protect against minor plant-related hazards."
	name = "botanist's jumpsuit"
	icon_state = "hydroponics"
	item_state = "g_suit"
	worn_state = "hydroponics"
	permeability_coefficient = 0.50
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/internalaffairs
	desc = "The plain, professional attire of an Internal Affairs Agent. The collar is <i>immaculately</i> starched."
	name = "Internal Affairs uniform"
	icon_state = "internalaffairs"
	item_state = "ba_suit"
	worn_state = "internalaffairs"
	starting_accessories = list(/obj/item/clothing/accessory/black)

/obj/item/clothing/under/rank/principalagent
	desc = "A slick bodyglove, befitting of an agent of the Inquisition."
	name = "combat uniform"
	icon_state = "combat"
	item_state = "combat"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/inquisitor
	desc = "A slick bodyglove, befitting of an agent of the Inquisition."
	name = "combat uniform"
	icon_state = "assistant_formal"
	item_state = "assistant_formal"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/marshal
	desc = "A modified dress uniform made for the Planetary Marshall."
	name = "marshal's uniform"
	icon_state = "warden_corporate"
	//item_state = "warden_corporate"
	worn_state = "warden_corporate"

/obj/item/clothing/under/rank/internalaffairs/plain
	desc = "A plain shirt and pair of pressed black pants."
	name = "formal outfit"
	starting_accessories = null

/obj/item/clothing/under/rank/internalaffairs/plain/nt
	desc = "A plain shirt and pair of pressed black pants."
	name = "formal outfit"
	starting_accessories = list(/obj/item/clothing/accessory/red_long)


/obj/item/clothing/under/rank/janitor
	desc = "Standard-issue uniform of the janitor. It has minor protection from biohazards."
	name = "janitor's jumpsuit"
	icon_state = "janitor"
	worn_state = "janitor"
	item_state = "janitor"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/under/lawyer
	desc = "Slick threads."
	name = "Lawyer suit"


/obj/item/clothing/under/lawyer/black
	name = "black Lawyer suit"
	icon_state = "lawyer_black"
	item_state = "lawyer_black"
	worn_state = "lawyer_black"


/obj/item/clothing/under/lawyer/female
	name = "black Lawyer suit"
	icon_state = "black_suit_fem"
	item_state = "lawyer_black"
	worn_state = "black_suit_fem"


/obj/item/clothing/under/lawyer/red
	name = "red Lawyer suit"
	icon_state = "lawyer_red"
	item_state = "lawyer_red"
	worn_state = "lawyer_red"


/obj/item/clothing/under/lawyer/blue
	name = "blue Lawyer suit"
	icon_state = "lawyer_blue"
	item_state = "lawyer_blue"
	worn_state = "lawyer_blue"


/obj/item/clothing/under/lawyer/bluesuit
	name = "Blue Suit"
	desc = "A classy suit."
	icon_state = "bluesuit"
	item_state = "ba_suit"
	worn_state = "bluesuit"
	starting_accessories = list(/obj/item/clothing/accessory/red)


/obj/item/clothing/under/lawyer/purpsuit
	name = "Purple Suit"
	icon_state = "lawyer_purp"
	item_state = "ba_suit"
	worn_state = "lawyer_purp"

/obj/item/clothing/under/lawyer/oldman
	name = "old man's Suit"
	desc = "A classic suit for the older gentleman with built-in back support."
	icon_state = "oldman"
	item_state = "johnny"
	worn_state = "oldman"


/obj/item/clothing/under/librarian
	name = "sensible suit"
	desc = "It's very... sensible."
	icon_state = "red_suit"
	item_state = "lawyer_red"
	worn_state = "red_suit"

/obj/item/clothing/under/mime
	name = "mime's outfit"
	desc = "It's not very colourful."
	icon_state = "mime"
	item_state = "ba_suit"
	worn_state = "mime"

/obj/item/clothing/under/rank/miner
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	name = "shaft miner's jumpsuit"
	icon_state = "miner"
	item_state = "lb_suit"
	worn_state = "miner"

/obj/item/clothing/under/rank/explorer
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	name = "salvage miner's jumpsuit"
	icon_state = "explorer"
	item_state = "lb_suit"
	worn_state = "explorer"

//pilgrim stuff
/obj/item/clothing/under/rank/penitent
	desc = "A simple jumpsuit, usually worn by poorest citizens of the Imperium of Man."
	name = "simple jumpsuit"
	icon_state = "jumpsuitdown"
	item_state = "jumpsuitdown"
	worn_state = "jumpsuitdown"


/obj/item/clothing/under/rank/kroot
	desc = "Tattered and torn from a life of battle and strife."
	name = "kroot robes"
	icon_state = "scoutoutfit"
	item_state = "scoutoutfit"
	worn_state = "scoutoutfit"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 25, bomb = 30, bio = 30, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/skitarii
	desc = "Heavily-augmented body, reinforced to fit the Mechanicus purposes."
	name = "skitarii body"
	icon_state = "skit"
	item_state = "skit"
	worn_state = "skit"
	canremove = 0
	unacidable = 1
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 25, bomb = 30, bio = 30, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/ork // only using this one atm
	desc = "Tattered and torn from a life of battle and strife."
	name = "ork rags"
	icon_state = "ork_clothes"
	item_state = "ork_clothes"
	worn_state = "ork_clothes"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 25, bomb = 30, bio = 30, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/ork/two
	icon_state = "orkpants"
	item_state = "orkpants"
	worn_state = "orkpants"

/obj/item/clothing/under/rank/ork/three
	icon_state = "squighide"
	item_state = "squighide"
	worn_state = "squighide"

/obj/item/clothing/under/child_jumpsuit/warfare
	name = "scavengers's clothing"
	desc = "A proper uniform worn by child scavengers."
	icon_state = "urchin"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS//So they don't freeze to death with their clothes on.
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/under/rank/victorian
	name = "casual uniform"
	desc = "Casual..."
//	has_sensor = SUIT_NO_SENSORS
	icon_state = "vest"
	item_state = "vest"
	worn_state = "vest"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/victorian/blred
	icon_state = "vestblred"
	item_state = "vestblred"
	worn_state = "vestblred"

/obj/item/clothing/under/rank/victorian/redbl
	icon_state = "vestredbl"
	item_state = "vestredbl"
	worn_state = "vestredbl"

/obj/item/clothing/under/rank/victorian/grey
	icon_state = "vestg"
	item_state = "vestg"
	worn_state = "vestg"

/obj/item/clothing/under/rank/victorian/black
	icon_state = "vestb"
	item_state = "vestb"
	worn_state = "vestb"

/obj/item/clothing/under/rank/victorian/blackdress
	icon_state = "blackdress"
	name = "fancy dress"
	desc = "Casual and fancy"
	item_state = "blackdress"
	worn_state = "blackdress"

/obj/item/clothing/under/rank/victorian/reddress
	icon_state = "reddress"
	name = "fancy dress"
	desc = "Casual and fancy"
	item_state = "reddress"
	worn_state = "reddress"