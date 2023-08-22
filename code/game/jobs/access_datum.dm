/datum/access
	var/id = 0
	var/desc = ""
	var/region = ACCESS_REGION_NONE
	var/access_type = ACCESS_TYPE_STATION

/datum/access/dd_SortValue()
	return "[access_type][desc]"

/*****************
* Station access *
*****************/
/var/const/access_security = 1
/datum/access/security
	id = access_security
	desc = "Security Equipment"
	region = ACCESS_REGION_SECURITY

/var/const/access_magi = 2 // Brig timers and permabrig
/datum/access/holding
	id = access_magi
	desc = "Holding Cells"
	region = ACCESS_REGION_SECURITY

/var/const/access_armory = 3
/datum/access/armory
	id = access_armory
	desc = "Armory"
	region = ACCESS_REGION_SECURITY
/*
/var/const/access_forensics_lockers = 4
/datum/access/forensics_lockers
	id = access_forensics_lockers
	desc = "Forensics"
	region = ACCESS_REGION_SECURITY
*/
/var/const/access_medical = 5
/datum/access/medical
	id = access_medical
	desc = "Medical"
	region = ACCESS_REGION_MEDBAY
/*
/var/const/access_morgue = 6
/datum/access/morgue
	id = access_morgue
	desc = "Morgue"
	region = ACCESS_REGION_MEDBAY
*/
/var/const/access_tox = 7
/datum/access/tox
	id = access_tox
	desc = "Research Labs"
	region = ACCESS_REGION_RESEARCH

/var/const/access_tox_storage = 8
/datum/access/tox_storage
	id = access_tox_storage
	desc = "Toxins Lab"
	region = ACCESS_REGION_RESEARCH
/*
/var/const/access_genetics = 9
/datum/access/genetics
	id = access_genetics
	desc = "Genetics Lab"
	region = ACCESS_REGION_MEDBAY
*/
/var/const/access_mechanicus = 10
/datum/access/mechanicus
	id = access_mechanicus
	desc = "Mechanicus Access"
	region = ACCESS_REGION_ENGINEERING
/*
/var/const/access_engine_equip = 11
/datum/access/engine_equip
	id = access_engine_equip
	desc = "Engine Room"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_maint_tunnels = 12
/datum/access/maint_tunnels
	id = access_maint_tunnels
	desc = "Maintenance"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_external_airlocks = 13
/datum/access/external_airlocks
	id = access_external_airlocks
	desc = "External Airlocks"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_emergency_storage = 14
/datum/access/emergency_storage
	id = access_emergency_storage
	desc = "Emergency Storage"
	region = ACCESS_REGION_ENGINEERING
*/
/var/const/access_change_ids = 15
/datum/access/change_ids
	id = access_change_ids
	desc = "ID Computer"
	region = ACCESS_REGION_COMMAND

/var/const/access_ai_upload = 16
/datum/access/ai_upload
	id = access_ai_upload
	desc = "AI Upload"
	region = ACCESS_REGION_COMMAND

/var/const/access_teleporter = 17
/datum/access/teleporter
	id = access_teleporter
	desc = "Teleporter"
	region = ACCESS_REGION_COMMAND
/*
/var/const/access_eva = 18
/datum/access/eva
	id = access_eva
	desc = "EVA"
	region = ACCESS_REGION_COMMAND
*/
/var/const/access_heads = 19 // announcement access on consoles. give to leaders in factions eg biologis/explorator, planetary governor ect
/datum/access/heads
	id = access_heads
	desc = "Bridge"
	region = ACCESS_REGION_COMMAND

/var/const/access_captain = 20
/datum/access/captain
	id = access_captain
	desc = "Captain"
	region = ACCESS_REGION_COMMAND

/var/const/access_all_personal_lockers = 21
/datum/access/all_personal_lockers
	id = access_all_personal_lockers
	desc = "Personal Lockers"
	region = ACCESS_REGION_COMMAND
/*
/var/const/access_chapel_office = 22
/datum/access/chapel_office
	id = access_chapel_office
	desc = "Chapel Office"
	region = ACCESS_REGION_GENERAL

/var/const/access_tech_storage = 23
/datum/access/tech_storage
	id = access_tech_storage
	desc = "Technical Storage"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_atmospherics = 24
/datum/access/atmospherics
	id = access_atmospherics
	desc = "Atmospherics"
	region = ACCESS_REGION_ENGINEERING
*/
/var/const/access_bar = 25 // i dont think this does anything but idc
/datum/access/bar
	id = access_bar
	desc = "Bar"
	region = ACCESS_REGION_GENERAL

