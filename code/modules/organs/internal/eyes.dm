
/obj/item/organ/internal/eyes
	name = "eyeballs"
	icon_state = "eyes"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	var/phoron_guard = 0
	var/list/eye_colour = list(0,0,0)
	var/innate_flash_protection = FLASH_PROTECTION_NONE
	max_damage = 45
	sales_price = 15

/obj/item/organ/internal/eyes/optics
	robotic = ORGAN_ROBOT
	organ_tag = BP_OPTICS

/obj/item/organ/internal/eyes/optics/New()
	..()
	robotize()

/obj/item/organ/internal/eyes/robotize()
	..()
	name = "optical sensor"
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "camera"
	dead_icon = "camera_broken"
	update_colour()

/obj/item/organ/internal/eyes/robot
	name = "optical sensor"

/obj/item/organ/internal/eyes/robot/New()
	..()
	robotize()

/obj/item/organ/internal/eyes/replaced(var/mob/living/carbon/human/target)

	// Apply our eye colour to the target.
	if(istype(target) && eye_colour)
		target.r_eyes = eye_colour[1]
		target.g_eyes = eye_colour[2]
		target.b_eyes = eye_colour[3]
		target.update_eyes()
	..()

/obj/item/organ/internal/eyes/proc/update_colour()
	if(!owner)
		return
	eye_colour = list(
		owner.r_eyes ? owner.r_eyes : 0,
		owner.g_eyes ? owner.g_eyes : 0,
		owner.b_eyes ? owner.b_eyes : 0
		)

/obj/item/organ/internal/eyes/take_damage(amount, var/silent=0)
	var/oldbroken = is_broken()
	. = ..()
	if(is_broken() && !oldbroken && owner && !owner.stat)
		to_chat(owner, "<span class='danger'>You go blind!</span>")

/obj/item/organ/internal/eyes/Process() //Eye damage replaces the old eye_stat var.
	..()
	if(!owner)
		return
	if(is_bruised())
		owner.eye_blurry = 20
	if(is_broken())
		owner.eye_blind = 20

/obj/item/organ/internal/eyes/proc/get_total_protection(var/flash_protection = FLASH_PROTECTION_NONE)
	return (flash_protection + innate_flash_protection)

/obj/item/organ/internal/eyes/proc/additional_flash_effects(var/intensity)
	return -1





/obj/item/organ/internal/eyes/augmetic
	name = "Augmetic eyeballs"
	icon_state = "eyes-prosthetic"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	phoron_guard = 0
	list/eye_colour = list(0,0,0)
	innate_flash_protection = FLASH_PROTECTION_NONE
	max_damage = 45
	sales_price = 20
	robotic = ORGAN_ROBOT
	var/can_toggle = 1
	var/is_toggled = 1
	var/obj/screen/overlay = null
	var/obj/item/organ/internal/eyes/augmetichud = null
	var/hud
	var/list/icon/current = list() //the current hud icons
	var/vision_flags = null
	var/see_invisible = null
	var/darkness_view = 7
/*	var/hud_holder

/obj/item/organ/internal/eyes/augmetic/New()
	..()
	if(ispath(hud))
		hud = new hud(src)

/obj/item/organ/internal/eyes/augmetic/proc/process_hud(var/mob/M)
	if(hud)
		hud.process_hud(M)

/obj/item/organ/internal/eyes/augmetic/process_hud(var/mob/M)
	return*/

/obj/item/organ/internal/eyes/augmetic/advanced
	name = "Advanced augmetic eyeballs"
	icon_state = "eyes-prosthetic-advanced"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	phoron_guard = 0
	list/eye_colour = list(0,0,0)
	innate_flash_protection = FLASH_PROTECTION_MODERATE
	max_damage = 80
	sales_price = 45
	vision_flags = SEE_MOBS

/*/obj/item/organ/internal/eyes/augmetic/advanced/New()
	..()
	overlay = GLOB.global_hud.thermal*/




/obj/item/organ/internal/eyes/augmetic/advanced/upgraded
	name = "Upgraded advanced augmetic eyeballs"
	icon_state = "eyes-prosthetic-advanced"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	phoron_guard = 0
	list/eye_colour = list(0,0,0)
	innate_flash_protection = FLASH_PROTECTION_MAJOR
	max_damage = 80
	sales_price = 90
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS
	darkness_view = 20
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/*/obj/item/organ/internal/eyes/augmetic/advanced/upgraded/process_hud(var/mob/M)
	process_med_hud(M, 1)*/

/obj/item/organ/internal/eyes/augmetic/experimental
	name = "Experimental augmetic eyeballs"
	icon_state = "eyes-prosthetic-experimental"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	phoron_guard = 0
	list/eye_colour = list(0,0,0)
	innate_flash_protection = FLASH_PROTECTION_MAJOR
	max_damage = 80
	sales_price = 90
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS
	darkness_view = 20
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/organ/internal/eyes/augmetic/experimental/verb/toggle_las_heavy()
	set name =  "Activate Augmetic Laser Eye"
	set category = "Augmetics"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This weapon cannot be toggled!")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/gun/energy/augmetic/las/heavy))
			visible_message("<span class='warning'> [usr]'s eyes return to normal.</span>", "<span class='notice'>You power down your laser eye!</span>", "<span class='warning>What's that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
	if(istype(usr.r_hand, /obj/item/gun/energy/augmetic/las/heavy))
		qdel(usr.r_hand)
		visible_message("<span class='warning'>  [usr]'s eyes return to normal.</span>", "<span class='notice'>You power down your laser eye!</span>", "<span class='warning>What's that sound?</span>")
		src.icon_state = initial(icon_state)
		to_chat(usr,"You power down your laser eye.")
		src.is_toggled = 1
	else
		to_chat(usr,"You charge your laser eye.")
		usr.put_in_hands(new /obj/item/gun/energy/augmetic/las/heavy(usr))

/obj/item/organ/internal/eyes/bioprinted

/obj/item/organ/internal/eyes/astartes
	name = "occulobes"
	icon_state = "eyes"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	innate_flash_protection = FLASH_PROTECTION_MAJOR
	max_damage = 65
	sales_price = 15
	//darkness_view = 20
	//see_invisible = SEE_INVISIBLE_NOLIGHTING

