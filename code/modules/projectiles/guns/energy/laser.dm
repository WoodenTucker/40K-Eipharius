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

//NOT READY!

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
	accuracy = 0
	fire_delay = 20
	wielded_item_state = "gun_wielded"

/obj/item/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = 1
	use_external_power = 1
	recharge_time = 10
	accuracy = 0 //mounted laser cannons don't need any help, thanks
	one_hand_penalty = 0
//ALSO NOT READY
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
	desc = " Of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its cheap price and reliability. The Planet broke before the guard did."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 12
	one_hand_penalty = 1.7
	fire_delay = 3
	accuracy = 1
	move_delay = 3
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 90
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"
	sales_price = 35

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2.5, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=90),
		list(mode_name="3-round bursts", burst=3, fire_delay=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0, charge_cost=90),
		)


/obj/item/gun/energy/las/lasgun/shitty
	name = "Portsmith W. Lasrifle"
	desc = "The Portsmith W. Lasrifle is a basic, necessary rifle for smugglers and merchants to defend their lives, but most importantly, their precious cargo, from hostiles. Won't put up much of a fight against an organised enemy, but at least it uses small lasgun cells."
	icon_state = "semir"
	item_state = "semir"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 12
	one_hand_penalty = 3.5
	fire_delay = 5
	accuracy = 1
	move_delay = 5
	charge_cost = 130
	wielded_item_state = "semir"
	charge_meter = FALSE
	sales_price = null
	cell_type = /obj/item/cell/lasgun/small || /obj/item/cell/lasgun // starts with /small but can also use any /lasgun as well. do not change
	ammoType = /obj/item/cell/lasgun/small

/obj/item/gun/energy/las/lasgun/lucius
	name = "Lucius No.98 Lasgun"
	desc = "A Lucius-made Lasgun, unlike STC-based Lasgun, the No.98 operates in a higher than average 21 megathoule while using a standard Power cell, resulting in a more powerful shot than other pattern lasguns."
	icon_state = "lucius"
	item_state = "luscius"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 2
	fire_delay = 9
	accuracy = 3
	move_delay = 3.2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/lucius
	charge_cost = 125
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "luscius-wielded"
	sales_price = 30

	firemodes = list(
		list(mode_name="semi-automatic", fire_delay = 9, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=125),
		list(mode_name="overcharge", fire_delay = 12, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/lucius/overcharge, charge_cost=230),
		)


/obj/item/gun/energy/las/lasgun/catachan
	name = "Mark IV Lascarbine"
	desc = "The Mark IV lascarbine is a special lascarbine used by the Catachan Jungle Fighters. Excellent for warfare in jungle environments due to it's bayonet and light frame"
	icon_state = "lascarbine"
	item_state = "lascar"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 30
	one_hand_penalty = 5
	fire_delay = 3.5
	accuracy = 2
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 70
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lascar-wielded"
	sales_price = 35

	firemodes = list(
		list(mode_name="semi-automatic",   burst=1, fire_delay = 3.5, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=70),
		list(mode_name="overcharge", burst=1, fire_delay = 7.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=160),
		)

/obj/item/gun/energy/las/lasgun/accatran
	name = "Accatran Mark VI Pattern Lasgun"
	desc = "The Accatran Patterns are bullpup in design, affording them similar damage to that of a laspistol but with the capacity of a typical lasrifle and with a very high rate of fire for a lasgun. The choice pattern of the Elite Elysian Droptroopers."
	icon_state = "accatran"
	item_state = "lascar"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 2
	fire_delay = 0
	accuracy = -3
	burst = 1
	automatic = 1
	move_delay = 3.2
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/pistol
	charge_cost = 60
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lascar-wielded"
	sales_price = 50


	firemodes = list( null )


