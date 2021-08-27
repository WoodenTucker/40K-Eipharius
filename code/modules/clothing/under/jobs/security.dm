/obj/item/clothing/under/rank/warden
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for more robust protection. It has the word \"Warden\" written on the shoulders."
	name = "warden's jumpsuit"
	icon_state = "warden"
	item_state = "r_suit"
	worn_state = "warden"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/head/warden
	name = "warden's hat"
	desc = "It's a special helmet issued to the Warden of a securiy force."
	icon_state = "policehelm"
	body_parts_covered = 0

/obj/item/clothing/under/rank/security
	name = "security officer's jumpsuit"
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection."
	icon_state = "security"
	item_state = "r_suit"
	worn_state = "secred"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/dispatch
	name = "dispatcher's uniform"
	desc = "A dress shirt and khakis with a security patch sewn on."
	icon_state = "dispatch"
	//item_state = "dispatch"
	worn_state = "dispatch"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security2
	name = "security officer's uniform"
	desc = "It's made of a slightly sturdier material, to allow for robust protection."
	icon_state = "redshirt2"
	item_state = "r_suit"
	worn_state = "redshirt2"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/security/corp
	icon_state = "sec_corporate"
	//item_state = "sec_corporate"
	worn_state = "sec_corporate"

/obj/item/clothing/under/rank/warden/corp
	icon_state = "warden_corporate"
	//item_state = "warden_corporate"
	worn_state = "warden_corporate"

/obj/item/clothing/under/tactical
	name = "tactical jumpsuit"
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection."
	icon_state = "swatunder"
	//item_state = "swatunder"
	worn_state = "swatunder"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/det
	name = "detective's suit"
	desc = "A rumpled white dress shirt paired with well-worn grey slacks."
	icon_state = "detective"
	item_state = "det"
	worn_state = "detective"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	starting_accessories = list(/obj/item/clothing/accessory/blue_clip)

/obj/item/clothing/under/det/grey
	icon_state = "detective2"
	worn_state = "detective2"
	desc = "A serious-looking tan dress shirt paired with freshly-pressed black slacks."
	starting_accessories = list(/obj/item/clothing/accessory/red_long)

/obj/item/clothing/under/det/black
	icon_state = "detective3"
	worn_state = "detective3"
	item_state = "sl_suit"
	desc = "An immaculate white dress shirt, paired with a pair of dark grey dress pants, a red tie, and a charcoal vest."
	starting_accessories = list(/obj/item/clothing/accessory/red_long, /obj/item/clothing/accessory/toggleable/vest)

