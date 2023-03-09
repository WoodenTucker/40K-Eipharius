/obj/item/device/radio/headset/red_team
	name = "Standard Issue Vox"
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/red

/obj/item/device/radio/headset/red_team/Initialize()
	. = ..()
	set_frequency(RED_FREQ)

/obj/item/device/radio/headset/red_team/sl_alpha
	ks1type = /obj/item/device/encryptionkey/redsl_alpha

/obj/item/device/radio/headset/red_team/sl_bravo
	ks1type = /obj/item/device/encryptionkey/redsl_bravo

/obj/item/device/radio/headset/red_team/sl_charlie
	ks1type = /obj/item/device/encryptionkey/redsl_charlie

/obj/item/device/radio/headset/red_team/sl_delta
	ks1type = /obj/item/device/encryptionkey/redsl_delta

/obj/item/device/radio/headset/red_team/all
	ks1type = /obj/item/device/encryptionkey/red_all

/obj/item/device/radio/headset/red_team/alpha
	ks1type = /obj/item/device/encryptionkey/red_alpha

	Initialize()
		. = ..()
		set_frequency(RED_ALPHA)

/obj/item/device/radio/headset/red_team/bravo
	ks1type = /obj/item/device/encryptionkey/red_bravo

	Initialize()
		. = ..()
		set_frequency(RED_BRAVO)

/obj/item/device/radio/headset/red_team/charlie
	ks1type = /obj/item/device/encryptionkey/red_charlie

	Initialize()
		. = ..()
		set_frequency(RED_CHARLIE)

/obj/item/device/radio/headset/red_team/delta
	ks1type = /obj/item/device/encryptionkey/red_delta

	Initialize()
		. = ..()
		set_frequency(RED_DELTA)


/obj/item/device/radio/headset/red_team/medicae
	name = "Standard Issue Vox"
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/red/medicae

/obj/item/device/radio/headset/red_team/medicae/Initialize()
	. = ..()
	set_frequency(RED_FREQ)




//BLUE TEAM RADIO



/obj/item/device/radio/headset/blue_team
	name = "Standard Issue Vox"
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/blue

/obj/item/device/radio/headset/blue_team/Initialize()
	. = ..()
	set_frequency(BLUE_FREQ)


/obj/item/device/radio/headset/blue_team/sl_alpha
	ks1type = /obj/item/device/encryptionkey/bluesl_alpha

/obj/item/device/radio/headset/blue_team/sl_bravo
	ks1type = /obj/item/device/encryptionkey/bluesl_bravo

/obj/item/device/radio/headset/blue_team/sl_charlie
	ks1type = /obj/item/device/encryptionkey/bluesl_charlie

/obj/item/device/radio/headset/blue_team/sl_delta
	ks1type = /obj/item/device/encryptionkey/bluesl_delta

/obj/item/device/radio/headset/blue_team/all
	ks1type = /obj/item/device/encryptionkey/blue_all

/obj/item/device/radio/headset/blue_team/alpha
	ks1type = /obj/item/device/encryptionkey/blue_alpha

	Initialize()
		. = ..()
		set_frequency(BLUE_ALPHA)

/obj/item/device/radio/headset/blue_team/bravo
	ks1type = /obj/item/device/encryptionkey/blue_bravo

	Initialize()
		. = ..()
		set_frequency(BLUE_BRAVO)

/obj/item/device/radio/headset/blue_team/charlie
	ks1type = /obj/item/device/encryptionkey/blue_charlie

	Initialize()
		. = ..()
		set_frequency(BLUE_CHARLIE)

/obj/item/device/radio/headset/blue_team/delta
	ks1type = /obj/item/device/encryptionkey/blue_delta

	Initialize()
		. = ..()
		set_frequency(BLUE_DELTA)