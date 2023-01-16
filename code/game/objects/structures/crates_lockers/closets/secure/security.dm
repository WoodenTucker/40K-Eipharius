/obj/structure/closet/secure_closet/captains
	name = "locker of the lord"
	req_access = list(access_captain)
	icon_state = "capsecure1"
	icon_closed = "capsecure"
	icon_locked = "capsecure1"
	icon_opened = "capsecureopen"
	icon_off = "capsecureoff"

/obj/structure/closet/secure_closet/captains/WillContain()
	return list(
		/obj/item/clothing/accessory/holster/armpit,
		/obj/item/clothing/accessory/medal/iron/Administratum,
		/obj/item/clothing/glasses/cadiangoggles/elite,
		/obj/item/clothing/glasses/monocle,
		/obj/item/clothing/suit/armor/rtdrip,
		/obj/item/clothing/suit/captunic,
		/obj/item/clothing/head/caphat/formal,
		/obj/item/clothing/under/captainformal,
		/obj/item/clothing/suit/armor/vest/opvest,
		/obj/item/clothing/head/helmet,
		/obj/item/gun/energy/gun,
		/obj/item/melee/telebaton
	)

/obj/structure/closet/secure_closet/hop
	name = "Seneschal's locker"
	req_access = list(access_hop)
	icon_state = "hopsecure1"
	icon_closed = "hopsecure"
	icon_locked = "hopsecure1"
	icon_opened = "hopsecureopen"
	icon_off = "hopsecureoff"

/obj/structure/closet/secure_closet/hop/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/suit/armor/vest/opvest,
		/obj/item/clothing/head/helmet,
		/obj/item/cartridge/hop,
		/obj/item/device/radio/headset/heads/hop,
		/obj/item/storage/box/ids = 2,
		/obj/item/device/flash
	)

/obj/structure/closet/secure_closet/hop2
	name = "Seneschal's attire"
	req_access = list(access_hop)
	icon_state = "hopsecure1"
	icon_closed = "hopsecure"
	icon_locked = "hopsecure1"
	icon_opened = "hopsecureopen"
	icon_off = "hopsecureoff"

/obj/structure/closet/secure_closet/hop2/WillContain()
	return list(
		/obj/item/clothing/under/rank/head_of_personnel,
		/obj/item/clothing/under/dress/dress_hop,
		/obj/item/clothing/under/dress/dress_hr,
		/obj/item/clothing/under/lawyer/female,
		/obj/item/clothing/under/lawyer/black,
		/obj/item/clothing/under/lawyer/red,
		/obj/item/clothing/under/lawyer/oldman,
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/shoes/leather,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/under/rank/head_of_personnel_whimsy,
		/obj/item/clothing/head/caphat/hop
	)

/obj/structure/closet/secure_closet/hos
	name = "Commissar's locker"
	req_access = list(access_hos)
	icon_state = "hossecure1"
	icon_closed = "hossecure"
	icon_locked = "hossecure1"
	icon_opened = "hossecureopen"
	icon_off = "hossecureoff"

/obj/structure/closet/secure_closet/hos/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/shield/riot,
		/obj/item/device/flash,
		/obj/item/melee/sword,
		/obj/item/melee/telebaton,
	)

/obj/structure/closet/secure_closet/warden
	name = "veteran sergeant's locker"
	req_access = list(access_armory)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/warden/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/melee/telebaton,
	)

/obj/structure/closet/secure_closet/security
	name = "security officer's locker"
	req_access = list(access_magi)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/security/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/satchel_sec)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/sec, 50),
		/obj/item/clothing/suit/armor/vest/opvest,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/mask/gas/security,
		/obj/item/clothing/mask/balaclava,
		/obj/item/storage/belt/security,
		/obj/item/device/flash,
		/obj/item/melee/classic_baton,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/head/soft/sec/corp,
		/obj/item/clothing/under/rank/security/corp,
		/obj/item/gun/energy/taser
	)