/obj/item/gun/energy/las/hotshot
	name = "Ryza Pattern Hot-Shot Lasgun"
	desc = "The favored standard weapon of Tempestus Scions, reknowned for its damage and penetration. It slowly recharges any lasgun cells loaded."
	icon_state = "hotshotgun"
	item_state = "lascar"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 22
	one_hand_penalty = 1.8
	accuracy = 0
	move_delay = 4
	self_recharge = 1
	recharge_time = 9
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/hotshot
	charge_cost = 220
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lascar-wielded"

	sales_price = 65


/*
obj/item/gun/energy/las/hotshot/bloodpact
	name = "Khornate Lasgun"
	desc = "The favored ranged weapon of Blood Pact Warriors."
	force = 35 // muh bayonet
	icon_state = "bloodlasgun"
	item_state = "lascar"
	accuracy = -1

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2.7, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=200),
		)

	sales_price = 50 // make it a bit worse than hotshot
*/
/obj/item/gun/energy/las/laspistol
	name = "Civitas Pattern Laspistol"
	desc = "The Civitas is both somewhat bulky and inefficient (owing to lower quality components than a military-grade laspistol), but remains popular due to its ease of manufacture, longevity and simplicity of maintenance. They are made on almost every hive world and often in the hands of civilians."
	icon_state = "laspistolciv"
	item_state = "chaosppistol" // just a red generic las on mob. replace asap
	slot_flags = SLOT_BELT|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = -1.5
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/pistol
	charge_cost = 110
	armor_penetration = 0
	cell_type = /obj/item/cell/lasgun/small || /obj/item/cell/lasgun
	ammoType =  /obj/item/cell/lasgun
	sales_price = 10
	wielded_item_state = "chaosppistol"


/obj/item/gun/energy/las/laspistol/accatran
	name = "Accatran MK II Pattern Laspistol"
	desc = "An older pattern of the Accatran Laspistols. Fully auto but extremely power inefficient and somewhat inaccurate."
	icon_state = "accatranp"
	item_state = "chaosppistol" // just a red generic las on mob. replace asap
	slot_flags = SLOT_BELT|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = -3.5 // a lot worse than others
	fire_delay = -1
	automatic = 1
	move_delay = 2.5
	charge_cost = 170
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	sales_price = 35
	wielded_item_state = "chaosppistol"

/obj/item/gun/energy/las/laspistol/lord
	name = "Artificer Laspistol"
	desc = "It is magnificant in handling and detail. Larger in size than most las pistols, yet more lightweight and extremely efficient in energy usage. All the luxurious makings of a weapon from Terra itself."
	icon_state = "lordlaspistol"
	charge_meter = FALSE //must have, due to having only 1 item state.
	accuracy = 1
	charge_cost = 45
	firemodes = list(
		list(mode_name="semi-automatic",   burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic", 	burst=3, fire_delay=3.1, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0.7),
	)
	sales_price = 80

/obj/item/gun/energy/las/laspistol/shitty
	name = "Portsmith W. Laspistol"
	desc = "The Laspistol variant of the Portsmith W. Lasrifle. Cheap, slow but better than nothing. Uses small lascells"
	icon_state = "semip"
	fire_delay = 5.5
	charge_cost = 140
	sales_price = null
	charge_meter = FALSE
	cell_type = /obj/item/cell/lasgun/small || /obj/item/cell/lasgun
	ammoType =  /obj/item/cell/lasgun
	sales_price = 2

/obj/item/gun/energy/las/laspistol/militarum
	name = "Kantrael MG Laspistol"
	desc = "Kantrael MG is a Heavy Cadian Laspistol used by their shock regiments' NCOs. It is slow firing but pacts a punch for a laspistol. It is also possible to overcharge."
	icon_state = "laspistol"
	accuracy = 0.5
	charge_cost = 90
	cell_type = /obj/item/cell/lasgun
	ammoType =  /obj/item/cell/lasgun
	sales_price = 20

	firemodes = list(
		list(mode_name="semi-automatic",   burst=1, fire_delay=1, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=110),
		list(mode_name="overcharge",       burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun, charge_cost=180),
		)

/obj/item/gun/energy/las/laspistol/militarum/bloodpact
	name = "Bloodpact Laspistol"
	desc = "A laspistol bearing the markings and colours of the Blood pact. Older in design and smaller, it is less efficient with it's lasgun cells than more modern variants."
	icon_state = "bloodlaspistol"
	accuracy = -1 // bloodpact should always be more innaccurate than their imperial counterparts
	charge_cost = 110

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=1, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",       burst=3, fire_delay=1, burst_accuracy=null, dispersion=null, automatic = 0.5),
		)

