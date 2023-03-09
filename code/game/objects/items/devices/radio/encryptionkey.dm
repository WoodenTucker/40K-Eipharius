/obj/item/device/encryptionkey/
	name = "standard encryption key"
	desc = "An encryption key for a radio headset. Contains cypherkeys."
	icon = 'icons/obj/radio.dmi'
	icon_state = "cypherkey"
	item_state = ""
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/translate_binary = 0
	var/translate_hive = 0
	var/syndie = 0
	var/list/channels = list()

/obj/item/device/encryptionkey/attackby(obj/item/W as obj, mob/user as mob)


//common key
/obj/item/device/encryptionkey/red
	name = "imperial common encryption key"
	icon_state = "cypherkey"
	channels = list("Imperial" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

//Again, possibly needs removing if we don't use squads
/obj/item/device/encryptionkey/redsl_alpha
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Alpha" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/redsl_bravo
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Bravo" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/redsl_charlie
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Charlie" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/redsl_delta
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Delta" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/red_all
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Alpha" = 1, "Bravo" = 1, "Charlie" = 1, "Delta" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

//guardsmen key
/obj/item/device/encryptionkey/red_alpha
	name = "guardsmen encryption key"
	icon_state = "cypherkey"
	channels = list("Guardsmen" = 1, "Imperial" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

//Again, possibly needs removing if we don't use squads
/obj/item/device/encryptionkey/red_bravo
	icon_state = "cypherkey"
	channels = list("Bravo" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

/obj/item/device/encryptionkey/red_charlie
	icon_state = "cypherkey"
	channels = list("Charlie" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

/obj/item/device/encryptionkey/red_delta
	icon_state = "cypherkey"
	channels = list("Delta" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

//not presently used
/obj/item/device/encryptionkey/red/medicae
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Medical" = 1,)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions


//Base blue one - untouched
/obj/item/device/encryptionkey/blue
	icon_state = "cypherkey"
	channels = list("Blue" = 1)
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1

/obj/item/device/encryptionkey/bluesl_alpha
	icon_state = "cypherkey"
	channels = list("Blue" = 1, "Blue Alpha" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/bluesl_bravo
	icon_state = "cypherkey"
	channels = list("Blue" = 1, "Blue Bravo" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/bluesl_charlie
	icon_state = "cypherkey"
	channels = list("Blue" = 1, "Blue Charlie" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/bluesl_delta
	icon_state = "cypherkey"
	channels = list("Blue" = 1, "Blue Delta" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/blue_all
	icon_state = "cypherkey"
	channels = list("Blue" = 1, "Blue Alpha" = 1, "Blue Bravo" = 1, "Blue Charlie" = 1, "Blue Delta" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/blue_alpha
	icon_state = "cypherkey"
	channels = list("Blue Alpha" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/blue_bravo
	icon_state = "cypherkey"
	channels = list("Blue Bravo" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/blue_charlie
	icon_state = "cypherkey"
	channels = list("Blue Charlie" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

/obj/item/device/encryptionkey/blue_delta
	icon_state = "cypherkey"
	channels = list("Blue Delta" = 1)
	origin_tech = list(TECH_ILLEGAL = 1)
	syndie = 1

//unused?
/obj/item/device/encryptionkey/binary
	icon_state = "cypherkey"
	translate_binary = 1
	origin_tech = list(TECH_ILLEGAL = 1)

//com-linked guardsmen key
/obj/item/device/encryptionkey/headset_sec
	name = "guardsmen com-linked encryption key"
	icon_state = "sec_cypherkey"
	channels = list("Command" = 1, "Guardsmen" =1, "Imperial" = 1)
	syndie = 1

//unused
/obj/item/device/encryptionkey/headset_red
	name = "red radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list("Security" = 1, "Imperial" = 1)

//mechanicus key
/obj/item/device/encryptionkey/headset_eng
	name = "mechanicus radio encryption key"
	icon_state = "eng_cypherkey"
	channels = list("Mechanicus" = 1, "Guardsmen" = 1, "Imperial" = 1)

//not used
/obj/item/device/encryptionkey/headset_rob
	name = "robotics radio encryption key"
	icon_state = "rob_cypherkey"
	channels = list("Engineering" = 1, "Science" = 1)

//not used
/obj/item/device/encryptionkey/headset_med
	name = "medical radio encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1)

//ecclesiarchy key
/obj/item/device/encryptionkey/headset_sci
	name = "ecclesiarchy encryption key"
	icon_state = "sci_cypherkey"
	channels = list("Ecclesiarchy" = 1)

//not used
/obj/item/device/encryptionkey/headset_medsci
	name = "medical research radio encryption key"
	icon_state = "medsci_cypherkey"
	channels = list("Medical" = 1, "Science" = 1)

//command key
/obj/item/device/encryptionkey/headset_com
	name = "command encryption key"
	icon_state = "com_cypherkey"
	channels = list("Command" = 1)

//RT key
/obj/item/device/encryptionkey/heads/captain
	name = "Rogue Traders encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Guardsmen" = 1)
	syndie = 1

//AI IS FUCKING HERESY
/obj/item/device/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key."
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Magistratum" = 1, "Service" = 1, "AI Private" = 1)

//not used
/obj/item/device/encryptionkey/heads/rd
	name = "research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("Science" = 1, "Command" = 1)

//commissars key
/obj/item/device/encryptionkey/heads/hos
	name = "Commissars encryption key"
	icon_state = "hos_cypherkey"
	channels = list("Guardsmen" = 1, "Command" = 1)
	syndie = 1

//magos key
/obj/item/device/encryptionkey/heads/ce
	name = "Magos encryption key"
	icon_state = "ce_cypherkey"
	channels = list("Command" = 1, "Mechanicus" = 1, "Guardsmen" = 1)

//ecclesiarchy-command key
/obj/item/device/encryptionkey/heads/cmo
	name = "ecclesiarchy com-linked encryption key"
	icon_state = "cmo_cypherkey"
	channels = list("Command" = 1, "Ecclesiarchy" = 1)

//Stewards key
/obj/item/device/encryptionkey/heads/hop
	name = "Steward encryption key"
	icon_state = "hop_cypherkey"
	channels = list( "Guardsmen" = 1, "Command" = 1)
	syndie = 1

//not used rn
/obj/item/device/encryptionkey/headset_cargo
	name = "Magistratum radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Imperial" = 1, "Magistratum" = 1)

//not used rn
/obj/item/device/encryptionkey/headset_service
	name = "service radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Service" = 1)

//inquisition standard key
/obj/item/device/encryptionkey/headset_inquisition
	name = "inquisition radio key"
	icon_state = "hos_cypherkey"
	channels = list("Inquisition" = 1, "Command" = 1, "Guardsmen" = 1,)

//needs fix if usage planned
/obj/item/device/encryptionkey/ert
	name = "\improper ERT radio encryption key"
	channels = list("Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Magistratum" = 1, "Service" = 1)

//spec ops isn't a working channel - can fix if wanted - Rushodan
/obj/item/device/encryptionkey/specops //for events
	name = "special operations radio encryption key"
	icon_state = "bin_cypherkey"
	channels = list("Special Ops" = 1)
	origin_tech = list(TECH_ILLEGAL = 2)

//not used
/obj/item/device/encryptionkey/entertainment
	name = "entertainment radio key"
	channels = list("Entertainment" = 1)