/obj/item/gun/energy/laser
	name = "energy gun"
	desc = "Another bestseller of Lawson Arms and the FTU, the LAEP90 Perun is a versatile energy based sidearm, capable of switching between low, medium and high power projectile settings. In other words: stun, shock or kill."
	icon_state = "energystun100"
	item_state = null	//so the human update icon uses the icon_state instead.
	max_shots = 10
	fire_delay = 5
	sales_price = 30

	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energystun"

	projectile_type = /obj/item/projectile/beam/stun/shock
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energyshock"

	projectile_type = /obj/item/projectile/beam
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energykill"


	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="energystun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="energyshock"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="energykill"),
		)

/obj/item/gun/energy/laser/small
	name = "small energy gun"
	desc = "A smaller model of the versatile LAEP90 Perun, packing considerable utility in a smaller package. Best used in situations where full-sized sidearms are inappropriate."
	icon_state = "smallgunstun"
	max_shots = 5
	w_class = ITEM_SIZE_SMALL
	force = 2 //it's the size of a car key, what did you expect?
	modifystate = "smallgunstun"

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="smallgunstun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="smallgunshock"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/smalllaser, modifystate="smallgunkill"),
		)



/obj/item/gun/energy/laser/carbine
	name = "laser carbine"
	desc = "A Hephaestus Industries G40E carbine, designed to kill with concentrated energy blasts."
	icon_state = "laser"
	item_state = "laser"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 2
	accuracy = -2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser
	wielded_item_state = "laser-wielded"

/obj/item/gun/energy/h4
	name = "H4 laser pistol"
	icon_state = "h4"
	item_state = "ionpistol"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	force = 10
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser

/obj/item/gun/energy/laser/mounted
	self_recharge = 1
	use_external_power = 1
	one_hand_penalty = 0 //just in case

/obj/item/gun/energy/laser/practice
	name = "practice laser carbine"
	desc = "A modified version of the HI G40E, this one fires less concentrated energy bolts designed for target practice."
	icon_state = "laserp"
	projectile_type = /obj/item/projectile/beam/practice
	charge_cost = 10 //How much energy is needed to fire.

/obj/item/gun/energy/laser/practice/proc/hacked()
	return projectile_type != /obj/item/projectile/beam/practice

/obj/item/gun/energy/laser/practice/emag_act(var/remaining_charges, var/mob/user, var/emag_source)
	if(hacked())
		return NO_EMAG_ACT
	to_chat(user, "<span class='warning'>You disable the safeties on [src] and crank the output to the lethal levels.</span>")
	desc += " Its safeties are disabled and output is set to dangerous levels."
	projectile_type = /obj/item/projectile/beam/midlaser
	charge_cost = 20
	max_shots = rand(3,6) //will melt down after those
	return 1

/obj/item/gun/energy/laser/practice/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	if(hacked())
		max_shots--
		if(!max_shots) //uh hoh gig is up
			to_chat(user, "<span class='danger'>\The [src] sizzles in your hands, acrid smoke rising from the firing end!</span>")
			desc += " The optical pathway is melted and useless."
			projectile_type = null

obj/item/gun/energy/retro
	name = "retro laser"
	icon_state = "retro"
	item_state = "retro"
	desc = "An older model of the basic lasergun. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	fire_delay = 15 //old technology, and a pistol

/obj/item/gun/energy/captain
	name = "antique las-pistol"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "An ancient weapon acquired by the Rogue Trader decades ago, it's kept them alive more than once."
	force = 7.5
	slot_flags = SLOT_S_STORE|SLOT_BELT //too unusually shaped to fit in a holster
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	max_shots = 5 //to compensate a bit for self-recharging
	one_hand_penalty = 1 //a little bulky
	self_recharge = 1

/obj/item/gun/energy/lasercannon
	name = "laser cannon"
	desc = "With the laser cannon, the lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core. This incredible technology may help YOU achieve high excitation rates with small laser volumes!"
	icon_state = "lasercannon"
	item_state = null
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	slot_flags = SLOT_BELT|SLOT_BACK
	one_hand_penalty = 6 //large and heavy
	w_class = ITEM_SIZE_HUGE
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 40
	max_shots = 6
	accuracy = -1
	fire_delay = 20
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = 1
	use_external_power = 1
	recharge_time = 10
	accuracy = 0 //mounted laser cannons don't need any help, thanks
	one_hand_penalty = 0