/obj/item/gun/energy/las/laspistol/militarum/lucius
	name = "Lucius-pattern Laspistol"
	desc = "A standard-issue sidearm for the enlisted personnel, non-commissioned officers and commanding officers of the Death Korps of Krieg. Can overcharge to have the same output as a rifle"
	icon_state = "luciuspistol"
	force = 10
	one_hand_penalty = 2.5
	move_delay = 1.5
	accuracy = 0.7
	fire_delay = 2.5
	armor_penetration = 8.75
	charge_cost = 120
	cell_type = /obj/item/cell/lasgun
	ammoType =  /obj/item/cell/lasgun
	sales_price = 25

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2.5, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=120),
		list(mode_name="Overcharged", 	fire_delay = 8, charge_cost = 240, projectile_type = /obj/item/projectile/energy/las/lasgun),
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
	accuracy = 0.5
	move_delay = 5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/ion
	cell_type = /obj/item/cell/ion
	ammoType = /obj/item/cell/ion
	wielded_item_state = "ionriflet-wielded"
	sales_price = 100

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=10, burst_accuracy=null, dispersion=null, automatic = 0),
		)

/obj/item/gun/energy/pulse/pulsepistol
	name = "pulse pistol"
	desc = "The trusty sidearm of the T'au Empire."
	icon_state = "pulsep"
	item_state = "pulsep"
	slot_flags = SLOT_BELT|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	force = 8
	accuracy = 0.5
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulsepistol
	cell_type = /obj/item/cell/pulserifle
	ammoType = /obj/item/cell/pulserifle
	sales_price = 49
	wielded_item_state = "machinepistol-wielded" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol

	firemodes = list(
		list(mode_name="semi-auto",       burst=1, fire_delay=3.5, burst_accuracy=null, dispersion=null, automatic = 0),
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
	accuracy = 0
	move_delay = 4
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulserifle
	cell_type = /obj/item/cell/pulserifle
	ammoType = /obj/item/cell/pulserifle
	wielded_item_state = "pulseb_wielded"
	sales_price = 79

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=3.5, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=6.5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)


/obj/item/gun/energy/pulse/plasma
	name = "plasma"
	desc = "If you see this, please ping Zab on discord. Or complain that staff used the wrong object"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "prifle"
	item_state = "ionrifle"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 12 //heavy af fam
	accuracy = 0
	self_recharge = 1
	recharge_time = 14 // With a fire delay of 19. You fire every 2.3 seconds. 1 recharge time is 1 second. Keep recharges to 1/6 and a bit per shot. We want people to NEED to reload in combat.
	move_delay = 6 //dont want speedy bois
	fire_delay = 0
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulserifle
	cell_type = /obj/item/cell/plasma
	ammoType =/obj/item/cell/plasma
	charge_cost = 1800
	wielded_item_state = "ionrifle-wielded"
	var/plasma_overheat = 1 // Keeping track on how overheated the gun is
	var/plasma_overheat_decay = 2 // The cooling of the gun per tick
	var/plasma_overheat_max = 100 // When the gun exploads
	Fire(atom/target, mob/living/user)
		if(plasma_overheat >= 50)
			to_chat(user, "The barrel starts to glow! You can feel heat comming from it.")
		if(plasma_overheat >= 60)
			to_chat(user, "You can feel the skin on your hands starting to burn.")
		if(plasma_overheat >= 90)
			to_chat(user, "You see a bright light comming from your weapon!")
		..()
		plasma_overheat += 15 // adding 15 heat for every pulling of the trigger (learn not to spam the fucking gun)
	Process()
		..()
		if(plasma_overheat >= 0)
			plasma_overheat -= plasma_overheat_decay // so the gun actually cools down
		else
			plasma_overheat = 0 // keepin the gun overheat above -1
			return
		if(plasma_overheat > plasma_overheat_max)
			explosion(src.loc, 0, 1, 2, 3) // explodes u, dealing a lot of damage, still (a little) chance to survive
	//firemodes = list(
		//list(mode_name="semi-charge", burst=1, fire_delay=19, burst_accuracy=null, dispersion=null, automatic = 0),
		//list(mode_name="overcharge", burst=1, fire_delay=19, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/pulse/pulserifle, charge_cost=150),
	//) firemodes will be added when someone can figure out how to make more overheat build up on the overcharge mode

