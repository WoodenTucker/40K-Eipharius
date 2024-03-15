/obj/item/gun/energy/ionrifle
	name = "ion rifle"
	desc = "The NT Mk60 EW Halicon is a man portable anti-armor weapon designed to disable mechanical threats, produced by NT. Not the best of its type."
	icon_state = "ionrifle"
	item_state = "ionrifle"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2)
	w_class = ITEM_SIZE_HUGE
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	one_hand_penalty = 2
	charge_cost = 30
	max_shots = 10
	projectile_type = /obj/item/projectile/ion
	wielded_item_state = "ionrifle-wielded"
	combustion = 0

/obj/item/gun/energy/ionrifle/emp_act(severity)
	..(max(severity, 2)) //so it doesn't EMP itself, I guess

/obj/item/gun/energy/ionrifle/small
	name = "ion pistol"
	desc = "The NT Mk72 EW Preston is a personal defense weapon designed to disable mechanical threats."
	icon_state = "ionpistol"
	item_state = "ionpistol"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 2)
	w_class = ITEM_SIZE_NORMAL
	force = 5
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	one_hand_penalty = 0
	charge_cost = 20
	max_shots = 6
	projectile_type = /obj/item/projectile/ion/small

/obj/item/gun/energy/mindflayer
	name = "mind flayer"
	desc = "A custom-built weapon of some kind."
	icon_state = "xray"
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4)
	projectile_type = /obj/item/projectile/beam/mindflayer


/* Staves */

/obj/item/gun/energy/staff
	name = "staff of change"
	desc = "An artefact that spits bolts of coruscating energy which cause the target's very form to reshape itself."
	icon = 'icons/obj/weapons/melee/energy.dmi'
	item_icons = null
	icon_state = "staffofchange"
	item_state = "staffofchange"
	fire_sound = 'sound/weapons/emitter.ogg'
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	max_shots = 5
	projectile_type = /obj/item/projectile/change
	origin_tech = null
	self_recharge = 1
	charge_meter = 0

/obj/item/gun/energy/staff/special_check(var/mob/user)
	if((user.mind && !wizards.is_antagonist(user.mind)))
		to_chat(usr, "<span class='warning'>You focus your mind on \the [src], but nothing happens!</span>")
		return 0

	return ..()

/obj/item/gun/energy/staff/handle_click_empty(mob/user = null)
	if (user)
		user.visible_message("*fizzle*", "<span class='danger'>*fizzle*</span>")
	else
		src.visible_message("*fizzle*")
	playsound(src.loc, 'sound/effects/sparks1.ogg', 100, 1)

/obj/item/gun/energy/staff/animate
	name = "staff of animation"
	desc = "An artefact that spits bolts of life-force which causes objects which are hit by it to animate and come to life! This magic doesn't affect machines."
	projectile_type = /obj/item/projectile/animate
	max_shots = 10

obj/item/gun/energy/staff/focus
	name = "mental focus"
	desc = "An artefact that channels the will of the user into destructive bolts of force. If you aren't careful with it, you might poke someone's brain out."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "focus"
	item_state = "focus"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	projectile_type = /obj/item/projectile/forcebolt

	obj/item/gun/energy/staff/focus/attack_self(mob/living/user as mob)
		if(projectile_type == /obj/item/projectile/forcebolt)
			charge_cost = 400
			to_chat(user, "<span class='warning'>The [src.name] will now strike a small area.</span>")
			projectile_type = /obj/item/projectile/forcebolt/strong
		else
			charge_cost = 200
			to_chat(user, "<span class='warning'>The [src.name] will now strike only a single person.</span>")
			projectile_type = /obj/item/projectile/forcebolt