/obj/item/gun/energy/plasmacannon
	name = "Plasma cannon"
	desc = "A very rare plasma rifle, used by the finest people in the galaxy. It has a label on the backside which states (DANGER! Highly unstable liquid)."
	icon_state = "chaosplaspistol"
	item_state = null
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	slot_flags = SLOT_BELT|SLOT_BACK
	one_hand_penalty = 6 //large and heavy
	w_class = ITEM_SIZE_HUGE
	projectile_type = /obj/item/projectile/beam/plasmabeam
	charge_cost = 2000
	max_shots = 20
	accuracy = 2
	fire_delay = 70
	wielded_item_state = "gun_wielded"



////////Laser Tag////////////////////

/obj/item/gun/energy/lasertag
	name = "laser tag gun"
	item_state = "laser"
	desc = "Standard issue weapon of the Imperial Guard."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = 1
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	var/required_vest

/obj/item/gun/energy/lasertag/special_check(var/mob/living/carbon/human/M)
	if(ishuman(M))
		if(!istype(M.wear_suit, required_vest))
			to_chat(M, "<span class='warning'>You need to be wearing your laser tag vest!</span>")
			return 0
	return ..()

/obj/item/gun/energy/lasertag/blue
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	required_vest = /obj/item/clothing/suit/bluetag

/obj/item/gun/energy/lasertag/red
	icon_state = "redtag"
	item_state = "redtag"
	projectile_type = /obj/item/projectile/beam/lastertag/red
	required_vest = /obj/item/clothing/suit/redtag


//Las weapons

/obj/item/gun/energy/las/lasgun
	name = "Kantrael M36 Lasgun"
	desc = "The M36 Lasgun is of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its cheap price and reliability."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 12
	one_hand_penalty = 1.7
	fire_delay = 3
	accuracy = -3
	move_delay = 3
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 80
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"
	sales_price = 35

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=3, one_hand_penalty=1.7, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=4, one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="overcharge", fire_delay = 4, one_hand_penalty=2.125, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=140),
		)

/obj/item/gun/energy/las/lasgun/rare
	name = "Masterwork Kantrael M36 Lasgun"
	desc = "The M36 Lasgun is of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its low cost and reliability. This variant has modified heatsink and rearranged crystal assembly."
	force = 15
	one_hand_penalty = 1.2
	charge_cost = 75
	fire_delay = 2.2
	move_delay = 2.5
	sales_price = 45

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=3, one_hand_penalty=1.7, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=4, one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="overcharge",       burst=1, fire_delay = 4, one_hand_penalty=2.125, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=120),
		)

/obj/item/gun/energy/las/lasgun/lucius
	name = "Lucius No.98 Lasgun"
	desc = "A Lucius-made Lasgun, unlike STC-based Lasgun, the No.98 operates in a higher than average 21 megathoule while using a standard Power cell, resulting in a more powerful shot than Kantrael and many other lasgun patterns but causing it to be more likely to overheat."
	icon_state = "lucius"
	item_state = "luscius"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 2
	fire_delay = 4
	accuracy = -3
	move_delay = 3.2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/lucius
	charge_cost = 120
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "luscius-wielded"
	sales_price = 40

	firemodes = list(
		list(mode_name="semi-automatic", fire_delay = 4, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="overcharge", fire_delay = 5, one_hand_penalty=2.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/lucius/overcharge, charge_cost=200),
		)

/obj/item/gun/energy/las/lasgun/catachan
	name = "Catachan Mark IV Lascarbine"
	desc = "The Mark IV lascarbine is a special lascarbine used by Catachan Jungle Fighters for CQC purposes."
	icon_state = "lascar"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 18
	one_hand_penalty = 0.7
	accuracy = -3
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 60
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"
	sales_price = 45

	fire_delay = 1 // 0.2 seconds

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2, one_hand_penalty=1.1, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3, one_hand_penalty=2.2, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="overcharge",       burst=1, fire_delay=3, one_hand_penalty=1.375, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=110),
		)

