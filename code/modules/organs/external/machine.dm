/obj/item/organ/internal/cell
	name = "microbattery"
	desc = "A small, powerful cell for use in fully prosthetic bodies."
	icon_state = "cell"
	dead_icon = "cell_bork"
	organ_tag = BP_CELL
	parent_organ = BP_CHEST
	vital = 1
	var/open
	var/obj/item/cell/cell = /obj/item/cell/hyper
	//at 0.8 completely depleted after 60ish minutes of constant walking or 130 minutes of standing still
	var/servo_cost = 0.8


/obj/item/organ/internal/cell/New()
	robotize()
	if(ispath(cell))
		cell = new cell(src)
	..()

/obj/item/organ/internal/cell/proc/percent()
	if(!cell)
		return 0
	return get_charge()/cell.maxcharge * 100

/obj/item/organ/internal/cell/proc/get_charge()
	if(!cell)
		return 0
	if(status & ORGAN_DEAD)
		return 0
	return round(cell.charge*(1 - damage/max_damage))

/obj/item/organ/internal/cell/proc/check_charge(var/amount)
	return get_charge() >= amount

/obj/item/organ/internal/cell/proc/use(var/amount)
	if(check_charge(amount))
		cell.use(amount)
		return 1

/obj/item/organ/internal/cell/Process()
	..()
	if(!owner)
		return
	if(owner.stat == DEAD)	//not a drain anymore
		return
	if(!is_usable())
		owner.Paralyse(3)
		return
	var/standing = !owner.lying && !owner.buckled //on the edge
	var/drop
	if(!check_charge(servo_cost)) //standing is pain
		drop = 1
	else if(standing)
		use(servo_cost)
		if(world.time - owner.l_move_time < 15) //so is
			if(!use(servo_cost))
				drop = 1
	if(drop)
		if(standing)
			to_chat(owner, "<span class='warning'>You don't have enough energy to stand!</span>")
		owner.Weaken(2)

/obj/item/organ/internal/cell/emp_act(severity)
	..()
	if(cell)
		cell.emp_act(severity)

/obj/item/organ/internal/cell/attackby(obj/item/W, mob/user)
	if(isScrewdriver(W))
		if(open)
			open = 0
			to_chat(user, "<span class='notice'>You screw the battery panel in place.</span>")
		else
			open = 1
			to_chat(user, "<span class='notice'>You unscrew the battery panel.</span>")

	if(isCrowbar(W))
		if(open)
			if(cell)
				user.put_in_hands(cell)
				to_chat(user, "<span class='notice'>You remove \the [cell] from \the [src].</span>")
				cell = null

	if (istype(W, /obj/item/cell))
		if(open)
			if(cell)
				to_chat(user, "<span class ='warning'>There is a power cell already installed.</span>")
			else
				user.drop_from_inventory(W,src)
				cell = W
				to_chat(user, "<span class = 'notice'>You insert \the [cell].</span>")

/obj/item/organ/internal/cell/replaced()
	..()
	// This is very ghetto way of rebooting an IPC. TODO better way.
	if(owner && owner.stat == DEAD)
		owner.set_stat(CONSCIOUS)
		owner.visible_message("<span class='danger'>\The [owner] twitches visibly!</span>")

/obj/item/organ/internal/cell/listen()
	if(get_charge())
		return "faint hum of the power bank"

// Used for an MMI or posibrain being installed into a human.
/obj/item/organ/internal/mmi_holder
	name = "brain interface"
	icon_state = "brain-prosthetic"
	organ_tag = BP_BRAIN
	parent_organ = BP_HEAD
	vital = 1
	var/obj/item/device/mmi/stored_mmi
	var/datum/mind/persistantMind //Mind that the organ will hold on to after being removed, used for transfer_and_delete
	var/ownerckey // used in the event the owner is out of body

/obj/item/organ/internal/mmi_holder/Destroy()
	stored_mmi = null
	return ..()

/obj/item/organ/internal/mmi_holder/New(var/mob/living/carbon/human/new_owner, var/internal)
	..(new_owner, internal)
	if(!stored_mmi)
		stored_mmi = new(src)
	sleep(-1)
	update_from_mmi()
	persistantMind = owner.mind
	ownerckey = owner.ckey

/obj/item/organ/internal/mmi_holder/proc/update_from_mmi()

	if(!stored_mmi.brainmob)
		stored_mmi.brainmob = new(stored_mmi)
		stored_mmi.brainobj = new(stored_mmi)
		stored_mmi.brainmob.container = stored_mmi
		stored_mmi.brainmob.real_name = owner.real_name
		stored_mmi.brainmob.SetName(stored_mmi.brainmob.real_name)
		stored_mmi.SetName("[initial(stored_mmi.name)] ([owner.real_name])")

	if(!owner) return

	name = stored_mmi.name
	desc = stored_mmi.desc
	icon = stored_mmi.icon

	stored_mmi.icon_state = "mmi_full"
	icon_state = stored_mmi.icon_state

	if(owner && owner.stat == DEAD)
		owner.set_stat(CONSCIOUS)
		owner.switch_from_dead_to_living_mob_list()
		owner.visible_message("<span class='danger'>\The [owner] twitches visibly!</span>")

