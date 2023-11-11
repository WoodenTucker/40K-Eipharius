/obj/item/clothing/head/hardhat
	name = "hard hat"
	desc = "A piece of headgear used in dangerous working conditions to protect the head. Comes with a built-in flashlight."
	icon_state = "hardhat0_yellow"
	action_button_name = "Toggle Headlamp"
	brightness_on = 4 //luminosity when on
	light_overlay = "hardhat_light"
	w_class = ITEM_SIZE_NORMAL
	armor = list(melee = 30, bullet = 25, laser = 20,energy = 10, bomb = 20, bio = 10, rad = 20)
	flags_inv = 0
	siemens_coefficient = 0.9
	heat_protection = HEAD
	unacidable = 1
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hardhat/orange
	icon_state = "hardhat0_orange"

/obj/item/clothing/head/hardhat/red
	icon_state = "hardhat0_red"
	name = "firefighter helmet"

/obj/item/clothing/head/hardhat/white
	icon_state = "hardhat0_white"

/obj/item/clothing/head/hardhat/dblue
	icon_state = "hardhat0_dblue"

/obj/item/clothing/head/helmet/hard_had
	name = "Mining Helmet"
	desc = "Protects you head from rocks and other hazards."
	icon_state = "hardhat"
	action_button_name = "Toggle Headlamp"
	brightness_on = 4 //luminosity when on
	light_overlay = "hardhat_light"

/obj/item/clothing/head/hardhat/techpriest
	name = "augmented head"
	desc = "The augmented skull and hood signifying one is a priest of the Adeptus Mechanicus."
	icon_state = "techpriestnew"
	item_state = "techpriestnew"
	brightness_on = 6
	unacidable = 1
	canremove = 0
	armor = list(melee = 40, bullet = 15, laser = 30,energy = 20, bomb = 50, bio = 50, rad = 20)
	flags_inv = BLOCKHAIR|BLOCKHEADHAIR|HIDEEARS|HIDEEYES
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/head/hardhat/techpriest/magos
	icon_state = "magoshelm"
	item_state = "magoshelm"
	brightness_on = 8
	unacidable = 1
	armor = list(melee = 50, bullet = 40, laser = 50,energy = 40, bomb = 70, bio = 100, rad = 20)
