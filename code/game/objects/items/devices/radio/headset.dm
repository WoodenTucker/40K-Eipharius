/obj/item/device/radio/headset
	name = "radio headset"
	desc = "An updated, modular intercom that fits over the head. Takes encryption keys."
	var/radio_desc = ""
	icon_state = "sec_headset"
	item_state = "sec_headset"
	matter = list(DEFAULT_WALL_MATERIAL = 75)
	subspace_transmission = 1
	canhear_range = 0 // can't hear headsets from very far away

	slot_flags = SLOT_EARS
	var/translate_binary = 0
	var/translate_hive = 0
	var/obj/item/device/encryptionkey/keyslot1 = null
	var/obj/item/device/encryptionkey/keyslot2 = null

	var/ks1type = /obj/item/device/encryptionkey
	var/ks2type = null

/obj/item/device/radio/headset/Initialize()
	. = ..()
	internal_channels.Cut()
	if(ks1type)
		keyslot1 = new ks1type(src)
	if(ks2type)
		keyslot2 = new ks2type(src)
	recalculateChannels(1)

/obj/item/device/radio/headset/Destroy()
	qdel(keyslot1)
	qdel(keyslot2)
	keyslot1 = null
	keyslot2 = null
	return ..()

/obj/item/device/radio/headset/list_channels(var/mob/user)
	return list_secure_channels()

/obj/item/device/radio/headset/examine(mob/user)
	if(!(..(user, 1) && radio_desc))
		return

	to_chat(user, "The following channels are available:")
	to_chat(user, radio_desc)

/obj/item/device/radio/headset/handle_message_mode(mob/living/M as mob, message, channel)
	if (channel == "special")
		if (translate_binary)
			var/datum/language/binary = all_languages["Robot Talk"]
			binary.broadcast(M, message)
		if (translate_hive)
			var/datum/language/hivemind = all_languages["Hivemind"]
			hivemind.broadcast(M, message)
		return null

	return ..()

/obj/item/device/radio/headset/receive_range(freq, level, aiOverride = 0)
	if (aiOverride)
		return ..(freq, level)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.l_ear == src || H.r_ear == src || H.back == src)
			return ..(freq, level)
	return -1

/obj/item/device/radio/headset/syndicate
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/red

/obj/item/device/radio/headset/syndicate/Initialize()
	. = ..()
	set_frequency(RED_FREQ)

/obj/item/device/radio/headset/raider
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/blue

/obj/item/device/radio/headset/raider/Initialize()
	. = ..()
	set_frequency(BLUE_FREQ)

/obj/item/device/radio/headset/binary
	origin_tech = list(TECH_ILLEGAL = 3)
	ks1type = /obj/item/device/encryptionkey/binary

//piggybacked off the existing radios for my overhaul - explaining what each does below :: Rushodan
//standard Astartes vox - May need tweaking if we decide to give different classes different keys
/obj/item/device/radio/headset/headset_sec
	name = "Astartes vox"
	desc = "The vox of an elite space marine."
	icon_state = "sec_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/headset_sec

//standard Mechanicus vox
/obj/item/device/radio/headset/headset_eng
	name = "Mechanicus vox"
	desc = "Keep that toaster-speak to yourselves."
	icon_state = "eng_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/headset_eng

//not used rn
/obj/item/device/radio/headset/headset_rob
	name = "robotics radio headset"
	desc = "Made specifically for the roboticists who cannot decide between departments."
	icon_state = "rob_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_rob

//not used rn
/obj/item/device/radio/headset/headset_med
	name = "medical radio headset"
	desc = "A headset for the trained staff of the medbay."
	icon_state = "med_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_med

//standard Ecclesiarchy vox
/obj/item/device/radio/headset/headset_sci
	name = "Ecclesiarchy vox"
	desc = "A vox headset for the faithful."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/headset_sci

//unused rn
/obj/item/device/radio/headset/headset_medsci
	name = "medical research radio headset"
	desc = "A headset that is a result of the mating between medical and science."
	icon_state = "med_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_medsci

//basic command vox
/obj/item/device/radio/headset/headset_com
	name = "command vox"
	desc = "A headset with a commanding channel."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/headset_com

//unused rn
/obj/item/device/radio/headset/heads/captain
	name = "captain's headset"
	desc = "The headset of the boss."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/heads/captain