/obj/item/organ/internal/mmi_holder/cut_away(var/mob/living/user)
	var/obj/item/organ/external/parent = owner.get_organ(parent_organ)
	if(istype(parent))
		removed(user, 0)
		parent.implants += transfer_and_delete()

/obj/item/organ/internal/mmi_holder/removed()
	if(owner && owner.mind)
		persistantMind = owner.mind
		if(owner.ckey)
			ownerckey = owner.ckey
	..()

/obj/item/organ/internal/mmi_holder/proc/transfer_and_delete()
	if(stored_mmi)
		. = stored_mmi
		stored_mmi.forceMove(src.loc)
		if(persistantMind)
			persistantMind.transfer_to(stored_mmi.brainmob)
		else
			var/response = input(find_dead_player(ownerckey, 1), "Your [initial(stored_mmi.name)] has been removed from your body. Do you wish to return to life?", "Robotic Rebirth") as anything in list("Yes", "No")
			if(response == "Yes")
				persistantMind.transfer_to(stored_mmi.brainmob)
	qdel(src)


/obj/item/organ/external/robotic
	organ_tag = null
	name = "Robotic"
	brute_mod = 0.7                  // Multiplier for incoming brute damage. //Made of metal, they're harder to damage.
	burn_mod = 0.2                   // As above for burn. //Mechanical limbs* can* be burned, but they're far more resistant.
	var/toxins_mod = 0
	icon_name = null
	icon = 'icons/mob/human_races/cyberlimbs/nanotrasen/nanotrasen_main.dmi'
	max_damage = 60
	min_broken_damage = 45
	w_class = ITEM_SIZE_HUGE
	body_part = null
	parent_organ = null
	joint = null
	amputation_point = null
	can_grasp = 0
	pain = 0
	has_tendon = FALSE
	tendon_name = null
	artery_name = null
	arterial_bleed_severity = null
	gibbable = FALSE
	robotic = ORGAN_ROBOT
	var/can_toggle = 1
	var/is_toggled = 1
	
/obj/item/organ/external/robotic/arm
	organ_tag = BP_L_ARM
	name = "Augmetic left arm"
	icon_name = "l_arm"
	max_damage = 60
	min_broken_damage = 50
	w_class = ITEM_SIZE_NORMAL
	body_part = ARM_LEFT
	parent_organ = BP_CHEST
	joint = "left elbow"
	amputation_point = "left shoulder"
	can_grasp = 1

/obj/item/organ/external/robotic/arm/right
	organ_tag = BP_R_ARM
	name = "Augmetic right arm"
	icon_name = "r_arm"
	body_part = ARM_RIGHT
	joint = "right elbow"
	amputation_point = "right shoulder"

/obj/item/organ/external/robotic/leg
	organ_tag = BP_L_LEG
	name = "Augmetic left leg"
	icon_name = "l_leg"
	max_damage = 80
	min_broken_damage = 70
	w_class = ITEM_SIZE_NORMAL
	body_part = LEG_LEFT
	icon_position = LEFT
	parent_organ = BP_GROIN
	joint = "left knee"
	amputation_point = "left hip"
	can_stand = 1

/obj/item/organ/external/robotic/leg/right
	organ_tag = BP_R_LEG
	name = "Augmetic right leg"
	icon_name = "r_leg"
	body_part = LEG_RIGHT
	icon_position = RIGHT
	joint = "right knee"
	amputation_point = "right hip"

/obj/item/organ/external/robotic/foot
	organ_tag = BP_L_FOOT
	name = "Augmetic left foot"
	icon_name = "l_foot"
	max_damage = 70
	min_broken_damage = 60
	w_class = ITEM_SIZE_SMALL
	body_part = FOOT_LEFT
	icon_position = LEFT
	parent_organ = BP_L_LEG
	joint = "left ankle"
	amputation_point = "left ankle"
	can_stand = 1

/obj/item/organ/external/robotic/foot/right
	organ_tag = BP_R_FOOT
	name = "Augmetic right foot"
	icon_name = "r_foot"
	body_part = FOOT_RIGHT
	icon_position = RIGHT
	parent_organ = BP_R_LEG
	joint = "right ankle"
	amputation_point = "right ankle"