/obj/item/gun/energy/phosphor
	name = "Phosphor Blast Pistol"
	desc = "A rare and dangerous weapon, used by powerful Magi and Old Skitarii Alphas, this weapon is supposed to deliver the killing blow by burning it's target to death, however, despite it's ability to pass through heavy armor easily, it has a short range."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "teslar"
	item_state = "teslar"
	slot_flags = SLOT_BACK|SLOT_BELT
	force = 8
	str_requirement = 15 //kinda heavy due to it's giant cell.
	max_shots = 5 //not lore accurate, but this is better.
	w_class = ITEM_SIZE_NORMAL
	burst_delay = 2 //its a small as fuck pistol, it may be poisonous but its small.
	fire_delay = 8
	charge_cost = 300
	cell_type = /obj/item/cell/plasma
	ammoType = /obj/item/cell/plasma
	projectile_type = 	/obj/item/projectile/energy/phosphor
	self_recharge = 1


/obj/item/gun/energy/gaussflayer
	name = "Gauss Flayer"
	desc = "A deadly weapon wielded by Necron Warriors"
	icon_state = "gaussflayer"
	item_state = "gaussflayer"
	origin_tech = list(TECH_COMBAT = 9, TECH_MAGNET = 9)
	w_class = ITEM_SIZE_NORMAL
	fire_delay = 5 //Gotta balance the whole infinite ammo a little
	force = 2 //it has a giant spike on the end of it
	slot_flags = SLOT_BELT|SLOT_BACK
	str_requirement = 20
	one_hand_penalty = 0
	charge_cost = 20
	max_shots = 10
	projectile_type = /obj/item/projectile/gauss
	self_recharge = 1

/obj/item/gun/energy/gaussflayer/dropped()
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/gaussblaster
	name = "Gauss Blaster"
	desc = "A double barreled gauss weapon with green energy coursing through it."
	icon_state = "gaussblaster"
	item_state = "gaussblaster"
	origin_tech = list(TECH_COMBAT = 9, TECH_MAGNET = 9)
	w_class = ITEM_SIZE_NORMAL
	fire_delay = 20
	burst = 2
	burst_delay = 3
	force = 25 //Larger and it ALSO has a giant spike
	slot_flags = SLOT_BELT|SLOT_BACK
	str_requirement = 20 //random pilgrims will NOT be using this
	one_hand_penalty = 0
	charge_cost = 20
	max_shots = 6
	projectile_type = /obj/item/projectile/gauss
	self_recharge = 1

/obj/item/gun/energy/gaussblaster/dropped()
	..()
	spawn(1) if(src) qdel(src)

/obj/item/gun/energy/synapticdis
	name = "Synaptic Disintegrator"
	desc = "A long ranged rifle favored by Deathmark Assasains for its ability to disintigrate the synapses of brey"
	icon_state = "synapticdis"
	item_state = "synapticdis"
	origin_tech = list(TECH_COMBAT = 9, TECH_MAGNET = 9)
	w_class = ITEM_SIZE_NORMAL
	fire_delay = 80 //what the hell do you expect, its a 2 shot basically true damage sniper
	force = 2
	slot_flags = SLOT_BACK
	str_requirement = 20
	one_hand_penalty = 2
	scoped_accuracy = 50 //the proper scope for this is meant to offscreen some poor fuck from MILES away, they will NEED this
	charge_cost = 20
	max_shots = 4 //incase some janny wants to varedit the firing delay, they can see my nice animated empty sprite :))
	projectile_type = /obj/item/projectile/energy/synapticdis
	self_recharge = 1

/obj/item/gun/energy/synapticdis/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1
	toggle_scope(usr, 4)

/obj/item/gun/energy/WarpLens
	name = "Warp Lens"
	desc = "A lens used to direct bolts of warp energy"
	icon_state = "warplens"
	item_state = "focus"
	fire_sound = 'sound/weapons/emitter.ogg'
	w_class = ITEM_SIZE_TINY
	force = 1
	one_hand_penalty = 0 //its tiny you can hold it in one hand
	projectile_type = /obj/item/projectile/warpboltcrappy
	max_shots = 15
	self_recharge = 1