/obj/item/gun/energy/pulse/plasma/rifle
	name = "plasma rifle"
	desc = "A plasma rifle. It has an overheat scale and on the end of it is written 'Boom!'."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "prifle"
	item_state = "ionrifle"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	force = 15
	one_hand_penalty = 12 //heavy af fam
	accuracy = 0.4
	move_delay = 6 //dont want speedy bois
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmarifle
	charge_cost = 1100
	wielded_item_state = "ionrifle-wielded"
	sales_price = 115 //funilly enough, plasma rifles are considered more common than plasma pistols in the imperial market, even then, they arent very common

/obj/item/gun/energy/pulse/plasma/pistol
	name = "plasma pistol"
	desc = "A plasma pistol. Great for dealing with threats swiftly.It has an overheat scale and on the end of it is written 'Boom!'."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "ppistol"
	item_state = "pulse_carbine"
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	force = 10
	one_hand_penalty = 7 //change later?
	accuracy = 0
	move_delay = 4 //it a pistol, but giga cool plasma
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	charge_cost = 800
	wielded_item_state = "pulse_carbine"
	sales_price = 120 //made with adamantium

/obj/item/gun/energy/pulse/plasma/pistol/chaos // want chaos pistol better than normal. as chaos will be worsely equipped, they need their shining weapons to push up the average
	name = "Chaotic plasma pistol"
	desc = "A plasma pistol blessed by the ruinous powers. You can feel the warp energy going trough it. It has an overheat scale and on the end of it is written 'Boom!'."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "chaosppistol"
	item_state = "pulse_pistol"
	force = 10
	one_hand_penalty = 6 //change later?
	accuracy = 0
	move_delay = 3.5 //it a pistol
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	charge_cost = 700
	charge_meter = FALSE //no ammo icon state currently invisible
	wielded_item_state = "pulse_pistol"
	sales_price = 79

/obj/item/gun/energy/pulse/plasma/pistol/mechanicus
	name = "Ryza Pattern Plasma Pistol"
	desc = "A plasma pistol from the forge world of Ryza. It's adamantium receiver is detailed with the inscriptions of Ryza Secundus' factorium. It has an overheat scale and on the end of it is written 'Boom!'."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "toasterppistol"
	item_state = "pulse_pistol"
	force = 10
	one_hand_penalty = 7 //until plasma is better balanced, wield this fancy one.
	accuracy = 1
	move_delay = 3.5
	recharge_time = 10
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	charge_cost = 700
	wielded_item_state = "pulse_pistol"
	sales_price = 140 //blessed by the omnissiah and made with adamantium