/obj/item/organ/external/robotic/hand
	organ_tag = BP_L_HAND
	name = "Augmetic left hand"
	icon_name = "l_hand"
	max_damage = 80
	min_broken_damage = 70
	w_class = ITEM_SIZE_SMALL
	body_part = HAND_LEFT
	parent_organ = BP_L_ARM
	joint = "left wrist"
	amputation_point = "left wrist"
	can_grasp = 1

/obj/item/organ/external/robotic/hand/right
	organ_tag = BP_R_HAND
	name = "Augmetic right hand"
	icon_name = "r_hand"
	body_part = HAND_RIGHT
	parent_organ = BP_R_ARM
	joint = "right wrist"
	amputation_point = "right wrist"

/obj/item/organ/external/robotic/hand/advanced
	name = "Advanced augmetic left hand"
	icon_name = "l_hand"
	max_damage = 120
	min_broken_damage = 110

/obj/item/organ/external/robotic/hand/advanced/verb/toggle_las_light()
	set name =  "Deploy Las-Striker"
	set category = "Augmetics"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This weapon cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/gun/energy/augmetic/las/light))
			visible_message("<span class='warning'> [usr] quickly retracts the las-striker.</span>", "<span class='notice'>You put away the las-striker!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
	if(istype(usr.r_hand, /obj/item/gun/energy/augmetic/las/light))
		qdel(usr.r_hand)
		visible_message("<span class='warning'>  [usr] quickly retracts the las-striker.</span>", "<span class='notice'>You put away the las-striker!</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the las-striker.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the las-striker.")
		usr.put_in_hands(new /obj/item/gun/energy/augmetic/las/light(usr))
		src.is_toggled = 2

/obj/item/organ/external/robotic/hand/advanced/right
	organ_tag = BP_R_HAND
	name = "Advanced augmetic right hand"
	icon_name = "r_hand"
	body_part = HAND_RIGHT
	parent_organ = BP_R_ARM
	joint = "right wrist"
	amputation_point = "right wrist"
	
/obj/item/organ/external/robotic/arm/advanced
	organ_tag = BP_L_ARM
	name = "Advanced augmetic left arm"
	icon_name = "l_arm"
	max_damage = 200
	min_broken_damage = 150
	w_class = ITEM_SIZE_NORMAL
	body_part = ARM_LEFT
	parent_organ = BP_CHEST
	joint = "left elbow"
	amputation_point = "left shoulder"
	can_grasp = 1

/obj/item/organ/external/robotic/arm/advanced/verb/toggle_las_medium()
	set name =  "Deploy Heavy Las-Striker"
	set category = "Augmetics"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This weapon cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/gun/energy/augmetic/las/medium))
			visible_message("<span class='warning'> [usr] quickly retracts the heavy las-striker.</span>", "<span class='notice'>You put away the heavy las-striker!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
	if(istype(usr.r_hand, /obj/item/gun/energy/augmetic/las/medium))
		qdel(usr.r_hand)
		visible_message("<span class='warning'>  [usr] quickly retracts the heavy las-striker.</span>", "<span class='notice'>You put away the heavy las-striker!</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the heavy las-striker.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the heavy las-striker.")
		usr.put_in_hands(new /obj/item/gun/energy/augmetic/las/medium(usr))
		src.is_toggled = 2
	
/obj/item/organ/external/robotic/arm/advanced/right
	organ_tag = BP_R_ARM
	name = "Advanced augmetic right arm"
	icon_name = "r_arm"
	body_part = ARM_RIGHT
	joint = "right elbow"
	amputation_point = "right shoulder"

/obj/item/organ/external/robotic/hand/experimental
	name = "Experimental augmetic left hand"
	icon_name = "l_hand"
	max_damage = 180
	min_broken_damage = 160

/obj/item/organ/external/robotic/hand/experimental/verb/toggle_plasma_light()
	set name =  "Deploy Augmetic Plasma Pistol"
	set category = "Augmetics"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This weapon cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/gun/energy/augmetic/plasma/light))
			visible_message("<span class='warning'> [usr] quickly retracts the plasma pistol.</span>", "<span class='notice'>You put away the plasma pistol!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
	if(istype(usr.r_hand, /obj/item/gun/energy/augmetic/plasma/light))
		qdel(usr.r_hand)
		visible_message("<span class='warning'>  [usr] quickly retracts the plasma pistol.</span>", "<span class='notice'>You put away the plasma pistol!</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the plasma pistol.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the plasma pistol.")
		usr.put_in_hands(new /obj/item/gun/energy/augmetic/plasma/light(usr))
		src.is_toggled = 2

obj/item/organ/external/robotic/hand/experimental/right
	organ_tag = BP_R_HAND
	name = "Experimental augmetic right hand"
	icon_name = "r_hand"
	body_part = HAND_RIGHT
	parent_organ = BP_R_ARM
	joint = "right wrist"
	amputation_point = "right wrist"

/obj/item/organ/external/robotic/arm/experimental
	organ_tag = BP_L_ARM
	name = "Experimental augmetic left arm"
	icon_name = "l_arm"
	max_damage = 220
	min_broken_damage = 160
	w_class = ITEM_SIZE_NORMAL
	body_part = ARM_LEFT
	parent_organ = BP_CHEST
	joint = "left elbow"
	amputation_point = "left shoulder"
	can_grasp = 1

/obj/item/organ/external/robotic/arm/experimental/verb/toggle_plasma_medium()
	set name =  "Deploy Augmetic Plasma Rifle"
	set category = "Augmetics"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This weapon cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/gun/energy/augmetic/plasma/medium))
			visible_message("<span class='warning'> [usr] quickly retracts the plasma rifle.</span>", "<span class='notice'>You put away the plasma rifle!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
	if(istype(usr.r_hand, /obj/item/gun/energy/augmetic/plasma/medium))
		qdel(usr.r_hand)
		visible_message("<span class='warning'>  [usr] quickly retracts the plasma rifle.</span>", "<span class='notice'>You put away the plasma rifle!</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the plasma rifle.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the plasma rifle.")
		usr.put_in_hands(new /obj/item/gun/energy/augmetic/plasma/medium(usr))
		src.is_toggled = 2

/obj/item/organ/external/robotic/arm/experimental/right
	organ_tag = BP_R_ARM
	name = "Experimental right arm"
	icon_name = "r_arm"
	body_part = ARM_RIGHT
	joint = "right elbow"
	amputation_point = "right shoulder"

/obj/item/organ/external/robotic/arm/seolite
	organ_tag = BP_L_ARM
	name = "A strangely formed left arm"
	icon_name = "l_arm"
	max_damage = 220
	min_broken_damage = 160
	w_class = ITEM_SIZE_NORMAL
	body_part = ARM_LEFT
	parent_organ = BP_CHEST
	joint = "left elbow"
	amputation_point = "left shoulder"
	can_grasp = 1

/obj/item/organ/external/robotic/arm/seolite/verb/toggle_seolite_toxin()
	set name =  "Deploy Seolite Toxin Beamer"
	set category = "Augmetics"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This weapon cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/gun/energy/augmetic/seolite/neurotoxin))
			visible_message("<span class='warning'> [usr] quickly retracts the strange weapon.</span>", "<span class='notice'>You put away the strange weapon!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
	if(istype(usr.r_hand, /obj/item/gun/energy/augmetic/seolite/neurotoxin))
		qdel(usr.r_hand)
		visible_message("<span class='warning'>  [usr] quickly retracts the strange weapon.</span>", "<span class='notice'>You put away the strange weapon!</span>", "<span class='warning>What was that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You put away the seolite toxin beamer.")
		src.is_toggled = 1
	else
		to_chat(usr,"You pull out the strange weapon.")
		usr.put_in_hands(new /obj/item/gun/energy/augmetic/seolite/neurotoxin(usr))
		src.is_toggled = 2
	
/obj/item/organ/external/robotic/arm/seolite/right
	organ_tag = BP_R_ARM
	name = "A strangely formed right arm"
	icon_name = "r_arm"
	body_part = ARM_RIGHT
	joint = "right elbow"
	amputation_point = "right shoulder"

/obj/item/organ/external/robotic/servitor
	organ_tag = null
	name = "Robotic"
	brute_mod = 0.5                  // Multiplier for incoming brute damage. //Made of metal, they're harder to damage.
	burn_mod = 0.1                   // As above for burn. //Mechanical limbs* can* be burned, but they're far more resistant. //These limbs are stronger, but geenrally have downsides.
	var/toxins_mod = 0
	icon_name = null
	icon = 'icons/mob/human_races/cyberlimbs/nanotrasen/nanotrasen_main.dmi'
	max_damage = 80
	min_broken_damage = 55
	w_class = ITEM_SIZE_HUGE
	body_part = null
	parent_organ = null
	joint = null
	amputation_point = null
	can_grasp = 0
	pain = 0
	has_tendon = FALSE
	tendon_name = null
	artery_name = null
	arterial_bleed_severity = null
	gibbable = FALSE
	robotic = ORGAN_ROBOT
	var/can_toggle = 1
	var/is_toggled = 1

/obj/item/organ/external/robotic/servitor/arm
	organ_tag = BP_L_ARM
	name = "Servitor Left Arm
	icon_name = "l_arm"
	max_damage = 120
	min_broken_damage = 100
	w_class = ITEM_SIZE_NORMAL
	body_part = ARM_LEFT
	parent_organ = BP_CHEST
	joint = "left elbow"
	amputation_point = "left shoulder"
	can_grasp = 1
