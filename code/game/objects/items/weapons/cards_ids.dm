/* Cards
 * Contains:
 *		DATA CARD
 *		ID CARD
 *		FINGERPRINT CARD HOLDER
 *		FINGERPRINT CARD
 */



/*
 * DATA CARDS - Used for the teleporter
 */
/obj/item/card
	name = "card"
	desc = "Does card things."
	icon = 'icons/obj/card.dmi'
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/associated_account_number = 0

	var/list/files = list(  )

/obj/item/card/data
	name = "data disk"
	desc = "A disk of data."
	icon_state = "data"
	var/function = "storage"
	var/data = "null"
	var/special = null
	item_state = "card-id"

/obj/item/card/data/verb/label(t as text)
	set name = "Label Disk"
	set category = "Object"
	set src in usr

	if (t)
		src.SetName(text("data disk- '[]'", t))
	else
		src.SetName("data disk")
	src.add_fingerprint(usr)
	return

/obj/item/card/data/clown
	name = "\proper the coordinates to clown planet"
	icon_state = "data"
	item_state = "card-id"
	level = 2
	desc = "This card contains coordinates to the fabled Clown Planet. Handle with care."
	function = "teleporter"
	data = "Clown Land"

/*
 * ID CARDS
 */

/obj/item/card/emag_broken
	desc = "It's a card with a magnetic strip attached to some circuitry. It looks too busted to be used for anything but salvage."
	name = "broken cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)

/obj/item/card/emag
	desc = "It's a card with a magnetic strip attached to some circuitry."
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)
	var/uses = 10

var/const/NO_EMAG_ACT = -50
/obj/item/card/emag/resolve_attackby(atom/A, mob/user)
	var/used_uses = A.emag_act(uses, user, src)
	if(used_uses == NO_EMAG_ACT)
		return ..(A, user)

	uses -= used_uses
	A.add_fingerprint(user)
	if(used_uses)
		log_and_message_admins("emagged \an [A].")

	if(uses<1)
		user.visible_message("<span class='warning'>\The [src] fizzles and sparks - it seems it's been used once too often, and is now spent.</span>")
		user.drop_item()
		var/obj/item/card/emag_broken/junk = new(user.loc)
		junk.add_fingerprint(user)
		qdel(src)

	return 1

/obj/item/card/id
	name = "identification card"
	desc = "A card used to provide ID and determine access."
	icon_state = "id"
	item_state = "card-id"
	sales_price = 0 //just to stop trolling

	grab_sound = 'sound/items/handle/syringe_pickup.ogg' //It sounds like a card ok?
	drop_sound = 'sound/items/handle/syringe_drop.ogg'

	var/access = list()
	var/registered_name = "Unknown" // The name registered_name on the card
	slot_flags = SLOT_ID

	var/age = "\[UNSET\]"
	var/blood_type = "\[UNSET\]"
	var/dna_hash = "\[UNSET\]"
	var/fingerprint_hash = "\[UNSET\]"
	var/sex = "\[UNSET\]"
	var/icon/front
	var/icon/side

	//alt titles are handled a bit weirdly in order to unobtrusively integrate into existing ID system
	var/assignment = null	//can be alt title or the actual job
	var/rank = null			//actual job
	var/dorm = 0			// determines if this ID has claimed a dorm already

	var/job_access_type     // Job type to acquire access rights from, if any

	var/datum/mil_branch/military_branch = null //Vars for tracking branches and ranks on multi-crewtype maps
	var/datum/mil_rank/military_rank = null

/obj/item/card/id/New()
	..()
	if(job_access_type)
		var/datum/job/j = SSjobs.GetJobByType(job_access_type)
		if(j)
			rank = j.title
			assignment = rank
			access |= j.get_access()

/obj/item/card/id/examine(mob/user)
	set src in oview(1)
	if(in_range(usr, src))
		show(usr)
		to_chat(usr, desc)
	else
		to_chat(usr, "<span class='warning'>It is too far away.</span>")

/obj/item/card/id/proc/prevent_tracking()
	return 0