/*// rare plasma pistols removed until proper plasma balance
/obj/item/gun/energy/pulse/plasma/pistol/toaster
	name = "seolite plasma pistol"
	desc = "An ancient plasma pistol forged by seolite gun smiths, despite it's incredible age it shows no signs of decay. It has an overheat scale and on the end of it is written 'Boom!'."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "xenolpistol"
	item_state = "pulse_carbine"
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	force = 10
	one_hand_penalty = 5 //change later?
	accuracy = 1
	move_delay = 3 //it a pistol, but giga cool plasma
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	charge_cost = 600
	wielded_item_state = "pulse_carbine"
	sales_price = 300
	charge_meter = FALSE

/obj/item/gun/energy/pulse/plasma/pistol/glock
	name = "archeotech plasma pistol"
	desc = "An archeotech plasma pistol, despite it's incredible age it shows no signs of decay. It has an overheat scale and on the end of it is written 'Boom!'."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "glockl100"
	item_state = "pulse_pistol"
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	force = 10
	one_hand_penalty = 4 //change later?
	accuracy = 1
	move_delay = 2 //it a pistol, but giga cool plasma
	self_recharge = 9 // very good
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	projectile_type = /obj/item/projectile/energy/pulse/plasmapistol
	charge_cost = 650
	wielded_item_state = "pulse_pistol"
	sales_price = 300
	charge_meter = FALSE
*/

// tinkered lasguns

/*
/obj/item/gun/energy/las/lasgun/tinkered
	name = "Kantrael M36 'Veteran Configuration' Lasgun"
	desc = "The M36 Lasgun is of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its cheap price and reliability. This variant has been upgraded to consume less energy from the ammo cell."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 12
	one_hand_penalty = 1.5
	accuracy = 0.5
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 80
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lasgun-wielded"
	sales_price = 30

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2.5, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=80),
		list(mode_name="3-round bursts", burst=3, fire_delay=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0, charge_cost=80),
		list(mode_name="overcharge", burst=1, fire_delay=3.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=150),
		)

/obj/item/gun/energy/las/lasgun/lucius/tinkered
	name = "Lucius No.98 'Veteran Configuration' Lasgun"
	desc = "A Lucius-pattern lasgun No.98 operates in a higher than average 21 megathoule while using a standard Power cell, resulting in a more powerful shot than Kantrael and many other lasgun patterns but causing it to be more likely to overheat. This variant has a modified heatsink and crystal assembly, the frame has also been replaced with a light polymer."
	armor_penetration = 15
	force = 12
	one_hand_penalty = 1.8
	move_delay = 2.5
	fire_delay = 3.5
	charge_cost = 110
	sales_price = 35

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2.5, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=110),
		list(mode_name="3-round bursts", burst=3, fire_delay=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0, charge_cost=110),
		list(mode_name="overcharge", burst=1, fire_delay=3.5, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/lucius/overcharge, charge_cost=200),
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
	accuracy = 0
	move_delay = 2.5
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun
	charge_cost = 60
	cell_type = /obj/item/cell/lasgun
	ammoType = /obj/item/cell/lasgun
	wielded_item_state = "lascar-wielded"
	sales_price = 40

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=60),
		list(mode_name="3-round bursts", burst=3, fire_delay=4, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0, charge_cost=60),
		list(mode_name="overcharge",       burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=115),
		)

/obj/item/gun/energy/las/lasgun/rare
	name = "Masterwork Kantrael M36 Lasgun"
	desc = "The M36 Lasgun is of Cadian design, it is one of the most common and less unique Lasguns that can be found throughout the Imperial Arsenal due to its low cost and reliability. This variant has modified heatsink and rearranged crystal assembly."
	force = 15
	one_hand_penalty = 1.2
	charge_cost = 80
	fire_delay = 2.3
	move_delay = 2.5
	sales_price = 35

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=80),
		list(mode_name="3-round bursts", burst=3, fire_delay=4, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.1, 0.1), automatic = 0, charge_cost=80),
		list(mode_name="overcharge",       burst=1, fire_delay = 3, burst_accuracy=null, dispersion=null, automatic = 0, projectile_type=/obj/item/projectile/energy/las/lasgun/overcharge, charge_cost=150),
		)

*/
