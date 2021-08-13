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
	name = "adept\'s uniform"
	desc = "A drab grey uniform fit for a self-important pencil pusher."
	icon_state = "consort"
	worn_state = "consort"


/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon_state = "captain"
	item_state = "b_suit"
	worn_state = "captain"

/obj/item/clothing/under/rank/roguetrader
	desc = "It's a distinguished jumpsuit with a marvelous sash denoting the rank of \"Rogue Trader\"."
	name = "Rogue Trader's jumpsuit"
	icon_state = "magistrate"
	item_state = "magistrate"
	worn_state = "magistrate"

/obj/item/clothing/under/rank/cargo
	name = "quartermaster's jumpsuit"
	desc = "It's a jumpsuit worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm"
	item_state = "lb_suit"
	worn_state = "qm"
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
	desc = "It's an apron which is given only to the most <b>hardcore</b> chefs in space."
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
	desc = "It's a jumpsuit worn by someone who works in the position of \"Seneschal\"."
	name = "Seneschal's jumpsuit"
	icon_state = "hop"
	item_state = "b_suit"
	worn_state = "hop"

/obj/item/clothing/under/rank/head_of_personnel_whimsy
	desc = "A blue jacket and red tie, with matching red cuffs! Snazzy. Wearing this makes you feel more important than your job title does."
	name = "Seneschal's suit"
	icon_state = "heir"
	item_state = "heir"
	worn_state = "heir"

/obj/item/clothing/under/rank/seneschal
	desc = "It's a jumpsuit worn by someone who works in the position of \"Seneschal\", the right-hand of the Rogue Trader."
	name = "seneschal's jumpsuit"
	icon_state = "arbiter"
	item_state = "arbiter"
	worn_state = "arbiter"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/hydroponics
	desc = "It's a jumpsuit designed to protect against minor plant-related hazards."
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
	desc = "A slick bodyglove befitting of an agent of the Inquisition"
	name = "principal agent's bodyglove"
	icon_state = "combat"
	item_state = "combat"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE


/obj/item/clothing/under/rank/inquisitor
	desc = "A slick bodyglove befitting of an agent of the Inquisition"
	name = "inquisitor's bodyglove"
	icon_state = "assistant_formal"
	item_state = "assistant_formal"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown_general = -20

/obj/item/clothing/under/rank/internalaffairs/plain
	desc = "A plain shirt and pair of pressed black pants."
	name = "formal outfit"
	starting_accessories = null

/obj/item/clothing/under/rank/internalaffairs/plain/nt
	desc = "A plain shirt and pair of pressed black pants."
	name = "formal outfit"
	starting_accessories = list(/obj/item/clothing/accessory/red_long)


/obj/item/clothing/under/rank/janitor
	desc = "It's the official uniform of the janitor. It has minor protection from biohazards."
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
	name = "Old Man's Suit"
	desc = "A classic suit for the older gentleman with built in back support."
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
	desc = "A simple jumpsuit"
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
	desc = "Tattered and torn from a life of battle and strife."
	name = "skitarri body"
	icon_state = "skit"
	item_state = "skit"
	worn_state = "skit"
	canremove = 0
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 25, bomb = 30, bio = 30, rad = 10)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/ork
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