//AI is heresy
/obj/item/device/radio/headset/heads/ai_integrated //No need to care about icons, it should be hidden inside the AI anyway.
	name = "\improper AI subspace transceiver"
	desc = "Integrated AI radio transceiver."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "radio"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/ai_integrated
	var/myAi = null    // Atlantis: Reference back to the AI which has this radio.
	var/disabledAi = 0 // Atlantis: Used to manually disable AI's integrated radio via inteliCard menu.

/obj/item/device/radio/headset/heads/ai_integrated/Destroy()
	myAi = null
	. = ..()

/obj/item/device/radio/headset/heads/ai_integrated/receive_range(freq, level)
	if (disabledAi)
		return -1 //Transciever Disabled.
	return ..(freq, level, 1)

//unused rn
/obj/item/device/radio/headset/heads/rd
	name = "research director's headset"
	desc = "Headset of the researching God."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/rd

//Guardsmen Comm-linked vox
/obj/item/device/radio/headset/heads/hos
	name = "Command-linked vox"
	desc = "The headset of the men who protect your worthless lives."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/heads/hos

//Magos vox
/obj/item/device/radio/headset/heads/ce
	name = "Magos vox"
	desc = "The headset of the guy who is in charge of the beepers and boopers."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/heads/ce

//Command-Ecclesiarchy vox
/obj/item/device/radio/headset/heads/cmo
	name = "Ecclesiarchy Superior vox"
	desc = "A headset for the supremely faithful"
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/heads/cmo

//Steward vox
/obj/item/device/radio/headset/heads/hop
	name = "Steward vox"
	desc = "The headset of the right hand of the Rogue Trader."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/heads/hop

//MAGISTRATUM
/obj/item/device/radio/headset/headset_cargo
	name = "enforcer radio headset"
	desc = "A headset used by the box pushers."
	icon_state = "cargo_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/headset_sci
	ks2type = /obj/item/device/encryptionkey/red_alpha

//basic 'common' vox
/obj/item/device/radio/headset/headset_service
	icon = 'icons/obj/radio.dmi'
	name = "vox-caster headset"
	desc = "A stripped down version of the standard Guard issue vox."
	ks1type = /obj/item/device/encryptionkey/red
	icon_state = "sec_headset"
	item_state = "sec_headset"
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_SMALL

//Marshal vox
/obj/item/device/radio/headset/entertainment
	icon = 'icons/obj/radio.dmi'
	name = "Marshal vox"
	desc = "A stripped down version of the standard Guard issue vox. This one has been upgraded with a com-link"
	ks1type = /obj/item/device/encryptionkey/headset_sci
	ks2type = /obj/item/device/encryptionkey/headset_sec
	icon_state = "sec_headset"
	item_state = "sec_headset"
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_SMALL

//IMPORTANT - NEEDS TWEAKING DEPENDING ON IF ERTS ARE PLANNED TO BE USED
/obj/item/device/radio/headset/ert
	name = "emergency response team radio headset"
	desc = "The headset of the boss's boss."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/ert

//I have no idea if this is used rn
/obj/item/device/radio/headset/ia
	name = "Acolyte's Headset"
	desc = "The headset of your worst enemy."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/hos

//standard inquisitional vox
/obj/item/device/radio/headset/inquisition
	name = "Inquisition vox"
	desc = "The headset of religious intolorence."
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/headset_inquisition

//IMPORTANT - Possibly needs tweaking if use planned!
/obj/item/device/radio/headset/specops
	name = "special operations radio headset"
	desc = "The headset of the spooks."
	icon_state = "cent_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/specops

//Blue team left untouched - Rusho
/obj/item/device/radio/headset/tau
	name = "tau headset"
	desc = "The headset of the greater good."
	icon_state = "sec_headset"
	item_state = "sec_headset"
	ks2type = null //until there is a tau channel

/obj/item/device/radio/headset/fire_warrior
	name = "fire caste headset"
	desc = "The headset of the tau fire caste warriors."
	icon_state = "fw_headset"
	item_state = "t_headset_f"
	ks2type = null

/obj/item/device/radio/headset/fire_warrior/tactical
	name = "tactical fire caste headset"
	desc = "The tactically designed headset of the tau fire caste warriors."
	icon_state = "guevesa_tactical_headset"
	item_state = "t_tactical_headset_f"
	ks2type = null

//standard guardsmen vox
/obj/item/device/radio/headset/red_team
	icon = 'icons/obj/radio.dmi'
	name = "vox-caster headset"
	desc = "A standard Guard issue vox-caster headset. Allows the wearer to communicate with the brass and pass along info/orders to his squadmates. Attach it to one of your ears."
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/red_alpha
	icon_state = "sec_headset"
	item_state = "sec_headset"
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_SMALL