/var/const/access_janitor = 26
/datum/access/janitor
	id = access_janitor
	desc = "Custodial Closet"
	region = ACCESS_REGION_GENERAL

/var/const/access_crematorium = 27
/datum/access/crematorium
	id = access_crematorium
	desc = "Crematorium"
	region = ACCESS_REGION_GENERAL

/var/const/access_kitchen = 28
/datum/access/kitchen
	id = access_kitchen
	desc = "Kitchen"
	region = ACCESS_REGION_GENERAL
/*
/var/const/access_robotics = 29
/datum/access/robotics
	id = access_robotics
	desc = "Robotics"
	region = ACCESS_REGION_RESEARCH
*/
/var/const/access_rd = 30
/datum/access/rd
	id = access_rd
	desc = "Research Director"
	region = ACCESS_REGION_RESEARCH

/var/const/access_cargo = 31
/datum/access/cargo
	id = access_cargo
	desc = "Cargo Bay"
	region = ACCESS_REGION_SUPPLY
/*
/var/const/access_construction = 32
/datum/access/construction
	id = access_construction
	desc = "Construction Areas"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_chemistry = 33
/datum/access/chemistry
	id = access_chemistry
	desc = "Chemistry Lab"
	region = ACCESS_REGION_MEDBAY

/var/const/access_cargo_bot = 34
/datum/access/cargo_bot
	id = access_cargo_bot
	desc = "Cargo Bot Delivery"
	region = ACCESS_REGION_SUPPLY
*/
/var/const/access_hydroponics = 35
/datum/access/hydroponics
	id = access_hydroponics
	desc = "Hydroponics"
	region = ACCESS_REGION_GENERAL

/var/const/access_manufacturing = 36
/datum/access/manufacturing
	id = access_manufacturing
	desc = "Manufacturing"
	access_type = ACCESS_TYPE_NONE

/var/const/access_library = 37
/datum/access/library
	id = access_library
	desc = "Library"
	region = ACCESS_REGION_GENERAL

/var/const/access_lawyer = 38
/datum/access/lawyer
	id = access_lawyer
	desc = "Internal Affairs"
	region = ACCESS_REGION_COMMAND
/*
/var/const/access_virology = 39
/datum/access/virology
	id = access_virology
	desc = "Virology"
	region = ACCESS_REGION_MEDBAY
*/
/var/const/access_abbess = 40
/datum/access/abbess
	id = access_abbess
	desc = "Sister Hospitaller"
	region = ACCESS_REGION_COMMAND

/var/const/access_qm = 41
/datum/access/qm
	id = access_qm
	desc = "Quartermaster"
	region = ACCESS_REGION_SUPPLY

/var/const/access_network = 42
/datum/access/network
	id = access_network
	desc = "Primary Network"
	region = ACCESS_REGION_RESEARCH

// /var/const/free_access_id = 43
// /var/const/free_access_id = 44

/var/const/access_surgery = 45
/datum/access/surgery
	id = access_surgery
	desc = "Surgery"
	region = ACCESS_REGION_MEDBAY

// /var/const/free_access_id = 46

/var/const/access_research = 47
/datum/access/research
	id = access_research
	desc = "Science"
	region = ACCESS_REGION_RESEARCH

/var/const/access_mining = 48
/datum/access/mining
	id = access_mining
	desc = "Mining"
	region = ACCESS_REGION_SUPPLY

/var/const/access_mining_office = 49
/datum/access/mining_office
	id = access_mining_office
	desc = "Mining Office"
	access_type = ACCESS_TYPE_NONE
/*
/var/const/access_mailsorting = 50
/datum/access/mailsorting
	id = access_mailsorting
	desc = "Cargo Office"
	region = ACCESS_REGION_SUPPLY
*/
// /var/const/free_access_id = 51
// /var/const/free_access_id = 52

/var/const/access_heads_vault = 53
/datum/access/heads_vault
	id = access_heads_vault
	desc = "Main Vault"
	region = ACCESS_REGION_COMMAND

/var/const/access_mining_station = 54
/datum/access/mining_station
	id = access_mining_station
	desc = "Mining EVA"
	region = ACCESS_REGION_SUPPLY

/var/const/access_xenobiology = 55
/datum/access/xenobiology
	id = access_xenobiology
	desc = "Xenobiology Lab"
	region = ACCESS_REGION_RESEARCH

