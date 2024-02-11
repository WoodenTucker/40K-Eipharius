/*
 * Contains:
 *		Fire protection
 *		Bomb protection
 *		Radiation protection
 */

/*
 * Fire protection
 */

/obj/item/clothing/suit/fire
	name = "firesuit"
	desc = "A suit that protects against fire and heat."
	icon_state = "fire"
	item_state_slots = list(
		slot_l_hand_str = "fire_suit",
		slot_r_hand_str = "fire_suit",
	)
	w_class = ITEM_SIZE_HUGE//bulky item
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/device/flashlight,/obj/item/tank/emergency,/obj/item/extinguisher)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	item_flags = ITEM_FLAG_STOPPRESSUREDAMAGE
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS

/*
/obj/item/clothing/suit/fire/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1.0
*/

/obj/item/clothing/suit/fire/firefighter
	icon_state = "firesuit"
	item_state_slots = list(
		slot_l_hand_str = "firefighter",
		slot_r_hand_str = "firefighter",
	)


/obj/item/clothing/suit/fire/heavy
	name = "firesuit"
	desc = "A suit that protects against extreme fire and heat."
	//icon_state = "thermal"
	item_state_slots = list(
		slot_l_hand_str = "ro_suit",
		slot_r_hand_str = "ro_suit",
	)
	w_class = ITEM_SIZE_HUGE//bulky item

/obj/item/clothing/suit/fire/heavy/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1.5

/*
 * Bomb protection
 */
/obj/item/clothing/head/bomb_hood
	name = "Heavy Flak helmet"
	desc = "Use in case of bomb."
	icon_state = "bombsuit"
	armor = list(melee = 17, bullet = 35, laser = 30, energy = 35, bomb = 50, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	siemens_coefficient = 0
	sales_price = 10


/obj/item/clothing/suit/bomb_suit
	name = "Heavy Trooper Flak Suit"
	desc = "A suit designed for the handling of heavy weapons."
	icon_state = "bombsuit"
	w_class = ITEM_SIZE_HUGE//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	armor = list(melee = 16, bullet = 40, laser = 25, energy = 35, bomb = 70, bio = 90, rad = 40)
	flags_inv = HIDEJUMPSUIT|HIDETAIL
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	sales_price = 30

/obj/item/clothing/suit/bomb_suit/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 0.6

/obj/item/clothing/head/bomb_hood/security
	icon_state = "bombsuitsec"
	body_parts_covered = HEAD

/obj/item/clothing/suit/bomb_suit/security
	icon_state = "bombsuitsec"
	allowed = list(/obj/item/gun/energy,/obj/item/melee/baton,/obj/item/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS

/*
 * Radiation protection
 */
/obj/item/clothing/head/radiation
	name = "Radiation Hood"
	icon_state = "rad"
	desc = "A hood with radiation protective properties. Label: Made with lead, do not eat insulation."
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 10, bomb = 10, bio = 60, rad = 100)


/obj/item/clothing/suit/radiation
	name = "Radiation suit"
	desc = "A suit that protects against radiation. Label: Made with lead, do not eat insulation."
	icon_state = "rad"
	item_state_slots = list(
		slot_l_hand_str = "rad_suit",
		slot_r_hand_str = "rad_suit",
	)
	w_class = ITEM_SIZE_HUGE//bulky item
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	allowed = list(/obj/item/device/flashlight,/obj/item/tank/emergency,/obj/item/clothing/head/radiation,/obj/item/clothing/mask/gas)
	armor = list(melee = 15, bullet = 10, laser = 10,energy = 10, bomb = 10, bio = 60, rad = 100)
	flags_inv = HIDEJUMPSUIT|HIDETAIL|HIDEGLOVES|HIDESHOES

/obj/item/clothing/suit/radiation/New()
	..()
	slowdown_per_slot[slot_shoes] = 1.5