//possibly needs removal if squads aren't planned to be implemented
/obj/item/device/radio/headset/red_team/voxcaster
	icon = 'icons/obj/radio.dmi'
	name = "vox-caster rig"
	desc = "A standard Guard issue vox-caster rig. Allows the wearer to communicate with the brass and pass along info/orders to his squadmates. Attach it to one of your ears."
	ks1type = /obj/item/device/encryptionkey/red_all
	icon_state = "voxcaster"
	item_state = "voxcaster"
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_NORMAL
	canhear_range = 3 //will allow the surrounding squad to hear communications, can touch this up if its too spammy or loud. 0 is same tile as backpack

/*tactical requires a subsection of code to switch between ``guevesa_tactical_headset`` and ``tau_tactical_headset``
 per race its equipped on */

/obj/item/device/radio/headset/attackby(obj/item/W as obj, mob/user as mob)
//	..()
	user.set_machine(src)
	if (!( isScrewdriver(W) || (istype(W, /obj/item/device/encryptionkey/ ))))
		return

	if(isScrewdriver(W))
		if(keyslot1 || keyslot2)


			for(var/ch_name in channels)
				SSradio.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot1)
				var/turf/T = get_turf(user)
				if(T)
					keyslot1.loc = T
					keyslot1 = null



			if(keyslot2)
				var/turf/T = get_turf(user)
				if(T)
					keyslot2.loc = T
					keyslot2 = null

			recalculateChannels()
			to_chat(user, "You pop out the encryption keys in the headset!")

		else
			to_chat(user, "This headset doesn't have any encryption keys!  How useless...")

	if(istype(W, /obj/item/device/encryptionkey/))
		if(keyslot1 && keyslot2)
			to_chat(user, "The headset can't hold another key!")
			return

		if(!keyslot1)
			user.drop_item()
			W.loc = src
			keyslot1 = W

		else
			user.drop_item()
			W.loc = src
			keyslot2 = W


		recalculateChannels()

	return

/obj/item/device/radio/headset/MouseDrop(var/obj/over_object)
	var/mob/M = usr
	if((!istype(over_object, /obj/screen)) && (src in M) && CanUseTopic(M))
		return attack_self(M)
	return

/obj/item/device/radio/headset/recalculateChannels(var/setDescription = 0)
	src.channels = list()
	src.translate_binary = 0
	src.translate_hive = 0
	src.syndie = 0

	if(keyslot1)
		for(var/ch_name in keyslot1.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot1.channels[ch_name]

		if(keyslot1.translate_binary)
			src.translate_binary = 1

		if(keyslot1.translate_hive)
			src.translate_hive = 1

		if(keyslot1.syndie)
			src.syndie = 1

	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			src.translate_binary = 1

		if(keyslot2.translate_hive)
			src.translate_hive = 1

		if(keyslot2.syndie)
			src.syndie = 1


	for (var/ch_name in channels)
		secure_radio_connections[ch_name] = SSradio.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	if(setDescription)
		setupRadioDescription()

	return

/obj/item/device/radio/headset/proc/setupRadioDescription()
	var/radio_text = ""
	for(var/i = 1 to channels.len)
		var/channel = channels[i]
		var/key = get_radio_key_from_channel(channel)
		radio_text += "[key] - [channel]"
		if(i != channels.len)
			radio_text += ", "

	radio_desc = radio_text

/obj/item/device/radio/headset/hivemind
	name = "Hive Mind Interlociter"
	icon_state = "hivemind"
	item_state = "hivemind"
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/hivemind
	canremove = 0

/obj/item/device/radio/headset/hivemind/Initialize()
	. = ..()
	set_frequency(HIVE_FREQ)

/obj/item/device/encryptionkey/hivemind
	icon_state = "cypherkey"
	channels = list("Hivemind" = 1)
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1

/obj/item/device/radio/headset/inquisition
	name = "Standard Issue Vox"
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/inq

/obj/item/device/radio/headset/heads/rt
	name = "rogue trader's vox"
	desc = "A command-level vox with high tiers of encryption."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/red
	ks2type = /obj/item/device/encryptionkey/heads/captain
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_SMALL
	syndie = 1
	origin_tech = list(TECH_ILLEGAL = 2)

/obj/item/device/radio/headset/inquisition/Initialize()
	. = ..()
	set_frequency(RED_FREQ)
/obj/item/device/encryptionkey/inq
	icon_state = "cypherkey"
	channels = list("Imperial" = 1, "Inquisition" = 1, "Ecclesiarchy" = 1)
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1