/obj/item/gun/energy/melta
	name = "melta"
	desc = "If you see this complain that staff used the wrong object"
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "prifle"
	item_state = "ionrifle"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_LARGE
	force = 15
	one_hand_penalty = 3 //heavy af fam
	accuracy = -0.5
	self_recharge = 1
	recharge_time = 14 // With a fire delay of 19. You fire every 2.3 seconds. 1 recharge time is 1 second. Keep recharges to 1/6 and a bit per shot. We want people to NEED to reload in combat. //dont want speedy bois
	fire_delay = 15
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/pulse/pulserifle
	cell_type = /obj/item/cell/melta
	ammoType = /obj/item/cell/melta
	charge_cost = 1800
	wielded_item_state = "ionrifle-wielded"
	var/plasma_overheat = 1 // Keeping track on how overheated the gun is
	var/plasma_overheat_decay = 2 // The cooling of the gun per tick
	var/plasma_overheat_max = 200 // When the gun exploads
	Fire(atom/target, mob/living/user)
		if(plasma_overheat >= 50)
			to_chat(user, "<span class='warning'><b><font size=3>THE BARREL STARTS TO GLOW.</font></b></span>")
		if(plasma_overheat >= 90)
			to_chat(user, "<span class='warning'><b><font size=3>OVERHEAT WARNING.</font></b></span>")
		if(plasma_overheat >= 150)
			to_chat(user, "<span class='warning'><b><font size=3>CATASTROPHIC FAILURE IMMINENT.</font></b></span>")
		..()
		plasma_overheat += 30 // adding 30 heat for every pulling of the trigger (learn not to spam the fucking gun)
	Process()
		..()
		if(plasma_overheat >= 0)
			plasma_overheat -= plasma_overheat_decay // so the gun actually cools down
		else
			plasma_overheat = 0 // keepin the gun overheat above -1
			return
		if(plasma_overheat > plasma_overheat_max)
			explosion(src.loc, -1, -1, 3, 3) // explodes u, dealing a lot of damage, still (a little) chance to survive


/obj/item/gun/energy/melta/handheld
	name = "Melta Gun"
	desc = "Is a powerful, short-ranged anti-armour weapon that produces an intense, energetic beam of heat in the tens of thousands of degrees Centigrade."
	icon_state = "meltagun"
	item_state = "multimelta"
	wielded_item_state = "multimelta"
	fire_sound = 'sound/weapons/guns/fire/melta.ogg'
	icon = 'icons/cadia-sprites/migrated2/gun_2.dmi'
	slot_flags = SLOT_BACK|SLOT_S_STORE
	force = 8
	str_requirement = 15
	max_shots = 5
	w_class = ITEM_SIZE_HUGE
	fire_delay = 16
	charge_cost = 2000
	cell_type = /obj/item/cell/melta
	ammoType = /obj/item/cell/melta
	projectile_type = /obj/item/projectile/energy/meltagun
	plasma_overheat = 1 // Keeping track on how overheated the gun is
	plasma_overheat_decay = 3 // The cooling of the gun per tick
	plasma_overheat_max = 220 // When the gun exploads

/obj/item/gun/energy/melta/handheld/New()
	..()
	slowdown_per_slot[slot_back] = 0.2
	slowdown_per_slot[slot_wear_suit] = 0.3
	slowdown_per_slot[slot_belt] = 0.3
	slowdown_per_slot[slot_r_hand] = 0.55
	slowdown_per_slot[slot_l_hand] = 0.55

/obj/item/gun/energy/melta/multimelta //Need to convert this melta and the other melta into projectile based, testing the new melta atm.
	name = "Multi-Melta"
	desc = "is a heavier version of the standard Imperial Meltagun thermal ray weapon that is composed of multiple Meltagun barrels."
	icon_state = "multimelta"
	item_state = "multimelta"
	wielded_item_state = "multimelta"
	fire_sound = 'sound/weapons/guns/fire/melta.ogg'
	icon = 'icons/cadia-sprites/migrated2/gun_2.dmi'
	slot_flags = SLOT_BACK|SLOT_S_STORE
	force = 8
	str_requirement = 18
	max_shots = 2
	w_class = ITEM_SIZE_HUGE
	fire_delay = 16
	charge_cost = 5000
	cell_type = /obj/item/cell/melta
	ammoType = /obj/item/cell/melta
	projectile_type = /obj/item/projectile/energy/meltagun
	plasma_overheat = 1 // Keeping track on how overheated the gun is
	plasma_overheat_decay = 3 // The cooling of the gun per tick
	plasma_overheat_max = 220 // When the gun exploads