/var/const/access_magosd = 56
/datum/access/ce
	id = access_magosd
	desc = "Magos"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_hop = 57
/datum/access/hop
	id = access_hop
	desc = "Seneschal"
	region = ACCESS_REGION_COMMAND

/var/const/access_hos = 58
/datum/access/hos
	id = access_hos
	desc = "Commissar"
	region = ACCESS_REGION_SECURITY

/var/const/access_RC_announce = 59 //Request console announcements
/datum/access/RC_announce
	id = access_RC_announce
	desc = "RC Announcements"
	region = ACCESS_REGION_COMMAND

/var/const/access_keycard_auth = 60 //Used for events which require at least two people to confirm them
/datum/access/keycard_auth
	id = access_keycard_auth
	desc = "Keycode Auth. Device"
	region = ACCESS_REGION_COMMAND

/var/const/access_tcomsat = 61 // has access to the entire telecomms satellite / machinery
/datum/access/tcomsat
	id = access_tcomsat
	desc = "Telecommunications"
	region = ACCESS_REGION_COMMAND

/var/const/access_gateway = 62
/datum/access/gateway
	id = access_gateway
	desc = "Gateway"
	region = ACCESS_REGION_COMMAND

/var/const/access_guard_common = 63 // Guardsman common
/datum/access/sec_doors
	id = access_guard_common
	desc = "Guard Outpost common areas"
	region = ACCESS_REGION_SECURITY
/*
/var/const/access_psychiatrist = 64 // Psychiatrist's office
/datum/access/psychiatrist
	id = access_psychiatrist
	desc = "Psychiatrist's Office"
	region = ACCESS_REGION_MEDBAY
*/
/var/const/access_xenoarch = 65
/datum/access/xenoarch
	id = access_xenoarch
	desc = "Xenoarchaeology"
	region = ACCESS_REGION_RESEARCH
/*
/var/const/access_medical_equip = 66
/datum/access/medical_equip
	id = access_medical_equip
	desc = "Medical Equipment"
	region = ACCESS_REGION_MEDBAY
*/
/var/const/access_guard_armory = 67 // guardsman officer and armory
/datum/access/guard_armory
	id = access_guard_armory
	desc = "Guard Armory"
	region = ACCESS_REGION_SECURITY

/******************
* Central Command *
******************/
/var/const/access_cent_general = 101//General facilities.
/datum/access/cent_general
	id = access_cent_general
	desc = "Code Grey"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_thunder = 102//Thunderdome.
/datum/access/cent_thunder
	id = access_cent_thunder
	desc = "Code Yellow"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_specops = 103//Special Ops.
/datum/access/cent_specops
	id = access_cent_specops
	desc = "Code Black"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_medical = 104//Medical/Research
/datum/access/cent_medical
	id = access_cent_medical
	desc = "Code White"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_living = 105//Living quarters.
/datum/access/cent_living
	id = access_cent_living
	desc = "Code Green"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_storage = 106//Generic storage areas.
/datum/access/cent_storage
	id = access_cent_storage
	desc = "Code Orange"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_teleporter = 107//Teleporter.
/datum/access/cent_teleporter
	id = access_cent_teleporter
	desc = "Code Blue"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_creed = 108//Creed's office.
/datum/access/cent_creed
	id = access_cent_creed
	desc = "Code Silver"
	access_type = ACCESS_TYPE_CENTCOM

/var/const/access_cent_captain = 109//Captain's office/ID comp/AI.
/datum/access/cent_captain
	id = access_cent_captain
	desc = "Code Gold"
	access_type = ACCESS_TYPE_CENTCOM

/***************
* Antag access *
***************/
/var/const/access_syndicate = 150//General Syndicate Access
/datum/access/syndicate
	id = access_syndicate
	desc = "Syndicate"
	access_type = ACCESS_TYPE_SYNDICATE

/*******
* Misc *
*******/
/var/const/access_synth = 199
/datum/access/synthetic
	id = access_synth
	desc = "Synthetic"
	access_type = ACCESS_TYPE_NONE

/var/const/access_crate_cash = 200
/datum/access/crate_cash
	id = access_crate_cash
	desc = "Crate cash"
	access_type = ACCESS_TYPE_NONE

/var/const/access_merchant = 201
/datum/access/merchant
	id = access_merchant
	desc = "Merchant"
	access_type = ACCESS_TYPE_NONE