/obj/structure/closet/secure_closet/security/cargo/WillContain()
	return MERGE_ASSOCS_WITH_NUM_VALUES(..(), list(
		/obj/item/clothing/accessory/armband/cargo,
		/obj/item/device/encryptionkey/headset_cargo
	))

/obj/structure/closet/secure_closet/security/engine/WillContain()
	return MERGE_ASSOCS_WITH_NUM_VALUES(..(), list(
			/obj/item/clothing/accessory/armband/engine,
			/obj/item/device/encryptionkey/headset_eng
		))

/obj/structure/closet/secure_closet/security/science/WillContain()
	return MERGE_ASSOCS_WITH_NUM_VALUES(..(), list(/obj/item/device/encryptionkey/headset_sci))

/obj/structure/closet/secure_closet/security/med/WillContain()
	return MERGE_ASSOCS_WITH_NUM_VALUES(..(), list(
			/obj/item/clothing/accessory/armband/medgreen,
			/obj/item/device/encryptionkey/headset_med
		))

/obj/structure/closet/secure_closet/detective
	name = "detective's cabinet"
	req_access = list(access_magi)
	icon_state = "cabinetdetective_locked"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_opened = "cabinetdetective_open"
	icon_broken = "cabinetdetective_sparks"
	icon_off = "cabinetdetective_broken"

/obj/structure/closet/secure_closet/detective/WillContain()
	return list(
		/obj/item/clothing/under/det,
		/obj/item/clothing/under/det/grey,
		/obj/item/clothing/under/det/black,
		/obj/item/clothing/suit/storage/det_trench,
		/obj/item/clothing/suit/storage/det_trench/grey,
		/obj/item/clothing/suit/storage/forensics/blue,
		/obj/item/clothing/suit/storage/forensics/red,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/head/det,
		/obj/item/clothing/head/det/grey,
		/obj/item/clothing/shoes/laceup,
		/obj/item/storage/box/evidence,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/taperoll/police,
		/obj/item/clothing/accessory/holster/armpit,
		/obj/item/reagent_containers/food/drinks/flask/detflask,
		/obj/item/storage/briefcase/crimekit,
		/obj/item/device/holowarrant
	)

/obj/structure/closet/secure_closet/injection
	name = "lethal injections locker"
	req_access = list(access_captain)

/obj/structure/closet/secure_closet/injection/WillContain()
	return list(/obj/item/reagent_containers/syringe/ld50_syringe/choral = 2)

/obj/structure/closet/secure_closet/brig
	name = "brig locker"
	req_access = list(access_magi)
	anchored = 1
	var/id = null

/obj/structure/closet/secure_closet/brig/WillContain()
	return list(
		/obj/item/clothing/under/color/orange,
		/obj/item/clothing/shoes/orange
	)

/obj/structure/closet/secure_closet/courtroom
	name = "courtroom locker"
	req_access = list(access_village)

/obj/structure/closet/secure_closet/courtroom/WillContain()
	return list(
		/obj/item/clothing/shoes/brown,
		/obj/item/paper/Court = 3,
		/obj/item/pen ,
		/obj/item/clothing/suit/judgerobe,
		/obj/item/clothing/head/powdered_wig ,
		/obj/item/storage/briefcase,
	)

/obj/structure/closet/secure_closet/wall
	name = "wall locker"
	req_access = list(access_security)
	icon_state = "wall-locker1"
	density = 1
	icon_closed = "wall-locker"
	icon_locked = "wall-locker1"
	icon_opened = "wall-lockeropen"
	icon_broken = "wall-lockerbroken"
	icon_off = "wall-lockeroff"

	//too small to put a man in
	large = 0

/obj/structure/closet/secure_closet/lawyer
	name = "internal affairs secure closet"
	req_access = list(access_village)

/obj/structure/closet/secure_closet/lawyer/WillContain()
	return list(
		/obj/item/device/flash = 2,
		/obj/item/device/camera = 2,
		/obj/item/device/camera_film = 2,
		/obj/item/device/taperecorder = 2,
		/obj/item/storage/secure/briefcase = 2,
	)