/obj/item/card/id/proc/show(mob/user as mob)
	if(front && side)
		user << browse_rsc(front, "front.png")
		user << browse_rsc(side, "side.png")
	var/datum/browser/popup = new(user, "idcard", name, 600, 250)
	popup.set_content(dat())
	popup.set_title_image(usr.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()
	return

/obj/item/card/id/proc/update_name()
	var/final_name = "[registered_name]'s ID Card"
	if(military_rank && military_rank.name_short)
		final_name = military_rank.name_short + " " + final_name
	if(assignment)
		final_name = final_name + " ([assignment])"
	SetName(final_name)

/obj/item/card/id/proc/set_id_photo(var/mob/M)
	front = getFlatIcon(M, SOUTH, always_use_defdir = 1)
	side = getFlatIcon(M, WEST, always_use_defdir = 1)

/mob/proc/set_id_info(var/obj/item/card/id/id_card, var/obj/item/card/id/dog_tag)
	id_card.age = 0
	id_card.registered_name		= real_name
	id_card.sex 				= capitalize(gender)
	id_card.set_id_photo(src)

	if(dna)
		id_card.blood_type		= dna.b_type
		id_card.dna_hash		= dna.unique_enzymes
		id_card.fingerprint_hash= md5(dna.uni_identity)
	id_card.update_name()

/mob/living/carbon/human/set_id_info(var/obj/item/card/id/id_card)
	..()
	id_card.age = age

	if(GLOB.using_map.flags & MAP_HAS_BRANCH)
		id_card.military_branch = char_branch

	if(GLOB.using_map.flags & MAP_HAS_RANK)
		id_card.military_rank = char_rank

/obj/item/card/id/proc/dat()
	var/list/dat = list("<table><tr><td>")
	dat += text("Name: []</A><BR>", registered_name)
	dat += text("Sex: []</A><BR>\n", sex)
	dat += text("Age: []</A><BR>\n", age)

	if(GLOB.using_map.flags & MAP_HAS_BRANCH)
		dat += text("Branch: []</A><BR>\n", military_branch ? military_branch.name : "\[UNSET\]")
	if(GLOB.using_map.flags & MAP_HAS_RANK)
		dat += text("Rank: []</A><BR>\n", military_rank ? military_rank.name : "\[UNSET\]")

	dat += text("Assignment: []</A><BR>\n", assignment)
	dat += text("Fingerprint: []</A><BR>\n", fingerprint_hash)
	dat += text("Blood Type: []<BR>\n", blood_type)
	dat += text("DNA Hash: []<BR><BR>\n", dna_hash)
	if(front && side)
		dat +="<td align = center valign = top>Photo:<br><img src=front.png height=80 width=80 border=4><img src=side.png height=80 width=80 border=4></td>"
	dat += "</tr></table>"
	return jointext(dat,null)

/obj/item/card/id/attack_self(mob/user as mob)
	user.visible_message("\The [user] shows you: \icon[src] [src.name]. The assignment on the card: [src.assignment]",\
		"You flash your ID card: \icon[src] [src.name]. The assignment on the card: [src.assignment]")

	src.add_fingerprint(user)
	return

/obj/item/card/id/GetAccess()
	return access

/obj/item/card/id/GetIdCard()
	return src

/obj/item/card/id/verb/read()
	set name = "Read ID Card"
	set category = "Object"
	set src in usr

	to_chat(usr, text("\icon[] []: The current assignment on the card is [].", src, src.name, src.assignment))
	to_chat(usr, "The blood type on the card is [blood_type].")
	to_chat(usr, "The DNA hash on the card is [dna_hash].")
	to_chat(usr, "The fingerprint hash on the card is [fingerprint_hash].")
	return

/obj/item/card/id/silver
	name = "identification card"
	desc = "A silver card which shows honour and dedication."
	icon_state = "silver"
	item_state = "silver_id"
	job_access_type = /datum/job/hop

/obj/item/card/id/gold
	name = "golden writ"
	desc = "A golden writ from the High Lords of Terra naming the owner a Rogue Trader."
	icon_state = "gold"
	item_state = "gold_id"
	job_access_type = /datum/job/captain

/obj/item/card/id/syndicate_command
	name = "syndicate ID card"
	desc = "An ID straight from the Syndicate."
	registered_name = "Syndicate"
	assignment = "Syndicate Overlord"
	access = list(access_syndicate, access_external_airlocks)

/obj/item/card/id/captains_spare
	name = "captain's spare ID"
	desc = "The spare ID of the High Lord himself."
	icon_state = "gold"
	item_state = "gold_id"
	registered_name = "Captain"
	assignment = "Captain"

/obj/item/card/id/captains_spare/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/synthetic
	name = "\improper Synthetic ID"
	desc = "Access module for lawed synthetics."
	icon_state = "id-robot"
	item_state = "tdgreen"
	assignment = "Synthetic"

/obj/item/card/id/synthetic/New()
	access = get_all_station_access() + access_synth
	..()

/obj/item/card/id/centcom
	name = "\improper CentCom. ID"
	desc = "An ID straight from Cent. Com."
	icon_state = "centcom"
	registered_name = "Central Command"
	assignment = "General"
/obj/item/card/id/centcom/New()
	access = get_all_centcom_access()
	..()

/obj/item/card/id/centcom/station/New()
	..()
	access |= get_all_station_access()

/obj/item/card/id/centcom/ERT
	name = "\improper Emergency Response Team ID"
	assignment = "Emergency Response Team"

/obj/item/card/id/centcom/ERT/New()
	..()
	access |= get_all_station_access()

/obj/item/card/id/all_access
	name = "\improper Card of Terra"
	desc = "The sacred card of the High Lords of Terra."
	icon_state = "data"
	item_state = "tdgreen"
	registered_name = "Highest Lord of Terra"
	assignment = "Highest Lord of Terra"
/obj/item/card/id/all_access/New()
	access = get_access_ids()
	..()

// Department-flavor IDs
/obj/item/card/id/medical
	name = "identification card"
	desc = "A card issued to medical staff."
	icon_state = "med"
	job_access_type = /datum/job/doctor

/obj/item/card/id/medical/chemist
	job_access_type = /datum/job/chemist

/obj/item/card/id/medical/geneticist
	job_access_type = /datum/job/geneticist

/obj/item/card/id/medical/psychiatrist
	job_access_type = /datum/job/psychiatrist

/obj/item/card/id/medical/paramedic
	job_access_type = /datum/job/ig/medicae

/obj/item/card/id/medical/head
	name = "identification card"
	desc = "A card which represents care and compassion."
	icon_state = "medGold"
	job_access_type = /datum/job/cmo

/obj/item/card/id/security
	name = "identification card"
	desc = "A card issued to security staff."
	icon_state = "sec"
	job_access_type = /datum/job/officer

/obj/item/card/id/security/warden
	job_access_type = /datum/job/warden

/obj/item/card/id/security/detective
	job_access_type = /datum/job/detective

/obj/item/card/id/security/head
	name = "identification card"
	desc = "A card which represents honor and protection."
	icon_state = "secGold"
	job_access_type = /datum/job/ig/commissar

/obj/item/card/id/engineering
	name = "identification card"
	desc = "A card issued to engineering staff."
	icon_state = "eng"
	job_access_type = /datum/job/engineer
/*
/obj/item/card/id/engineering/atmos
	job_access_type = /datum/job/atmos
*/
/obj/item/card/id/engineering/head
	name = "identification card"
	desc = "A card which represents creativity and ingenuity."
	icon_state = "engGold"
	job_access_type = /datum/job/magos

/obj/item/card/id/science
	name = "identification card"
	desc = "A card issued to science staff."
	icon_state = "sci"
	job_access_type = /datum/job/scientist
/*
/obj/item/card/id/science/xenobiologist
	job_access_type = /datum/job/xenobiologist
*/
/obj/item/card/id/science/roboticist
	job_access_type = /datum/job/roboticist

/obj/item/card/id/science/head
	name = "identification card"
	desc = "A card which represents knowledge and reasoning."
	icon_state = "sciGold"
	job_access_type = /datum/job/rd

/obj/item/card/id/cargo
	name = "identification card"
	desc = "A card issued to cargo staff."
	icon_state = "cargo"
	job_access_type = /datum/job/cargo_tech

/obj/item/card/id/cargo/mining
	job_access_type = /datum/job/mining

/obj/item/card/id/cargo/head
	name = "identification card"
	desc = "A card which represents service and planning."
	icon_state = "cargoGold"
	job_access_type = /datum/job/qm

/obj/item/card/id/civilian
	name = "identification card"
	desc = "A card issued to civilian staff."
	icon_state = "civ"
	//job_access_type = /datum/job/assistant

/obj/item/card/id/innkey1
	name = "inn room key 1"
	desc = "A key that opens room 1 of the inn"
	icon_state = "key2"
	access = list(access_inn1)
	grab_sound = 'sound/items/keyring_up.ogg'

/obj/item/card/id/innkey2
	name = "inn room key 2"
	desc = "A key that opens room 2 of the inn"
	icon_state = "key3"
	access = list(access_inn2)
	grab_sound = 'sound/items/keyring_up.ogg'

/obj/item/card/id/innkey3
	name = "inn room key 3"
	desc = "A key that opens room 3 of the inn"
	icon_state = "key4"
	access = list(access_inn3)
	grab_sound = 'sound/items/keyring_up.ogg'

/obj/item/card/id/civilian/bartender
	job_access_type = /datum/job/bartender

/obj/item/card/id/civilian/chef
	job_access_type = /datum/job/chef

/obj/item/card/id/civilian/botanist
	job_access_type = /datum/job/hydro

/obj/item/card/id/civilian/janitor
	job_access_type = /datum/job/janitor

/obj/item/card/id/civilian/librarian
	job_access_type = /datum/job/librarian

/obj/item/card/id/civilian/internal_affairs_agent
	job_access_type = /datum/job/inquisitor

/obj/item/card/id/inquisition/principal_agent
	job_access_type = /datum/job/inquisitor

/obj/item/card/id/inquisition/update_name()
	var/final_name = "[registered_name]"
	if(military_rank && military_rank.name_short)
		final_name = military_rank.name_short + " " + final_name
	if(assignment)
		final_name = final_name + " ([assignment])"
	SetName(final_name)

/obj/item/card/id/civilian/chaplain
	job_access_type = /datum/job/chaplain

/obj/item/card/id/pilgrim/penitent
	job_access_type = /datum/job/penitent

/obj/item/card/id/pilgrim/innkeeper
	job_access_type = /datum/job/bartender //TODO tweak to village bar
	access = list(access_inn1, access_inn2, access_inn3) //lets innkeeper access his rented rooms
/obj/item/card/id/civilian/head //This is not the HoP. There's no position that uses this right now.
	name = "identification card"
	desc = "A card which represents common sense and responsibility."
	icon_state = "civGold"

/obj/item/card/id/merchant
	name = "identification card"
	desc = "A card issued to Merchants, indicating their right to sell and buy goods."
	icon_state = "trader"
	access = list(access_merchant)

/obj/item/card/id/dog_tag
	var/warfare_faction = null
	icon_state = "dogtag"
	item_state = "dogtag"
	desc = "A metal dog tag. Functions like an ID."

/obj/item/card/id/dog_tag/update_name()
	var/final_name = "[registered_name]'s Dog Tag"
	if(military_rank && military_rank.name_short)
		final_name = military_rank.name_short + " " + final_name
	if(assignment)
		final_name = final_name + " ([assignment])"
	SetName(final_name)

/mob/living/carbon/human/set_id_info(var/obj/item/card/id/dog_tag)
	..()
	dog_tag.age = age

/obj/item/card/id/dog_tag/guardsman
	icon_state = "tagred"
	access = list(access_maint_tunnels, access_security)

/obj/item/card/id/dog_tag/guardsman/update_name()
	var/final_name = "[registered_name]"
	if(military_rank && military_rank.name_short)
		final_name = military_rank.name_short + " " + final_name
	if(assignment)
		final_name = final_name + " ([assignment])"
	SetName(final_name)

/obj/item/card/id/commissar
	name = "officio prefectus dog tag"
	desc = "A metal dog tag with a winged skull engraved on it's opposite side, representing honor of the Officio Prefectus and Commissar and functioning like an ID."
	assignment = "Commissar"
	icon_state = "tagred"
	item_state = "tagred"
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)