/var/const/access_inquisition = 202
/datum/access/inquisition
	id = access_inquisition
	desc = "Inquisitor"
	access_type = ACCESS_TYPE_INQUISITION

/var/const/access_treasury = 203
/datum/access/treasury
	id = access_treasury
	desc = "Seneschal"
	access_type = ACCESS_TYPE_TREASURY

/var/const/access_kroot = 204
/datum/access/kroot
	id = access_kroot
	desc = "Kroot doors"
	access_type = ACCESS_TYPE_KROOT

/var/const/access_grox= 205
/datum/access/grox
	id = access_grox
	desc = "Grox Pen"
	access_type = ACCESS_TYPE_GROX

/var/const/access_inn1= 206
/datum/access/innroom_1
	id = access_inn1
	desc = "Inn room 1"

/var/const/access_inn2 = 207
/datum/access/innroom_2
	id = access_inn2
	desc = "Inn room 2"

/var/const/access_inn3 = 208
/datum/access/innroom_3
	id = access_inn3
	desc = "Inn room 3"

/var/const/access_tau = 209
/datum/access/tau
	id = access_tau
	desc = "Tau Ship"

/var/const/access_ganger = 355
/datum/access/ganger
	id = access_ganger
	desc = "ganger Access"

/var/const/access_village = 211 // VILLAGE/PILGRIM COMMON ACCESS! BASICALLY ANYONE WITH ANY TYPE OF ID SHOULD HAVE THIS!!! Don't give to high level guys like rt or inq. they are too fancy to have peasant access
/datum/access/village
	id = access_village
	desc = "Village Common"

/var/const/access_habone = 214
/datum/access/habone
	id = access_habone
	desc = "Hab 1 access"

/var/const/access_habtwo = 215
/datum/access/habtwo
	id = access_habtwo
	desc = "Hab 2 Access"

/var/const/access_habthree = 216
/datum/access/hab3
	id = access_habthree
	desc = "Hab 3 Access"

/var/const/access_habfour = 217
/datum/access/hab4
	id = access_habfour
	desc = "Hab 4 Access"

/var/const/access_habfive = 218
/datum/access/habfive
	id = access_habfive
	desc = "Hab 5 Access"

/var/const/access_meeting = 219
/datum/access/meeting
	id = access_meeting
	desc = "meeting room Access"

/var/const/access_noble = 225
/datum/access/noble
	id = access_noble
	desc = "Noble House"

/var/const/access_cmedicae = 230 //common medicae. for disgraced and normal village medicae. maybe give to guard medicae as well?
/datum/access/cmedicae
	id = access_cmedicae
	desc = "Village Medicae"

/var/const/access_cminer = 231 //for village miners. dont need it to gain access, but for 'fancy' mining equipment.
/datum/access/cminer
	id = access_cminer
	desc = "Village Miner" // unused for time being


/var/const/access_administratum = 212
/datum/access/administratum
	id = access_administratum
	desc = "Administratum Doors"

/var/const/access_advchapel = 213
/datum/access/sob
	id = access_advchapel
	desc = "Sanctified chapel Access" // used for certain places in the chapel so only the abbot and sobs can get in.


// REWORKED ID AREA, NEW ACCESS

/var/const/access_deadwood = 244
/datum/access/deadwood
	id = access_deadwood
	desc = "Deadwood Estate Access"

/var/const/access_daemon = 247
/datum/access/daemon
	id = access_daemon
	desc = "Daemon Access" // i dont think it has any doors attached yet. just inq bait

/var/const/access_pathfinder = 253
/datum/access/pathfinder
	id = access_pathfinder
	desc = "Pathfinder Estate Access"

/var/const/access_barentry = 255
/datum/access/barentry
	id = access_barentry
	desc = "bar entry Estate Access"


/var/const/access_mining1 = 260
/datum/access/mining1
	id = access_mining1
	desc = "Mining 1 Access"

/var/const/access_mining2 = 261
/datum/access/mining2
	id = access_mining2
	desc = "Mining 2 Access"

/var/const/access_mining3 = 262
/datum/access/mining3
	id = access_mining3
	desc = "Mining 3 Access"

/var/const/access_inquisition_fancy = 302
/datum/access/access_inquisition_fancy
	id = access_inquisition_fancy
	desc = "inquisition shuttle/fancy parts of ship access"

/var/const/access_monastary = 333
/datum/access/monastary
	id = access_monastary
	desc = "monastary access"