/obj/item/gun/energy/las/lasgun/tinkered
	name = "Kantrael M36 'Veteran Configuration' Lasgun"
	desc = "The M36 Lasgun is of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its cheap price and reliability. This variant has been upgraded to consume less energy from the ammo cell."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 12
	one_hand_penalty = 1.5
	accuracy = -2
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 70
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"
	sales_price = 40

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2.5, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3.5,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="overcharge", burst=1, fire_delay=3.5, one_hand_penalty=2.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=120),
		)

/obj/item/gun/energy/las/lasgun/lucius/tinkered
	name = "Lucius No.98 'Veteran Configuration' Lasgun"
	desc = "A Lucius-pattern lasgun No.98 operates in a higher than average 21 megathoule while using a standard Power cell, resulting in a more powerful shot than Kantrael and many other lasgun patterns but causing it to be more likely to overheat. This variant has a modified heatsink and crystal assembly, the frame has also been replaced with a light polymer."
	armor_penetration = 15
	force = 12
	one_hand_penalty = 1.8
	move_delay = 2.5
	fire_delay = 3.5
	charge_cost = 90
	sales_price = 45

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2.5, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3.5,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="overcharge", burst=1, fire_delay=3.5, one_hand_penalty=2.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/lucius/overcharge, charge_cost=180),
		)

/obj/item/gun/energy/las/lasgun/tinkered/catachan
	name = "Catachan Mark IV 'Veteran Configuration' Lascarbine"
	desc = "The Mark IV lascarbine is a special lascarbine used by Catachan Jungle Fighters for CQC purposes. This variant has a modified heatsink and crystal assembly."
	icon_state = "lascar"
	item_state = "lascar"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 22
	armor_penetration = 8
	one_hand_penalty = 1.5
	accuracy = -2
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 55
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lascar-wielded"
	sales_price = 50

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2.5, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3.5,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="overcharge",       burst=1, fire_delay=3.5, one_hand_penalty=2.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=100),
		)

/obj/item/gun/energy/las/hotshot
	name = "Ryza Pattern Hot-Shot Lasgun"
	desc = "The favored standard weapon of Tempestus Scions, reknowned for its damage and penetration."
	icon_state = "hotshotgun"
	item_state = "hotshotgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 22
	one_hand_penalty = 1.8
	accuracy = -2.5
	move_delay = 4
	self_recharge = 1
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/hotshot
	charge_cost = 150
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lascar-wielded"
	sales_price = 140


	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=3.1, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=3.1,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0.7),
		)

obj/item/gun/energy/las/hotshot/bloodpact
	name = "Khornate Lasgun"
	desc = "The favored ranged weapon of Khorne crazed cultists. Especially the automatic setting."
	force = 38 // muh bayonet
	icon_state = "bloodlasgun"
	item_state = "bloodlasgun"

	firemodes = list(
		list(mode_name="automatic", burst=1, fire_delay=3.1,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0.7),
		list(mode_name="fuller automatic", burst=3, fire_delay=5.1,    one_hand_penalty=7, burst_accuracy=list(-2,-3,-4), dispersion=list(0.2, 0.3, 0.3), automatic = 0.7),
		)

/obj/item/gun/energy/las/laspistol
	name = "Kantrael MG Laspistol"
	desc = "Kantrael MG is a Cadian laspistol, frequently seen as a cheap and reliable sidearm. This variant has been smuggled from the factory before completion, and thus bears no markings."
	icon_state = "laspistol"
	item_state = "laspistol"
	slot_flags = SLOT_BELT|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = -3.2
	move_delay = 1.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 90
	armor_penetration = 5
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	sales_price = 20
	wielded_item_state = "machinepistol-wielded" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="overcharge",       burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=180),
		)