/obj/item/gun/energy/melta/handheld/New()
	..()
	slowdown_per_slot[slot_back] = 0.2
	slowdown_per_slot[slot_wear_suit] = 0.3
	slowdown_per_slot[slot_belt] = 0.3
	slowdown_per_slot[slot_r_hand] = 0.55
	slowdown_per_slot[slot_l_hand] = 0.55


//TYRANID WEAPONS
//These are largely coded as energy guns, because they'll recharge on their own over time.

/obj/item/gun/energy/tyranid
	name = "Tyranid Projectile Biomorph"
	desc = "A basic template Biomorph. You shouldn't be seeing this."
	icon_state = "xenoheavyr" //Placeholder
	item_state = "xenoheavyr" //Placeholder
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	force = 15
	one_hand_penalty = 1.5
	fire_delay = 3.1
	accuracy = 1
	self_recharge = 1
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/bullet/tyranid
	charge_cost = 500
	cell_type = /obj/item/cell/tyranid
	ammoType = /obj/item/cell/tyranid
	wielded_item_state = "lascar-wielded"
	sales_price = null
	charge_meter = FALSE

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=3.1, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=0),
		list(mode_name="automatic",       burst=1, fire_delay=0.8, burst_accuracy=null, dispersion=null, automatic = 1, charge_cost=0),
		)

/obj/item/gun/energy/tyranid/fleshborer
	name = "Fleshborer Rifle"
	desc = "An organic weapon that fires Fleshborers, small creatures that dig into your enemies flesh."
	icon_state = "xenoheavyr" //Placeholder
	item_state = "xenoheavyr" //Placeholder
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	force = 15
	one_hand_penalty = 0
	fire_delay = 2
	accuracy = 0
	self_recharge = 1
	projectile_type = /obj/item/projectile/bullet/tyranid/fleshborer
	charge_cost = 100

/obj/item/gun/energy/tyranid/spike
	name = "Spike Rifle"
	desc = "An organic weapon that fires chitinous spines, which may be coated with various toxins."
	icon_state = "xenoheavyr" //Placeholder
	item_state = "xenoheavyr" //Placeholder
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	force = 15
	one_hand_penalty = 2
	fire_delay = 3
	accuracy = 2
	self_recharge = 1
	projectile_type = /obj/item/projectile/bullet/tyranid/spike
	charge_cost = 150

	firemodes = list(
		list(mode_name="Standard Spikes", fire_delay=2, projectile_type=/obj/item/projectile/bullet/tyranid/spike, charge_cost=150),
		list(mode_name="Hallucination Spikes", fire_delay = 2, projectile_type=/obj/item/projectile/bullet/tyranid/spike/hall, charge_cost=200),
		list(mode_name="Sleep Spikes", fire_delay = 2, projectile_type=/obj/item/projectile/bullet/tyranid/spike/sleepy, charge_cost=200),
		)

/obj/item/gun/energy/tyranid/venomcannon
	name = "Venom Cannon"
	desc = "An enormous rifle, firing spines coated with highly toxic tyranid venoms and bio-acids.."
	icon_state = "xenoheavyr" //Placeholder
	item_state = "xenoheavyr" //Placeholder
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	force = 15
	one_hand_penalty = 3
	fire_delay = 4
	accuracy = 1
	self_recharge = 1
	cell_type = /obj/item/cell/tyranid/large
	ammoType = /obj/item/cell/tyranid/large
	projectile_type = /obj/item/projectile/bullet/tyranid/venomcannon
	charge_cost = 300