/obj/item/card/id/commissar/update_name()
	var/final_name = "[registered_name]"
	if(military_rank && military_rank.name_short)
		final_name = military_rank.name_short + " " + final_name
	if(assignment)
		final_name = final_name + " ([assignment])"
	SetName(final_name)

/obj/item/card/id/commissar/spare
	name = "commissar's spare dog tag"
	desc = "A spare dog tag with a winged skull engraved on it's opposite side, representing honor of the Officio Prefectum and Commissar."

/obj/item/card/id/dog_tag/kroot
	icon_state = "tagred"
	access = list(access_kroot)
	sales_price = 30


/obj/item/card/id/dog_tag/skitarii
	icon_state = "tagred"
	access = list(access_engine, access_construction, access_maint_tunnels, access_engine_equip, access_brig, access_medical, access_robotics,)

/obj/item/card/id/dog_tag/ork
	icon_state = "tagred"
	access = list(access_kroot)
	sales_price = 20


/obj/item/card/id/ring/tau
	icon_state = "tau"
	access = list(access_tau)
	desc = "An ornate ring forged by Tau craftsmen. Functions like an ID."
	sales_price = 40


/obj/item/card/id/ring/administrator
	icon_state = "admin_ring"
	access = list(access_admeme, access_clinic, access_administratum, access_bar, access_change_ids, access_keycard_auth, access_brig,)
	desc = "An ornate ring forged by Imperial jewelers. Functions like an ID."

/obj/item/card/id/ring/goldring
	name = "golden ring"
	icon_state = "goldring"
	desc = "A simple golden ring, can be combined with gems for some BLING BLING!"
	sales_price = 30

/obj/item/card/id/ring/disgracedmedicae
	name = "access card"
	icon_state = "medicae_ring"
	access = list(access_clinic)
	desc = "An old ring signifying your position as a medicae."