/obj/item/gun/energy/las/laspistol/lord
	name = "Rogue Trader's Artificer Pistol"
	desc = "This Artificer pistol has the Rogue Trader's initials stamped. Well. More like engraved into pure gold, in the handle. It is magnificant in handling and detail. Larger in size than most las pistols, yet more lightweight. All the luxurious makings of a weapon from Terra itself."
	icon_state = "lordlaspistol"
	item_state = "lordlaspistol"
	accuracy = -4
	move_delay = 3.5 // do not want the RT's pistol as a frag gamer weapon. its for self defence.
	charge_cost = 45
	charge_meter = FALSE //must have, due to having only 1 item state.
	sales_price = 35
	firemodes = list(
		list(mode_name="semi-automatic",   burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic", 	burst=3, fire_delay=3.1,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0.7),
	)


/obj/item/gun/energy/las/laspistol/defender
	name = "Kantrael MG Defender Laspistol"
	desc = "Kantrael MG is a Cadian laspistol, frequently seen as a cheap and reliable sidearm. This variant bears no markings except standard serial number and the Imperial Aquila, belonging to a civilian modification."
	icon_state = "laspistolciv"

/obj/item/gun/energy/las/laspistol/militarum
	name = "Astra Militarum Kantrael MG Laspistol"
	desc = "Kantrael MG is a Cadian laspistol, frequently seen as a cheap and reliable sidearm. This variant bears the Astra Militarum markings, issued to the enlisted personnel and non-commissioned officers"
	icon_state = "laspistol"
	item_state = "laspistol"
	charge_cost = 80

/obj/item/gun/energy/las/laspistol/militarum/lucius
	name = "Astra Militarum Lucius-pattern Laspistol"
	desc = "Lucius-pattern laspistol is a standard-issue sidearm for the enlisted personnel, non-commissioned officers and commanding officers of the Death Korps of Krieg."
	icon_state = "laspistol"
	item_state = "laspistol"
	force = 10
	one_hand_penalty = 2.55
	move_delay = 1.5
	accuracy = -3.2
	fire_delay = 2.5
	armor_penetration = 8.75
	charge_cost = 100
	sales_price = 25

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2.5, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="overcharge",       burst=1, fire_delay=3.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/lucius/overcharge, charge_cost=200),
		)

/obj/item/gun/energy/las/laspistol/militarum/lucius/sister
	name = "Astra Militarum Laspistol"
	desc = "Pattern laspistol is a standard-issue sidearm for the enlisted personnel, non-commissioned officers and commanding officers of the Astra Militarum, this one seems to be have been modified for the gloves of Adepta Sororitas Power Armor."
	icon_state = "laspistol"
	item_state = "laspistol"
	accuracy = -1
	fire_delay = 2

/obj/item/gun/energy/las/laspistol/mechanicus
	name = "Adeptus Mechanicus Kantrael MG Laspistol"
	desc = "Kantrael MG is a Cadian laspistol, frequently seen as a cheap and reliable sidearm. This variant has been modified by Adeptus Mechanicus to concentrate the beam, resulting in more powerful shot for their self-defense purposes."
	icon_state = "laspistol"
	item_state = "laspistol"
	move_delay = 1.5
	one_hand_penalty = 1
	accuracy = -2.2
	fire_delay= 3
	armor_penetration = 12.5

/obj/item/gun/energy/las/laspistol/commissar
	name = "Officio Prefectus Kantrael MG Laspistol"
	desc = "Kantrael MG is a Cadian laspistol, frequently seen as a cheap and reliable sidearm. This variant has been modified to amplify the overcharge mode, issued to the Officio Prefectus for their purposes."
	icon_state = "laspistol"
	item_state = "laspistol"
	move_delay = 1.5
	one_hand_penalty = 1
	accuracy = -3.2
	fire_delay= 3
	armor_penetration = 12.5
	sales_price = 25

	firemodes = list(
		list(mode_name="semi-automatic", fire_delay = 4, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="overcharge", fire_delay = 5, one_hand_penalty=2.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=200),
		list(mode_name="execution", fire_delay = 5, one_hand_penalty=3, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/execution, charge_cost=3000),
		)


//Tau weapons

/obj/item/gun/energy/pulse/ionrifle
	name = "ION rifle"
	desc = "The ION rifle is a high-energy device, firing electromagnetic fields that cause explosive reaction target as a result of direct transfer of energy at an atomic level."
	icon_state = "ionriflet"
	item_state = "ionriflet"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 2
	accuracy = -1.5
	move_delay = 5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/ion
	cell_type = /obj/item/cell/ion
	ammoType = /obj/item/cell/ion
	wielded_item_state = "ionriflet-wielded"
	sales_price = 100

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=10, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		)