/obj/item/clothing/head/det
	name = "fedora"
	desc = "A brown fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."
	icon_state = "detective"
	item_state_slots = list(
		slot_l_hand_str = "det_hat",
		slot_r_hand_str = "det_hat",
		)
	armor = list(melee = 50, bullet = 5, laser = 25,energy = 10, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/det/attack_self(mob/user)
	flags_inv ^= BLOCKHEADHAIR
	to_chat(user, "<span class='notice'>[src] will now [flags_inv & BLOCKHEADHAIR ? "hide" : "show"] hair.</span>")
	..()

/obj/item/clothing/head/det/grey
	icon_state = "detective2"
	desc = "A grey fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."

/obj/item/clothing/under/rank/head_of_security
	desc = "It's a jumpsuit worn by those few with the dedication to achieve the position of \"Commissar\". It has additional armor to protect the wearer."
	name = "Commissar's jumpsuit"
	icon_state = "hos"
	item_state = "r_suit"
	worn_state = "hosred"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/head_of_security/corp
	icon_state = "hos_corporate"
	//item_state = "hos_corporate"
	worn_state = "hos_corporate"

/obj/item/clothing/head/HoS
	name = "Commissar Hat"
	desc = "The hat of the Commissar. For showing the officers who's in charge."
	icon_state = "hoscap"
	body_parts_covered = 0
	siemens_coefficient = 0.8

/obj/item/clothing/head/HoS/dermal
	name = "Dermal Armour Patch"
	desc = "You're not quite sure how you manage to take it on and off, but it implants nicely in your head."
	icon_state = "dermal"
	armor = list(melee = 50, bullet = 50, laser = 50,energy = 25, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos
	name = "armored coat"
	desc = "A greatcoat enhanced with a special alloy for some protection and style."
	icon_state = "hos"
	item_state = "hos"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 65, bullet = 30, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT
	siemens_coefficient = 0.6

//Jensen cosplay gear
/obj/item/clothing/under/rank/head_of_security/jensen
	desc = "You never asked for anything that stylish."
	name = "Commissar's jumpsuit"
	icon_state = "jensen"
	item_state = "jensen"
	worn_state = "jensen"
	siemens_coefficient = 0.6

/obj/item/clothing/suit/armor/hos/jensen
	name = "armored trenchcoat"
	desc = "A trenchcoat augmented with a special alloy for some protection and style."
	icon_state = "hostrench"
	item_state = "hostrench"
	flags_inv = 0
	siemens_coefficient = 0.6

/obj/item/clothing/under/rank/security/navyblue
	name = "security officer's uniform"
	desc = "The latest in fashionable security outfits."
	icon_state = "officerblueclothes"
	item_state = "ba_suit"
	worn_state = "officerblueclothes"

/obj/item/clothing/under/rank/head_of_security/navyblue
	desc = "The insignia on this uniform tells you that this uniform belongs to the Head Of Security."
	name = "Commissar's uniform"
	icon_state = "hosblueclothes"
	item_state = "ba_suit"
	worn_state = "hosblueclothes"

/obj/item/clothing/under/rank/warden/navyblue
	desc = "The insignia on this uniform tells you that this uniform belongs to the Warden."
	name = "warden's uniform"
	icon_state = "wardenblueclothes"
	item_state = "ba_suit"
	worn_state = "wardenblueclothes"

/obj/item/clothing/under/security_uniform_barny
	name = "Casual Security Uniform"
	icon_state = "barnyuni"
	item_state = "ba_suit"
	worn_state = "barny"

// ASTRA MILITARUM STUFF

/obj/item/clothing/under/rank/krieg_uniform
	name = "krieg Battle Uniform"
	desc = "These durable Battle Uniform are used to represent the resilent Krieg Regiment, Though it smells like shit."
	icon_state = "krieg"
	item_state = "krieg"
	worn_state = "krieg"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 60, rad = 0)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/cadian_uniform
	name = "Cadian Battle Dress Uniform"
	desc = "The uniform of the common, but brave Cadian Regiment."
	icon_state = "guard"
	item_state = "guard"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/valhallan_uniform
	name = "Valhalla Battle Uniform"
	desc = "The uniform made out of their planetary predator's furs, durable and warm, made for the cold warriors of Valhalla Regiment."
	icon_state = "krieg"
	item_state = "krieg"
	worn_state = "krieg"
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/casual_pants/catachan
	name = "Catachan Battle Shorts"
	desc = "Catachan fear no temperature, no boltguns, no lasguns, they don't need shirts, They're Catachan Regiment."
	icon_state = "camopants"
	cold_protection = LOWER_TORSO
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/rank/krieg_uniform/commissar
	name = "commissar Dress Uniform"
	desc = "More standard uniform of the Commissars of the Officio Prefectus, just with some Krieg emblems on them in an attempt to similate."
	icon_state = "kriegissar"
	item_state = "kriegissar"
	worn_state = "kriegissar"

/obj/item/clothing/under/rank/catachancommissar
	name = "commissar Field Pants"
	desc = "What used to be green tailoring of the uniform given by the Officio Prefectus has been cut down and stripped to be the bare essentials, just like that of the Catachans under you. Around your neck being an emblematic symbol of the Emperor as a necklace."
	icon_state = "catacomm"
	item_state = "catacomm"
	worn_state = "catacomm"

// Astarte

/obj/item/clothing/under/astarte/bodysuit
	name = "Astarte Bodysuit"
	desc = "The bodysuit worn by Astartes underneath their Power Armour."
	icon_state = "swatunder"
	worn_state = "swatunder"
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

// Adepta Sororitas

/obj/item/clothing/under/guard/uniform/sisterelohiem
	name = "Adepta Sororitas Bodysuit"
	desc = "If you can inspect this, you're a coomer, do not ERP."
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	species_restricted = list(SPECIES_HUMAN)