/obj/item/gun/energy/pulse/pulsepistol
	name = "pulse pistol"
	desc = "The trusty sidearm of the T'au Empire."
	icon_state = "pulsep"
	item_state = "pulsep"
	slot_flags = SLOT_BELT|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = -2.5
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulsepistol
	cell_type = /obj/item/cell/pulserifle
	ammoType = /obj/item/cell/pulserifle
	sales_price = 69
	wielded_item_state = "machinepistol-wielded" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

	firemodes = list(
		list(mode_name="semi-auto",       burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		)

/obj/item/gun/energy/pulse/pulserifle
	name = "pulse rifle"
	desc = "The standard-issue pulse rifle of the Fire Warrior Caste"
	icon_state = "pulseb"
	item_state = "pulseb"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 2
	accuracy = -2
	move_delay = 4
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulserifle
	cell_type = /obj/item/cell/pulserifle
	ammoType = /obj/item/cell/pulserifle
	wielded_item_state = "pulseb_wielded"
	sales_price = 129

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2, one_hand_penalty=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)


/obj/item/gun/energy/pulse/plasma/
	name = "plasma"
	desc = "If you see this, please ping Zab on discord. Or complain that staff used the wrong object"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "prifle"
	item_state = "prifle"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 12 //heavy af fam
	accuracy = -2
	move_delay = 6 //dont want speedy bois
	fire_delay = 13 // something something its recharging
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulserifle
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	charge_cost = 900
	wielded_item_state = "ionrifle-wielded"




/obj/item/gun/energy/pulse/plasma/rifle
	name = "plasma rifle"
	desc = "A plasma rifle. Don't roll a 1! (cannot explode yet)"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "prifle"
	item_state = "prifle"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 12 //heavy af fam
	accuracy = -4
	move_delay = 6 //dont want speedy bois
	fire_delay = 14 // something something its recharging
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmarifle
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	charge_cost = 375
	wielded_item_state = "ionrifle-wielded"
	sales_price = 119

/obj/item/gun/energy/pulse/plasma/pistol
	name = "plasma pistol"
	desc = "A plasma pistol. Fun in a small package. Don't roll a 1! (cannot explode yet)"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "ppistol"
	item_state = "ppistol"
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 6 //change later?
	accuracy = -5
	move_delay = 3 //it a pistol, but giga cool plasma
	fire_delay = 9 // unsure if decent. dont want fast fire rate
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	charge_cost = 250
	wielded_item_state = "pulse_pistol"
	sales_price = 69

/obj/item/gun/energy/pulse/plasma/pistol/astarte
	name = "Astartes plasma pistol"
	desc = "The plasma pistol wargear of an Astartes, upgraded with increased cooling vents and other upgrades only an Astartes is capable of having access to.(cannot explode yet)"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "ppistol"
	item_state = "ppistol"
	str_requirement = 18 // astartes moment
	force = 20
	one_hand_penalty = 5 //change later?
	accuracy = -4
	move_delay = 3 //it a pistol
	fire_delay = 9 // unsure if decent. dont want fast fire rate
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol/astartes
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	charge_cost = 250
	wielded_item_state = "pulse_pistol"
	sales_price = 99


/obj/item/gun/energy/pulse/plasma/pistol/chaos // want chaos pistol better than normal. as chaos will be worsely equipped, they need their shining weapons to push up the average
	name = "Chaotic plasma pistol"
	desc = "A plasma pistol blessed by the ruinous powers.  Don't roll a 1! (cannot explode yet)"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "chaosppistol"
	item_state = "chaosppistol"
	force = 10
	one_hand_penalty = 2 //change later?
	accuracy = -6
	move_delay = 3 //it a pistol
	fire_delay = 8 // unsure if decent. dont want fast fire rate
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	charge_cost = 250
	charge_meter = FALSE //no ammo icon state currently invisible
	wielded_item_state = "pulse_pistol"
	sales_price = 79


/obj/item/gun/energy/pulse/plasma/pistol/mechanicus
	name = "Ryza Pattern Plasma Pistol"
	desc = "A plasma pistol from the forge world of Ryza. It's adamantium receiver is detailed with the inscriptions of Ryza Secundus' factorium. (cannot explode yet)"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "toasterppistol"
	item_state = "toasterppistol"
	force = 10
	one_hand_penalty = 10 //until plasma is better balanced, wield this fancy one.
	accuracy = -4
	move_delay = 3
	fire_delay = 7 // want better than others. its adamantium
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	charge_cost = 200
	wielded_item_state = "pulse_pistol"